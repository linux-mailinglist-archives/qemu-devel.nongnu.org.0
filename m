Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE7600732
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:01:49 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK8B-0003SS-Ra
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJsc-0003dO-97
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:45:58 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com
 ([40.107.223.41]:42560 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJsZ-0003Wd-MD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:45:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzWYSKZi2DX/u/5MXSRyan3rxYsrI8Dg39Nl/unzeV2UjwEY2cmBgnOc5Hg8UNb9OJ4AhWRNdBalkHKKbsbDU/1dLrOXi6g6mnIFXyj5OdcvbhJ4wC1za54BdhxcnZHqznGps/kesmk7EmyoOPs1n3gV7Z9WFcx06lAYNFqGyCuIIORU33a08MyxBvB5mc6pMqPMLsB/Svt5vTQEuofKdoB8PANck+mFxtaUc0/dELbrxXtN3/9QA+lRFo6wqUykg4JwM4swEpwbzc4nnsnS0MAYRkL8GDh6celaxVN9cFfZdfAW1QS5d5Wb5OD93o5obKqttDV1qQmEDG3pjKzEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpOYEJpKQK9ijfjqnUAxvkZTuvtnmdix9wqdO6A93wM=;
 b=P4fPFIZ0LEp5p7nBcsdrm7f/qfDtq5KfUeVHyZwcXanpWy4vmq+z+iQxVqRHQ3mKSjz+h/9pRqpC6LhfbgGRTNSaYxzkvmhgFHwZ1TAOrJ47JSj1S6foksUNkv28IOK6x8JgBeL50/kHeH1AC81IE8HeLmKSi1cXdPB+awWUOqToXsDNN0L08FeG4xSXpEBL1Bxl/fM5TD8UA8LMPfeZR5OH7H93onnIVIQBX4h+VYfFXEqK0R2NSpMWAMmL672H8x9TgxtocU6R8mkv4bonbLkOa1uL1viL6jtEKhu/8miC9S5hJvlE4vdsfDhwugvPfm0tdFF35AJ/hpI4t0lwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpOYEJpKQK9ijfjqnUAxvkZTuvtnmdix9wqdO6A93wM=;
 b=tIVmxISdRtWsDEFkjUN5n7ZT26kbcODVh/09mWBZ5loMFCaE4GOufhTUkzFTrO822s8G85xhOtZ0liNZVN9Xoaw5ccl+Ae8duA9qew/odqAVelaZt+tvhvAo1IoyQy8gq3BDJU6P4hYovpg+5xq8sp9mMWx844mIqbDda1Ma4fPtdlMoEQsrds8v2IVvDzQn8vFsvf5NAel5HoaCvxXPmzhiQzRRhpq3+dPmyHFt/moTHEVKeh9A9DwLKPHznWfAlsW1qgktKLOoDzwP343iK6DX6bhxpOdBwX3WR4h6eklBv1QCe+s9uK3zIsiXhtlvhUqDESVbp6Eqe0xN8j1rTw==
Received: from BN8PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:94::30)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 06:45:37 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::78) by BN8PR03CA0017.outlook.office365.com
 (2603:10b6:408:94::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 06:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 06:45:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 16 Oct
 2022 23:45:23 -0700
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 16 Oct
 2022 23:45:22 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v3 2/2] vhost-user: Support vhost_dev_start
Date: Mon, 17 Oct 2022 14:44:52 +0800
Message-ID: <20221017064452.1226514-3-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221017064452.1226514-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221017064452.1226514-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT039:EE_|DM4PR12MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 888015b5-442a-4aa3-1000-08dab00b32ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUxtZkIoF3882o0JGdQNokFr+aH+WIzKNfPczh54vdWQsirhITQOD8WnpFfvOD62YLN83OPenYOgnGooBFvEbDcK/qrR6JXjCO37MyYNcqDH4O7wbifJn69WwYcXp0CJzfUlsdyUIpAZKE8uqkWnNAbMslB+41vx79fVG1ibxRebLt2goqKy2mAl0ayVbYLb+N06C0E+eZHUaRXl0hd1TRUIFM8aq2612jDETdX3XVHXJd585jnrgFUf11+qaaVjGp+gYzNEvrts426+RW+r1VuC2JlogCjsNEhhxQ1UE2MWEwHmv3M1dq28k3xJLX2nAkLf8tYctdu6Xggmg5om61ZC0ZdaFmLEPhyZkF8Fc1a/lUpchRBxRSEE3jPet20StyeN44j8fO1Frlc5/l0+JlE32fH1kKOqULijf6Z7P7GT3PonaciqLDfT0n6vNewhsxH+3+i8WxzPp6k60lhjHYL4Hc523whEsHyegEHiB/1gAqv6dEaz3LFJvRPUQzgZS8LdUczfbD4eA4pJ0Ytdjds5Rus5nsVYkUGy3eTDYjJivO2A65TsjIlZgtPoJKRFjxgQn3lBldMahKJboix0LFQhvDaVX84jdsoywl4SK8hVly51HGiY7Tf6+QjgZvheQfHCL8CCza5aFIRk/fjEHLhnTMyF20cyjMYjg45x8MdgBuUNeFSh3SMjOfajrjykq/SoBaRnHpzwLtkPfvC9kFfWs1WV7n8//Basgt1mNNLSK8zWJaUit5Q7MrQ2cJ0RNLQW1exkzAIgHhCJAa046A==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(2906002)(5660300002)(82740400003)(336012)(2616005)(16526019)(1076003)(186003)(47076005)(426003)(7636003)(356005)(83380400001)(26005)(7696005)(316002)(966005)(478600001)(6286002)(6636002)(70206006)(70586007)(82310400005)(36860700001)(40480700001)(55016003)(8936002)(41300700001)(110136005)(6666004)(40460700003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 06:45:36.7391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 888015b5-442a-4aa3-1000-08dab00b32ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
Received-SPF: softfail client-ip=40.107.223.41; envelope-from=yajunw@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The motivation of adding vhost-user vhost_dev_start support is to
improve backend configuration speed and reduce live migration VM
downtime.

