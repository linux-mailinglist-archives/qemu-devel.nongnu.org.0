Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE7944D7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:10:52 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAmx-0003iZ-4K
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1ml73Z-0003o4-2R
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:11:45 -0500
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com
 ([40.107.223.56]:7872 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1ml73W-000270-FC
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:11:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R444kJG3KYo+CXxfBMp+9J5ZSr19RUAzEsXM35VddTPY6cuGO5TUw/iurHhFc6VT/t6hEBWjuOTWrGo9TeIXf8PX8AxBmkzqiOJqxaf/DFJLtsU9xlGg9FqteCLvP2MdAXb54VOSYGz2JqWJf6iAYBydPB74Dqi3J8AJx7FJVsY4aG+NWX+u8OzCZTf+iGiKyoI9Slw/v41owq8TjjNgOp4nxqz1tNd9fOL8OfG6bddqah4k41Hx0qUjPk+xW/YHF4WbPwa2a6f073fLtOoGNuhoL8VwENwSD1dlFdXoiTTvf8F1ASqMwlj3tme17szWCjGUEudf3EhbM984QFTurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YEOfCOxbMXu2pANoeNxRCBJo5M9KsK6re24KOFcg1Q=;
 b=H8EYEBEsJ2mlyrIhUjfZRKCIdZ24Cxi2MLdiXf3GgA+CBA7CkZ+qO6wJw4zj//KjfM6mt+6F3tHagPinehHBvGxBt4SguFV6aOHTUgisJv1l2PUtX+Qp7XVwHN53NUS5bJAmaiIMNarddLrfaeKY66C/jOLPpRRl0TAqI5g8PQPoxp2ZMoHq25qbL/56V/OIMJnmGMV2ZYhwpH3e5hZj1iEEdD8W+xhrCz/CqfnY3llyJMsXrN1tdQyRedhWqK8KXGGrr3shv1AXF4lNO6OScROt1dm9ggeZFzRiinyHRMrIcspOVaWXMTDj8SzZO2fg3e/02fbaJr96tE3B8ekxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YEOfCOxbMXu2pANoeNxRCBJo5M9KsK6re24KOFcg1Q=;
 b=lCCjJ4IzlpH2sqbGUqkG5nwB1i6aoC9Qk/2DXBrAIxNMaO3Lddb5YDfxwvgNqJGLh0aJK5aL0JL2KOcwZFLuwdDyLGO3YmA5Tdn7V5LLXQuuOcicCTi9GJwJ9rZVpMKnDIXL1UuLnxKBvwOTcX6UnWxmNvo+Fli+6mxjjybHbTlMSX4QnK5DIewV/J/hYILpkqeesbqcEgkSTzkhR3WLhJUNMOiv4EF9XPYgYqJyr+kbleZ1sbnG8aE381BpO2lgB0WDRl0n0q1N21UWof/ACIk1LoQqEp6xJgPPGs6UUYA0XGlWbCXZq6L38CS+G+qWb+FWwzwKT9oxKocyyqd1Rw==
Received: from MW2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:907::25) by
 BN6PR12MB1875.namprd12.prod.outlook.com (2603:10b6:404:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 11 Nov
 2021 09:51:21 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::fa) by MW2PR16CA0012.outlook.office365.com
 (2603:10b6:907::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 11 Nov 2021 09:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Thu, 11 Nov 2021 09:51:20 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 11 Nov
 2021 01:51:19 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 11 Nov
 2021 09:51:19 +0000
Received: from vdi.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 11 Nov 2021 09:51:17 +0000
From: Yishai Hadas <yishaih@nvidia.com>
To: <alex.williamson@redhat.com>
CC: <jgg@nvidia.com>, <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>,
 <cohuck@redhat.com>, <yishaih@nvidia.com>, <maorg@nvidia.com>
Subject: [PATCH] vfio/migration: Improve to read/write full migration region
 per chunk
Date: Thu, 11 Nov 2021 11:50:40 +0200
Message-ID: <20211111095040.183977-1-yishaih@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2771a2a-d5f8-4fbd-12f6-08d9a4f8d068
X-MS-TrafficTypeDiagnostic: BN6PR12MB1875:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1875A03E016A718DF951289FC3949@BN6PR12MB1875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7suuB80xoXJaaLplzRqaCICXzbVNaxs53w1RatxKqVEUm79Us3Z3XXIVR7ADzeSatlurxPO8w1WQKWIuYzJZJEQYRog0ZqdH5yqapkODVOAYzTywiyPAVins3MuEbPhWkAEIONlcuIH39W6qITqzyAJP0aw6D+uCdBRuyp+7BD4ERNvOQ3JW5cV6k3AWF0yaq3CaEkNp+Bv8tyVEh6Luhn0C+nzPloYaJTLB1eSJVC/YEdXv2HPjqq0XZtJEWhcQxE1y0yJSyChYjHym6BWQzoT29Lut09s2iZracX6qNeQpdFENzIb8zBZcUzrw5OUrztoW+ivJtNlL9leDRK7mLMs6UD9EKMkUQxiNzxjjH/gMRkfdMrPvaLFHV1ASMNDrNKkY0zYLMTe+OZXursykuE+agjMJlECxYrSYL3Ahuvt3iP7FHK1Htv8QKBurilycWeffHBOVsxbljK0XMNzSZcGIDrGDMsq7slWV6+nPYXwg9uWMB78H9kjlK5eGFkpdArW3PkLIFHXOkDoykKXTy1Swti6RyBpXj3hROH1XvXe6H2axElH7fThE4ZM/tBhhfKGxVBEXVThYOjPPgPft00PfnSeoP2jVYeVMDPxexenF3sWEZ3rIBoIqyvUo9n2A6Ic+DRKg4EUBCvysL2YWqAGg3XWdOm31run8tnZYWU2Imd+uf4jbBcKKd1RjQNaz16UUblwDT7sVmMob9KI9DQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(2906002)(36860700001)(8676002)(508600001)(26005)(4326008)(336012)(186003)(54906003)(70586007)(6666004)(356005)(36756003)(8936002)(47076005)(7696005)(82310400003)(316002)(83380400001)(6916009)(107886003)(426003)(2616005)(86362001)(1076003)(70206006)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:51:20.3262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2771a2a-d5f8-4fbd-12f6-08d9a4f8d068
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
Received-SPF: softfail client-ip=40.107.223.56;
 envelope-from=yishaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Nov 2021 09:09:35 -0500
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

Upon reading/writing the migration data there is no real reason to limit
the read/write system call from the file to be 8 bytes.

In addition, there is no reason to depend on the file offset alignment.
The offset is just some logical value which depends also on the region
index and has nothing to do with the amount of data that can be
accessed.

Move to read/write the full region size per chunk, this reduces
dramatically the number of the systems calls that are needed and improve
performance.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
---
 hw/vfio/migration.c | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ff6b45de6b5..b5f310bb831 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -62,40 +62,8 @@ static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
     return 0;
 }
 
-static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
-                       off_t off, bool iswrite)
-{
-    int ret, done = 0;
-    __u8 *tbuf = buf;
-
-    while (count) {
-        int bytes = 0;
-
-        if (count >= 8 && !(off % 8)) {
-            bytes = 8;
-        } else if (count >= 4 && !(off % 4)) {
-            bytes = 4;
-        } else if (count >= 2 && !(off % 2)) {
-            bytes = 2;
-        } else {
-            bytes = 1;
-        }
-
-        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
-        if (ret) {
-            return ret;
-        }
-
-        count -= bytes;
-        done += bytes;
-        off += bytes;
-        tbuf += bytes;
-    }
-    return done;
-}
-
-#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
-#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
+#define vfio_mig_read(f, v, c, o)       vfio_mig_access(f, (__u8 *)v, c, o, false)
+#define vfio_mig_write(f, v, c, o)      vfio_mig_access(f, (__u8 *)v, c, o, true)
 
 #define VFIO_MIG_STRUCT_OFFSET(f)       \
                                  offsetof(struct vfio_device_migration_info, f)
-- 
2.18.1


