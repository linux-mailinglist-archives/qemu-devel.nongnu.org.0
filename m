Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E969533272B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:31:33 +0100 (CET)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcSS-0006vp-Uu
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEY-00026R-QV; Tue, 09 Mar 2021 08:17:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEU-00077c-Lo; Tue, 09 Mar 2021 08:17:08 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D2oAD148735; Tue, 9 Mar 2021 08:16:48 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3762wtm6mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:48 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D8hbJ007472;
 Tue, 9 Mar 2021 13:16:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3768t4g1q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129DGhRS42271124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36C805205A;
 Tue,  9 Mar 2021 13:16:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 03F0A5204E;
 Tue,  9 Mar 2021 13:16:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 74B9222025C;
 Tue,  9 Mar 2021 14:16:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/7] aspeed queue
Date: Tue,  9 Mar 2021 14:16:34 +0100
Message-Id: <20210309131641.2709380-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=799
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1034 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 229a834518b950d56fd1bc94923276504d0ee9=
d4:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-202103=
06' into staging (2021-03-08 15:45:48 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210309

for you to fetch changes up to c59f781e3bcca4a80aef5d229488fd45dbfdbd9a:

  hw/misc: Model KCS devices in the Aspeed LPC controller (2021-03-09 12:=
01:28 +0100)

----------------------------------------------------------------
Aspeed patches :

* New model for the Aspeed LPC controller
* Misc cleanups

----------------------------------------------------------------
Andrew Jeffery (4):
      hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
      hw/arm: ast2600: Set AST2600_MAX_IRQ to value from datasheet
      hw/arm: ast2600: Correct the iBT interrupt ID
      hw/misc: Model KCS devices in the Aspeed LPC controller

C=C3=A9dric Le Goater (2):
      hw/arm/aspeed: Fix location of firmware images in documentation
      hw/misc: Add a basic Aspeed LPC controller model

Joel Stanley (1):
      arm/ast2600: Fix SMP booting with -kernel

 docs/system/arm/aspeed.rst   |  16 +-
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_lpc.h |  47 +++++
 hw/arm/aspeed_ast2600.c      |  51 ++++-
 hw/arm/aspeed_soc.c          |  34 ++-
 hw/misc/aspeed_lpc.c         | 486 +++++++++++++++++++++++++++++++++++++=
++++++
 hw/misc/meson.build          |   7 +-
 7 files changed, 625 insertions(+), 19 deletions(-)
 create mode 100644 include/hw/misc/aspeed_lpc.h
 create mode 100644 hw/misc/aspeed_lpc.c

