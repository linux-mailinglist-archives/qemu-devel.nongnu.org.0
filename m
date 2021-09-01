Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43D83FD3F2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:46:17 +0200 (CEST)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLK0m-0005ye-Rm
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLJzM-0004xZ-PY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:44:48 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:53319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLJzK-00011Z-M1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:44:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 0AD9D294B8C;
 Wed,  1 Sep 2021 08:44:42 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 08:44:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b2900c0a-3fc1-4ad3-a5f9-9fe606980e89,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
To: <pdel@fb.com>
References: <20210831233140.2659116-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <af023c9a-8ec5-27ec-9055-089969c88d1a@kaod.org>
Date: Wed, 1 Sep 2021 08:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831233140.2659116-1-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11fc943b-df1c-415b-b951-ed220c56ef06
X-Ovh-Tracer-Id: 2403233355025582956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgvdetkeduffeuvdelheektdetteelhedtvddtvefhteeuffejfeeltedvhefgheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, andrew@aj.id.au,
 qemu-devel@nongnu.org, f4bug@amsat.org, patrick@stwcx.xyz, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 1:31 AM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This is a follow-up to a discussion in a previous series I sent:
> 
> https://lore.kernel.org/qemu-devel/20210827210417.4022054-1-pdel@fb.com/
> 
> I tried to add a new machine type called Fuji that required the ability
> to specify the UART connected to the first serial device on the command
> line (serial_hd(0)).
> 
> After some discussion, we concluded that we could add a serial_dev
> option to the machine class and the SoC to support this:
> 
> https://lore.kernel.org/qemu-devel/a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org/
> 
> I didn't follow Cedric's advice _exactly_, so let me know if you have
> suggestions. I used "uint32_t serial_hd0", because I think it more
> clearly indicates that this is the device to connect to the first serial
> device, serial_hd(0).

I don't have a strong opinion on the name but it is part of the user
API and can be set from the command line  : 

  -global driver=ast2600-a3,property=serial-hd0,value=5

I would prefer something like "uart-default" which makes more sense.

> Also, I didn't know how to transfer data from the machine class to the
> device state, so I just added the attribute to the machine class and
> used 'qdev_get_machine' to within aspeed_soc_realize() based on some
> code I found in hw/ppc/spapr_cpu_core.c. 

This is called from the reset execution path which is a bit special.
The use of qdev_get_machine() should be avoided when possible. 

> I expect that I'm missing
> something, I've just been having some trouble figuring out the QEMU
> object model.

Look at the "dram" property of the SoC.

Thanks,

C. 

> If this patch is accepted, I can follow-up with another patch adding the
> fuji machine type with "serial_hd0 = ASPEED_DEV_UART1".
> 
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>   hw/arm/aspeed: Allow machine to set serial_hd(0)
> 
>  hw/arm/aspeed.c         |  1 +
>  hw/arm/aspeed_ast2600.c | 11 +++++++----
>  hw/arm/aspeed_soc.c     |  9 ++++++---
>  include/hw/arm/aspeed.h |  1 +
>  4 files changed, 15 insertions(+), 7 deletions(-)
> 


