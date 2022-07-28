Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F71583FEF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:27:20 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3Xr-0003cM-Gz
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oH3TZ-0007SE-Gi; Thu, 28 Jul 2022 09:22:53 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:53505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oH3TW-0001Rs-H8; Thu, 28 Jul 2022 09:22:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4DDAE11AF8A63;
 Thu, 28 Jul 2022 15:22:38 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 28 Jul
 2022 15:22:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00694b0c5f2-cd27-452d-afa5-b80c7e9d95cb,
 D5C8B4ACC7AAF03C2427E421B0C3D41118C6E647) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.52.30
Message-ID: <a2a6045f-5352-b09d-ac86-aedfad3aa240@kaod.org>
Date: Thu, 28 Jul 2022 15:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] aspeed: Enable backend file for eeprom
Content-Language: en-US
To: John Wang <wangzq.jn@gmail.com>
CC: <patrick@stwcx.xyz>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
References: <20220728061228.152704-1-wangzhiqiang02@inspur.com>
 <6ad0dee4-58c3-de80-177c-d06bb45ba8af@kaod.org>
 <CAHwNHZUsodef8LcE+wjp2OFk=b01zEMx12bLDVoW3h5hFt=xFA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAHwNHZUsodef8LcE+wjp2OFk=b01zEMx12bLDVoW3h5hFt=xFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b44f98ae-a441-4dda-a81b-82c8a37de98b
X-Ovh-Tracer-Id: 10204593808155642732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhfeevveegueejhfettdeuvdejtefgkeffkeejgeeuteejgfduieelhedttefhtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhitggpjhgrvghhhihoohesqhhuihgtihhntgdrtghomhdpoffvtefjohhsthepmhhohedvle
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

On 7/28/22 09:20, John Wang wrote:
> Cédric Le Goater <clg@kaod.org> 于2022年7月28日周四 14:28写道：
>>
>> Hello John,
>>
>> On 7/28/22 08:12, John Wang wrote:
>>> tested on a fp5280g2:
>>>
>>> $QEMU_BIN -machine fp5280g2-bmc \
>>>          -nographic \
>>>          -drive file="${IMAGE_PATH}",format=raw,if=mtd \
>>>          -drive file="eeprom.bin",format=raw,if=pflash,index=1 \
>>>          ${NIC}
>>>
>>> root@fp5280g2:/sys/bus/i2c/devices/1-0050# hexdump eeprom -C
>>> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>> *
>>> ....
>>> ....
>>> 00000240  2c 87 a3 a4 1d d3 11 b2  02 d2 c2 9d 44 60 cf 3e  |,...........D`.>|
>>> 00000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>>
>>> It's same as the "eeprom.bin"
>>>
>>> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
>>> Change-Id: I5c44785a028144b24aa0b22643266d83addc5eab
>>> ---
>>>    hw/arm/aspeed.c | 16 ++++++++++++----
>>>    1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index 4193a3d23d..80aa687372 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -431,12 +431,20 @@ static void aspeed_machine_init(MachineState *machine)
>>>        arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>>>    }
>>>
>>> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>>> +static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize,
>>> +                              int index)
>>>    {
>>>        I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>>>        DeviceState *dev = DEVICE(i2c_dev);
>>>
>>> +    DriveInfo *dinfo = drive_get_by_index(IF_PFLASH, index);
>>
>> I don't think IF_PFLASH is the appropriate type.
> 
> thanks
> 
>>
>> Jae proposed a similar patch with IF_NONE which should fit your need :
>>
>>     https://lore.kernel.org/all/20220718175214.2087644-1-quic_jaehyoo@quicinc.com/
>>
>> Could you please give it a try ?
> 
> I tested on a fp5280g2-bmc, It's ok.  I would abandon my patch :）
> 
>>
>> It's available on my branch :
>>
>>     https://github.com/legoater/qemu/commits/aspeed-7.1
> 
> I checked it, and will use this tree to module a new machine. :)

Or simply grab the patch if you only need one.

I don't think this is the correct approach for mainline. See this thread :

   https://lore.kernel.org/all/CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com/t/

C.

> 
>>
>> Thanks,
>>
>> C.
>>
>>
>>> +    BlockBackend *blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
>>> +
>>> +    if (blk) {
>>> +        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
>>> +    }
>>>        qdev_prop_set_uint32(dev, "rom-size", rsize);
>>> +
>>>        i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>>>    }
>>>
>>> @@ -685,7 +693,7 @@ static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
>>>        I2CSlave *i2c_mux;
>>>
>>>        /* The at24c256 */
>>> -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
>>> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768, 1);
>>>
>>>        /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
>>>        i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
>>> @@ -918,13 +926,13 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
>>>        }
>>>
>>>        /* Bus 6 */
>>> -    at24c_eeprom_init(i2c[6], 0x56, 65536);
>>> +    at24c_eeprom_init(i2c[6], 0x56, 65536, 1);
>>>        /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough */
>>>        i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
>>>
>>>
>>>        /* Bus 7 */
>>> -    at24c_eeprom_init(i2c[7], 0x54, 65536);
>>> +    at24c_eeprom_init(i2c[7], 0x54, 65536, 2);
>>>
>>>        /* Bus 9 */
>>>        i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
>>


