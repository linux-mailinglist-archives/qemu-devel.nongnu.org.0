Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA05B6268
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 22:58:39 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXqVp-0001Nz-Q5
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 16:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oXqU0-0007vy-5Y
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 16:56:44 -0400
Received: from mail-dm3nam02on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::611]:64553
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oXqTx-0005Eb-62
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 16:56:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdjTsnL4ibG1RnoPwoIdxO+AzERf3bw/NqfPMIquim9p2YsKv9UgDDTHYYDKbAf941UFx8skVmbB4q4yH1q6beBasdqq/gQ2Su61ha5hsWRvNXBfZ8VLjOzOrzP1/fJYsbYeCHIwbxQN6/eesF/42pJuskWVZu+kqYEvkBuxMZ0qGSnZA5M27o7290bTpmOI1vWK7CSZFYdDWFrzZM06vI5uqots6i1wGpe86wtws5QCHN36TO/r1FV4GCd/pZXUCcKuWKrz/pM3c/s8557dWoRDwkTpYx/EcySfRjQYPu49EVf3ZQGgYR4m7Ed2JfU6E0cXBak5Kh9802rySFg9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxxKoJrL7rVxD0kqDDTZPR4ouQ/wgRfQlLkaNkUFkxA=;
 b=fGk5jGsoRcfs9BI+32a9sd+5H8u6QlY6Anglm2k2opcWGrXVDxKOpSeRiRhgx8OxtILu9neOvqhyjK9Rc+hzeXMai11IMMqZKdRELEDnfCHG2h9SjTepyk5MHYTRSACxufET287jXAbbNxBR/5k1iO+fOBE/kTVMJcjRDJRSyJLE2Q9duk5PMh0/IbE0emgVp+WfawWLZskas6XpNMTARc3/46lMHgV4Ucw2O9zRldojcv/2oq6cSMIWSuuXbltBcTmAXkD0T0AQDW9Jv2MpmeZm+paViDa8jx6hTJcTtl3oO8UIkK+z3rpZbNiyiXHVWZqPEJbTQcbna1nZZvSv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxxKoJrL7rVxD0kqDDTZPR4ouQ/wgRfQlLkaNkUFkxA=;
 b=orBnW6oZxAq6MJZaLM+qys0qivfjENGCJ4MysrI8s/swQA2a2NtO3igXnPwCwgTu4+IxjePCvgIlcdoBmVsH4CeYbTYP/dlmQ5yohWR9qb62TWa7HnJNeiogYeX32drbyVk76GgjhRLIDenRGjtLVnldGho5/BXw0khRN9uCb52g2/gqJNp1JTJxHO3cyC/NHHPDHBjzHTEJxlWqdAFjTejOLCyKTgyfPJTzWb19wArAqX5wyPdmMatDxZPLBJDnMJvicbeATGDyGd2hTes4nEu8yGCqQrBuGJpsS/LS3fGPuyX7APeeL58nrHdNpHl4Z4arF3tHVmzxjFc8tKXWVQ==
