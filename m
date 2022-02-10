Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480694B0A87
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:28:10 +0100 (CET)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6gL-0004MG-D2
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bg-0000Xh-Sl; Thu, 10 Feb 2022 05:23:20 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bc-0000tG-GQ; Thu, 10 Feb 2022 05:23:20 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7t6vc017462; 
 Thu, 10 Feb 2022 10:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=zvQ0DL8MgR9VNSKmG5kgh5gok27JYMnlsbAR7zvMGTrTlUmIrRgRfhcMkVhcFGRG0Bmu
 NjosIkfbwLF+Vhv5qQAFv1q9pLBP6p5foIiCktAcD0bcXl5GGwQpZ+mxcNmKu2WPrzlj
 42vhXZ/lfKRlz6ANUDw9dqlyO9wbha/1xYCt8uVY1OMsJe8okEMg2z9Z6wDGBNfw7vln
 MNW04MZyQDpp6xbWzRckhjjqo2swV6tftj7nfPPivW/AYs7iTKQ63Q5acXW0XVQRVBVP
 QB+VKjDDkwIwOqxQbl+3SypaqoOrDUc4uR0NRvIzEQNkIx/h+tFn2sczWavabCsiAhoh 0g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28qj1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AAAQdp068500;
 Thu, 10 Feb 2022 10:22:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3020.oracle.com with ESMTP id 3e1jpuw3vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHQEW8b6s01geo2u9kzJl2x66MP0LASQEZGdGOKRZ1X3YaqxzCH1D1/NTtG2PoKCD5xUWK2jV0eBCPjVSJS/ppxv7+YEz2JyCoMILtSuVAGJQiidwAIGy4aLWheLWc/leinlV82cPzOKRw0KQZr27KEGmVUkddL3JnFhzQeeHufFkYFOK/jOTjbTAvkuApJcTDVFP4T7i4+Htq1H7O9TBLySRgNs0S3N1Pp/JIduUpuMk4ANlzXCt+5Lk4RrXPRXerSeVHrFXYXiiH5zPVMLjskziA5cpm8JqU9gwvQGzNJIkMwh8Dc9PRpss81xh5jTGs3kQsy2+/GwNg/ywQjoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=hyhUSljZKQcHieUtWTPALKDuAaoP58HRM1TqbqNLpDhfGfvmRg3JCCKmTzdjlOrrqPBE1ka2EMN2q6m6yDOFJdOQUrPxtWUoVi7xbqB9F39oJ+/ksMppVFEcngBSBttqzi70mXa3lUGqaEtVhsxZHLLCHC16w1DJECXXZ9VQNcZtcI7g/pYUy7OI3a9/ZhomAEMEaKWdmUJPjq7QO01nS4oula+oZND5tmS5pw+iF9N9O9hStcK0c3qlZe39rq8MwFvl26PZ55IMhvUD0pRG4qsSrF7UJIYnal6FLIPfvkmmjotdydkPI2AXt+qJyR+/tP69rb4gW6z7uowwjJRWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDVVUxehxJjhlBu/bBfauPq7qw3L2r2FYTBkTJ1fk40=;
 b=Sixj7Ue1ECd7R9NVoiYSNZEd0bnU/1Q6ArUvBDyztYOTgzidqQhLdCElBs1gXiDJjANTU7hpqJRU9RzPaabZWCOapOmJkE6HbbRpmXYJZ88aHNUFfm8Sch88kKopFukgqTYQmMlGj4LdAEFqYV1hBzjDJOYGcROUucj00wuupBE=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 10:22:53 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:22:53 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 2/8] virtio: add vhost support for virtio devices
