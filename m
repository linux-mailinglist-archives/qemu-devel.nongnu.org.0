Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB3557E77
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:12:02 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OUz-0001R8-Sz
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4OSv-0008Qd-Aq
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:09:53 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4OSt-0005vi-5d
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:09:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4DE1611059C02;
 Thu, 23 Jun 2022 17:09:46 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 17:09:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059f4c54c9-d024-45c3-8745-8ed4cc28c296,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <faba2fe7-0296-2e76-9f20-e41e159f359d@kaod.org>
Date: Thu, 23 Jun 2022 17:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 01/14] sysbus: Remove sysbus_mmio_unmap
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <pbonzini@redhat.com>, <berrange@redhat.com>, <eduardo@habkost.net>,
 <"i.mitsyanko@gmail.com.mst"@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <richard.henderson@linaro.org>, <f4bug@amsat.org>, <ani@anisinha.ca>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>
References: <20220623095825.2038562-1-pdel@fb.com>
 <20220623095825.2038562-2-pdel@fb.com>
Content-Language: en-US
In-Reply-To: <20220623095825.2038562-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 808c79e5-f4c2-4436-ac52-07d2351cc492
X-Ovh-Tracer-Id: 9383812776294583169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvhffhvdehgfelvddtjeeuleevfeettdejgeetuedtveettedufeefueefvdetgfenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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

On 6/23/22 11:58, Peter Delevoryas wrote:
> Cedric removed usage of this function in a previous commit.
> 
> Fixes: 981b1c6266c6 ("spapr/xive: rework the mapping the KVM memory regions")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/core/sysbus.c    | 10 ----------
>   include/hw/sysbus.h |  1 -
>   2 files changed, 11 deletions(-)
> 
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 05c1da3d31..637e18f247 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -154,16 +154,6 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
>       }
>   }
>   
> -void sysbus_mmio_unmap(SysBusDevice *dev, int n)
> -{
> -    assert(n >= 0 && n < dev->num_mmio);
> -
> -    if (dev->mmio[n].addr != (hwaddr)-1) {
> -        memory_region_del_subregion(get_system_memory(), dev->mmio[n].memory);
> -        dev->mmio[n].addr = (hwaddr)-1;
> -    }
> -}
> -
>   void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
>   {
>       sysbus_mmio_map_common(dev, n, addr, false, 0);
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 3564b7b6a2..153ef20695 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -82,7 +82,6 @@ qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
>   void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
>   void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                                int priority);
> -void sysbus_mmio_unmap(SysBusDevice *dev, int n);
>   void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
>                      MemoryRegion *mem);
>   MemoryRegion *sysbus_address_space(SysBusDevice *dev);