Received: from BN9PR03CA0341.namprd03.prod.outlook.com (2603:10b6:408:f6::16)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 20:51:35 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::6) by BN9PR03CA0341.outlook.office365.com
 (2603:10b6:408:f6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Mon, 12 Sep 2022 20:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 20:51:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.38;
 Mon, 12 Sep 2022 20:51:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 13:51:32 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Mon, 12 Sep 2022 13:51:32 -0700
Date: Mon, 12 Sep 2022 13:51:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC: <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>, <avihaih@nvidia.com>,
 <shayd@nvidia.com>, <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <Yx+b0t20wtneTry+@Asurada-Nvidia>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8735cwu5r7.fsf@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT061:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e228068-3227-49df-08b2-08da9500944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBNhioR9SkXl9KMPfAA/BxBxFQvmC6tkYsbqQvi7/5UIWYK9UqXBmmxz6lEdoq2CbbTtTkj3Ne6NHZ7O22Q+SjeouM2yfm001xhdUT5oAF0BNnkB8p0A4KJha4LT3Uu1uf8VvS4rt8jHTdtJX7DqzYPjKfrN0V2ljykhF3W40M+bQKSUOUiZjB42RhPSzpNy/euHCa3BclaYzGTNhMV/GzVHQfrbnOmjTw4Er8uLDerZfNYzsk+seFVoSLF9pQqEA4TMA6prmqEtnaG56U/+5ir7lCZ4yxHGEiIG13pMwoy1ngsvZB+cjEwbhHgNVUdk6/ZPrlCyYM39DIVs6lGy8DAFMyi5RapyBohemJeXEjsf7SeohaNMFH/iUunnWxxpzBmJbgr67gjlHA2kPkaYtKJNnsMUd7XSKjPoTaVOBDi6oLnEBkQWkpdvsuZkoB5gwHKr6lxa0FDvrcTRstF7O/s5c2OMLhUntpcRzRsYIZKh48rLT1TzyfDoSSiIewi/jznW+PywMxcoKpSVKo2h6lCbDwvBM3aWIm1oMSBGXzgTFKA+Qz3aFazazuJJePw4x0lTaMSl5iJcL3UXC40xVF3udDcD5pILFaL0yJjmulp5qbbo2tqj9zfS/6xjNwIPHBCrLa1Z/5BynJayhZbSJVgfs2bZhRn4xuACsXlapjHX2OlbA+bxiubjVxWGYDzAFrbxvQU1FkG5O3Q+goJK9wLFgmYXatcbvTGyXr0jz+iVjHJMypCpWv2BnvoE5PlEVfaf1ukRuuUVG5+QelMLN+mnto2SpNz3qkefc4LA0XrXdCwXvhO4VWwEQ3ho6bm9
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(110136005)(478600001)(40460700003)(55016003)(40480700001)(33716001)(316002)(2906002)(107886003)(5660300002)(41300700001)(9686003)(47076005)(8676002)(82310400005)(426003)(26005)(336012)(70206006)(186003)(356005)(8936002)(54906003)(70586007)(81166007)(83380400001)(82740400003)(36860700001)(86362001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 20:51:34.5111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e228068-3227-49df-08b2-08da9500944b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
Received-SPF: softfail client-ip=2a01:111:f400:7e83::611;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, Sep 12, 2022 at 02:38:52PM +0200, Cornelia Huck wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Sep 09 2022, Nicolin Chen <nicolinc@nvidia.com> wrote:
> 
> > Its caller vfio_connect_container() assigns a default value
> > to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> > This would result in a "Segmentation fault" error, when the
> > VFIO_IOMMU_GET_INFO ioctl errors out.
> >
> > Since the caller has g_free already, drop the g_free in its
> > rollback routine and add a line of comments to highlight it.
> 
> There's basically two ways to fix this:
> 
> - return *info in any case, even on error
> - free *info on error, and make sure that the caller doesn't try to
>   access *info if the function returned !0
> 
> The problem with the first option is that the caller will access invalid
> information if it neglects to check the return code, and that might lead
> to not-that-obvious errors; in the second case, a broken caller would at
> least fail quickly with a segfault. The current code is easier to fix
> with the first option.
> 
> I think I'd prefer the second option; but obviously maintainer's choice.

The caller does check rc all the time. So I made a smaller fix
(the first option). Attaching the git-diff for the second one.

Alex, please let me know which one you prefer. Thanks!

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 51b2e05c76..74431411ab 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2109,6 +2109,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     case VFIO_TYPE1_IOMMU:
     {
         struct vfio_iommu_type1_info *info;
+        uint64_t iova_pgsizes;
 
         /*
          * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
@@ -2119,20 +2120,22 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
          */
         ret = vfio_get_iommu_info(container, &info);
 
-        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        if (info && (info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
+            iova_pgsizes = info->iova_pgsizes;
+        } else {
             /* Assume 4k IOVA page size */
-            info->iova_pgsizes = 4096;
+            iova_pgsizes = 4096;
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
-        container->pgsizes = info->iova_pgsizes;
+        vfio_host_win_add(container, 0, (hwaddr)-1, iova_pgsizes);
+        container->pgsizes = iova_pgsizes;
 
         /* The default in the kernel ("dma_entry_limit") is 65535. */
         container->dma_max_mappings = 65535;
-        if (!ret) {
+        if (info) {
             vfio_get_info_dma_avail(info, &container->dma_max_mappings);
             vfio_get_iommu_info_migration(container, info);
+            g_free(info);
         }
-        g_free(info);
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:

