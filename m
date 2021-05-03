Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F57372310
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:38:55 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhDK-0003rM-IN
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqF-0005k5-T1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqB-0000Fd-US
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080099; x=1651616099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0ei1bMRBG6Oy5NGIpqoEne41CBpqzCXYEnQdZ/sbE4=;
 b=Q0o7Y5/7g1chlnIlRFF7k0yHbDf3P5Oylx85ep/pnZnZY8OCVzvmfYOH
 3D8sFFAERKugfz/aXFt4Hhu+Q8/P7UNAcajFHDWpf9CTwxLkPcb1pBGoI
 4zb6oaVnlvCL8273EG/a4U5WpNTSH0nRatv7mifd0etaOGE7TeoW5R68b
 N6HEzk6Mkvlzb16VRm3pZdBBHS247spclXG4anTVnLTUkBJiXZ6FYytPw
 Yw1H7avc9nmeTIFW9boRxLfBl9V6AufvR7OAXcdVNEGuna3yA6RbgejBF
 K1EH4o/1qsDPfjBQV9M8sT40q5p+aJxuuEP3iPDPbyKeQUJZiKaixs7d2 A==;
IronPort-SDR: wLBFRWPORpg08O93sNfmdF9J4ruRorf0PARXcQS9R7qBQNUaibY5nO/57lo37W7DjNzlyFgxzI
 XOgzDGMmLpNsqilooFukdyAY4+cXADC3F+OOaACN/lJhP675i2XBCFYJDYjgtLJKLIg/WBgiUE
 BmncU/tCNOfc4lCPVoibel+xxLfuQYcPV6NcN7z/1LW2H4QTJYnIGD1vWJ/GAGbeuVwTcxjKzj
 iA6zVLvwYOjeVrNT/7r4+12Mm0ezZoOPDoc1pbpbUjnHPTHVWvxf+AcA1V0JkjldXqaStzzlMt
 aWw=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114661"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:42 +0800
IronPort-SDR: Q4ZBt7Cfvyss8OhTpDk7gZzisZpwFrR6HexDyt3Hj3f9PQOXhs9oOc2oGCOS/s7psLjIXvN0MY
 snqyPTCUMGybJ5FJBhJ062ERHmb3ru/D23MOv4goGEBKckY4HmFSjn7ANS9DtmJ0JLqIAbPXnw
 oQa8kqyMKTYm/SwzhI6n+pgwVyWk8yoAO8nziKSqUZo7lX6Y+DS+u4rYQyNowYVZY9TSjhuwsj
 +FqgIqVmKHo72JwUQ3MuPZ9H3nVXtxMC5SpDvqtWflD0eSmOEYKFoccMCSjIXBHLHn3vEKG7Ce
 kOzrvO1MUvY9el14ZGeS8ymz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:53 -0700
IronPort-SDR: hyp+MhIcNIVI8Bgegsfd1HDFjBeJ3ylPCBd5ShzDGCewxX6qeYpebChIs6ghLfLW+lCSj+rkfm
 xIKs2H/Fqc0OCczB+qabaaz8cLxhheGHxSN8JmHhdskiGuuniumPVPkSE6z7I1SvqvfEyfvfT0
 oGodYO3IjlT6PyGTYSmkaZSZI+oPeXBWuEAcEVtLZOTNHTP12AwHhYE3zI437PKyGP/spmmuaJ
 +Emkp53gMk7YJIzsgmbQ8rR2smRRIdDQka2wFI9NSZ9SYZKU8DN9zFke8T13S8RaFwonGbWEmc
 ojU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 19/42] docs: Add documentation for shakti_c machine
Date: Tue,  4 May 2021 08:13:04 +1000
Message-Id: <20210503221327.3068768-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Add documentation for Shakti C reference platform.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210412174248.8668-1-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/shakti-c.rst | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 docs/system/riscv/shakti-c.rst

diff --git a/docs/system/riscv/shakti-c.rst b/docs/system/riscv/shakti-c.rst
new file mode 100644
index 0000000000..a6035d42b0
--- /dev/null
+++ b/docs/system/riscv/shakti-c.rst
@@ -0,0 +1,82 @@
+Shakti C Reference Platform (``shakti_c``)
+==========================================
+
+Shakti C Reference Platform is a reference platform based on arty a7 100t
+for the Shakti SoC.
+
+Shakti SoC is a SoC based on the Shakti C-class processor core. Shakti C
+is a 64bit RV64GCSUN processor core.
+
+For more details on Shakti SoC, please see:
+https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/fpga/boards/artya7-100t/c-class/README.rst
+
+For more info on the Shakti C-class core, please see:
+https://c-class.readthedocs.io/en/latest/
+
+Supported devices
+-----------------
+
+The ``shakti_c`` machine supports the following devices:
+
+ * 1 C-class core
+ * Core Level Interruptor (CLINT)
+ * Platform-Level Interrupt Controller (PLIC)
+ * 1 UART
+
+Boot options
+------------
+
+The ``shakti_c`` machine can start using the standard -bios
+functionality for loading the baremetal application or opensbi.
+
+Boot the machine
+----------------
+
+Shakti SDK
+~~~~~~~~~~
+Shakti SDK can be used to generate the baremetal example UART applications.
+
+.. code-block:: bash
+
+   $ git clone https://gitlab.com/behindbytes/shakti-sdk.git
+   $ cd shakti-sdk
+   $ make software PROGRAM=loopback TARGET=artix7_100t
+
+Binary would be generated in:
+  software/examples/uart_applns/loopback/output/loopback.shakti
+
+You could also download the precompiled example applicatons using below
+commands.
+
+.. code-block:: bash
+
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/sdk/shakti_sdk_qemu.zip
+   $ unzip shakti_sdk_qemu.zip
+
+Then we can run the UART example using:
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/shakti_sdk_qemu/loopback.shakti
+
+OpenSBI
+~~~~~~~
+We can also run OpenSBI with Test Payload.
+
+.. code-block:: bash
+
+   $ git clone https://github.com/riscv/opensbi.git -b v0.9
+   $ cd opensbi
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/dts/shakti.dtb
+   $ export CROSS_COMPILE=riscv64-unknown-elf-
+   $ export FW_FDT_PATH=./shakti.dtb
+   $ make PLATFORM=generic
+
+fw_payload.elf would be generated in build/platform/generic/firmware/fw_payload.elf.
+Boot it using the below qemu command.
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/fw_payload.elf
-- 
2.31.1


