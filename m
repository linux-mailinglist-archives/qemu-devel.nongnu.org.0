Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A62DCB57
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 04:38:51 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpk7u-0000H1-27
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 22:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpk5p-0007fV-H5
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 22:36:41 -0500
Received: from relay2.mymailcheap.com ([151.80.165.199]:49649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpk5l-0001gN-FZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 22:36:41 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 3F4B23ECDA;
 Thu, 17 Dec 2020 04:36:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 6B2A32A366;
 Wed, 16 Dec 2020 22:36:32 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608176192;
 bh=UZ7VHryzrgSz37/vmpdaI0/vs7WFUXYompfHNavUj2I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NGlEBWnk5a0f/iAAKSI+2JROEbCZQ/bx9VDJEEID7lf0hVckj1XEtTKMmD88CPP5H
 5PaBsJBDg1j6vR/gynKh6pg3sT8EWgimqQ0mlJ/Ch2++a7mKLmzWibdWmBndoMc4rt
 zUrbJewGtpoMB0lntkBNZGCZ7s9oDv+dLW56MezE=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuQy2r9Kz2kQ; Wed, 16 Dec 2020 22:36:30 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 22:36:30 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 37BB343049;
 Thu, 17 Dec 2020 03:36:29 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="EYRJnMFq"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1C2CA4300D;
 Thu, 17 Dec 2020 03:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608176185;
 bh=UZ7VHryzrgSz37/vmpdaI0/vs7WFUXYompfHNavUj2I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EYRJnMFqr3BCmSTzvrtvhgnsOUa2cyKwzrvqnqyBT9m4xXB1u5PIv+/6kCMl8E8RE
 KdDkw3tJvwN2dyDgLa7GiX6Oo7Au6sfL69TbHSga7KMUgcqHcJJbpFgGJMDVECB0pL
 VdJ1vJ0uMNByAWz2pE0swXxVVr/dbefCxaihdCYo=
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>
References: <20201216181759.933527-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a5d00c59-b028-99b1-7500-32cb8e0e43d1@flygoat.com>
Date: Thu, 17 Dec 2020 11:36:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216181759.933527-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[6];
 ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 37BB343049
Received-SPF: pass client-ip=151.80.165.199;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/17 上午2:17, Philippe Mathieu-Daudé 写道:
> Test the PMON firmware. As the firmware is not redistributable,
> it has to be downloaded manually first. Then it can be used by
> providing its path via the PMON_PATH environment variable:

We have a PMON port for loongson3-virt machine[1] and it's redistributable.

You can also fetch prebuilt binary from GitHub action artifacts, I can 
also make
a release on GitHub to make it easier.

Thanks.

[1] https://github.com/loongson-community/pmon

- Jiaxun
>
>    $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>      PMON_PATH=/images/pmon \
>      avocado --show=app,console \
>        run -t machine:loongson3-virt tests/acceptance
>    JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
>    JOB LOG    : /home/phil/avocado/job-results/job-2020-12-16T19.02-363e66a/job.log
>     (1/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_BLD_serial_console:
>    console: PMON2000 MIPS Initializing. Standby...
>    console: 00000000
>    console: Shut down other cores
>    console: 0xbfe00190  : 0000000000000000
>    console: CPU CLK SEL : 00000000
>    console: MEM CLK SEL : 00000000
>    console: Change the driver
>    console: Soft CLK SEL adjust begin
>    console: HT         :00000000
>    console: DDR_DIV:00000002
>    console: BBGEN start  :
>    console: BBGEN config value  :00000000
>    console: MC RESET
>    console: Fix L1xbar illegal access at NODE 0
>    console: Fix L2xbar in NODE 0
>    console: 32 bit PCI space translate to 64 bit HT space
>    console: Waiting HyperTransport bus to be up.
>    PASS (0.10 s)
>     (2/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_A1101_serial_console:
>    console: PMON2000 MIPS Initializing. Standby...
>    console: 0xbfe00190  : 0000000000000000
>    console: CPU CLK SEL : 00000000
>    console: CPU clk frequency = SYSCLK x 0x0000001e /  1
>    console: MEM CLK SEL : 00000000
>    console: DDR clk frequency = MEMCLK x 0x0000001e /  3
>    console: Fix L1xbar illegal access
>    console: Fix L2xbar illegal access
>    console: Init tlb...
>    console: godson2 caches found
>    PASS (0.12 s)
>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>    JOB TIME   : 0.58 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20201215125716.477023-1-chenhuacai@kernel.org>
> ---
>   MAINTAINERS                                 |  1 +
>   tests/acceptance/machine_mips_loongson3v.py | 66 +++++++++++++++++++++
>   2 files changed, 67 insertions(+)
>   create mode 100644 tests/acceptance/machine_mips_loongson3v.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f75fa2a7142..9a02d44f997 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel.org>
>   R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   S: Maintained
>   F: hw/intc/loongson_liointc.c
> +F: tests/acceptance/machine_mips_loongson3v.py
>   
>   Boston
>   M: Paul Burton <paulburton@kernel.org>
> diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
> new file mode 100644
> index 00000000000..8e698bbc99b
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_loongson3v.py
> @@ -0,0 +1,66 @@
> +# Functional tests for the Generic Loongson-3 Platform.
> +#
> +# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
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
> +class MipsFuloong3(Test):
> +
> +    timeout = 60
> +
> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_pmon_BLD_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +        pmon_name = 'pmon_BLD-3A3000-780EMATX-1w-V1.10.bin'
> +        pmon_hash = '38916ee03ed09a86997b40c687c83e92'
> +        pmon_path = self.fetch_asset('file://' + os.path.join(
> +                                        os.getenv('PMON_PATH'), pmon_name),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Shut down other cores')
> +        wait_for_console_pattern(self, 'Waiting HyperTransport bus to be up.')
> +
> +    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_pmon_A1101_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=endian:little
> +        :avocado: tags=machine:loongson3-virt
> +        :avocado: tags=cpu:Loongson-3A1000
> +        :avocado: tags=device:liointc
> +        :avocado: tags=device:goldfish_rtc
> +        """
> +        pmon_name = 'pmon-A1101-2.0.8.bin'
> +        pmon_hash = 'cc40276213cfa20922720f183b92ab61'
> +        pmon_path = self.fetch_asset('file://' + os.path.join(
> +                                        os.getenv('PMON_PATH'), pmon_name),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'godson2 caches found')

