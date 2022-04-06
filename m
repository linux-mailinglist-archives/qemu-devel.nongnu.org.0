Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B294F581C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:54:14 +0200 (CEST)
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1Qb-0004y4-O1
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc1PM-00044X-1y
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:52:56 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:59667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc1PJ-0003Ay-HF
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:52:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A14592016A;
 Wed,  6 Apr 2022 08:52:47 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 10:52:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029a8af9c9-9e8d-4bc9-9b38-bab2aa6afecf,
 ACAFAA60954BC139C96B6B3855CBF7BDA7777862) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f669416c-6e17-23c0-3dfa-dd6cceebc05b@kaod.org>
Date: Wed, 6 Apr 2022 10:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
 <356b3f59-b915-3da1-7155-8082b55932fb@kaod.org> <Yk1EAHE2dUv7Z6gq@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yk1EAHE2dUv7Z6gq@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bad071a8-b1fd-4775-8c17-6e4940b1e7ee
X-Ovh-Tracer-Id: 6115606821993221112
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 4/6/22 09:40, Klaus Jensen wrote:
> On Apr  6 08:14, Cédric Le Goater wrote:
>> Hello Klaus,
>>
>> On 3/31/22 18:57, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Add slave mode functionality for the Aspeed I2C controller. This is
>>> implemented by creating an Aspeed I2C Slave device that attaches to the
>>> bus.
>>>
>>> This i2c slave device only implements the asynchronous version of
>>> i2c_send() and the event callback.
>>>
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>    hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
>>>    hw/i2c/trace-events         |  2 +-
>>>    hw/misc/meson.build         |  2 +
>>>    include/hw/i2c/aspeed_i2c.h |  8 ++++
>>>    4 files changed, 97 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index 03a4f5a91010..61b6424434f7 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -163,10 +163,15 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>>>              bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
>>>              bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
>>>              bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
>>> +          bus->intr_status & I2CD_INTR_SLAVE_ADDR_RX_MATCH ? "slave-match|" : "",
>>>              bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" : "",
>>>              bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "");
>>
>> Troy introduced a similar change in his "new mode" proposal. I think
>> it is time to change the 'aspeed_i2c_bus_raise_interrupt' trace event
>>
>> Could you please update trace_aspeed_i2c_bus_raise_interrupt() to take
>> a single status string ?
>>
> 
> I'm not sure it will be "prettier". But I'll give it a shot.

It will be easier to extend. We have 3 different patchsets modifying this
same event on the mailing list :)

>>> -    bus->intr_status &= bus->intr_ctrl;
>>> +    /*
>>> +     * WORKAROUND: the Linux Aspeed I2C driver masks SLAVE_ADDR_RX_MATCH for
>>> +     * some reason, not sure if it is a bug...
>>> +     */
>>> +    bus->intr_status &= (bus->intr_ctrl | I2CD_INTR_SLAVE_ADDR_RX_MATCH);
>>
>> It comes from the initial support for the AST2400 SoC.
>>
>> We should introduce a 'intr_ctrl_mask' attribute in AspeedI2CClass and
>> fix the AST24000 value to 0x7FFF ...
>>
> 
> I'm not sure I understand. Do you suggest that we always use a fixed
> mask here and disregard what the host sets in intr_ctrl?

No. sorry. There are multiple fixes required I think.

The layout of the Interrupt Control Register (0x0C) differs on the
AST2400, AST2500, AST2600 SoCs. We need to clarify that first.
bits 11:7 and 31:16 are reserved on all. AST2400 lacks bit 15 which
enables a slave timeout interrupt on AST2500 and AST2600.

Then, the Interrupt Status Register differs also. The AST2400 doesn't
have the Slave Address match indicator and the Slave Address Receiving
pending bits. On the AST2600, there are 3 possibles addresses, only
2 on the AST2500 (and only 1 on the AST2400). So that modifies the
I2CD_INTR_SLAVE_ADDR_RX_MATCH bit.

