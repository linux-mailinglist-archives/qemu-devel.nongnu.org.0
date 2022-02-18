Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51214BB420
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:26:18 +0100 (CET)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyan-0007Zc-RM
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-00077A-Cc; Fri, 18 Feb 2022 03:18:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yo-EX; Fri, 18 Feb 2022 03:18:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I7g3YH024543; 
 Fri, 18 Feb 2022 08:18:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea79q8qk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8Dr2L019900;
 Fri, 18 Feb 2022 08:18:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645kghgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I87oXd49086930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:07:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74B911C04C;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8480F11C04A;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C28E922016E;
 Fri, 18 Feb 2022 09:18:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] aspeed extensions
Date: Fri, 18 Feb 2022 09:18:08 +0100
Message-Id: <20220218081815.641169-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kbipi0aUa-9YEQdLzeAw6VvkoXBuYga-
X-Proofpoint-ORIG-GUID: kbipi0aUa-9YEQdLzeAw6VvkoXBuYga-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_02,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=342 spamscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is a set of extensions for the Aspeed machines, the most
important ones being the removal of a deprecated machine and a simple
model for the Secure Boot Controller, both from Joel.

Thanks,

C.=20

Changes in v2:

 - new create_pca9552() helper (Philippe)
 - fixed typos
 - fixed removal of the swift machine

C=C3=A9dric Le Goater (3):
  aspeed: Introduce a create_pca9552() helper
  aspeed/smc: Add an address mask on segment registers
  aspeed/sdmc: Add trace events

Joel Stanley (4):
  arm: Remove swift-bmc machine
  ast2600: Add Secure Boot Controller model
  aspeed: rainier: Add i2c LED devices
  aspeed: rainier: Add strap values taken from hardware

 docs/about/deprecated.rst       |   7 --
 docs/about/removed-features.rst |   5 ++
 docs/system/arm/aspeed.rst      |   1 -
 include/hw/arm/aspeed_soc.h     |   3 +
 include/hw/misc/aspeed_sbc.h    |  32 ++++++++
 include/hw/ssi/aspeed_smc.h     |   1 +
 hw/arm/aspeed.c                 |  98 ++++++----------------
 hw/arm/aspeed_ast2600.c         |   9 ++
 hw/misc/aspeed_sbc.c            | 141 ++++++++++++++++++++++++++++++++
 hw/misc/aspeed_sdmc.c           |   2 +
 hw/ssi/aspeed_smc.c             |  11 +++
 hw/misc/meson.build             |   1 +
 hw/misc/trace-events            |   4 +
 13 files changed, 236 insertions(+), 79 deletions(-)
 create mode 100644 include/hw/misc/aspeed_sbc.h
 create mode 100644 hw/misc/aspeed_sbc.c

--=20
2.34.1