Date: Thu, 10 Feb 2022 05:21:54 -0500
Message-Id: <1644488520-21604-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48e7f12b-6f12-4718-069d-08d9ec7f4c20
X-MS-TrafficTypeDiagnostic: SA2PR10MB4809:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB48094258A2FB1448CE60AD1EE82F9@SA2PR10MB4809.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KzrJYV9yQ/j1BwcJorx0nyXtC+wm/UDdQzB1i0d9NGaco8iploUwfiGm91peab0PAzZUvuGcYEw35tPUWygQWYzHHENXfT0LE8N6SWBm4ZLZayl5d9IpbSurT7t0IGwKIxjBdMa79NOmefPWKPiekF9/DRbuiNVvzMLc45JssBPHScABdLeU4vjx7lx0F5FtXCHJgZvLb0UQt3dGTPphYlPvCfHg1NiC5KykDVUxVSETk7Mi7cJxdhqgaPubsJzgJq44N3wrWUZZ20MSvZ+CbHpjDU+87Mr5tyaSjmclyFBqCLPB0eO/Y8/5AsXYO4S+8+T2GK3Q3krFbw37jLABv+YiFNcSoVlCnxjI7s5Uz2Nri5oKvz4AEmBcIV7osEnb25k4nBKWfD9RR91i1HbsTnd7pqjmCK5dLjaw0FXc7K3UTkIbmCEMAN3gQY9KM9Pr3/QAYPYWOqXniHS29dKP8sNIUgGP3AF/8MPLa/1yc+Q388LMM17qHeUr84kvlCf7A0PsvKZ/U6Rtg8L9n314v+4EMAbVhHME9Q88D58XNnmuBi1NEc4veJSeAVqy36WOd+idHLmaETt7tQVY9pNZjpCxv6ClVp5ZB1u2xAs5TAkwfVp+vVMa5wK5V4lqk6cveAtNJTx99M4IvL3a99NcGyjaQy2xNzlmWXr91MOH1TqkhQpXmnh6z7KWB3RE7/dZSz8gIJMl6eFlD7nri/oAHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(8936002)(26005)(66556008)(4326008)(66476007)(186003)(8676002)(66946007)(316002)(86362001)(38100700002)(38350700002)(6506007)(52116002)(2616005)(6512007)(6486002)(508600001)(83380400001)(44832011)(2906002)(5660300002)(7416002)(36756003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5beOft1GMCVexFRVKfs950TpBa7jK+ohxtp0SMpKPLaLztEEgAwPA4zgDXp?=
 =?us-ascii?Q?+5+37t+Hk29dlTuL5560HYMSa9EGHYCNLOy4EkH26yLVnENtldoYLbFh3lfT?=
 =?us-ascii?Q?3drWSHJAGLojGJodLlfoClPDNeeHzSnW3g8VndkTyLLHL+czgyEklCnatXRA?=
 =?us-ascii?Q?HETo4uDMo5dNy7q1T9gO6jgLtwI5TzZmTPJ6fKp8o0Aua4sxnI5eQfcZyERJ?=
 =?us-ascii?Q?gmhBqFVQyB9uD4bbJgMkGms1HYvxzOf9or5POfvocfM66OH72rL89ruCQyCH?=
 =?us-ascii?Q?B+ortWq9n/nCZqxLbdep817yIQQpJ8yEdYWQLyj/fn91ADSS7dIwPt3Mw74T?=
 =?us-ascii?Q?w78P5V7XAGG7MAbyBQwVBsiMXQqZ+fPp5IQEYG/OPf6cGWo6FoJ4YlIwZFuw?=
 =?us-ascii?Q?fytU2vJdOwan9epR6P+PBYjPVJOhj7VS6lE7fkLDx25ljmV+i3bp41aoHB0b?=
 =?us-ascii?Q?ahDxhMnMJvcv4zckjOtaJQP6IiRhY62EaiBvJCXFHZJequc/Wdpad3FfVixk?=
 =?us-ascii?Q?Nj95DwoU1BOTN2yJaRxt1W0DyVebGs6jee3VK2iT3DNbg0v1ymS3+1qx/MK8?=
 =?us-ascii?Q?SEwKb3VCK/NFIvW1JQyRIkCqn6I8sv0oaKt4XPp5BBpYITo1t1lVXYVXqhrt?=
 =?us-ascii?Q?imrVN/gfXFhZXef7T+VaJtCSjr+yU8etrXPCZI6pX+BmRphuwgme1s19rk7X?=
 =?us-ascii?Q?LMXELr6NA4q+oW4n2ZbyrD0CgHi0Zz9nH51HpMz4dbePtHv0LkT1g4gOTIo3?=
 =?us-ascii?Q?8qkmn8xhzV8+vDVzuZLmlmjbnirRA8Vk22yV52ywq7zPAaGwk3JXMALyB8fl?=
 =?us-ascii?Q?DI+Znf8ZpmOO8QIY8inFP+CXL0Zv13reBNKZZhCHttF9DRGV4oeqfafLW8dx?=
 =?us-ascii?Q?2FIjX9ClpQuOByzcy9msXz5RyPX30wIkWHKb56+lcCq2sFR/D4SgYLj3mgWv?=
 =?us-ascii?Q?h5auXtUO7Ci9Zd65VSVRXGlQm6pa6mPrSv2qf7j3YUXoTsqs1kO1mn7TCknn?=
 =?us-ascii?Q?0gPOyvewimsoX6YATA9yQKctgzFBZpKFAN/ZLuFeVEvOx9xDpSrpNBDz/HV5?=
 =?us-ascii?Q?G6wcyIPKBZQSI+akz0UiRBUtGpSuFok3PQo2n8GjrYc7vlh0l9fUCp5Cp3Jq?=
 =?us-ascii?Q?et3TeHL+J/BGKlU6ZF7IW+rK3tOiL2HXt0O5h5HTecpPtS4wH5BMbgK84o1g?=
 =?us-ascii?Q?g/qVZm2B0/srAE0XeHMR8jS/xmwvFFG0kZhipjAEAW1jcNNmu7P6ZZKjcUOc?=
 =?us-ascii?Q?Rxe/wHV7PI6B/T+Zf7HG+rs7eFYLASlLprvQBzohEh1DpvuriL5QYnRZvYUG?=
 =?us-ascii?Q?x0XS0kcWaOGtSSBd6E0KeZZZ4S+pIWh02B5NiLjy8nn9LlUE+IQaaOjZto/V?=
 =?us-ascii?Q?8S4Ap184E6KjOygR9eb4EfWzh7DCDrWwzUyUJOR8Yxf2z+vz1ncE+IQ12QSL?=
 =?us-ascii?Q?cCbcuQYWEHZydMkY3rdJ8T2BIJfMpVTaNBwy72JjDb4oclTDtxUO/PIPii5k?=
 =?us-ascii?Q?Z8aRYxIEEb2tqNa8UrXjXl4FbAXO2m0xT0+mhw66bOPkRPgfaGY+QofGXmOy?=
 =?us-ascii?Q?D75nvrTG4wJPRSrNIFxRb+6u+zASVd66ACV8OYil+WwY27jAJJOsXFSFpGxy?=
 =?us-ascii?Q?lkWhdg2bHNQgWOpqqrBZxf4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e7f12b-6f12-4718-069d-08d9ec7f4c20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:22:53.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLJY4201eEXgPiblcPm6OakGBEK5YzRteslzipBUTXIei9LYI1zsfxD78XTVU6lkCuHnt10s1d6Z+J8oixEgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: fZc9LIBXtJn5ox48zmZ2Lzge4F0Y2eHV
X-Proofpoint-GUID: fZc9LIBXtJn5ox48zmZ2Lzge4F0Y2eHV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a get_vhost() callback function for VirtIODevices that
returns the device's corresponding vhost_dev structure, if the vhost
device is running. This patch also adds a vhost_started flag for
VirtIODevices.

Previously, a VirtIODevice wouldn't be able to tell if its corresponding
vhost device was active or not.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/vhost-user-blk.c      |  7 +++++++
 hw/display/vhost-user-gpu.c    |  7 +++++++
 hw/input/vhost-user-input.c    |  7 +++++++
 hw/net/virtio-net.c            |  9 +++++++++
 hw/scsi/vhost-scsi.c           |  8 ++++++++
 hw/virtio/vhost-user-fs.c      |  7 +++++++
 hw/virtio/vhost-user-rng.c     |  7 +++++++
 hw/virtio/vhost-vsock-common.c |  7 +++++++
 hw/virtio/vhost.c              |  4 +++-
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 12 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e8cb170..5dca4ea 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -569,6 +569,12 @@ static void vhost_user_blk_instance_init(Object *obj)
                                   "/disk@0,0", DEVICE(obj));
 }
 
