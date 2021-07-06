Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2403BDBF5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:08:23 +0200 (CEST)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oYY-000705-KT
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK1-0001gB-06
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJx-00085g-Bv
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:20 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gq4b2003050; Tue, 6 Jul 2021 16:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Mg9zaUq/68cV4jCumT5Jz/9HgCLRYSFt1ol8+CqmjyA=;
 b=uvKB4bexWP2a6UlpUrmhnR5j/BtE3gfhHQor+90ckSti4pxJdh3cj51SqQYSmqbzXJ5G
 Om0F3O3E9vmecie/m6ZKZHV4Ep4INe0MtJXg1yHqZn41KKJyTKgZmslpsBliOtf315Yq
 m4j7WxSayCWiQo73PIuG63ALbnAzEpbUTbZ1fzGjf/qoEmutvhgTWmpZE0qBIke23d2X
 7sl+MjM2AHoMOwIu+rGCij3HNaVT9G0H1WIxeOd8LY5tyWiGPeA7TbV3LWE2jAQrfFHQ
 RLwe40x8CsOxq/KQCKUANmpdFBHyJYoOeHJdWsW7qbXxIE60vaV4p3IEYR/yvA2p0NKk lA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mha8g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoUJD084680;
 Tue, 6 Jul 2021 16:53:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 39k1nvcqh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPOBHfgOHHBVMshDDmRPHArXJbSInc/wfY0uP4usyQZnBIZ+x3tJ/bO7FVhfu5JV+LBjAsoLIv5mCAMlFVG7oKFeSuuKypIYZ7GuHZVcVihmfYVBTbALVuUBXKfMZ5qIbb+9y9sfweHu9QE/XhglBfzyJnh9MnTeLNjwT+rUwrC++GXX43GNY5aq9l9uXEt4NjeFbBXeIF9FYTZiEkvSwVJg/WYrdo9+UjRhSum3ET9M+o4CbtvBCbmrEgi9M8jAUsWR5iTggYHIUZ6HPR6bJkPFKGnDnAOiFK6tlHITTSmUwkGLMDKfBOZqvNlxnOsfVumwUuNfbx+Omt4j5eu2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg9zaUq/68cV4jCumT5Jz/9HgCLRYSFt1ol8+CqmjyA=;
 b=dcZwb+p/fW/PnXN7GRuzpbT9qktZHs2350AvE/7W+havCMKq5B0y4Kj3mAT+rU7YliI3q8c6greWGBxir/LhYj96yJg/YMCE6bo0me4FLz0y91UhhfjLmSiFaBTgM/X2BSC0H8oPZsDY86KF8AYiKxadCcPyigwA6sHIDUGQkMw04k9cvVasGWYDy9gDHbhp30YMWkV5fx55I9xNz8dSIX5B25P5zpfPqtD6pm4hXhUbH8+li4G61cIpcSHhG4++euY1VG2WJqwHi14OkLYACJUKeiOVOCidY2hlr6e3vbmOiqju65XXoJfGSGZswyBRK+Fn32L3PzgSX5X5UXQZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg9zaUq/68cV4jCumT5Jz/9HgCLRYSFt1ol8+CqmjyA=;
 b=BEEhc7AhVVBpTmG7po7ruppt6bFU/dksul41SoTgVX0IwQ+FL6AlW3kFw7eFByIji3R1hqDKmZRNKrPLgPQzH/6dDnkkxgkzxEMPN7Bjb1hVDwb3KRPtSGKMu70Ssr5Fy6ERVvFK/REe65xeV/4OjMoWrFt930eNNd0dnB7D4DM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:09 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 18/25] vhost: reset vhost devices upon cprsave
