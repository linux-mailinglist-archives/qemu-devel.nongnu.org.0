Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802436D2BA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 09:01:02 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbeBt-0000hC-V6
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 03:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbeAl-00008r-B2; Wed, 28 Apr 2021 02:59:47 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbeAi-0003Bo-93; Wed, 28 Apr 2021 02:59:47 -0400
Received: from dggeml751-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FVTt10y2hz19JPc;
 Wed, 28 Apr 2021 14:55:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml751-chm.china.huawei.com (10.1.199.150) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:59:33 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:59:32 +0800
Subject: Re: [RFC PATCH v2 4/6] hw/acpi/aml-build: Add processor hierarchy
 node structure
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-5-wangyanan55@huawei.com>
 <20210427133720.xxwx6caln6dze5dm@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <9f54ff13-b46a-4f5f-9780-4bec3ade60a2@huawei.com>
Date: Wed, 28 Apr 2021 14:59:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427133720.xxwx6caln6dze5dm@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Henglong Fan <fanhenglong@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/4/27 21:37, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:43PM +0800, Yanan Wang wrote:
>> Add a generic API to build Processor Hierarchy Node Structure(Type 0),
>> which is strictly consistent with descriptions in ACPI 6.3: 5.2.29.1.
>>
>> This function will be used to build ACPI PPTT table for cpu topology.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/acpi/aml-build.c         | 27 +++++++++++++++++++++++++++
>>   include/hw/acpi/aml-build.h |  4 ++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index d33ce8954a..75e01aea17 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1916,6 +1916,33 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                    table_data->len - slit_start, 1, oem_id, oem_table_id);
>>   }
>>   
>> +/*
>> + * ACPI 6.3: 5.2.29.1 Processor Hierarchy Node Structure (Type 0)
>               ^ Doesn't this table show up in 6.2 first? We should always
> use the oldest specification we can.
Yes, it shows up for the first time in 6.2 specification.
> Also, please don't capitalize Hierarchy, Node, and Structure. Those words
> are not capitalized in the spec section name and we want an exact match
> here.
Indeed, the exact format in spec is "5.2.29.1 Processor hierarchy node 
structure (Type 0)"
I will fix this.
>> + */
>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>> +                                    uint32_t parent, uint32_t id,
>> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
>> +{
>> +    int i;
>> +
>> +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
>> +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
>> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
>> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
>> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
>                                                            ^ should be
> capitalized like in the spec
Right.
>                          
>> +
>> +    /* Number of private resources */
>> +    build_append_int_noprefix(tbl, priv_num, 4);
>> +
>> +    /* Private resources[N] */
>> +    if (priv_num > 0 && priv_rsrc != NULL) {
> Since we should never have priv_num > 0 and priv_rsrc == NULL, then we can
> do
>
>     if (priv_num > 0) {
>         assert(priv_rsrc);
>         ...
It seems much better, will fit it.

Thanks,
Yanan
>> +        for (i = 0; i < priv_num; i++) {
>> +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
>> +        }
>> +    }
>> +}
>> +
>>   /* build rev1/rev3/rev5.1 FADT */
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id)
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 471266d739..ea74b8f6ed 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -462,6 +462,10 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>> +                                    uint32_t parent, uint32_t id,
>> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
>> +
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .

