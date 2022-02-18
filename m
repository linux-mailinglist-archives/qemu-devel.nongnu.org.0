Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677344BB7F9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:24:08 +0100 (CET)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1Mt-0005H8-Gq
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fq-0001Ae-6n; Fri, 18 Feb 2022 05:39:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fh-0005jK-Ng; Fri, 18 Feb 2022 05:39:37 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9pRNb039628; 
 Fri, 18 Feb 2022 10:38:58 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea96n8xp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAcLE4020501;
 Fri, 18 Feb 2022 10:38:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3e64ha6psn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcsF837814564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED072AE05A;
 Fri, 18 Feb 2022 10:38:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA917AE045;
 Fri, 18 Feb 2022 10:38:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:53 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F0F73220294;
 Fri, 18 Feb 2022 11:38:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 35/39] target/ppc: Rename spr_tcg.h to spr_common.h
Date: Fri, 18 Feb 2022 11:38:23 +0100
Message-Id: <20220218103827.682032-36-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: loMVo0vXRsiA9P_XXyH8XAWpi2Srnsu2
X-Proofpoint-GUID: loMVo0vXRsiA9P_XXyH8XAWpi2Srnsu2
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=813 clxscore=1034 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Initial intent for the spr_tcg header was to expose the spr_read|write
callbacks that are only used by TCG code. However, although these
routines are TCG-specific, the KVM code needs access to env->sprs
which creation is currently coupled to the callback registration.

We are probably not going to decouple SPR creation and TCG callback
registration any time soon, so let's rename the header to spr_common
to accomodate the register_*_sprs functions that will be moved out of
cpu_init.c in the following patches.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-24-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/{spr_tcg.h =3D> spr_common.h} | 4 ++--
 target/ppc/cpu_init.c                  | 2 +-
 target/ppc/translate.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename target/ppc/{spr_tcg.h =3D> spr_common.h} (99%)

diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_common.h
similarity index 99%
rename from target/ppc/spr_tcg.h
rename to target/ppc/spr_common.h
index df2abacc644f..5aec76ade4dd 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_common.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
  */
-#ifndef SPR_TCG_H
-#define SPR_TCG_H
+#ifndef SPR_COMMON_H
+#define SPR_COMMON_H
=20
 #define SPR_NOACCESS (&spr_noaccess)
=20
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 452dbdda4db6..f0bbe340e4fd 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -44,7 +44,7 @@
=20
 #include "helper_regs.h"
 #include "internal.h"
-#include "spr_tcg.h"
+#include "spr_common.h"
 #include "power8-pmu.h"
=20
 /* #define PPC_DEBUG_SPR */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2eaffd432a9d..ecc5a104e049 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -35,7 +35,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
-#include "spr_tcg.h"
+#include "spr_common.h"
=20
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
--=20
2.34.1


