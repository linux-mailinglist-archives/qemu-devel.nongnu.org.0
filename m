Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4035C7F7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:52:06 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwyz-0005Qp-RZ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwtA-0007XX-Nk; Mon, 12 Apr 2021 09:46:04 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwt3-0004lJ-5f; Mon, 12 Apr 2021 09:46:02 -0400
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FJqgT6z7lz5ptB;
 Mon, 12 Apr 2021 21:43:01 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 12 Apr 2021 21:45:52 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 12 Apr 2021 21:45:52 +0800
Subject: Re: [RFC PATCH 2/3] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-3-jiangkunkun@huawei.com>
 <c6ee5401-ccb6-1259-f7db-c3f97ff39256@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <89bef82f-7ec4-63ea-f0c0-95b45d425c83@huawei.com>
Date: Mon, 12 Apr 2021 21:45:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c6ee5401-ccb6-1259-f7db-c3f97ff39256@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/4/8 21:56, Auger Eric wrote:
> Hi Kunkun,
>
> On 2/19/21 10:42 AM, Kunkun Jiang wrote:
>> On Intel, the DMA mapped through the host single stage. Instead
>> we set up the stage 2 and stage 1 separately in nested mode as there
>> is no "Caching Mode".
> You need to rewrite the above sentences, Missing ARM and also the 1st
> sentences misses a verb.
Thanks for your review! I will fix it in the next version.
>> Legacy vfio_listener_log_sync cannot be used in nested stage as we
>> don't need to pay close attention to stage 1 mapping. This patch adds
>> vfio_prereg_listener_log_sync to mark dirty pages in nested mode.
>>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/vfio/common.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 7c50905856..af333e0dee 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1216,6 +1216,22 @@ static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
>>                          int128_get64(section->size), ram_addr);
>>   }
>>   
>> +static void vfio_prereg_listener_log_sync(MemoryListener *listener,
>> +                                          MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container =
>> +        container_of(listener, VFIOContainer, prereg_listener);
>> +
>> +    if (!memory_region_is_ram(section->mr) ||
>> +        !container->dirty_pages_supported) {
>> +        return;
>> +    }
>> +
>> +    if (vfio_devices_all_saving(container)) {
> I fail to see where is this defined?
Keqian modified vfio_devices_all_saving to vfio_devices_all_dirty_tracking
in 758b96b61d5.

When I posted this series patches, it was vfio_devices_all_saving. In 
v2[1], I
have updated it based on the lasted qemu.

[1] 
https://lore.kernel.org/qemu-devel/20210331101259.2153-3-jiangkunkun@huawei.com/

Thanks,
Kunkun Jiang
>> +        vfio_dma_sync_ram_section_dirty_bitmap(container, section);
>> +    }
>> +}
>> +
>>   typedef struct {
>>       IOMMUNotifier n;
>>       VFIOGuestIOMMU *giommu;
>> @@ -1260,6 +1276,14 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>>       if (memory_region_is_iommu(section->mr)) {
>>           VFIOGuestIOMMU *giommu;
>>   
>> +        /*
>> +         * In nested mode, stage 2 and stage 1 are set up separately. We
>> +         * only need to focus on stage 2 mapping when marking dirty pages.
>> +         */
>> +        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
>> +            return 0;
>> +        }
>> +
>>           QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
>>               if (MEMORY_REGION(giommu->iommu) == section->mr &&
>>                   giommu->n.start == section->offset_within_region) {
>> @@ -1312,6 +1336,7 @@ static const MemoryListener vfio_memory_listener = {
>>   static MemoryListener vfio_memory_prereg_listener = {
>>       .region_add = vfio_prereg_listener_region_add,
>>       .region_del = vfio_prereg_listener_region_del,
>> +    .log_sync = vfio_prereg_listener_log_sync,
>>   };
>>   
>>   static void vfio_listener_release(VFIOContainer *container)
>>
> Thanks
>
> Eric
>
> .



