Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0D4B31FF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:29:19 +0100 (CET)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgHu-0003y0-Nd
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrv-0007JM-N6
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:27 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrt-0000Ke-FB
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624145; x=1676160145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXcdzDUAYU7rsB+Pl5f84y/rN49mlJ0K3qaF87uMZyE=;
 b=QlJ6hsaVg/obKOef28FgJChZqPDPt7k5aP7JHV6MVe8igv/b9sOkybGk
 YS+YsJ51rZyQ1rf8rFXZ3e0XqUTmB3v0U7p0QIFW+klt5ttyo14Fj6omI
 FeULY7yz4Xmp3+625TH484jcWkqGJ/aHhR3dDyu28giWGJUPmuKG0Wl9i
 GhPClH4bEsE6rdwEyrL45xFVXUN++UnvtbTYvWfZxhF/hfga7jXTgNX4m
 XKHw0hy4UNMby+pGD1hQmbzK4uJ5Nf5BB9+KL4UZvCWp3wR0OS4L3BkYj
 WTTOGSuo+4KRLw/fba015CFJQPCiBddmniOtHo5BSWyZMFSxnEuvs+Jzz w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835824"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:24 +0800
IronPort-SDR: 0FRYp2M/jVq9pUhcJx30S6Uad1h463hj/NJ7Nc1Lqb1I2wSkI02kQPD4R1btbTQhSrx5iUT6Mu
 ZWL++XhliOAJAqGPMKe0r7hCSQgWY2n0cWDCDXUoEqb0oVGnPiynMbLf62kq1FI0LA0Bpm1y9X
 sB0Op4KWPvwx3KYEJPico/X/KGMAm99LWAkmKKadyt/Kz2HsLC/zYNjkyss/d9Aiyo8OOOYQDI
 SinGdbR91j0Rp7jlpS3hN59sb/hc2vA2rqrdAWvEzClSBFqv5WUn0wAGTGE+UUW/LcbBaaWNhF
 IZNeyF1CeTYX7vKdJXpYK2wh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:18 -0800
IronPort-SDR: vUFfI6IKeXPrWnu/l2tY2F8C+txx2xBCtNlxkJbMuXCMjyxkNMF089CsNiNzrBSKRb80lWAx6R
 vla/pnPbWj+F5EDwaHDh6YhgkDQ4gsShjO+nC09nGGbQ24NWQ/FYNKpja6Y+a1byyWj+uKpDc3
 9daNpcbeKUN+cyciR/YTdmyJHVTQSoD14EKp5PlEimlxoM0Pt2r7qrchERldUtCZjF1p+hYoIO
 hTsmwBDXddBH0ynsnFfJnoHC8fusbJUax712Bh229v+XiOyQYAozrr1WOIzyt5w4opmYSfjx5R
 LU4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzN12Kgz1SVny
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624143; x=1647216144; bh=qXcdzDUAYU7rsB+Pl5
 f84y/rN49mlJ0K3qaF87uMZyE=; b=DH9x9U0Grss80gnLID3O4T0iLP4DpBbPKl
 FHbkxWdty+05UzgfhQKk7ZR35HqyB+FXW3b3GVbLdidlj1W14AJBG1j3ZoBd2JVK
 ngKLSI9xzV5S7Trb4aWN3xapVbVNxKky/zrAEbGbrZOt0ZH4ReS53Dwj3HQqwAB2
 +4xIZf578AtOQMyouIPaJWlcMgMu2DdByXsNi2XFNwKkE7wKKtONVTpOVdQgcVm4
 e17Cdv/K+iwabt4ZQuRweTGVc8pdKq6xPsfEWS4l/4+BJFxTuSWZQ3iICS9SMtmo
 GeSQKHpW3yxeckS+r3NbQ5iSglz4Fejf040ANlMPZ6AepeOTeaTQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HPBKdH2vvSQ6 for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:23 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzJ15yTz1Rwrw;
 Fri, 11 Feb 2022 16:02:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 18/40] target/riscv: Add defines for AIA CSRs
Date: Sat, 12 Feb 2022 10:00:09 +1000
Message-Id: <20220212000031.3946524-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-8-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 119 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a541705760..068c4d8034 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -168,6 +168,31 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
=20
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT        0x350
+#define CSR_MIREG           0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI           0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM      0x358
+#define CSR_MCLREIPNUM      0x359
+#define CSR_MSETEIENUM      0x35a
+#define CSR_MCLREIENUM      0x35b
+#define CSR_MTOPEI          0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN           0x308
+#define CSR_MVIP            0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH        0x313
+#define CSR_MIEH            0x314
+#define CSR_MVIENH          0x318
+#define CSR_MVIPH           0x319
+#define CSR_MIPH            0x354
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -187,6 +212,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
=20
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT        0x150
+#define CSR_SIREG           0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI           0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM      0x158
+#define CSR_SCLREIPNUM      0x159
+#define CSR_SSETEIENUM      0x15a
+#define CSR_SCLREIENUM      0x15b
+#define CSR_STOPEI          0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -217,6 +260,35 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
=20
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICTL          0x609
+#define CSR_HVIPRIO1        0x646
+#define CSR_HVIPRIO2        0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AI=
A) */
+#define CSR_VSISELECT       0x250
+#define CSR_VSIREG          0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI          0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM     0x258
+#define CSR_VSCLREIPNUM     0x259
+#define CSR_VSSETEIENUM     0x25a
+#define CSR_VSCLREIENUM     0x25b
+#define CSR_VSTOPEI         0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH        0x613
+#define CSR_HVIENH          0x618
+#define CSR_HVIPH           0x655
+#define CSR_HVIPRIO1H       0x656
+#define CSR_HVIPRIO2H       0x657
+#define CSR_VSIEH           0x214
+#define CSR_VSIPH           0x254
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -635,4 +707,51 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_=
INSN)
=20
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+#define ISELECT_MASK                       0x1ff
+
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
+#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
+#define IMSIC_EIPx_BITS                    32
+#define IMSIC_EIEx_BITS                    32
+
+/* MTOPI and STOPI bits (AIA) */
+#define TOPI_IID_SHIFT                     16
+#define TOPI_IID_MASK                      0xfff
+#define TOPI_IPRIO_MASK                    0xff
+
+/* Interrupt priority bits (AIA) */
+#define IPRIO_IRQ_BITS                     8
+#define IPRIO_MMAXIPRIO                    255
+#define IPRIO_DEFAULT_UPPER                4
+#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 24)
+#define IPRIO_DEFAULT_M                    IPRIO_DEFAULT_MIDDLE
+#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_M + 3)
+#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_S + 3)
+#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_SGEXT + 1)
+#define IPRIO_DEFAULT_LOWER                (IPRIO_DEFAULT_VS + 3)
+
+/* HVICTL bits (AIA) */
+#define HVICTL_VTI                         0x40000000
+#define HVICTL_IID                         0x0fff0000
+#define HVICTL_IPRIOM                      0x00000100
+#define HVICTL_IPRIO                       0x000000ff
+#define HVICTL_VALID_MASK                  \
+    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
+
 #endif
--=20
2.34.1


