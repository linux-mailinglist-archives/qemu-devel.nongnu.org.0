Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5569A6DB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 09:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSw31-0006DR-O1; Fri, 17 Feb 2023 03:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw2z-0006D3-Qb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:24:49 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw2x-0004IL-SE
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:24:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 87C52201EE;
 Fri, 17 Feb 2023 08:24:42 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 09:24:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003fed51f18-4f18-4ad5-b2f9-411ae549d632,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aab8aa7d-7c93-1ef1-ed6f-6851714e85cd@kaod.org>
Date: Fri, 17 Feb 2023 09:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/8] hw/misc: add a toy i2c echo device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-4-clg@kaod.org>
 <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
 <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
 <38d7b71e-4908-6cc2-0e4f-a08d3a11cdf7@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <38d7b71e-4908-6cc2-0e4f-a08d3a11cdf7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d5d6fc00-1ef9-4c89-8a7f-a543aeb7a48b
X-Ovh-Tracer-Id: 4164140805829135151
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfetgeffvdeigeelledvtdffheevveegtdduueejudeukeeiiedvfeetieelieelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihdvtgdqvggthhhordgtshenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrg
 hrohdrohhrghdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 13:26, Philippe Mathieu-Daudé wrote:
> On 15/2/23 12:09, Cédric Le Goater wrote:
>> On 2/15/23 11:55, Philippe Mathieu-Daudé wrote:
>>> On 14/2/23 18:18, Cédric Le Goater wrote:
>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>> Add an example I2C device to demonstrate how a slave may master the bus
>>>> and send data asynchronously to another slave.
>>>
>>> What a rebellion...
>>>
>>>> The device will echo whatever it is sent to the device identified by the
>>>> first byte received.
>>>>
>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>>>>           on such SoCs
>>>>         - folded in these fixes :
>>>> https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
>>>> ]
>>>> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>>>>   hw/misc/meson.build |   2 +
>>>>   2 files changed, 158 insertions(+)
>>>>   create mode 100644 hw/misc/i2c-echo.c
>>>
>>>
>>>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>>>> index 448e14b531..3eb1bda710 100644
>>>> --- a/hw/misc/meson.build
>>>> +++ b/hw/misc/meson.build
>>>> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>>>>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>>>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))
>>>
>>> s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.
>>
>> even if only supported by the Aspeed SoC ? I am OK with both.
> 
> Any machine exposing an i2c bus can use this device, isn't it?
> 
>    -device i2c-echo,bus=bus69,address=0x42 ...

Would you have a machine with I2C buses and image to try that on ?
Not an aspeed one obvioulsy

Thanks,

C.


