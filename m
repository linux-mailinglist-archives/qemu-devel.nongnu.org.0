Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D347A4D3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:04:37 +0100 (CET)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBmm-0001MF-Ap
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:04:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoi-0004co-C6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:32 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAob-0000DB-B2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976545; x=1671512545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlfhfKZIEJPKcCHdiw5g5+cEGR/5/heselB64SHV/V8=;
 b=ix+pNIz1H83oT579ImEi1p3+RQ4mRlYOdXcrsyDxCOe3IPll6oP66Ww/
 +EVR0sPp+KjoIuKZkk3jsgT2xxhSU0kAHp2FDxO4gBeILp4M2uuhSeTrB
 uY52/iefkOnYNyWInMW4WnNXukOkekxStDzSuSjRlt7d/alUQfFdyl8z8
 QKS9pOOJDqPTeoDhXXFKU+J3YOAdZGwQWysFG4FWGCh51gwsfBp0s5ujA
 +8eSZejSIibNew3AEyWE+T69YYPrBYAWqSXb/vzsqlgp3Ftx7Y1xlpzKm
 JoaUKSCFpWjiEf8ckzAOipYS2j4E7FyQEG7XJ2tiO+KfI7gS1CuYZqBaV Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="300503534"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:17 +0800
IronPort-SDR: d4DINONIqmwVV1/3/T8eMxG/5k2//11ODcA6a8LKyDjUN3KgBENZ+aP3E7jQA5MkZQaulB22Jp
 90g7ngiFavpVw3WqpCXx5GbfVxMLKiSuRYAOyNHZTSqi8OqnjKOeJd3dgQx4wNDA2Kp3ysFRco
 RyGdWDiLtf5xGrmpBL/UUgyjoaLJX+ZhuoAuVCQZEV8DfDa9S0HuIw43egJzpGmMzjv53Wtp8b
 axU/QeYh1eflTahE4eds5FyEw5s4uF1vSMDI1u1uA22du/agcz98QZjCFisRAtB5MwnDllrRF/
 MqdX33Vur7FLsCj33Mrq/rZd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:36:33 -0800
IronPort-SDR: bdnky/MTG9wXCvzRfU4RTOTat2ulxEcx0w5n3ILUjk+x/Ljnx+FGtIcc3JE2FhpqAQ0t7/wXCO
 28a3vE8Aq0qEoDc9+IePBmUTIZr+c2IcO0qEgPbZ/wSroHRCkhVfjcDrCJcDfP5ut7jM4tUu4S
 kf9EhKCAty1UVKtGFmbiAZr9xFepgScUhWMhu0/3naZvuwjNuuMhNLr//rFo8Zk3ly1laTy29T
 W0rNNpPWd2UqzOEO6Xm+E+njfDeWCcd2Acrg9+SwFARjg4N0MweYIMzrbT50jWL4rNpNzV63MB
 jgA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBK0RKyz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976536; x=1642568537; bh=HlfhfKZIEJPKcCHdiw
 5g5+cEGR/5/heselB64SHV/V8=; b=SmTCxI8FqBGtIE1N+Jey+eiswo/J9OQfm/
 8Nw8SIZizq06C3SEAHn3r6gj8CM2ScPGWHsHXojdIgFbmkVn+0iaMOIr8l7WNJl+
 0QYilBvPas9GgSRYymwGzxf2YFDZ3RxpwQLtRBUDWha9KJbr0t+dt5GR+dw4ITP9
 u3StVsVnC4ijJty/OPWOvGtfAn3ob89iLNKwbUAdwpAnvWj046k2RXbtRF5pvf81
 Qy6RUwXf8u7MNGr/QRVsW9/5/IBJEYD41WB9PoiIs0b5OlvFhs9nVV8I+sdqs4uy
 Pf8ozu3M3t4wcd3kxDsBWldt4hlPDPduflpsc3X5dKYCAqy3yNRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iF4eEvl4e8tz for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:16 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBF6Mzvz1RvTg;
 Sun, 19 Dec 2021 21:02:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 75/88] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Mon, 20 Dec 2021 14:56:52 +1000
Message-Id: <20211220045705.62174-76-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

If the frm field contains an invalid rounding mode (101-111),
attempting to execute any vector floating-point instruction, even
those that do not depend on the rounding mode, will raise an illegal
instruction exception.

Call gen_set_rm() with DYN rounding mode to check and trigger illegal
instruction exception if frm field contains invalid value at run-time
for vector floating-point instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-68-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 7589c8ce32..53c8573f11 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2374,6 +2374,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
+        if (rm !=3D RISCV_FRM_DYN) {
+            gen_set_rm(s, RISCV_FRM_DYN);
+        }
+
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         gen_set_rm(s, rm);
@@ -2459,6 +2463,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         TCGv_i64 t1;
=20
         if (s->vl_eq_vlmax) {
@@ -2540,6 +2546,10 @@ static bool opfv_widen_check(DisasContext *s, arg_=
rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_widen_check(s, a)) {                                  \
+        if (FRM !=3D RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] =3D {            \
             gen_helper_##HELPER##_h,                               \
@@ -2627,6 +2637,10 @@ static bool opfv_narrow_check(DisasContext *s, arg=
_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_narrow_check(s, a)) {                                 \
+        if (FRM !=3D RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] =3D {            \
             gen_helper_##HELPER##_h,                               \
@@ -2668,6 +2682,10 @@ static bool opxfv_narrow_check(DisasContext *s, ar=
g_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
+        if (FRM !=3D RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] =3D {            \
             gen_helper_##HELPER##_b,                               \
@@ -3138,6 +3156,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfm=
v_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         unsigned int ofs =3D (8 << s->sew);
         unsigned int len =3D 64 - ofs;
         TCGv_i64 t_nan;
@@ -3162,6 +3182,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         /* The instructions ignore LMUL and vector register group. */
         TCGv_i64 t1;
         TCGLabel *over =3D gen_new_label();
--=20
2.31.1


