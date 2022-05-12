Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CD524A1E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:17:49 +0200 (CEST)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5tE-0006p9-Rk
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1np5Ki-00053G-RS
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:42:09 -0400
Received: from mout.web.de ([212.227.15.4]:58211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1np5Kh-0000Sj-1p
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1652348523;
 bh=jI2hq8UQnG5jPu25KhFmaqUeigqXEoGWLGSPfVGe//E=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=MF2/r/T/IzFqGdiNEpHtEp9LUW8Yodmk3rzW5BsYkQUOyeNxT1Jn96xBeKGAteV16
 ZtJE2kqKHWvjsUBR8+qQQ3C9pHXUX972n9HNHOswkGBd6ZXn/kjassPTDt+luPHnk8
 mBJw1I9oZLNjkglh8r9eRKCS4H8ip2+Tp3s/GD7g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MD5nx-1ngb0M0v9F-008pOc; Thu, 12
 May 2022 11:42:03 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: [PATCH] Fix aarch64 debug register names.
Message-Id: <4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de>
Date: Thu, 12 May 2022 11:42:02 +0200
To: qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:EPMk/0Axs8mx7pF2XevvxA/FX/+94qr+nvL+ZI4AJh4XyCMTDZk
 qGqrVk0IqhKpkdVD8jG+lPd3l+Vt3R83BznDGv3OTRScXjP8zbDjH3+SYAxcmxw5nKcGg8w
 kd1buyQROGFwSEvgk/W5M9B1Q3rrucKqqVZx/qmIprsLU4SQDaBmRJj+5alqpdFrr+2nAmp
 u1e8tmSWabuncTwOBnhzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wz/W8W0AuFA=:H5ATdZf2wpmHM7q8359quK
 I2+u4ZVMyvW6MUbaNaGD06YAfUcjniL/3yoTiIn8RaT29UcDiEQ8i9zSzu1gnbiBz+rHMmQgj
 6OfDV+moKEFDwIdj4uh6m74Tz6WfCbI3NUN/7JtGE3ozqzmcMLcwCZKx4EusBs3nuXHHH0ggu
 /Tw81zZ8CgWhMY0BbEDpLOmMSaX0H3HHuARvjcY6elvY9LcctOpdmQZ3610pkewaVPQiJxfvw
 B9LbOl+dlKN0zPGzsakMOxCvobdToKmVhR7hjD70p9UpFXK0UBKWPNkBtMjT3lc9TQxM+Gpds
 4pfBT0/uy7HeDgomZQBdB/J/yE79hk2Dg+Uw61SE+X+9hEP3LzMjnxGDqRbQHLLiglFVHNcig
 p/2N8WeLILRLkll7iNPVL0sb9mkO0aEdCq/K7sAnGmlb4tEPAt7Eukjh8GP7dRYu28nEPcrPK
 ozSFFhFzstTSUobKlA1BxYLNrLzRWZipY+kmwSVgjH8GPs7unGx/DWIKWSJqapoPRH3iJ8ehW
 6hhTiNx6gtBeuob3ZP3dJEKiW1BrerGgT2ToD4hjDxh9EyquTvOi3g1vTrgjlSZ/7IMforU0o
 97EP0geAiDUJdbHmeZ7xZZw51ULGHj99kqXOgRI2Cj81AOdRtkNf/JgMI1+wtx1Hqpb3gHcJw
 WZLgFbn2tofDiSTVkvDo2JzUjUhZv+FgkSkVK69AxMFtQ/Ye/FIEi3f0Vtc9n+V0ozmdzU84U
 FyEUgFyKI9A6Uc3oe3TG3ga7PssObprMeqHACwxtX9JerFdPJiCrnyvsFm+M9/vZOohvyCKXe
 hXNrs3RvRMasmlnu47dtVAPrrXOdlOuDPvGfDZQDoAd2huRWgcabI9iGDBxY6tvcmW0Qtjvrh
 MRdgbeXi8YOGMAgzXn9pFwneeK6olHPmsbm8HwklGdWQMo5OnQuXuGajBTSJawAVme5EK1cHh
 OkCSOAcwPa1Hbv1Ze44uWbzhIuR/axRCkgOFJlA2GU4adQoTTWW8jsa+5mIkcsnwh99hNM+WQ
 kThDVcsP/Pc7+R1V46kDCr3AH2fbShaRU5N3i8eTnKxhDeLXgGODsxBYInfxHEjfHNrhEHWYg
 DmqKBLAn5HipJ8pEGbnYPFmnpBIW34flx+Y1jgbN79LpNOB+JGOeyBltA==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

=46rom 5de17d5aacb9cf21de4c9736b227b0498c607709 Mon Sep 17 00:00:00 2001
From: CHRIS HOWARD <cvz185@web.de>
Date: Thu, 12 May 2022 11:35:17 +0200
Subject: [PATCH] Fix aarch64 debug register names.

Signed-off-by: CHRIS HOWARD <cvz185@web.de>
---
 target/arm/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd81919..0dd97cb905 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6543,14 +6543,16 @@ static void define_debug_regs(ARMCPU *cpu)
     }
