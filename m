Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB52D5B02
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:56:43 +0100 (CET)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLUw-0006GA-R9
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ2-0001bo-Jy; Thu, 10 Dec 2020 07:51:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLPy-0001S7-QF; Thu, 10 Dec 2020 07:51:37 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACjOWl145934; Thu, 10 Dec 2020 07:51:23 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bky803k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:22 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACVVcK003686;
 Thu, 10 Dec 2020 12:51:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u85sxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:51:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BACpIS116712144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2768C5204F;
 Thu, 10 Dec 2020 12:51:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id E6DC552051;
 Thu, 10 Dec 2020 12:51:17 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 26500220156;
 Thu, 10 Dec 2020 13:51:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/5] aspeed queue
Date: Thu, 10 Dec 2020 13:51:10 +0100
Message-Id: <20201210125115.1812083-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1034 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=863 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100080
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f638=
77:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-12-09 20:08:54 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20201210

for you to fetch changes up to 6f5f6507e49df4820207a94f3aeaaeab08092d32:

  aspeed: g220a-bmc: Add an FRU (2020-12-10 12:11:03 +0100)

----------------------------------------------------------------
Aspeed patches :

* New device model for EMC1413/EMC1414 temperature sensors (I2C)
* New g220a-bmc Aspeed machine
* couple of Aspeed cleanups

----------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      aspeed/smc: Add support for address lane disablement

Joel Stanley (1):
      ast2600: SRAM is 89KB

John Wang (3):
      hw/misc: add an EMC141{3,4} device model
      aspeed: Add support for the g220a-bmc board
      aspeed: g220a-bmc: Add an FRU

 include/hw/misc/emc141x_regs.h |  37 +++++
 hw/arm/aspeed.c                |  72 +++++++++
 hw/arm/aspeed_ast2600.c        |   2 +-
 hw/misc/emc141x.c              | 326 +++++++++++++++++++++++++++++++++++=
++++++
 hw/ssi/aspeed_smc.c            |  25 +++-
 tests/qtest/emc141x-test.c     |  81 ++++++++++
 hw/arm/Kconfig                 |   1 +
 hw/misc/Kconfig                |   4 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   1 +
 10 files changed, 542 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/misc/emc141x_regs.h
 create mode 100644 hw/misc/emc141x.c
 create mode 100644 tests/qtest/emc141x-test.c