Since these 2 or 3 bits are read-only. I wonder how this is impacting
your slave implementation. is it ? If not, may be slave address match can
wait for now.
> In any case, isn't it a bug in the Linux kernel driver that it neglects
> to set bit 7 (slave match) in the INTR_CTRL register?>
> 
>>>        if (bus->intr_status) {
>>>            bus->controller->intr_status |= 1 << bus->id;
>>>            qemu_irq_raise(aic->bus_get_irq(bus));
>>> @@ -196,6 +201,9 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
>>>        case I2CD_INTR_STS_REG:
>>>            value = bus->intr_status;
>>>            break;
>>> +    case I2CD_DEV_ADDR_REG:
>>> +        value = bus->dev_addr;
>>> +        break;
>>
>> You can introduce support for this register in a preliminary patch but
>> keep the slave activation for later (I2CD_SLAVE_EN bit)
>>
> 
> Understood.

thanks, we will address the full layout of this register later when needed.
But there are fields for each address.


C.


>>>        case I2CD_POOL_CTRL_REG:
>>>            value = bus->pool_ctrl;
>>>            break;
>>> @@ -535,10 +543,9 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>>>        switch (offset) {
>>>        case I2CD_FUN_CTRL_REG:
>>>            if (value & I2CD_SLAVE_EN) {
>>> -            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>>> -                          __func__);
>>> -            break;
>>> +            i2c_slave_set_address(&bus->slave->i2c, bus->dev_addr);
>>>            }
>>> +
>>>            bus->ctrl = value & 0x0071C3FF;
>>>            break;
>>>        case I2CD_AC_TIMING_REG1:
>>> @@ -558,14 +565,19 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>>>                bus->controller->intr_status &= ~(1 << bus->id);
>>>                qemu_irq_lower(aic->bus_get_irq(bus));
>>>            }
>>> -        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST))) {
>>> -            aspeed_i2c_handle_rx_cmd(bus);
>>> -            aspeed_i2c_bus_raise_interrupt(bus);
>>> +
>>> +        if (handle_rx) {
>>> +            if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
>>> +                aspeed_i2c_handle_rx_cmd(bus);
>>> +                aspeed_i2c_bus_raise_interrupt(bus);
>>> +            } else if (aspeed_i2c_get_state(bus) == I2CD_STXD) {
>>> +                i2c_ack(bus->bus);
>>> +            }
>>>            }
>>> +
>>>
>>>            break;
>>>        case I2CD_DEV_ADDR_REG:
>>> -        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
>>> -                      __func__);
>>> +        bus->dev_addr = value;
>>>            break;
>>>        case I2CD_POOL_CTRL_REG:
>>>            bus->pool_ctrl &= ~0xffffff;
>>> @@ -852,12 +864,74 @@ static const TypeInfo aspeed_i2c_info = {
>>>        .abstract   = true,
>>>    };
>>> +static int aspeed_i2c_slave_event(I2CSlave *slave, enum i2c_event event)
>>> +{
>>> +    AspeedI2CSlave *s = ASPEED_I2C_SLAVE(slave);
>>> +    AspeedI2CBus *bus = s->bus;
>>> +
>>> +    switch (event) {
>>> +    case I2C_START_SEND:
>>> +        bus->buf = bus->dev_addr << 1;
>>> +
>>> +        bus->buf &= I2CD_BYTE_BUF_RX_MASK;
>>> +        bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;
>>> +
>>> +        bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
>>> +        aspeed_i2c_set_state(bus, I2CD_STXD);
>>> +
>>> +        break;
>>> +
>>> +    case I2C_FINISH:
>>> +        bus->intr_status |= I2CD_INTR_NORMAL_STOP;
>>> +        aspeed_i2c_set_state(bus, I2CD_IDLE);
>>> +
>>> +        break;
>>> +
>>> +    default:
>>> +        return -1;
>>> +    }
>>> +
>>> +    aspeed_i2c_bus_raise_interrupt(bus);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void aspeed_i2c_slave_send_async(I2CSlave *slave, uint8_t data)
>>> +{
>>> +    AspeedI2CSlave *s = ASPEED_I2C_SLAVE(slave);
>>> +    AspeedI2CBus *bus = s->bus;
>>> +
>>> +    bus->buf = (data & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
>>> +    bus->intr_status |= I2CD_INTR_RX_DONE;
>>> +
>>> +    aspeed_i2c_bus_raise_interrupt(bus);
>>> +}
>>> +
>>> +static void aspeed_i2c_slave_class_init(ObjectClass *klass, void *Data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
>>> +
>>> +    dc->desc = "Aspeed I2C Bus Slave";
>>> +
>>> +    sc->event = aspeed_i2c_slave_event;
>>> +    sc->send_async = aspeed_i2c_slave_send_async;
>>> +}
>>> +
>>> +static const TypeInfo aspeed_i2c_slave_info = {
>>> +    .name          = TYPE_ASPEED_I2C_SLAVE,
>>> +    .parent        = TYPE_I2C_SLAVE,
>>> +    .instance_size = sizeof(AspeedI2CSlave),
>>> +    .class_init    = aspeed_i2c_slave_class_init,
>>> +};
>>> +
>>>    static void aspeed_i2c_bus_reset(DeviceState *dev)
>>>    {
>>>        AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
>>>        s->intr_ctrl = 0;
>>>        s->intr_status = 0;
>>> +    s->dev_addr = 0;
>>
>> Please include the new reg in vmstate.
>>
> 
> Understood.
> 
>>>        s->cmd = 0;
>>>        s->buf = 0;
>>>        s->dma_addr = 0;
>>> @@ -881,6 +955,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
>>>        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>>>        s->bus = i2c_init_bus(dev, name);
>>> +    s->slave = ASPEED_I2C_SLAVE(i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_SLAVE, 0xff));
>>> +    s->slave->bus = s;
>>>        memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
>>>                              s, name, aic->reg_size);
>>> @@ -1016,6 +1092,7 @@ static const TypeInfo aspeed_2600_i2c_info = {
>>>    static void aspeed_i2c_register_types(void)
>>>    {
>>>        type_register_static(&aspeed_i2c_bus_info);
>>> +    type_register_static(&aspeed_i2c_slave_info);
>>>        type_register_static(&aspeed_i2c_info);
>>>        type_register_static(&aspeed_2400_i2c_info);
>>>        type_register_static(&aspeed_2500_i2c_info);
>>> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
>>> index 7d8907c1eede..85e4bddff936 100644
>>> --- a/hw/i2c/trace-events
>>> +++ b/hw/i2c/trace-events
>>> @@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>>>    # aspeed_i2c.c
>>>    aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
>>> -aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5) "handled intr=0x%x %s%s%s%s%s"
>>> +aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
>>>    aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
>>>    aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
>>>    aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
>>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>>> index 6fb69612e064..c1c1abea41dd 100644
>>> --- a/hw/misc/meson.build
>>> +++ b/hw/misc/meson.build
>>> @@ -122,6 +122,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>>>    softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>>> +softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
>>
>> That's for another patch.
>>
> 
> Yeah, was a mistake on my part when chopping up my work.
> 
>>> +
>>>    specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>>>    specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
>>> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
>>> index 4b9be09274c7..3f1a9c07a00b 100644
>>> --- a/include/hw/i2c/aspeed_i2c.h
>>> +++ b/include/hw/i2c/aspeed_i2c.h
>>> @@ -42,6 +42,7 @@ struct AspeedI2CBus {
>>>        SysBusDevice parent_obj;
>>>        struct AspeedI2CState *controller;
>>> +    struct AspeedI2CSlave *slave;
>>>        MemoryRegion mr;
>>> @@ -53,6 +54,7 @@ struct AspeedI2CBus {
>>>        uint32_t timing[2];
>>>        uint32_t intr_ctrl;
>>>        uint32_t intr_status;
>>> +    uint32_t dev_addr;
>>>        uint32_t cmd;
>>>        uint32_t buf;
>>>        uint32_t pool_ctrl;
>>> @@ -76,6 +78,12 @@ struct AspeedI2CState {
>>>        AddressSpace dram_as;
>>>    };
>>> +#define TYPE_ASPEED_I2C_SLAVE "aspeed.i2c.slave"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CSlave, ASPEED_I2C_SLAVE)
>>> +struct AspeedI2CSlave {
>>> +    I2CSlave i2c;
>>> +    AspeedI2CBus *bus;
>>> +};
>>
>> AFAICT, AspeedI2CSlave is not that useful since it doesn't maintain any
>> state. The QOM interface proposal looks like a better approach.
>>
> 
> Agree.
> 
>>>    struct AspeedI2CClass {
>>>        SysBusDeviceClass parent_class;
>>
>>
>> If you could send these 3 patches :
>>    - aspeed_i2c_bus_raise_interrupt trace event rework
>>    - intr_ctrl_mask class attribute
>>    - dev_addr support
>>
>> I will queue them quickly and we will focus on adding slave support only.
>>
> 
> Cool, but please see my question on the intr_ctrl_mask.


