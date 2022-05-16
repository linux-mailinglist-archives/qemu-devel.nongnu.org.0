Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF8527E82
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:25:07 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqV6H-000589-N5
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV0H-0002XZ-7v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:18:53 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:57409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV0E-0007ki-LV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:18:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BE80D10028BA5;
 Mon, 16 May 2022 09:18:47 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:18:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004414e1081-a4cc-42b5-a69a-8b30e13c60b0,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Date: Mon, 16 May 2022 09:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 094042a1-8b3c-4f36-9b88-f7553e5c10c3
X-Ovh-Tracer-Id: 18074915631893023666
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihedvvedtteeutdfgvedtudffveetueeiieefgfefkeehvdelhfeuvdfhjedthfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 08:23, Peter Delevoryas wrote:
> v2:
> - Rebased on Cedric's irq proposal. [1]
> - Added "Introduce common UART init function" patch
> - Added "Add uarts_num SoC attribute" patch
> - Rewrote last commit's message for clarity

Looks good to me.

> I tried testing this by running acceptance tests, particularly the
> boot_linux_console.py file, but I had to disable the raspi2_initrd case.
> It's not related to my changes (A/B tested and it fails on upstream/master
> too), but thought I would mention that.>
> I also manually tested several machines:
> 
> AST2400: https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> AST2500: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fby3.mtd
> AST2600: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> 
> [1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@kaod.org/
I have quite a few images which I run manually. OpenBMC is providing
images, Aspeed also. Joel did a small tool for the IBM rainier :

   https://github.com/shenki/qemu-boot-test

Having an automated framework for Aspeed machines pulling images
from different places would be nice but we cannot put all under
QEMU.


I like the buildroot CI using the QEMU boards. See a pipeline example:

   https://gitlab.com/legoater/buildroot/-/pipelines/539559209

but that's buildroot only and integrating a custom uboot might be
difficult.

For my ppc needs, I did a quick-and-dirty non-regression test suite :

   https://github.com/legoater/qemu-ppc-boot


Anyway, I haven't found a solution nor spent much time on it but
I am interested !


C.




> 
> Peter Delevoryas (5):
>    hw: aspeed: Add missing UART's
>    hw: aspeed: Add uarts_num SoC attribute
>    hw: aspeed: Ensure AST1030 respects uart-default
>    hw: aspeed: Introduce common UART init function
>    hw: aspeed: Init all UART's with serial devices
> 
>   hw/arm/aspeed_ast10x0.c     | 32 +++++++++++++++++++++++++++-----
>   hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++++++-----
>   hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++++----
>   include/hw/arm/aspeed_soc.h | 10 ++++++++++
>   4 files changed, 88 insertions(+), 14 deletions(-)
> 


