Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0E7371135
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:28:27 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldR87-0006b0-0m
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6H-0004pi-88; Mon, 03 May 2021 01:26:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44890
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-00069H-FH; Mon, 03 May 2021 01:26:33 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14353ecc120512; Mon, 3 May 2021 01:26:22 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38aahu0h01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:21 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435Gsit022018;
 Mon, 3 May 2021 05:26:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rh6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1435PqX926673518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:25:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB7CC42041;
 Mon,  3 May 2021 05:26:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 743ED42047;
 Mon,  3 May 2021 05:26:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B19AC22007C;
 Mon,  3 May 2021 07:26:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/18] aspeed: Deprecate the swift-bmc machine
Date: Mon,  3 May 2021 07:25:57 +0200
Message-Id: <20210503052600.290483-16-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EL-_p3pTjeAoODTI9x5easLXfAL10jgR
X-Proofpoint-ORIG-GUID: EL-_p3pTjeAoODTI9x5easLXfAL10jgR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1034
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
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
 Adriana Kobylak <anoo@us.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SWIFT machine never came out of the lab and we already have enough
AST2500 based OpenPower machines.

Cc: Adriana Kobylak <anoo@us.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/deprecated.rst | 7 +++++++
 hw/arm/aspeed.c            | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae862528a..f9169077aef8 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -245,6 +245,13 @@ The Raspberry Pi machines come in various models (A,=
 A+, B, B+). To be able
 to distinguish which model QEMU is implementing, the ``raspi2`` and ``ra=
spi3``
 machines have been renamed ``raspi2b`` and ``raspi3b``.
=20
+Aspeed ``swift-bmc`` machine (since 6.1)
+''''''''''''''''''''''''''''''''''''''''
+
+This machine is deprecated because we have enough AST2500 based OpenPOWE=
R
+machines. It can be easily replaced by the ``witherspoon-bmc`` or the
+``romulus-bmc`` machines.
+
 Device options
 --------------
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1cf5a15c8098..cefa0f13527e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -811,6 +811,9 @@ static void aspeed_machine_swift_class_init(ObjectCla=
ss *oc, void *data)
     mc->default_ram_size       =3D 512 * MiB;
     mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
         aspeed_soc_num_cpus(amc->soc_name);
+
+    mc->deprecation_reason =3D "redundant system. Please use a similar "
+        "OpenPOWER BMC, Witherspoon or Romulus.";
 };
=20
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void =
*data)
--=20
2.26.3


