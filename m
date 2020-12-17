Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0192DD220
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:27:37 +0100 (CET)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptJg-00081m-CD
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kptHx-0007W2-IG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:25:50 -0500
Received: from relay3.mymailcheap.com ([217.182.119.155]:45106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kptHu-0000rQ-7A
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:25:49 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 53F653F1CC;
 Thu, 17 Dec 2020 14:25:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 7D3E22A374;
 Thu, 17 Dec 2020 08:25:39 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608211539;
 bh=zMoPX961f3Ox9JNt2iTKTbM6HqTv0Z12t7QFXBKQbas=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=QgF9ZuzlIDuxBSkZtpZw8PZ6srNsthzieWbqDVTfQnQEKb6UmqOG0Ko06yuQ4lRHY
 YQfwUnhjsUp70kVbNM8BPrS7gjQP6Nglltb45sqzbZWoFfK/LEO33prsqG5tXKuSTB
 rs1bC8geDmZ/YiKNlnNolMDUNrVSog4oTMBANx6E=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ak5sMqJ8-xH1; Thu, 17 Dec 2020 08:25:38 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Thu, 17 Dec 2020 08:25:38 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 480C3430F0;
 Thu, 17 Dec 2020 13:25:36 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="L+t2Nvh+"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (li862-147.members.linode.com [139.162.20.147])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 34AA1430F0;
 Thu, 17 Dec 2020 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608211531;
 bh=zMoPX961f3Ox9JNt2iTKTbM6HqTv0Z12t7QFXBKQbas=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=L+t2Nvh+nsEBhsNHVVs65HKP9rS7vXvF8l5XZpRLNi55oTMD2cEOzDliEwUpePT7k
 0FUQrOxxRdFQTEez05HxP3ZrujrRijDaH463mSkOkCg8zyW2mQL4Q1ktxvKX0Eirm+
 OdQOPirviWXpNpfTrlSHmaRJKqB9JhGwbwTkoCKE=
Date: Thu, 17 Dec 2020 08:08:09 +0800
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
User-Agent: K-9 Mail for Android
In-Reply-To: <20201216181759.933527-1-f4bug@amsat.org>
References: <20201216181759.933527-1-f4bug@amsat.org>
Message-ID: <B0E444DA-E975-448F-8756-3603AA573A22@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 480C3430F0
Received-SPF: pass client-ip=217.182.119.155;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E4=BA=8E 2020=E5=B9=B412=E6=9C=8817=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
2:17:59, "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat=2Eorg> =E5=86=99=E5=88=
=B0:
>Test the PMON firmware=2E As the firmware is not redistributable,
>it has to be downloaded manually first=2E Then it can be used by
>providing its path via the PMON_PATH environment variable:

Well I have a distribution of PMON customized for loongson3-virt=2E

Will push it to GitHub later=2E


Thanks=2E


- Jiaxun


>
>  $ AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
>    PMON_PATH=3D/images/pmon \
>    avocado --show=3Dapp,console \
>      run -t machine:loongson3-virt tests/acceptance
>  JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
>  JOB LOG    : /home/phil/avocado/job-results/job-2020-12-16T19=2E02-363e=
66a/job=2Elog
>   (1/2) tests/acceptance/machine_mips_fuloong3=2Epy:MipsFuloong3=2Etest_=
pmon_BLD_serial_console:
>  console: PMON2000 MIPS Initializing=2E Standby=2E=2E=2E
>  console: 00000000
>  console: Shut down other cores
>  console: 0xbfe00190  : 0000000000000000
>  console: CPU CLK SEL : 00000000
>  console: MEM CLK SEL : 00000000
>  console: Change the driver
>  console: Soft CLK SEL adjust begin
>  console: HT         :00000000
>  console: DDR_DIV:00000002
>  console: BBGEN start  :
>  console: BBGEN config value  :00000000
>  console: MC RESET
>  console: Fix L1xbar illegal access at NODE 0
>  console: Fix L2xbar in NODE 0
>  console: 32 bit PCI space translate to 64 bit HT space
>  console: Waiting HyperTransport bus to be up=2E
>  PASS (0=2E10 s)
>   (2/2) tests/acceptance/machine_mips_fuloong3=2Epy:MipsFuloong3=2Etest_=
pmon_A1101_serial_console:
>  console: PMON2000 MIPS Initializing=2E Standby=2E=2E=2E
>  console: 0xbfe00190  : 0000000000000000
>  console: CPU CLK SEL : 00000000
>  console: CPU clk frequency =3D SYSCLK x 0x0000001e /  1
>  console: MEM CLK SEL : 00000000
>  console: DDR clk frequency =3D MEMCLK x 0x0000001e /  3
>  console: Fix L1xbar illegal access
>  console: Fix L2xbar illegal access
>  console: Init tlb=2E=2E=2E
>  console: godson2 caches found
>  PASS (0=2E12 s)
>  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>  JOB TIME   : 0=2E58 s
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
>Based-on: <20201215125716=2E477023-1-chenhuacai@kernel=2Eorg>
>---
> MAINTAINERS                                 |  1 +
> tests/acceptance/machine_mips_loongson3v=2Epy | 66 +++++++++++++++++++++
> 2 files changed, 67 insertions(+)
> create mode 100644 tests/acceptance/machine_mips_loongson3v=2Epy
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index f75fa2a7142=2E=2E9a02d44f997 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel=2Eorg>
> R: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
> S: Maintained
> F: hw/intc/loongson_liointc=2Ec
>+F: tests/acceptance/machine_mips_loongson3v=2Epy
>=20
> Boston
> M: Paul Burton <paulburton@kernel=2Eorg>
>diff --git a/tests/acceptance/machine_mips_loongson3v=2Epy b/tests/accept=
ance/machine_mips_loongson3v=2Epy
>new file mode 100644
>index 00000000000=2E=2E8e698bbc99b
>--- /dev/null
>+++ b/tests/acceptance/machine_mips_loongson3v=2Epy
>@@ -0,0 +1,66 @@
>+# Functional tests for the Generic Loongson-3 Platform=2E
>+#
>+# Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>+#
>+# This work is licensed under the terms of the GNU GPL, version 2 or lat=
er=2E
>+# See the COPYING file in the top-level directory=2E
>+#
>+# SPDX-License-Identifier: GPL-2=2E0-or-later
>+
>+import os
>+import time
>+
>+from avocado import skipUnless
>+from avocado_qemu import Test
>+from avocado_qemu import wait_for_console_pattern
>+
>+class MipsFuloong3(Test):
>+
>+    timeout =3D 60
>+
>+    @skipUnless(os=2Egetenv('PMON_PATH'), 'PMON_PATH not available')
>+    @skipUnless(os=2Egetenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
>+    def test_pmon_BLD_serial_console(self):
>+        """
>+        :avocado: tags=3Darch:mips64el
>+        :avocado: tags=3Dendian:little
>+        :avocado: tags=3Dmachine:loongson3-virt
>+        :avocado: tags=3Dcpu:Loongson-3A1000
>+        :avocado: tags=3Ddevice:liointc
>+        :avocado: tags=3Ddevice:goldfish_rtc
>+        """
>+        pmon_name =3D 'pmon_BLD-3A3000-780EMATX-1w-V1=2E10=2Ebin'
>+        pmon_hash =3D '38916ee03ed09a86997b40c687c83e92'
>+        pmon_path =3D self=2Efetch_asset('file://' + os=2Epath=2Ejoin(
>+                                        os=2Egetenv('PMON_PATH'), pmon_n=
ame),
>+                                     asset_hash=3Dpmon_hash, algorithm=
=3D'md5')
>+
>+        self=2Evm=2Eset_console()
>+        self=2Evm=2Eadd_args('-bios', pmon_path)
>+        self=2Evm=2Elaunch()
>+        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing=2E St=
andby=2E=2E=2E')
>+        wait_for_console_pattern(self, 'Shut down other cores')
>+        wait_for_console_pattern(self, 'Waiting HyperTransport bus to be=
 up=2E')
>+
>+    @skipUnless(os=2Egetenv('PMON_PATH'), 'PMON_PATH not available')
>+    @skipUnless(os=2Egetenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
>+    def test_pmon_A1101_serial_console(self):
>+        """
>+        :avocado: tags=3Darch:mips64el
>+        :avocado: tags=3Dendian:little
>+        :avocado: tags=3Dmachine:loongson3-virt
>+        :avocado: tags=3Dcpu:Loongson-3A1000
>+        :avocado: tags=3Ddevice:liointc
>+        :avocado: tags=3Ddevice:goldfish_rtc
>+        """
>+        pmon_name =3D 'pmon-A1101-2=2E0=2E8=2Ebin'
>+        pmon_hash =3D 'cc40276213cfa20922720f183b92ab61'
>+        pmon_path =3D self=2Efetch_asset('file://' + os=2Epath=2Ejoin(
>+                                        os=2Egetenv('PMON_PATH'), pmon_n=
ame),
>+                                     asset_hash=3Dpmon_hash, algorithm=
=3D'md5')
>+
>+        self=2Evm=2Eset_console()
>+        self=2Evm=2Eadd_args('-bios', pmon_path)
>+        self=2Evm=2Elaunch()
>+        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing=2E St=
andby=2E=2E=2E')
>+        wait_for_console_pattern(self, 'godson2 caches found')

