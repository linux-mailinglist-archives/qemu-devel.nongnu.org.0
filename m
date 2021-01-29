Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B5308B00
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:16:16 +0100 (CET)
Received: from localhost ([::1]:32796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XNX-00079G-QT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wxg-0008Oi-06
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:32 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wxd-0006UT-Tf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:31 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGO1K5130122;
 Fri, 29 Jan 2021 16:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=qKoSFolI0BernH+4gdp4vLQXl1i8pXl9rmJYCRUFgRFCisAfVYlG5vBkC7HNIqoaypS6
 fdpDvGMz6JnN2pNsSu85JujwjDqJLSVvYbRon5P/em/xaT9at9kzr+fXDQ0ay+112Kl/
 y0HgN3XW3n/HRtd2WoLnGFVjX4slOHQYpvNtTmUdk66n0it73DPtxWJw9tv2ZMfVBamp
 lRDchF355ot0uKzyEIWNYcTvRscieoRPE3Pgm3iVA3Nbzo+wyJunoE8b/FTxEinaJKhJ
 K3Njg2Qyl9uSkGPU4wbBnBASMkAEe0aqJqxoQJJqWwOnDvCTda0owUJzdEdqNdkPqXY3 Dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7ra9vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:49:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGQIcI039758;
 Fri, 29 Jan 2021 16:47:22 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by userp3030.oracle.com with ESMTP id 368wr25bd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDcze3B0eDO2J11DX6tUPA1Azbrd+siAYig3jc6USuGVgZANQXGlV8p1yJ+q8y4ZZ84B+3rWsJjMUOkwHYHavPFwVVDaZJyUY7PNgBQQyjMu2LqcC4yIqNhjFymBOG4NN7nehqyAp25/Q7ni+WAdo+bG6DCV6sQur88XiROczkxiqntmdYEkKELvBmW/rvFQfEHlCe8JhC/XdgyKBDyL5ix6/w4Zx6VSMt+6tPMi4kqyT0szTGZCC20p+nvs70kcNPWnvBa35xV68CW//lGHIUc5CvYrQIbYytk2+CHFXpLRQQFkWsYlf/I5tcf+81nHH3Y4RUS9GUlTVbqAkwSpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=CCEUUd8yBSxAOoJeypYhqlcLZR2rOv7HVxod5ayGhb0QuhWHXWSAbxatKFUbCdI/K8SjwlqaCVOAseNs1+fExci9TSiVLeSME3Rfr+bNDKCVrQAFWYOr5v14629fdJrP6mhwuzkFgopDrHcHUxEv0Y9J948f+TzCo+/lzMOWjEEL7JKPDyallKThfgRjDniiF7ovrtUmKkMhG41o3Zw56BnrRa6FEbsYxO+nN6nURuFFI1IsCIDbKXNBfJ7yKNAZaSiwP9Y5WGT8+E5NQLH6O5enEW7E9iCVkP0RpCw6aHiilztzz30Bpq7OkjVL0KKYiZjPs5afFvvVJ77wYloq/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avhCUAWKFINROFhFn9XLD6ifdtWA62J3LcL6MBR+IHI=;
 b=PGbMmdFUdU0qZENbvAC2DVWrWkBKbEI8Q+Uyo/FncEGa9g/9s/VBc9YjjIMtwnrfWoQzkIdwwS6+iPC+dq0ScpmhZMG05C1kUHxh2DS6Zx94vxF1R4jMgduPY/bQl7kbWU08I2kj7EXbcdoBbpgWvGYp/znfJr0YeUQFld4oU1w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:19 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:19 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 20/20] multi-process: perform device reset in the remote
 process
