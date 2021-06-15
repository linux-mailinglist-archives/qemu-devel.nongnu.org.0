Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EED3A7677
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 07:26:15 +0200 (CEST)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt1aY-0000ZQ-3A
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 01:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lt1ZL-0007xd-TD
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:24:59 -0400
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:37873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lt1ZI-0001Ox-Nt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:24:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 5A5C0281D1A;
 Tue, 15 Jun 2021 07:24:52 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Tue, 15 Jun
 2021 07:24:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034eb67348-cd5f-4e39-b416-aadb49fa54ed,
 C0A23537F2FFB9D7AAC434AAD4F3C11B0BA66CE8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/2] hw/misc: Add Infineon DPS310 sensor model
To: Joel Stanley <joel@jms.id.au>
References: <20210609105802.17015-1-joel@jms.id.au>
 <20210609105802.17015-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2bce40a8-46c7-eabc-c8bf-b7ff86cd78df@kaod.org>
Date: Tue, 15 Jun 2021 07:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609105802.17015-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8598dae-a756-46c7-bd4e-83343060c8e3
X-Ovh-Tracer-Id: 4153163283340626912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedviedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuefhleeffeejueektedvvedttddtvefgleevffelkedtfeduvdefkeeftdelvdffnecuffhomhgrihhnpehinhhfihhnvghonhdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 12:58 PM, Joel Stanley wrote:
> This contains some hardcoded register values that were obtained from the
> hardware after reading the temperature.
> 
> It does enough to test the Linux kernel driver.

It should say briefly what are the device features, which are modeled and 
which are not (FIFO, IRQ, sampling configuration).

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/dps310.c    | 357 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig      |   1 +
>  hw/misc/Kconfig     |   4 +
>  hw/misc/meson.build |   1 +
>  4 files changed, 363 insertions(+)
>  create mode 100644 hw/misc/dps310.c
> 
> diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
> new file mode 100644
> index 000000000000..1fe1a1a645f2
> --- /dev/null
> +++ b/hw/misc/dps310.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2017 Joel Stanley <joel@jms.id.au>, IBM Corporation

2021 I guess.

> + *
> + * Infineon DPS310 temperature and himidity sensor
> + *
> + * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressure-sensors-for-iot/dps310/
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/hw.h"
> +#include "hw/i2c/i2c.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "migration/vmstate.h"
> +
> +#define NUM_REGISTERS   0x32
> +
> +typedef struct DPS310State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +
> +    /*< public >*/
> +    uint8_t regs[NUM_REGISTERS];
> +
> +    int16_t pressure, temperature;

This is adding state. why not use the DPS310_PRS_B[210] registers 
and the DPS310_TMP_B[210] ? 

> +
> +    uint8_t len;
> +    uint8_t buf[2];
> +    uint8_t pointer;
> +
> +} DPS310State;
> +
> +typedef struct DPS310Class {
> +    I2CSlaveClass parent_class;
> +} DPS310Class;

This definition is unused.

> +
> +#define TYPE_DPS310 "dps310"
> +#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
> +
> +#define DPS310_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(DPS310Class, (klass), TYPE_DPS310)
> +#define DPS310_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(DPS310Class, (obj), TYPE_DPS310)
> +

I think we can use OBJECT_DECLARE_SIMPLE_TYPE() instead.

> +#define DPS310_PRS_B2           0x00
> +#define DPS310_PRS_B1           0x01
> +#define DPS310_PRS_B0           0x02
> +#define DPS310_TMP_B2           0x03
> +#define DPS310_TMP_B1           0x04
> +#define DPS310_TMP_B0           0x05
> +#define DPS310_PRS_CFG          0x06
> +#define DPS310_TMP_CFG          0x07
> +#define  DPS310_TMP_RATE_BITS   GENMASK(6, 4)

GENMASK is a Linux macro.

