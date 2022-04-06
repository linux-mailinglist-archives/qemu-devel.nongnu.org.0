Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC354F5A50
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:55:16 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2Nf-0003Nc-06
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2D8-0006el-RN
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:44:22 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:36091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2D6-0006u9-DR
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:44:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6A09E20072;
 Wed,  6 Apr 2022 09:44:16 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 11:44:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e37354b5-eb92-482b-9607-7a52aa0dd4c0,
 ACAFAA60954BC139C96B6B3855CBF7BDA7777862) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e18fbf21-7038-c116-279f-d95e3c0c7919@kaod.org>
Date: Wed, 6 Apr 2022 11:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
 <356b3f59-b915-3da1-7155-8082b55932fb@kaod.org> <Yk1EAHE2dUv7Z6gq@apples>
 <f669416c-6e17-23c0-3dfa-dd6cceebc05b@kaod.org> <Yk1aYldO+VjF3iqB@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yk1aYldO+VjF3iqB@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8d891a89-82ff-4d58-8814-91993fd184a1
X-Ovh-Tracer-Id: 6985083024360705016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jeremy Kerr <jk@ozlabs.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/22 11:16, Klaus Jensen wrote:
> On Apr  6 10:52, Cédric Le Goater wrote:
>> On 4/6/22 09:40, Klaus Jensen wrote:
>>> On Apr  6 08:14, Cédric Le Goater wrote:
>>>> Hello Klaus,
>>>>
>>>> On 3/31/22 18:57, Klaus Jensen wrote:
>>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>>
>>>>> Add slave mode functionality for the Aspeed I2C controller. This is
>>>>> implemented by creating an Aspeed I2C Slave device that attaches to the
>>>>> bus.
>>>>>
>>>>> This i2c slave device only implements the asynchronous version of
>>>>> i2c_send() and the event callback.
>>>>>
>>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>> ---
>>>>>     hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
>>>>>     hw/i2c/trace-events         |  2 +-
>>>>>     hw/misc/meson.build         |  2 +
>>>>>     include/hw/i2c/aspeed_i2c.h |  8 ++++
>>>>>     4 files changed, 97 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>>>> index 03a4f5a91010..61b6424434f7 100644
>>>>> --- a/hw/i2c/aspeed_i2c.c
>>>>> +++ b/hw/i2c/aspeed_i2c.c
>>>>> @@ -163,10 +163,15 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>>>>>               bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
>>>>>               bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
>>>>>               bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
>>>>> +          bus->intr_status & I2CD_INTR_SLAVE_ADDR_RX_MATCH ? "slave-match|" : "",
>>>>>               bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" : "",
>>>>>               bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "");
>>>>
>>>> Troy introduced a similar change in his "new mode" proposal. I think
>>>> it is time to change the 'aspeed_i2c_bus_raise_interrupt' trace event
>>>>
>>>> Could you please update trace_aspeed_i2c_bus_raise_interrupt() to take
>>>> a single status string ?
>>>>
>>>
>>> I'm not sure it will be "prettier". But I'll give it a shot.
>>
>> It will be easier to extend. We have 3 different patchsets modifying this
>> same event on the mailing list :)
>>
> 
> True :)
> 
>>>>> -    bus->intr_status &= bus->intr_ctrl;
>>>>> +    /*
>>>>> +     * WORKAROUND: the Linux Aspeed I2C driver masks SLAVE_ADDR_RX_MATCH for
>>>>> +     * some reason, not sure if it is a bug...
>>>>> +     */
>>>>> +    bus->intr_status &= (bus->intr_ctrl | I2CD_INTR_SLAVE_ADDR_RX_MATCH);
>>>>
>>>> It comes from the initial support for the AST2400 SoC.
>>>>
>>>> We should introduce a 'intr_ctrl_mask' attribute in AspeedI2CClass and
>>>> fix the AST24000 value to 0x7FFF ...
>>>>
>>>
>>> I'm not sure I understand. Do you suggest that we always use a fixed
>>> mask here and disregard what the host sets in intr_ctrl?
>>
>> No. sorry. There are multiple fixes required I think.
>>
>> The layout of the Interrupt Control Register (0x0C) differs on the
>> AST2400, AST2500, AST2600 SoCs. We need to clarify that first.
>> bits 11:7 and 31:16 are reserved on all. AST2400 lacks bit 15 which
>> enables a slave timeout interrupt on AST2500 and AST2600.
>>
>> Then, the Interrupt Status Register differs also. The AST2400 doesn't
>> have the Slave Address match indicator and the Slave Address Receiving
>> pending bits. On the AST2600, there are 3 possibles addresses, only
>> 2 on the AST2500 (and only 1 on the AST2400). So that modifies the
>> I2CD_INTR_SLAVE_ADDR_RX_MATCH bit.
>>
> 
> Ugh. I'm heavily burden by the fact that I do not have a spec sheet
> available... I'll try to request one from Aspeed. I reversed this from
> the Linux driver, so I'm just tried to match up with how that behaves.
> 
> With Slave Address Match indicator, you mean bit 31? There is only one
> bit, so how does it work with the third address?

On the AST2400 (only 1 slave address)

   * no upper bits

On the AST2500 (2 possible slave addresses),

   * bit[31] : Slave Address match indicator
   * bit[30] : Slave Address Receiving pending

On the AST2600 (3 possible slave addresses),

   * bit[31-30] : Slave Address match indicator
   * bit[29] : Slave Address Receiving pending

>> Since these 2 or 3 bits are read-only. I wonder how this is impacting
>> your slave implementation. is it ? If not, may be slave address match can
>> wait for now.
> 
> As far as I can tell, the kernel driver uses bit 7 (called
> SLAVE_ADDR_RX_MATCH in QEMU and SLAVE_MATCH in Linux) to start the slave
> state machinery. It does not use bit 31 (SLAVE_ADDR_MATCH in QEMU). The
> naming for bit 7 in Linux is probably off and should be ranamed to match
> QEMU?

No. This is a mess :) Both are correct. bit 7 is an interrupt enable/status.
bit 31 "indicates" which address : 1, 2, 3.

> I understand that this shouldn't assume to only work with the slave
> machinery in Linux, but that is the only platfrom I can currently
> experiment with.
> 
>>> In any case, isn't it a bug in the Linux kernel driver that it neglects
>>> to set bit 7 (slave match) in the INTR_CTRL register?>
>>>
>>>>>         if (bus->intr_status) {
>>>>>             bus->controller->intr_status |= 1 << bus->id;
>>>>>             qemu_irq_raise(aic->bus_get_irq(bus));
>>>>> @@ -196,6 +201,9 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
>>>>>         case I2CD_INTR_STS_REG:
>>>>>             value = bus->intr_status;
>>>>>             break;
>>>>> +    case I2CD_DEV_ADDR_REG:
>>>>> +        value = bus->dev_addr;
>>>>> +        break;
>>>>
>>>> You can introduce support for this register in a preliminary patch but
>>>> keep the slave activation for later (I2CD_SLAVE_EN bit)
>>>>
>>>
>>> Understood.
>>
>> thanks, we will address the full layout of this register later when needed.
>> But there are fields for each address.
>>
> 
> Right. Again, I just reversed from the kernel driver and it only sets
> the lower byte.

That's fine for now. the first 7bits in each byte represents a slave address.

Thanks,

C.

