Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C667D8670
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 05:27:36 +0200 (CEST)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKZyI-0001If-Ud
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 23:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1iKZxH-0000Rx-OJ
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 23:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1iKZxG-0005Kb-HO
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 23:26:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2180 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1iKZxD-0005F2-ID; Tue, 15 Oct 2019 23:26:27 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 83F0FEC8CDB2DA02A902;
 Wed, 16 Oct 2019 11:26:22 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 11:26:13 +0800
Subject: Re: [PATCH v19 2/5] docs: APEI GHES generation and CPER record
 description
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191015140140.34748-1-zhengxiang9@huawei.com>
 <20191015140140.34748-3-zhengxiang9@huawei.com>
 <CAFEAcA85gZUXnL+Qy=Wdg-MVbb1PqiKWCi72XvRnX8pZsgVr_A@mail.gmail.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <9724f69a-2887-7896-29d8-3e9aa022df14@huawei.com>
Date: Wed, 16 Oct 2019 11:26:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA85gZUXnL+Qy=Wdg-MVbb1PqiKWCi72XvRnX8pZsgVr_A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Marcelo Tosatti <mtosatti@redhat.com>, Linuxarm <linuxarm@huawei.com>, QEMU
 Developers <qemu-devel@nongnu.org>, gengdongjiu <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 James Morse <james.morse@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/10/15 23:08, Peter Maydell wrote:
> On Tue, 15 Oct 2019 at 15:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> Add APEI/GHES detailed design document
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  docs/specs/acpi_hest_ghes.rst | 94 +++++++++++++++++++++++++++++++++++++++++++
>>  docs/specs/index.rst          |  1 +
>>  2 files changed, 95 insertions(+)
>>  create mode 100644 docs/specs/acpi_hest_ghes.rst
>>
>> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
>> new file mode 100644
>> index 0000000..905b6d1
>> --- /dev/null
>> +++ b/docs/specs/acpi_hest_ghes.rst
>> @@ -0,0 +1,94 @@
>> +APEI tables generating and CPER record
>> +======================================
>> +
>> +Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
>> +
>> +This work is licensed under the terms of the GNU GPL, version 2 or later.
>> +See the COPYING file in the top-level directory.
> 
> This puts the copyright/license statement into the HTML rendered
> docs seen by the user. We generally put them into an RST comment,
> so they're in the source .rst but not the rendered views, like this:
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index 5b43e4b0da2..348825f9d3e 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -1,10 +1,11 @@
>  APEI tables generating and CPER record
>  ======================================
> 
> -Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
> +..
> +   Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
> 
> -This work is licensed under the terms of the GNU GPL, version 2 or later.
> -See the COPYING file in the top-level directory.
> +   This work is licensed under the terms of the GNU GPL, version 2 or later.
> +   See the COPYING file in the top-level directory.
> 

OK.

> 
>> +(9) When QEMU gets a SIGBUS from the kernel, QEMU formats the CPER right into
>> +    guest memory, and then injects platform specific interrupt (in case of
>> +    arm/virt machine it's Synchronous External Abort) as a notification which
>> +    is necessary for notifying the guest.
>> +
>> +(10) This notification (in virtual hardware) will be handled by the guest
>> +    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
>> +    do the recovery.
> 
> Sphinx thinks the indentation here is not syntactically valid:
> 
>   SPHINX  docs/specs
> 
> Warning, treated as error:
> /home/petmay01/linaro/qemu-from-laptop/qemu/docs/specs/acpi_hest_ghes.rst:93:Enumerated
> list ends without a blank line; unexpected unindent.
> Makefile:997: recipe for target 'docs/specs/index.html' failed
> 
> That's because for an enumerated list all the lines in the paragraph need to
> start at the same column. Moving in the two following lines in the (10) item
> fixes this:
> 
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -90,5 +90,5 @@ Design Details
>      is necessary for notifying the guest.
> 
>  (10) This notification (in virtual hardware) will be handled by the guest
> -    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
> -    do the recovery.
> +     kernel, guest APEI driver will read the CPER which is recorded by QEMU and
> +     do the recovery.
> 

Thanks, I will fix them.


-- 

Thanks,
Xiang


