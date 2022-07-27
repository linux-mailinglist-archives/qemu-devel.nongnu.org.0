Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3E58223F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:35:33 +0200 (CEST)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcVt-0004BD-ST
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oGcPd-00009n-DE
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:29:01 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:42465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oGcPZ-0001oB-8z
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:29:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1C6C220A62;
 Wed, 27 Jul 2022 08:28:47 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 27 Jul
 2022 10:28:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ebc09e51-502e-4a3b-8938-89a0c14635b2,
 D92FAF4A07D3D917E7F8426E5A0F17E38A049A7F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a7f02b8a-a132-5b8f-6ceb-0d6920ce2a22@kaod.org>
Date: Wed, 27 Jul 2022 10:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>, Daniel
 Henrique Barboza <danielhb413@gmail.com>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220726182341.1888115-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b741d1cf-888a-430e-93e7-5f30d1222390
X-Ovh-Tracer-Id: 17815677178140003235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevudehheeggeehvdetuedvieeugfelgedujeelvdelveehvddtjeeiveetteegffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgrrhhoshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 7/26/22 20:23, Peter Maydell wrote:
> This patchset is mainly trying to fix a problem that Coverity spotted
> in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the code
> is not correctly using the cpu_physical_memory_map() function.
> While I was fixing that I noticed a second problem in this code,
> where it doesn't have a fallback for when cpu_physical_memory_map()
> says "I couldn't map that for you".
> 
> I've marked these patches as RFC, partly because I don't have any
> guest that would exercise the code changes[*], 

I build these :

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot/qemu_ppc_sam460ex-2022.02-4-geae5011c83-20220309

but none of the DCR DMA registers are used.

There are images for the sam460ex images here :

   http://www.aros.org/nightly1.php

But AFAICT, it does not go beyond the bootloader.

> and partly because
> I don't have any documentation of the hardware to tell me how it
> should behave, so patch 2 in particular has some FIXMEs. I also
> notice that the code doesn't update any of the registers like the
> count or source/base addresses when the DMA transfer happens, which
> seems odd, but perhaps the real hardware does work like that.
> 
> I think we should probably take patch 1 (which is a fairly minimal
> fix of the use-of-uninitialized-data problem),

LGTM,

Thanks,

C.




> but patch 2 is a bit more unfinished.
> 
> [*] The commit 3c409c1927efde2fc that added this code says it's used
> by AmigaOS.)
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    hw/ppc/ppc440_uc: Initialize length passed to
>      cpu_physical_memory_map()
>    hw/ppc/ppc440_uc: Handle mapping failure in DMA engine
> 
>   hw/ppc/ppc440_uc.c | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
> 


