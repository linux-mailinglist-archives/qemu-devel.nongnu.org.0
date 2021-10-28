Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1343DA9C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:58:44 +0200 (CEST)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxUx-0002D8-DC
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHM-0008LS-O0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:42 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHI-0004ka-I4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396276; x=1666932276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TlHq+g1PTmL4wRl/eCa5PttqBFJeidVu8H54+9YNUs=;
 b=P8X0WTQP6rXUI3Q5Vuk8E/DHZY+fmEmfJZ8xcm1pLTLzQaFbylX5vfT2
 qdSRwxfQt+Mq2g2V2ScmiXNQcX1cmt7EU+g3B+DmqRh+FyHhVYw8xznD5
 NqQdn498c5z6Owi9vftIXfao+sW4CstRYP6SBUqy996BezLCjKtKM/RVp
 kI+mrrEyt92QfnXKOFpSBGNcGkpqqFO8ns58XWcs+Pvh4b7N5C/JrnyBP
 Tq8DiNHC8KZuKXyA69kVWv1E3oPvOXml6A8tLsD4zjTrv5I1X4cP5GcCP
 8U7xPYXjQ7ddQDH63yeE+9jtHOY5G1zXruWp/maeZWidMEjzXq7Wmn4ga w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="287922953"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:33 +0800
IronPort-SDR: L/XU8h4oxeKAXaRG+MIq/IyvFQDvRW/3yIOaIJwDmEMZpXgcsaJ6CUzdAkldsH3M2/M59QZnja
 hBGqF62S6jPdPFD2qozeHwCApVduh2fa22RmuSU/5nhes8zDv1Ik2cQy8TlPEegJHIUgWOBcqn
 wwO9m1zCCy1lhvaPSZ/oTAjp8LMlRVbL55cINYMT3SiIf/xENwKtA9Y67uBdGegdCbKNE9loPZ
 Qsf7dUGS71pOM7+o2Pg7/cMJdWIhabZt/lIYJGR8m2OC9hQLKygzn5pogL7GNbJBUdBTMx/KDA
 c5gMWPKh+28tViB8Bj+aLSEb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:20:01 -0700
IronPort-SDR: 6kEglmztY8xpdBpw6fc93/dxuUZ3g1YlbpjzdXlVp9MrV0/XxvWTb+LwBrP99K/XIMEt2Q6x8Y
 CRyxjG6UyS5Guu6PLq5MYMOdvz3hHk3BJ8+63erEP+bjU19V8UqjHlL1MNcv6ASVWLSsCJgvqV
 AWmZVsKuUymapgpUIf5mkz2S15Jyev5xtkg113xwkpLyxjSP1ySReAhXJ8E/L3xcE4Mmrdg7yT
 dn2tdZi2t2aNSEepCJSq70hbaD/m1R7bPEI4VuaqdW5Jp37EA7vutjETNq493ZkJ1RFMz3yZzA
 /r0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJK126Jz1RtVt
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396272; x=1637988273; bh=9TlHq+g1PTmL4wRl/e
 Ca5PttqBFJeidVu8H54+9YNUs=; b=hUqw2tibhHfrs8AuRZmjcarP2zjF5lRfc+
 kDK8pq3sjrGY2ZNPxXO+5i6tWTSEAAtSjfKiein76ENesMbg8F4MSGHsIeRIcazI
 I5Uej0B2nEextjSDUBJEvly3r7CQhZndVl84zVts2ftAcSDvgGpc8AQ5X0Z4qgjI
 cZgaB/TwEJmOoEy0gnjG4M08e6R1j56lwb/lUv32wISLc3CgesAPQ9NQcZGQWFu8
 wQBMRckVjvYYe6bmaDILzQP++VCDEwYXG/T6RlnhBY2h2mkGwX39aM0UJlm/ao6U
 wkHIRXYSl2BbtSVB6lVD382ZgAMBqtSj05RFHnHqpe4Jq6Vul6ZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 06Wy8o-AhwxH for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:32 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJD4WqYz1RtVl;
 Wed, 27 Oct 2021 21:44:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/18] target/riscv: Add CSR defines for RISC-V PM extension
Date: Thu, 28 Oct 2021 14:43:32 +1000
Message-Id: <20211028044342.3070385-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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


