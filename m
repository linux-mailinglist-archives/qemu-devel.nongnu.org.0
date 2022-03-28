Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F94E8F20
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 09:37:28 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYjwN-0001AM-Fm
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 03:37:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nYjs9-0006BY-Ba; Mon, 28 Mar 2022 03:33:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nYjs7-0000Km-LO; Mon, 28 Mar 2022 03:33:04 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22S7RvXJ028457; 
 Mon, 28 Mar 2022 07:32:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f38nbr2vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 07:32:49 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22S7SPca029313;
 Mon, 28 Mar 2022 07:32:48 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f38nbr2uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 07:32:48 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22S7JPZG026888;
 Mon, 28 Mar 2022 07:32:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3f1tf8tv7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 07:32:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22S7WhBa38011236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 07:32:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37683A405C;
 Mon, 28 Mar 2022 07:32:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0F7FA405F;
 Mon, 28 Mar 2022 07:32:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Mar 2022 07:32:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.26.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 221EB220383;
 Mon, 28 Mar 2022 09:32:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 1/1] target/ppc: fix helper_xvmadd* argument order
Date: Mon, 28 Mar 2022 09:32:39 +0200
Message-Id: <20220328073239.281464-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328073239.281464-1-clg@kaod.org>
References: <20220328073239.281464-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZjEjc4mWbRaUQy2hJuMLNkNXzBu_iC3-
X-Proofpoint-GUID: 49RpK6P2hMP9MYtxXXep7Ew0xXgJNtUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=913
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203280042
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

When the xsmadd* insns were moved to decodetree, the helper arguments
were reordered to better match the PowerISA description. The same macro
is used to declare xvmadd* helpers, but the translation macro of these
insns was not changed accordingly.

Reported-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Fixes: e4318ab2e423 ("target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][d=
s]p to decodetree")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220325111851.718966-1-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index e67fbf2bb8ed..d1f633331444 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1324,31 +1324,31 @@ TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQ=
P, gen_helper_XSNMSUBQPO)
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)       =
      \
 static void gen_##name(DisasContext *ctx)                               =
      \
 {                                                                       =
      \
-    TCGv_ptr xt, xa, b, c;                                              =
      \
+    TCGv_ptr xt, s1, s2, s3;                                            =
      \
     if (unlikely(!ctx->vsx_enabled)) {                                  =
      \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                          =
      \
         return;                                                         =
      \
     }                                                                   =
      \
     xt =3D gen_vsr_ptr(xT(ctx->opcode));                                =
        \
-    xa =3D gen_vsr_ptr(xA(ctx->opcode));                                =
        \
+    s1 =3D gen_vsr_ptr(xA(ctx->opcode));                                =
        \
     if (ctx->opcode & PPC_BIT32(25)) {                                  =
      \
         /*                                                              =
      \
          * AxT + B                                                      =
      \
          */                                                             =
      \
-        b =3D gen_vsr_ptr(xT(ctx->opcode));                             =
        \
-        c =3D gen_vsr_ptr(xB(ctx->opcode));                             =
        \
+        s2 =3D gen_vsr_ptr(xB(ctx->opcode));                            =
        \
+        s3 =3D gen_vsr_ptr(xT(ctx->opcode));                            =
        \
     } else {                                                            =
      \
         /*                                                              =
      \
          * AxB + T                                                      =
      \
          */                                                             =
      \
-        b =3D gen_vsr_ptr(xB(ctx->opcode));                             =
        \
-        c =3D gen_vsr_ptr(xT(ctx->opcode));                             =
        \
+        s2 =3D gen_vsr_ptr(xT(ctx->opcode));                            =
        \
+        s3 =3D gen_vsr_ptr(xB(ctx->opcode));                            =
        \
     }                                                                   =
      \
-    gen_helper_##name(cpu_env, xt, xa, b, c);                           =
      \
+    gen_helper_##name(cpu_env, xt, s1, s2, s3);                         =
      \
     tcg_temp_free_ptr(xt);                                              =
      \
-    tcg_temp_free_ptr(xa);                                              =
      \
-    tcg_temp_free_ptr(b);                                               =
      \
-    tcg_temp_free_ptr(c);                                               =
      \
+    tcg_temp_free_ptr(s1);                                              =
      \
+    tcg_temp_free_ptr(s2);                                              =
      \
+    tcg_temp_free_ptr(s3);                                              =
      \
 }
=20
 GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
--=20
2.34.1