+static struct vhost_dev *vhost_user_blk_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    return &s->dev;
+}
+
 static const VMStateDescription vmstate_vhost_user_blk = {
     .name = "vhost-user-blk",
     .minimum_version_id = 1,
@@ -603,6 +609,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 0981823..96e56c4 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -565,6 +565,12 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
     g->vhost_gpu_fd = -1;
 }
 
+static struct vhost_dev *vhost_user_gpu_get_vhost(VirtIODevice *vdev)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(vdev);
+    return &g->vhost->dev;
+}
+
 static Property vhost_user_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf),
     DEFINE_PROP_END_OF_LIST(),
@@ -586,6 +592,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     vdc->guest_notifier_pending = vhost_user_gpu_guest_notifier_pending;
     vdc->get_config = vhost_user_gpu_get_config;
     vdc->set_config = vhost_user_gpu_set_config;
+    vdc->get_vhost = vhost_user_gpu_get_vhost;
 
     device_class_set_props(dc, vhost_user_gpu_properties);
 }
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 273e96a..43d2ff3 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -79,6 +79,12 @@ static void vhost_input_set_config(VirtIODevice *vdev,
     virtio_notify_config(vdev);
 }
 
+static struct vhost_dev *vhost_input_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserInput *vhi = VHOST_USER_INPUT(vdev);
+    return &vhi->vhost->dev;
+}
+
 static const VMStateDescription vmstate_vhost_input = {
     .name = "vhost-user-input",
     .unmigratable = 1,
@@ -93,6 +99,7 @@ static void vhost_input_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_vhost_input;
     vdc->get_config = vhost_input_get_config;
     vdc->set_config = vhost_input_set_config;
+    vdc->get_vhost = vhost_input_get_vhost;
     vic->realize = vhost_input_realize;
     vic->change_active = vhost_input_change_active;
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 25f494c..21328dc 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3615,6 +3615,14 @@ static bool dev_unplug_pending(void *opaque)
     return vdc->primary_unplug_pending(dev);
 }
 
