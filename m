Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196F48C3DA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:19:51 +0100 (CET)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cbW-0001f5-Jt
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEq-0006TZ-IK; Wed, 12 Jan 2022 06:56:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29718
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEn-0007V0-Ny; Wed, 12 Jan 2022 06:56:24 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CApUed009571; 
 Wed, 12 Jan 2022 11:56:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkut9kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:12 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBh2Yt005616;
 Wed, 12 Jan 2022 11:56:11 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkut9hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:11 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBlqad025221;
 Wed, 12 Jan 2022 11:56:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhjc6eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBu6jT28115380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D428AE057;
 Wed, 12 Jan 2022 11:56:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C425FAE045;
 Wed, 12 Jan 2022 11:56:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 06D642201C6;
 Wed, 12 Jan 2022 12:56:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/34] docs/system/ppc: Merge the PEF information into the
 pseries page
Date: Wed, 12 Jan 2022 12:55:22 +0100
Message-Id: <20220112115551.987666-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EUFD6AUOCRDgP3DZi3hcUr7yeapKtjSt
X-Proofpoint-GUID: OSTUQyW6ZGZWpPVdcqJLu_ICQ-HWXYFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=940 lowpriorityscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The Protected Execution Facility is only available with the pseries
machine, so let's merge the old ASCII text into the new RST file now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220105103232.405204-1-thuth@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/papr-pef.txt           | 30 ------------------------------
 docs/system/ppc/pseries.rst | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 30 deletions(-)
 delete mode 100644 docs/papr-pef.txt

diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
deleted file mode 100644
index 72550e9bf896..000000000000
--- a/docs/papr-pef.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-POWER (PAPR) Protected Execution Facility (PEF)
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Protected Execution Facility (PEF), also known as Secure Guest support
-is a feature found on IBM POWER9 and POWER10 processors.
-
-If a suitable firmware including an Ultravisor is installed, it adds
-an extra memory protection mode to the CPU.  The ultravisor manages a
-pool of secure memory which cannot be accessed by the hypervisor.
-
-When this feature is enabled in QEMU, a guest can use ultracalls to
-enter "secure mode".  This transfers most of its memory to secure
-memory, where it cannot be eavesdropped by a compromised hypervisor.
-
-Launching
----------
-
-To launch a guest which will be permitted to enter PEF secure mode:
-
-# ${QEMU} \
-    -object pef-guest,id=3Dpef0 \
-    -machine confidential-guest-support=3Dpef0 \
-    ...
-
-Live Migration
-----------------
-
-Live migration is not yet implemented for PEF guests.  For
-consistency, we currently prevent migration if the PEF feature is
-enabled, whether or not the guest has actually entered secure mode.
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 72e315eff628..16394fa5218b 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -230,6 +230,39 @@ nested. Combinations not shown in the table are not =
available.
=20
 .. [3] Introduced on Power10 machines.
=20
+
+POWER (PAPR) Protected Execution Facility (PEF)
+-----------------------------------------------
+
+Protected Execution Facility (PEF), also known as Secure Guest support
+is a feature found on IBM POWER9 and POWER10 processors.
+
+If a suitable firmware including an Ultravisor is installed, it adds
+an extra memory protection mode to the CPU.  The ultravisor manages a
+pool of secure memory which cannot be accessed by the hypervisor.
+
+When this feature is enabled in QEMU, a guest can use ultracalls to
+enter "secure mode".  This transfers most of its memory to secure
+memory, where it cannot be eavesdropped by a compromised hypervisor.
+
+Launching
+^^^^^^^^^
+
+To launch a guest which will be permitted to enter PEF secure mode::
+
+  $ qemu-system-ppc64 \
+      -object pef-guest,id=3Dpef0 \
+      -machine confidential-guest-support=3Dpef0 \
+      ...
+
+Live Migration
+^^^^^^^^^^^^^^
+
+Live migration is not yet implemented for PEF guests.  For
+consistency, QEMU currently prevents migration if the PEF feature is
+enabled, whether or not the guest has actually entered secure mode.
+
+
 Maintainer contact information
 ------------------------------
=20
--=20
2.31.1


