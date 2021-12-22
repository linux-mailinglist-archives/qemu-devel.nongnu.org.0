Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ECF47D809
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:54:51 +0100 (CET)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07hK-0007vE-Ug
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VK-0004z6-GC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VI-0008MG-K6
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:26 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoI028486; 
 Wed, 22 Dec 2021 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=lbEx2ykM8qhI6VZzWrUBMaPOpSWPrANBHSFsc6L2WPo=;
 b=kvflEKfzfj3GBa2MlCcqO6PKbW1TYoNOUdp64tYY04d/4k5f4zBCu+1JNhhEycs8Vvri
 JxFWOfIhiPo3+QBsH+ul1DP4LOZ7hlx84m2knV8aepD12PfRjOHKpkBzm+9zIGq9X0Y5
 RCSPLXcy+4PusXW0ixp8yj00H5u8mRV34/MG0+PI2b4KUqWf1Q743DktuPzXHZ9OPFl5
 yVvHl9jNOLbU1tRs8VDjXLtgWHQy/aNNALyGS4pzY9deWkqprXxWFMyXMjd0O/Jsn/I0
 IkbHSwG553zZnr0lSXdhxe7R9IkcXeroWttra0+xFI7QMI2kngHKbw64G/m/w6OvS0Iw 0w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqJ030437;
 Wed, 22 Dec 2021 19:42:07 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMw0ESo+gQSfcMprIsuX2f0VjbsbPDOZbfv8M5gQBZI6HzxkgICBjdx7TYQFX2ZsrFQt2iktY60et46Q7BTFX1MhuZPkOaq8HHyL/RGl7iCB2PS25+vxlJefaoluRaBVntbiLfHe0BqoHtOhWmH6yvl7Nc4MnXQo1AMx6fY3DeNVE85O4cyE0QJcAYtfc8I1FE5Ffh1aHsSXH+DTfXzaXjvIF8O1JIc5kfRrtDRDtVJT2F8j/ZTnCCw1NdJeVTFDanEM9L5MhLDrK6wnV593LM0Szz/zvQv5wtpVp1QwfgiFasnSGgnV26YPxAMKftT20rVqfqUFV4ya36Yifqs3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbEx2ykM8qhI6VZzWrUBMaPOpSWPrANBHSFsc6L2WPo=;
 b=QRkiw9pWlNk1NLVreMQxTk7T8UbMXgoaSYNBGLz5WKMddB2LoM5cZUKXqPIwLnwVArY7cy66AkXz1FPqCiD0bOAjKEKAhu/2WY+u8qiO68b26UoFZIXkOimNWKjU0txl3UcJLMuxeY501rsv3w34Ac0m0gK15kDnU9MZecEGdScBps1U9qP9WkI0vGZ2HQuDV97KqgR6PofTC7l0OoGHcurXoETgMI+uOJcnvC1GFWeAgT7we4rANvG0/WLR8hAlVpJ1m9rvaL6NFNgDq2E7TYWKMftZQKb9v+wie/JpfubeAMylBmFzENCdXpWHAYAE/kUf+BWDL1My8WHKKhZq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbEx2ykM8qhI6VZzWrUBMaPOpSWPrANBHSFsc6L2WPo=;
 b=AlIOeJMr11qrc7OBvqVwswBzrue/WLQxw+QCHGgrfc0FA3CufRHgT3VF1cRt5gkJIi4aWJYVjmpG/raKaleulJKqzyhavokyZC42o1JST0cwVzps3lhq2yNisNBwzyE26SqMbfh0JfT2BslVR3CraFVPZW7/hwUGezuWwHkaYfg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:05 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 20/29] vfio-pci: cpr part 2 (msi)
