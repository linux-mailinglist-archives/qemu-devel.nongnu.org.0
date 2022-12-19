Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F0650653
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kO-00026U-Jp; Sun, 18 Dec 2022 21:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kJ-00022D-Jy
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:18 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kH-0001Ed-EM
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416353; x=1702952353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33ydBuzuBnZFvlbDBH6+hF4mtGaD+zrqRMjuDlazzLE=;
 b=OZgcVOU6dnU5gOLtc2jMH5Wvq6H0b32CWjA5QcBh7difonzjPqNy3fxP
 hlo9QVDVCjriMv7TJfdqtw/dwR7WwFMw7pv8vPWz5K6DuKDCi3IBUJ5FL
 1c1NURUtHxvS2kHgqPL2Wryo+RJfyCLQx69QOB7wvLXua/fHDTdxNrQwa
 MfHE0PedMdvg2eGbMfJjHKwRkyx/yRx4XU1jIoTXWdeVKgbCS0U5sQidS
 RL1yy1riTWqJfrQz8UdIrAGrNFLjUf/zazeUMThxgbGeDq9bJTIn+f4Tf
 gIMFCRo6Ctx7dNP1wdXF9UTdMw4JOIRvrN0qYeNM4ttMdhZfEUGlttYkO Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056841"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:57 +0800
IronPort-SDR: eLGblgbur4Q1LoW+/IBS1KdE9BkuvP57fzUCcQlyEAm7TWRorCwhW3Ocy4tRlofiYZf/IbtVSn
 /m1CbIPaGYSjAq2p/Q0LUdsRiA5viczDcA+rzq+8omqh9xeGQs8t4yGM1oBnCa8MX01QghMN1o
 HnyK00WnHPXxlRJIViUUTx/CNdcGAbSKrVvheenry1peHiySedM8VdLlm/wKv32PA5W0xt+MGD
 2FtaSmH1tFHq8xNxYOz1kKzjyvMroX4dsPGymSYHvFxf6Map7etuBGdjW7Cb3/940yLI+5R8a8
 Lag=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:14 -0800
IronPort-SDR: w8MJ650R+gdzzZzRE3Bx+VbVvpMepO8sWCfHwttjU37AmHc8RgOZ435ePQPd4D9kWM2ElffqKQ
 pPyGNm9R1YivljcHjkDkLgLB+Uhgmnh27mcmtbt3/JJ0qx5Qg1ujg7M5FrTP/OYiBFRc+K45xL
 ngYUO1xDPuntyDo0LE5LYRRMmqZs+GYCE78+BQESM0iNisWmbtMP2XDgNGkI53JRxnvvu8+PAj
 CwfyahZNbwkVOPrwBBOL7rcm6aOyq37oNZWCaupZVu+Uejh2M1ChOwsDFKtE0ML0c3ixZA7tw2
 q08=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Ks67Mkz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416337; x=1674008338; bh=33ydBuzuBnZFvlbDBH
 6+hF4mtGaD+zrqRMjuDlazzLE=; b=C6I5OiEII5WEu/vDcZ70Osc+DMyQLeKBov
 /prYcM4VgEh6jjywoChAlE0KqgLdo44WPgsGSmepfreIwez3YT5iLiYS93g7e+Wd
 tWqCokieFAlkTwr6nxDZAeZzLoKooMU/AtxLlac/bsB2/VoYEqAoeZ/WAPunhtp2
 suSeRhrQR8NXlUVeuMaTK8Nv2q5lIYI89mgBrIADJXhJaxnginjR+B0U9/mBuzre
 PMnyymrdu6pcAi7EHurIV7v3cPWaOWXGlmUCsrWlpjrSRUDBJ6ctO78cJ+1/3ftW
 eA6Kn/1Qs4uU4slMQZzqKptuHz5t1Iy6MmY8LeDOfIfs6S62bE6A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MP-iGhhglPi2 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:57 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kq606Sz1RvLy;
 Sun, 18 Dec 2022 18:18:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 43/45] hw/intc: sifive_plic: Change "priority-base" to start
 from interrupt source 0
Date: Mon, 19 Dec 2022 12:17:01 +1000
Message-Id: <20221219021703.20473-44-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng@tinylab.org>

At present the SiFive PLIC model "priority-base" expects interrupt
priority register base starting from source 1 instead source 0,
that's why on most platforms "priority-base" is set to 0x04 except
'opentitan' machine. 'opentitan' should have set "priority-base"
to 0x04 too.

Note the irq number calculation in sifive_plic_{read,write} is
correct as the codes make up for the irq number by adding 1.

Let's simply update "priority-base" to start from interrupt source
0 and add a comment to make it crystal clear.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-14-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h | 2 +-
 include/hw/riscv/shakti_c.h        | 2 +-
 include/hw/riscv/sifive_e.h        | 2 +-
 include/hw/riscv/sifive_u.h        | 2 +-
 include/hw/riscv/virt.h            | 2 +-
 hw/intc/sifive_plic.c              | 5 +++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index 577efad0c4..e65ffeb02d 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -155,7 +155,7 @@ enum {
=20
 #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
-#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
+#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x00
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_BASE        0x2000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_STRIDE      0x80
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index daf0aae13f..539fe1156d 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -65,7 +65,7 @@ enum {
 #define SHAKTI_C_PLIC_NUM_SOURCES 28
 /* Excluding Priority 0 */
 #define SHAKTI_C_PLIC_NUM_PRIORITIES 2
-#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
+#define SHAKTI_C_PLIC_PRIORITY_BASE 0x00
 #define SHAKTI_C_PLIC_PENDING_BASE 0x1000
 #define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
 #define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9e58247fd8..b824a79e2d 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -89,7 +89,7 @@ enum {
  */
 #define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8f63a183c4..e680d61ece 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -158,7 +158,7 @@ enum {
=20
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e1ce0048af..3407c9e8dd 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -98,7 +98,7 @@ enum {
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - =
1U)
=20
-#define VIRT_PLIC_PRIORITY_BASE 0x04
+#define VIRT_PLIC_PRIORITY_BASE 0x00
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1edeb1e1ed..1a792cc3f5 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -140,7 +140,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
     SiFivePLICState *plic =3D opaque;
=20
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
-        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         return plic->source_priority[irq];
     } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
@@ -187,7 +187,7 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
     SiFivePLICState *plic =3D opaque;
=20
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
-        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D 0=
) {
             /*
@@ -428,6 +428,7 @@ static Property sifive_plic_properties[] =3D {
     /* number of interrupt sources including interrupt source 0 */
     DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
+    /* interrupt priority register base starting from source 0 */
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
     DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
--=20
2.38.1


