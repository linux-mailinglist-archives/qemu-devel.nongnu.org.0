Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFA53B481
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:43:30 +0200 (CEST)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwfUP-0007tV-Ej
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfP2-0004lO-UW
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:37:56 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:52455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfP0-00061b-VH
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:37:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B3E2521412;
 Thu,  2 Jun 2022 07:37:51 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 09:37:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005ec46b209-2abb-4c45-8614-f20d243b6281,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e503a0d9-d8ad-01e5-745f-cd4b9d8c904a@kaod.org>
Date: Thu, 2 Jun 2022 09:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 6/6] hw/misc: add a toy i2c echo device [DO NOT
 PULL]
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <qemu-arm@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Damien Hedde <damien.hedde@greensocs.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arun Kumar
 Kashinath Agasar <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-7-its@irrelevant.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220601210831.67259-7-its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 84f2dc28-6fd7-4367-ad59-68243aea4a77
X-Ovh-Tracer-Id: 7552255101834791867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 23:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add an example I2C device to demonstrate how a slave may master the bus
> and send data asynchronously to another slave.
> 
> The device will echo whatever it is sent to the device identified by the
> first byte received.

I think this is useful and small enough to keep for the tests.

Thanks,

C.

> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/misc/i2c-echo.c  | 162 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build |   2 +
>   2 files changed, 164 insertions(+)
>   create mode 100644 hw/misc/i2c-echo.c
> 
> diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> new file mode 100644
> index 000000000000..27992eff8c5b
> --- /dev/null
> +++ b/hw/misc/i2c-echo.c
> @@ -0,0 +1,162 @@
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/main-loop.h"
> +#include "block/aio.h"
> +#include "hw/i2c/i2c.h"
> +
> +#define TYPE_I2C_ECHO "i2c-echo"
> +OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
> +
> +enum i2c_echo_state {
> +    I2C_ECHO_STATE_IDLE,
> +    I2C_ECHO_STATE_REQUEST_MASTER,
> +    I2C_ECHO_STATE_START_SEND,
> +    I2C_ECHO_STATE_ACK,
> +};
> +
> +typedef struct I2CEchoState {
> +    I2CSlave parent_obj;
> +
> +    I2CBus *bus;
> +
> +    enum i2c_echo_state state;
> +    QEMUBH *bh;
> +
> +    unsigned int pos;
> +    uint8_t data[3];
> +} I2CEchoState;
> +
> +static void i2c_echo_bh(void *opaque)
> +{
> +    I2CEchoState *state = opaque;
> +
> +    switch (state->state) {
> +    case I2C_ECHO_STATE_IDLE:
> +        return;
> +
> +    case I2C_ECHO_STATE_REQUEST_MASTER:
> +        i2c_bus_master(state->bus, state->bh);
> +        state->state = I2C_ECHO_STATE_START_SEND;
> +        return;
> +
> +    case I2C_ECHO_STATE_START_SEND:
> +        if (i2c_start_send_async(state->bus, state->data[0])) {
> +            goto release_bus;
> +        }
> +
> +        state->pos++;
> +        state->state = I2C_ECHO_STATE_ACK;
> +        return;
> +
> +    case I2C_ECHO_STATE_ACK:
> +        if (state->pos > 2) {
> +            break;
> +        }
> +
> +        if (i2c_send_async(state->bus, state->data[state->pos++])) {
> +            break;
> +        }
> +
> +        return;
> +    }
> +
> +
> +    i2c_end_transfer(state->bus);
> +release_bus:
> +    i2c_bus_release(state->bus);
> +
> +    state->state = I2C_ECHO_STATE_IDLE;
> +}
> +
> +static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
> +{
> +    I2CEchoState *state = I2C_ECHO(s);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        state->pos = 0;
> +
> +        break;
> +
> +    case I2C_START_SEND:
> +        state->pos = 0;
> +
> +        break;
> +
> +    case I2C_FINISH:
> +        state->pos = 0;
> +        state->state = I2C_ECHO_STATE_REQUEST_MASTER;
> +        qemu_bh_schedule(state->bh);
> +
> +        break;
> +
> +    case I2C_NACK:
> +        break;
> +
> +    default:
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static uint8_t i2c_echo_recv(I2CSlave *s)
> +{
> +    I2CEchoState *state = I2C_ECHO(s);
> +
> +    if (state->pos > 2) {
> +        return 0xff;
> +    }
> +
> +    return state->data[state->pos++];
> +}
> +
> +static int i2c_echo_send(I2CSlave *s, uint8_t data)
> +{
> +    I2CEchoState *state = I2C_ECHO(s);
> +
> +    if (state->pos > 2) {
> +        return -1;
> +    }
> +
> +    state->data[state->pos++] = data;
> +
> +    return 0;
> +}
> +
> +static void i2c_echo_realize(DeviceState *dev, Error **errp)
> +{
> +    I2CEchoState *state = I2C_ECHO(dev);
> +    BusState *bus = qdev_get_parent_bus(dev);
> +
> +    state->bus = I2C_BUS(bus);
> +    state->bh = qemu_bh_new(i2c_echo_bh, state);
> +
> +    return;
> +}
> +
> +static void i2c_echo_class_init(ObjectClass *oc, void *data)
> +{
> +    I2CSlaveClass *sc = I2C_SLAVE_CLASS(oc);
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = i2c_echo_realize;
> +
> +    sc->event = i2c_echo_event;
> +    sc->recv = i2c_echo_recv;
> +    sc->send = i2c_echo_send;
> +}
> +
> +static const TypeInfo i2c_echo = {
> +    .name = TYPE_I2C_ECHO,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(I2CEchoState),
> +    .class_init = i2c_echo_class_init,
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&i2c_echo);
> +}
> +
> +type_init(register_types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 0135d1975ceb..4132fe5e0bf7 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -125,6 +125,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>   
> +softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
> +
>   specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>   
>   specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))


