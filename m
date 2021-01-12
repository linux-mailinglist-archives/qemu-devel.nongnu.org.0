Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF82F2EC1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:12:13 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIWy-0005vv-9C
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzIVM-00054N-Q9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:10:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzIVK-0007Hp-Ac
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:10:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w5so2225370wrm.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PXh9UWdS1Yt4Zpp2urIvETS5Mv5lWTWZRP0zZTuof34=;
 b=rhEa7wZg/DWDZW6hK8sgWFMf/6Bv+ECtkZiZ773B3aNiOlRaehY36HvS1jsD9fn0Ln
 P40TH5EsvYUu8a8dRvBSDcYE61+TpIj16/qQJaXadumIjYyT0BYGAy1WO5KULOziOf8w
 svagWFcaq/w+myDzTY58DeEIR19wGEAVMo0qP/4gEua/MA5rk7QlNPd7rul8vjrKSjb/
 yOISSfCHIPS1FU5cbpBFXD6hQ6yO5mAg5f2DD1XEAxketEwVSrxDUqiutv2GEuiN6rbA
 /V524rcDnoD2aOBfwYwShLKM8n6A/ontawb1Jt30s7MvbXx8aX4y5nh0p7pEqsLADoEe
 4IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXh9UWdS1Yt4Zpp2urIvETS5Mv5lWTWZRP0zZTuof34=;
 b=Q8IX4i5tqFTZXScVv9Z3niDO0RP0iowcjVe6uk0UyLI6PnkGVnXe142RZwjspOHS7S
 LhQeAH9kVOvKDda2yMmjVZB8lOMs1LgA9r51KKEvu9wR1rAJbnBEbzSKhZIdZByuD51i
 opNBSpt8ne8WiFAHkKHlPsEdHgKzmkrTKWNSd6d/iUU2RoZEjsgdqVvuHo0cmdOVl8QL
 aJCkjc7SKDsICowsDHCJ/iejujAOzblYRIZqDg9KHRC1Jjnn5oM3tQVGPxM1o3sMsKCk
 MEcwRO/rEkSvTr26rhfIfyn8QnetqAwqAQR3H5WRMPUiSVauXc2K1qtGyDs6uooNaaSk
 I4wA==
X-Gm-Message-State: AOAM533tkDqenn/rlD/7syDypK3+LeGVriIjwXn931Z3WRS/n4pW1NCS
 XJ5u8o7Wyj4SV97n7KSO7Nw=
X-Google-Smtp-Source: ABdhPJzrjhcIn1VOhc5wiCNirOhMd1FRy4B5VO9EK4YoQ6shjFb9RvSHZFnSQ+DlmV3+pW2Y4gEEdQ==
X-Received: by 2002:adf:eac1:: with SMTP id o1mr3985561wrn.256.1610453426011; 
 Tue, 12 Jan 2021 04:10:26 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id u83sm3684439wmu.12.2021.01.12.04.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:10:25 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0cf6ab15-f976-39ad-ad9c-df48aaa8d1ec@amsat.org>
Date: Tue, 12 Jan 2021 13:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun, Alex,

On 1/12/21 3:07 AM, Jiaxun Yang wrote:
> Test booting of PMON bootloader on loongson3-virt platform.
> 
> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>     avocado --show=app,console \
>       run -t machine:loongson3-virt tests/acceptance
> Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
> JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
...
> console: This software may be redistributed under the BSD copyright.
> console: Copyright 2000-2002, Opsycon AB, Sweden.
> console: Copyright 2005, ICT CAS.
> console: CPU GODSON3 BogoMIPS: 1327
> PASS (3.89 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 4.38 s
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  MAINTAINERS                                 |  1 +
>  tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 tests/acceptance/machine_mips_loongson3v.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4be087b88e..f38882f997 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1164,6 +1164,7 @@ F: hw/intc/loongson_liointc.c
>  F: hw/mips/loongson3_bootp.c
>  F: hw/mips/loongson3_bootp.h
>  F: hw/mips/loongson3_virt.c
> +F: tests/acceptance/machine_mips_loongson3v.py
>  
>  Boston
>  M: Paul Burton <paulburton@kernel.org>
> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
> new file mode 100644
> index 0000000000..17a85de69f
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_loongson3v.py
> @@ -0,0 +1,39 @@
> +# Functional tests for the Generic Loongson-3 Platform.
> +#
> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>

2021 Jiaxun Yang <jiaxun.yang@flygoat.com>? :D

> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class MipsLoongson3v(Test):
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')

The source code is published [1], you provided reproducible
workflow [2] and a tag [3] with a public build artifacts [4],
so my understanding is this is "trustable" binary.

Alex, would it be OK to add this test without the UNTRUSTED tag
(amending the links in the commit description)?

[1] https://github.com/loongson-community/pmon/
[2]
https://github.com/loongson-community/pmon/blob/master/.github/workflows/compile.yml
[3] https://github.com/loongson-community/pmon/releases/tag/20210112
[4] https://github.com/loongson-community/pmon/actions/runs/479132723

> +    def test_pmon_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +
> +        pmon_hash = '7c8b45dd81ccfc55ff28f5aa267a41c3'
> +        pmon_path = self.fetch_asset('https://github.com/loongson-community/pmon/'
> +                                    'releases/download/20210112/pmon-3avirt.bin',
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Copy PMON to execute location done.')
> +        wait_for_console_pattern(self, 'CPU GODSON3 BogoMIPS:')
> 