+static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_queue(n->nic);
+    struct vhost_net *net = get_vhost_net(nc->peer);
+    return &net->dev;
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3717,6 +3725,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 778f43e..3059068 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -273,6 +273,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
     virtio_scsi_common_unrealize(dev);
 }
 
+static struct vhost_dev *vhost_scsi_get_vhost(VirtIODevice *vdev)
+{
+    VHostSCSI *s = VHOST_SCSI(vdev);
+    VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
+    return &vsc->dev;
+}
+
 static Property vhost_scsi_properties[] = {
     DEFINE_PROP_STRING("vhostfd", VirtIOSCSICommon, conf.vhostfd),
     DEFINE_PROP_STRING("wwpn", VirtIOSCSICommon, conf.wwpn),
@@ -307,6 +314,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_scsi_set_status;
+    vdc->get_vhost = vhost_scsi_get_vhost;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b875640..e513e4f 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -276,6 +276,12 @@ static void vuf_device_unrealize(DeviceState *dev)
     fs->vhost_dev.vqs = NULL;
 }
 
+static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    return &fs->vhost_dev;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
     .unmigratable = 1,
@@ -313,6 +319,7 @@ static void vuf_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vuf_set_status;
     vdc->guest_notifier_mask = vuf_guest_notifier_mask;
     vdc->guest_notifier_pending = vuf_guest_notifier_pending;
+    vdc->get_vhost = vuf_get_vhost;
 }
 
 static const TypeInfo vuf_info = {
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 08bccba..3a7bf8e 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -247,6 +247,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
     vhost_user_cleanup(&rng->vhost_user);
 }
 
+static struct vhost_dev *vu_rng_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    return &rng->vhost_dev;
+}
+
 static const VMStateDescription vu_rng_vmstate = {
     .name = "vhost-user-rng",
     .unmigratable = 1,
@@ -272,6 +278,7 @@ static void vu_rng_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vu_rng_set_status;
     vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
     vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
+    vdc->get_vhost = vu_rng_get_vhost;
 }
 
 static const TypeInfo vu_rng_info = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 6146d25..416daf8 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -254,6 +254,12 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static Property vhost_vsock_common_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSockCommon, seqpacket,
                             ON_OFF_AUTO_AUTO),
@@ -269,6 +275,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efc..34f8c12 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1739,6 +1739,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1811,7 +1812,7 @@ fail_vq:
 
 fail_mem:
 fail_features:
-
+    vdev->vhost_started = false;
     hdev->started = false;
     return r;
 }
@@ -1842,6 +1843,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     }
     vhost_log_put(hdev, true);
     hdev->started = false;
+    vdev->vhost_started = false;
     hdev->vdev = NULL;
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index cca5237..7d63b8c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -961,6 +961,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
+static struct vhost_dev *virtio_crypto_get_vhost(VirtIODevice *vdev)
+{
+    VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
+    CryptoDevBackend *b = vcrypto->cryptodev;
+    CryptoDevBackendClient *cc = b->conf.peers.ccs[0];
+    CryptoDevBackendVhost *vhost_crypto = cryptodev_get_vhost(cc, b, 0);
+    return &vhost_crypto->dev;
+}
+
 static void virtio_crypto_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -977,6 +986,7 @@ static void virtio_crypto_class_init(ObjectClass *klass, void *data)
     vdc->set_status = virtio_crypto_set_status;
     vdc->guest_notifier_mask = virtio_crypto_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_crypto_guest_notifier_pending;
+    vdc->get_vhost = virtio_crypto_get_vhost;
 }
 
 static void virtio_crypto_instance_init(Object *obj)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 734b7fb..7c1b1dd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3273,6 +3273,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 2a0be70..90e6080 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,6 +22,7 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
+#include "hw/virtio/vhost.h"
 
 /* A guest should never accept this.  It implies negotiation is broken. */
 #define VIRTIO_F_BAD_FEATURE		30
@@ -102,6 +103,7 @@ struct VirtIODevice
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     bool disable_legacy_check;
+    bool vhost_started;
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
@@ -160,6 +162,7 @@ struct VirtioDeviceClass {
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
+    struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
1.8.3.1


