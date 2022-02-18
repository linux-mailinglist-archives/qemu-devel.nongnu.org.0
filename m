Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BE4BB414
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:23:35 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyYA-0002Oq-4b
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-00076g-6r; Fri, 18 Feb 2022 03:18:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5222
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yp-DX; Fri, 18 Feb 2022 03:18:38 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I6GicO027147; 
 Fri, 18 Feb 2022 08:18:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea620j89y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8COnE024485;
 Fri, 18 Feb 2022 08:18:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3e64hadxvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I8IKnH41681394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9A385204E;
 Fri, 18 Feb 2022 08:18:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 8714052057;
 Fri, 18 Feb 2022 08:18:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CD5CA22016E;
 Fri, 18 Feb 2022 09:18:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] aspeed: rainier: Add strap values taken from hardware
Date: Fri, 18 Feb 2022 09:18:12 +0100
Message-Id: <20220218081815.641169-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yjtMjS49iacIcjgjC4CZMBz1irQZod8y
X-Proofpoint-ORIG-GUID: yjtMjS49iacIcjgjC4CZMBz1irQZod8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=406 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

When time permits, we should introduce defines for the HW strapping
registers to cleanly decode the values.

SCU500 =3D 0x00422016
  Disable ARM JTAG trusted world debug: 0x1
  Disable ARM JTAG debug: 0x1
  VGA Memory Size: 0x1 [16MB]
  Cortex M3: 0x1 [Disabled]
  Boot device: 0x1 [eMMC]
  Reserved: 0x1

SCU510 =3D 0x80000848
  Secure Boot Enable: 0x1
  Enable boot SPI or eMMC ABR (second boot): 0x1
  Enable LPC mode: 0x1 [LPC]
  Disable LPC SuperIO 0x2e/0x4e: 0x1

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: rewrote the commit log ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7590b36bb017..f71a5d87473f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -160,8 +160,8 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP2  0x00000040
=20
 /* Rainier hardware value: (QEMU prototype) */
-#define RAINIER_BMC_HW_STRAP1 0x00000000
-#define RAINIER_BMC_HW_STRAP2 0x00000000
+#define RAINIER_BMC_HW_STRAP1 0x00422016
+#define RAINIER_BMC_HW_STRAP2 0x80000848
=20
 /* Fuji hardware value */
 #define FUJI_BMC_HW_STRAP1    0x00000000
--=20
2.34.1


