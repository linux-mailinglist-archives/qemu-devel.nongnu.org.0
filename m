Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D00422F9C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:05:01 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXooG-0000xa-12
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnbB-0003gc-Ib; Tue, 05 Oct 2021 12:47:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnb7-00065v-Rt; Tue, 05 Oct 2021 12:47:25 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195FvInC019448; 
 Tue, 5 Oct 2021 16:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=mikdf42moPKdwmIKwyFvM1p5+S6NORMP6il3v5RFB1w=;
 b=ZafQ9XcvAsqgKR/ihY/a9388OsAv8hpExf//P2EMDm4BPH/DVWlH3ZYxC5nZb8hkLAZ/
 yC8pXYz74OfdMNX0daLgWZJIh9jSlz8SRd5lN+gdYSV+yki85w62pGY2XVP0/D8WI4SP
 p1uYDSSaqOyi7knAiDr2+bI+wW/IyswiqoTIXP3b7DyRbPdhpzQ6ic6EGA/QYqV95kso
 xmQjHYeVbjZ326s/E0wGxEB6eIq+pUAKH0ZBwys++BE3FWob+ocR8CPAmWxfIZ2QAjgq
 mcY1G0noN2W6rjmS1Hg5gdxjkQYLws1LKnsbzHlw5AE+1kJ3i2cugdpCQBzpsfS7q3ec uQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5hcxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:47:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195Gig9j158848;
 Tue, 5 Oct 2021 16:46:43 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by userp3020.oracle.com with ESMTP id 3bf16tbcwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaIFL6G76bMihec2XacS7B0cFu0Jiek1rIgAub1bAl6TiGo7i6ook4O6B7D1T6oE3EA81FevK6qDFUTz2MwTx1IuOTUngwMeY5Z9UFXegz3EgNzV790emrlKBNy05svxSPr/IZEMBIi4rC8jQbuavrbWLFoEpI7IcWHLmHMqmj7hWvIm2git6vQJmaGuQwunbui69BwcoV/ZKsxNvoeBjQZOabSnv4pnAb7nChuliQ68Wjl5uX97o5F91b71hZZyTDY6+3ChibprDG3y3jOdFzc3LRwe3yxxmCedYCy8EfVLJXROeStg1Xr94EgSxuuOjCuVR0mrKt1lLDO++xGM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mikdf42moPKdwmIKwyFvM1p5+S6NORMP6il3v5RFB1w=;
 b=LhPS0U75WduNDZioJLFBdC2q/6XcQ+BICrDWxJRvlgYVJ8Wiz04+2+yMNd1gyIQdpveRAhtzC/UxUIoSV1MBdhamJOjqxKXDrEE0VbQ6pq197KXW9vipVsfEENINGBCs7s/TahlpGb95Ij+mgs+PXd3AjKkZ/CG4MG9D9BwQoeZHQi0Snk6GVL8pDxcgZ8n26NRbCY236K17N42y4hFNDoOZXdR166RDhfrlfROMtYYMLdgDboAQXfrWVD7gI3LQ3vM9dTAgkcgKfnkqLZCHQsAgJXrCqquUcU4t8d+6hFldqZCEjQIwedSXzCgJndMLQNWpV004m9oZltmDrq1Drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mikdf42moPKdwmIKwyFvM1p5+S6NORMP6il3v5RFB1w=;
 b=LAelimrOkuZfOg8oi0SGziTclOWBvbYglRJW8V5HSdSIJV80vAkGEW8BaTkG6w5yjmdNbLoZ2c8R2Tp0q/r950AYHxFsj47NOow/sDBSv68zvBDaqIPMxDfclo9CzGQOMIc+ZIRq1iii0i5G7zArJQzFJbfOBETPnG7GOCScV3w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:41 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:41 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Tue,  5 Oct 2021 12:45:51 -0400
