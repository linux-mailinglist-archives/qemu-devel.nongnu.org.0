Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6104699454
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdNZ-0000Ow-MK; Thu, 16 Feb 2023 07:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSdNW-0000OT-S1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:28:46 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSdNU-0000Lx-2Y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:28:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PHZ3d01SjzrRt4;
 Thu, 16 Feb 2023 20:28:13 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Thu, 16 Feb 2023 20:28:37 +0800
Message-ID: <0f9d94cb-e784-eaee-d081-b00c9a788548@huawei.com>
Date: Thu, 16 Feb 2023 20:28:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
 properties
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, <qemu-devel@nongnu.org>, Zhenyu Wang
 <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding
 <zhuocheng.ding@intel.com>, Robert Hoo <robert.hu@linux.intel.com>, Sean
 Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>, Zhao
 Liu <zhao1.liu@intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-43-zhao1.liu@linux.intel.com>
 <e8102ed2-35b6-0fc2-c20b-dbfca89ec50b@huawei.com>
 <Y+xJI1k6yoOh8g6l@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+xJI1k6yoOh8g6l@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/15 10:53, Zhao Liu 写道:
> On Tue, Feb 14, 2023 at 09:46:50AM +0800, wangyanan (Y) wrote:
>> Date: Tue, 14 Feb 2023 09:46:50 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
>>   properties
>>
>> Hi Zhao,
>>
>> 在 2023/2/13 17:50, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> Since hybrid cpu topology configuration can benefit not only x86, but
>>> also other architectures/platforms that have supported (in real
>>> machines) or will support hybrid CPU topology, "-hybrid" can be generic.
>>>
>>> So add the generic topology property to configure if support hybrid
>>> cpu topology for architectures/platforms in SmpCompatProps.
>>>
>>> Also rename SmpCompatProps to TopoCompatProps to make this structure
>>> more generic for both smp topology and hybrid topology.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    include/hw/boards.h | 15 +++++++++++----
>>>    1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>> index 34ec035b5c9f..17be3485e823 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -127,19 +127,26 @@ typedef struct {
>>>    } CPUArchIdList;
>>>    /**
>>> - * SMPCompatProps:
>>> - * @prefer_sockets - whether sockets are preferred over cores in smp parsing
>>> + * TopoCompatProps:
>>> + * @hybrid_support - whether hybrid cpu topology are supported by machine.
>> inconsistent with the name in the definition below.
> Thanks! Will fix.
>
>>> + *                   Note that hybrid cpu topology requires to specify the
>>> + *                   topology of each core so that there will no longer be
>>> + *                   a default core topology, thus prefer_sockets won't work
>>> + *                   when hybrid_support is enabled.
>>> + * @prefer_sockets - whether sockets are preferred over cores in smp parsing.
>>> + *                   Not work when hybrid_support is enabled.
>>>     * @dies_supported - whether dies are supported by the machine
>>>     * @clusters_supported - whether clusters are supported by the machine
>>>     * @has_clusters - whether clusters are explicitly specified in the user
>>>     *                 provided SMP configuration
>>>     */
>>>    typedef struct {
>>> +    bool hybrid_supported;
>>>        bool prefer_sockets;
>>>        bool dies_supported;
>>>        bool clusters_supported;
>>>        bool has_clusters;
>>> -} SMPCompatProps;
>>> +} TopoCompatProps;
>> Also here. "Rename SMPCompatProps to TopoCompatProps and
>> move it to cpu-topology.h and adapt the code" should be organized
>> in one or more separate patches, being pre-patches together with
>> the conversion of CpuTopology before.
> Do you think TopoCompatProps/SMPCompatProps should also be moved
> into cpu-topology.h? It seems that SMPCompatProps is a collection
> of properties of MachineClass.
TopoCompatProps holds properties all about CPU topology, I think we
can do this, cpu-topology.h will be included in boards.h any way. But it's
ups to you whether to do this.😉

Thanks,
Yanan
>> And put the "hybrid_supported"
>> extension into another patch. Would this make it easier to review?
> Yes, I agree. Thanks!
>
> Zhao
>
>> Thanks,
>> Yanan
>>>    /**
>>>     * MachineClass:
>>> @@ -281,7 +288,7 @@ struct MachineClass {
>>>        bool nvdimm_supported;
>>>        bool numa_mem_supported;
>>>        bool auto_enable_numa;
>>> -    SMPCompatProps smp_props;
>>> +    TopoCompatProps smp_props;
>>>        const char *default_ram_id;
>>>        HotplugHandler *(*get_hotplug_handler)(MachineState *machine,


