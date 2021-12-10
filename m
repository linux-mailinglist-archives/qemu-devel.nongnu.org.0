Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B74703A3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:17:24 +0100 (CET)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvheG-00081P-0t
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvhbK-0006NJ-IR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:14:26 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvhb6-0007Ef-7T
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:14:22 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9594122F0D;
 Fri, 10 Dec 2021 15:13:57 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 10 Dec
 2021 16:13:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0031786238d-fb69-45e8-8fe2-8b3ab58c6f38,
 46725CDD1DA84BED7F471249384164116D1F6139) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e96aa35b-a8d9-41fa-ae0f-5e89fe6b1cfa@kaod.org>
Date: Fri, 10 Dec 2021 16:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Content-Language: en-US
To: Troy Lee <leetroy@gmail.com>
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
 <CAN9Jwz3ytV3ogztQrcL+YKGdgKYdNjypeMFbKfyqMiwvWhnMEw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAN9Jwz3ytV3ogztQrcL+YKGdgKYdNjypeMFbKfyqMiwvWhnMEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1271641b-30b0-4022-9692-21f827ea714f
X-Ovh-Tracer-Id: 7977282318680296297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkedvgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.317,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 15:33, Troy Lee wrote:
> On Fri, Dec 10, 2021 at 10:05 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 12/10/21 09:30, Troy Lee wrote:
>>> AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
>>> and io address. If guest machine try to access DPMCU memory, it will
>>> cause a fatal error.
>>
>> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
>> but it's too small. Anyhow, it is better to have per logic unit. We should
>> change that one day.
>>
> Good idea!
> 
>> For my information, which FW image are you using ?
>>
> 
> We're using Aspeed's SDK image, I tested with ast2600-default machine.
> Prebuilt image can be download from:
> https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02

Excellent ! Is there one I could try in particular ?


Once correctly supported, we should include one of these SDK images in :

   tests/avocado/boot_linux_console.py

to complete our tests of the device models.

QEMU is not making much difference between the revision. You might need
to improve that.

> Without declaring the DPMCU memory, the image will hangs in u-boot.

yeah. You can use -d guest_errors,unimp to catch accesses done on AHB
windows not covered by the QEMU models. There are plenty of ways to
move past U-Boot when models are not implemented yet. Don't waste
too much time, just ask.

eMMC is only on these branches :

   https://github.com/openbmc/qemu/
   https://github.com/legoater/qemu/

Same for SBC and support is primitive.

> We're still working on I3C and SPI issue to be resolved to get into rootfs.

I3C has not much support in Linux and none in QEMU. You will have to
add dummy models.

SPI as a non-SPI flash driver ? The SPI flash controller models should
be quite well covered today. What's the issue ?

Thanks,

C.

