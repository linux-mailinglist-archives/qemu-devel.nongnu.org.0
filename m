Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0293572FE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:21:33 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBrv-0003EW-4q
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBni-0007Wl-4w; Wed, 07 Apr 2021 13:17:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20478
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBne-0006hn-BF; Wed, 07 Apr 2021 13:17:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3tfw125105; Wed, 7 Apr 2021 13:16:46 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rvm4rksh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:45 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HDSue013339;
 Wed, 7 Apr 2021 17:16:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 37rvbvgg0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGfXg65274250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8845F4C040;
 Wed,  7 Apr 2021 17:16:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EC184C046;
 Wed,  7 Apr 2021 17:16:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A19C52200C7;
 Wed,  7 Apr 2021 19:16:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/24] aspeed: fixes and extensions
Date: Wed,  7 Apr 2021 19:16:13 +0200
Message-Id: <20210407171637.777743-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J-GtpgTh63IzQpo-0pFBAgIeI092JZ_d
X-Proofpoint-ORIG-GUID: J-GtpgTh63IzQpo-0pFBAgIeI092JZ_d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hello,

This is a 6.1 series of changes I have been collecting for the Aspeed
machines.

We were passing the memory address space region to the I2C and SMC
controller for DMAs. Passing the RAM memory region simplifies the
models. Thanks to Philippe.

Then, we have a model for the HACE (Hash And Crypto Engine) device of
the Aspeed SoC from Joel plus extensions from Klaus. These should be
ready but I lack a firmware image to check. An extra review would be
nice to have.

Follow acceptance tests for all SoCs (AST2400, AST2500 and AST2600), a
fix (kexec) for the XDMA model on the AST2600, an extra feature for
the SMC model which is required by a SPI driver Aspeed is working on,
a new machine, the AST2600 rainier-bmc, and the iBT device model that
I have been keeping for while (2016). It is ready for review now that
the LPC model (Andrew) is merged.

Finally, a new model from Joel for the DPS310 sensor device which can
be found on the witherspoon and rainier boards.

Thanks,

C.

C=C3=A9dric Le Goater (12):
  aspeed/smc: Use the RAM memory region for DMAs
  aspeed/smc: Remove unused "sdram-base" property
  aspeed/i2c: Fix DMA address mask
  aspeed/i2c: Rename DMA address space
  hw/misc/aspeed_xdma: Add AST2600 support
  aspeed/smc: Add a 'features' attribute to the object class
  aspeed/smc: Add extra controls to request DMA
  tests/qtest: Rename m25p80 test in aspeed_smc test
  aspeed: Remove swift-bmc machine
  aspeed: Add support for the rainier-bmc board
  hw/misc: Add an iBT device model
  hw/block: m25p80: Add support for mt25qu02g

Joel Stanley (9):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE
  tests/acceptance: Test ast2400 and ast2500 machines
  tests/acceptance: Test ast2600 machine
  aspeed: Emulate the AST2600A3
  hw/misc: Add Infineon DPS310 sensor model
  arm/aspeed: Add DPS310 to rainier
  arm/aspeed: Add DPS310 to witherspoon

Klaus Heinrich Kiwi (2):
  aspeed: Add Scater-Gather support for HACE Hash
  tests: Aspeed HACE Scatter-Gather tests

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use alias

 docs/system/arm/aspeed.rst                    |   2 +-
 include/hw/arm/aspeed_soc.h                   |   5 +
 include/hw/misc/aspeed_hace.h                 |  43 ++
 include/hw/misc/aspeed_ibt.h                  |  47 ++
 include/hw/misc/aspeed_scu.h                  |   2 +
 include/hw/misc/aspeed_xdma.h                 |  17 +-
 include/hw/ssi/aspeed_smc.h                   |   7 +-
 hw/arm/aspeed.c                               | 144 +++--
 hw/arm/aspeed_ast2600.c                       |  36 +-
 hw/arm/aspeed_soc.c                           |  35 +-
 hw/block/m25p80.c                             |   1 +
 hw/i2c/aspeed_i2c.c                           |   5 +-
 hw/misc/aspeed_hace.c                         | 480 ++++++++++++++
 hw/misc/aspeed_ibt.c                          | 596 ++++++++++++++++++
 hw/misc/aspeed_scu.c                          |  32 +-
 hw/misc/aspeed_xdma.c                         | 124 +++-
 hw/misc/dps310.c                              | 339 ++++++++++
 hw/ssi/aspeed_smc.c                           | 119 +++-
 tests/qtest/aspeed_hace-test.c                | 469 ++++++++++++++
 .../{m25p80-test.c =3D> aspeed_smc-test.c}      |  12 +-
 MAINTAINERS                                   |   1 +
 hw/arm/Kconfig                                |   1 +
 hw/misc/Kconfig                               |   4 +
 hw/misc/meson.build                           |   3 +
 hw/misc/trace-events                          |   7 +
 tests/acceptance/boot_linux_console.py        |  68 ++
 tests/qtest/meson.build                       |   5 +-
 27 files changed, 2458 insertions(+), 146 deletions(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 include/hw/misc/aspeed_ibt.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 hw/misc/aspeed_ibt.c
 create mode 100644 hw/misc/dps310.c
 create mode 100644 tests/qtest/aspeed_hace-test.c
 rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)

--=20
2.26.3


