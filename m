Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A76A4083
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbaz-0000Qd-Ci; Mon, 27 Feb 2023 06:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWbau-0000Nl-Fl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:23:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWbar-0002q0-FT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:23:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so6845629wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSrdR1dRUwL9w62ffoZCzUDOa9PXzM50Oj5+LxZXHRQ=;
 b=emWdmmAQW4b447QxjPinR24FL7PEazIWW1yECQX6WaH89iBRcRwRBwi0YSIo3KDxnz
 pbIGDj219c/7b68nUKuo2F7QKCQ+fthKzhFIunSm99Q7KSHosWgLHdeSWdFjUYRzLa+0
 UQ1mcfFqxA7nvoZg6DPj8O/i2lysc3QEkjM7dOOfngT5qH3B2ep+LI0OJexWpYI029Ds
 bq4BRadvOn1sunYn7twPJiyf5WFauwFJMki7zkRTQ5nv2L8fMLfeAnaiYrqyBgsfax5p
 EyVHfraIt+7buUcMmFMJRz9xSIxqXVkGfZa9t6OicczHiI1DrzD6W76pZ3JxdxUrRrv3
 JrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSrdR1dRUwL9w62ffoZCzUDOa9PXzM50Oj5+LxZXHRQ=;
 b=V+McvHV1OsBLH+hEOYzwQUypV1nk6ieirPNvVo5q8w/YH55/FLIZ354IdMxbBe131G
 zUU8krt5yt5l76M1xk1zxgARtBngA49zQXHFZYg+zxqNY/deM/FeusKR6U7lAssHKSPF
 0eJaNeGxFPlyE1ZOW6Vgdhz+5kk6Pm7Ly743wQSnktuLYw980A+2TaWIu5IoiHl14PGJ
 QVtahNxv5XpFYunc4j3d/y7Gg26SdpT1Vvyr2b+I/luQeBbpjdM0ZEMTfyJo/mY6hJjx
 KXIvASPGxelfqBygyUYPlISiN0cp9cEUUEwhif3OnkUafP5jvGcAqch6cRwJsIBUglWR
 9XfA==
X-Gm-Message-State: AO0yUKU+31wUjuOdnolGiwB0W9x0L2Pk2UD9bKnCCcOgFDtcQaCqGgnT
 MDfjKfhLM9TNVM/hVZvKHJ4ODw==
X-Google-Smtp-Source: AK7set8zyZYOYZNEe+kb4X0YLJkNFR1SPeTSnK0fxULc7SiMwY610VLrqiBh/MtTOj5L5gIJUlM9Xw==
X-Received: by 2002:a05:600c:1895:b0:3e2:f80:3df1 with SMTP id
 x21-20020a05600c189500b003e20f803df1mr18502577wmp.19.1677496975997; 
 Mon, 27 Feb 2023 03:22:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b003de2fc8214esm9289831wms.20.2023.02.27.03.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:22:55 -0800 (PST)
Message-ID: <2b446ce6-0d1b-0745-8e83-75d4cae36057@linaro.org>
Date: Mon, 27 Feb 2023 12:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/24] hw/ide: Declare
 ide_get_[geometry/bios_chs_trans] in 'hw/ide/internal.h'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-18-philmd@linaro.org> <87edqbicfb.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87edqbicfb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 12:17, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> ide_get_geometry() and ide_get_bios_chs_trans() are only
>> used by the TYPE_PC_MACHINE.
>> "hw/ide.h" is a mixed bag of lost IDE declarations. In order
>> to remove this (almost) pointless header soon, move these
>> declarations to "hw/ide/internal.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/pc.c              | 3 ++-
>>   include/hw/ide.h          | 4 ----
>>   include/hw/ide/internal.h | 4 ++++
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 6e592bd969..79297a6ecd 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -34,7 +34,8 @@
>>   #include "hw/i386/vmport.h"
>>   #include "sysemu/cpus.h"
>>   #include "hw/block/fdc.h"
>> -#include "hw/ide.h"
>> +#include "hw/ide/internal.h"
>> +#include "hw/ide/isa.h"
> 
> I do kind of wonder why hw/ide/internal.h isn't in the appropriate
> subdir (e.g. hw/ide and included as #include "internal.h") rather than
> the "public" include directory.

It should be internal but is included by PCI and MacIO:

include/hw/ide/pci.h:4:#include "hw/ide/internal.h"
include/hw/misc/macio/macio.h:31:#include "hw/ide/internal.h"

Long term I'd like to split it in internal vs public API.

> However QEMU isn't super consistent with
> that:
> 
>    ➜  find . -iname "internal.h"
>    ./accel/tcg/internal.h
>    ./target/ppc/internal.h
>    ./target/mips/internal.h
>    ./target/hexagon/internal.h
>    ./include/hw/ide/internal.h
>    🕙11:15:58 alex@zen:qemu.git  on  review/qom-housekeeping-v2 [$?] took 7s
>    ➜  find . -iname "internals.h"
>    ./tests/fp/berkeley-softfloat-3/source/include/internals.h
>    ./target/arm/internals.h
>    ./target/riscv/internals.h
>    ./target/loongarch/internals.h
>    ./gdbstub/internals.h
> 
> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!

