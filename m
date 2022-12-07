Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAE645F5F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 17:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2xiF-0007B2-1B; Wed, 07 Dec 2022 11:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2xiD-0007Ap-5Z
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:56:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2xiA-0000p7-T7
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:56:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so1540033wms.0
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 08:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MEKeNF/DFAIkiptsyuFF/w++Xe7TK8ZuOWTeBpSLcR0=;
 b=HqoyGO8Ng9z5IQ/y0e/CdAqj6LuUAjkR4iioH62JfGAPKdcgsYm511lExe6FPer2cw
 0+RNjNWKt9nVUNK5CHvWQ007Vr4Upq17zJnqcV8hVYpFAJ53jOtD+cU0B5MOPD9PUX7N
 scFfHSWlD0bp1K566e0oZCrRhQnN7eG3mwUA8H1KhBgXtwoV1GFV/yFHtLxV3oV4rzkO
 cor9zFKTWb40rMALfJrwsqhlZ2PN8Ef6QjOCuEshz0SJrZC4e6ETqTFhaDL07V/k/pHn
 kcPhcKZH2q39h4IxRlDyGvlvRYLItlsl/H+YoXXmGxCG3QtuMvHHR1vfUqpsKpnyNi9G
 f09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MEKeNF/DFAIkiptsyuFF/w++Xe7TK8ZuOWTeBpSLcR0=;
 b=nkXdRU3iVf+AlxLNbXWElvPcyuoln4kfqfO4oBPX1r+1KzyFH3oRz00vYc4mZWEyhN
 xHJP+x0v6f8VCeOH/JZ4OM3pvs1NLvQaUfTq4yy9aIzr+nB9wbfyV2rg87ZU8OXpvVNl
 qRVDx1tONCgaVaeMpYZ8uOpMvV3SC+Gi7ChzBYzTTG/UbJNo6ARMRaHfwGCVu1+P+m6f
 R2t6enshVaPqp66FhOEX75r8drk9eOehRY0w+TnvCgiQ6zSr7Ttoj9oNsxWnhtVR704N
 5aMN9ThAjjEoyJGGOgeYm7I8tyX4+jht0Hbx4qHdBI1+agfE/Im2YX64N2yJn73Hsoe3
 ExJA==
X-Gm-Message-State: ANoB5pnc8YJLHLp+xceRC322lLwniGV3Av997a9xwUkjD42apLUC6C5h
 cUUg+ZqF5kst/xh7kAOPqZrL9Q==
X-Google-Smtp-Source: AA0mqf5ETvhiL5I3D2B8d3lHkFHYdCIbRy04qznYBRSp19G6VKEUY+oXTo9pxB73vShjABKSNniRaw==
X-Received: by 2002:a05:600c:3543:b0:3cf:74bb:feb1 with SMTP id
 i3-20020a05600c354300b003cf74bbfeb1mr65302602wmq.102.1670432157005; 
 Wed, 07 Dec 2022 08:55:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003cf483ee8e0sm2882924wmq.24.2022.12.07.08.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 08:55:56 -0800 (PST)
Message-ID: <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
Date: Wed, 7 Dec 2022 17:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, Stefan Hajnoczi <stefanha@gmail.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/12/22 15:33, Eric Auger wrote:
> On 12/7/22 15:09, Stefan Hajnoczi wrote:
>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
>>> On 12/7/22 14:24, Eric Auger wrote:
>>>> Initialize r0-3 to avoid compilation errors when
>>>> -Werror=maybe-uninitialized is used
>>>>
>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>   2495 |     d->Q(3) = r3;
>>>>        |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>   2494 |     d->Q(2) = r2;
>>>>        |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>   2493 |     d->Q(1) = r1;
>>>>        |     ~~~~~~~~^~~~
>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>   2492 |     d->Q(0) = r0;
>>>>        |     ~~~~~~~~^~~~
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>
>>>> ---
>>>>
>>>> Am I the only one getting this? Or anything wrong in my setup.
>>> With Stefan's correct address. Forgive me for the noise.
>> When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
>> it. Unless it's automatically set by meson this must be a manual
>> --extra-cflags= option you set.
> 
> I am using this configure cmd line:
> 
> ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
> --target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
> --extra-cflags=-O --enable-trace-backends=log --python=/usr/bin/python3
> --extra-cflags=-Wall --extra-cflags=-Wundef
> --extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
> --extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
> --extra-cflags=-Werror=type-limits
>>
>> If you added it manually then let's fix this in 8.0 since it's not
>> tested/supported and very few people will see this issue.
Please include the relevant meson output in the commit description, i.e.:

C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
version 14.0.0 (clang-1400.0.29.202)")
C linker for the host machine: clang ld64 820.1

   Compilation
     host CPU                     : aarch64
     host endianness              : little
     C compiler                   : clang
     Host C compiler              : clang
     C++ compiler                 : c++
     Objective-C compiler         : clang
     CFLAGS                       : -ggdb 
-Werror=incompatible-function-pointer-types -O2 -g
     CXXFLAGS                     : -ggdb 
-Werror=incompatible-function-pointer-types -O2 -g
     OBJCFLAGS                    : -ggdb 
-Werror=incompatible-function-pointer-types -ggdb -O2 -g
     LDFLAGS                      : -ggdb 
-Werror=incompatible-function-pointer-types
     QEMU_CFLAGS                  : ...
     QEMU_CXXFLAGS                : ...
     QEMU_OBJCFLAGS               : ...
     QEMU_LDFLAGS                 : -fstack-protector-strong

Thanks,

Phil.


