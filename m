Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6554B9033
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:28:54 +0100 (CET)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKP2r-0007zd-Ed
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:28:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKP1R-0007IL-Lq
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:27:25 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:48185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKP1P-0000nE-G7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 13:27:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C01D820BA9;
 Wed, 16 Feb 2022 18:27:12 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 19:27:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001acf52506-8023-4576-a2ab-1ca8780858a9,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6981675c-3630-94a6-514f-03aeeb8a015f@kaod.org>
Date: Wed, 16 Feb 2022 19:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] arm: Remove swift-bmc machine
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-2-clg@kaod.org>
 <e356a02a-133b-8aac-b28a-9daf8c27c3a7@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e356a02a-133b-8aac-b28a-9daf8c27c3a7@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ba49a27f-40bb-44ed-ad15-55928d895e6a
X-Ovh-Tracer-Id: 4755801206598241062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 16:02, Philippe Mathieu-Daudé wrote:
> On 16/2/22 10:21, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> It was scheduled for removal in 7.0.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Message-Id: <20220216080947.65955-1-joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   docs/about/deprecated.rst  |  7 -----
>>   docs/system/arm/aspeed.rst |  1 -
>>   hw/arm/aspeed.c            | 53 --------------------------------------
>>   3 files changed, 61 deletions(-)
> 
>>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>>   {
>>       AspeedSoCState *soc = &bmc->soc;
>> @@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>>           aspeed_soc_num_cpus(amc->soc_name);
>>   };
>> -static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
>> -{
>> -    MachineClass *mc = MACHINE_CLASS(oc);
>> -    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>> -
>> -    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
>> -    amc->soc_name  = "ast2500-a1";
>> -    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;
> 
> Can we also remove this definition?

Indeed.

Thanks,

C.