> +#define DPS310_MEAS_CFG         0x08
> +#define  DPS310_MEAS_CTRL_BITS  GENMASK(2, 0)
> +#define   DPS310_PRESSURE_EN    BIT(0)
> +#define   DPS310_TEMP_EN        BIT(1)
> +#define   DPS310_BACKGROUND     BIT(2)
> +#define  DPS310_PRS_RDY         BIT(4)
> +#define  DPS310_TMP_RDY         BIT(5)
> +#define  DPS310_SENSOR_RDY      BIT(6)
> +#define  DPS310_COEF_RDY        BIT(7)
> +#define DPS310_CFG_REG          0x09
> +#define DPS310_RESET            0x0c
> +#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
> +#define DPS310_COEF_BASE        0x10
> +#define DPS310_COEF_LAST        0x21
> +#define DPS310_COEF_SRC         0x28
> +
> +static void dps310_reset(DeviceState *dev)
> +{
> +    DPS310State *s = DPS310(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +    s->pointer = 0;
> +
> +    s->regs[0x00] = 0xfe;
> +    s->regs[0x01] = 0x2f;
> +    s->regs[0x02] = 0xee;
> +    s->regs[0x03] = 0x02;
> +    s->regs[0x04] = 0x69;
> +    s->regs[0x05] = 0xa6;
> +    s->regs[0x06] = 0x00;
> +    s->regs[0x07] = 0x80;
> +    s->regs[0x08] = 0xc7;
> +
> +    s->regs[0x0d] = 0x10;
> +    s->regs[0x0e] = 0x00;
> +    s->regs[0x0f] = 0x00;
> +    s->regs[0x10] = 0x0e;
> +    s->regs[0x11] = 0x1e;
> +    s->regs[0x12] = 0xdd;
> +    s->regs[0x13] = 0x13;
> +    s->regs[0x14] = 0xca;
> +    s->regs[0x15] = 0x5f;
> +    s->regs[0x16] = 0x21;
> +    s->regs[0x17] = 0x52;
> +    s->regs[0x18] = 0xf9;
> +    s->regs[0x19] = 0xc6;
> +    s->regs[0x1a] = 0x04;
> +    s->regs[0x1b] = 0xd1;
> +    s->regs[0x1c] = 0xdb;
> +    s->regs[0x1d] = 0x47;
> +    s->regs[0x1e] = 0x00;
> +    s->regs[0x1f] = 0x5b;
> +    s->regs[0x20] = 0xfb;
> +    s->regs[0x21] = 0x3a;
> +    s->regs[0x22] = 0x00;
> +    s->regs[0x23] = 0x00;
> +    s->regs[0x24] = 0x20;
> +    s->regs[0x25] = 0x49;
> +    s->regs[0x26] = 0x4e;
> +    s->regs[0x27] = 0xa5;
> +    s->regs[0x28] = 0x90;
> +
> +    s->regs[0x30] = 0x60;
> +    s->regs[0x31] = 0x15;

I would put these constant values in a static const array and memset
s->regs with it.

> +
> +    /* TODO: assert these after some timeout ? */
> +    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
> +        | DPS310_TMP_RDY | DPS310_PRS_RDY;

I think this is fine. Device initialization under QEMU is instantaneous 
and sensor values are always ready to be read.

> +}
> +
> +static void dps310_get_pressure(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    DPS310State *s = DPS310(obj);
> +    int64_t value;
> +
> +    /* TODO */

Why not use registers DPS310_PRS_B[210] instead ? We have valid scale 
factors and calibration coefficients in the registers.
 
Nice function in 4.9 Calibration and Measurement Compensation. :)

If it is too complex, we can leave out the get/set handlers since they
don't add much to the model.

> +    value = s->pressure;
> +
> +    visit_type_int(v, name, &value, errp);
> +}
> +
> +static void dps310_get_temperature(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    DPS310State *s = DPS310(obj);
> +    int64_t value;
> +
> +    /* TODO */
> +    value = s->temperature;

Why not use registers DPS310_TMP_B[210] instead ? This is easier than 
pressure.

> +
> +    visit_type_int(v, name, &value, errp);
> +}
> +
> +static void dps310_set_temperature(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    DPS310State *s = DPS310(obj);
> +    Error *local_err = NULL;
> +    int64_t temp;
> +
> +    visit_type_int(v, name, &temp, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    /* TODO */
> +    if (temp >= 200 || temp < -100) {
> +        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
> +                   temp / 1000, temp % 1000);
> +        return;
> +    }
> +

Registers DPS310_TMP_B[210] need an update.

> +    s->temperature = temp;
> +}
> +
> +static void dps310_set_pressure(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    DPS310State *s = DPS310(obj);
> +    Error *local_err = NULL;
> +    int64_t pres;
> +
> +    visit_type_int(v, name, &pres, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    /* TODO */
> +    if (pres >= 200 || pres < -100) {
> +        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " is out of range",
> +                   pres / 1000, pres % 1000);
> +        return;
> +    }
> +

Registers DPS310_PRS_B[210] need an update.

> +    s->pressure = pres;
> +}
> +
> +static void dps310_read(DPS310State *s)
> +{
> +    /* Test should be >=, but we want to include register 0x32 */

So why not make NUM_REGISTERS 0x33 instead.

> +    if (s->pointer > sizeof(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bounds\n",
> +                      __func__, s->pointer);
> +        return;
> +    }
> +
> +    s->len = 0;
> +
> +    switch (s->pointer) {
> +    case DPS310_PRS_B2:
> +    case DPS310_PRS_B1:
> +    case DPS310_PRS_B0:
> +    case DPS310_TMP_B2:
> +    case DPS310_TMP_B1:
> +    case DPS310_TMP_B0:
> +    case DPS310_PRS_CFG:
> +    case DPS310_TMP_CFG:
> +    case DPS310_MEAS_CFG:
> +    case DPS310_CFG_REG:
> +    case DPS310_COEF_BASE...DPS310_COEF_LAST:
> +    case DPS310_COEF_SRC:
> +        s->buf[s->len++] = s->regs[s->pointer];
> +        break;
> +    case 0x32:
> +        /* Undocumented register to indicate workaround not required */
> +        s->buf[s->len++] = 0x2;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
> +                      __func__, s->pointer);
> +        return;
> +    }
> +}
> +
> +static void dps310_write(DPS310State *s)
> +{
> +    if (s->pointer >= sizeof(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\n",
> +                      __func__, s->pointer);
> +        return;
> +    }
> +
> +    switch (s->pointer) {
> +    case DPS310_RESET:
> +        if (s->buf[0] == DPS310_RESET_MAGIC) {
> +            dps310_reset(DEVICE(s));

I think we should use device_cold_reset().

Thanks,

C.


> +        }
> +        break;
> +    case DPS310_PRS_CFG:
> +    case DPS310_TMP_CFG:
> +    case DPS310_MEAS_CFG:
> +    case DPS310_CFG_REG:
> +        s->regs[s->pointer] = s->buf[0];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
> +                      __func__, s->pointer);
> +        return;
> +    }
> +}
> +
> +static uint8_t dps310_rx(I2CSlave *i2c)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    if (s->len < 2) {
> +        return s->buf[s->len++];
> +    } else {
> +        return 0xff;
> +    }
> +}
> +
> +static int dps310_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    if (s->len == 0) {
> +        /*
> +         * first byte is the register pointer for a read or write
> +         * operation
> +         */
> +        s->pointer = data;
> +        s->len++;
> +    } else if (s->len == 1) {
> +        /*
> +         * second byte is the data to write. The device only supports
> +         * one byte writes
> +         */
> +        s->buf[0] = data;
> +        dps310_write(s);
> +    }
> +
> +    return 0;
> +}
> +
> +static int dps310_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    if (event == I2C_START_RECV) {
> +        dps310_read(s);
> +    }
> +
> +    s->len = 0;
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_dps310 = {
> +    .name = "DPS310",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(len, DPS310State),
> +        VMSTATE_UINT8_ARRAY(buf, DPS310State, 2),
> +        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
> +        VMSTATE_UINT8(pointer, DPS310State),
> +        VMSTATE_INT16(temperature, DPS310State),
> +        VMSTATE_INT16(pressure, DPS310State),
> +        VMSTATE_I2C_SLAVE(i2c, DPS310State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void dps310_initfn(Object *obj)
> +{
> +    object_property_add(obj, "temperature", "int",
> +                        dps310_get_temperature,
> +                        dps310_set_temperature, NULL, NULL);
> +    object_property_add(obj, "pressure", "int",
> +                        dps310_get_pressure,
> +                        dps310_set_pressure, NULL, NULL);
> +}
> +
> +static void dps310_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->event = dps310_event;
> +    k->recv = dps310_rx;
> +    k->send = dps310_tx;
> +    dc->reset = dps310_reset;
> +    dc->vmsd = &vmstate_dps310;
> +}
> +
> +static const TypeInfo dps310_info = {
> +    .name          = TYPE_DPS310,
> +    .parent        = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(DPS310State),
> +    .instance_init = dps310_initfn,
> +    .class_init    = dps310_class_init,
> +};
> +
> +static void dps310_register_types(void)
> +{
> +    type_register_static(&dps310_info);
> +}
> +
> +type_init(dps310_register_types)
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 67723d9ea6a8..62925845ebc1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -410,6 +410,7 @@ config ASPEED_SOC
>      select DS1338
>      select FTGMAC100
>      select I2C
> +    select DPS310
>      select PCA9552
>      select SERIAL
>      select SMBUS_EEPROM
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index c71ed2582046..016e34790e4f 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -49,6 +49,10 @@ config EDU
>      default y if TEST_DEVICES
>      depends on PCI && MSI_NONBROKEN
>  
> +config DPS310
> +    bool
> +    depends on I2C
> +
>  config PCA9552
>      bool
>      depends on I2C
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 66e1648533e0..779d8b1582d3 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -1,4 +1,5 @@
>  softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
> +softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
>  softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
>  softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
>  softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
> 


