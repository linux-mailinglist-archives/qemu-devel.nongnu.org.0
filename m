Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5C388F80
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:53:07 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMdG-0000ON-Eb
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljMRd-0006hD-V3; Wed, 19 May 2021 09:41:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljMRX-0003bP-3c; Wed, 19 May 2021 09:41:03 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FlYnr0S7szpfds;
 Wed, 19 May 2021 21:37:20 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 21:40:49 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 21:40:48 +0800
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
From: "wangyanan (Y)" <wangyanan55@huawei.com>
To: Andrew Jones <drjones@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <20210519082735.yru7wpusq7lnmgj5@gator.home>
 <4b64cb10-7825-e83c-8728-f9dde0d53b4b@huawei.com>
Message-ID: <1f85e21b-fd5f-1973-094b-66ba9e37ad6a@huawei.com>
Date: Wed, 19 May 2021 21:40:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b64cb10-7825-e83c-8728-f9dde0d53b4b@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/5/19 21:26, wangyanan (Y) wrote:
> Hi Drew,
>
> On 2021/5/19 16:27, Andrew Jones wrote:
>> On Tue, May 18, 2021 at 09:05:39PM +0200, Andrew Jones wrote:
>>> The problem is that -smp 4,maxcpus=8 doesn't error out today, even 
>>> though
>>> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out 
>>> either, but
>>> we're proposing that it should. Maybe we can start erroring out when
>>> cpus != maxcpus until hot plug is supported?
>>>
>> The more I think about this, the more I think we're in a bit of 
>> pickle and
>> need Peter Maydell to chime in. While we may want to make our -smp 
>> command
>> line option parsing more strict in order to bring some sanity to it, if
>> we do, then we'll break existing command lines, which, while may be
>> specifying useless inputs, have always gotten away with it. We probably
>> can't just change that now without forcing the user to opt into it.
>> Maybe we need to add another -smp parameter like 'strict' that has to
>> be set to 'on' in order to get this new behavior.
>>
>> Peter, do you have some suggestions for this? A summary of the problem
>> we'd like to solve is as follows:
>>
>>   We'd like to start describing CPU topology to guests when provided
>>   topology information with the '-smp ...' command line option. 
>> Currently,
>>   a user may provide nearly whatever it wants on that command line 
>> option
>>   and not get an error, even though the guest will not get a topology
>>   description. When building the topology its important to know what
>>   the user actually wants, so we're proposing to require both sockets
>>   and cores be given if one of them is given. Also, since we don't yet
>>   support hot plug for AArch64, we're proposing to enforce cpus == 
>> maxcpus.
>>
>> Is it fine to make those changes to the parsing for 6.1 and later? 
>> (Note,
>> mach-virt will override the default smp_parse with its own, so this is
>> mach-virt specific.) Or, should we only do this if a new parameter is
>> also given, e.g. 'strict'. Something like
>>
>>    -smp strict=on,cpus=4,sockets=2,cores=2
>>
>> would be needed by users who want to describe cpu topologies. Without
>> a strict description, then they get what they get today for their
>> DT/ACPI topology description, nothing.
> From my point of view, I like the idea of a new parameter like 
> "strict=on/off".
> I will explain the reason below but maybe I have missed something, so 
> I also
> hope for some suggestions from Peter. :)
>
> 1) We don't need to worry about breaking any existing -smp command lines
> including the rare and strange ones any more, since we will only have 
> more
> strict requirement for the new provided cmdlines with "strict=on" and 
> only
> generate topology description to guest with these new cmdlines provided.
>
> 2) This will provide an option for users to decide whether to enable 
> the feature
> or not. Furthermore, this feature can also work on older machine 
> types, if a user
> want to make use of cpu topology exposure to guest on older machines 
> and is
> also sure it won't affect the application's behavior, then he can read 
> the Doc and
> properly provided a -smp cmdline with "strict=on" to boot a VM.
>
> 3) We don't need to bother guessing different formats of -smp command 
> lines
> in parsing. If the new parameter is not specified or "strict=off" is 
> provided, we
> totally follow the rules in smp_parse() and disable the topology 
> exposure. And if
> "strict=on" is provided, we enable the topology exposure and enforce 
> completely
> detailed configuration like "-smp strict=on,cpus=4,sockets=2,cores=2".
IMO, threads should also be required here.
Libvirt requires all of them if one of sockets/cores/threads is provided.
So if we hope to be consistent with Libvirt, the required configuration
should at least "-smp strict=on,cpus=4,sockets=2,cores=2,threads=1".

Thanks,
Yanan
>
> But maxcpus will be optional, it will default to cpus if not provided. 
> We also ensure
> it matches cpus if provided, given that cpu hotplug is not available yet.
>
> Thanks,
> Yanan
>> Thanks,
>> drew
>>
>> .

