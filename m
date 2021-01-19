Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B82FB2CC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:23:41 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lMa-0003v2-9s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1lJ5-0002hG-Dc
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:20:06 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1lJ2-0008IB-HG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:20:02 -0500
Received: by mail-ej1-x633.google.com with SMTP id w1so27003131ejf.11
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 23:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BkRQPfw1BU0P+JJGQQ9zWfEL8KLLehGDBUE8yB7AEqs=;
 b=qNOuYuRxXdbwj5+cbNdqd08nzSoe9gCRopSfRZmkoglbmTr9Pk58I5WnBqTUjZYF9l
 KL11ERDHtouw+4OnoFwWljSnxYfV48m3d/WN+LbHTtjt8c+xm2ppjTRuf65XLfqUF5gp
 Zr/6FQ/k68vjf2ZPlAjO2ZgGIVMcjdSBohxNL4thNIo/qp6qkx4FO3wt+NdJCH7PvQo0
 9L7fHUCpqSr1uxI8FAqF65/fMoFismEO0SF4W6r82FKV8nGu8ZHEHwgIAM1/g75HfHU3
 OuZ18v+D4WVveluGTW4ZGeh4pN8Q7maYe7ImbuF4oIgSvo0Qo1EkMbdCqB2L/X4tmSQZ
 IJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BkRQPfw1BU0P+JJGQQ9zWfEL8KLLehGDBUE8yB7AEqs=;
 b=ClxzArsPhKGG41HcFMpbVOkGBB/lJNvUQfAHa5R/+wfHQsdl9DeuE/T8Xd7MHikI+J
 FIZlkPva65cgTikBLbck8sVSHPS+fkkl1eYLP8VHijNX3QPf0phh3RCfUM2jLtG8rok1
 xtHB0uZtT/1CnI1Ipxx84nhOUmRs903qqZgaJEoaQB3vIpv5MR8/qy5MG+HjPHke8u07
 CJlBlfELiIl0ultfAeGagoQVuEVqkr6YfLzpsEuUpIsaV15qpwL1quQcwdYPVxwYUgoc
 3ZE+iz05ja7SSXH9LG9tJx+msieEFQNb9GnmK6FgJ0HIxat5Iq1RHHECocGJcbLA0nci
 /Vnw==
X-Gm-Message-State: AOAM532PbahYtObPgOX9ztLCdSWbJzn8gmBw0KeLURFaWrbOWu2lcZT0
 aA+z52XN4G5x9sRnhHnlZNIAxDZS+fM=
X-Google-Smtp-Source: ABdhPJxBEUzeOGkMByNp1vxhqjDNHAOAnmBYLIJ0CeoyTrjgD1pZT3ZQVrhWAm0RgMISK8+JW0E2lw==
X-Received: by 2002:a17:907:2458:: with SMTP id
 yw24mr2136497ejb.333.1611040798036; 
 Mon, 18 Jan 2021 23:19:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w4sm901109eds.40.2021.01.18.23.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 23:19:57 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
 <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org> <87pn22uqkh.fsf@linaro.org>
 <2f5b7035-40b2-897f-a0c8-e09b2ba2e125@amsat.org>
 <3ed8e4cd-e4e0-4d42-a3db-534e97d1a2da@www.fastmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c0fda8a5-4304-983e-2811-9fc5ce3c2cf3@amsat.org>
Date: Tue, 19 Jan 2021 08:19:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3ed8e4cd-e4e0-4d42-a3db-534e97d1a2da@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/19/21 7:59 AM, Jiaxun Yang wrote:
> On Tue, Jan 19, 2021, at 1:57 PM, Philippe Mathieu-Daudé wrote:
>> On 1/18/21 5:54 PM, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>> On 1/12/21 3:07 AM, Jiaxun Yang wrote:
>>>>> Test booting of PMON bootloader on loongson3-virt platform.
>>>>>
>>>>> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>>>>     avocado --show=app,console \
>>>>>       run -t machine:loongson3-virt tests/acceptance
>>>>> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
>>>>> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
>>>>> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
>>>> ...
>>>>> console: This software may be redistributed under the BSD copyright.
>>>>> console: Copyright 2000-2002, Opsycon AB, Sweden.
>>>>> console: Copyright 2005, ICT CAS.
>>>>> console: CPU GODSON3 BogoMIPS: 1327
>>>>> PASS (3.89 s)
>>>>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>>>> JOB TIME   : 4.38 s
>>>>>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>  MAINTAINERS                                 |  1 +
>>>>>  tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>>>>>  2 files changed, 40 insertions(+)
>>>>>  create mode 100644 tests/acceptance/machine_mips_loongson3v.py
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 4be087b88e..f38882f997 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
>>>>>  F: hw/mips/loongson3_bootp.c
>>>>>  F: hw/mips/loongson3_bootp.h
>>>>>  F: hw/mips/loongson3_virt.c
>>>>> +F: tests/acceptance/machine_mips_loongson3v.py
>>>>>  
>>>>>  Boston
>>>>>  M: Paul Burton <paulburton@kernel.org>
>>>>> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
>>>>> new file mode 100644
>>>>> index 0000000000..17a85de69f
>>>>> --- /dev/null
>>>>> +++ b/tests/acceptance/machine_mips_loongson3v.py
>>>>> @@ -0,0 +1,39 @@
>>>>> +# Functional tests for the Generic Loongson-3 Platform.
>>>>> +#
>>>>> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>> 2021 Jiaxun Yang <jiaxun.yang@flygoat.com>? :D
>>
>> Jiaxun, if you agree I can update that line and queue your patch.
> 
> Please do. Thanks!

So:

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

and applied (not removing AVOCADO_ALLOW_UNTRUSTED_CODE,
fixing copyright line) to mips-next.

Thanks,

Phil.

