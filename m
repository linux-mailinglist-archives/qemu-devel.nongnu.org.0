Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B477E1C8114
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 06:31:58 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWYCT-0001Cw-BU
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 00:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jWYBi-0000g1-EH; Thu, 07 May 2020 00:31:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3678 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jWYBg-0006IK-UB; Thu, 07 May 2020 00:31:09 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7DC8BE60F56FF9613629;
 Thu,  7 May 2020 12:30:58 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 12:30:50 +0800
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
 <da3cbdfd-a75d-c87f-3ece-616278aa64d5@huawei.com>
 <20200506162439-mutt-send-email-mst@kernel.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <934931d5-b8c5-66db-db3d-ea19bdfc30f9@huawei.com>
Date: Thu, 7 May 2020 12:30:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20200506162439-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-ACL-Warn: iank eggs.gnu.org
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:30:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, kvm-devel <kvm@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/5/7 4:25, Michael S. Tsirkin wrote:
> On Wed, May 06, 2020 at 07:42:19PM +0800, gengdongjiu wrote:
>> On 2020/4/17 21:32, Peter Maydell wrote:
>>> On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>>>
>>>> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
>>>> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
>>>> information of guest, so it is expected that guest can do the recovery. For example, if an
>>>> exception happens in a guest user-space application, host does not know which application
>>>> encounters errors, only guest knows it.
>>>>
>>>> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
>>>> After user space gets the notification, it will record the CPER into guest GHES
>>>> buffer and inject an exception or IRQ to guest.
>>>>
>>>> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
>>>> treat it as a synchronous exception, and notify guest with ARMv8 SEA
>>>> notification type after recording CPER into guest.
>>>
>>> Hi. I left a comment on patch 1. The other 3 patches unreviewed
>>> are 5, 6 and 8, which are all ACPI core code, so that's for
>>> MST, Igor or Shannon to review.
>>>
>>> Once those have been reviewed, please ping me if you want this
>>> to go via target-arm.next.
>>
>> Hi Peter,
>>    Igor have reviewed all ACPI core code. whether you can apply this series to target-arm.next I can make another patches to solve your comments on patch1 and another APCI comment.
>> Thanks very much in advance.
> 
> Given it all starts with patch 1, it's probably easier to address the
> comment and repost.

Ok, I will do it. thanks.

> 
> 
>>>
>>> thanks
>>> -- PMM
>>>
>>> .
>>>
> 
> .
> 


