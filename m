Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09C4E7A74
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:29:16 +0100 (CET)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpcZ-0000w9-Uy
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:29:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTw-0007Uq-BY
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTu-000361-FD
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:20 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHWvXG031098; 
 Fri, 25 Mar 2022 19:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=dKTR2QPDoj/BQEs/u332JBz0cSwvYq82xYcC0N+89Y/n7LUYDvd8xicBeTxUkQ4I5Yd0
 CeAYXBKqHLUDVtPnq6eaV5EQFtZixvVjMNySV4uL0jGU6CF2pMV8oRMADSPCg1xoamMx
 w5S2zRS6I3EjugX3f72P5WbQltXYKUmSUIuNIVJJT6vzODNtY+u0qVnd4nnwNDx2DvWL
 GHjSFphrG5vHS7nLAVi7UTttjLqjRpe0zKAQF8BGp5N4sysiHLJnpG7CY/fc5zglSPIJ
 FKkZOHPCoYiCL/1G7i8Kt3h30kl5DUTIMiX5hyt42pKff5wQHRk3Lx5OhDH7acL0Ag1f nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s1050j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHhjJ077976;
 Fri, 25 Mar 2022 19:20:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by aserp3020.oracle.com with ESMTP id 3ew701w9v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1nQ4bRJgiJFgGpOw9skjbKS5qhgqNKxRtm7wT9cBb7cMQHXZQe+uiUcGOiTMmvgJngyeJy1Wn9SFeL7hfss8EcfRCD1V+bKvKgu0naxxMIiHhNOvcTPNqv8n8Em+f3JMjLpWZkAcxapM+zehO9vu7GIFFM/nSO7RyvpFVUqTIq++G8kcm/BQr7rvr3cV/O4BSyDRUnWy36p2WGHJY0kgfGuhqFWa0IevoRuR2cJ/pBbb76rOPJiOFnV7oncOEgY0PTgG8zbiow963/wTz2no/9Hb5nWTADjQ/oWokK75j/W+9DJcsPJElQrIQoqoyiuJBtkLYw90NbOLNKXVqZa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=JKJsFML3HqyfH+zZAqzX4FMZdS5LvWINZEi8LkhVCKTkSY0zpcpcRFEIfMp7yYSF9ZNgS9XrFdnPwU+vSC+hXxpPJOxGlidbwSOrlom4cE3JeqP+rHbnw3mFJN9Erfs+28ad7qbchbHI1mcrMPZ0IfRDyILrmIS5IOlcWWDYsUiF31WLOZvPDYkbgJM9cHb6CICxuYk1Ohlx0r/vBrWzwR7HUyzdFoHR56f7uIpqO6Jtp5euG9Nw8OHOCVs5/0uQ0I1XqDgTJwY6q7HbsCVa3+QfKJbJeFjuSnuj2YV0ZQCNe9MK6aN4UltJ0jt5NF2Tr3GfxV8rKJWDCmQlnNv5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=EQiF492um+zSewJ1OodZwIskYrwPdCUDQ1DEYYKkwzvT5pQk2FhrDAG+PWxjxMHw70oAzMa+ijaQGnE0B87RnA0cElMLK3nHI0nwsUgUZWeFlGehXJbGCtOPZh5VfeeTSh7cJ+yy+DwhGkqU+dPXuXDAssSyS2SGQygC/rD0vAk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/17] vfio-user: instantiate vfio-user context
