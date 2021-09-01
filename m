Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8733FD16D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:38:56 +0200 (CEST)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG9P-0000MI-Jq
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFk4-0007hw-3P
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:44 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:59238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFk0-0000jR-Vp
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462360; x=1661998360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BdJ5OyVoB6zkr4E8rRJEZRH54d4QzXjXusnhSAYb7HI=;
 b=YVWR8e3RawOTHo4Q2T03si83fSf5HA/yXUhyMJe3991/xV/S0TVjHaFM
 xRVz4DZS8rta2nOQSw9SRi2VQnwVQUtKg5uYHNWLOiNvtWgV4BQImDKjh
 zgaxx0aYnNCUs6Dlz+GzjfOCIB/MY0NmFqi/ipUu190LLHslJ3o8XSthN
 yx/uaXlus3SsAR88z4RoXxbadgwIIymXYLsNu7tPWwMZ/j3mk9IPCtAiR
 i1Z9SPHqLuirmh6r+yFOaLVDLsF87QYvuY+VQmShnxYel8DCpQHwulc/W
 PcAJKA+vlLq0bVULutDhEfoMcs5qXqw1pl2Jaf8MTJmeDi4f4SlPIVw7r A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="183691320"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:39 +0800
IronPort-SDR: IqxxNcdCzlrGkVbYKRJ6+Hu7uJStkplfHlvWwqjiI3ot1u+vMGOorWjjZEpAbOmKek/uPjkDeL
 0iorLpkjhOCW+lNKb2VvjUjr/MmfOUQFcV2IiuYO+HdqTJGnU9K/qQdmdp/S0wJK85yckOby4r
 +53DNNwnCwQ5TNaUK7nqmNZdtXLKSM5Gh2+QtA9TiQZtle6judIgMtUz8qlYSwOH3QUzsA/Zp/
 N6q2pMV46jfqFnGsK62m8ZoAsfUtzs/ndCaCbCgzYp2ZOZsjzQFeRz9DqWrrCqTbYZJyHwpHCC
 89+r3701E1/+daWJPCuUaap8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:27 -0700
IronPort-SDR: YparCUUGI/LcB3HgJNZBNtMLegiYOHzqlMMwAErx07cjsJ4iyBrGH8X3K5jodsoTJ8H+3fVqco
 n8dolda42GmNLVH0Ft2NvippeQZl0uCqJEq9w5cIA1bveQevonWb86A3kPjHtRcY9qoELNChfa
 Vec56GalZ5LJMPCBSEn6N7y9ygpNPLfZVrsMLzlibuXz6gfOfrusM/4Xc92DL1Cas4LNGk88Gx
 /NMYhsbYICrQzprdgTe3ZtD93Bbp8FZosP/cG0bFM1I2lZ0h3a0v+bW2VBClSuz3+IuVwxigti
 sGs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzndL6F3Nz1RvmK
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462358; x=1633054359; bh=BdJ5OyVoB6zkr4E8rR
 JEZRH54d4QzXjXusnhSAYb7HI=; b=cnn1UQEOzmW4ptJkPquRz9IfYHCz3OBfe/
 UfwbVImrF0Qadwsmb5Qf/Oi7ritXtdy6B26Qvvn8wt5GzHnh9+LRMcosQPMh/78W
 Xkj6lQg1DwFlkKye6VFeTgUGcH7BysZ73S/KGDLHxkOxoUp8y43/lUgNmLJ8dGj8
 kfGWPxeXRA/1bsXXrO+6rBLICgC8IeD5meVdPd0GU+aTIgEFWefGlncnmcLLbfYm
 t7M61iSfGybwmwqhsaOIEeS04qpKa5TZ/LULTNt0k+mD8uu6WgqEsWSUY68LW01D
 bhx29hruqBq1D8mcK7ff5x/4KlMW3DbvZbgvCUvkFQ2rCxa3pqHg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4zR-mQI7qqNy for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:38 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzndG2hD1z1Rvl9;
 Tue, 31 Aug 2021 19:12:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/33] target/riscv: Fix hgeie, hgeip
Date: Wed,  1 Sep 2021 12:09:51 +1000
Message-Id: <20210901020958.458454-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

We failed to write into *val for these read functions;
replace them with read_zero.  Only warn about unsupported
non-zero value when writing a non-zero value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-18-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 16bd859121..50a2c3a3b4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1124,17 +1124,12 @@ static RISCVException write_hcounteren(CPURISCVSt=
ate *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_hgeie(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
-{
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return RISCV_EXCP_NONE;
-}
-
 static RISCVException write_hgeie(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    if (val) {
+        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    }
     return RISCV_EXCP_NONE;
 }
=20
@@ -1165,17 +1160,12 @@ static RISCVException write_htinst(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_hgeip(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
-{
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return RISCV_EXCP_NONE;
-}
-
 static RISCVException write_hgeip(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    if (val) {
+        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    }
     return RISCV_EXCP_NONE;
 }
=20
@@ -1601,10 +1591,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,     rm=
w_hip           },
     [CSR_HIE]         =3D { "hie",         hmode,   read_hie,         wr=
ite_hie         },
     [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,  wr=
ite_hcounteren  },
-    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,       wr=
ite_hgeie       },
+    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_zero,        wr=
ite_hgeie       },
     [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,       wr=
ite_htval       },
     [CSR_HTINST]      =3D { "htinst",      hmode,   read_htinst,      wr=
ite_htinst      },
-    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,       wr=
ite_hgeip       },
+    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_zero,        wr=
ite_hgeip       },
     [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,       wr=
ite_hgatp       },
     [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta,  wr=
ite_htimedelta  },
     [CSR_HTIMEDELTAH] =3D { "htimedeltah", hmode32, read_htimedeltah, wr=
ite_htimedeltah },
--=20
2.31.1


