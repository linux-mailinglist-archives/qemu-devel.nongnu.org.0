Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAF115E54
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Dec 2019 20:58:47 +0100 (CET)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idgE1-00045k-It
	for lists+qemu-devel@lfdr.de; Sat, 07 Dec 2019 14:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1idgDB-0003Tu-QV
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 14:57:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1idgDA-0006ia-T0
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 14:57:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:46610 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1idgD8-0006An-9K; Sat, 07 Dec 2019 14:57:50 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BC182A40469D3AC3E506;
 Sat,  7 Dec 2019 20:10:41 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 7 Dec 2019
 20:10:31 +0800
Subject: Re: [RESEND PATCH v21 1/6] hw/arm/virt: Introduce a RAS machine option
To: Peter Maydell <peter.maydell@linaro.org>, Xiang Zheng
 <zhengxiang9@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-2-zhengxiang9@huawei.com>
 <CAFEAcA8fkc+0RhOH7780sREPUOaCvE-rpUkwFN0-hwsVD7RiMg@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <8219fac5-107c-32de-e9d2-2178bd8639a8@huawei.com>
Date: Sat, 7 Dec 2019 20:10:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fkc+0RhOH7780sREPUOaCvE-rpUkwFN0-hwsVD7RiMg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Marcelo Tosatti <mtosatti@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Laszlo Ersek <lersek@redhat.com>, Richard
 Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
> I think we could make the user-facing description of
> the option a little clearer: something like
> "Set on/off to enable/disable reporting host memory errors
> to a KVM guest using ACPI and guest external abort exceptions"
> 
> ?
Peter, sorry for the late response.
sure, we have already updated it, and will send PATCH V22.

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> .
> 


