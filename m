Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A532B588
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:30:10 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHLxR-0001Mn-0z
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHLvp-0000re-UU; Wed, 03 Mar 2021 02:28:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHLvn-00077q-UK; Wed, 03 Mar 2021 02:28:29 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1237QBFm111828; Wed, 3 Mar 2021 02:28:05 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37262mg2ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 02:28:04 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1237R4vG011360;
 Wed, 3 Mar 2021 07:27:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 370c59tkcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 07:27:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1237RskV23658948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 07:27:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4839CAE061;
 Wed,  3 Mar 2021 07:27:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 059D7AE05A;
 Wed,  3 Mar 2021 07:27:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 07:27:53 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 452B622003E;
 Wed,  3 Mar 2021 08:27:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/aspeed: Fix location of firmware images in
 documentation
Date: Wed,  3 Mar 2021 08:27:43 +0100
Message-Id: <20210303072743.1551329-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1034 phishscore=0
 mlxlogscore=930 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030052
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, PDS_OTHER_BAD_TLD=1.702,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firmware images can be found on the OpenBMC jenkins site and on the
OpenBMC GitHub release page.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 690bada7842b..8972aa3f7bbe 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -72,18 +72,22 @@ Missing devices
 Boot options
 ------------
=20
-The Aspeed machines can be started using the -kernel option to load a
-Linux kernel or from a firmware image which can be downloaded from the
-OpenPOWER jenkins :
+The Aspeed machines can be started using the ``-kernel`` option to
+load a Linux kernel or from a firmware. Images can be downloaded from
+the OpenBMC jenkins :
=20
-   https://openpower.xyz/
+   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=
=3Dubuntu,label=3Ddocker-builder
+
+or directly from the OpenBMC GitHub release repository :
+
+   https://github.com/openbmc/openbmc/releases
=20
 The image should be attached as an MTD drive. Run :
=20
 .. code-block:: bash
=20
   $ qemu-system-arm -M romulus-bmc -nic user \
-	-drive file=3Dflash-romulus,format=3Draw,if=3Dmtd -nographic
+	-drive file=3Dobmc-phosphor-image-romulus.static.mtd,format=3Draw,if=3Dmt=
d -nographic
=20
 Options specific to Aspeed machines are :
=20
--=20
2.26.2


