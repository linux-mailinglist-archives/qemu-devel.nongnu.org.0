Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCC4C63BF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:21:26 +0100 (CET)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOaLV-0005BD-Tl
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:21:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDX-0004Lf-W6; Mon, 28 Feb 2022 02:13:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50580
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDW-0004JB-HU; Mon, 28 Feb 2022 02:13:11 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S5BbOl006581; 
 Mon, 28 Feb 2022 07:12:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egr1btwgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S77JPx026629;
 Mon, 28 Feb 2022 07:12:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu96j86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7CnEK45613546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:12:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A47FAE053;
 Mon, 28 Feb 2022 07:12:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6B37AE045;
 Mon, 28 Feb 2022 07:12:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 07:12:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2CB5E2203EC;
 Mon, 28 Feb 2022 08:12:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 7/7] aspeed/sdmc: Add trace events
Date: Mon, 28 Feb 2022 08:12:39 +0100
Message-Id: <20220228071239.404171-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
References: <20220228071239.404171-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2BduKJUlPLJcQRYCOu3j5qjg6AKDMomZ
X-Proofpoint-ORIG-GUID: 2BduKJUlPLJcQRYCOu3j5qjg6AKDMomZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1034 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=663
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280040
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful to analyze changes in the U-Boot RAM driver when SDRAM
training is performed.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 2 ++
 hw/misc/trace-events  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 08f856cbda7e..d2a3931033b3 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -130,6 +130,7 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr=
 addr, unsigned size)
         return 0;
     }
=20
+    trace_aspeed_sdmc_read(addr, s->regs[addr]);
     return s->regs[addr];
 }
=20
@@ -148,6 +149,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
         return;
     }
=20
+    trace_aspeed_sdmc_write(addr, data);
     asc->write(s, addr, data);
 }
=20
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 1c373dd0a4c5..fb5a3897807f 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -205,6 +205,10 @@ aspeed_i3c_write(uint64_t offset, uint64_t data) "I3=
C write: offset 0x%" PRIx64
 aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data=
) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t dat=
a) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
=20
+# aspeed_sdmc.c
+aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data:=
 0x%" PRIx64
+aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: =
0x%" PRIx64
+
 # bcm2835_property.c
 bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "m=
box property tag:0x%08x in_sz:%u out_sz:%zu"
=20
--=20
2.34.1


