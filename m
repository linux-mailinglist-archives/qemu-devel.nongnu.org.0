Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C4461CEE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:44:35 +0100 (CET)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkhd-0006Kz-5T
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:44:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrkfJ-0005ZB-Vu
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:42:09 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:56437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrkfH-0004y7-J4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:42:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 03961204A6;
 Mon, 29 Nov 2021 17:41:59 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 18:41:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0046ebc8cb6-f0cf-4956-b61a-b319979f575d,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <6cb13d9c-bb31-c177-c914-33b182b35894@kaod.org>
Date: Mon, 29 Nov 2021 18:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: SME : Please review and merge : hw/arm/aspeed: Added eMMC boot
 support for AST2600 image.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Shitalkumar Gandhi
 <shital_909@yahoo.com>
References: <253794259.1853610.1636478714403.ref@mail.yahoo.com>
 <253794259.1853610.1636478714403@mail.yahoo.com>
 <CAFEAcA-0KLYpEVzaok77kyzq2BGfXtzTSrH3JFcTU_gKvFnQ5w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA-0KLYpEVzaok77kyzq2BGfXtzTSrH3JFcTU_gKvFnQ5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fa295525-d59c-47fb-af65-7e0378a31715
X-Ovh-Tracer-Id: 1217942226335861667
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefiedukefhueejteffvedthffhkeehhefhtdejkeefheeifeejvdfgfffgieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 11/29/21 18:20, Peter Maydell wrote:
> On Tue, 9 Nov 2021 at 18:04, Shitalkumar Gandhi <shital_909@yahoo.com> wrote:
>>
>> Hi SME's,
>>
>> Please see the attached patch, which has been added to the boot eMMC image for AST2600 machine on QEMU.
>>
>> qemu should be run as follows:
>>
>> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
>> file=mmc-evb-ast2600.img,format=raw,if=sd,index=2
>>
>> Tested: Booted AST2600 eMMC image on QEMU.
>>
>> Suggested-by: Troy Lee leetroy@gmail.com
>> Reviewed-by: Troy Lee leetroy@gmail.com
>> Reviewed-by: Andrew Jeffery andrew@aj.id.au
>> Signed-off-by: Shitalkumar Gandhi shitalkumar.gandhi@seagate.com
> 
> Hi; thanks for this patch.
> 
> Fishing the patch out of the attachment, the diff is:

Yes. A pull request was sent here also :
  
   https://github.com/openbmc/qemu/pull/35

The patch is based on the OpenBMC QEMU branch which includes a large
change adding eMMC support to the SD model. But without the eMMC
model upstream, it's pointless, we can only boot from flash.

For the time being, a "boot-emmc" machine option to set/unset the emmc
boot should be enough. It's all in my branch. I think the right approach
would be to use the boot index of the device on the command line to
change the hw strapping.

Thanks,

C.


> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ba5f1dc5af..6a890adb83 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>           SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
> 
>   /* AST2600 evb hardware value */
> -#define AST2600_EVB_HW_STRAP1 0x000000C0
> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 | AST26500_HW_STRAP_BOOT_SRC_EMMC)
>   #define AST2600_EVB_HW_STRAP2 0x00000003
> 
>   /* Tacoma hardware value */
> 


