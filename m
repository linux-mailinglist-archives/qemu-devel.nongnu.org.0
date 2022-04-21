Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FA5098B5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:15:29 +0200 (CEST)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhR2G-0007Fu-Ie
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRW-0005MX-H9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:32 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRS-0007yk-LT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523046; x=1682059046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NW3kHKqkkttjg3GYn6KXhnRKzaKSjFmEneLo4jSSW+g=;
 b=HyOA+tvomdgJSE6Q9ehFqF+ddhdxyJ+2Nm4FutFSbZDXbe1nU35WH+5m
 KKXKNDU0zN6PUFx67nM0Qsf2cvrW1qVWhXG1/IwqzGY03s5catIA07B+r
 FyqAsIHJ0hmWDWS5lf2kqLi4U7TDlOfCWmfyfEUJyKM7qDslo2+wVlCDM
 dwSv5PWoaMw0zdIBIHe5Yv+T5lwD8Sf6PwZOwJiC3sqesc4Mc/ohCe2ZS
 xOtuCNCVEvkhtWci+FE1oJNc9bLc2a8bRtUV6TKFmBG7zYOKA7kfFfIoi
 F3vFKRfxBM1k5xEwoJD1kxYZH7Qs9kVnAB+XPGY9uWNoiTuyAEmQ7/HAQ g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639979"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:24 +0800
IronPort-SDR: zEcJcEaXthpCl7veffl740Ao6/Oc2+evLq8cpiSc6Zhr50oj+12WXl5VJW8CZbE8JAmrhg7LIk
 AzPF3sXBVgtNL3yuzKxRimMDFdgvxezWXZFYZ6/ZDiRI0kdjt47SKhcN/f3OsJyfAgJJ6PG0Lz
 6SqeDX2mqMpujzb31OjXM6G1EWApRsdru2e7T0d77BeFrxwOwff3cddRGIVcF0k82GnlWVAGy1
 ciyM4zK6EDmf6986KPuvnpfTUFvPUvvfajwtW0sRI0Ma7ZpK7HFcuxMv6ubXB2ZArwzj5K5bWZ
 NljkwgzBoFy349RWK49uF9gG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:27 -0700
IronPort-SDR: LmtgSoBoS84+XZgihvNzXNwuATkD2Her0YO2hVShI9/NlALT9H1I9dV0JlgCYZwWgHegzdPj3v
 k+Oacpk4YvbfGkLRGEQuCHW0fR+rbQRoKhlGicSfhwgbhsUVTsjkrKz2Tfo1NtmH+Va+Fd8jqJ
 9w+kINg+6GnTa4K1vo/kragkR26rLn07QmQyn4T7E0kUD+KNdoa1DsIJD+iuT2afWt0BeV9Rn6
 3F1suSOdwnyWy/KWktMApn7Lvziy4lWWEhFx31b/NaN+3g8Jqw4lp42WBQuB14GqbDOOyY3xOI
 9hc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWm2ZTlz1SVp2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523043; x=1653115044; bh=NW3kHKqkkttjg3GYn6
 KXhnRKzaKSjFmEneLo4jSSW+g=; b=gD1gtm22ntyCxDQNF/bo377EKHOOBhDvho
 MdQllcRnToWAWiljDFLfefOuHFWXYflsJde0nnEdhwsrzZTmJgn7sfpU5U+DH2BS
 zZxXiyOVpJETMgvY/3UYyGmEUruAN2OMfZHqFK7yn27ODEHcyD01j0s7tpDMzqzF
 lk8GXEnPoqUrKcGCK50PvMN5JiZXOfhiMFIO00mabKzNoNYiS9ydSezb1no/RKqg
 QMwPZO0SQ1RjPLdUIz5CCr3f0zPqKeNtvvm/TgnbOKHFJGXdhsVu7OedDmgxihk8
 7i+JIz+NpxbZS6DYWQXEbF6l1c+zsa+LMRJ1u156Y7AGJgu1G7pA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B9gNJtzr3kMI for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWj0S7gz1Rvlx;
 Wed, 20 Apr 2022 23:37:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/31] target/riscv: optimize condition assign for scale < 0
Date: Thu, 21 Apr 2022 16:36:11 +1000
Message-Id: <20220421063630.1033608-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

for some cases, scale is always equal or less than 0, since lmul is not l=
arger than 3

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 8d675db9a2..b336d57270 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1198,7 +1198,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 static inline uint32_t MAXSZ(DisasContext *s)
 {
     int scale =3D s->lmul - 3;
-    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
+    return s->cfg_ptr->vlen >> -scale;
 }
=20
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
@@ -3597,8 +3597,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
=20
     if (a->vm && s->vl_eq_vlmax) {
         int scale =3D s->lmul - (s->sew + 3);
-        int vlmax =3D scale < 0 ?
-                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
+        int vlmax =3D s->cfg_ptr->vlen >> -scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
=20
         if (a->rs1 =3D=3D 0) {
@@ -3630,8 +3629,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
=20
     if (a->vm && s->vl_eq_vlmax) {
         int scale =3D s->lmul - (s->sew + 3);
-        int vlmax =3D scale < 0 ?
-                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << =
scale;
+        int vlmax =3D s->cfg_ptr->vlen >> -scale;
         if (a->rs1 >=3D vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
--=20
2.35.1


