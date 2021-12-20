Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24947A4EB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:19:47 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC1S-0005CJ-QF
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmy-0004GH-VZ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:45 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmt-0008Lj-C2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976440; x=1671512440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wE9rsg8fHVdUASWB1T0Zd8TikdXeTiVeH2ptc8a8Z3M=;
 b=nJ+GEkhc7vjs+26utmxc6LMgYQ27ovBieBhnDiua1XSPAMy5LLMcX56y
 quNmWNHk1T1jyywZm47RhDM7AosI5353OOeq9Org6iGNJ2cgwgiKQHZJK
 mMOraTqdWp5ptKfqv0mcgJ+YLbln99sE3pyp1rwQpp030XjQEbPJwkIKO
 XzY9X7fkVJ4j50nFZ+G+b6VZtqjgZ3aJVREsmvqH1dKqkFwZmIK1yRGEb
 cl7UDrtg3kioEIDUH9MCQwZHqut3uqnwDTa9VFRghUFiCwq3IrrpbWpO9
 c18hJXoqbV1+G7aVjDCZbT/y+57JX3v5VnaBi9wCALYbtVJIomJ/HgioK g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680103"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:24 +0800
IronPort-SDR: Vs9SQa6Jc31u1SQocfVXIZs/i5+Okt1PWrfotG6f2VI1s1f60R8v8uIDFhQYxYtg7/NBzUBII4
 Tf+d6DPewmA0gJc7XCS6GzmvNOLptgypjyn9E8WmgCNZqn7OiX8xSFcpG3vZvjx5ZTHhpgWzwP
 DTkeTiB2EpOOs4wJi3LRaFnyVEHc4w73DjSvRru94gk6xJo8rWToM48BciCAa/hR8Ac+f1AOk5
 wVXbROivV+WqCxjBzXSpjNXKZBjcPzeX8WJi9a3KuN9JGgdRXWzY/jFUU5bAQQwAsiOdmwh1c6
 HuotkNT3RTiS71uhbZb7aw5F
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:12 -0800
IronPort-SDR: Dln/HTDJyjY+TPq4ijaWOY4VoWKCwT+cdmQCG2uJ6qLk52PY6AFbZ8eGFrIwGEMy+2vUobmLie
 etRU4I+N53QziYVLe+XgGpYiWZr6mlOc/z65Nl5uabEW2uIMmtthq/0jr1fRbOBnuBEujTNusc
 8Qj3R1Zzq0luK72Q1Fd9j1m6lhWhCTrrCVG9W+DAtMGAXq962CIEFBR4RQHNhg9hcY4qOZ2sPM
 8Q6DoY8LgxirgMcW737U7QISDG1m51crLtQgAL5QNTlFVFQFSinwZbd68l2dwYCT1dVZn/J+08
 Nr0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS865pfHz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976422; x=1642568423; bh=wE9rsg8fHVdUASWB1T
 0Zd8TikdXeTiVeH2ptc8a8Z3M=; b=Dx/acWNXEmtCdpwAcqjTGWsRcukdqI/hZq
 VWtNZMQAT/seXVPHVebXuLeWWoaSmzQn8NRF0TvFQ/7crUljfCv3XkJ2LI609N6k
 tKk1OoKlpEhaDr44pOpwrI1tNOkNHdGApW0heg8IjGdZrd6Gqz148WP/IaDqXOiF
 nrTLGn2BQP6pqYTEsK1VZI0bq8GsKsn6W163aCCPdtwi7UmuHRewTcje/tXBMR8b
 VbwjwcB7zD7YYQqx0FHoJMDuZL9oPgmFx/nj5t5aStOLPpESz+/nreloMBq65qqj
 tFwuhmxicejWX0RSgvwuhnzrYi+g4ir5aeTZ/BAlOQ7AW+ITeVNQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BXaEEgefdKDQ for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS836Lc6z1RtVG;
 Sun, 19 Dec 2021 21:00:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 45/88] target/riscv: rvv-1.0: floating-point move instruction
Date: Mon, 20 Dec 2021 14:56:22 +1000
Message-Id: <20211220045705.62174-46-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-38-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index c250943dde..2c8002af54 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2461,9 +2461,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vf=
mv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 =3D tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2477,15 +2483,21 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_v=
fmv_v_f *a)
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
+            t1 =3D tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest =3D tcg_temp_new_ptr();
             desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8=
, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
=20
             tcg_temp_free_ptr(dest);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
--=20
2.31.1


