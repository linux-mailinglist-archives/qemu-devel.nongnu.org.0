Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1CB41962A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:22:22 +0200 (CEST)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrWP-0002Hz-B3
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUrQB-0000K3-Bb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:15:58 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:34537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUrQ7-00009Z-Lt
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:15:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6A10A20F05;
 Mon, 27 Sep 2021 14:15:47 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 16:15:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005a8c57a55-5702-493e-a749-d36f50e12823,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4b2c7f4f-f2b5-7990-bcdc-5f9fb19418b4@kaod.org>
Date: Mon, 27 Sep 2021 16:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Shitalkumar
 Gandhi <shitalkumar.gandhi@seagate.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
 <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 082dc7fb-8c34-4239-8558-01c7e37e40a7
X-Ovh-Tracer-Id: 15137442775970974572
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedtgfduudfgledvteevkeehfeeugfevvdekfffhkeffgffhtdffgfdvheekjeefnecuffhomhgrihhnpehqvghmuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 9/26/21 09:59, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 9/25/21 19:07, Shitalkumar Gandhi via wrote:
>> Hi,
>>
>> I am attaching a patch that will fix eMMC image booting on QEMU for
>> AST2600 machine, without this patch it will be stuck after SPL saying,
>> "booting from RAM".
>>
>> Please review and merge, thanks.
>>
>> Let me know in case of any concern.
> 
> Thanks for your patch.
> 
> Please look at how to submit patches here:
> https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches
> 
>> This patch has been added to boot eMMC image for AST2600 machine on
>> QEMU.
>>
>> Run quemu as follows:
>>
>> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
>> file=mmc-evb-ast2600.img,format=raw,if=sd,index=2
> 
> What is index=2?
> 
> Is this mmc-evb-ast2600.img image publicly available?
> 
>> Tested: Booted AST2600 eMMC image on QEMU.
>> Suggested-by:  <venture@google.com>
>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20210416162426.3217033-1-venture@google.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>

I don't remember having reviewed or signed this patch.

>> ---
>>   hw/arm/aspeed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ba5f1dc5af..6a890adb83 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>>           SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>>
>>   /* AST2600 evb hardware value */
>> -#define AST2600_EVB_HW_STRAP1 0x000000C0
>> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |
> AST26500_HW_STRAP_BOOT_SRC_EMMC)
> 
> IIUC you are not implementing any eMMC code, simply faking the
> controller can support eMMC, but the card is used in SD mode?

I think this is related to this issue :

   https://github.com/openbmc/openbmc/issues/3818

> I'm surprised your guest is happy and boot that. If so, then
> what is the point of announcing eMMC is supported if not used?
It should work on the aspeed branches I maintain which include the
emmc support but this is not for upstream.


Some comments,

I don't think the AST2600 evb boots by default on emmc. I agree
it's nice to have for tests and there are other ways to modify
slightly the default behavior.

We could add a machine property to define the 'hw-strap1' register
but it's a bit difficult to remember the value.
  
A custom '-boot' value setting the 'hw-strap1' for the AST2600
machine seems a better alternative. We could merge such a change
even if emmc is not ready.

Thanks,

C.