Date: Wed, 22 Dec 2021 11:05:25 -0800
Message-Id: <1640199934-455149-21-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dec9647-bdd2-4981-18df-08d9c58321cd
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB42428ECDB53E1410A4F2D0E2F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwMDij4vN+UYI/KFMw70Rc3FUEI9dUhUSlcNxoRuisn936ShTPA4FYD+gTrMVwBUAGMZIfmjG0cSc6yUnII2/PN8WKmMnMsOU35xGVuwBh7jcuuZ/+YGkhXlXjJgt4P44SRGVo3pJS4MZ195oVX7m+6tInkpwIgrGHOutXt84dWw+TlJy0sZOihcdufSZ+KZKoJp+35A9x4yoa2Agv9mNIVpUe4mqI57TNWV5v+DEvm3ivBibeJU4JxoR31bGicYlhBdpqVD6G2wrQTika08wyrheUNzzPHe+oaQA6A6vfKQ4H/HDWTPuPKR4lOX2KOkbXNcOSbcZbFO96e8epSJ+9KvI163hXh0eZU4ycOmJ19aFybCUe7mZ8nPnkWfHcJ+941MIz5ocJaLAbmWln6H5Yp0DyDEvpE1lCrEOofTjvncdKn8H4j0KnRy+q95jVzSfcMGRQAUFn3M4klqPA47ovE5Ppq/0pUa55Sm3ktHC9J6g5ib1lGPU3NpB6dC1+vK4xH/7CKnWtwF0sdD3pvsxSUoa0AFwoYI0qlRQmoXfv6tgIavn47mpX1T9YX4ehh41W4za8KDP0NMQvYJW/lRlNuHeCnQq5M98QfiCoRqF7d4dT4vsq9unBrJt4WxrZv7mz4eA9nzVPNHLfoq8hIezhMDX8ZhMhP0rF0tIT9kxQIPMkoS+Ed9tAx8ygIiZZwUE2Si5Znwz9G6QJ0XQJCUXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6nnGhja1wL4N9KceFjZhmxCYRIV5YRA14hwASu0OXPNCApW5go61O9SYiY7p?=
 =?us-ascii?Q?7+Squ6IS+gub20E8q7+lOP5vV9ObhJE9UI/NmzhG1LOPu+v/XGdsCUluch/r?=
 =?us-ascii?Q?Y4vJjD8kr1D/RsRu9IVsbYuK94Z/u6lXznlJ0QIe4sweOTbqxWg+Y8XVDwwx?=
 =?us-ascii?Q?Y/er+QEzwEedikotAg/FdyvLZOdDaopHUD/m8ZZfYCNUAEhGmyl23LnxAjpU?=
 =?us-ascii?Q?TlqCwDNuZUNjic1oqNGbYRlXtov3asbFQVCmqtaJ8M7fwTteH8zwphF7Lp70?=
 =?us-ascii?Q?wh4ryZmDxOIpZSoFOEQU+zkoCKzhVYPZ+ShAAIZIMVmt0FdX9TagiU9R33Hu?=
 =?us-ascii?Q?wSvF84HCTfHIopJWoR5rWQDSf8xchiuwrnyeVqwYNSBp+T4wfRB77jjTYUTV?=
 =?us-ascii?Q?X83OZnAz8Jt5nCy8kDBWyyOCG0Iuz9MVKYtcKlbSq4s3ZkUPQr9xJGh58lB1?=
 =?us-ascii?Q?3NB+8qI13wJYjnrAllnr0F0kczvb5Apy6ks9f7oegt2Q0tss9HxwN72ZR//s?=
 =?us-ascii?Q?BNGt3q+HIVgPWGQ3/qlYrcMQKAZQ5EW5aVJpHdEnIzbK8gq2rVoJ2L2GSwyG?=
 =?us-ascii?Q?S7Np3W9m3yaVqFPuvm7HEQRIAwthCndmWHUkeMpJ3RnHb7JS+xh48JEDQOZd?=
 =?us-ascii?Q?g+I1qH2vlOkAX06Os5fKwLRAy3vM5gbYLYy/6UMvTr+d8QrQtIU7cCPU0ODT?=
 =?us-ascii?Q?VqNfFTZn93VcYanbbE7i2oYaPt8Wc5rT3ZniDXH0vWBOng98OQnPCJ0SKDnW?=
 =?us-ascii?Q?HnCPUvvr00VdxK7p0S7q2/5P3qfdZkk4HY6oECGKSwKZfGhybDMPUCJz1WE2?=
 =?us-ascii?Q?+7N6uwRE8nlGRk0HXgdTjMvTZZecB0LJLpg7cdhjpkm0XF36soSHCZTB2hgJ?=
 =?us-ascii?Q?7zlpCuUj2Su3BPvmUPFkT76B1y5ykaRk0eAeVW1r4uo+b4fMDmTNTrM2+izp?=
 =?us-ascii?Q?YsaMjtcPMuE2UHvdMfHrzaXGKldb+w/WWYp5qVufBYQb9fbe2fW+UmmzMkOE?=
 =?us-ascii?Q?VQvsk++crjU5loWTaSzNMXrynl2CZV0nsFSmij3CPdwOa9B/hxqHPTxiRgNm?=
 =?us-ascii?Q?zL1AKbFWnrJve5cY5GhasXydHdtjVX2/bz4RJbatU6R7SLYOJakkeV7XsFrc?=
 =?us-ascii?Q?f6M84SrWY3h9s01HArrcWg4g6RfXeVhGCwcQBDXArwdFgBI29zax70FX2tON?=
 =?us-ascii?Q?59Et9W0cynG+N0ANtfiFRLBNBgwENUEu1LQNckymbZlb6dKW8xFYZYgFK+3K?=
 =?us-ascii?Q?SdEOwN7Y96tTkYzWkuk9vdGOO/DCjlztkfjOsWDktq4ZvDrufDooR/JDCFBE?=
 =?us-ascii?Q?oKKPbq2aSfP1pHpcVcyI0aYx+joPu1eNfSa9fgOEA0PNTzakpkJ3jNp1mUF3?=
 =?us-ascii?Q?lV7mweVo6EMGyoY+AWNysP1HBOKf8RcA5sHgYJTYORrd/7W06MUhhpNwN5+w?=
 =?us-ascii?Q?WW9ZLOoN47i9mpYGf9yZzdUhFVt6BVH5GP2tNMI/Y8TbcYZo8Te7Tsd3tMHn?=
 =?us-ascii?Q?bKfkk1XYxhZLqSBg7MmSfpEU8AeO8hbcEOTAGfsd+hjRcZF0x9uGvgUE2xvk?=
 =?us-ascii?Q?/NU1nfv7DEEQ6akNfRv5IUrKO+hFxzyX00twuH7V+kLsgxUNkfgeaXF+JpFg?=
 =?us-ascii?Q?p4P+llC9nIfaS5VZ6jE4366qPK/mOINq37ZsPwYbvjW+6ASRnAdbaaXREHal?=
 =?us-ascii?Q?rV0lwA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dec9647-bdd2-4981-18df-08d9c58321cd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:04.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QkoZzRx6DdWDWNvX4f7dLiXhTXfH8jXRxsypYj4iidYamVogRt2m5sf9FQ7XgUBX/JCwBrIsrRK8J0k+9q9azk50tf7r6GcaIrR7yH2ka4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Ngxk1yNnYF9377MhYATOOjkhNfI_EkJP
