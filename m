Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BF674E56
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0Q-0007xf-Im; Fri, 20 Jan 2023 02:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0P-0007xN-8R
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:09 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0N-0004pU-5p
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200407; x=1705736407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rawTC32xlC8ut2sfg3SnNJDmDpHewXm7PUHLZFwL2D4=;
 b=JjxhijXd9fwBVClu6JBnkdFdH+ELLPugP7mGMuRQBYt6RAhzhkRgpnE4
 J/SK7seTORSiijOU5Xtdz/ivWbb9PesOZTCk1EaOAH4ACMdPtaMO2guct
 NO3R/zqWrwL3jlW9QaV/qVo+PBpaUGl4miV6WWy+R+Ryyxh0hzJtKzzrs
 oKE3OFYEUlXBknP0SjNm+EE1GgYXLhsp9pyneo27Un+o2ccaZuYDergrx
 Ni47Z0CTe4fG1/xWklBYnzsrU/NahqCENn38JBjNLPiALokj6Gu62xBrC
 mUgA9DwVXsTy8sminsbwJRjbXfxh3SN/AAmvErJO/67gx9y4lDNGBhqio g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176703"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:51 +0800
IronPort-SDR: 6CvmtfgV5UaOgY+ngsUaymtoniESM7O3IlAGW4HHbF4fCWQ6pW2TVuyfuwALK8lQcZNs81Kz+0
 nghSWtO/3vCH39j8Hd/nB3dPP0JFNpGcGoJXy2QMqomttOfrEqOuaTBvJShneOIJCkIId51ufZ
 +DzmOMArg+ePnzIuKX/FE6hGnr3PiVlmyFnsUKrcbJGwLXAPXGLDCQWuWZu3GOdJTRt4rBMH+Y
 +9pVULcJOfXmr3VdRobF3nNdzd9EJ88rxOTI/p8OoztI1gZVDJxTXt6vgyYCZh3FgwukwdDvZG
 7o8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:29 -0800
IronPort-SDR: smypVSQttYLFfXIrqpXsciYeEP26/5+4nqjqBObkfAhENTtHij8hO2MDbZr8Kq96Db5vg6TUVh
 0rq+sVUENOWaOrDFZorPWac71d7mVqE6HJI92O+Yul6cLPr2iYOxofbNrXqOwY+B6v5ltzzLYb
 +Taob41juqMwBQ/K19wNVNGTYvwJfX5Ma6AJk5jO95GUWLCSOQX2HYzMW1nPATmse1Bq382GTS
 6xRsH0H//78tuzfH09Rjm/U55vCnAEaRKSGtrkzD9EI/JCG2uVvqZmfn5TAzGRvCbPaV89LsA3
 PPc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxM0Skxz1RwtC
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200390; x=1676792391; bh=rawTC32
 xlC8ut2sfg3SnNJDmDpHewXm7PUHLZFwL2D4=; b=rA5kSpC385/+7wtb1H72mlL
 QZuPIHf62Kila5ebywgPsUG/cvD+bdMiu2ZlaS8dr+xMmzDUHeFCzAKu9fR3lwdV
 Q/VN+IPpDEzIqYBh09OjVZ2ibcwiT+zRhJRlPjlJ1hnYKvi0y/0SqUqSC2cTMoEu
 AbwIl3Xi8AJxvZ9KjWweP/zVk8cwCdJatj++EMZH8S0xAuPbf/cG3txhEeAyPkse
 Rj86/ErcKUYpEF0M2px7zxX4MUCSYxTq2ujB2YtjU/WNcHo3zt8ghBHzYfdfJRW4
 +auGJKb6tKPdZp7T3rRvEQzcQz+ldhdlUW2bjEItkypXuDF4UVrtdd+WNCTgQXw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hi8DXKak1l0T for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:50 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxJ0Tgdz1Rwtl;
 Thu, 19 Jan 2023 23:39:47 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/37] tests/avocado: add RISC-V OpenSBI boot test
Date: Fri, 20 Jan 2023 17:38:50 +1000
Message-Id: <20230120073913.1028407-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

This test is used to do a quick sanity check to ensure that we're able
to run the existing QEMU FW image.

'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
RISCV32_BIOS_BIN firmware with minimal options.

The riscv32 'spike' machine isn't bootable at this moment, requiring an
OpenSBI fix [1] and QEMU side changes [2]. We could just leave at that
or add a 'skip' test to remind us about it. To work as a reminder that
we have a riscv32 'spike' test that should be enabled as soon as OpenSBI
QEMU rom receives the fix, we're adding a 'skip' test:

(06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:
        SKIP: requires OpenSBI fix to work

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.186=
0569-1-bmeng@tinylab.org/
[2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D334159

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Tested-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tests/avocado/riscv_opensbi.py

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi=
.py
new file mode 100644
index 0000000000..e02f0d404a
--- /dev/null
+++ b/tests/avocado/riscv_opensbi.py
@@ -0,0 +1,65 @@
+# OpenSBI boot test for RISC-V machines
+#
+# Copyright (c) 2022, Ventana Micro
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado import skip
+from avocado_qemu import wait_for_console_pattern
+
+class RiscvOpenSBI(QemuSystemTest):
+    """
+    :avocado: tags=3Daccel:tcg
+    """
+    timeout =3D 5
+
+    def boot_opensbi(self):
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    @skip("requires OpenSBI fix to work")
+    def test_riscv32_spike(self):
+        """
+        :avocado: tags=3Darch:riscv32
+        :avocado: tags=3Dmachine:spike
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_spike(self):
+        """
+        :avocado: tags=3Darch:riscv64
+        :avocado: tags=3Dmachine:spike
+        """
+        self.boot_opensbi()
+
+    def test_riscv32_sifive_u(self):
+        """
+        :avocado: tags=3Darch:riscv32
+        :avocado: tags=3Dmachine:sifive_u
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_sifive_u(self):
+        """
+        :avocado: tags=3Darch:riscv64
+        :avocado: tags=3Dmachine:sifive_u
+        """
+        self.boot_opensbi()
+
+    def test_riscv32_virt(self):
+        """
+        :avocado: tags=3Darch:riscv32
+        :avocado: tags=3Dmachine:virt
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=3Darch:riscv64
+        :avocado: tags=3Dmachine:virt
+        """
+        self.boot_opensbi()
--=20
2.39.0


