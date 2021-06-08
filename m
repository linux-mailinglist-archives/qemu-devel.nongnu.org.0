Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67EC39EADD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:37:58 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPkj-0006PO-L8
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdo-0000wt-W2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdi-0004Rf-VL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112242; x=1654648242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnNz0kjWK50XJoN1G9rYZSblhPKufIBywPwNscH4p7M=;
 b=gJycmH3K0K2bQhOGRpyhECFVQHeJ4S5qnAfM7Lidp5ef9wNa/N0SoH2p
 KSTAmRQG2MOl2JoGpK2TKiujuB/1idF3tb1z9nB6ZtovA9TpVwylBgRZB
 4M/XrOYGTiMHu54WcMy7aDeyGMC9L63WzlFHGz/H36k0NtOQD6boQsW5+
 AI04W/bOrJbNrkIZBlVDkQdtuPJOEio2FOJ/bPk6hJeEXtcHxH8Yiz03h
 PYGyMwmXn/3PKopnp98ypEhUoXwz/okP80O3SMPFZWXD68FWr3BR7O22U
 8/IjGhRcKtxXO4ove9YnUZNC/TNzmlFeLdnjMUFPVWujJW+8t4MDxOygg g==;
IronPort-SDR: rVH1HRFEzfJB3QzFccYRiEfD4+sR/LTR58AN+oc7MCPy+C2ixuuVGvXHDRiDtu7YzRexbwZXpB
 gdqpa0L++3wmjeDzpUe28XcpGJLHo3ZqbxfrUSXH2w4vvNl4EyXPAVWHElZ6SkT+Ax1PPWqawq
 yRos8jMGlsGqkyG2Vmt5oKrBAd1auuLcdg35YwLvjEoRGCg+1RXk+W6b5PWyrXHSU7e2S7fqBt
 WmQOSXm+5ihCjR9ocH/1j6BakfHvU14sRjC1L6Awa0S+zPP34qf+ImtHRUM3dR8Ur63x0z1210
 X1E=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087365"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:40 +0800
IronPort-SDR: 3wn9AAFXERUbHgXZjyI870E/hGZO1V++y1u/YfBhq/Tb9MYAuXrrnsez0kfu6oajU0kSc6r8uT
 KzzITx1TPZbrpSCPvyHs7auHTpasefIEcaFWbGHDurRRwbFBEp/uOAIe0xGOnCkwZ4jcmoquHJ
 SFQEQ4HD045Ud6hOBmndWrB7apm5S6qDAdMbiRcjEeNhweODOkk4gVTcqPEVtMxNlilbbJkptp
 5TiRoa3Xpl3VxLBkTL0pcK2q25nN1CZH4p+l5DVWUDUW/fwzMK+dr5S6WD9okluux4pjDONQGd
 g8S8m5dp+54+Io7JJWEnmVlc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:47 -0700
IronPort-SDR: a31/CiGyhN42g5B3fT5ky58KL+ECA9zRG9nFyGMWvTU70Rix7YArvHh4DaSsutxUmbyFdsqO/E
 7bxcNj49tvaQkuVepNL5MSfsle+R0GF+GuZwSduHCjd+8NM6hH2ZT4XPAalsWoYBdNDVGn4BIZ
 VXfiGkUWz8s/90NPiei2gdeWVdKCoep9JJyDIQIxVUpxHPytzZFU2D909Z+DRBAnj7H5XhtREZ
 1KXk4v1DLrOUHUWswkj4OSx9kFUqFKFz3tYBRHQ0T07EdEgoAN3sUjYGy2DvERsUkuMRo03+nK
 m78=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 10/32] docs/system: Move the RISC-V -bios information to removed
Date: Tue,  8 Jun 2021 10:29:25 +1000
Message-Id: <20210608002947.1649775-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU 5.1 changed the behaviour of the default boot for the RISC-V virt
and sifive_u machines. This patch moves that change from the
deprecated.rst file to the removed-features.rst file and the
target-riscv.rst.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 4f1c261e7f69045ab8bb8926d85fe1d35e48ea5b.1620081256.git.alistair.francis@wdc.com
---
 docs/system/deprecated.rst       | 19 -------------------
 docs/system/removed-features.rst |  5 +++++
 docs/system/target-riscv.rst     | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index abbf8243a3..e2e0090878 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -52,25 +52,6 @@ pcspk-audiodev=<name>``.
 ``tty`` and ``parport`` are aliases that will be removed. Instead, the
 actual backend names ``serial`` and ``parallel`` should be used.
 
-RISC-V ``-bios`` (since 5.1)
-''''''''''''''''''''''''''''
-
-QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V for the
-RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes to the
-default behaviour to avoid breakages.
-
-QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``.
-
-QEMU 5.1 has three options:
- 1. ``-bios default`` - This is the current default behavior if no -bios option
-      is included. This option will load the default OpenSBI firmware automatically.
-      The firmware is included with the QEMU release and no user interaction is
-      required. All a user needs to do is specify the kernel they want to boot
-      with the -kernel option
- 2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
-      to the user to load all the images they need.
- 3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 1d22195b1d..2b21bd39ab 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -126,6 +126,11 @@ devices.  Drives the board doesn't pick up can no longer be used with
 This option was undocumented and not used in the field.
 Use `-device usb-ccid`` instead.
 
+RISC-V firmware not booted by default (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``
+for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 4b3c78382c..a5cc06b726 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -70,5 +70,16 @@ undocumented; you can get a complete list by running
    riscv/shakti-c
    riscv/sifive_u
 
-RISC-V CPU features
+RISC-V CPU firmware
 -------------------
+
+When using the ``sifive_u`` or ``virt`` machine there are three different
+firmware boot options:
+1. ``-bios default`` - This is the default behaviour if no -bios option
+is included. This option will load the default OpenSBI firmware automatically.
+The firmware is included with the QEMU release and no user interaction is
+required. All a user needs to do is specify the kernel they want to boot
+with the -kernel option
+2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
+to the user to load all the images they need.
+3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmware.
-- 
2.31.1


