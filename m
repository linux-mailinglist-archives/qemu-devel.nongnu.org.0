Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E461039EABC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:32:48 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPfj-0003FU-W4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdU-0000K6-Oo
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdS-0004Fk-O5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112225; x=1654648225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYZCfbmqDYM1ef+uXSltaFNoEyKdG2pAPGPEmS014Qo=;
 b=ZJiuc7bLTAJioc+jG9K9om2yLmh7i9SAYkyCZljBNaDEKexVNUA0R6iJ
 hPkjzPWQ4XGaxeHThXTlGLJFDYpm2gt6sDUjY/DLjyTtpxh42iCMNggdy
 2plihiy156jR+OHXaTqppHvL587NTLKeev0Nq2VpRQaby4xtC3Up0TX1y
 5GfuWtVQwUsF8+A+YIq5i+zFxhJVB6qaobW3QvIweQkyNaAEODcU7/rD5
 0PMnjwV504yqBW2ucPBWwwg3svtai6GcmdmwYXlHsDTP/C9fNCE8Gl+zx
 suCMsIDRfeD8euaEIEIfSOhCK2s1XrvihI2K3jtpOsP2EJvL4OGIBkgHP w==;
IronPort-SDR: l0834QCcEiN+vzDUuEOp2f0FvuRIOwAb/YgFoMU1f5CwIe5kUUM/Y8MPZFHEy+GHaqek8rttL+
 zRb/fLFMReGmKdrStXacdk87O7467zwSxePG3bvA6PqQrDlSI1cKSCN7o10PlBJ/8zLWM4JnKc
 gDi7Tp3NIjVMeJ/JnLxVAsfs4dIkF989GlD7hus7cFZVQiNcqb3pB4yk2m3fjyxZ2DYvlM0hIh
 O3ParpF98pUjjTzxnh1xs6A83xi7xZ9zB9uqCwkA9/CrYD3SFhffZfXLPF6vT2UJXUMqtjx1je
 utk=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087350"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:25 +0800
IronPort-SDR: JXsJISZ8F+aCzwjjwlQhI+pS891C1j/38vUrOh9c1KFXrDe19sOTlCnnZMF/Tm/5qIyYyMfQww
 NkO9C3qvwRMtTlcWjT9StvWknSeu7rIXgwmEexwIssRqL80ZRKWroJ4sHbil5I1e8xajt8hSqO
 gzjArDtJSu0wOGYhPt+uuLTd1zssdToZVRYM6lHpBNFuAuv83XT29vo8pJlegMKPwAueo+rmF4
 0zN8KGiliozHU74aQjoAKiAd8uhWIIJmbQALxdbAbt/P1/A2W4IwVUS2jQV/K0Tt/YlJEw/iHt
 3ZIoyeuWS2VXu987VE4R1TSk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:32 -0700
IronPort-SDR: 9Zl7PBAkJ8dFNREWRb06pbZmN/6CVb7RxemeMmolKQ2gb09EmVxJjVuSU+LFOqQkgul/rBF/EN
 i61QPDGvvfDoIqMLfQ64rQ58SQBzbvTFWqtM0be+HB8qoffHTCKEBD50RMECZ+R7RcyLnqDSp/
 038INFrzpoYcojrs2OqApTaUqYgDX/8frZLVB9Bv7R1YcIo2yKUJp3Y7vOT9aVFKJrqo6NBNZg
 bGGi/hZ43h7czSAyv6PliON4+nA28DsXFufiTTqys+EoEvSaKHW4mnQcofuKpjpnJ31klTiJI9
 Crs=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 05/32] docs/system/riscv: Correct the indentation level of
 supported devices
Date: Tue,  8 Jun 2021 10:29:20 +1000
Message-Id: <20210608002947.1649775-6-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The supported device bullet list has an additional space before each
entry, which makes a wrong indentation level. Correct it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-5-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/microchip-icicle-kit.rst | 20 +++++++--------
 docs/system/riscv/sifive_u.rst             | 30 +++++++++++-----------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 4fe97bce3f..e803131763 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -15,16 +15,16 @@ Supported devices
 
 The ``microchip-icicle-kit`` machine supports the following devices:
 
- * 1 E51 core
- * 4 U54 cores
- * Core Level Interruptor (CLINT)
- * Platform-Level Interrupt Controller (PLIC)
- * L2 Loosely Integrated Memory (L2-LIM)
- * DDR memory controller
- * 5 MMUARTs
- * 1 DMA controller
- * 2 GEM Ethernet controllers
- * 1 SDHC storage controller
+* 1 E51 core
+* 4 U54 cores
+* Core Level Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* L2 Loosely Integrated Memory (L2-LIM)
+* DDR memory controller
+* 5 MMUARTs
+* 1 DMA controller
+* 2 GEM Ethernet controllers
+* 1 SDHC storage controller
 
 Boot options
 ------------
diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 98e7562848..dcdfbda931 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -9,21 +9,21 @@ Supported devices
 
 The ``sifive_u`` machine supports the following devices:
 
- * 1 E51 / E31 core
- * Up to 4 U54 / U34 cores
- * Core Level Interruptor (CLINT)
- * Platform-Level Interrupt Controller (PLIC)
- * Power, Reset, Clock, Interrupt (PRCI)
- * L2 Loosely Integrated Memory (L2-LIM)
- * DDR memory controller
- * 2 UARTs
- * 1 GEM Ethernet controller
- * 1 GPIO controller
- * 1 One-Time Programmable (OTP) memory with stored serial number
- * 1 DMA controller
- * 2 QSPI controllers
- * 1 ISSI 25WP256 flash
- * 1 SD card in SPI mode
+* 1 E51 / E31 core
+* Up to 4 U54 / U34 cores
+* Core Level Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* Power, Reset, Clock, Interrupt (PRCI)
+* L2 Loosely Integrated Memory (L2-LIM)
+* DDR memory controller
+* 2 UARTs
+* 1 GEM Ethernet controller
+* 1 GPIO controller
+* 1 One-Time Programmable (OTP) memory with stored serial number
+* 1 DMA controller
+* 2 QSPI controllers
+* 1 ISSI 25WP256 flash
+* 1 SD card in SPI mode
 
 Please note the real world HiFive Unleashed board has a fixed configuration of
 1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bit mode.
-- 
2.31.1