Date: Fri, 29 Jan 2021 11:46:21 -0500
Message-Id: <7cb220a51f565dc0817bd76e2f540e89c2d2b850.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cafefbea-5902-48f8-846b-08d8c4758ac2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671B11FFC9FACBCD8E7DCF790B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8DTDZ8oPRRoGlafuTAkJrc2OwvsMgFLXY012dIzaqCvMgifthrequLZX7jh+WDznPli4YxXgd+5qrAUNOyKOMMoVQkQj1CHc3QoMHanjMG9ODomw+uQEVYgZ188iGhsZch9Nj0Tr4eMUldOZNaNNgHRH50zeQpQGhV9KbBoQ/TeXOGlkuZK15C07aS3Fmw85efm04GhyDKfdFCToBNT0yp5a6anPuiiOOsJEKbBUE+oCOpI+4cMReJB5RthYF2Pa1Abga762j5O/NZAPaDFMtMiqBP05Ood8D17vUUnTNK3htTI5qTVMyh2UrERpDS9z8XdtkNI6dHpps/iuC21cl76Wqc548Lwg7WTvMeDIOHTsDsfyeeFQd+D1cNc0P3TvLWyDk06ROAxVAvlV6lzyLqrcvYjxuhNafPbgO1i3aOjdk7aR9jXFUnzvn4/FUK7lER5lzOExd1bUajtgLBmNAH2Xo5d9dCgTta9yKTxHFRzo0olV0fif0zkk12MdRQdoRd77bjgnGpbdWoIa9bx1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2YNODrxR+pz6DZ4EN9arL7jJyr4g+T3gJiS4V4sFcD7RkhQyJqlWtlgFMuaL?=
 =?us-ascii?Q?7dUU2rEtG7UKRO//Kmr4mpNwl6se/tnancWwYCvOfVSHVuOMqVzOUHO5jBEr?=
 =?us-ascii?Q?DJvX/cS0QChIDaQV4ezQXPA8e8778TVlHJpm44ln0ivm8aXmbpE8iG5AGpdm?=
 =?us-ascii?Q?3i7quB0ja2uI/GqhO0vuf3DuBe9firJzaTcSSbBTmfSd0HcZccXFWlGKKmS/?=
 =?us-ascii?Q?6PwJ7Nx8rkSHKe9sSQy0SaB7uSEPcvFtfluneQkfpl0Go9SojL1ObIIGcWls?=
 =?us-ascii?Q?cFAE8mrI3tv382Cw02VR0/u1LegcyjGPQqF6zI9rveWA3sfU2fQtoKX2ha++?=
 =?us-ascii?Q?CGfxBghEprRJFBWym8FNWRFu8JUkx+Ng0YwLv/NQca3y43DNOZeLqvvtKagz?=
 =?us-ascii?Q?DuFDWruu0pQybnw6fdIvOANpXm8dH2iGATWoBod/f3RpqdQ4+f7kB5IL8ls6?=
 =?us-ascii?Q?LnXn/PR9VIfm9Rlweblm7yEo7AecGuB4qgFPTTLKHISoJYmFem89qciq28Dp?=
 =?us-ascii?Q?2TMBceH290pf97k48rzfOEfvzgvPNlEQe4rBPusQ3RUvJU3P/jJa0xKBsgBf?=
 =?us-ascii?Q?7/FwBN0rh8nsEBfwm0wg1XWhfDWB6CAyuPc0HsvpxNYoIQ3zgroa61nR+tqP?=
 =?us-ascii?Q?KSAjx5dAwc/HXOasuHM5/y3+zJYhj3xI+T0dlawoHDXf8syJGAyMAZrgNa+0?=
 =?us-ascii?Q?Ly4odM32eW1Xl41Hr3/8yx9wbJI+xtFMFYhhFzHFz5brPZJQ+AK+GW29/ZUG?=
 =?us-ascii?Q?MUPzWYFhrea0pqH69lv1SJWHUrgEr7jNU8A1U53qpayZm8SL8Kut6gJvJNkr?=
 =?us-ascii?Q?63FYN+DngZeHP/ttXg/viorvJzyd6WTRGSM9bjNcnpIfZTdqQjnvBVgNY9Bq?=
 =?us-ascii?Q?/gzWUVsXpDXWFDynJFjzD1ymxG9y4e+jsQ1HP898pdABRRhclU8HDDUuHEvy?=
 =?us-ascii?Q?IAUneCBwrHoEt0LEmHwvoE0JUkOuZWC+HAVq0xwY083+a1WlCQW523d7tDyF?=
 =?us-ascii?Q?6wDaSlJYjgk+pi2ADM9oZb3NNt9qZFlaLIBVuIBNnMUFxYHiaeWueBMW6IJs?=
 =?us-ascii?Q?Tov37s/A?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafefbea-5902-48f8-846b-08d8c4758ac2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:19.4604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IrGxHL6nRHWnYdODiBqejGNd4HkL6e2N+P/gbuVgU9MKT2b/WmuVygDycZ/9do2PjrHGsqLPsJugH24lf3lnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Perform device reset in the remote process when QEMU performs
device reset. This is required to reset the internal state
(like registers, etc...) of emulated devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  1 +
 hw/remote/message.c             | 22 ++++++++++++++++++++++
 hw/remote/proxy.c               | 19 +++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 71d206f..4ec0915 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -40,6 +40,7 @@ typedef enum {
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_SET_IRQFD,
+    MPQEMU_CMD_DEVICE_RESET,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index adab040..11d7298 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -19,6 +19,7 @@
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
 #include "hw/remote/iohub.h"
+#include "sysemu/reset.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -26,6 +27,8 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg, Error **errp);
 static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -69,6 +72,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SET_IRQFD:
             process_set_irqfd_msg(pci_dev, &msg);
             break;
+        case MPQEMU_CMD_DEVICE_RESET:
+            process_device_reset_msg(com->ioc, pci_dev, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -206,3 +212,19 @@ fail:
                       getpid());
     }
 }
+
+static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
+                                     Error **errp)
+{
+    DeviceClass *dc = DEVICE_GET_CLASS(dev);
+    DeviceState *s = DEVICE(dev);
+    MPQemuMsg ret = { 0 };
+
+    if (dc->reset) {
+        dc->reset(s);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+
+    mpqemu_msg_send(&ret, ioc, errp);
+}
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index a082709..4fa4be0 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -26,6 +26,7 @@
 #include "util/event_notifier-posix.c"
 
 static void probe_pci_info(PCIDevice *dev, Error **errp);
+static void proxy_device_reset(DeviceState *dev);
 
 static void proxy_intx_update(PCIDevice *pci_dev)
 {
@@ -202,6 +203,8 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
     k->config_read = pci_proxy_read_config;
     k->config_write = pci_proxy_write_config;
 
+    dc->reset = proxy_device_reset;
+
     device_class_set_props(dc, proxy_properties);
 }
 
@@ -358,3 +361,19 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
         }
     }
 }
+
+static void proxy_device_reset(DeviceState *dev)
+{
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+    MPQemuMsg msg = { 0 };
+    Error *local_err = NULL;
+
+    msg.cmd = MPQEMU_CMD_DEVICE_RESET;
+    msg.size = 0;
+
+    mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+}
-- 
1.8.3.1


