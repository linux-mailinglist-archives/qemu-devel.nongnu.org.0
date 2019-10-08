Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DABCFB4E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 15:27:34 +0200 (CEST)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHpWX-0000rr-RY
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 09:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1iHpV1-0000Du-I6
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1iHpV0-0000uQ-FB
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:25:59 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56290 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1iHpUx-0000kB-Ml; Tue, 08 Oct 2019 09:25:55 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3AF3468A6E58B3089D74;
 Tue,  8 Oct 2019 21:25:51 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 21:25:44 +0800
Subject: Re: [Qemu-devel] [PATCH v18 2/6] docs: APEI GHES generation and CPER
 record description
To: Igor Mammedov <imammedo@redhat.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-3-zhengxiang9@huawei.com>
 <20191004102051.4e45cbd2@redhat.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <70a22014-27f8-0fd0-3547-e814bd1a822a@huawei.com>
Date: Tue, 8 Oct 2019 21:25:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191004102051.4e45cbd2@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, wanghaibin.wang@huawei.com, mtosatti@redhat.com,
 linuxarm@huawei.com, qemu-devel@nongnu.org, gengdongjiu@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, james.morse@arm.com,
 xuwei5@huawei.com, jonathan.cameron@huawei.com, pbonzini@redhat.com,
 lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

Thanks for your review!

On 2019/10/4 16:20, Igor Mammedov wrote:
> On Fri, 6 Sep 2019 16:31:48 +0800
> Xiang Zheng <zhengxiang9@huawei.com> wrote:
> 
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
> [...]
>> +
>> +(9) When QEMU gets SIGBUS from the kernel, QEMU formats the CPER right into
>> +    guest memory, and then injects whatever interrupt (or assert whatever GPIO
> s/whatever .../platform specific/
> 
> and add concrete impl info like:
>   "in case of arm/virt machine it's ..."

OK, I will add the concrete impl info.

> 
>> +    line) as a notification which is necessary for notifying the guest.
> [...]
> 
> .
> 

-- 

Thanks,
Xiang


