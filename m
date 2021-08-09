Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C83E467F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:26:35 +0200 (CEST)
Received: from localhost ([::1]:56254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5IJ-0004qQ-D2
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58Z-0004pd-VP; Mon, 09 Aug 2021 09:16:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58X-0004wC-Ua; Mon, 09 Aug 2021 09:16:15 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179D9qgn112880; Mon, 9 Aug 2021 09:16:05 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7pvfxg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:05 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CwOWW014354;
 Mon, 9 Aug 2021 13:16:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8uk5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DFxnq52101478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:15:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9AFB5206B;
 Mon,  9 Aug 2021 13:15:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 5D79252051;
 Mon,  9 Aug 2021 13:15:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 76BC222016C;
 Mon,  9 Aug 2021 15:15:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/10] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
Date: Mon,  9 Aug 2021 15:15:47 +0200
Message-Id: <20210809131556.686260-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hZfnOzRsQDW_jjZiFkuDV-361RcXqIFa
X-Proofpoint-GUID: hZfnOzRsQDW_jjZiFkuDV-361RcXqIFa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1034 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
the silicon revision for AST2600 to revision A1. On revision A1, the firs=
t
Ethernet interface is operational. Enable it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210808200457.889955-1-linux@roeck-us.net>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51bb..ecf0c9cfacb8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(Obj=
ectClass *oc, void *data)
     amc->fmc_model =3D "w25q512jv";
     amc->spi_model =3D "mx66u51235f";
     amc->num_cs    =3D 1;
-    amc->macs_mask  =3D ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON=
;
+    amc->macs_mask =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON =
|
+                     ASPEED_MAC3_ON;
     amc->i2c_init  =3D ast2600_evb_i2c_init;
     mc->default_ram_size =3D 1 * GiB;
     mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
--=20
2.31.1


