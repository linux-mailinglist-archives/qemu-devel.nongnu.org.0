Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EB476031
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:05:37 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYem-0000B9-Kw
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:05:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiK-0004yE-5L; Wed, 15 Dec 2021 12:05:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiH-0004ij-2p; Wed, 15 Dec 2021 12:05:11 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfdUv014321; 
 Wed, 15 Dec 2021 17:04:43 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyfdnyytm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3Exm004252;
 Wed, 15 Dec 2021 17:04:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77p799b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGudMI30802276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:56:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E8F7A4053;
 Wed, 15 Dec 2021 17:04:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25B04A4055;
 Wed, 15 Dec 2021 17:04:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:38 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5D5B4220247;
 Wed, 15 Dec 2021 18:04:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 063/102] ppc: Add trace-events for DCR accesses
Date: Wed, 15 Dec 2021 18:03:18 +0100
Message-Id: <20211215170357.321643-51-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FDPZIAUu6si1Z5ch1t18Ai5ZJCVd4QfM
X-Proofpoint-ORIG-GUID: FDPZIAUu6si1Z5ch1t18Ai5ZJCVd4QfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 mlxlogscore=655 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20211206103712.1866296-4-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc.c        | 2 ++
 hw/ppc/trace-events | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index e8127599c907..818d75798584 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1367,6 +1367,7 @@ int ppc_dcr_read (ppc_dcr_t *dcr_env, int dcrn, uin=
t32_t *valp)
     if (dcr->dcr_read =3D=3D NULL)
         goto error;
     *valp =3D (*dcr->dcr_read)(dcr->opaque, dcrn);
+    trace_ppc_dcr_read(dcrn, *valp);
=20
     return 0;
=20
@@ -1386,6 +1387,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, ui=
nt32_t val)
     dcr =3D &dcr_env->dcrn[dcrn];
     if (dcr->dcr_write =3D=3D NULL)
         goto error;
+    trace_ppc_dcr_write(dcrn, val);
     (*dcr->dcr_write)(dcr->opaque, dcrn, val);
=20
     return 0;
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 3bf43fa340fe..602adb83157b 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -119,6 +119,9 @@ ppc_irq_set_state(const char *name, uint32_t level) "=
\"%s\" level %d"
 ppc_irq_reset(const char *name) "%s"
 ppc_irq_cpu(const char *action) "%s"
=20
+ppc_dcr_read(uint32_t addr, uint32_t val) "DRCN[0x%x] -> 0x%x"
+ppc_dcr_write(uint32_t addr, uint32_t val) "DRCN[0x%x] <- 0x%x"
+
 # prep_systemio.c
 prep_systemio_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D=
0x%x"
 prep_systemio_write(uint32_t addr, uint32_t val) "write addr=3D0x%x val=3D=
0x%x"
--=20
2.31.1


