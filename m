Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D1645CB2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 15:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2vUw-0005bJ-1Y; Wed, 07 Dec 2022 09:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2vUu-0005b6-SB
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2vUt-00075M-0C
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670423645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZeFI9XJRpu5ci9mUCw1UTAkwO8WPzpjrkZxtSXd73Y=;
 b=O1oHYM8ijxI78ZZ/9Nm7GyzF1J6Qd4M77Xd7TKRlPbtlcctxM2fnH2PxK974pduA8aby3w
 cLBCLPArVoSYUJLwioRfSDCz4exAudTKyvW+1aUuR/DB2vpWDOc7wSYZ08Du+aVW+Tt3Yu
 47OtrT8RQeVSSU7f1GAZsmNWYgbbf/M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-uPynhPtGPZ2QNaK9uOjl1w-1; Wed, 07 Dec 2022 09:34:03 -0500
X-MC-Unique: uPynhPtGPZ2QNaK9uOjl1w-1
Received: by mail-qk1-f199.google.com with SMTP id
 s7-20020a05620a0bc700b006fcb1a3bb9dso17475399qki.15
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 06:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZeFI9XJRpu5ci9mUCw1UTAkwO8WPzpjrkZxtSXd73Y=;
 b=fdvMX14JH/ZFaxx5R2XUkVD7Vt75GOMOURotusNi9oNCSywBCcdlCTArp2Yr/0wBPX
 uMfP8UmE+3MokmsvsLGnao8EKtBLoCTGYQR2yLoKgtvHId0pJwlXda6DZTJTfmz3iqnX
 nR2+NeNhOxLc7eTJl8BWUPTyB7gDUbXz+bEwcn0AnX0k0kN6kOUg163kUhNDAodxyZ84
 m8HHzPQeoM0CxdCRNLl6r7OfG654Ese6uY2m1G73UjW5ICXD4dUwPHku5rPctnoUcVRZ
 /feFVt6N9UEmjQ+BZPElvxrXbWOyr8h1xIlYjP8RTFxNFCAL/2BqKdAK0/2yhUjC7tYY
 FLXg==
X-Gm-Message-State: ANoB5pmxcNMlTlAiyf1/UYGKHXD1i1kbXOohDddo1ZyHNAZOctW+xatb
 6hjw1EvdbZsCL/f4X/tfQPy/I4zVRKgvZdOEO/EUcxK0HExdGLNV54P7bCipDhBqhstZBRIPbAb
 Oia/dY4v1JMH4YUw=
X-Received: by 2002:a05:622a:1143:b0:3a5:3020:bd76 with SMTP id
 f3-20020a05622a114300b003a53020bd76mr66281222qty.547.1670423643070; 
 Wed, 07 Dec 2022 06:34:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Cr2ir4xxQJzbb73FVgmHXYpJnitzT4+o22HOU4KMHOnn3hTSlmSXu/oaVOk+6RCyZ+2qvDA==
X-Received: by 2002:a05:622a:1143:b0:3a5:3020:bd76 with SMTP id
 f3-20020a05622a114300b003a53020bd76mr66281202qty.547.1670423642783; 
 Wed, 07 Dec 2022 06:34:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s190-20020ae9dec7000000b006f7ee901674sm16571376qkf.2.2022.12.07.06.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 06:34:01 -0800 (PST)
Message-ID: <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
Date: Wed, 7 Dec 2022 15:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On 12/7/22 15:09, Stefan Hajnoczi wrote:
> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
>> On 12/7/22 14:24, Eric Auger wrote:
>>> Initialize r0-3 to avoid compilation errors when
>>> -Werror=maybe-uninitialized is used
>>>
>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>  2495 |     d->Q(3) = r3;
>>>       |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>  2494 |     d->Q(2) = r2;
>>>       |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>  2493 |     d->Q(1) = r1;
>>>       |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>  2492 |     d->Q(0) = r0;
>>>       |     ~~~~~~~~^~~~
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>
>>> ---
>>>
>>> Am I the only one getting this? Or anything wrong in my setup.
>> With Stefan's correct address. Forgive me for the noise.
> When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
> it. Unless it's automatically set by meson this must be a manual
> --extra-cflags= option you set.

I am using this configure cmd line:

./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
--target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
--extra-cflags=-O --enable-trace-backends=log --python=/usr/bin/python3
--extra-cflags=-Wall --extra-cflags=-Wundef
--extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
--extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
--extra-cflags=-Werror=type-limits
>
> If you added it manually then let's fix this in 8.0 since it's not
> tested/supported and very few people will see this issue.

Thanks

Eric
>
> Stefan
>


