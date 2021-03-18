Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709733FF7A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 07:24:45 +0100 (CET)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMm5L-0007bz-Lj
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 02:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lMm4A-0007CS-Pw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:23:30 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lMm47-0002uG-RU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:23:30 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4F1H2l3JTDz5dRH;
 Thu, 18 Mar 2021 14:20:47 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Mar 2021 14:23:10 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 18 Mar 2021 14:23:10 +0800
Subject: Re: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
References: <20210310094106.2191-1-jiangkunkun@huawei.com>
Message-ID: <e8f3ff2f-1b8b-d49a-fb84-7b8b915e9feb@huawei.com>
Date: Thu, 18 Mar 2021 14:22:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210310094106.2191-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, shameerali.kolothum.thodi@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping,
Any comments and reviews are welcome.😁

Thanks,
Kunkun Jiang

On 2021/3/10 17:41, Kunkun Jiang wrote:
> Hi all,
>
> In the past, we clear dirty log immediately after sync dirty log to
> userspace. This may cause redundant dirty handling if userspace
> handles dirty log iteratively:
>
> After vfio clears dirty log, new dirty log starts to generate. These
> new dirty log will be reported to userspace even if they are generated
> before userspace handles the same dirty page.
>
> Since a new dirty log tracking method for vfio based on iommu hwdbm[1]
> has been introduced in the kernel and added a new capability named
> VFIO_DIRTY_LOG_MANUAL_CLEAR, we can eliminate some redundant dirty
> handling by supporting it.
>
> This series include patches as below:
> Patch 1:
> - updated the linux-headers/linux/vfio.h from kernel side
>
> Patch 2:
> - introduced 'struct VFIODMARange' to describe a range of the given DMA
>    mapping and with respect to a VFIO_IOMMU_MAP_DMA operation
>
> Patch 3:
> - implemented the operation to manual clear vfio dirty log, which can
>    eliminate some redundant dirty handling
>
> Thanks,
> Kunkun Jiang
>
> [1] https://lore.kernel.org/linux-iommu/20210310090614.26668-1-zhukeqian1@huawei.com/T/#mb168c9738ecd3d8794e2da14f970545d5820f863
>
> Zenghui Yu (3):
>    linux-headers: update against 5.12-rc2 and "vfio log clear" series
>    vfio: Maintain DMA mapping range for the container
>    vfio/migration: Support VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP
>
>   hw/vfio/common.c              | 207 ++++++++++++++++++++++++++++++++--
>   include/hw/vfio/vfio-common.h |  10 ++
>   linux-headers/linux/vfio.h    |  55 ++++++++-
>   3 files changed, 264 insertions(+), 8 deletions(-)
>