X-Proofpoint-GUID: Ngxk1yNnYF9377MhYATOOjkhNfI_EkJP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish cpr for vfio-pci MSI/MSI-X devices by preserving eventfd's and
vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 103 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index acac8a7..abef9b2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -49,17 +49,55 @@
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
+#define EVENT_FD_NAME(vdev, name)   \
+    g_strdup_printf("%s_%s", (vdev)->vbasedev.name, (name))
+
+static int save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
+                         EventNotifier *ev)
+{
+    int fd = event_notifier_get_fd(ev);
+
+    if (fd >= 0) {
+        g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+        int old_fd = cpr_find_fd(fdname, nr);
+        if (old_fd < 0) {
+            cpr_save_fd(fdname, nr, fd);
+        } else if (old_fd != fd) {
+            error_report("fd %s %d already saved with a different value %d",
+                         name, fd, old_fd);
+            return 1;
+        }
+    }
+    return 0;
+}
+
+static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+    int fd = cpr_find_fd(fdname, nr);
+    return fd;
+}
+
+static void delete_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+    cpr_delete_fd(fdname, nr);
+}
+
 /* Create new or reuse existing eventfd */
 static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
                               const char *name, int nr)
 {
-    int fd = -1;   /* placeholder until a subsequent patch */
     int ret = 0;
+    int fd = load_event_fd(vdev, name, nr);
 
     if (fd >= 0) {
         event_notifier_init_fd(e, fd);
     } else {
         ret = event_notifier_init(e, 0);
+        if (!ret) {
+            save_event_fd(vdev, name, nr, e);
+        }
     }
     return ret;
 }
@@ -67,6 +105,7 @@ static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
 static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
                                   const char *name, int nr)
 {
+    delete_event_fd(vdev, name, nr);
     event_notifier_cleanup(e);
 }
 
@@ -2736,6 +2775,11 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->err_notifier);
     qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
 
+    /* Do not alter irq_signaling during vfio_realize for cpr */
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_ERR_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -2801,6 +2845,12 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->req_notifier);
     qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
 
+    /* Do not alter irq_signaling during vfio_realize for cpr */
+    if (vdev->pdev.reused) {
+        vdev->req_enabled = true;
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_REQ_IRQ_INDEX, 0,
                            VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -3330,6 +3380,40 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
     }
 }
 
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = load_event_fd(vdev, "interrupt", i);
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
+        }
+
+        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    if (msix) {
+        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+    }
+}
+
 /*
  * The kernel may change non-emulated config bits.  Exclude them from the
  * changed-bits check in get_pci_config_device.
@@ -3352,9 +3436,24 @@ static int vfio_pci_post_load(void *opaque, int version_id)
 {
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
 
     vfio_merge_config(vdev);
 
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        assert(0);      /* completed in a subsequent patch */
+    }
+
     pdev->reused = false;
 
     return 0;
@@ -3374,6 +3473,8 @@ static const VMStateDescription vfio_pci_vmstate = {
     .post_load = vfio_pci_post_load,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
+        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


