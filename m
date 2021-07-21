Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6553D08EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:31:42 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65ld-0002iY-7O
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m65kC-00021o-6p
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:30:13 -0400
Received: from mail-bn8nam11on20602.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::602]:14144
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m65k6-0003s3-8P
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:30:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS0LKKOKMWBL6o/pTRLw8wj9Dgm/qHpgO9xEpHUZo7J7gEqASV5xF4yMSDbF/sTlwEIRTFPCNirXfoCvlUbZ0MmIg9YPTeVFSvauyR/byewpZm6UuqSA+11SMgXTkCSfJGA1MPQs0yVEs5qkCMkMSeX1tqLbin/w2TWEKd8UCE7fgXWtIDIjeIJk0rPzKLeu3tnA92TyFb/JpvGoOMhS1ajBVdHbxcpucXGlGM5Qrw+GL1mGkgRvif664fBXTkczYV4A5hcxq5rjjbaVRc/78WYxIX8ZIUGlltCsI/WGS07LUangRDHfITzS20qtq6agZ+bxAQnrc9mPaLmk33AT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNB444sH1VpnpnUtc53Lp23wOL5x6xCZ02bkJAq0Ngs=;
 b=Ubih6JC35P/yamjT9DZ9Hrqqh6NU1WIfeUl13RU9mxYa29HWU80C/XKbKuuUO6hLv5Ogi0IxgfI3LzH0ykS0fuFWfVdmOyRff3sGaokhB9Lnj81b1vHmvbnLNkgyT3JeGvtAut/8Ba/JftlyJMvwZOV9LrwSMMtxJoy6Kcy65mnIhF+zCoYRfDBKPCnVx6LxQcE60xnEdMGHGBoaekRExd6biOKEIxgE5q5rZhci9mWvzQBvGh5mNkti8y/RkweE5N7PzrHNWN31I1Paq7qR0l3+tMkfejZu9fjTK8oHfqTNlp2ARLfvA63G6FynKX8V4s3vbHWuD+fjPDvd5m6MdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNB444sH1VpnpnUtc53Lp23wOL5x6xCZ02bkJAq0Ngs=;
 b=bQrH/eUR7JKoMDs4m6ckpZFrVnyvP7hYlvkjO2I24aaUk5i2gcDaxzvHtQqw7z9QcNSKza6iKc9W8GvqLcrAk1Y+0tcuL9wsMLGCzLDHGVIMFWlMCKQYDRd8sxIcvGGaJ8YYmCkLgHQsfx6bVtLRGh6EmGK2Pu5fQcOrqIXRoSiXIMp1gO2oGcw/gcil3YN/la27BRZxS/GcGgS7/ksRhk3sEFo0l0uOnu/Sc1bBm7OAoPwST8JbwD5C8ipm7xlMlte9rpvuLMZcF3hpmo1UZ/U88P1ziqGcFcLYSc/Ksr2WmyM8JaXX0Y4iZkCaEjSfVJpJqiLemMlFoM2SGzDTkw==
Received: from BN0PR04CA0044.namprd04.prod.outlook.com (2603:10b6:408:e8::19)
 by DM5PR12MB2375.namprd12.prod.outlook.com (2603:10b6:4:b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Wed, 21 Jul
 2021 06:25:01 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::ad) by BN0PR04CA0044.outlook.office365.com
 (2603:10b6:408:e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 06:25:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 06:25:01 +0000
Received: from [10.40.102.40] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Jul
 2021 06:24:59 +0000
Subject: Re: [PATCH 07/16] vfio: Avoid error_propagate() after
 migrate_add_blocker()
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-8-armbru@redhat.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <ab9fe3ca-1d8f-ab02-c0d5-0285bde483f9@nvidia.com>
Date: Wed, 21 Jul 2021 11:54:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-8-armbru@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52329262-abb9-4c8a-9efd-08d94c104561
X-MS-TrafficTypeDiagnostic: DM5PR12MB2375:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23754CB9BA550218DC304A7BDCE39@DM5PR12MB2375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8vPk3OCPkGycHsxqSXbf79fEGHMxfebiyebJz0P3lR4wWrZiOa7k03W6C69TrBo1sXyeqiRLjo22PRCKO9TvkX6b0VNLaaBQ9HDsFKLIiKtOzeEZTGyg2tX/kwH3CfYaXqM+LVAwDRkT/R5oa9gpXsR0oryXEyQ80bQ0KytCMreFg0jc1q3/I/5ORL2q5fMGdFsPIPs5x8BMHpPtxRyrRdtjOgAHrZ+cjobW3UHIGH7ybLk+ZESeDzdSAQNkG3JkQ3T4aKFF2ToPRm/iMYLbldzdPvJ4YGd1wpBECdjvaKvzN9OoGIGwlrL9xDI+bxJqvel37oLkVGI0fs0mtKeJg3UTPsFcpoj/NKysW2i3+FOdOiCis0ETJ6mc+w+Y+lN0cO+xd+vN+LGHU6D7gbA8AklY7+2wvkKKlbCQdiOKs5OQykxBimZA2LtfsjuEsqhUsnTscsSJgLQDHd2MrMIdI+ieHitP6PPfKW6PJ2aolIiulFxIMdDN9P9E0taqHpNBOIKqU7pED0AJjcCyOl6fVakblW4kCdRY/fwCU96lyQSXZB4SZTlp04ZPzA3SkrvKZh64W84c/2vLT49utY8fhNvTOn10EffIzdG+6yay/8i3vSeywIdPjkShnYDs5+zdUsc4+AxEbFQsrE7KcYYj4L4z6EY6mvlImXbr+fe2KFO6FcT6RmX4P2hS+UzjKMWBcMYrTj550LcfAmaG85/azKrnPCFdM5ZcEIQlkYsYxQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(4326008)(478600001)(70206006)(16576012)(316002)(82310400003)(82740400003)(5660300002)(336012)(86362001)(2616005)(31696002)(426003)(6666004)(36756003)(36860700001)(26005)(186003)(8936002)(53546011)(110136005)(16526019)(70586007)(356005)(36906005)(7636003)(31686004)(83380400001)(2906002)(8676002)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 06:25:01.5260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52329262-abb9-4c8a-9efd-08d94c104561
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2375
Received-SPF: softfail client-ip=2a01:111:f400:7eae::602;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/2021 6:23 PM, Markus Armbruster wrote:
> When migrate_add_blocker(blocker, &errp) is followed by
> error_propagate(errp, err), we can often just as well do
> migrate_add_blocker(..., errp).  This is the case in
> vfio_migration_probe().
> 
> Prior art: commit 386f6c07d2 "error: Avoid error_propagate() after
> migrate_add_blocker()".
> 
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/vfio/migration.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 82f654afb6..ff6b45de6b 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -858,7 +858,6 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>   {
>       VFIOContainer *container = vbasedev->group->container;
>       struct vfio_region_info *info = NULL;
> -    Error *local_err = NULL;
>       int ret = -ENOTSUP;
>   
>       if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> @@ -885,9 +884,8 @@ add_blocker:
>                  "VFIO device doesn't support migration");
>       g_free(info);
>   
> -    ret = migrate_add_blocker(vbasedev->migration_blocker, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
> +    if (ret < 0) {
>           error_free(vbasedev->migration_blocker);
>           vbasedev->migration_blocker = NULL;
>       }
> 

Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

