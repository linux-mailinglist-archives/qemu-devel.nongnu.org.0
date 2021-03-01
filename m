Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCBA327934
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:29:25 +0100 (CET)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdvg-0006mH-T1
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGdud-0006Dk-IW; Mon, 01 Mar 2021 03:28:19 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGdua-0000cz-Qk; Mon, 01 Mar 2021 03:28:19 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dptdq0YhSzYDqY;
 Mon,  1 Mar 2021 16:26:39 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Mar 2021 16:28:09 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Mar 2021 16:28:09 +0800
Subject: Re: [RFC PATCH 0/3] Add migration support for VFIO PCI devices in
 SMMUv3 nested stage mode
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
Message-ID: <ad3ca9c6-dbf9-9c25-8fdb-b19d5d84d00f@huawei.com>
Date: Mon, 1 Mar 2021 16:27:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210219094230.231-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping,
Any comments and reviews are welcome.

Thanks.
Kunkun Jiang.

On 2021/2/19 17:42, Kunkun Jiang wrote:
> Hi all,
>
> Since the SMMUv3's nested translation stages[1] has been introduced by Eric, we
> need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested stage
> mode. At present, it is not yet supported in QEMU. There are two problems in the
> existing framework.
>
> First, the current way to get dirty pages is not applicable to nested stage mode.
> Because of the "Caching Mode", VTD can map the RAM through the host single stage
> (giova->hpa). "vfio_listener_log_sync" gets dirty pages by transferring "giova"
> to the kernel for the RAM block section of mapped MMIO region. In nested stage
> mode, we setup the stage 2 (gpa->hpa) and the stage 1(giova->gpa) separately. So
> it is inapplicable to get dirty pages by the current way in nested stage mode.
>
> Second, it also need to pass stage 1 configurations to the destination host after
> the migration. In Eric's patch, it passes the stage 1 configuration to the host on
> each STE update for the devices set the PASID PciOps. The configuration will be
> applied at physical level. But the data of physical level will not be sent to the
> destination host. So we have to pass stage 1 configurations to the destination
> host after the migration.
>
> This Patch set includes patches as below:
> Patch 1-2:
> - Refactor the vfio_listener_log_sync and added a new function to get dirty pages
> in nested stage mode.
>
> Patch 3:
> - Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
> to the destination host after the migration.
>
> @Eric, Could you please add this Patch set to your future version of
> "vSMMUv3/pSMMUv3 2 stage VFIO integration", if you think this Patch set makes sense? :)
>
> Best Regards
> Kunkun Jiang
>
> [1] [RFC,v7,00/26] vSMMUv3/pSMMUv3 2 stage VFIO integration
> http://patchwork.ozlabs.org/project/qemu-devel/cover/20201116181349.11908-1-eric.auger@redhat.com/
>
> Kunkun Jiang (3):
>    vfio: Introduce helpers to mark dirty pages of a RAM section
>    vfio: Add vfio_prereg_listener_log_sync in nested stage
>    hw/arm/smmuv3: Post-load stage 1 configurations to the host
>
>   hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
>   hw/arm/trace-events |  1 +
>   hw/vfio/common.c    | 47 +++++++++++++++++++++++++++++------
>   3 files changed, 100 insertions(+), 8 deletions(-)
>