Date: Tue,  6 Jul 2021 09:45:49 -0700
Message-Id: <1625589956-81651-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 065ecd09-0f2e-4ecb-d8c3-08d9409e88b6
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805A618B3C720CD40FDFEE4F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrmCo8h6Pou8oAZv8nZjnf8GkXNn9CHQ9voq80ZwPyCBJJmzw8rT7OaQrcDW1T8xMi3LG7vrSYhgSeOyronbChvZpX8WOhKw8wfwD4lS3mBf46nmCZgtmICRd2aBxYjnTRFldVGMWfOzPlnwMV9bhTJVA5z+KKqmKPHWjkLxGY5gbXtEwVdACVGGJArqopX3pxdYB+2DzYgtIcmiNvUxVeK26pQK2fZ37+CyiKyTIWdv9r4Hvxkqr6nUeAnWV8F0PG14zsKkr8W9E6ZziZO2hXZC57ItY/f1iS6RQP+LB4uNEUgA8Z9lEMhBu+BUa5UvYWb8sBVFsT5GZKpS4cvYIB+c2ITJcAD3ZnMzk9HH62YFs6UcLvVMQj298OXcA16i/Tuv2X4q4i10zUEIWkmQZcNT8UEimaPm7Mr7MOHjK003ncNboVOVzMpilb6E9s2dnJkBYfuhZtpv0yXEjJjlQRz9PLqhE2E2DvEp6p7pu6Xdap0848Of9DM4sHrL72ikby5BaBlx8qFq2x8c5Ttztk7JGC0JfZUIaEaHFRgbu1pPK1FyqLPrJBqCE6ZbgfdXs95QS26EpQgdIMOVu4bC+L2dTl0FnIBBgNEedbN/oCaPQ+YmOjASpSxeRDiuWgwoJpHukqwhBU55DEXHR6HDULigi1xdC5+NOIYdhnHNIikssDPScM49HdPjufeh6f0Pos/sYNFLyJVYvmYfrtuwwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6023hENl6AOrXoJUATmKTB6899OuQHM6aA8nMAT4un0ILHA0hynWDRTQtJeX?=
 =?us-ascii?Q?kReox/GgGN1Qz14w/VG9xPRQUxfpOqskCtc2UCnuZ/OVa1VHHZbWO6dgNW2l?=
 =?us-ascii?Q?y2drH2osrhXXBnle3NazYGZuNtAHKpJqEMwZbBkNZLPxcKwoXZhv2nPeUIFt?=
 =?us-ascii?Q?DOD3yT08plRu/r4Em236TD60U38rrmreNFNh0ukHwr9zFeSpbMFUiInwLrfy?=
 =?us-ascii?Q?RerOBqc6PLeP9khYBKdKALACwNl4FYPojFIeNvVIIBf9fpvAwGbVQp0MLbYg?=
 =?us-ascii?Q?UlY1EOpgaDsaemdDvgcYvpa8TRjA4WV2WSwV7DbFVa1UP8krEDk27tg/kMDa?=
 =?us-ascii?Q?pA2Yza+69gZFnH0LoMzeWXy48RFKixAsLUf/tdDl01+dPqMDroe946cthhTQ?=
 =?us-ascii?Q?M2HLYxm3hIiOfq5H3P/xtu4czTjjM1lqdfxInoJqpDFv6ZsgBUuV2lIIijpi?=
 =?us-ascii?Q?uaPQ1O3ESPAEbHHa6l9Pc8etvvjuoCRyind4apgOVjfrisxPeSS7fk/sAMta?=
 =?us-ascii?Q?KacQ0eyTo45tOGXpXuvrfnWIu1pOgOfB3s2ujIRquRJZvaPvczm5RKpY2ZL3?=
 =?us-ascii?Q?WQWIQMSJy9JOaimBeLttVIoIq3aOpTFSEfHMF8YSMkkgVf3RVa6U8M66Pv41?=
 =?us-ascii?Q?DsSPvy6Q3eO2o4TiJU21SqQINYyP+tqs6EQUstgISbytDAKN+ANQjP17/jC8?=
 =?us-ascii?Q?R0aUTvlz9aWaNfP1uUwOJtxpTMW7YqOP3XRL66phd+OBEeKonqBG9oDF0gjP?=
 =?us-ascii?Q?h3gF7q01hwsxOmF2kZ6EYSenYHi8IDb+A2qkURafIbXTkAX2XJboZCBjyV8I?=
 =?us-ascii?Q?VYw9zBUwMZTwaS27+Wl+6iI/IurQptoK5txmwnONV5U46ZPPkZ/ctfHklnx+?=
 =?us-ascii?Q?2Wx6udqnBEs8MrkeXNvXbDkcVnQpztWCOGB7okpqLMwB0VeH4Gw7OvdEWUEF?=
 =?us-ascii?Q?OJ8iqiqCmqrTHTDGLAM2tjfdWXlR61jdnMx6VduKqQxgY3MlLhm0aXQJr0Nw?=
 =?us-ascii?Q?rZWNcO0tp/y3876JHJgGajOKxbifoxdZ5ppAElKWI6yu7/mJ6ExHMOx0JUku?=
 =?us-ascii?Q?GEQPrt2mhZxub+BSfKhiRk6wPj0LBUPM9crAbv+c5owYeBaY/NM7/ieZBNQX?=
 =?us-ascii?Q?OsHxmve5H0ZqzQs3dq3iEc2ZGOazsB2q4ZRPzGE4jmGGeV6vur6nK1LhmFjQ?=
 =?us-ascii?Q?RfIkkk4AueQzxypveOrJdMoMj2P8htju2Kl4lZzy2sHBac44+eLaSoLF0TAM?=
 =?us-ascii?Q?4MNVnQA1ZWX0SW/t6JJqDcK89wvmBvmdLCsDYMbDrVae+nX0IQlIkWHnCtHh?=
 =?us-ascii?Q?DEVmGhH+/iaz+PAH/frRY0ym?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065ecd09-0f2e-4ecb-d8c3-08d9409e88b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:09.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRHFAURRg4nYt2NlzrSajrM0quQK/VxC4hlHfIgqp334Ld1/Em1j47kSXvHu/grQzEZ97/QceHSXADsgqgfglrD6S3ohC+49HujKVwc0/2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: 3iLyNYLZUvZzqLB22ep3JQJS6WSpLaK0
X-Proofpoint-ORIG-GUID: 3iLyNYLZUvZzqLB22ep3JQJS6WSpLaK0
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A vhost device is implicitly preserved across re-exec because its fd is not
closed, and the value of the fd is specified on the command line for the
new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
which fails because the device already has an owner.  To fix, reset the
owner prior to exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/virtio/vhost.c         | 11 +++++++++++
 include/hw/virtio/vhost.h |  1 +
 migration/cpr.c           |  1 +
 3 files changed, 13 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e2163a0..8c0c9c3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1820,6 +1820,17 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     hdev->vdev = NULL;
 }
 
+void vhost_dev_reset_all(void)
+{
+    struct vhost_dev *dev;
+
+    QLIST_FOREACH(dev, &vhost_devices, entry) {
+        if (dev->vhost_ops->vhost_reset_device(dev) < 0) {
+            VHOST_OPS_DEBUG("vhost_reset_device failed");
+        }
+    }
+}
+
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file)
 {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75..71704d4 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -106,6 +106,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+void vhost_dev_reset_all(void);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
diff --git a/migration/cpr.c b/migration/cpr.c
index 578466c..6333988 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -142,6 +142,7 @@ void cprexec(strList *args, Error **errp)
         return;
     }
     walkenv(FD_PREFIX, preserve_fd, 0);
+    vhost_dev_reset_all();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


