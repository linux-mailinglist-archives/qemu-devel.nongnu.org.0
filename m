Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286910DC4A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 04:49:13 +0100 (CET)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iatkt-0002zx-Jx
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 22:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iatja-0002T9-Rn
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 22:47:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iatjZ-00007J-KU
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 22:47:50 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:45896 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iatjW-0008PT-SQ; Fri, 29 Nov 2019 22:47:47 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 113F89A65A6B2CC338E6;
 Sat, 30 Nov 2019 11:47:40 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 30 Nov 2019
 11:47:32 +0800
Subject: Re: [Qemu-devel] [PATCH v5 0/2] arm/acpi: simplify aml code and
 enable SHPC
To: Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
 <20190312170859.73f0de9d@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <ca5ccc80-663f-83e6-d9ce-4d5e3749988d@huawei.com>
Date: Sat, 30 Nov 2019 11:47:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190312170859.73f0de9d@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Igor,

I couldn't find these 2 patches in the latest tree. Could you help to 
merge them?

Thanks,

HG


On 2019/3/13 0:09, Igor Mammedov wrote:
> On Sat, 9 Mar 2019 10:30:47 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
>> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
>> enable SHPC native hot plug.
> Peter,
>   could you queue it via your tree?
>
>> Igor also spotted the store operation outside of bit and/or is not necessary, so
>> simply the code at first.
>>
>> v5:
>> - Refine commit message of patch 1/2
>>
>> v4:
>> - Improve the code indention.
>>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>>
>>
>>
>> Heyi Guo (2):
>>    hw/arm/acpi: simplify AML bit and/or statement
>>    hw/arm/acpi: enable SHPC native hot plug
>>
>>   hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>
> .
>



