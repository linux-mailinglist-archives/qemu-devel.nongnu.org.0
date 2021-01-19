Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8D2FB117
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 06:59:32 +0100 (CET)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1k39-0004Ca-FC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 00:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1k1D-0003k2-Ls
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:57:31 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1k1C-0005I4-25
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:57:31 -0500
Received: by mail-ej1-x629.google.com with SMTP id gx5so7576097ejb.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 21:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pnSgUrLE1EHjlVOwnCPE1BT6d87l0XS0Ey37n87svQk=;
 b=Ffb1g8aP/Le84pHo2/12MOZ+za9sAZcRI9cyMU/Gn5W0RCYpfjaRnwYjyvOAfpqIIZ
 G1E5tXeqIiGefaWBYlMi1nlMYUaTaAKBq2gyyZ9SAKvOEHyWtWVsCKLkMzmGJNxzLUWp
 ri0FVWzd4O+SCUSd+3+MKkWv43c/0M/IdAEHd3ONeYzTR0Q92RUnhBjDrGLiyw396s6p
 mHOc5df58+KST+2P7zxD9g1ahP0lskBsrZmJVDZVmpu4tnduoH8QlMG6t/4/IzvG6oGo
 S+vewN7N5kn4jqtGHX3Ll11MIpcBLFoRdvCpeUn8k8C7PI0fV723W/OPPeVFfQwt3NhI
 z6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pnSgUrLE1EHjlVOwnCPE1BT6d87l0XS0Ey37n87svQk=;
 b=Ahx8HmFwYnATj2q8URg2uGepL39URA44PnYkQgaVrYhzuiauwXSfxCdnuUblxXcSpR
 Dw15KHbOt7VvYKy8am1Nd95U0FEA3+QScm3OBL0vhao62lwhrSXl9IUrXLmYEJRpKN/Y
 I7XGOi9gE5nKyEUXcFeNm7dGd+J+K5PbsWv9ZNE3vvObGQWCMG7M20nL8140AkKXtbS+
 8FcvgsRBgpGepqzg8MDqjw1OsIgDxTokS0I7mcP5oOviZVYkl2oUGwQn4Rkhj+uQHiYL
 77Wq4alvLLJY5+/LDFEGFdIsq81VyJrf9v/brBhPvxd6wdb7utfKWo3eHfND9+8khIxI
 KDxQ==
X-Gm-Message-State: AOAM5329HydIRCaM2DrMAyBriF8Q3Dkxr+yxf3vpRN8QAUedm8IYZVIm
 nICHEVc0m8rBs5S9zOm4xpw=
X-Google-Smtp-Source: ABdhPJwIZk8w7KxJ9yw4HrbFSCBJrbXgTu0sqLVv2STpUtWguKwjO5XHi67YCwyk0nm7CbPr0jX5zw==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr1979366ejc.408.1611035848436; 
 Mon, 18 Jan 2021 21:57:28 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t19sm10259461ejc.62.2021.01.18.21.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 21:57:27 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
 <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org> <87pn22uqkh.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f5b7035-40b2-897f-a0c8-e09b2ba2e125@amsat.org>
Date: Tue, 19 Jan 2021 06:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87pn22uqkh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 5:54 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 1/12/21 3:07 AM, Jiaxun Yang wrote:
>>> Test booting of PMON bootloader on loongson3-virt platform.
>>>
>>> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>>     avocado --show=app,console \
>>>       run -t machine:loongson3-virt tests/acceptance
>>> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
>>> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
>>> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
>> ...
>>> console: This software may be redistributed under the BSD copyright.
>>> console: Copyright 2000-2002, Opsycon AB, Sweden.
>>> console: Copyright 2005, ICT CAS.
>>> console: CPU GODSON3 BogoMIPS: 1327
>>> PASS (3.89 s)
>>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>> JOB TIME   : 4.38 s
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>  MAINTAINERS                                 |  1 +
>>>  tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>>>  2 files changed, 40 insertions(+)
>>>  create mode 100644 tests/acceptance/machine_mips_loongson3v.py
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 4be087b88e..f38882f997 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
>>>  F: hw/mips/loongson3_bootp.c
>>>  F: hw/mips/loongson3_bootp.h
>>>  F: hw/mips/loongson3_virt.c
>>> +F: tests/acceptance/machine_mips_loongson3v.py
>>>  
>>>  Boston
>>>  M: Paul Burton <paulburton@kernel.org>
>>> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
>>> new file mode 100644
>>> index 0000000000..17a85de69f
>>> --- /dev/null
>>> +++ b/tests/acceptance/machine_mips_loongson3v.py
>>> @@ -0,0 +1,39 @@
>>> +# Functional tests for the Generic Loongson-3 Platform.
>>> +#
>>> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> 2021 Jiaxun Yang <jiaxun.yang@flygoat.com>? :D

Jiaxun, if you agree I can update that line and queue your patch.

>>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> +# See the COPYING file in the top-level directory.
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +import os
>>> +import time
>>> +
>>> +from avocado import skipUnless
>>> +from avocado_qemu import Test
>>> +from avocado_qemu import wait_for_console_pattern
>>> +
>>> +class MipsLoongson3v(Test):
>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>>
>> The source code is published [1], you provided reproducible
>> workflow [2] and a tag [3] with a public build artifacts [4],
>> so my understanding is this is "trustable" binary.
>>
>> Alex, would it be OK to add this test without the UNTRUSTED tag
>> (amending the links in the commit description)?
> 
> It's a subjective call. Having open source code is a minimum step to
> being "trusted" but really the trust is in the community that hosts the
> code. The upstream distros (e.g. Debian/Fedora) are trusted because
> people install their software on their desktops and basically give the
> software publisher root on their machines. There has to be a level of
> trust that the distros won't abuse that to steal information from their
> users.
> 
> I personally have no idea about the loongson community because it's not
> one I interact with so I have no idea what sort of place it is. Is it a
> code dump for semi-proprietary non-upstreamed kernels or is it a place
> that has a good development culture with a sane security process that is
> responsive to problems and moderately conservative with what they merge?
> 
> If you would trust your keys to a machine running this communities
> software then by all means treated it as a trusted source.

Subjective call understood :)

Thanks for your clear explanation,

Phil.

