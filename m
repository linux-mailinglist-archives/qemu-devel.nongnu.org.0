Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BB3FFBD8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:24:04 +0200 (CEST)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4UV-0003EE-3K
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM4TM-0001zG-Jm; Fri, 03 Sep 2021 04:22:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM4TI-0003xS-CV; Fri, 03 Sep 2021 04:22:51 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H19fl6CMCzbgFy;
 Fri,  3 Sep 2021 16:18:39 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 16:22:36 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 3 Sep 2021 16:22:35 +0800
Subject: Re: [RFC v9 14/29] vfio: Introduce helpers to DMA map/unmap a RAM
 section
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <alex.williamson@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
 <20210411120912.15770-15-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <5aee6351-33b6-9e16-23b3-9a74666a749c@huawei.com>
Date: Fri, 3 Sep 2021 16:22:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411120912.15770-15-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, vdumpa@nvidia.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/4/11 20:08, Eric Auger wrote:
> Let's introduce two helpers that allow to DMA map/unmap a RAM
> section. Those helpers will be called for nested stage setup in
> another call site. Also the vfio_listener_region_add/del()
> structure may be clearer.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v8 -> v9
> - rebase on top of
>    1eb7f642750c ("vfio: Support host translation granule size")
>
> v5 -> v6:
> - add Error **
> ---
>   hw/vfio/common.c     | 199 +++++++++++++++++++++++++------------------
>   hw/vfio/trace-events |   4 +-
>   2 files changed, 119 insertions(+), 84 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a8f835328e..0cd7ef2139 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -662,13 +662,126 @@ hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
>       return NULL;
>   }
>   
> +static int vfio_dma_map_ram_section(VFIOContainer *container,
> +                                    MemoryRegionSection *section, Error **err)
> +{
> +    VFIOHostDMAWindow *hostwin;
> +    Int128 llend, llsize;
> +    hwaddr iova, end;
> +    void *vaddr;
> +    int ret;
> +
> +    assert(memory_region_is_ram(section->mr));
> +
> +    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
Is there any special meaning for using TRAGET_PAGE_ALIGN here?
REAL_HOST_PAGE_ALIGN is used in vfio_listener_region_add.

And I think a check should be added here if using REAL_HOST_PAGE_ALIGN.
> if (int128_ge(int128_make64(iova), llend)) {
>      return;
> }

It will cause an error log or 'assert(r ==a )' of int128_get64 by calling
vfio_prereg_listener_region_add in some scenarios. Some devices' BAR
may map MSI-X structures and others in one host page.

By the way, is this set of patch to be updated after "/dev/iommu" is
sent out?

Thanks,
Kunkun Jiang

> +    end = int128_get64(int128_sub(llend, int128_one()));
> +
> +    vaddr = memory_region_get_ram_ptr(section->mr) +
> +            section->offset_within_region +
> +            (iova - section->offset_within_address_space);
> +
> +    hostwin = hostwin_from_range(container, iova, end);
> +    if (!hostwin) {
> +        error_setg(err, "Container %p can't map guest IOVA region"
> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
> +        return -EFAULT;
> +    }
> +
> +    trace_vfio_dma_map_ram(iova, end, vaddr);
> +
> +    llsize = int128_sub(llend, int128_make64(iova));
> +
> +    if (memory_region_is_ram_device(section->mr)) {
> +        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> +
> +        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
> +            trace_vfio_listener_region_add_no_dma_map(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                int128_getlo(section->size),
> +                pgmask + 1);
> +            return 0;
> +        }
> +    }
> +
> +    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> +                       vaddr, section->readonly);
> +    if (ret) {
> +        error_setg(err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> +                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                   container, iova, int128_get64(llsize), vaddr, ret);
> +        if (memory_region_is_ram_device(section->mr)) {
> +            /* Allow unexpected mappings not to be fatal for RAM devices */
> +            error_report_err(*err);
> +            return 0;
> +        }
> +        return ret;
> +    }
> +    return 0;
> +}
> +
> +static void vfio_dma_unmap_ram_section(VFIOContainer *container,
> +                                       MemoryRegionSection *section)
> +{
> +    Int128 llend, llsize;
> +    hwaddr iova, end;
> +    bool try_unmap = true;
> +    int ret;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return;
> +    }
> +    end = int128_get64(int128_sub(llend, int128_one()));
> +
> +    llsize = int128_sub(llend, int128_make64(iova));
> +
> +    trace_vfio_dma_unmap_ram(iova, end);
> +
> +    if (memory_region_is_ram_device(section->mr)) {
> +        hwaddr pgmask;
> +        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
> +
> +        assert(hostwin); /* or region_add() would have failed */
> +
> +        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> +        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
> +    }
> +
> +    if (try_unmap) {
> +        if (int128_eq(llsize, int128_2_64())) {
> +            /* The unmap ioctl doesn't accept a full 64-bit span. */
> +            llsize = int128_rshift(llsize, 1);
> +            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> +            if (ret) {
> +                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> +                             "0x%"HWADDR_PRIx") = %d (%m)",
> +                             container, iova, int128_get64(llsize), ret);
> +            }
> +            iova += int128_get64(llsize);
> +        }
> +        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> +        if (ret) {
> +            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> +                         "0x%"HWADDR_PRIx") = %d (%m)",
> +                         container, iova, int128_get64(llsize), ret);
> +        }
> +    }
> +}
> +
>   static void vfio_listener_region_add(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>       hwaddr iova, end;
> -    Int128 llend, llsize;
> -    void *vaddr;
> +    Int128 llend;
>       int ret;
>       VFIOHostDMAWindow *hostwin;
>       Error *err = NULL;
> @@ -814,39 +927,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       }
>   
>       /* Here we assume that memory_region_is_ram(section->mr)==true */
> -
> -    vaddr = memory_region_get_ram_ptr(section->mr) +
> -            section->offset_within_region +
> -            (iova - section->offset_within_address_space);
> -
> -    trace_vfio_listener_region_add_ram(iova, end, vaddr);
> -
> -    llsize = int128_sub(llend, int128_make64(iova));
> -
> -    if (memory_region_is_ram_device(section->mr)) {
> -        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> -
> -        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
> -            trace_vfio_listener_region_add_no_dma_map(
> -                memory_region_name(section->mr),
> -                section->offset_within_address_space,
> -                int128_getlo(section->size),
> -                pgmask + 1);
> -            return;
> -        }
> -    }
> -
> -    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> -                       vaddr, section->readonly);
> -    if (ret) {
> -        error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                   container, iova, int128_get64(llsize), vaddr, ret);
> -        if (memory_region_is_ram_device(section->mr)) {
> -            /* Allow unexpected mappings not to be fatal for RAM devices */
> -            error_report_err(err);
> -            return;
> -        }
> +    if (vfio_dma_map_ram_section(container, section, &err)) {
>           goto fail;
>       }
>   
> @@ -880,10 +961,6 @@ static void vfio_listener_region_del(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    hwaddr iova, end;
> -    Int128 llend, llsize;
> -    int ret;
> -    bool try_unmap = true;
>   
>       if (vfio_listener_skipped_section(section)) {
>           trace_vfio_listener_region_del_skip(
> @@ -923,49 +1000,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>            */
>       }
>   
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> -        return;
> -    }
> -    end = int128_get64(int128_sub(llend, int128_one()));
> -
> -    llsize = int128_sub(llend, int128_make64(iova));
> -
> -    trace_vfio_listener_region_del(iova, end);
> -
> -    if (memory_region_is_ram_device(section->mr)) {
> -        hwaddr pgmask;
> -        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
> -
> -        assert(hostwin); /* or region_add() would have failed */
> -
> -        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> -        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
> -    }
> -
> -    if (try_unmap) {
> -        if (int128_eq(llsize, int128_2_64())) {
> -            /* The unmap ioctl doesn't accept a full 64-bit span. */
> -            llsize = int128_rshift(llsize, 1);
> -            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> -            if (ret) {
> -                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                             "0x%"HWADDR_PRIx") = %d (%m)",
> -                             container, iova, int128_get64(llsize), ret);
> -            }
> -            iova += int128_get64(llsize);
> -        }
> -        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> -        if (ret) {
> -            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx") = %d (%m)",
> -                         container, iova, int128_get64(llsize), ret);
> -        }
> -    }
> +    vfio_dma_unmap_ram_section(container, section);
>   
>       memory_region_unref(section->mr);
>   
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 2a41326c0f..936d29d150 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -99,10 +99,10 @@ vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "i
>   vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add 0x%"PRIx64" - 0x%"PRIx64
>   vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>   vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
> -vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_dma_map_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
> -vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> +vfio_dma_unmap_ram(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_connect_existing_container(int groupid, int container_fd) "group=%d existing container fd=%d"
>   vfio_connect_new_container(int groupid, int container_fd) "group=%d new container fd=%d"



