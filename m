Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606B55078
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 15:36:14 +0200 (CEST)
Received: from localhost ([::1]:60290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hflcL-00039d-6m
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 09:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <gengdongjiu@huawei.com>) id 1hflWR-0000oT-8z
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1hflWO-0006OE-UA
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:30:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42042 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1hflWM-0006Hz-DM; Tue, 25 Jun 2019 09:30:02 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 169C71F4372C443137A0;
 Tue, 25 Jun 2019 21:29:56 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Jun 2019
 21:29:49 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
 <1557832703-42620-2-git-send-email-gengdongjiu@huawei.com>
 <20190620140409.3c713760@redhat.com>
 <fbd558d5-03b7-df5c-e781-549261207221@huawei.com>
 <20190625151616.12e46566@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <a4b5706f-a8f0-0a20-b77e-4cb250159ccb@huawei.com>
Date: Tue, 25 Jun 2019 21:29:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190625151616.12e46566@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [PATCH v17 01/10] hw/arm/virt: Add RAS platform
 version for migration
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 linuxarm@huawei.com, shannon.zhaosl@gmail.com, zhengxiang9@huawei.com,
 qemu-arm@nongnu.org, james.morse@arm.com, xuwei5@huawei.com,
 jonathan.cameron@huawei.com, pbonzini@redhat.com, lersek@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/6/25 21:16, Igor Mammedov wrote:
>>> In light of the race for leaner QEMU and faster startup times,
>>> it might be better to make RAS optional and make user explicitly
>>> enable it using a machine option.  
>> I will add a machine option to make RAS optional, do you think we should enable or disable it by default? I think it is better if we enable it by default.
> I'd start with disabled by default as it's easy to make it
> enabled by default later and we can't do so other way around.
ok

> 
>  
>>>   
>>>>  }
>>>>  DEFINE_VIRT_MACHINE(4, 0)
>>>>  
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt


