Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790D55F35D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:29:23 +0200 (CEST)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NSD-0008U7-D7
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NP5-0006eT-Du
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:26:07 -0400
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com
 ([40.107.223.87]:5664 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NP3-0005pE-CJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:26:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+wtipNCHdad18y2Jg7g4EVqJVt1urLli1sk3xLxbN1okdErKtOcqDV/meF5uQZ+xp245oux6CD9umGGtlI6LmBaApiHdkhxPq4MLkOidGbIZCQ2K4yFw0JSHrQvJ4tZss9wwKrlQ27/ALjuBO4L3JFs1T/juDBULruUWne3uF6EyVofDwiMqmxFfD+SCv1rN/uVJnA7E57Ra4+0ofYtU39v5H2w7WMbSPxYdSLMStH05bcXcBPE60xz+6svOweJ6n5PfcvIRDsjszDZUKmyAxc1Kz7wYpB8wSkzUQGKOpIM46IM+BULcfzCMgn3Y2vBi3SktwsPtxJM5h2zGnpwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak/Cesvh+xlf2SSUoi8nnmZP9hg2EG0SxLtXc+nNBrQ=;
 b=UV0IRiHEIbeh08iZjpw0hC652bJtcE/Oewe48oUYrwc/gr5uRmGhcxxjVdMosCofTUJm/MluAwdu/2+wRycGbbWf47G+mHHvB8NpzrhRk+oxhDVywXyJoSWJP4tWyyoj4/pVqQfLapaXh+jGZdsv2C8YxEIwaRyMDtPZXyq4bWychQuJOwcFFpTh4+GrlQ6kYyS0Zx/Ur8s9VSzWrM4pQlQTxuY0iMFA7ZlIE5/b2qBYplYQZF8ogLy41r5XCQFS4kzNC3NkXuWJfExe0KYIP8QVbI9+qh1PGOKevwhYA9zvjAprqZETSfq2Obhis5uEY/ldfOplHssApDayVr0r9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak/Cesvh+xlf2SSUoi8nnmZP9hg2EG0SxLtXc+nNBrQ=;
 b=PfcZnptv+mhUA5a6t3V1xh8e4qpf32DHYhtYlwsryEs+khEWB+BPqK5MT4L3ItZm3iWMkp4KsYjTLGopaAy4CCIxG2cMkbDdPaAxYdlgXXh+Jr8AtS/H4OrbfNUdyjVUTx0eSH/nA6DEo3W7sVytqBjZ/SXIpSK42Lp9+yiErUWQ+yeORl9h3pfgb2tp4zKyhXoZI9Mf/8be2k8cURGxsQzN70uQL/0oWRDmfQNL1EIN2m9AGh67tSOgIgIuEZzciQbtxR4uCI7LxCLy6FLLEbuuXuNpxYBEdupTZIo2tBfN6cLb/MRzhJaPVzKGOJA8+exPyWv54Hym6WVnLPKgUg==
Received: from BN0PR04CA0004.namprd04.prod.outlook.com (2603:10b6:408:ee::9)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 02:26:02 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::82) by BN0PR04CA0004.outlook.office365.com
 (2603:10b6:408:ee::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 02:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 02:26:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 29 Jun 2022 02:25:58 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 28 Jun
 2022 19:25:56 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <alex.bennee@linaro.org>,
 <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH 2/2] vhost-user: Support vhost_dev_start
Date: Wed, 29 Jun 2022 05:25:17 +0300
Message-ID: <20220629022517.2600911-3-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220629022517.2600911-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae8613a-d9b0-4db8-7a96-08da5976b5a8
X-MS-TrafficTypeDiagnostic: MW3PR12MB4345:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWQoahNG+lWPGwDh9tX5p2NxKS05jIf27YOn6kOOowUamFwfmoMnx2CbezcDKaaLxotTDhznBWc3rQTGlsXS5WuTlXEmt3pqbCJNahO8YEM2wiUJTREZ2Ewa00/c/bkrMgu9OACon6KBCvfElWG7k/u+cqZbbzTWJLYRAHXNmdM7Zj6ygZ3CG1Jcdbc7FHVZ+OyCMFTRNmGywG1Zpgedkp5GJ5nYu0oOgvsPmlMsY1eR+s3tvI5CugXeqAdwg2Oqkt7iev+B1brY9PWyqWnsUpdBn3rwo6KnMecprmajU+gclbHtok4SQZ71RWbyRh5G1U8jxEhKWcFWft0ibl3prCcMpoGtJ0GStVCG46EK2VDS0UbRowHO8izZNe3Ru/qGairGeofvF+h+KBQZsMX5PQQMeZRP8S0/r1Q5K8qeAXYKxelLZyofO/A/cGNtbGa3INKlFwm6Aa7X2vsQtQQPsS6FuvCxSevtWORQhYbHIZlK8jwX8nCIoUSys1X/JSL3728nOGiEHZnnRfI4YA8EUYwyBF4roA9nY7OCGkmxNB1TNpAp6RNDVppD0nVwgqFK6jKoPSQ/6Yxe67oDE7iwmPQOzN4Gnyu1fmpLPTPClLwSB25DF37DS2UfNdjLFEfzO0I4xAnhWDQanpmVbW9GLG18CShQiNFkJTMjFtKK5aNFakzTivw5owsIi6Wd62e1Poix0FURKjrwJV2Gab+/8eDg6fWoouwwjDhZ1wvSChLY32e0lzz81Lpdor3fKjupCp103oksb5M0j/EBYHLxELqPRUTwTmRf27xR1v/liI5ZYxPS9va/yLlvO1iCCHHoRemwd1WWABvdP/D2DO1s9A==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(70206006)(2906002)(8676002)(16526019)(26005)(82310400005)(41300700001)(6286002)(47076005)(70586007)(336012)(83380400001)(966005)(5660300002)(8936002)(107886003)(2616005)(6666004)(426003)(478600001)(186003)(7696005)(86362001)(7049001)(40480700001)(1076003)(55016003)(316002)(40460700003)(36756003)(36860700001)(81166007)(110136005)(82740400003)(356005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 02:26:01.3358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae8613a-d9b0-4db8-7a96-08da5976b5a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
Received-SPF: softfail client-ip=40.107.223.87; envelope-from=yajunw@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/virtio/vhost-user.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 4b9be26e84..9f75c51dc2 100644
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
 
@@ -1446,6 +1449,39 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
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
+    s |= status;
+
+    return vhost_user_set_status(dev, s);
+}
+
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
@@ -2602,6 +2638,27 @@ void vhost_user_cleanup(VhostUserState *user)
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
@@ -2635,4 +2692,5 @@ const VhostOps user_ops = {
         .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
         .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
         .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
+        .vhost_dev_start = vhost_user_dev_start,
 };
-- 
2.27.0


