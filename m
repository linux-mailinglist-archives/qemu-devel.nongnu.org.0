Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7F495B6C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:58:38 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoof-0000QM-SE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn02-0007UN-RA
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzp-0004B6-0n
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744921; x=1674280921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HMRt8uENsuoDQXvLBUl+QT8dUT3GmmF6KkO/SuCa9Gw=;
 b=dJ0wqzo2M+96APW8r37KulkBTgLDhFRJk70qHTKtt0qMSpgL9Hb/0zDW
 YHZECUEmDidGinBAAtjBZEsPLWfFgQQTqyqVKY25MxkaQX6lz+6rIiphK
 ezUmICrjycdmMIjxr3wBOObvwj9aL8leJXwzFAX0ohuS9yKrXhq2dlqqK
 CWiqyoCPbNjVz1KUJRQyg5TdhOIUecPFJzPg5AjJYMNHXzRmaekc5NiQw
 r4N/ufF0eYO+PgQoWaYFa+N/fS9ZimPs96sASJSjorY/O75O1/iF/XImW
 N2eCa0ce6Ooe+7XZjdtFqc7eaDF9gteLtU6oleVDE2ag1Hl3Y/fDyHCS3 w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082988"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:52 +0800
IronPort-SDR: rtSaZGcjF7LkDVTt1W6Yj3qo8jbBWUAlo2W4R5PwDS07gZGwtZ2u6Akl5Ac53tpwBxk04Swe+3
 dU6G9PTOsE4OrmzG95dxKDBJb42DasuLsWOjG3hdccCqEHfCOAa6+/ngPQFFevXiqz9QZ87Xt2
 mAt3uVJRU11minfZZapVN/s3WOU7VFVtfHiHuCs6zSYhZcNI3aP7W+cNITR/QXE0OK1nJNzOQ2
 N/NF6cxGyS2pxbQBYApHYVLeYi1xYKrCQVLnbgZL6UXSuvEfzlonv/gmH4HRqoOskYvab7Lx6j
 Ym7yElrXT+r6kgll5B4iqX6l
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:19 -0800
IronPort-SDR: xdBeSUB2a0MegnYrg6dpnnR2VeL4LV04EV5U/0LgFV/CE55/U3STH7b8JFVvVG4fdQaLhc9FfD
 W6VgUy9z8p8Umn7sgUeuu3cYVb5f0Dz+7oF3B8kdoY26yn7qVq1Ohz8x66R51ioQkqgVQ/kn4C
 h8n5L62hzeXUYcftjjdT+F7d8Ewcf6sNdjO16xCzboEj+BjcYH2yRaAjTExjR3XuCdoOBjy5nQ
 QJYlvT8A8aWsd2K6f9U/gWfCmL41FURI+E15ChrygC/EVq3qklx6xkNwz7vGVETnPShWdEnhSb
 tFg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7z81Gg7z1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744851; x=1645336852; bh=HMRt8uENsuoDQXvLBU
 l+QT8dUT3GmmF6KkO/SuCa9Gw=; b=JBOgcbcrj026HJbGLTPYnrLzoJMKhaFez1
 qilVcKOiJk5AOxZcxzcMl++TJn97yTgoD8eY6y7PEO+iwHUpl0HVRHMi613QgGMJ
 w9gJCJ/dSzu1yS9BVfshRLW5m/el30Eh84RYz4L98xjVLDG/tuil9b9TXgjN7WCZ
 dFnNK8joOy2oQA1cr78oyn1Z8NiEKDlruUSsohMbz/rpBUVfq/g9L8Wbhi6J62hf
 QhXFb3v6PGDkQHxNKKa2zSbaJ2I24mRMXL8TsLdIv27X0tw3B4isBfk0PxOchg+P
 ZzBJ4VAjwTfTWXOWgCHHlWvrvGylwsiiqT3GsBzJk7Zxqq5q1SEw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 99pzHK4yNLpt for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7z50P6hz1RvlN;
 Thu, 20 Jan 2022 22:00:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/61] target/riscv: rvv-1.0: Add Zve32f support for scalar fp
 insns
Date: Fri, 21 Jan 2022 15:58:00 +1000
Message-Id: <20220121055830.3164408-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

Zve32f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=3D32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-14-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index fd6e74c232..fe4ad5d008 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
=20
+static bool require_zve32f(DisasContext *s)
+{
+    /* RVV + Zve32f =3D RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve32f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve32f ? s->sew <=3D MO_32 : true;
+}
+
 static bool require_zve64f(DisasContext *s)
 {
     /* RVV + Zve64f =3D RVV. */
@@ -2229,6 +2240,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *=
a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2310,6 +2322,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *=
a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2532,6 +2545,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2598,6 +2612,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rm=
rr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2612,6 +2627,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rm=
rr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2634,6 +2650,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
@@ -3368,6 +3385,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfm=
v_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
@@ -3395,6 +3413,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
@@ -3447,6 +3466,7 @@ static bool fslideup_check(DisasContext *s, arg_rmr=
r *a)
 {
     return slideup_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -3454,6 +3474,7 @@ static bool fslidedown_check(DisasContext *s, arg_r=
mrr *a)
 {
     return slidedown_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
--=20
2.31.1


