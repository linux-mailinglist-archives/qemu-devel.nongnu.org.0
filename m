Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568454B8330
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:44:43 +0100 (CET)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFvW-0001OI-CP
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpw-0006pK-BH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:49 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpt-0006hk-Rn
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993045; x=1676529045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXcdzDUAYU7rsB+Pl5f84y/rN49mlJ0K3qaF87uMZyE=;
 b=W2+PVmXFbJKIcedysDZq3PWhKIYTP8ttfAVDs4cd/76aOwXPxk3vlkmX
 dXTHif/GS9XN11m0PdzILocbZhCtOJMA9oPAHvTbI23ydKjaq01YVh8+0
 sROSs0mg3zJ1Jlm3qhGVdl6fc0scJ/9o46+iu5L1Yz/Kwtrbq7fWddQr7
 FxP/VmMLRcAR7f8wizMPaGsEwKzNLF6J8zkhx/BO0EfdP7JRhSuVqc5vD
 XYk4xkzGTG8vDL22pYBhgJr1nHVQ9AHuyh/fqhcwuuj8pii2iiD7jd8ln
 E++sK3YV9btlnxbz2x4qMlEuXReMPV9YgCKt1jiPZXeobNXqGp0akXo61 g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974589"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:45 +0800
IronPort-SDR: zaWGnTBJ70QrKYcMx9W/Uqp3oaQGQ7W1gxMSjWLGDeXpWU8TIne55VLcoU1Jpf75Uik2dJnzua
 zfxmBtTLx8Jkn8iAPCAwtch9V2cx7ZnfAvNVi4bWNqH80V38NciJ5jY0+5O4q/QVz9Yvo2OxQU
 Mrmx3zm87MwigJmA0bO4bqzO5CWs8Nk3P1FSEaiIHSIspE0dRJwWjMEBwfioe1Xv2sfTw0n4oQ
 KCloTgPrhlw9jq5m8XtPvYjca1+oJCIRlG3q+Fl3H0c19hjVwWGcHGtOjdItgf9ikxUbuLG4+l
 JRh1vjvSNg5ybHRzfEIL8Q9Z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:33 -0800
IronPort-SDR: 9H9ZnWV/tGZM/wK4Mgvxmh/A7JJCKycRCMT7jQF7TU+ritv06VEswkV56Gt43SI8/6lXHDm1uQ
 ZGZrrIoSEJokOtjZmROQQ48DchBYBY16RrWRmFkp96mQCe4X+RBwUW66EjU3+vT64fv/pn+FaD
 G6lJzPjR3mnTgdFXgXoIc9aOzAKd9Ily2GZQIOBO27HZyBSTISunojW6PJpp4S/bYu6YpSit5h
 BZ5aveZkdHud5EAANzIfok2xObeGtohHZnxGMCqP4XnAx5AJTNImmRVTNXD89U75c6p2UKyIrW
 hy8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Pc5MwRz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993044; x=1647585045; bh=qXcdzDUAYU7rsB+Pl5
 f84y/rN49mlJ0K3qaF87uMZyE=; b=lRB75ZiIJMCdzgziO6saEPaOqz+YXzxGIO
 o3io9E/HJeeqHr951g3/9Cc6/pHI7UgSRZ+H//+8XjIdlC3kkHjV9l5I1n7sfzKz
 AX572CVkE78YqyP4kDLXMHQccPMbCOUNJfLxN8jxAxin3kz9dABWXg91W6yxj6m/
 hTQ2vq/OiD8yxqtHFK69cy8nlsnS14pTvusLMpNS1uQB5dXLBybZT3XOAQP8tAKb
 R7rI2SERo3lImfNVmV0HGbHNII2O11sWKu5ZI8A0DW78qOYPqrnRJMlFXpNhPbj2
 erkwwzbCV5AY5K8Zpe329++69/A764w7519ylk3GHts7P4iMajVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dCV24kxCv8hm for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:44 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7PX0xyxz1Rwrw;
 Tue, 15 Feb 2022 22:30:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 18/35] target/riscv: Add defines for AIA CSRs
Date: Wed, 16 Feb 2022 16:28:55 +1000
Message-Id: <20220216062912.319738-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


