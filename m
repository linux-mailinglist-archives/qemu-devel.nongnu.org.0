Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567F47CD77
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:19:43 +0100 (CET)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvuY-0001wS-CZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIp-0008NU-Re; Wed, 22 Dec 2021 01:40:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIo-0003C4-3r; Wed, 22 Dec 2021 01:40:43 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM30rUv038230; 
 Wed, 22 Dec 2021 06:40:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3dygjks0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:34 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6J31q033768;
 Wed, 22 Dec 2021 06:40:34 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3dygjkqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6abT8023595;
 Wed, 22 Dec 2021 06:40:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3d1799suk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BM6eSMG18940366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:40:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F30E4203F;
 Wed, 22 Dec 2021 06:40:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1592742049;
 Wed, 22 Dec 2021 06:40:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:40:28 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4CCFE22028A;
 Wed, 22 Dec 2021 07:40:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/ppc: Print out literal exception names in logs
Date: Wed, 22 Dec 2021 07:40:18 +0100
Message-Id: <20211222064025.1541490-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222064025.1541490-1-clg@kaod.org>
References: <20211222064025.1541490-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HIrio3cJEX7hx4OPcnBGmHJJmDTB6eed
X-Proofpoint-GUID: NC2cxHKsQVOZGVctDqkhSjyESzmmrmYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 clxscore=1034 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It facilitates reading the logs when mask CPU_LOG_INT is activated. We
should do the same for error codes.

Cc: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 75 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f90e616aacda..71ad983e67d6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -32,6 +32,78 @@
=20
 /* #define DEBUG_SOFTWARE_TLB */
=20
+static inline const char *powerpc_excp_name(int excp)
+{
+    switch (excp) {
+    case POWERPC_EXCP_CRITICAL: return "CRITICAL";
+    case POWERPC_EXCP_MCHECK:   return "MCHECK";
+    case POWERPC_EXCP_DSI:      return "DSI";
+    case POWERPC_EXCP_ISI:      return "ISI";
+    case POWERPC_EXCP_EXTERNAL: return "EXTERNAL";
+    case POWERPC_EXCP_ALIGN:    return "ALIGN";
+    case POWERPC_EXCP_PROGRAM:  return "PROGRAM";
+    case POWERPC_EXCP_FPU:      return "FPU";
+    case POWERPC_EXCP_SYSCALL:  return "SYSCALL";
+    case POWERPC_EXCP_APU:      return "APU";
+    case POWERPC_EXCP_DECR:     return "DECR";
+    case POWERPC_EXCP_FIT:      return "FIT";
+    case POWERPC_EXCP_WDT:      return "WDT";
+    case POWERPC_EXCP_DTLB:     return "DTLB";
+    case POWERPC_EXCP_ITLB:     return "ITLB";
+    case POWERPC_EXCP_DEBUG:    return "DEBUG";
+    case POWERPC_EXCP_SPEU:     return "SPEU";
+    case POWERPC_EXCP_EFPDI:    return "EFPDI";
+    case POWERPC_EXCP_EFPRI:    return "EFPRI";
+    case POWERPC_EXCP_EPERFM:   return "EPERFM";
+    case POWERPC_EXCP_DOORI:    return "DOORI";
+    case POWERPC_EXCP_DOORCI:   return "DOORCI";
+    case POWERPC_EXCP_GDOORI:   return "GDOORI";
+    case POWERPC_EXCP_GDOORCI:  return "GDOORCI";
+    case POWERPC_EXCP_HYPPRIV:  return "HYPPRIV";
+    case POWERPC_EXCP_RESET:    return "RESET";
+    case POWERPC_EXCP_DSEG:     return "DSEG";
+    case POWERPC_EXCP_ISEG:     return "ISEG";
+    case POWERPC_EXCP_HDECR:    return "HDECR";
+    case POWERPC_EXCP_TRACE:    return "TRACE";
+    case POWERPC_EXCP_HDSI:     return "HDSI";
+    case POWERPC_EXCP_HISI:     return "HISI";
+    case POWERPC_EXCP_HDSEG:    return "HDSEG";
+    case POWERPC_EXCP_HISEG:    return "HISEG";
+    case POWERPC_EXCP_VPU:      return "VPU";
+    case POWERPC_EXCP_PIT:      return "PIT";
+    case POWERPC_EXCP_IO:       return "IO";
+    case POWERPC_EXCP_RUNM:     return "RUNM";
+    case POWERPC_EXCP_EMUL:     return "EMUL";
+    case POWERPC_EXCP_IFTLB:    return "IFTLB";
+    case POWERPC_EXCP_DLTLB:    return "DLTLB";
+    case POWERPC_EXCP_DSTLB:    return "DSTLB";
+    case POWERPC_EXCP_FPA:      return "FPA";
+    case POWERPC_EXCP_DABR:     return "DABR";
+    case POWERPC_EXCP_IABR:     return "IABR";
+    case POWERPC_EXCP_SMI:      return "SMI";
+    case POWERPC_EXCP_PERFM:    return "PERFM";
+    case POWERPC_EXCP_THERM:    return "THERM";
+    case POWERPC_EXCP_VPUA:     return "VPUA";
+    case POWERPC_EXCP_SOFTP:    return "SOFTP";
+    case POWERPC_EXCP_MAINT:    return "MAINT";
+    case POWERPC_EXCP_MEXTBR:   return "MEXTBR";
+    case POWERPC_EXCP_NMEXTBR:  return "NMEXTBR";
+    case POWERPC_EXCP_ITLBE:    return "ITLBE";
+    case POWERPC_EXCP_DTLBE:    return "DTLBE";
+    case POWERPC_EXCP_VSXU:     return "VSXU";
+    case POWERPC_EXCP_FU:       return "FU";
+    case POWERPC_EXCP_HV_EMU:   return "HV_EMU";
+    case POWERPC_EXCP_HV_MAINT: return "HV_MAINT";
+    case POWERPC_EXCP_HV_FU:    return "HV_FU";
+    case POWERPC_EXCP_SDOOR:    return "SDOOR";
+    case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
+    case POWERPC_EXCP_HVIRT:    return "HVIRT";
+    case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /***********************************************************************=
******/
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
@@ -301,7 +373,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
     int srr0, srr1, asrr0, asrr1, lev =3D -1;
=20
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
+                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
+                  excp, env->error_code);
=20
     /* new srr1 value excluding must-be-zero bits */
     if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
--=20
2.31.1


