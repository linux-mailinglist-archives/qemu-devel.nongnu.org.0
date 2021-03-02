Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3B329B42
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:05:01 +0100 (CET)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2po-0002W0-L3
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH2os-000265-Bp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:04:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH2op-0005tS-Rf
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614683037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ4vAht9xdelGTnGBuzHD1RDuEiDjbacORoCL69wRYQ=;
 b=YPUNELX8kCzTAusot8xKsyAEmgBYXIA51iYSdPZHc5JlfP4HfszcYvPCJD/v2CexGjBw6S
 ukeVpPYl3wfk7FFd2h/CA6uZusEx4zIh7kIA/uxzfPVgnllBIUBX7kkakuTn4ym+rdLOq5
 iUTsDvK+UJIiYe6Jq4g1yYxYCLIfFDM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-yUbvSbaBN8ez4M5EVovquQ-1; Tue, 02 Mar 2021 06:03:55 -0500
X-MC-Unique: yUbvSbaBN8ez4M5EVovquQ-1
Received: by mail-ej1-f70.google.com with SMTP id r26so2756601eja.22
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQ4vAht9xdelGTnGBuzHD1RDuEiDjbacORoCL69wRYQ=;
 b=Xoo+rWGQMUSAP2Em4avHtPmENHkIOFqGTpfM1fVOTzzTGmBiEreM6VQcl6zv6XNUt6
 XHFjBH8XbdR9XyBn0Z61bumprVBH9cbq+pfkjqZB5rRd+P4V7xIWhc9TvNxHjZDOLgm9
 91pCUy7NTnvZYV87zZQku4BhkDvLPTUfCx1KMe59nkzFjRQ2FmqAgkbhuHHuRADq/ctY
 oFo03f7QBOGjsh+KpKH54+LMFPFFeDfZJ+m1xDhTftRP05Nnc3gyrP6EWaTHBh27VODr
 UtHsixtHS2ONrG8S42Bvr6eCKv7YOElkad48rzBp8CGOxb+NpzX7w0fEafk7hjPySUm/
 SmFw==
X-Gm-Message-State: AOAM5331IbnB2PJup9n5bOO35eVhuYKQHGvjZqU/sHfRIfybrf+tSmEx
 6moj9fbqUjv95yNCRUT9TGr4/vNAhP0DJs3jxtdXPsHwxIHkh385tEeQrdpFwoXORDJKzzxSc62
 jjnlC5lACSGuGfDE=
X-Received: by 2002:a17:907:76b6:: with SMTP id
 jw22mr10033696ejc.11.1614683033726; 
 Tue, 02 Mar 2021 03:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYCLK1olc/1H58DFjU5qZXYZUDtn6lo2SE8L+MPjkG9V1g7RpIHS8xmtuZjuuAu5kQI0jTWg==
X-Received: by 2002:a17:907:76b6:: with SMTP id
 jw22mr10033676ejc.11.1614683033569; 
 Tue, 02 Mar 2021 03:03:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u14sm16816507ejx.60.2021.03.02.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 03:03:53 -0800 (PST)
Subject: Re: [PATCH v2 0/1] vl.c: fix trace backend init ordering
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210105181437.538366-1-danielhb413@gmail.com>
 <635eb0bb-f5fc-d3a0-924d-dd417d16cd45@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <caa67187-d9c2-bfec-b9f2-4c0240f1f18b@redhat.com>
Date: Tue, 2 Mar 2021 12:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <635eb0bb-f5fc-d3a0-924d-dd417d16cd45@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 11:51, Daniel Henrique Barboza wrote:
> Ping
> 
> There is at least one user in the Libvirt ML experiencing the same problem
> this patch is fixing, using QEMU upstream compiling with the trace backend,
> and it seems like the daemonization is still not working.
> 
> 
> Thanks,
> 
> DHB
> 
> On 1/5/21 3:14 PM, Daniel Henrique Barboza wrote:
>> changes from v2:
>> - fixed a typo in the comment block
>> - added Paolo's R-b
>>
>>
>> Daniel Henrique Barboza (1):
>>    vl.c: do not execute trace_init_backends() before daemonizing
>>
>>   softmmu/vl.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
> 

Sorry, I was expecting Stefan to apply this patch.  I have now queued it.

Paolo