=20
     for (i =3D 0; i < brps; i++) {
+        char *dbgbvr_el1_name =3D g_strdup_printf("DBGBVR%d_EL1", i);
+        char *dbgbcr_el1_name =3D g_strdup_printf("DBGBCR%d_EL1", i);
         ARMCPRegInfo dbgregs[] =3D {
-            { .name =3D "DBGBVR", .state =3D ARM_CP_STATE_BOTH,
+            { .name =3D dbgbvr_el1_name, .state =3D ARM_CP_STATE_BOTH,
               .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D =
i, .opc2 =3D 4,
               .access =3D PL1_RW, .accessfn =3D access_tda,
               .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbvr[i]),
               .writefn =3D dbgbvr_write, .raw_writefn =3D raw_write
             },
-            { .name =3D "DBGBCR", .state =3D ARM_CP_STATE_BOTH,
+            { .name =3D dbgbcr_el1_name, .state =3D ARM_CP_STATE_BOTH,
               .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D =
i, .opc2 =3D 5,
               .access =3D PL1_RW, .accessfn =3D access_tda,
               .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbcr[i]),
@@ -6558,17 +6560,21 @@ static void define_debug_regs(ARMCPU *cpu)
             },
         };
         define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgbvr_el1_name);
+        g_free(dbgbcr_el1_name);
     }
=20
     for (i =3D 0; i < wrps; i++) {
+        char *dbgwvr_el1_name =3D g_strdup_printf("DBGWVR%d_EL1", i);
+        char *dbgwcr_el1_name =3D g_strdup_printf("DBGWCR%d_EL1", i);
         ARMCPRegInfo dbgregs[] =3D {
-            { .name =3D "DBGWVR", .state =3D ARM_CP_STATE_BOTH,
+            { .name =3D dbgwvr_el1_name, .state =3D ARM_CP_STATE_BOTH,
               .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D =
i, .opc2 =3D 6,
               .access =3D PL1_RW, .accessfn =3D access_tda,
               .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwvr[i]),
               .writefn =3D dbgwvr_write, .raw_writefn =3D raw_write
             },
-            { .name =3D "DBGWCR", .state =3D ARM_CP_STATE_BOTH,
+            { .name =3D dbgwcr_el1_name, .state =3D ARM_CP_STATE_BOTH,
               .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D =
i, .opc2 =3D 7,
               .access =3D PL1_RW, .accessfn =3D access_tda,
               .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwcr[i]),
@@ -6576,6 +6582,8 @@ static void define_debug_regs(ARMCPU *cpu)
             },
         };
         define_arm_cp_regs(cpu, dbgregs);
+        g_free(dbgwvr_el1_name);
+        g_free(dbgwcr_el1_name);
     }
 }
=20
--=20
2.20.1 (Apple Git-117)



