Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC3434B44
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:36:19 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdApO-0000r6-Fg
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdAlw-0005Or-TB; Wed, 20 Oct 2021 08:32:45 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdAlq-0007Su-St; Wed, 20 Oct 2021 08:32:44 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HZ91y1Fx2z1DHjf;
 Wed, 20 Oct 2021 20:30:46 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 20:32:32 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 20:32:31 +0800
Subject: Re: [PATCH v8 4/8] hw/acpi/aml-build: Add Processor hierarchy node
 structure
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-5-wangyanan55@huawei.com>
 <3089e3c8-0eb0-3360-357d-4ba82ede8952@redhat.com>
 <f8f361b6-33b5-6314-cf07-e71efe8e362e@huawei.com>
 <20211020060349-mutt-send-email-mst@kernel.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <bce68810-c5a5-225b-5a3c-15ed695d0da8@huawei.com>
Date: Wed, 20 Oct 2021 20:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211020060349-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/20 18:04, Michael S. Tsirkin wrote:
> On Wed, Oct 20, 2021 at 05:51:46PM +0800, wangyanan (Y) wrote:
>> On 2021/10/20 15:43, Eric Auger wrote:
>>> Hi
>>>
>>> On 10/14/21 3:22 PM, Yanan Wang wrote:
>>>> Add a generic API to build Processor hierarchy node structure (Type 0),
>>>> which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.
>>>>
>>>> This function will be used to build ACPI PPTT table for cpu topology.
>>>>
>>>> Co-developed-by: Ying Fang <fangying1@huawei.com>
>>>> Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
>>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>    hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
>>>>    include/hw/acpi/aml-build.h |  4 ++++
>>>>    2 files changed, 30 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>>> index 76af0ebaf9..b7b9db6888 100644
>>>> --- a/hw/acpi/aml-build.c
>>>> +++ b/hw/acpi/aml-build.c
>>>> @@ -1964,6 +1964,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>        acpi_table_end(linker, &table);
>>>>    }
>>>> +/* ACPI 6.2: 5.2.29.1 Processor hierarchy node structure (Type 0) */
>>>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>>> +                                    uint32_t parent, uint32_t id,
>>>> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
>>> nit: I think Igor would generally prefer
>>> build_append_byte(tbl, 0 /* processor structure */);  /* Type */
>>> although it generates checkpatch warnings
>> Ok.
> I think it's ok as is. Right Igor?
Understood.

Thanks,
Yanan
.
>>>> +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
>>>> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
>>>> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
>>>> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
>>>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI Processor ID */
>>>> +
>>>> +    /* Number of private resources */
>>>> +    build_append_int_noprefix(tbl, priv_num, 4);
>>>> +
>>>> +    /* Private resources[N] */
>>>> +    if (priv_num > 0) {
>>>> +        assert(priv_rsrc);
>>>> +        for (i = 0; i < priv_num; i++) {
>>>> +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>>    /* build rev1/rev3/rev5.1 FADT */
>>>>    void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>>                    const char *oem_id, const char *oem_table_id)
>>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>>>> index 3cf6f2c1b9..2c457c8f17 100644
>>>> --- a/include/hw/acpi/aml-build.h
>>>> +++ b/include/hw/acpi/aml-build.h
>>>> @@ -489,6 +489,10 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>>>>    void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                    const char *oem_id, const char *oem_table_id);
>>>> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>>> +                                    uint32_t parent, uint32_t id,
>>>> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
>>>> +
>>>>    void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>>                    const char *oem_id, const char *oem_table_id);
>>>>
>>> Besides
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Thanks for your review!
>>
>> Yanan
>> .
>>> Eric
>>>
>>> .
> .


