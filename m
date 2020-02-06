Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37588153CC4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 02:47:01 +0100 (CET)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izWFw-0003xl-9H
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 20:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1izVqO-0003Ss-Ht
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1izVqN-0002Jq-FR
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:20:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2697 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1izVqL-0001Xg-1P; Wed, 05 Feb 2020 20:20:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 371BABC200ABA29A102D;
 Thu,  6 Feb 2020 09:20:28 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 6 Feb 2020 09:20:20 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Marc Zyngier <maz@kernel.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
Date: Thu, 6 Feb 2020 09:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <350aa4ca1b57a466ed882236caf23051@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.173.221.228]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James
 Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 2020/2/5 21:15, Marc Zyngier wrote:
> Hi Heyi,
>
> On 2020-02-04 08:26, Heyi Guo wrote:
>> Update Marc's email address.
>>
>> +cc Gavin as he is posting a RFC for ARM NMI.
>>
>> Hi Marc,
>>
>> Really sorry for missing to update your email address, for the initial
>> topic was raised long time ago and I forgot to update the Cc list in
>> the commit message of the patches.
>>
>> Thanks Gavin for forwarding current discussion on ARM NMI to me.
>>
>> For you said SDEI is "horrible", does it mean we'd better never
>> implement SDEI in virtual world? Or do you have any advice on how to
>> implement it?
>
> My concern is that SDEI implies having EL3. EL3 not being virtualizable
> with KVM, you end-up baking SDEI in *hardware*. Of course, this hardwar=
e
> is actually software (it is QEMU), but this isn't the way it was=20
> intended.

>
> It's not the first time we've done that (PSCI is another example), but=20
> the
> logic behind SDEI looks much more invasive.

Thanks for your comments.

Thinking about them for quite a while, below is my understanding, please=20
correct me if I'm wrong:

So should the KVM based virtual machine be treated as one with CPUs only=20
having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model, isn't i=
t?

PSCI only contains some one-shot operations, so it is much less invasive=20
than SDEI.


I've another question. The origin of "virtual" SDEI requirement comes=20
from the lack of hard lockup detector in VM. We can have some kind of=20
watchdog, but how can the watchdog trigger the VM OS to panic and run=20
kdump, even in irq-off state?

Thanks,

Heyi

>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M.


