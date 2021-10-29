Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4943F7C3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:19:39 +0200 (CEST)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMAs-0000Lg-Hi
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM4o-0003Tw-VR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:13:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM4Y-0006h7-Od
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491587; x=1667027587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TlHq+g1PTmL4wRl/eCa5PttqBFJeidVu8H54+9YNUs=;
 b=NEFS9OyZBjdSSi0OfF3tjEZuuLBONVgvAK1Zb6/O7Jul9txoHB8G3eE2
 Jd/is/ZZH/qbSfCNXaIqCsDKrWV2u7Cgr1Jxe9wh1qKPDL+Za+7NJF9yc
 vg5iCETBd950ukx1c1z4o8hbLsYaLVaam/DGpv2OGyu/8MsivVTwRXKAi
 o2/jg0VSgiSLR+SM3HDyACFPbE2A6EhPL8dcQknvfUqk9FFDt+ezy9C7a
 wFXGMRuaZhNJbfMLmlUrAA1vlcXRBOsh9jArRuvGkc7Uex6WzqW1X5m0U
 DsEMSQx6L4pkbs1x5g8ateITxI59ZgzavfScklA3uoWo/KlG8FewqrclO g==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="185100493"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:13:06 +0800
IronPort-SDR: OMG44bEUki1oR+xffj+rVgPl0/kE7juBpxqc62s5SMzFo78KlEfYsYA/0RJOQqvhy/BhcTmQFm
 9oLmVEwXsntdQaLym5wJoAi6Ttje6W+dBfIVIvNjCtaoGWIPywvJJOhlMlGXIyO90DyS3KjesV
 eJ+bt06Eja1KpaycVYOmdqkjCKwSpC5n3SHNLAfxps0EZQA1JiqfuTMaOpgPMgyjCtLN9ILWpX
 Tq2HdaPOufgsb69ltTgVr+OUfytzU1Z3jeJ3MupRZWzhxfcxCOUM2Vf5CJZpziqg2uQeshut/u
 fGtxRBjAH8mtDU9F/dWEB6gW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:46:58 -0700
IronPort-SDR: 9BQwvvgBRzXqZvwbX12OpX9ZpV/2O7F3L1sXyoH+vLku5Os8wTp/Ap3JYYY89GkXOtE+t8TrwV
 UqY1rZNsufO/C/PpeToKVSF5g+RsVRxqX9x7MMpU497x4lCb69cbPfXSRFTSyx4RQk0E0rsGr9
 NgYGMfpBGrDXykW8RqGvEn0jDuPvvQsyxVecd1QcDNIobRkMLSsQMmkL0ZM8KL72U8A5kG4Ssv
 E+hsPBYhpHeoG5gaypQHgcpm25z6UXfeWmfqokjok7R3DW0LIhC0C3WBH3Ja7WbII4fIlJIMDZ
 FDk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:13:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYYF0Yxhz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:13:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491584; x=1638083585; bh=9TlHq+g1PTmL4wRl/e
 Ca5PttqBFJeidVu8H54+9YNUs=; b=aa0afG65QKLmAi+xgeXnFYvUkj6Mahxsag
 wYf6FQ9XbKxMEAef9iU/ioaZgEVbR5EYlBDn+IuDNUNnN2frSTR4bqfyn2fSZ9nE
 JyyGM5ywAqEG9aGNSkw/w7gu9tvtpHtiMNYH7kcuzxbxTi6D5RJfx4B1wsKFZCU5
 Csu3zcKkmgDBMhdoP4z1pMueRbm0+RlRQ1L+FB1uRzPx/9FAoYh6TswHagnZGVpK
 yJDQKeUqzSIOa2AIJR5TMNsCVJG5LMeZN6KUaY+bCL5PY4DCTuXweVmp61T+zmRM
 g9M9sZidHR1meR64WthATiilGY4SSEfoFYkuI87svvPElGIKHzEA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eo26Uq35sgEe for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:13:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYXD35B4z1RtVl;
 Fri, 29 Oct 2021 00:11:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 08/18] target/riscv: Add CSR defines for RISC-V PM extension
