Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00337113E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:31:02 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldRAb-0001cJ-C4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6H-0004pj-9t; Mon, 03 May 2021 01:26:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-0005wv-AV; Mon, 03 May 2021 01:26:33 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143544pR094980; Mon, 3 May 2021 01:26:12 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a8c7jnxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:11 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435MBvr009715;
 Mon, 3 May 2021 05:26:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 388xm889n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1435Pggd27197822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:25:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5287AE051;
 Mon,  3 May 2021 05:26:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77274AE045;
 Mon,  3 May 2021 05:26:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C2DA822004E;
 Mon,  3 May 2021 07:26:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/18] aspeed queue (v2)
Date: Mon,  3 May 2021 07:25:42 +0200
Message-Id: <20210503052600.290483-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -HtbO1JJQGK-0IFSDfBifIMlnopwKeGl
X-Proofpoint-GUID: -HtbO1JJQGK-0IFSDfBifIMlnopwKeGl
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 clxscore=1034 lowpriorityscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338ea4:

  Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210503

for you to fetch changes up to 9cccb912cfa865f0bae6b156fa94e2f216dd8835:

  aspeed: Add support for the quanta-q7l1-bmc board (2021-05-01 10:03:52 +0=
200)

----------------------------------------------------------------
Aspeed patches :

* Fixes for the DMA space
* New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
* Acceptance tests (Joel)
* A fix for the XDMA  model
* Some extra features for the SMC controller.
* Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)

----------------------------------------------------------------
C=C3=A9dric Le Goater (11):
      aspeed/smc: Use the RAM memory region for DMAs
      aspeed/smc: Remove unused "sdram-base" property
      aspeed/i2c: Fix DMA address mask
      aspeed/i2c: Rename DMA address space
      hw/misc/aspeed_xdma: Add AST2600 support
      aspeed/smc: Add a 'features' attribute to the object class
      aspeed/smc: Add extra controls to request DMA
      tests/qtest: Rename m25p80 test in aspeed_smc test
      aspeed: Deprecate the swift-bmc machine
      aspeed: Add support for the rainier-bmc board
      hw/block: m25p80: Add support for mt25ql02g and mt25qu02g

Joel Stanley (5):
      hw: Model ASPEED's Hash and Crypto Engine
      aspeed: Integrate HACE
      tests/qtest: Add test for Aspeed HACE
      tests/acceptance: Test ast2400 and ast2500 machines
      tests/acceptance: Test ast2600 machine

Patrick Venture (1):
      aspeed: Add support for the quanta-q7l1-bmc board

Philippe Mathieu-Daud=C3=A9 (1):
      hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use alias

 docs/system/arm/aspeed.rst                       |   2 +-
 docs/system/deprecated.rst                       |   7 +
 include/hw/arm/aspeed_soc.h                      |   3 +
 include/hw/misc/aspeed_hace.h                    |  43 +++
 include/hw/misc/aspeed_xdma.h                    |  17 +-
 include/hw/ssi/aspeed_smc.h                      |   7 +-
 hw/arm/aspeed.c                                  | 146 ++++++-
 hw/arm/aspeed_ast2600.c                          |  22 +-
 hw/arm/aspeed_soc.c                              |  23 +-
 hw/block/m25p80.c                                |   2 +
 hw/i2c/aspeed_i2c.c                              |   5 +-
 hw/misc/aspeed_hace.c                            | 389 +++++++++++++++++++
 hw/misc/aspeed_xdma.c                            | 124 ++++--
 hw/ssi/aspeed_smc.c                              | 119 ++++--
 tests/qtest/aspeed_hace-test.c                   | 469 +++++++++++++++++++=
++++
 tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} |  12 +-
 MAINTAINERS                                      |   1 +
 hw/misc/meson.build                              |   1 +
 tests/acceptance/boot_linux_console.py           |  68 ++++
 tests/qtest/meson.build                          |   5 +-
 20 files changed, 1389 insertions(+), 76 deletions(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c
 rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)

