Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB27538701
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:04:30 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjkj-0002EH-8k
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisS-0004wI-Vl
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:25 -0400
Received: from mail-mw2nam12on20625.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::625]:48705
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvisQ-0008NW-QN
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:08:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZsd2uUZIckUGe1kXxzsIR38hntlhHto05qtRPAp6duYpwk+J+n2GniC1uifXpQmArhkY4WmibVV4XhEY0/+SASgCk82FPcCgYKQNCq5gH7dlmli3a8tw3OC5JfQtpOJKbno8enW1KSyDXLVudV9b8mS7THtOkSmwpF+2ykZQwMG+uNfiK5IFNb+Ag0ln7Jksrw9STeM/s8lskRsvAfvUhN0GBdnk0nCVZJsRFFHjeEFK3GL4YxS2Ttlka9a+HeRTaFBxHO3vKy5p3zXhhNFxgU0uZXotTiFPbMxL1tx0+QPy9BNvC5DArGUrFGd15bjGo8G4VrHYgswZeNOnlXKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liYUGVmuX0kZmO+aQDDBrQ7rfJPkkF+ldMbOwennimQ=;
 b=CfrBcTi2qdBQgKU85kN1dNiEk/DPgzy24gvV/4TGyvOJnRB584dEqLGphL/CjyGB+mFibELDbm3O1keAlj1EpV7Uj9Nf2tNs3E05theLXJgVvdhV2fUEcRpDS70EE1IZEzLYfpi0rgsL3JgSIXeAJbBP2b/CJ1t1i2O7kY+/v9NO87EDQRKL7WwQPgvB194hrlMHvn+LCiPH9WWQ374zc7yQMr95fXrQZRMyT5dKvaGIHKyVwuEiDZrbeTcZivJ4pdxNng4PNhjOIxvdEVw4pp+3FzvbtUBuD33krKnuPMLSwrCGyO9bW1aGnuVzIUvMvMRn/ACOm5AY3atWNnfWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liYUGVmuX0kZmO+aQDDBrQ7rfJPkkF+ldMbOwennimQ=;
 b=DRmACLktMqyd6b58g9loM1Zh04F/lWdPv65BvJHvY/PvCrCyi+RQwSP3L9Zcmx/Aywmw0bT+afPd5AI+7yz+Ile8LZaND/lhPzsVkUh60jfxA3ltUmqthBN0A6XmQTa7VY4cteocL2JMa3XEIyyECGBRQIvqeVIX/UVjhF9J5Y513msYdbkWJqTyU5oCy9Df73tB+Uh2e+t+CYR/qWy6SVIXbXxZ3yPsF38KdOcjqZlhB9o88KXMvsLdjucQmVh+v2PZvpyxpawqPs6KYwKbSujLphg4yzwekx1dK9RSJyhcifFa3/WSm2noR2lwAzKXSX9be+7AcjNYUmwg7CS1iQ==
Received: from CO2PR04CA0178.namprd04.prod.outlook.com (2603:10b6:104:4::32)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 17:08:19 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::b6) by CO2PR04CA0178.outlook.office365.com
 (2603:10b6:104:4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:08:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:08:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:08:18 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:08:15 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 10/11] vfio: Alphabetize migration section of VFIO
 trace-events file
Date: Mon, 30 May 2022 20:07:38 +0300
Message-ID: <20220530170739.19072-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82af9299-0d8b-438a-017a-08da425efeae
X-MS-TrafficTypeDiagnostic: IA1PR12MB6307:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB63078533B8118FE503565148DEDD9@IA1PR12MB6307.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVYozSL64rFJXRj4TB81gQhLBNsuoLgUXUuVxRXF+MAtnMkOn+kxICHsRditEjuEQkAW0v9T0E7Ar9enlBM91MTSvKwcgdPyrzCEzckEB1qE3sMZ5qpvsB+2WO2p0G3WSosbk5Bq7cNdV/G2998kuH7LRS95bp+pmdB+ZUUl7Zd5myhqQIi0qE8SBBUKewqTtRaipDPNX/3wbT+Jsteo2Fj/rD3Vu+XV26bJIpFSiqFocpPqMehToN8nGPBuGIGx8DzMQJ2MuApjoVEN9jplcADmZE2nmnu1PEDAFZd4YAaJFGQ7TiR3sKyVtP1G36+Omlsyqh+H0si+Cha1t63Fz95oj32FSHlhUpGz3FCmfWEbCGK9g6my9ZVGrPgwAV9XtYNpwxx65wCMFeyM6hgopFb638nHzDvG3TP+lykzE8G7xqWNwwO06ql1VIVpmKJQBWciwJ4HhqHD3GzIBZiAQy03e8ReAB7eqAoRxdRgcScFM1pcHCPknXLfvU/ndMiSDfNVwfFBqWyhW4luCjNEgLrSNti3sKYl57HeIv28sZV/DXsWNNOthdakRzrhRzyEKOPAKfC9BE9YxBA8ZP8e0sQ4aOpXjF77bl4tA1d+RYmpZSXlf5FLTYMwpywpwpNMsagb8WIEWW3CV51tOImUb9TrRwBDMFUerveHuVWaMlh5x1tBzW34MDyJoTqwDdZhgZuNy6u1KCEAnKv040/ZNw==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(70206006)(8936002)(110136005)(70586007)(1076003)(8676002)(2616005)(316002)(4326008)(86362001)(107886003)(356005)(7696005)(6666004)(26005)(81166007)(36756003)(426003)(336012)(83380400001)(82310400005)(5660300002)(36860700001)(40460700003)(2906002)(186003)(47076005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:08:19.2272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82af9299-0d8b-438a-017a-08da425efeae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::625;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sort the migration section of VFIO trace events file alphabetically
and move two misplaced traces to common.c section.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/trace-events | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index a24ea7d8b0..d3cba59bfd 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -119,6 +119,8 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
+vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
@@ -148,18 +150,16 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
+vfio_load_cleanup(const char *name) " (%s)"
+vfio_load_device_config_state(const char *name) " (%s)"
+vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
-vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-vfio_save_setup(const char *name) " (%s)"
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
-vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_complete_precopy(const char *name) " (%s)"
-vfio_load_device_config_state(const char *name) " (%s)"
-vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
-vfio_load_cleanup(const char *name) " (%s)"
-vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
+vfio_save_device_config_state(const char *name) " (%s)"
+vfio_save_setup(const char *name) " (%s)"
+vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
-- 
2.21.3


