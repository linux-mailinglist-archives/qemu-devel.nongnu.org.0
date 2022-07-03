Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB556436B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:20:55 +0200 (CEST)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nM6-0004XT-2c
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nES-0008Jg-T7
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEN-0001p4-Mh
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807175; x=1688343175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6OJDw1BgSdFL4HZvjQWwfkC9yvCNCZ5EklbtsfpB4o=;
 b=gYmaoMJJZRGOc/d0ZXT7BSc3O9/XE2nd3OqGFDEyCuu10aEWBOMyBxLF
 UFNScDHK5cdm7YVr4vkbRPNmw9m7c36eNaD/xjS7xsYj9BBlrWvY4nw+n
 cqTi+BBnn/p1bJAkpGZQCSOyXSHtlcvgyv5hyiWXVDz8BwTb0pbWQf5dH
 aCHCZ06TxeUCfY6RCb40RkuHeYMwMaZ/olmQJDGa2eSn7CGiOxDCOKxS8
 RbpqK9j2xI3TqNkn8thBn++1xzgmHL1r62p+2AvVxay6BkLb1ehfdynGc
 /QVriDXaJIoccJZhvbSpUavaDB5NCf+03735Ng8PGqnNLufl3Elud1A3f Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667233"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:51 +0800
IronPort-SDR: McqbzbRIBnER1GLh4vaC5kWeef09UfI6fz5khD57DMjVZ/hy9Ljt9KVqNas4o13NMOwLugFXaa
 CT0JNFDxJGyfeI8wJGjaUZZbLMZW4UaW0PtU8tH4ePdKahotPROp8ZO/C8GdBQ8BtDfX9E/w5y
 ag1kppV41mlxy8VN3eM2t1BlDZ/dul9UxjRAOVjVri5k5L78x2PFZGeV5rlVN8gDao6jMr9Mqg
 0iXfg3+E2eWGhedDDru+UHoOt6kjVF52I8tY38U07aNmN/ptf2KPFS43e+GKTbyOI2+VdvdVMA
 gCv+K3cwp8tREm7fmxKSdcJL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:14 -0700
IronPort-SDR: zREevYZ1vIAq5ccd4dFbvlqPtqEI7Y6vthYXB08nlt67T4tni8Wiw4W6VYQjQ6e7nfm3fH17Yh
 QbqsD3qnjOVGtAKZ6h5eApHQLf+BOWsi766K1x+Wl9jDR6Yknn6FeX/olUZPuhqobFl5k2dIAp
 6wyxIsOuqZyEeBVerGr5+ME17ijnI8K/7K50d5zRARbsuKwgMGEjWt3e5nrrPr+X1NejqdksRo
 zn3bf7hGKoSUFOilPADhhHrRMaZkX+Ugej/zf8pq2MVmSRSS1tYXQ6+B0CNf9QH1qY0qCi1+MG
 dOw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XM5Rxvz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807171; x=1659399172; bh=A6OJDw1BgSdFL4HZvj
 QWwfkC9yvCNCZ5EklbtsfpB4o=; b=JHsonAptu8AzkNQvJCCGyX8PYu9tnWm4Nq
 ILMvjO5t6LfRcQYvQ7M0Hk7bQLax3g2osnOODPZoqM5/9/LwSGj0D16TeNCxL7EC
 Ob2+ub6F80Vz4eA6QOtBO3rw04xY9t08KonDkS8VMPrqE6PrR2S0VeyCZIsJY+JK
 a8BsKBDW6z0TKT3relaMyjlvNP9ZVhw370gN9/GZJF7iBFmzkViLAphbkXXgeqtq
 8Lzk1XKhvz6ZjFIpl897au1HdyU7o4HV5NuypNuPRHlbAsSbn20zbu8YsTMTkG2R
 wYdtwz87864+lWd8wozTxiuvqSPtdfhABYS2o2BYkxLwpxKx+Qwg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Tx0earCs8J4U for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:51 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XK3f1Pz1RwqM;
 Sat,  2 Jul 2022 17:12:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PULL v2 06/19] target/riscv: Fix PMU CSR predicate function
Date: Sun,  3 Jul 2022 10:12:21 +1000
Message-Id: <20220703001234.439716-7-alistair.francis@opensource.wdc.com>
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


