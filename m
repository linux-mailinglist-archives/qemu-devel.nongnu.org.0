Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71ABDE4D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 14:51:10 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD6lB-0003FW-Ad
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 08:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gf-0001Hv-I9
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gd-0002Fv-8W
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:29 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56118 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iD6gc-0002EZ-RG
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id BCD551A23C4;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9388F1A2012;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/20] target/mips: Clean up translate.c
Date: Wed, 25 Sep 2019 14:45:58 +0200
Message-Id: <1569415572-19635-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly fix errors and warnings reported by 'checkpatch.pl -f'.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index f211995..cc5af2a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7118,7 +7118,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
             tcg_gen_andi_tl(arg, arg, ~0xffff);
             register_name =3D "BadInstrX";
             break;
-       default:
+        default:
             goto cp0_unimplemented;
         }
         break;
@@ -7545,7 +7545,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
         case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_ld_tl(arg, cpu_env,
-                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
+                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
             tcg_gen_ext32s_tl(arg, arg);
             register_name =3D "KScratch";
             break;
@@ -8295,7 +8295,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
         case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_st_tl(arg, cpu_env,
-                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
+                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
             register_name =3D "KScratch";
             break;
         default:
@@ -8387,17 +8387,20 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg=
, int reg, int sel)
             break;
         case CP0_REG01__YQMASK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMas=
k));
+            tcg_gen_ld_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_YQMask));
             register_name =3D "YQMask";
             break;
         case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
hedule));
+            tcg_gen_ld_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name =3D "VPESchedule";
             break;
         case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
heFBack));
+            tcg_gen_ld_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name =3D "VPEScheFBack";
             break;
         case CP0_REG01__VPEOPT:
@@ -8412,7 +8415,8 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
     case CP0_REGISTER_02:
         switch (sel) {
         case CP0_REG02__ENTRYLO0:
-            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Entry=
Lo0));
+            tcg_gen_ld_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_EntryLo0));
             register_name =3D "EntryLo0";
             break;
         case CP0_REG02__TCSTATUS:
@@ -8756,7 +8760,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config5));
             register_name =3D "Config5";
             break;
-       /* 6,7 are implementation dependent */
+        /* 6,7 are implementation dependent */
         case CP0_REG16__CONFIG6:
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config6));
             register_name =3D "Config6";
@@ -8837,7 +8841,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
         }
         break;
     case CP0_REGISTER_21:
-       /* Officially reserved, but sel 0 is used for R1x000 framemask */
+        /* Officially reserved, but sel 0 is used for R1x000 framemask *=
/
         CP0_CHECK(!(ctx->insn_flags & ISA_MIPS32R6));
         switch (sel) {
         case 0:
@@ -9022,7 +9026,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
         case CP0_REG31__KSCRATCH6:
             CP0_CHECK(ctx->kscrexist & (1 << sel));
             tcg_gen_ld_tl(arg, cpu_env,
-                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
+                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
             register_name =3D "KScratch";
             break;
         default:
@@ -9112,12 +9116,14 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg=
, int reg, int sel)
             break;
         case CP0_REG01__VPESCHEDULE:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
hedule));
+            tcg_gen_st_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_VPESchedule));
             register_name =3D "VPESchedule";
             break;
         case CP0_REG01__VPESCHEFBACK:
             CP0_CHECK(ctx->insn_flags & ASE_MT);
-            tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
heFBack));
+            tcg_gen_st_tl(arg, cpu_env,
+                          offsetof(CPUMIPSState, CP0_VPEScheFBack));
             register_name =3D "VPEScheFBack";
             break;
         case CP0_REG01__VPEOPT:
--=20
2.7.4


