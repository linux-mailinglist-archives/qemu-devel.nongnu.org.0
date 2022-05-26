Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6553498B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 05:55:29 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu4au-0000py-FB
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 23:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1nu4Zr-00008Y-5K
 for qemu-devel@nongnu.org; Wed, 25 May 2022 23:54:23 -0400
Received: from mail-bn8nam12on2067.outbound.protection.outlook.com
 ([40.107.237.67]:55905 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1nu4Zn-0004T5-H5
 for qemu-devel@nongnu.org; Wed, 25 May 2022 23:54:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOmC5dQMVsmMDGe6mVYGnJjG9Zw9UlZFij9+8YQ+BHyolsPOARaY4BwqRsCKtZ9d/J7Dg0hU5gVgmB8ThIw4w9oaG5qAlMmYNrcXREFhJo47ObQkYak7kLNCHH0DSSGzRl9uJRKl60ZEfjsT5QyKHSeE+PrYwgWW1iYlYqF5VzLXseRFenxbM/0wozroXjhH7/tPs56febDpM0yjK6gdYDv3GVmQX0J4eLliLWooGnUUGIcmX81kgMEHCgphoFzksQxfgCPdrwgWNp9uFhBTPe8BwjRC92WZnWfVI/5/MOmV1wBj9dxzA38ec/j4Ws3xU63Zpde9OsynglqbyZnBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XbbLkDdbJveCQci06lVDo4aLRlqBdxXBJs3ZKIGAIU=;
 b=LwwOb0OakoMjkHqPFzSOtVmqz6aEKOQFIatIYQS5cUTTM6UcBNxT1TceXPcv6wkX6mUhQPZ7claRH/iNRt3WyVSTeW6VLUpO8iBy2xSaAYCnOAM6rSioa4f4Kqt9SXp8NtL+xgjiWj7a5FPgQFiu6T6zudvbt9sZZ6kY0U5ZgZ6c8W/I09xH1x0somU4ZWpQYwjDbedcRhup8lj+z7YT0yjNN3N970zFsLYtg+a/8HGyRYTOU8S1mchEB9Oh0eETGLCLb/DN55EgIuMBcqj5Ts+rUJPu5A/pJ5g6jho3/ZZjAvKK6NkhwGmW8e6r3/ZnZ1rwbN+zTWMTYesIP8e0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XbbLkDdbJveCQci06lVDo4aLRlqBdxXBJs3ZKIGAIU=;
 b=ja06BOiKVxlBYCz9/PcOeCMXF4Vop4vY6+xaD9MCqH9nJmOe3axQjCxgHwJ6DITEhWmc9wEgB4Zu5lHEYPjWl9jJMuEshc1KqgCHNFqmOZYB72rOCI+37KfW8vYK/TwLXF6ia1fvR2CAMtHN83vV7twYqDki/Jj8frNx4Q34wxDsm99adgIrCmAz9jMq+734yksu56H826BpPrxkSJYYQSglGaVvftccVKgSvywdszg+99j2+9kwQvC1m/bVG/YRvbMygqpC2hCB/60W8n4r/stmYD1QovYkkM6HRIZYm1wG+qKxy8dA74Mny25kpRPvaS6cfEmH1Kqr1Sn/6YtESw==
Received: from BN6PR16CA0031.namprd16.prod.outlook.com (2603:10b6:405:14::17)
 by SJ0PR12MB5633.namprd12.prod.outlook.com (2603:10b6:a03:428::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 26 May
 2022 03:49:12 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::96) by BN6PR16CA0031.outlook.office365.com
 (2603:10b6:405:14::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 03:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 03:49:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 26 May 2022 03:49:09 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 25 May
 2022 20:49:06 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <alex.bennee@linaro.org>,
 <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray size
Date: Thu, 26 May 2022 06:48:51 +0300
Message-ID: <20220526034851.683258-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc6f7d4-d4f9-4082-3c92-08da3ecab234
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5633:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5633BDD06CFCD2AEAB04F05EB6D99@SJ0PR12MB5633.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SY8sx4xJxpra1KdODwANgDmBdS5+eN+0R3tx2W7/GsSXDNGQ1MaFy+Ks3wtYQExO1wfl5qRkof7eja8LVd6v8xJ2/eKS+MQWr1WdcBHy6k8Yk9QdunEOUqlizW+HHCbqrhzKUja9So+v2TSxQvF7vYH/PKlFEGYdByLjdhOFTHCKN29tGvFWo6hit0pfaF+xgPp9YaRt9ZbprqlRzHP6Fgu6J56TJk11aN01b20GZyAQvahvVWcESpHkyNJqOLI1G9rG5v1bq0HRtPisrZmN2GPXCiQmN9k4svof0FQJCLexLgIFXrVIJuqt80yQ2hnXOCSL8I+zPoORjbxxg7JarCnQzXZ4IojmVIE2h80CqwJ2pdJUfDpJuleKrxMwdaZGxUkrw9YcRIHIccx4yJDECE1kcmAG2tl3z12dQI10/GueNM0TDgaZeI3q1HFZdAdzunv3P803P/dKsjsuOODayduBxAHDoo/3S+Ffh/UrbbVpTpTpEFwG38ZTj0TXUacAbXqUOIs+SDxwkz4gwbB/hEmjILN7NizfMy+Sd19oddgGGBjpZDfDmjxmM19c/mxiE9XmA57FzuqnfQEBLy0MA7e0PU77e3KjyhJf0t6wIdyNQMYnoXMrTtW9jyfrS0qyrIl+uoT2gDSDo6FobtmKLqsup/ARQxeQka2dRg2VwXYM/TMgq32Gmz+w0iBeBG4ArKUY/NECyykPFoC/VcV14g==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(1076003)(36756003)(83380400001)(16526019)(186003)(336012)(508600001)(81166007)(426003)(107886003)(6286002)(82310400005)(5660300002)(110136005)(70206006)(8936002)(2906002)(86362001)(8676002)(6666004)(4326008)(36860700001)(7049001)(47076005)(7696005)(26005)(316002)(356005)(55016003)(40460700003)(70586007)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 03:49:11.8711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc6f7d4-d4f9-4082-3c92-08da3ecab234
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5633
Received-SPF: softfail client-ip=40.107.237.67; envelope-from=yajunw@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

In fetch_or_create_notifier, idx begins with 0. So the GPtrArray size
should be idx + 1 and g_ptr_array_set_size should be called with idx + 1.

This wrong GPtrArray size causes fetch_or_create_notifier return an invalid
address. Passing this invalid pointer to vhost_user_host_notifier_remove
causes assert fail:

    qemu/include/qemu/int128.h:27: int128_get64: Assertion `r == a' failed.
	shutting down, reason=crashed

Backends like dpdk-vdpa which sends out vhost notifier requests almost always
hit qemu crash.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
Change-Id: I87e0f7591ca9a59d210879b260704a2d9e9d6bcd
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b040c1ad2b..dbc690d16c 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1525,7 +1525,7 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 {
     VhostUserHostNotifier *n = NULL;
     if (idx >= u->notifiers->len) {
-        g_ptr_array_set_size(u->notifiers, idx);
+        g_ptr_array_set_size(u->notifiers, idx + 1);
     }
 
     n = g_ptr_array_index(u->notifiers, idx);
-- 
2.36.0


