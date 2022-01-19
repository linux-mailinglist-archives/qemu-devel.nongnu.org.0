Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975474942BA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:02:18 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ21-0000QW-ME
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjY-0008AC-Tl
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjO-0007Lo-Ta
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:05 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJSHhK031217; 
 Wed, 19 Jan 2022 21:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=VvLaKghGHkfMRIeLcQO6s2fhXUFykfT/mytk88XfCks=;
 b=I+dou5EsfxXH5IfG/Rc0KkTPkwmgfeRF06mqTSWGd2zeeBft9vTL+7gc/oQODHnwNwOJ
 GADkdcbVzLtxKWSMvbUu81xISyE2pwaOK65Wbn+apzeF4z975ouKeL4iAD+J+LzS8lkw
 9ywnbE+MWxRWSXLZYw2JM/AuOf37ihlvcyRONng8VkgGMPTc13ZhDr4klj1ouTGXcoql
 8+LDDWodGWm/ihf3tYFZK9ywRO+Q5MtCObKHuRTCun+jwVKGwbWTxbN7VpBYUI8b8r9N
 vZK0ZJ1rhcuSA+gLmq1uzbv31wRvpd+vle2XHc4Bbj4wFiJERhdl3LzrKG6pgxp8imqF eA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaTuO030985;
 Wed, 19 Jan 2022 21:42:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3020.oracle.com with ESMTP id 3dkp36kfms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHV1cp8eZeJ2ObtsTst8Fbg4yapVKLhwDEFv2CXKlnTFED5P2vlZ6iq1qAmxUsDkUxqZsYEp1JdZE2xuqZrPsLMLzO/2Dc7FZT9/LDnFmKyaZw4Ytc+Lkt6hZ/pXOWXnPI17SNk/uLuwEtJiJS9X3OVR2Ss7nmiPgiFILcp2HxIOtCRj0mGWeB9k0O7Msd+4HxrvMVKJfvUOFkkTP9u8tvYodo3wjl2l/fcUYnarjPJqRGlVoDwV+l5dGQFDyQaKRelBBCVYn+MnNns5hBV0XLIKuqpsuSPGAXG+elOrgL6CgCSqAARxyTIqhd/U0bJreXQPedQ3UFhn4XxsmT4vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvLaKghGHkfMRIeLcQO6s2fhXUFykfT/mytk88XfCks=;
 b=ISaR879GHXuLV9yCjMy+mLwIMBx+JX67bwDA0Lp3QUiOo4jiZ6fp8p4B6qGWlF+ftjMaiBYwcPf7n3fq8FQYPn1KOe5+1+DV049zkkOhmQsfHPM9cy0dv4R5A5L2w+wqCon9s+pTPHF59f9DPW0MVqEvyiG/9jUF53smLNbsGL1sZAgAYUWJLOpqQVHFlL4zNJR+diid7OgX059lAAeseVYKYTeHJSeIfKRmdtCfx+zgtdI7PlF+UdS0ScwmNY/e/BOfRcBKA3eB68nkJ0gJLsi1znTGarU99OrTuYWgA/4O8Y6530GlVfQy4mMz05BYvgK2JgSamXV1FFExlg2FjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvLaKghGHkfMRIeLcQO6s2fhXUFykfT/mytk88XfCks=;
 b=Bx/3n8CVtcbQjNZ4smNUVgodi3a0opIJeTjmUaoaLLk2ijmG7QKrrSi2cmWlERBzCGC5+Gb8YoGBc+WFG/cr6de6Uys+e7uYkhNpg+q6oQOFvV99f6NnYi3Tw8AyZER1C8gZt6aW7BJgx2hLCAfOV2s4KI1e8BaLbdPLmt+gqvo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:55 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:55 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/18] vfio-user: find and init PCI device
