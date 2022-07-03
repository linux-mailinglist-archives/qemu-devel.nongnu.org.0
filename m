Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EA564375
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:25:55 +0200 (CEST)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nQw-00066H-Eb
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nES-0008Jh-TC
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEO-0001pG-IK
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807176; x=1688343176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/XwE9R9nGzJ5iezcVevZDhZ1loD3ydAxDj6a+PTtec=;
 b=Iy1RUPHPyVs9H7L6Y24TJXsWwtmM7XiXj8uC7GpZJLWaF/Choh6SKtk9
 0JE3F01UoFRVMSnUZy8rvQOi6cAZ9qSFphBNrKmPr8Va7PoRN8pjeBjbd
 8nfbXKm2gH0exJ+ifarzwT6TKYc/u/DLihthmyWpOJ4O5374Z8d6L1RM9
 AY1pDQJ7tAuyfGuqITWHxBYDcplkzWg/YGUQDtUJJPnncYsvEjF9KGFSw
 prG0Ca82muHsrVuGKrtMrVqDgOb1PCXF/L9TESp2Qr5ntkshimLtcsPnx
 iXzxKIdGBZQXikmTR0RExIuIMnAcCfqXsRUblCSWVyIjVITINpsKnDlWp w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667236"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:53 +0800
IronPort-SDR: dTJX9oquJ95whu0QO7kg3BLZJ2Dy7x+2hO6iWDXJLSuEvxKP1myS///WJItVvK73hzkluDVjE0
 9eLUtj1vE0QHFy6ifBwDTZIFN6BATl0aEhLCL6QsS+VcnLpKkvfkk49Wsye6/uk+A0RhzyTj4l
 IbqJBatSGrIzNDT2rmzwjZuLT1DoeHQ/xpKNP+jWgn4Q/AHChthpa1nNO/c8hchhTcs01VgHua
 dO41IcJ44+y9dlsT9uMLpQAYICMfiaJ6SsENUW8by5IefsJ4q82G+BzEJXarEq6Q2anOXgEEFv
 XttEd/S0U+GzeY+NUOJW7HEZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:16 -0700
IronPort-SDR: A4XfNxOQUijt1zkz2kvp70BFVNZUrfiA0Dkm0E3PsBkDDAd6/i3jjnQT/b766oft3GsXAssrux
 Ow2FSUgLFuItEb4cTk2gl7oN49p9Yzy0iJq9JuJ4T/PR8JrQAEZilETykY+mwU7Sp6NRTFy4Mm
 XnLSfJYuwLXDeJTSCZxNb6/xoHfGa1pz8pu8ExxWx5XX234unKD7kp84hKf7Su0VAOI3uVjZ/P
 Oa4XyaXtE6JfETOWKr7GrKOQqb2bf/Gz2ZuGtKqwxqv9lAASsEmErioZTzvO2+mRxj8ZoXS6fl
 pgA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XP6Z5Nz1RwqM
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807173; x=1659399174; bh=Y/XwE9R9nGzJ5iezcV
 evZDhZ1loD3ydAxDj6a+PTtec=; b=JtkhjMu1nXVrSC7gRN8AJHt7bCzBBQCPla
 DjiMBQdKvqkjic+A8Sh2IpQFggc6dSEzPerjavbw/hCm+wdsP0JF6ALzFOt45aX0
 OYzrKsyZy/a9AvHvFYXnTNlZteBAh6WdRMu6R6bkakk8NDyaR8o+zL66yDNNGJMX
 4e+xs18VNPTlDbpU8rLV292rzlhIFLHVlmn6gaD/JcvEEO1PMlxHJc/OWSG8PhzJ
 wORbVC8MUJLo9vkUhfHt8fZB4+IDuAHGxt48SNHxt4wKkd+CQeiIplfeR97tzPMh
 QO2NQoVjwzmyqZhJ3lAkOjDK1fAY9JzjX+7DtVtRpqdai7yg0ISg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id c0e2I7rkLC_q for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:53 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XM4Y75z1RtVk;
 Sat,  2 Jul 2022 17:12:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 07/19] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Sun,  3 Jul 2022 10:12:22 +1000
Message-Id: <20220703001234.439716-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-3-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46bd417cc1..58d07c511f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,57 @@ static RISCVException ctr(CPURISCVState *env, int csrn=
o)
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
+    if (env->priv =3D=3D PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index =3D csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index =3D csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
--=20
2.36.1


