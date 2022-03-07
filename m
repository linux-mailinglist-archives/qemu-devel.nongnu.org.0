Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3814CF285
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:22:00 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7gt-0005Xh-62
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eK-0003Cd-Dy; Mon, 07 Mar 2022 02:19:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10550
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eI-00036G-IX; Mon, 07 Mar 2022 02:19:20 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2275jQmP028862; 
 Mon, 7 Mar 2022 07:19:05 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3enc6c9hne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:05 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2277IgYE027209;
 Mon, 7 Mar 2022 07:19:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8bc88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2277J17Q12845532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 07:19:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56778A4051;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AA2CA404D;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Mar 2022 07:19:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.76.59])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4071E22036B;
 Mon,  7 Mar 2022 08:19:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/6] aspeed/smc: Remove 'num_cs' field
Date: Mon,  7 Mar 2022 08:18:53 +0100
Message-Id: <20220307071856.1410731-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307071856.1410731-1-clg@kaod.org>
References: <20220307071856.1410731-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RHGvnbJuRfGg5qGDkw-ihomlPum3jAz5
X-Proofpoint-GUID: RHGvnbJuRfGg5qGDkw-ihomlPum3jAz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=816
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1034
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070041
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
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used anymore.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 hw/arm/aspeed.c             | 2 --
 hw/arm/aspeed_ast2600.c     | 2 --
 hw/arm/aspeed_soc.c         | 2 --
 hw/ssi/aspeed_smc.c         | 7 -------
 5 files changed, 14 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index cad73ddc13f2..4a9354e13c7f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -57,7 +57,6 @@ struct AspeedSMCState {
=20
     qemu_irq irq;
=20
-    uint32_t num_cs;
     qemu_irq *cs_lines;
     bool inject_failure;
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index be24508a9854..8f14738676f6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -352,8 +352,6 @@ static void aspeed_machine_init(MachineState *machine=
)
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_stra=
p2,
                             &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
-                            &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 21cd3342c578..c1e15e37739c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -163,7 +163,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -383,7 +382,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     for (i =3D 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), "dram",
                                  OBJECT(s->dram_mr), &error_abort);
-        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7d53cf2f5133..58714cb2a01d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -170,7 +170,6 @@ static void aspeed_soc_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -327,7 +326,6 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
=20
     /* SPI */
     for (i =3D 0; i < sc->spis_num; i++) {
-        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index a5d8bb717fc7..6859f061c8be 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1127,12 +1127,6 @@ static void aspeed_smc_realize(DeviceState *dev, E=
rror **errp)
     s->r_timings =3D asc->r_timings;
     s->conf_enable_w0 =3D asc->conf_enable_w0;
=20
-    /* Enforce some real HW limits */
-    if (s->num_cs > asc->max_peripherals) {
-        aspeed_smc_error("num_cs cannot exceed: %d", asc->max_peripheral=
s);
-        s->num_cs =3D asc->max_peripherals;
-    }
-
     /* DMA irq. Keep it first for the initialization in the SoC */
     sysbus_init_irq(sbd, &s->irq);
=20
@@ -1211,7 +1205,6 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
 };
=20
 static Property aspeed_smc_properties[] =3D {
-    DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, f=
alse),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
--=20
2.34.1