Date: Fri, 29 Oct 2021 17:08:07 +1000
Message-Id: <20211029070817.100529-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-3-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 96 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index cffcd3a5df..aa0bce4e06 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -334,6 +334,38 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
=20
+/*
+ * User PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_UMTE            0x4c0
+#define CSR_UPMMASK         0x4c1
+#define CSR_UPMBASE         0x4c2
+
+/*
+ * Machine PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_MMTE            0x3c0
+#define CSR_MPMMASK         0x3c1
+#define CSR_MPMBASE         0x3c2
+
+/*
+ * Supervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_SMTE            0x1c0
+#define CSR_SPMMASK         0x1c1
+#define CSR_SPMBASE         0x1c2
+
+/*
+ * Hypervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_VSMTE           0x2c0
+#define CSR_VSPMMASK        0x2c1
+#define CSR_VSPMBASE        0x2c2
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -525,4 +557,68 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* General PointerMasking CSR bits*/
+#define PM_ENABLE       0x00000001ULL
+#define PM_CURRENT      0x00000002ULL
+#define PM_INSN         0x00000004ULL
+#define PM_XS_MASK      0x00000003ULL
+
+/* PointerMasking XS bits values */
+#define PM_EXT_DISABLE  0x00000000ULL
+#define PM_EXT_INITIAL  0x00000001ULL
+#define PM_EXT_CLEAN    0x00000002ULL
+#define PM_EXT_DIRTY    0x00000003ULL
+
+/* Offsets for every pair of control bits per each priv level */
+#define XS_OFFSET    0ULL
+#define U_OFFSET     2ULL
+#define S_OFFSET     5ULL
+#define M_OFFSET     8ULL
+
+#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
+#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
+#define U_PM_INSN    (PM_INSN    << U_OFFSET)
+#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
+#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
+#define S_PM_INSN    (PM_INSN    << S_OFFSET)
+#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
+#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
+#define M_PM_INSN    (PM_INSN    << M_OFFSET)
+
+/* mmte CSR bits */
+#define MMTE_PM_XS_BITS     PM_XS_BITS
+#define MMTE_U_PM_ENABLE    U_PM_ENABLE
+#define MMTE_U_PM_CURRENT   U_PM_CURRENT
+#define MMTE_U_PM_INSN      U_PM_INSN
+#define MMTE_S_PM_ENABLE    S_PM_ENABLE
+#define MMTE_S_PM_CURRENT   S_PM_CURRENT
+#define MMTE_S_PM_INSN      S_PM_INSN
+#define MMTE_M_PM_ENABLE    M_PM_ENABLE
+#define MMTE_M_PM_CURRENT   M_PM_CURRENT
+#define MMTE_M_PM_INSN      M_PM_INSN
+#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_I=
NSN | \
+                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_I=
NSN | \
+                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_I=
NSN | \
+                      MMTE_PM_XS_BITS)
+
+/* (v)smte CSR bits */
+#define SMTE_PM_XS_BITS     PM_XS_BITS
+#define SMTE_U_PM_ENABLE    U_PM_ENABLE
+#define SMTE_U_PM_CURRENT   U_PM_CURRENT
+#define SMTE_U_PM_INSN      U_PM_INSN
+#define SMTE_S_PM_ENABLE    S_PM_ENABLE
+#define SMTE_S_PM_CURRENT   S_PM_CURRENT
+#define SMTE_S_PM_INSN      S_PM_INSN
+#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_I=
NSN | \
+                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_I=
NSN | \
+                      SMTE_PM_XS_BITS)
+
+/* umte CSR bits */
+#define UMTE_U_PM_ENABLE    U_PM_ENABLE
+#define UMTE_U_PM_CURRENT   U_PM_CURRENT
+#define UMTE_U_PM_INSN      U_PM_INSN
+#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_=
INSN)
+
 #endif
--=20
2.31.1