Date: Wed, 19 Jan 2022 16:42:00 -0500
Message-Id: <01f4837eaa73d340542961cf36a6028f4a681a0e.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 970b4684-aaa8-49d2-3004-08d9db94a6ff
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887C8FBC08369F1D2BE122C90599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:241;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tqp9q2RTPxyFs00z702eLDZHziDZ5sErNsnyswkhcteLSip08fzCvvfoSq81o5qax1lwuADNBQeCwF03f/oO71rrPKBEUR44QmDcwOzWlPEhtD69C0hfLEU2Af7F1sRsrqLnRMJtGRwEofc/ECtgkCUfr4O7DWPxE6/r29Ub4Xprhlq1JiHD0jhp1ookGfAqkVB92AXVvW+6eKptIzmfNivWkP9Z8xxkcJRm8iShZJTerbKJ9YDeDDMBToO7SYhLpcpDEaFWMhCMp8D3YTMk0m25nuNnvFndtYfdUPhC7r8FefNPC8fRIfeQubCjp5uMYwUa+Hq9SH72rUbnAFdPKUD7UIwJmXnCnC99I+/JQ9rFGazDjcq8rOqtZSKjaKBiKlQQHNMQLr2bgagyS5aPKzXo1lmzU1dP/xCFO01FV08ywtjoWwY53aXhMFHmOpbZy0PxFHyleKgvGIrcgKPFWRGttsr3Vyb8FQcDUNYrbbqPfAjOlGRO0DUe4X3FmPF/DdupR0y8KQYbHwYGE6K/pyOYJNVMcE1y5m/VdEkvCq2C1Zwots8+l7jQK+WkAKHLrBmQq4yJbfgJMUPuHembVnnVu7ozjrqAhpxamV5unmiiqzbL/UhWaHk6bI2trVEAHEs95aM4leU43X7//U/v8d6K4BTuT4Ga7V4Op+SodAcH6kKXTpuKDPmjdGiL0KmON3TDl3BqmgJaWai2o96TgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k86dSUiialveHQ+kSMlJaIHLKMhUTf8UoB3Ow6G91pWO6JiLFNm41wl8ohK5?=
 =?us-ascii?Q?pRS73w8+KU+Oe1p8BWw2RHNHNSgIFo0/oi9iQ4reHFcNXUZQrIqQkWCl1wuu?=
 =?us-ascii?Q?N6gYhKKnM8oozAZs8FbsYfc+NYiS6Lws9we0yiDg252TSNfk2ZvQSLwsw0fO?=
 =?us-ascii?Q?W3zf7kBw3jnk+ubDnwhKZXpEI2UR8BFeen9iZbuGIqttMlONcTty5nH8IOVE?=
 =?us-ascii?Q?a2tz58TvBqZnLMKj4YsnyU8R/DTmIDSYEt4qh2/Efl9XSNclRKRaUj07E10h?=
 =?us-ascii?Q?Lnj4mpkHKY8AfgVXveoR2lWs9XzEjB0YXvSr5lGUGZt5N+Tn3/RQ7oM00RWV?=
 =?us-ascii?Q?Jlm4BaKABixoChEH8kL5iB3M9cmFm5oPFt4bdRxoGmcNKN9gFCkjjwo4zOa+?=
 =?us-ascii?Q?+/HAmCZgdiVpNxiPUk3HJ8HyccMQVCOk+Nz/dvLw6bEVFQRvOogrHX/CGUoe?=
 =?us-ascii?Q?CZ6uZQF4Vqpd5sHyWcnCPWZCGcSVQ/3j5qEZwm7t7/hPjKwA6ciHmbfHMnbE?=
 =?us-ascii?Q?4RoKGv+tUKp69OzragxgCYhIPKdH/+2wO5NPGHkCIPJrAyShUERk5x+FUL09?=
 =?us-ascii?Q?85MCf7Cw9ZaXxOKm/pJv9mZjn9fNZwOJjVP6kiol9w3aCdZYf04vhAB6Nm0g?=
 =?us-ascii?Q?WbPzIo5XFeFsCny1HA48xN1/SIyxGB5JbKJUUVd2zJO5gYfhPgzTIS5H1zce?=
 =?us-ascii?Q?P8CdSEpOkF6uYlJvgiSVohVJl61ATi9u1PQtzc74d9RzagQUIe+5Uhmy4Vrl?=
 =?us-ascii?Q?HxJ41epHWu931n307+HzrnTCL2+fTAG35/7xLHCE0W9Okfy5fQoEs+gL5zhF?=
 =?us-ascii?Q?KeC9F1AlRTQoL6i82u/3JqZjK0GsGPDm7F8SVS7VmT/OEoMpwfEvHA2v88Y/?=
 =?us-ascii?Q?M4nmI0H+lAANWlZRW+nMZhoKNP6FDPWu6dQECtRQ7ikUorfcxn2MiOtnkQqm?=
 =?us-ascii?Q?cdns6CAamZgVML8HybH40wF5HgFoeLM3CQ16VbowBtC1y50+W9KzsD2Jsd4k?=
 =?us-ascii?Q?+UlIMYX3pTjmAPiQvxE37CXf8x4uUKhm7F5hK74+17Phbbdukxyc2dXXYFkB?=
 =?us-ascii?Q?E/R7/AiCr3iHddz41ps6OJnWJi0cTVImt5gVactA4ITG0yf5Q+K00cyrE5GX?=
 =?us-ascii?Q?P+JY62wZIJQI+Mra16zEpxGz4zkY3jGgR5oKXziUoKSF56cjioWIc/gGKs2D?=
 =?us-ascii?Q?v9sx8cfn4zCPBu+EmkRAUYO4X7jnYIsLmgKpP+BxQCUgJ4Sy42ad1oBDLbZ/?=
 =?us-ascii?Q?WE7D8+9k+6TvZ9q5WAdzfNFeV1l+jp4C0gKArvD9W5qb1dXOmFBwx7eQDkh0?=
 =?us-ascii?Q?+01TkDSKVUg1jntRVNoq98VkmHcoRbXKLxADw5uRQtO/EEIhYZuGgUtiAwGD?=
 =?us-ascii?Q?C3adXdy0kAxmUt7YQDE3LU1LrYixTfwGlUnGqLmVMrHLxph1kXdc8Aw1Bkrk?=
 =?us-ascii?Q?Jo+ix/9Doj/EsuSlR8CEckrATdZgQHpw8QlA0xSdAJpSbrCv4sXZbtP0IXR7?=
 =?us-ascii?Q?GUrLMkpXfv+9tWMaZGXp1SoT9nHF933xtxFCXIU6VxQaNY+VSgYvZIh5Q8Ww?=
 =?us-ascii?Q?QHGsuxz5tcrrrkWZp+s01Wk4R2kTHjkqHG+MA3+GVqGIC3YznApHkD68iGTn?=
 =?us-ascii?Q?i9WCE2P7R66VUYd1xbyOeL8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970b4684-aaa8-49d2-3004-08d9db94a6ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:55.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgyPHyJkgDVR1ElOTl0auI1+UgfJUFzZbwpYlcLVbn0PoiHUOZowv2Cu1tJL6xONpg4n4dA5QP57mlrOQ3hoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: DGiaLAyKL0VnKhmcxJQhVOdtA8-WPfMl
X-Proofpoint-ORIG-GUID: DGiaLAyKL0VnKhmcxJQhVOdtA8-WPfMl
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 810a7c3943..10db78eb8d 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -89,6 +91,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -161,6 +167,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -179,6 +188,49 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker, "%s is in use", o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker, errp);
+    if (*errp) {
+        goto fail;
+    }
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    o->vfu_ctx = NULL;
+    o->pci_dev = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -219,6 +271,14 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    o->pci_dev = NULL;
+
     if (!k->nr_devs && k->auto_shutdown) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


