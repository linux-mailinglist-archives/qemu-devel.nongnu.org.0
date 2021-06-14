Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143003A6E3B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:30:56 +0200 (CEST)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrMM-0004CK-HG
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lsrKu-0003XT-H9
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lsrKr-0007uL-Ky
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623695359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvrpHz5YRFk/y+ejyGCDRjjTBvgApGCwEkzoHTdFmKI=;
 b=FwBewZbzIdyVadetb23SOoyLI3QYWHZBxI8vbgwPwIcx3iRU4LH2h4wCp6HEBcFUwWwAAa
 wIXydddQr88BUwcVdVcULNiOF6iDq/6soljssHbf2RXtJRQby4QlYYmREyuROXowHQiElO
 0zbOLb2XkXEdIOv5SJ+dH7wA3ub2FVU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--Tf8y5M-Nk-A5vgX8TMGCg-1; Mon, 14 Jun 2021 14:29:16 -0400
X-MC-Unique: -Tf8y5M-Nk-A5vgX8TMGCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 s25-20020aa7c5590000b0290392e051b029so15746914edr.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xvrpHz5YRFk/y+ejyGCDRjjTBvgApGCwEkzoHTdFmKI=;
 b=Vv2CRNJxqW4Kwa+ueS9MkPOffs7ABS9D7tiDhC8aMH/pWZegalLdToqclRB2P0gbFa
 lMkwtdsF9InmUaGWEThsFHrXGhpiET0LOHOGmcocuYAupAARITnmBWvh1x5Xus5yjesD
 0kRdSTKcKbxvjTGRFWAcoFIpMAlOANKuen5SNNlNOVqgadiTezAL3aTJquANkiltWCBo
 BHB32lzdZuXkqKhV1rrqJtHf/1prOfZAvf1bNzG70s4UOpfePEWVLmCYbSAoLrwFCWuc
 mMec62m4k6LZt2UiNUY7GbznfYPGsMXeK3o8jVm+xI4k0VMMOUjbRWaF5reF/biuSKqI
 k0CQ==
X-Gm-Message-State: AOAM533T8wDvrHIJ8ACXknHcGot3xwaLYdNqZ6eJFs+6aM5O8tVdm+4o
 YL5cX6Xg02rKl9GH/nPDXtHxKtFBuN6kz0gnS8co+5SoGejczqwBCprLjFFJxw5QBaOwLmNBgTi
 XN1H8oJTUQaL2ZOaa+LaEKsVd02idJr9ike/iZI3xKfsr4GJIuTYDgN63LP5Ivnz/cIo=
X-Received: by 2002:a05:6402:3123:: with SMTP id
 dd3mr18515812edb.113.1623695355170; 
 Mon, 14 Jun 2021 11:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV+WsQUcfKNWOxyouDfdJbz2cpH4bLZewfNPEr8pydNgDl1yoGk/nzfIwfWCuzlmhj+chrJA==
X-Received: by 2002:a05:6402:3123:: with SMTP id
 dd3mr18515220edb.113.1623695346344; 
 Mon, 14 Jun 2021 11:29:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cd4sm7895280ejb.104.2021.06.14.11.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:29:05 -0700 (PDT)
Subject: Re: [Qemu-devel] GSoC Introduction
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <CANX1H+037CdUQmeKJtzRW+6=9KpCpfbfDHV9Dna2Hq1hbbAa9A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <76a230ef-dc8f-5eaa-cf1f-138b7fbec818@redhat.com>
Date: Mon, 14 Jun 2021 20:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANX1H+037CdUQmeKJtzRW+6=9KpCpfbfDHV9Dna2Hq1hbbAa9A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/06/21 14:44, Lara Lazier wrote:
> Hi everyone!
> 
> My name is Lara, and I am one of this year's GSoC students. I am 
> studying computer science in Zürich, and I will start my master's in 
> September. For my GSoC project, I am working with Paolo Bonzini on 
> fixing and extending the SVM implementation in QEMU.
> 
> I am very excited to learn many new things this summer and to get to 
> know this community.

Welcome!

Paolo


