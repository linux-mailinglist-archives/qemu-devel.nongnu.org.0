Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AA100701
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 15:06:29 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWhfg-0003wN-JS
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 09:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iWheb-0002vW-5A
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iWheU-00068S-0c
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:05:19 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:42916 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iWheN-0005xl-F3; Mon, 18 Nov 2019 09:05:07 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 797483DE5C60F08CB2BF;
 Mon, 18 Nov 2019 22:05:01 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 22:04:54 +0800
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
 <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <be5d5996-0329-a34f-7528-503b98b112a4@huawei.com>
Date: Mon, 18 Nov 2019 22:04:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks a lot. Please take your time.

HG


On 2019/11/18 21:35, Peter Maydell wrote:
> On Mon, 18 Nov 2019 at 06:55, Guoheyi <guoheyi@huawei.com> wrote:
>> Hi Peter,
>>
>> Could you spare some time to review the framework and provide comments
>> and advice?
> This patchset is on my to-review list but there are also
> a lot of others on that list...
>
> thanks
> -- PMM
>
> .
>



