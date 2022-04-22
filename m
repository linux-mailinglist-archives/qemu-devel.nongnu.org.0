Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C550ACEE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:47:05 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhRw-0004af-Gv
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJC-00075F-9B
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJA-0005Rv-Fu
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587880; x=1682123880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NW3kHKqkkttjg3GYn6KXhnRKzaKSjFmEneLo4jSSW+g=;
 b=Ky+QhNvSeKjRzLd3kt4a7rjWrdxWBmffn8YG0iRRcA9pw63I7FfTh1OM
 lS/sGYI7cFuXz2kOdnZ7W1uZ6XxeLBn/Uuc4MaVLIlxIk/RMxbjfr1I4r
 l+aoP3j0POWjZ7rO/6y8S6d+TFENLVy31+GzJRC4VV87UAkj/Zs5QeIxh
 BL6efIPS75+DdU56TWoqXweKUulhdJVF02Jp/6nTIOzq/JM0s3lJ+yL6k
 IR/Q7YJl1NfqelLFTkB5XZgj7YkQap1FumzShT2Tl58smeX/edZxZAsYI
 A9ddESYDZ8WUQFlI9LCS9yzwEWTm+21jY79CHHXjwurNxdVyUaq8XSrVD Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483378"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:52 +0800
IronPort-SDR: typ9kcSX1sr0nzUDILCJKP2hrxUUobUmY3xJbR/hfK2ZQrQBtOvOEAbpdcMoXz9miAVnmwHdI3
 ViKy9qcHHIY2Q0o7dH9WK/3exoWVnSy1Gz72koK0nkER/GqOHnyN9hI76oCBs0DiG2fbLV1YSg
 XbXJSHXuW0q78wUarV6uXcCBMnCta+Rveb6WsajIiTL/Aam9n2cxb+2hLjV3teC+FrtyNXUgo7
 IvGhsDo3kSfyiFbMqzFBu4YqXbMclQPYFfZS6+n+VaaM1Wf4kaPVEznXOoFiEwXMPR9gnOolvI
 djGNZWaWpESzaZU6qY2yy2HZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:08 -0700
IronPort-SDR: stP/pyVbppQ5RZJe7jDR60n+ISx6iMJoXO7BVw5BZkJO0hbgYi85FWCUvqpxgqRNwgq9aZipNC
 weRB+Y/ERLd6MvMKzoWcRg2PCh5ZLxyp5TecIS+cjR+SvufrkvjBVq/uZlnlVxJ5aN3+Bb9Rtl
 QKB+SuJAzB6YqFTMov3yBhxDXxmSWgg6jiWWf3mFr5slvjlIekaj30EoiNAPHD/T5EWGoyxx0d
 nhBhIeHU5gfcG62Lm3Nlb1Eu3BecwssRhylWHsP4HLtQADyDJ+CgCKw0YlVKQio+cNvcZK9v7j
 A6A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVR5mh3z1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587871; x=1653179872; bh=NW3kHKqkkttjg3GYn6
 KXhnRKzaKSjFmEneLo4jSSW+g=; b=kh2Pvw2gD+3sITFJ7x+lvqHFvky/ic+Hkt
 pIR+WBwlYjHIrhD19ApE0gIR9P1Ut4/14C93Gad8t3/K8mBUVtzhFqUzKtEq0lAS
 T2LOus1tnjj1LxseTtDzfwVZrXNmkOMSGFqzatUqSjsFsWw3l+PjdT7HF1aRSU9R
 i3gH/PkrqEmQMHj8qSSic3HJPMwHdptSWxM0RaNDeH6t72yV9HO1DMj/A1QWTbRH
 lhN0EkttmEANRRte2hxRK81nawSZsiR1NYRYPelmikc7IoZGgK1AHRaYLn0uySer
 bfvL8Ekpj2GDT6D5Kk8DdkGRej5CzCAQBwpCl6XckQOUtKYOg4Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rHJencO2WBo4 for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:51 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVL3wwMz1Rwrw;
 Thu, 21 Apr 2022 17:37:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 12/31] target/riscv: optimize condition assign for scale < 0
Date: Fri, 22 Apr 2022 10:36:37 +1000
Message-Id: <20220422003656.1648121-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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


