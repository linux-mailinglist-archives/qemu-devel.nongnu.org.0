Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7330875F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:33:55 +0100 (CET)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QA6-00013B-NT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Q6S-000749-Kl; Fri, 29 Jan 2021 04:30:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25210
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Q6Q-0001Og-Pu; Fri, 29 Jan 2021 04:30:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10T935S2101216; Fri, 29 Jan 2021 04:29:43 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cdwnu1vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 04:29:43 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10T9NhII010006;
 Fri, 29 Jan 2021 09:29:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 368be8axum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 09:29:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10T9Tdcg46596434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 09:29:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6196511C054;
 Fri, 29 Jan 2021 09:29:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6B311C04C;
 Fri, 29 Jan 2021 09:29:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 29 Jan 2021 09:29:39 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-8-231.uk.ibm.com [9.145.8.231])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4151C220186;
 Fri, 29 Jan 2021 10:29:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] pnv/ppc: Set default RAM size to 1 GB
Date: Fri, 29 Jan 2021 10:29:36 +0100
Message-Id: <20210129092936.769412-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_03:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=505 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1034 impostorscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290046
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any value below will result in a skiboot crash :

    [    0.034949905,3] MEM: Partial overlap detected between regions:
    [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] =
(new)
    [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x3=
8400000]
    [    0.034980367,3] Out of memory adding skiboot reserved areas
    [    0.035074945,3] ***********************************************
    [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
    [    0.035104247,3]     .
    [    0.035108025,3]      .
    [    0.035111651,3]       .
    [    0.035115231,3]         OO__)
    [    0.035119198,3]        <"__/
    [    0.035122980,3]         ^ ^

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 50810df83815..70ce12f6dc73 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1994,7 +1994,7 @@ static void pnv_machine_class_init(ObjectClass *oc,=
 void *data)
      * RAM defaults to less than 2048 for 32-bit hosts, and large
      * enough to fit the maximum initrd size at it's load address
      */
-    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
+    mc->default_ram_size =3D 1 * GiB;
     mc->default_ram_id =3D "pnv.ram";
     ispc->print_info =3D pnv_pic_print_info;
     nc->nmi_monitor_handler =3D pnv_nmi;
--=20
2.26.2


