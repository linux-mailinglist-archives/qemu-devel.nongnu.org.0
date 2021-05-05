Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258C374BF4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:33:36 +0200 (CEST)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR1L-0005Dd-8C
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsS-0008CE-At
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:24 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsQ-0000cg-10
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257062; x=1651793062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wAdLscB027NRqcQ0ba/KeWpvwnrXo8RKVmBCua1qbhw=;
 b=ZdmTTjShA5QVKWN/wkKWRV8+d+hFjSQyS55tlNihHSJPG5gOv7uXODnP
 j/5kVZEXg3dV4WVu8Nc3YAERf93HXpET9jwo1xYWj60v9aLtSBq6OTb0p
 C286/IkxGzu57vUIw41vNqGO90zqUJXGb5F6cG8enw6tJXS1dhGfKYj8W
 ks+Vq+gRdsbtcxlTEUxDPzdHyd8rUKn21JfavnLlqVlxRN2U5g0snh17P
 ns71Ypp1mxSAToy3eAkFQiCds2FNhfOnlvQcaJBDAlqjknj9RSW/5Ole9
 T+GxNNHX84Wco3UV4RH4Om9evg5XS1M0oej3ihDdcjxks6+6EkoHKohR1 Q==;
IronPort-SDR: EFH6azAkANJoksId1bsxNCyhGG4qCqC11ZFn+ZVvPpxTCZY6cgNneAQEoj/25edzh9hTGezbJE
 6gZsw9fY+SQvbkQxrhwO5zQsQ/i0A2b0/A0xDT5/Q3jwk3BTYBDDvVs/BD+QbAwqnyY0n0a1tD
 sV6szfRvJDyK6NczFp4b9OdlBQ0UDAjWMegmwO/kX+hReMjZz+/uxqCMgtb1YQMQFV6sovbpXQ
 CNjNChNlZ57FVIYRWuNinmLEXF0G/C566IY70V1kquyrr5/Qe++CMar0d/cAgDdSNATTPXdhAe
 Jyg=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585935"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:21 +0800
IronPort-SDR: p/9VmucJ9ZBNJzj+wxjCxsP+uFCQ7/FRQ61RoXHm+Kb4LwEhk6TLvwK4OWsaik++kU/qlnot7s
 rbqUT2v+idFVYw/u30MScilttB9XTv+l4PCRed7pmGFloaTM3sXgEXL8PYU1ao0fN/Wpcir2C1
 w32whrRDkf1xFrN+1wPQ9gg5cxZo28XltLxTEUXuHq5G4bf1Qik1iQtGymQ873v7zew/wLyUEV
 2ePdY0TN+TCOZeRQAoY8AtXpEbSZ537gxcU37EvM7fJl9oQ1eaaWECNHTKn0Jrg7FDi8aMlhX5
 +a1L7jQHe5H20QMr4cWGJ4W9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:02 -0700
IronPort-SDR: x1rAczrH2No/dK6+9fbaKwls99E25HkK3cTjGXy4haAjgRRxiRyTatKSXQcZnjKe/4uyQzAtTx
 AvUPesU4SAWmeBIPVOqL9J/Fsh7O+xYPRsHzHy5yP0LjtbsY1IiiNFjxrhjg9sQy4hxo4Imv8k
 GDYFT2sBlpjn5/PH2G5u4U4rAATgmamh6wkGY2uahZGj/POtKc6ukfl3S9VtRaIqrUoelbXo72
 ZArk7K3LcAOyU52pfXGxuXB5UV3znpvy1y8ymXX4BHNrN5OjAZ2gm00FMI4uzqFLdYxCWIBtu9
 yhM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:18 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 19/42] docs: Add documentation for shakti_c machine
Date: Thu,  6 May 2021 09:22:49 +1000
Message-Id: <20210505232312.4175486-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Add documentation for Shakti C reference platform.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210412174248.8668-1-vijai@behindbytes.com
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
[ Changes from Bin Meng:
 - Add missing TOC
 Message-id: 20210430070534.1487242-1-bmeng.cn@gmail.com
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/shakti-c.rst | 82 ++++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  1 +
 2 files changed, 83 insertions(+)
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
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 8d5946fbbb..4b3c78382c 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -67,6 +67,7 @@ undocumented; you can get a complete list by running
    :maxdepth: 1
 
    riscv/microchip-icicle-kit
+   riscv/shakti-c
    riscv/sifive_u
 
 RISC-V CPU features
-- 
2.31.1