Today VQ configuration is issued one by one. For virtio net with
multi-queue support, backend needs to update RSS (Receive side
scaling) on every rx queue enable. Updating RSS is time-consuming
(typical time like 7ms).

Implement already defined vhost status and message in the vhost
specification [1].
(a) VHOST_USER_PROTOCOL_F_STATUS
(b) VHOST_USER_SET_STATUS
(c) VHOST_USER_GET_STATUS

Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
device start and reset(0) for device stop.

On reception of the DRIVER_OK message, backend can apply the needed setting
only once (instead of incremental) and also utilize parallelism on enabling
queues.

This improves QEMU's live migration downtime with vhost user backend
implementation by great margin, specially for the large number of VQs of 64
from 800 msec to 250 msec.

[1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
---
 hw/virtio/vhost-user.c | 74 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 03415b6c95..bb5164b753 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -81,6 +81,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_STATUS = 16,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -126,6 +127,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_STATUS = 39,
+    VHOST_USER_GET_STATUS = 40,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -1452,6 +1455,43 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
     return 0;
 }
 
+static int vhost_user_set_status(struct vhost_dev *dev, uint8_t status)
+{
+    return vhost_user_set_u64(dev, VHOST_USER_SET_STATUS, status, false);
+}
+
+static int vhost_user_get_status(struct vhost_dev *dev, uint8_t *status)
+{
+    uint64_t value;
+    int ret;
+
+    ret = vhost_user_get_u64(dev, VHOST_USER_GET_STATUS, &value);
+    if (ret < 0) {
+        return ret;
+    }
+    *status = value;
+
+    return 0;
+}
+
+static int vhost_user_add_status(struct vhost_dev *dev, uint8_t status)
+{
+    uint8_t s;
+    int ret;
+
+    ret = vhost_user_get_status(dev, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if ((s & status) == status) {
+        return 0;
+    }
+    s |= status;
+
+    return vhost_user_set_status(dev, s);
+}
+
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
@@ -1460,6 +1500,7 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      * backend is actually logging changes
      */
     bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
+    int ret;
 
     /*
      * We need to include any extra backend only feature bits that
@@ -1467,9 +1508,18 @@ static int vhost_user_set_features(struct vhost_dev *dev,
      * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
      * features.
      */
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
+    ret = vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
                               features | dev->backend_features,
                               log_enabled);
+
+    if (virtio_has_feature(dev->protocol_features,
+                           VHOST_USER_PROTOCOL_F_STATUS)) {
+        if (!ret) {
+            return vhost_user_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
+        }
+    }
+
+    return ret;
 }
 
 static int vhost_user_set_protocol_features(struct vhost_dev *dev,
@@ -2615,6 +2665,27 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
+{
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_STATUS)) {
+        return 0;
+    }
+
+    /* Set device status only for last queue pair */
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return 0;
+    }
+
+    if (started) {
+        return vhost_user_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                                          VIRTIO_CONFIG_S_DRIVER |
+                                          VIRTIO_CONFIG_S_DRIVER_OK);
+    } else {
+        return vhost_user_set_status(dev, 0);
+    }
+}
+
 const VhostOps user_ops = {
         .backend_type = VHOST_BACKEND_TYPE_USER,
         .vhost_backend_init = vhost_user_backend_init,
@@ -2649,4 +2720,5 @@ const VhostOps user_ops = {
         .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
+        .vhost_dev_start = vhost_user_dev_start,
 };
-- 
2.27.0