Date: Fri, 25 Mar 2022 15:19:37 -0400
Message-Id: <a3adbc37a90f4e09339c11a9c9e5164497dbca38.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d65ea30-a5dc-4cea-a61f-08da0e947b0b
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52064F0C214DFEB9295802EA901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M041Cp2bZJppk1bUvpIlZN9/OmWKtnvvB4Y6E9d0lqLUMtruZA1YargZr+Tp+qNY3EvHAfQF+Eu+31RIWOHVz6ZsuSXX9Ygtx3Z9+Kiatf2Ceymb9/L6tOCKmNRRudc9PkE/BbELL/5P/1BBPgsCST0pPue6QmxjJrwJVCr7H8DNy6Gca7eXO1m6Ev30NfzqLtmczK1y6xlCgHX/XyNVCGPvyqUMgO023YFMAiTWCAcdsidQu81OSgd12FhPJPrdTUdE3O+Qs4uQ/52/Xvy82e13ICWMqmCmyEiz+r1nmoGpRzrmlC7ZtmVGKzTiUe24aUrNHKkOL+POy9HXLiWl7cX+EmlYlWmVLyaggLKNGRfyjpLVLu9IyWZO4OYBw/EHq7x7U5Of0bwFIHKdOj9QO6eVXLG/ORu4j4tWTl/RHt1Mz4XV6vnUvAAHpo5gjxOKIaf0FNcWKA51D+/mXcAyNRpXZsgdS4G7UrcqLJ8Omh15rVjfGvScclZQN+2fElk2DqEsGKDkOySdy6jUcIoZIZpPJ7Xmrtk/Ta1vUqWBYje9mKJ3if5PJeT3hcjQdeB64qd3lXWy35jNAK2jE2mIpddtIki7KhOaLbSVwVBvEdWM4hzV+0FbA3EmtooriOmiqTbAqYkT2PEcsboQ2Q6QSKmfSGgqoH13g0JoZhIJFJK7heX/EEFn0hkaPMIKcZEUlwepBrik5+q4YnzXQbXY3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3janopkuIpkXVZZlvSi4yvNwUjo+7EqrkcuTBYK867Alco+RVa22Q//sl/U?=
 =?us-ascii?Q?brRgZAqzND/67dKI2JA7WU2beAn9Zk+kHkCX9jLZbKu6kfk/QYsqz3eBhHuh?=
 =?us-ascii?Q?hr2nYTZVLmEON1d488ZTt0FhCevwS0CwU9G30LR15KaFh+/Z63jROTK4Zph6?=
 =?us-ascii?Q?0IOVRITBN/nmrQKPSGuc3mwH1BpFAfSM05ezxcyRE9lNFyrNn+O3vAuGy1Mz?=
 =?us-ascii?Q?RAfSQ2J9LukN8lDSBfbxaXy3gvcKsgTq3jsNspXBrykIhOIkdJoKPzr8G08i?=
 =?us-ascii?Q?toJj+lydwM+kZ4k5i5y95j0uzYazb4XEqS5SLnTrOjKlsMTPyjtCjweGrV2f?=
 =?us-ascii?Q?vqczuBG2IAlFasaWQ7M8Nr3dMSdE0srHn1AGOOv7PwcR/R7noKEVE3rlEnPd?=
 =?us-ascii?Q?h/VDiqkulHtgBMA6Zc44lGCrunvXL5drfoujE9c7lprJ/RwJ1WtvZn3HbRON?=
 =?us-ascii?Q?ogfieGS5Zo/lO+mw1aPhGwvRtdveBZwe+Tc8CF2W/tdBPtk1un0xu8WewkQC?=
 =?us-ascii?Q?2i61gVFI81MkxCtdBT98aU2oc0rBps9U1yD3DJJTIKNDT+YrDjQu2gzevE4l?=
 =?us-ascii?Q?7QWhKaKWzZ0HDNo4OSO9lYbXdp2R2k5rZ74D8AxyqO/L2r7L0iAO8F7FxVon?=
 =?us-ascii?Q?oAz5rpd4ewPAtbHh50gqFHCuWSwn1EYQtD8P2pI7L0Bze+KnZ0PuOwf5xUcC?=
 =?us-ascii?Q?pgV98G2xZW2mf7PJU8y/1kZ2/peuKQfHxu71Jvh40KKXdPI5B1DgdKxcti45?=
 =?us-ascii?Q?4HE5vGOeVy9/XkbIaPXFQ+wM+vcyZFue/CDcsvvYSkouvdMw5wjrpiA5nlkW?=
 =?us-ascii?Q?cH1pxFSsMiq79Q3l9JZNLfn3pbsAlR5GhDp5D48ZmuCVe/1rL2/DfzEwkOSN?=
 =?us-ascii?Q?VdALofJ1c4Vvlk7Z27rqSZzWqL0OU+BRtUtt1Sofrk7JPBP4KnF3eBFL5goM?=
 =?us-ascii?Q?V/YaYq0mm4WQ3s/c+dUGZXDDfOBgECSMuI9e9DUv7Lediyk5Xttj1rclHZNN?=
 =?us-ascii?Q?ykbVodXc+LEnIXDZWUrMufolMgUd7bBkGkfqKGsSX/wzovlJHFEPKcGvK/Ls?=
 =?us-ascii?Q?xVdlXreNYc4kT1w9EainTSMzw9kWo+7QNKDqyVR1F5hFF7FIYFpBiFLOWfOw?=
 =?us-ascii?Q?op3M7hRqAGtOUcUJ/2vfid97E8C2f5ljWJVHrV9jQf0yDflNAc6rBjo9O+n6?=
 =?us-ascii?Q?0Kaqt+wUJEO+u5u+BPfJu3Uv1CncnRQ8ges+nmkGY9vUifiwSmttm8AGVq++?=
 =?us-ascii?Q?9KCW6Q664+6JeEzhuawT3ZzX8kPQYicI0qcyZGRa6IG4jTdTookQwWIpy8cX?=
 =?us-ascii?Q?sZxS6SQ8O/zXLYMdH3xIwgkTA7zr/d13nmf9DHxPvrUFW7s+RPx6lONxeUvW?=
 =?us-ascii?Q?J3J2w8ws6WVofKwURfQldVV1U7j2G48GgjpIKLmPnqybNqmS2TRPFJ8gdTMN?=
 =?us-ascii?Q?gwkiRTNtbMhjrWCuijznwM3iyEY/DFULPAJ6f4XRPxMIzQFV9gQTZPejaS50?=
 =?us-ascii?Q?PtWHAuMavBYHJmWZ1jPUEqRNPpDzdSWfSsWG7rh4NmL3D307HHBLs8Tf6nhZ?=
 =?us-ascii?Q?3b2JC6jry/670ORH7qxPSHcgVuecbOVmBjjcX4gbhjBOuNVOQiuMHxG9U00q?=
 =?us-ascii?Q?8lmmA7bnpPCvL+3WGmK5ZNVwfH/Xugpan9Q88+KLOYQ+JCgMOS7lKuy7uCmv?=
 =?us-ascii?Q?rO13tyemitZ5zVL2au5Bw7M2WpCSQ2IPpmNLhgv4xMTuodi9jo28AWiWRu61?=
 =?us-ascii?Q?whfzMoGsig=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d65ea30-a5dc-4cea-a61f-08da0e947b0b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:11.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z35mg9NDrgRUeIYzpubRjy8pTeLzce5xwekRYhmGvQnQKx8tNIdRbuJVjX56UrqccpE0YRuq2ywSN0iBZZ+ocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: ljKZBafiJjDWdF256C4-ZUbSVog7qt0U
X-Proofpoint-ORIG-GUID: ljKZBafiJjDWdF256C4-ZUbSVog7qt0U
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c4d59b4d9d..d46acd5b63 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -74,8 +77,14 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static bool vfu_object_auto_shutdown(void)
 {
     bool auto_shutdown = true;
@@ -108,6 +117,11 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set socket property - server busy");
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -123,17 +137,69 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set device property - server busy");
+        return;
+    }
+
     g_free(o->device);
 
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        o->err = NULL;
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -148,6 +214,12 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -161,6 +233,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+        o->vfu_ctx = NULL;
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -168,6 +245,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