Message-Id: <1633452353-7169-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4bc135c-5734-463f-857b-08d9881fb4ba
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB2942D4F01543A4D5A129C976E8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7DCHYb1LnnK45O3+OxWKNqyKI8Deg9A2NiMJSBnYhuK+kzU/XHuH5OraovJIQSSZt3Rj4Bij8WF3wTzwc83GFq55vv1ZxozbtCh6Klw3QnhDv3OYg90QFqss+JwM/Pfk20WVahEsmxbJL3dzHtVnM0ZgiBJlyq6mtbKLDeuxsYlIbJoXlfcurzM3CoeKVgQoKvoDJDJmbNLOsMRGVz295jU8BfE5GBnTu0LjYSae60ZiigDhqtxtKzH1EJFTJNjkIl52qEkZuF8e/wukf+zDEXdOXQZAstp9Op12TijuaBAxKsC8x5ap1L5Al6FEOhDQ/tlyWkgvq5fwIGHwA6focmWXJ+aMKVjmE8xvKldC0vRm8/n3umYdusvGj1g4SqYUvg8fODkTRakZwTWyIjpBEMiqD7LtWX/FFPNPuXzgxxC8V6n62i7kHDU4tsJypD/aKF9SZRA/FytWeiU16Rl5QTLkVlFkU6oVPWFLzuchTptRzkDo/5V0rmC4lM/5SJU7JkDzadcAlZE9/XtgkHriK4jUaj/cqOntGWp52I4D/6c6UMY+rI8Rn11ByHYD9U+BQs2dawGzcvsRkIwO3SEP5nCSX/GI05GPVAMoM2Ch9hJj5pHRsJoJPQqhcu0XjmnOs0p+mYFxR1v/k7tY8R6OtZHG1NVngiTPh4PbDnlWny1U8nGibJHXpn2pvNHKtsvNOAL4aGFSoy/N9sNUagfpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mic3rf3yfql9OZ8pheYi0UGpDtrA1G0rTTJShBTDaNj4x5PgO3ugIylFirb?=
 =?us-ascii?Q?CM7qqd9ZfLWk7J1FyyUqkuNg1CZlt3jmqETXuzYcwXFrABLa7/ja/fJNE4p1?=
 =?us-ascii?Q?gTeRIO5N7CGSf5FUpwlEazKFWU9zt2dqmNhlKDK+NbLliucCOk9zdXKXVZS0?=
 =?us-ascii?Q?da7pyhYe4C+o3R7OZZHh5+wiOtdVAqCtY+E5q8PSsl6QXHTj2AfnQIVty1fc?=
 =?us-ascii?Q?jcE2u/UzXVcxCG5vq8Px4gqVbvUIwNak1gJn4GCxjIB1UDAr1MwPp0wxhcOr?=
 =?us-ascii?Q?vhuQP9eF2ZBRaoK/dLR6piHUw7PxhNTCUtZ4n7Vs+GccSU9MGq5O9Jns8CpU?=
 =?us-ascii?Q?a/TYQ8Hg1gCPMyRhRkCSJFOJjZpcOqNqLd8gLLTnadWB2lWYSlJCwC5A3vCi?=
 =?us-ascii?Q?LHSovdSkNou5gNfsktQ9HMKt9YdEzh1hOpkQcJoKnNPu9u53YHGYKv2hosf1?=
 =?us-ascii?Q?kzeJbhjoBycOurjLyFDOf4ubsq8CcfVRDvaFr1oiJRNiR/aaVWDKUpyEfZsC?=
 =?us-ascii?Q?aQou4xkvv5QwtO9T1sSB6gE1KrPYmk1TBseoZvh1ienZs2pYFB78MB3BEBZl?=
 =?us-ascii?Q?BmdZI+kaMw9bLXt/qXek52YYLLdV7dh1twbXurqKpg4yDgEMn2oG8u2LOwBN?=
 =?us-ascii?Q?e9yaZYHUNEvyQv81AR9MeQzuMvuPzctmSDEeaRrNNjE9Iwz9IqPZTOMM8ihp?=
 =?us-ascii?Q?sXwzmA1Wfvqr+e1p+/YYznb2KoyZ0zJk6ZVSBvqCT11kl2M3Wbn7SFEF7RTj?=
 =?us-ascii?Q?se+PSOEwa4Qe+tP6xHsWKFOwCTh8Re3UXsZM3bXGhuR8tY/u6Uo4c9ITg1QI?=
 =?us-ascii?Q?PUwlkNtptpjfSxk/+tAAL06TZ2RVMfFVNuNLbRe4jpWG5KjC626uz3TBfaqZ?=
 =?us-ascii?Q?QLRniIfCNnzSZojYXFLjR3s94jtFMrdfw/tfuDeLH50rwYZhcwV71C7U2D+f?=
 =?us-ascii?Q?9b7N/oRbCOi+VB3w980pBXOtvxKUM6g1K57D3MjZbxXoBE/YUE+LnV9tzjGc?=
 =?us-ascii?Q?sI5LbzcLaIhYFJ9ljZ57FbzsewenxLYHao+fiNazF+vfu8DCEteyT+rcLfBw?=
 =?us-ascii?Q?toLY7ECrjjdhTJgLMvr8+0gCG1rl7n4snxiG3U5IpC2iI5tJGzP4uLxSdNPL?=
 =?us-ascii?Q?uwQ/ZsN2eZzfzWnfRIjvTbaz8mUx2gtpmJ2SPrjFnz+jcF4RmnPMBYO0qKah?=
 =?us-ascii?Q?jBdPvKvOoI7A4EAwHb31FU/3l3h2ESoNS5ZqEFSLR3sNio2hdX+jHV+1miI/?=
 =?us-ascii?Q?S7Aez+/6Lqkscv5eRhCzqHvTLqEaTvid5J5l/ua02OPHoQd6YKwr3YOqJX0Z?=
 =?us-ascii?Q?wfY6g2TOTeN+GAp0zmhmx/VX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bc135c-5734-463f-857b-08d9881fb4ba
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:40.8655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrHqeHDN+p2OPHGqCzjgGSxPfhPL6A8U9ucWCvYEyBtsSLAwCoEvI7UQfy0fYPJPYn5a8PhH+4WFjT9Gse87Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: 4gqtAOuYZ0tRCbRxta8XSN9bHLNR_KvX
X-Proofpoint-GUID: 4gqtAOuYZ0tRCbRxta8XSN9bHLNR_KvX
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 +++++++++++++++++++
 qapi/virtio.json        | 262 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 379 insertions(+)

 [Jonah: Added vhost support for qmp_x_debug_virtio_queue_status such
  that if a VirtIODevice's vhost device is active, shadow_avail_idx
  is hidden and last_avail_idx is retrieved from the vhost op
  vhost_get_vring_base().

  Also added a new QMP command qmp_x_debug_virtio_vhost_queue_status
  that shows the interal status of a VirtIODevice's vhost device if
  it's active.]

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index ddb592f..387803d 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f0e2b40..8d74dbf 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4284,6 +4284,109 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->device_name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->device_name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 678bfe8..de09d0e 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -815,3 +815,265 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus'
 }
