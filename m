Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6C564369
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:17:58 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nJF-0007gf-Dx
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBZ-00020D-88
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:10:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBW-0000vI-Fz
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656806998; x=1688342998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6OJDw1BgSdFL4HZvjQWwfkC9yvCNCZ5EklbtsfpB4o=;
 b=Fo0Qy4rJNfrJFSCD9r0Am3wyoIqF3LrWENsEep3RsYFEmGxVgpv8g5Hr
 p8SOaCJl4GCl5+aVK/PB6HD+Ih5+jOBMXvuXxqXeL4Bx5F4nS8XM9swFW
 Vc2sDjQmklvqgaEqljAjUTF5MIPtuHtEyGTBsVX+HenbulM4Q0uBAMtlN
 cYKmu5WgGvotpto7f6nenqIGxBVognzLHx91iWQUlNjH218e3syDRGFVh
 5awtC0xS5t/JJ1YK7yrt8iQY9TDRxp9m1HQ+KdL0VF7q+8qTWgMjEMOXz
 T1+sGuNlj/4jNYuMjnE2zLMXL6BGW5Rc+CZeX+kV4OyZ9Dwd6LX9Prdtu A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="308989623"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:09:57 +0800
IronPort-SDR: YEghdNCanDXg4d4Y7kIpcYewxLNLA+hDIW0Q47tB4T7hca1w7pkQh2cy/blZJt2zVV8TL0rAs1
 3Wsrrl9Pmn0tOlnyiSFILReNTwRlZpKoGBg4hx+8gV9soO557ovQWwy9+Po5KQ9+Kl0YvSSt92
 qJgEdRO0AR7GmT6eCKRasUdvVzTRiMinp+qjHOL/B0oBMJ2quHEk1I+eHIgrZOc6VEssayIeaJ
 jIR9jIvlsJuJqEFR55UlRFPmU24WYoI3xyB4eHwvZrERTsmK/bZA5GdY2WwGh3N/YDEk+SHpPx
 wb2X+d85zRyTbp4W8B7OjAgM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:27:19 -0700
IronPort-SDR: 6F/LKcPOB3CjtqtdzTrQGwVAKNP8soTHV6hrTEdioUnjvv2jHMTtwKNXZzYIDMaXz2xrQhuTzY
 +EdsUaMOcy52Q6eh6BatqSyhgmcLLKEYfh2VWl0VznpXPwHCyTYHGqtoTvH6GGzsszwuGoGmH5
 VmiEg4IdmS3JTM+6tTTu54WQcQQj9hQpvpHZLW2YklEMSmKhSwfMlhiPdh2KlHRljCa9BvqkRG
 5qnSX9+kgVNPy9jWkignNjV2iOTbK165h1RUlDq81gS9QDAyKJxmRlbHx2x+9Taj3qSvfsCir/
 IPA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:09:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8T14Nckz1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:09:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656806997; x=1659398998; bh=A6OJDw1BgSdFL4HZvj
 QWwfkC9yvCNCZ5EklbtsfpB4o=; b=Wmw5BBoIP1k5orLdUc9t6xraBc/DqkfMCU
 Vw8BJs8g6kqJGl/lFLlVoyqwXDgvI7v4oU2KHL20YhCPi0Hl0zbN0QhR/yGxuX8z
 u/oJeS9sfMAxDBJ5ZjMIIqt04+y57EqsfdDuDwmHvGVzg1tT0+b3Sr+huluH71TD
 tugD0PmUYcSOTTAx7drz/KT840/uHtHc8TpSrPKl/WKterjFBL6moP1LvxBc+ozS
 7wD3nLRjRGuMiI66lQzXXN1/pTo6ikoICFI5kCPHeiRGyPDg9WBIlqyTFbeWtuEQ
 NwTZnXUxduK02rCkiCo7ApOF4TkjrGmA0yNPGW0BynOH2pis2Lvg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 541k401WQ15c for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:09:57 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Sz1sjsz1RtVk;
 Sat,  2 Jul 2022 17:09:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL 06/19] target/riscv: Fix PMU CSR predicate function
Date: Sun,  3 Jul 2022 10:09:25 +1000
Message-Id: <20220703000938.437765-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

From: Atish Patra <atish.patra@wdc.com>

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault=
")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220620231603.2547260-2-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..46bd417cc1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -72,6 +72,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs =3D env_cpu(env);
     RISCVCPU *cpu =3D RISCV_CPU(cs);
+    int ctr_index;
=20
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -99,8 +100,9 @@ static RISCVException ctr(CPURISCVState *env, int csrn=
o)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER=
3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3=
))) {
+            ctr_index =3D csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -126,8 +128,9 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOU=
NTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUN=
TER3H))) {
+                ctr_index =3D csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
--=20
2.36.1


