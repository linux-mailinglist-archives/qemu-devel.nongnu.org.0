Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4D637C55
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 15:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyDgq-0002mH-Sv; Thu, 24 Nov 2022 09:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyang281@huawei.com>)
 id 1oy5pR-0002YM-MS; Thu, 24 Nov 2022 01:35:21 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyang281@huawei.com>)
 id 1oy5pP-0001LR-33; Thu, 24 Nov 2022 01:35:21 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHpB90BCkzHw4g;
 Thu, 24 Nov 2022 14:34:25 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 14:35:02 +0800
Received: from [10.110.47.166] (10.110.47.166) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 14:35:01 +0800
Message-ID: <a80f31eb-f77b-1e66-b34e-4078200e7a24@huawei.com>
Date: Thu, 24 Nov 2022 14:35:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: arm: gdb-stub is broken by FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Changbin Du
 <changbin.du@huawei.com>
CC: Richard Henderson <richard.henderson@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Hui Wang <hw.huiwang@huawei.com>
References: <20221124033802.meuiphlcskwu3aty@M910t>
 <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.110.47.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=liyang281@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 24 Nov 2022 09:58:58 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  "liyang (CJ)" <liyang281@huawei.com>
From:  "liyang (CJ)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2022/11/23 19:59, Peter Maydell wrote:
> On Wed, 23 Nov 2022 at 11:38, Changbin Du <changbin.du@huawei.com> wrote:
>>
>> Hello, Richard,
>> We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
>> ("target/arm: Plumb debug into S1Translate").
>>
>> (gdb) target remote :1234
>> Remote debugging using :1234
>> 0x000000000e1716d0 in ?? ()
>> => 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0
> 
> Hi -- is this fixed by commit 26ba00cf58e9f21b08f (just landed
> upstream last night) ?
> 
I pulled the mainline  which contains your commit 26ba00cf58e9f21b08f.
The problem is fixed.

Thank you very much.
> thanks
> -- PMM

