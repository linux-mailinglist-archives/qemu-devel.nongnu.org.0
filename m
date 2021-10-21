Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27C435DEA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:27:37 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUMJ-00042p-O9
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdUK3-00034j-MI; Thu, 21 Oct 2021 05:25:15 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdUK0-0004Gk-KA; Thu, 21 Oct 2021 05:25:15 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZhly3M89zRZjc;
 Thu, 21 Oct 2021 17:20:30 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 17:25:04 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 17:25:04 +0800
Subject: Re: [PATCH v8 5/8] hw/acpi/aml-build: Add PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-6-wangyanan55@huawei.com>
 <316edbd3-2235-efb1-7176-e3f477aec6a4@redhat.com>
 <1f4eaecf-8718-fc8a-5366-7e32945b9953@huawei.com>
 <2651e5c8-8cd0-e912-2f62-f7393bf49aa3@redhat.com>
 <9c51d6bf-8ed4-6aff-c503-f123190efcae@huawei.com>
 <f6c0dc0b-aad7-bfe9-c355-9879ce6a798e@redhat.com>
 <97c13d4a-d464-015d-d901-cf93534cf0d6@huawei.com>
 <20211021090828.2nt6l55nrazzsa3d@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <80a49f6b-5cce-714b-5eaa-6007c1f394d9@huawei.com>
Date: Thu, 21 Oct 2021 17:25:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211021090828.2nt6l55nrazzsa3d@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Eric Auger <eauger@redhat.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/21 17:08, Andrew Jones wrote:
> On Wed, Oct 20, 2021 at 08:53:00PM +0800, wangyanan (Y) wrote:
>>>>>>> Table 5-149 of 6.2 spec (6.2 May 2017) tells the rev shall be 1. Or is
>>>>>>> it an erratum somewhere I did miss?
>>>>>> Yes, the revision in 6.2 spec is 1. And it's 2 in spec 6.3.
>>>>>> So just to be sure, should I use the oldest revision ?
>>>>> If you need (and use) features (such as flags) introduced in 6.3 then
>>>>> you should say the code complies with 6.3 and update the above comment.
>>>> The comment /* ACPI 6.2: 5.2.29 Processor Properties Topology Table
>>>> (PPTT) */
>>>> tried to explain the first spec version where PPTT is introduced is 6.2.
>>>> But it may
>>>> adds some confusion. I think it's better to replace it with:
>>>> /*
>>>>    * ACPI spec 5.2.29 Processor Properties Topology Table (PPTT)
>>>>    * (Revision 6.2 or later)
>>>>    */
>>>>
>>>> just like our build_slit().
>>> That's not my understanding. I think we usually point to the latest spec
>>> revision you comply with, ie. in that case 6.3 chapter ...
>> Ok, I get it. Would
>> /*
>>   * ACPI spec, Revision 6.3
>>   * 5.2.29 Processor Properties Topology Table (PPTT)
>>   */
>> be ok ?
>>
> Yes, we need to call out the oldest spec we can for the functionality
> we're using. In this case, we're using flags first defined in the 6.3
> spec, so we need to call out the 6.3 spec.
>
Agreed.

I have updated these comments as suggested in v9. And I just noticed
that Richard has taken that v9 into the target-arm tree.

Thanks,
Yanan


