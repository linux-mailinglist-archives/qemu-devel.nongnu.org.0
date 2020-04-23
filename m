Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC81B5820
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 11:27:31 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRY8o-0002Yy-7b
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 05:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jRY7y-00022Y-Fj
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:26:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jRY7m-0003az-NV
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:26:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34302
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jRY7m-0003aF-6t
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587633984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ougS/yWe/G0jUk64F+BPIGoXT5+EKDs7H3NvMYHeCXU=;
 b=auUo0PnnBnN/Ci9eSRZGdoNGSMUZXX9QqfIqlNq4OcGhNt9Nt1yIRGjGP7XvtTi3+1XxsG
 jKD4EuE6NjbBaH/bZR9NcjmqZKDjO5ZdoJ2IvF0hVeiwdIH8VwourovTyXn0s8Pf+Nlf35
 SvgyukYtYofw2rFx8notTfXLGnorVsY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-9UjV1YFIN2if1QQGhWtbDA-1; Thu, 23 Apr 2020 05:26:22 -0400
X-MC-Unique: 9UjV1YFIN2if1QQGhWtbDA-1
Received: by mail-wr1-f71.google.com with SMTP id r11so2550470wrx.21
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 02:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bwuUXQ9O1nvrsWHoZ9Yl3MBHWzCV6M0B9ED8LsIUTZo=;
 b=krzHWKcXL26RTf2YJTWKL742VYTXwPsjztXHC8ouKm1qT88NbN7lyauGSLhq92BqDF
 /OEYtShSjQoBXie0jA43ff/ptbgcg4zd5pFUILEyoS+fPnMcgkt5Xi/uiVz+iQKPTq6o
 kKx9rgsu0qWt90v0H8aEqnG45V8wuA56xn71vr2p2chZsTaXpBQu1jzydmbnlT85X9aR
 R8pLJjjfDl3FkcnlE4Huz2VkCYP69nJdzqJzRu6pYlzowhtlzhKJeTIckfGjAmc/H5Kh
 RB/aO2PanXoBH+wrJ6PGN5a+IGR3Q8ozS12CuGrYhIuB68+WCqJFSPA7sWtDzwVC0YE1
 3SsA==
X-Gm-Message-State: AGi0PuZCEF/3WgheXEQZvXyHdqdyvd9CIDwraX3msmQF19nCQ3Q5a1LX
 WjD1AqX7AAFtBAlsXlymObHNNu1gQxLmIJHbAFVOjVBxGQbhv2vzvN8Mu9a8aVrXrPx1xxKEFyB
 WxsNJqinXOGmTNTg=
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr4154766wrw.198.1587633981561; 
 Thu, 23 Apr 2020 02:26:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypIhM8kPlvR/zB1LqcrL4HapJ2LOrmmM0mHkmrz7e5qiLOeWSTLrPtjeLwT7TiRTtxFt3T680A==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr4154737wrw.198.1587633981313; 
 Thu, 23 Apr 2020 02:26:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926?
 ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
 by smtp.gmail.com with ESMTPSA id v7sm11645139wmg.3.2020.04.23.02.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:26:20 -0700 (PDT)
Subject: Re: [PATCH 09/11] target/mips: Always enable CONFIG_SEMIHOSTING
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20200316120049.11225-1-philmd@redhat.com>
 <20200316120049.11225-10-philmd@redhat.com>
 <d07835cf-1021-7399-a28d-09a4a4c225ef@redhat.com>
 <9a138460-9b08-a8bd-ecc9-78f6b227e972@redhat.com>
 <5ebee88a-4ce4-7406-a668-c64e1cc5ae6c@redhat.com>
 <766b5fe0-148e-827c-eb67-ad798a517b1a@redhat.com>
 <CAP+75-W0PVH+Gmo3-4qq8Of7ss=Zr4FLVUrxc+nwwdqakHy=Uw@mail.gmail.com>
 <c246a638-946f-7bbc-43b8-aa09489bd83c@redhat.com>
 <CAP+75-XGxAnc_xVReTXicPhUAGjq_Q4D5Dpw3yd=6ayAFjSftw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aee8b007-54fc-462d-5bc6-f5ae11cc879a@redhat.com>
Date: Thu, 23 Apr 2020 11:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAP+75-XGxAnc_xVReTXicPhUAGjq_Q4D5Dpw3yd=6ayAFjSftw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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

On 23/04/20 11:13, Philippe Mathieu-Daud=C3=A9 wrote:
>> Let's then:
>>
>> 1) allow multiply-defined variables (just remove the "if" from
>> do_declaration)
> Apparently not needed with 2)

Since "config SEMIHOSTING" is in hw/semihosting/Kconfig, it should be
needed no?

>> 2) do
>>
>> config SEMIHOSTING
>>         default y if TCG
>>
>> in target/arm/Kconfig.
> You rock!
>=20


