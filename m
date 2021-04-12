Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879135C7FD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:53:56 +0200 (CEST)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVx0l-0007Lp-2n
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwta-0007r7-RO; Mon, 12 Apr 2021 09:46:30 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwtW-0004z8-MS; Mon, 12 Apr 2021 09:46:29 -0400
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FJqgB1sX7zWX8l;
 Mon, 12 Apr 2021 21:42:46 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 12 Apr 2021 21:46:21 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 12 Apr 2021 21:46:21 +0800
Subject: Re: [RFC PATCH 3/3] hw/arm/smmuv3: Post-load stage 1 configurations
 to the host
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-4-jiangkunkun@huawei.com>
 <dcfa967a-056f-b15c-6a39-0638e6a52a88@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <953170e8-faba-79d2-5f13-9b8f224f223b@huawei.com>
Date: Mon, 12 Apr 2021 21:46:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dcfa967a-056f-b15c-6a39-0638e6a52a88@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
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

On 2021/4/12 16:34, Auger Eric wrote:
> Hi Kunkun,
> On 2/19/21 10:42 AM, Kunkun Jiang wrote:
>> In nested mode, we call the set_pasid_table() callback on each STE
>> update to pass the guest stage 1 configuration to the host and
>> apply it at physical level.
>>
>> In the case of live migration, we need to manual call the
> s/manual/manually
You are right.
>> set_pasid_table() to load the guest stage 1 configurations to the
>> host. If this operation is fail, the migration is fail.
> s/If this operation is fail, the migration is fail/If this operation
> fails, the migration fails.
Thanks for your careful review.
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
>>   hw/arm/trace-events |  1 +
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 6c6ed84e78..94ca15375c 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1473,6 +1473,65 @@ static void smmu_realize(DeviceState *d, Error **errp)
>>       smmu_init_irq(s, dev);
>>   }
>>   
>> +static int smmuv3_manual_set_pci_device_pasid_table(SMMUDevice *sdev)
> Can't you retrieve the associated sid and then call
> smmuv3_notify_config_change()
Agreed. It can reuse the code of smmuv3_notify_config_change().
I will modify it in the next version.😁

But I need a return value to judge whether it is successful, which
may need to modify the type of smmuv3_notify_config_change().

Thanks,
Kunkun Jiang
>> +{
>> +#ifdef __linux__
>> +    IOMMUMemoryRegion *mr = &(sdev->iommu);
>> +    int sid = smmu_get_sid(sdev);
>> +    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
>> +                           .inval_ste_allowed = true};
>> +    IOMMUConfig iommu_config = {};
>> +    SMMUTransCfg *cfg;
>> +    int ret = -1;
>> +
>> +    cfg = smmuv3_get_config(sdev, &event);
>> +    if (!cfg) {
>> +        return ret;
>> +    }
>> +
>> +    iommu_config.pasid_cfg.argsz = sizeof(struct iommu_pasid_table_config);
>> +    iommu_config.pasid_cfg.version = PASID_TABLE_CFG_VERSION_1;
>> +    iommu_config.pasid_cfg.format = IOMMU_PASID_FORMAT_SMMUV3;
>> +    iommu_config.pasid_cfg.base_ptr = cfg->s1ctxptr;
>> +    iommu_config.pasid_cfg.pasid_bits = 0;
>> +    iommu_config.pasid_cfg.vendor_data.smmuv3.version = PASID_TABLE_SMMUV3_CFG_VERSION_1;
>> +
>> +    if (cfg->disabled || cfg->bypassed) {
>> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_BYPASS;
>> +    } else if (cfg->aborted) {
>> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_ABORT;
>> +    } else {
>> +        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_TRANSLATE;
>> +    }
>> +
>> +    ret = pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config);
>> +    if (ret) {
>> +        error_report("Failed to pass PASID table to host for iommu mr %s (%m)",
>> +                     mr->parent_obj.name);
>> +    }
>> +
>> +    return ret;
>> +#endif
>> +}
>> +
>> +static int smmuv3_post_load(void *opaque, int version_id)
>> +{
>> +    SMMUv3State *s3 = opaque;
>> +    SMMUState *s = &(s3->smmu_state);
>> +    SMMUDevice *sdev;
>> +    int ret = 0;
>> +
>> +    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
>> +        trace_smmuv3_post_load_sdev(sdev->devfn, sdev->iommu.parent_obj.name);
>> +        ret = smmuv3_manual_set_pci_device_pasid_table(sdev);
>> +        if (ret) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static const VMStateDescription vmstate_smmuv3_queue = {
>>       .name = "smmuv3_queue",
>>       .version_id = 1,
>> @@ -1491,6 +1550,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>>       .version_id = 1,
>>       .minimum_version_id = 1,
>>       .priority = MIG_PRI_IOMMU,
>> +    .post_load = smmuv3_post_load,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT32(features, SMMUv3State),
>>           VMSTATE_UINT8(sid_size, SMMUv3State),
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 35e562ab74..caa864dd72 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -53,4 +53,5 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
>>   smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>>   smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>>   smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s1ctxptr) "iommu mr=%s config=%d s1ctxptr=0x%"PRIx64
>> +smmuv3_post_load_sdev(int devfn, const char *name) "sdev devfn=%d iommu mr=%s"PRIx64
>>   
>>
> Thanks
>
> Eric
>
> .



