Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8D5E9048
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 00:17:01 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocDSF-0006W4-Sm
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 18:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocDPJ-0004Z6-Qy
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 18:13:57 -0400
Received: from mout.gmx.net ([212.227.17.22]:46055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ocDPE-0008OU-V4
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 18:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664057630;
 bh=glL2oKbyCalCbQdc6Ns11sOFkCFrYp5s1DYoXdmGg5k=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Sjs/BiQPkOAP9WcoTMXy+eIgPYK9SiM6kKQ6dQmzkVYi6dJ5S47uJxcui+ENmOa2R
 FjGTmHWxsbNnlFmbY+heA0RFzBJsrvMx8uH8PW5iLUYQrRjIp4nkpYHQTp58Ph4mOg
 FpbmDxY84U6yzaXt+GbSq7GaoeGMXR+DmGarBHZk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.155.187]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1orgxB3kuO-00JuKO; Sun, 25
 Sep 2022 00:13:49 +0200
Date: Sun, 25 Sep 2022 00:13:48 +0200
From: Helge Deller <deller@gmx.de>
To: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Generate illegal instruction exception for
 64-bit instructions
Message-ID: <Yy+BHMfYE3fYVq6k@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:fnULbI002Rf4n4x3z76/wa9cO3LHf2S9MmLstxTsZQJCAzs29TF
 vVVFql4xZDZTz8n0eOT79wse4geWnSDIsUBkpZDiw3KIBMmg4abat7wgV+tHz1tPvwqcPJX
 sXBt2cQ3q6Rvk8JFSmIWPzCM58R6AWsZTz20QBOdIy/PE9xJEGS2Ni54zhSosHy1ZfEPijC
 KKEyNSWITX0BGFUbl1wHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GcMc6AhAaq8=:RypzgO5kWoLdh1sjy8aTuk
 s6MouGbU3nNEL2I/xo5HaH8uBxMiLwjU2gZQrV/gQ/UuA1cxmkfgmjJOoR2SCbva4jT1exq0Y
 nvRYSJ01TP/pFCPGu3pnWP6D1jvYqZ74Dcblnm3xSEUr07Ff9c9Iwn9nDmW2aCTdwIrZelfcV
 ILSsgWyKD8t7GTYWzkagGNgNRAikBAPoCzUOUFfPy4z7ISOvOI66mGH/2lkh8kdreUb+04P2j
 Or7ocB3/ZNOzz4gYr/DwvvzHZ68XWbM+ZM+1So8N46v/mHTT+42oJxl58MZ4Je3DxNSqBvcib
 xebPjrP1FKwsIjmHyFnQlGcrLp8h5nCWHWjcq0Fik/sItH2g8lOMQCj2k6EuOJm9yfUx2vRQa
 MhfsEpbpJYLdHzRcgperwoPNcPpZwI3cX4FCMODNSpSLdY2P7t1wMXaLRTOMjNpp1n5v8tv34
 xv0MBSPJjoQ7tzwH/L7gRQtFOieL8N/+vzLI1MmWkXuReGAQlKymE8QatPmt3sd8XXWmNSOdT
 OTY3TeUCrO9cWoLKiWG01OSNbZ8CCLcebqangnEbvF7IVl4af9tmolwShCrNp7AjjQwAA6Kfd
 p3m9LijMIbyu61icYY79+ImicCzo6cx+M6uj3h8gFP+OEKisaS7jvR9x0j41yRxR0qt9Rkr52
 us2gkQC3lkFK81u+VlgdK19X8ReExY2CFaBbpyALcTRC7X4XRRgdLRtF4tTExsZOw6G8l0rsk
 WPqJx/xMKrEYjINxxEDtgULU+6fr07JvtWN8ygqxOrtDpQCd5SbCaNOTKt8WMlPTrKM5Q7v0x
 APgJE03VC91XDgZ+h6RxWZCIxqpC3sXyQDVc5afkjmt/WObqhnZ78Nv4OJ0MEVkKvVKsNZn1u
 knUMybjlO2J8JEx0jqc7n4e4bsQQkw4fjwBopgCWhMdrgV7YqXDMMR5sbUCI/t0zxFU2n9LDT
 OtSWts7yWCyCs0Vr7cyv00npu+dAcW5olY5L6H9X2klQsMT3zABh/jpCbl99gW2mJdRJgEfVR
 5SmD2JC6LytJ5tx5SCtoeaxmRWlF8GbGNB0FhCVMuLZk5XqRVGdlmo0bMCDHm1XvFcYSrW9J+
 9myc4lwEetWTLTx3GWC/KecDsH1y/I0eKbvYEaX96PdhYWjSIjsc59kr1Y5td49ICFbMcg7ps
 pxPNm53vCm0xrBOPGzEqbguhCy
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Qemu currently emulates a 32-bit CPU only, and crashes with this error
when it faces a 64-bit load (e.g.  "ldd 0(r26),r0") or 64-bit store
(e.g. "std r26,0(r26)") instruction in the guest:

ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not be=
 reached

Fix this by adding checks for 64-bit sizes and generate an illegal
instruction exception if necessary.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b8dbfee5e9..287cc410cd 100644
=2D-- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -1568,7 +1568,12 @@ static bool do_load(DisasContext *ctx, unsigned rt,=
 unsigned rb,
         /* Make sure if RT =3D=3D RB, we see the result of the load.  */
         dest =3D get_temp(ctx);
     }
-    do_load_reg(ctx, dest, rb, rx, scale, disp, sp, modify, mop);
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && (mop & MO_SIZE) > MO_3=
2)) {
+        gen_illegal(ctx);
+        dest =3D tcg_constant_reg(0);
+    } else {
+        do_load_reg(ctx, dest, rb, rx, scale, disp, sp, modify, mop);
+    }
     save_gpr(ctx, rt, dest);

     return nullify_end(ctx);
@@ -1631,7 +1636,11 @@ static bool do_store(DisasContext *ctx, unsigned rt=
, unsigned rb,
                      int modify, MemOp mop)
 {
     nullify_over(ctx);
-    do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp, sp, modify, mop)=
;
+    if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && (mop & MO_SIZE) > MO_3=
2)) {
+        gen_illegal(ctx);
+    } else {
+        do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp, sp, modify, =
mop);
+    }
     return nullify_end(ctx);
 }


