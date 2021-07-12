Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53263C669D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:01:27 +0200 (CEST)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34vW-0002JX-V3
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oL-0005JT-Nq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:01 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:47857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oJ-0006u9-Ht
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130440; x=1657666440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SbSzoMijwfPI2ZTclf3G3p+iRCTsIMjZDdCadjYDN2o=;
 b=KOCzFFySEAJqfgBsmp7+9JmTDBzAmCvGJiu5UT1wOUWHqYJugU0A3Hrh
 wNKRaT8towYFhGYk9n+tycO7hShSO2YAwPH7Bm1A23nRaxerUlj4Pg4bM
 979k0L08+wWlZMnDBWeG+hEd25aXFpKddK1VVLiAuRRW7btqU6SUirZ4H
 reCUqG0951KRKGoQmdUcb7hLFRLEWe2KHSu4lptYFfEmTakYdWvX6AD7B
 07qLXEbOvepvNEiI8JqVuk17lKNc1O9q8LepBMvjbZZmDw9rIwIiOxD4/
 TkjNvHu6XYXr1ONv3wGbTCJkKjA97G7gQZ9N/QKg3yaVHPR/CAnDDDMyu A==;
IronPort-SDR: EtHSrs+sUQPPwjHQGhUrMpUuKtcEEyt9zafabq4jiiH2LilJfZmavBjvJnJSyGmFf+KZLTNNj3
 Hqfk43IG4cLye2wV7uzx13Z6XVNzMCIuFzt7VhOViISFJQk/kB64ZdtK2CU6AWXX782W9Y8gNy
 5gzlJSlUS05u8j8sItAyXTgjVgnMDdqFELgsUXgJsuul0Sm4JO4/6DTownIpiK4HpQTxR8/gs+
 P7kXoandswrHoaNMgRQ5u4hgtY2zv0Z1Yp3bjXk39fmLGKc1/fko62tG4GxyTtbTcS5D38cvXJ
 t5Y=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973305"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:53 +0800
IronPort-SDR: KovMBDMCy4V4sdunn981DxO86DQiv7F59WwiPIuko1T1Hf7/JaLScqOn4hUXdXZsnG2x5PFrPP
 nuiwQstboWtTq6nsxgEh2uCmpV8UIYhcqygZlqX8M7v9ZnIvjmZbRkrrClhVd2ErgbfwS3NBz6
 LohPITVHMoz8pi9QsG2TI9TUr33VtmbG5E1DMJb9BHZp0WzJVPTp+NnxFq6yKsFSpVTiF3zayb
 M+gLgMjtrMGMZq6zfxVLF0R/gMSVf/ZI1dEhb/Y1/3Hdi4SNmEaPYIKNPiBUIj7BKzoPETmBdu
 hEvgUVU6f8SZtkZ35awNIj+5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:58 -0700
IronPort-SDR: KsQU/4y6b/fYCIMzbbDqggKmyVBUG/8QrIKfd1gBwHm+8DICFdaelIfMNwgSMSSvx5Oq/6JWbj
 pEx+tgLsrF2zyqWYcROgCvBHDnIDL85s7DOJbmmJmdIj+iD7hMN1qJT7Ho7VVEGMUs+VEa3zWF
 f+cXjT2tyKdrkjsKQd65A5I+OqegrthL7bdtTYLJhJRW3/PA9nWrY4HjQSr+/TPI5UWnXWbY1e
 7zEww7YfSB3d5erb8tVP4UHmWxgeRqyIVOBF25+HXfqRwT2pgMF/DQKwAXqBWsVnLjDN/S7Ett
 idw=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/11] docs/system: riscv: Update Microchip Icicle Kit for
 direct kernel boot
Date: Mon, 12 Jul 2021 15:53:43 -0700
Message-Id: <20210712225348.213819-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds a new section in the documentation to demonstrate how to
use the new direct kernel boot feature for Microchip Icicle Kit,
other than the HSS bootflow, using an upstream U-Boot v2021.07 image
as an example.

It also updates the truth table to have a new '-dtb' column which is
required by direct kernel boot.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210706095045.1917913-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/microchip-icicle-kit.rst | 54 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 54ced661e3..817d2aec9c 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -47,13 +47,13 @@ The user provided DTB should have the following requirements:
 
 QEMU follows below truth table to select which payload to execute:
 
-=====  ========== =======
--bios     -kernel payload
-=====  ========== =======
-    N           N     HSS
-    Y  don't care     HSS
-    N           Y  kernel
-=====  ========== =======
+===== ========== ========== =======
+-bios    -kernel       -dtb payload
+===== ========== ========== =======
+    N          N don't care     HSS
+    Y don't care don't care     HSS
+    N          Y          Y  kernel
+===== ========== ========== =======
 
 The memory is set to 1537 MiB by default which is the minimum required high
 memory size by HSS. A sanity check on ram size is performed in the machine
@@ -106,4 +106,44 @@ HSS output is on the first serial port (stdio) and U-Boot outputs on the
 second serial port. U-Boot will automatically load the Linux kernel from
 the SD card image.
 
+Direct Kernel Boot
+------------------
+
+Sometimes we just want to test booting a new kernel, and transforming the
+kernel image to the format required by the HSS bootflow is tedious. We can
+use '-kernel' for direct kernel booting just like other RISC-V machines do.
+
+In this mode, the OpenSBI fw_dynamic BIOS image for 'generic' platform is
+used to boot an S-mode payload like U-Boot or OS kernel directly.
+
+For example, the following commands show building a U-Boot image from U-Boot
+mainline v2021.07 for the Microchip Icicle Kit board:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make microchip_mpfs_icicle_defconfig
+
+Then we can boot the machine by:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -m 2G \
+      -sd path/to/sdcard.img \
+      -nic user,model=cadence_gem \
+      -nic tap,ifname=tap,model=cadence_gem,script=no \
+      -display none -serial stdio \
+      -kernel path/to/u-boot/build/dir/u-boot.bin \
+      -dtb path/to/u-boot/build/dir/u-boot.dtb
+
+CAVEATS:
+
+* Check the "stdout-path" property in the /chosen node in the DTB to determine
+  which serial port is used for the serial console, e.g.: if the console is set
+  to the second serial port, change to use "-serial null -serial stdio".
+* The default U-Boot configuration uses CONFIG_OF_SEPARATE hence the ELF image
+  ``u-boot`` cannot be passed to "-kernel" as it does not contain the DTB hence
+  ``u-boot.bin`` has to be used which does contain one. To use the ELF image,
+  we need to change to CONFIG_OF_EMBED or CONFIG_OF_PRIOR_STAGE.
+
 .. _HSS: https://github.com/polarfire-soc/hart-software-services
-- 
2.31.1


