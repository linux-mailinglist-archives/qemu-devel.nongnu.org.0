Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049715251BA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:00:00 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBEN-0006bw-5B
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyz-0006VA-42
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:05 -0400
Received: from mail-dm6nam11on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::61a]:44641
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyw-0005Lr-Pi
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENeNRvNUER9UTy4DHR2UtsLe2GQj5xx22e16lKNuBJo4gpaKKl2gLG5wMyndtjLhG4+pQtcMRbnjJzAjpcmMUx3fZBUT/sjlHmek/ul9Atfs0Vj8bYGF/Y9G4HQGCxtId39bMxbvsPJyHKPmBOzm6rQ8aV/touLTsXbdjNuIYEdnrjY3hj+TqGjCzgZw4sdV7ueD83ocGTG7ahfJh/+1YxJ/GUMrzcN8+QdTPkasKNfacKJwldAS7QPHmzr3cFjIv+08/I9sQcqNVFONrH/Q5qpW+Lrq6EyZvgP8B5aXt50xH8esOJ+UKJLB6GT06i2ePTbyT10iXxumNH0ozOEUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liYUGVmuX0kZmO+aQDDBrQ7rfJPkkF+ldMbOwennimQ=;
 b=DMcqX6UlvvG3MKnZPcwWHJKZ4RBI/H+FxtbN28MrknyTFNyB0RHTMmQ+9S8QgsKnihLi2x++HCYFxc4IKXb9HExPtNEJ1guk1/5YMm+HK+got4Ro5wIlqy411/5JrEDqN9Fx8kAse4c4ozkqL6ty+2y3hrcMGciFlKckiAV8Vhd1ve1sa+zEPYFwU7urHKDnT2TZ6DF8i80Upt3MIGt4nPVfKvY7tdS26wL7jG+Zxl001zekQNH7jYgCs4LjbFVxiFn73tbKTMvVbDClUX8ftKtfyRLvdKy6XqBdZYyJnYEOhW0TBKFnubKxkcwmNYGjg3T98qWUPwohxYCidebDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liYUGVmuX0kZmO+aQDDBrQ7rfJPkkF+ldMbOwennimQ=;
 b=gi/4JxMXA4HHpdp6RwuocESgFIqgqx7X97A5PBDty/Oe5YsJkh6EsD/qGdtmaYhgWHZdYaS+i6PQ5CQgfdTVjVELNVvPnKeDoHbnQlRXlNsSpS0F7Q2H2c3CcgAHsQNmnH84BH6wKQXq2QtlpCvR8dWrACCg9Xj7tO6uSQ3+83ZTVWon9qiMVHoP3NV4vy2ACCjKimWx/Ain/AXH3MAI7m6oAA4kEqQCw+EDwWsMXGIrEF0SqdPAXoauKQ0OGGoFN0p22X913rqdAgaAu3e3hjsVZu2RgOfIYsfwVqOsh0z1xybx/zvrQtJwQYK1twx14HkIX7grK5qQrQZxgjbf4w==
Received: from MW4PR04CA0081.namprd04.prod.outlook.com (2603:10b6:303:6b::26)
 by CY4PR1201MB0216.namprd12.prod.outlook.com (2603:10b6:910:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 15:43:57 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::77) by MW4PR04CA0081.outlook.office365.com
 (2603:10b6:303:6b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Thu, 12 May 2022 15:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:56 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:52 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 8/9] vfio: Alphabetize migration section of VFIO trace-events
 file
Date: Thu, 12 May 2022 18:43:19 +0300
Message-ID: <20220512154320.19697-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b896f2a-8b6f-404a-c073-08da342e3a37
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0216:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02167E4741994E1ADDCF6905DECB9@CY4PR1201MB0216.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJ+dYY5o//q4IzE5USvNhJAFVQqo6zcaFBAYqnWCg3WP+sf+9ryqXeLBmfDeI3TYA7SBNdtOUprqBjWo6NKg/MGMohOiQq9YoImHK6s7Uxvv+Vs1NusJHokv+NaDu1SU1WrokEFKSVbT8/c/vW/CrIlfhLyasMS3nw4MULkRrEkBmRkPudCPu8QSWR6HmMiuzmSgl6umfxDioX7IU7bcmpxTO+KFJauaIseq+FgNB9hcoFtA0D6kXkM7gOUoj/tc+D4hfyAoZy2Z3pSTbgSX59uclZrN6mBSSfBSO4q8eLB7rtUi44rKCxBWvUl0+eIcO5rsDn90iSSo0HxAgK7G15Dxc0t46CJqEh5zdhikjnCy4I5brKttUrAGv71/W46ITXdEFWTDfZieGFjGB8wLGCMvcHERC9Ylpn0Cp4zTFa/+FqXXrD2mvLNa4Q66jlh8AQ4ztqgkliQaMzH3wCPyPzljO0J9jFHC6KrgXtl1Pa34VQXTt9lp3RwLEbWCkCLprqBuzirXCghA5O9Z8KEk3Z2f31SrMdp/apvFlkyRJQanwfCkH9dl0oWKNEidtJZgOVvWAj8KFryBuJIzmwdi9f+9/pOd/H7iyQo68WnKzqbm8Z1j8cKlRDwS/YUsdXuFOgHv3T6Bo/Cnjix6IenWRa9eLi2lS75bJQK7p5AxT7Bir25VM0qZKsxPCxspiiA9+d45RxlXF3FKdk0sFFRWNQ==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(86362001)(186003)(70586007)(70206006)(2616005)(40460700003)(36860700001)(4326008)(7696005)(8676002)(2906002)(316002)(82310400005)(26005)(54906003)(110136005)(6666004)(83380400001)(36756003)(356005)(1076003)(81166007)(47076005)(426003)(336012)(107886003)(5660300002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:57.5125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b896f2a-8b6f-404a-c073-08da342e3a37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0216
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::61a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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