+
+##
+# @VirtQueueStatus:
+#
+# Status of a VirtIODevice VirtQueue
+#
+# @device-name: VirtIODevice name
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc
+#
+# @vring-avail: VirtQueue vring.avail
+#
+# @vring-used: VirtQueue vring.used
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+    'data': {
+      'device-name': 'str',
+      'queue-index': 'uint16',
+      'inuse': 'uint32',
+      'vring-num': 'uint32',
+      'vring-num-default': 'uint32',
+      'vring-align': 'uint32',
+      'vring-desc': 'uint64',
+      'vring-avail': 'uint64',
+      'vring-used': 'uint64',
+      '*last-avail-idx': 'uint16',
+      '*shadow-avail-idx': 'uint16',
+      'used-idx': 'uint16',
+      'signalled-used': 'uint16',
+      'signalled-used-valid': 'bool'
+    }
+}
+
+##
+# @x-debug-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice VirtQueue
+#
+# @path: VirtIO device canonical QOM path
+#
+# @queue: VirtQueue number to examine
+#
+# Returns: Status of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device
+#        and the VirtIODevice VirtQueue index (queue) does not
+#        exist for the corresponding vhost device vhost_virtqueue.
+#        Also, shadow_avail_idx will not be displayed in the case
+#        where the selected VirtIODevice has a running vhost device.
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Get VirtQueue status for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-debug-virtio-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/vsock0/virtio-backend",
+#          "queue": 1
+#      }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "vring-align": 4096,
+#          "vring-desc": 5217370112,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5217372160,
+#          "queue-index": 1,
+#          "last-avail-idx": 0,
+#          "vring-used": 5217372480,
+#          "used-idx": 0,
+#          "device-name": "vhost-vsock",
+#          "vring-num": 128
+#      }
+#    }
+#
+# 2. Get VirtQueue status for virtio-serial (no vhost)
+#
+# -> { "execute": "x-debug-virtio-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#          "queue": 20
+#       }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "vring-align": 4096,
+#          "vring-desc": 5182074880,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5182076928,
+#          "queue-index": 20,
+#          "last-avail-idx": 0,
+#          "vring-used": 5182077248,
+#          "used-idx": 0,
+#          "device-name": "virtio-serial",
+#          "shadow-avail-idx": 0,
+#          "vring-num": 128
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus'
+}
+
+##
+# @VirtVhostQueueStatus:
+#
+# Status of a vhost device vhost_virtqueue
+#
+# @device-name: VirtIODevice name
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+    'data': {
+      'device-name': 'str',
+      'kick': 'int',
+      'call': 'int',
+      'desc': 'uint64',
+      'avail': 'uint64',
+      'used': 'uint64',
+      'num': 'int',
+      'desc-phys': 'uint64',
+      'desc-size': 'uint32',
+      'avail-phys': 'uint64',
+      'avail-size': 'uint32',
+      'used-phys': 'uint64',
+      'used-size': 'uint32'
+    }
+}
+
+##
+# @x-debug-virtio-vhost-queue-status:
+#
+# Return the status of a given vhost device vhost_virtqueue
+#
+# @path: VirtIO device canonical QOM path
+#
+# @queue: vhost_virtqueue number to examine
+#
+# Returns: Status of the vhost_virtqueue
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-debug-virtio-vhost-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend",
+#          "queue": 0
+#      }
+#    }
+# <- { "return": {
+#          "avail-phys": 5216124928,
+#          "used-phys": 5216127040,
+#          "avail-size": 2054,
+#          "desc-size": 16384,
+#          "used-size": 8198,
+#          "desc": 140141447430144,
+#          "num": 1024,
+#          "device-name": "virtio-crypto",
+#          "call": 0,
+#          "avail": 140141447446528,
+#          "desc-phys": 5216108544,
+#          "used": 140141447448640,
+#          "kick": 0
+#      }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-debug-virtio-vhost-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/vsock0/virtio-backend",
+#          "queue": 0
+#      }
+#    }
+# <- { "return": {
+#          "avail-phys": 5182261248,
+#          "used-phys": 5182261568,
+#          "avail-size": 262,
+#          "desc-size": 2048,
+#          "used-size": 1030,
+#          "desc": 140141413580800,
+#          "num": 128,
+#          "device-name": "vhost-vsock",
+#          "call": 0,
+#          "avail": 140141413582848,
+#          "desc-phys": 5182259200,
+#          "used": 140141413583168,
+#          "kick": 0
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus'
+}
-- 
1.8.3.1


