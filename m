Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E161B12768A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 08:35:41 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiCp2-0002ou-Nm
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 02:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzenghui@huawei.com>) id 1iiCo2-0001zw-0N
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 02:34:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuzenghui@huawei.com>) id 1iiCo1-0000J1-1L
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 02:34:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2226 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuzenghui@huawei.com>)
 id 1iiCny-0008IH-Ay; Fri, 20 Dec 2019 02:34:34 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3DF20FFEDCEF0B4DF2E7;
 Fri, 20 Dec 2019 15:34:29 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 15:34:22 +0800
Subject: Re: [kvm-unit-tests PATCH 05/16] arm/arm64: ITS: Introspection tests
To: Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-6-eric.auger@redhat.com>
 <c133ebe6-10f4-2ff7-f75f-75b755397785@huawei.com>
 <6542297b-74d2-f3c2-63d8-04bb284414df@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <c164db0f-2e18-093f-8886-4746cb197fe2@huawei.com>
Date: Fri, 20 Dec 2019 15:34:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <6542297b-74d2-f3c2-63d8-04bb284414df@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
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
Cc: andre.przywara@arm.com, drjones@redhat.com, alexandru.elisei@arm.com,
 thuth@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2019/12/18 16:34, Auger Eric wrote:
> Hi Zenghui,
> 
> On 12/18/19 4:46 AM, Zenghui Yu wrote:
>> Hi Eric,
>>
>> I have to admit that this is the first time I've looked into
>> the kvm-unit-tests code, so only some minor comments inline :)
> 
> no problem. Thank you for looking at this.
> 
> By the way, with patch 16 I was able to test yout fix: "KVM: arm/arm64:
> vgic: Don't rely on the wrong pending table". Reverting it produced an
> error.

which is great! Thanks for your work!


Zenghui


