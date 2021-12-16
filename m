Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C8477DBA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:38:25 +0100 (CET)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxWC-00038c-OV
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKm-000152-ME; Thu, 16 Dec 2021 15:26:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63146
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKk-0007Dc-Sd; Thu, 16 Dec 2021 15:26:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKAw29014258; 
 Thu, 16 Dec 2021 20:26:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmwwud3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDDi3019538;
 Thu, 16 Dec 2021 20:26:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQJQZ27394328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CD1E52051;
 Thu, 16 Dec 2021 20:26:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id F012452050;
 Thu, 16 Dec 2021 20:26:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4B8212201A0;
 Thu, 16 Dec 2021 21:26:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 002/101] hw/ppc/mac.h: Remove MAX_CPUS macro
Date: Thu, 16 Dec 2021 21:24:35 +0100
Message-Id: <20211216202614.414266-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZvlTgEkrBNTnbjfnYL9ZBR3ycwDuF1Bt
X-Proofpoint-ORIG-GUID: ZvlTgEkrBNTnbjfnYL9ZBR3ycwDuF1Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The mac.h header defines a MAX_CPUS macro. This is confusingly named,
because it suggests it's a generic setting, but in fact it's used
by only the g3beige and mac99 machines. It's also using a single
macro for two values which aren't inherently the same -- if one
of these two machines was updated to support SMP configurations
then it would want a different max_cpus value to the other.

Since the macro is used in only two places, just expand it out
and get rid of it. If hypothetical future work to support SMP
in these boards needs a compile-time-known limit on the number
of CPUs, we can give it a suitable name at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211105184216.120972-1-peter.maydell@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/mac.h          | 3 ---
 hw/ppc/mac_newworld.c | 3 ++-
 hw/ppc/mac_oldworld.c | 3 ++-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 22c8408078d2..a1fa8f8e41a9 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -36,9 +36,6 @@
 #include "hw/pci-host/uninorth.h"
 #include "qom/object.h"
=20
-/* SMP is not enabled, for now */
-#define MAX_CPUS 1
-
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
=20
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7bb7ac39975f..4bddb529c2a6 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -581,7 +581,8 @@ static void core99_machine_class_init(ObjectClass *oc=
, void *data)
     mc->desc =3D "Mac99 based PowerMAC";
     mc->init =3D ppc_core99_init;
     mc->block_default_type =3D IF_IDE;
-    mc->max_cpus =3D MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus =3D 1;
     mc->default_boot_order =3D "cd";
     mc->default_display =3D "std";
     mc->kvm_type =3D core99_kvm_type;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index de2be960e6c4..7016979a7cd0 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -423,7 +423,8 @@ static void heathrow_class_init(ObjectClass *oc, void=
 *data)
     mc->desc =3D "Heathrow based PowerMAC";
     mc->init =3D ppc_heathrow_init;
     mc->block_default_type =3D IF_IDE;
-    mc->max_cpus =3D MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus =3D 1;
 #ifndef TARGET_PPC64
     mc->is_default =3D true;
 #endif
--=20
2.31.1


