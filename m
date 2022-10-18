Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C192602142
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 04:40:33 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okcWu-0003wd-A2
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 22:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okcUJ-0000hk-WF
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:37:52 -0400
Received: from mail-bn7nam10on2079.outbound.protection.outlook.com
 ([40.107.92.79]:27680 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okcTu-00017p-1L
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:37:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx5pMbclQUWnMhC6FAlMhR/1/9mLabW8/qK4djw/dC31fL5GX2SXg+MDladxdbWPMHD+nVRXG1sQWEqAULsGEPsUVGQ90C5eY0cyZNwtt2biR9pC0xYpepSly/iq/ADCsAuhEgYkw/RfI9pSkQzi5SySi/A9y2AcrlQn5Y3Lis8nkYwS4lL1MccRhUKv+IGDTv1zsgmfY1vZe4P3nOg5AKTDa0el5AEB8DuXzbMgOgeOj52yGHC/Ncux67G2n5y9kDpkufSZvP1bFoBX0sts8DtuSNT1OoPimBOL8BWh0yvj0zJ+Xq7HckWB6/w74X9L88Q7sE8o/oNK7Dm1baw3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE/D1wtwoZijIWJ1BaQPKHesR/MEw8OkJ6Ek0y27KvQ=;
 b=aE0NaQRg7X9JRuZkxTK7Qr01jDAlrntru+yvdNWYa2RJGoDdocJ2bLnBMxaD7nVPlUo0+ZwSbD9aBBbmIcd92HgJIMMveaAvsBdeHkZmdb9KsKemSEL9TtaLG6ZnP7hrPNzoT3INtK3WWtz5/HhtpHm5Pj6MDuMOSwJvE1z+7fx/i8Exh6XMPCFhWh+46uUCyVmZ/i32k4wRju4FzLSAhebMYPMhDB+bNxBhUyzc9SarSPOnJN8/p0hlN+zNO0vEv3FqQ4+b/NFbAKQNBAc1Ylq3DlU58dwG5a7h769uL6uwhlZ3sa72o2U8DhXc6Pbxs3GVz6H9KvF9FelkgbyaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE/D1wtwoZijIWJ1BaQPKHesR/MEw8OkJ6Ek0y27KvQ=;
 b=Ffsh9oA7wtvzC21W4Pvl3KK2WDf+dnTvdFqnxPJXjrQTonYxwhXiMdilwOmI8c+9PemMqxV9a96IIUuYOEBoOMluuPUTCGsPOluqha2Ou2+Y4QYyMzMpPUfB7jDOGfick1LgsyaNCVLixN52w4EOuggHn9x5DITJknmHe8HmEnwOx56D8ePaEk8qWzjha/5L+sMXMlgl1vyT/c1zqOTiR7W8GZe1gspWfC3CXKmt7iuoE4H949poAkgVGCw/5WSs6quoRa+hXTdOtrVyjrB/uq4D0YVvab290KvknDLxT2TJ7XFMcJHozLI4Kat3gu2LilsE/YZAXkYpPO9tJhigXw==
Received: from DS7PR05CA0065.namprd05.prod.outlook.com (2603:10b6:8:57::10) by
 DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20; Tue, 18 Oct 2022 02:37:21 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::fe) by DS7PR05CA0065.outlook.office365.com
 (2603:10b6:8:57::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Tue, 18 Oct 2022 02:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 02:37:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 17 Oct
 2022 19:37:13 -0700
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 19:37:11 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <alex.bennee@linaro.org>,
 <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] vhost-user: Fix out of order vring host notification handling
Date: Tue, 18 Oct 2022 10:36:51 +0800
Message-ID: <20221018023651.1359420-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: c90b9410-1444-4e47-1310-08dab0b1aee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQWQF2H4pSLzOrCDsk42gVsG+RaBH5O4QCsKtbTgMvkoN+iSsFG9FwJyoi3QMLfWEjpUnWnfAiEKVBThGoph5NjTtjhhr7tLCJJoK8ZMwFbXq7YrnuxZeoIkedCNUXJhGA7L1158ZpvsngbhV7/n4kGZ/U+F29BzfBJ5SLm2lqbuKRtuOJXQeOV36MfI7T/Z15w49DVdGN0nWrgaCZD/FR+utRCBW7sWRPFHBZlKCgH9LXHO2gaRs4D7nqq7E2KbgF8eqNoMsADNvQRcD6GNr287uEJN6Hdj3mrMY53mcTBs/I7gwrqBY5i4sRb8bfnKpSxTdtq0CDYz/UBuzvyL7wj90MmNV70io6zB78XVXAfnnKb6Ee2Zk07iPTOB5wyJWL4ZK9ooO+Kg+TEDxxDPvNaMZo4P6nNCPP707umTTRHYZzM8HanhT28UQTsuIIdAWk+eMLIcxkqgGhhpJeNB0VaolFm1rIqEm8LORcfyquXVYbSRv/jjc4whuIzEnjyoi39zBv0hAeO1IexBTNkUL/3DYyRCFuU3C4EXWqmeYwOfeFhZg3u2gZV8RH6N0vp77wvtVPulgdPm6/d0qj0RieCvod++QKYf9D6NVZnkMKVIntMYFW0jRYUdf3z5HaKcn2YsJv9I1qUweQWLFWVn7rSbi1uSigkQbGKAs9+zUjsCegZ7h5o7tpyA9PboKog6wh0jnE8wUaROwtN2ZSSShQoAkzhBuWoZjMX1Y0jWn/AJ8XRvcYmDEVpcShUmmYDMNP09Muf1M3eynVdALcW8hA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(36756003)(86362001)(7636003)(356005)(16526019)(2906002)(336012)(40460700003)(55016003)(40480700001)(7049001)(5660300002)(15650500001)(7696005)(1076003)(6286002)(2616005)(36860700001)(186003)(47076005)(426003)(6666004)(26005)(107886003)(83380400001)(478600001)(82310400005)(316002)(8936002)(110136005)(4326008)(70586007)(8676002)(70206006)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 02:37:21.4838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90b9410-1444-4e47-1310-08dab0b1aee9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256
Received-SPF: softfail client-ip=40.107.92.79; envelope-from=yajunw@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

vhost backend sends host notification for every VQ. If backend creates
VQs in parallel, the VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG may
arrive to QEMU in different order than incremental queue index order.

For example VQ 1's message arrive earlier than VQ 0's:
After alloc VhostUserHostNotifier for VQ 1. GPtrArray becomes

    [ nil, VQ1 pointer ]

After alloc VhostUserHostNotifier for VQ 0. GPtrArray becomes

    [ VQ0 pointer, nil, VQ1 pointer ]

This is wrong. fetch_notifier will return NULL for VQ 1 in
vhost_user_get_vring_base, causes host notifier miss removal(leak).

The fix is to remove current element from GPtrArray, make the right
position for element to insert.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 03415b6c95..d256ce589b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1543,6 +1543,11 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 
     n = g_ptr_array_index(u->notifiers, idx);
     if (!n) {
+        /*
+         * In case notification arrive out-of-order,
+         * make room for current index.
+         */
+        g_ptr_array_remove_index(u->notifiers, idx);
         n = g_new0(VhostUserHostNotifier, 1);
         n->idx = idx;
         g_ptr_array_insert(u->notifiers, idx, n);
-- 
2.27.0


