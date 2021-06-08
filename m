Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74E39EAD9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:37:48 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPkZ-000676-5K
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdX-0000Q1-R3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdV-0004Fk-Pk
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112228; x=1654648228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kP+k/EAWnoGFZ2cQ6hA3zOL91PKjPYWONLT+lao/1F4=;
 b=jpI/CL8mjHDgDke9EpytlPvvQR1Pm/UXxiKWvb+USxQ1omSTg7sfFSqm
 bmzx2h/XHX0WQxtCGayyBcA/GebcKVYq12kBXIOWrkClvD3yMjyNRBoZu
 V3eWlKXlDi8foKZbrA+MdVH8a/rQaiCqUA5J3T+ZNUtwBYEJXG5lIL9Gf
 /IRB+Di9nRMEWhvPNKFlmFqgaTp5TmRL3MNDH8aTof/1cLSaeW/n14mTO
 x0G4NJIS417k4LkrBhyLSJKFJvkZfFqUWu6z6EbcrtSWw0S9+eKFhVa7+
 UrRE0ANS6rEnnqQL6NGXai4TpyCAzVQvj1eyqa0yeIPV5bOF15Gd0fyND w==;
IronPort-SDR: 9t+iwQO82AJYfLAKQw2gdDWTbUtnGcD/b6cbaEdQg1rXV8/sQzlNWsZeKm3AcbFskXR/cUJpTT
 Yv3OPeEdj11dNKcWYJKG8aSpCrX4cd6XFWZM3YX90AUr/3V3hKvcT4BU1GnrMSIZ4slLaqzql/
 LqDroJ36dnDh572RIGoRKee65kCwvuw6J1sSbgUu9194o5z+kkIVag11BAIxy7EHgc7crxkSg6
 /YFK+zMCzlJPKc7wMeI3voRg/A6quCxo1TirtzngtlC9qh22UJ+w0ZFewNBpPIseM8/BxD0lsy
 CwU=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087354"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:28 +0800
IronPort-SDR: SohZ0gQOMnnmfxXIjgown7vGEqwt9UIxb++TUSSa7lxKLpUm9OYUrrqzGo2ex1H5VnGrisX5ms
 cF4p7f5t9mEcukaO7qVaES10nBObbSrX+eIMdRI9FsUjBWc4UPTPZuJqN7/7oz/TOR+2lRGa2I
 HLdidjcEWjFrGGTeaIR9q0+2mii5jA1DgH3+t7xBQBQyEVJD5X7KWnZmKa5jeZ6mIY5rkgDCTT
 TphbPCptFljKHMzsEaxKoHHwsvPdbWPH3PFPUAM59+fkSNFlxiO8uh8ICQVsJU9G0QcSupr2Rt
 IHSUmwbXhWX7O9oE4SpK+pUx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:35 -0700
IronPort-SDR: TynNMtzUdwDRFjUVnddoyqV1K33gTZD/w7RJpr5qyWt2w6t6PyHdk+8q4jIL26DiyEBq4ILdxM
 iddyldnNirNJst/GIF8lcELrr5aMp3LPK+wDBS+Bhku6vU0ygtQY/JThZgSeLgFvgxmGDt2dVQ
 Qrbdjyj8Z/FYSoAFwQpcuWqPgM9kI4aLAOnDkrQ7h2odvfNlWLeOOPVpMTkhzXseZwYkbORFFg
 RSXJRbHc6ISqby3DIzF1MNL+P6dVY68KBJta6EmDle4AYzkteoj9gjAGJjeAKKjZT9okozXdBM
 5uw=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 06/32] docs/system/riscv: sifive_u: Document '-dtb' usage
Date: Tue,  8 Jun 2021 10:29:21 +1000
Message-Id: <20210608002947.1649775-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Update the 'sifive_u' machine documentation to mention the '-dtb'
option that can be used to pass a custom DTB to QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-6-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/sifive_u.rst | 47 +++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index dcdfbda931..32d0a1b85d 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -36,12 +36,21 @@ Hardware configuration information
 ----------------------------------
 
 The ``sifive_u`` machine automatically generates a device tree blob ("dtb")
-which it passes to the guest. This provides information about the addresses,
-interrupt lines and other configuration of the various devices in the system.
-Guest software should discover the devices that are present in the generated
-DTB instead of using a DTB for the real hardware, as some of the devices are
-not modeled by QEMU and trying to access these devices may cause unexpected
-behavior.
+which it passes to the guest, if there is no ``-dtb`` option. This provides
+information about the addresses, interrupt lines and other configuration of
+the various devices in the system. Guest software should discover the devices
+that are present in the generated DTB instead of using a DTB for the real
+hardware, as some of the devices are not modeled by QEMU and trying to access
+these devices may cause unexpected behavior.
+
+If users want to provide their own DTB, they can use the ``-dtb`` option.
+These DTBs should have the following requirements:
+
+* The /cpus node should contain at least one subnode for E51 and the number
+  of subnodes should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0" if using with OpenSBI BIOS images
 
 Boot options
 ------------
@@ -122,6 +131,32 @@ To boot the newly built Linux kernel in QEMU with the ``sifive_u`` machine:
       -initrd /path/to/rootfs.ext4 \
       -append "root=/dev/ram"
 
+Alternatively, we can use a custom DTB to boot the machine by inserting a CLINT
+node in fu540-c000.dtsi in the Linux kernel,
+
+.. code-block:: none
+
+    clint: clint@2000000 {
+        compatible = "riscv,clint0";
+        interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+                               &cpu1_intc 3 &cpu1_intc 7
+                               &cpu2_intc 3 &cpu2_intc 7
+                               &cpu3_intc 3 &cpu3_intc 7
+                               &cpu4_intc 3 &cpu4_intc 7>;
+        reg = <0x00 0x2000000 0x00 0x10000>;
+    };
+
+with the following command line options:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 8G \
+      -display none -serial stdio \
+      -kernel arch/riscv/boot/Image \
+      -dtb arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb \
+      -initrd /path/to/rootfs.ext4 \
+      -append "root=/dev/ram"
+
 To build a Linux mainline kernel that can be booted by the ``sifive_u`` machine
 in 32-bit mode, use the rv32_defconfig configuration. A patch is required to
 fix the 32-bit boot issue for Linux kernel v5.10.
-- 
2.31.1


