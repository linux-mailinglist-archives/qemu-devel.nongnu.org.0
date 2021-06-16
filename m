Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1323A95B0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:14:05 +0200 (CEST)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRca-0005OV-Bx
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRY9-0000rH-S5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:09:29 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:58015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRY5-0001xu-BM
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:09:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 90C81281726;
 Wed, 16 Jun 2021 11:09:21 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 16 Jun
 2021 11:09:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005c0e3d6af-bf85-4a20-a315-4fed9b99066f,
 06345D7E1B8C8FAD34147FE460F0DA442DB8F7FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2 1/2] hw/misc: Add Infineon DPS310 sensor model
To: Joel Stanley <joel@jms.id.au>
References: <20210616073358.750472-1-joel@jms.id.au>
 <20210616073358.750472-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5aadfb16-c563-9097-95c6-52f88be20468@kaod.org>
Date: Wed, 16 Jun 2021 11:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616073358.750472-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6a21fd48-0c59-4f8d-b14b-fd2bb25a5804
X-Ovh-Tracer-Id: 13817325133771541472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuefhleeffeejueektedvvedttddtvefgleevffelkedtfeduvdefkeeftdelvdffnecuffhomhgrihhnpehinhhfihhnvghonhdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/16/21 9:33 AM, Joel Stanley wrote:
> This contains some hardcoded register values that were obtained from the
> hardware after reading the temperature.
> 
> It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
> operation modes other than the default as used by Linux are not modelled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Some minor comments,

> ---
> v2:
>  - remove unused class
>  - remove use of GENMASK
>  - move reg reset state into an array
>  - remove half implemented get/set callbacks
>  - set NUM_REGISTERS to 0x33, avoid special casing undocumented register
>  - use device_cold_reset
>  - add buildtime assert for array size
> ---
>  hw/misc/dps310.c    | 231 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig      |   1 +
>  hw/misc/Kconfig     |   4 +
>  hw/misc/meson.build |   1 +
>  4 files changed, 237 insertions(+)
>  create mode 100644 hw/misc/dps310.c
> 
> diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
> new file mode 100644
> index 000000000000..82b727ab4287
> --- /dev/null
> +++ b/hw/misc/dps310.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2017 Joel Stanley <joel@jms.id.au>, IBM Corporation
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
> +#define NUM_REGISTERS   0x33
> +
> +typedef struct DPS310State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +
> +    /*< public >*/
> +    uint8_t regs[NUM_REGISTERS];
> +
> +    int16_t pressure, temperature;


We don't need those fields anymore. I will remove them if you are ok
with that. 

Thanks,

C. 

> +
> +    uint8_t len;
> +    uint8_t buf[2];
> +    uint8_t pointer;
> +
> +} DPS310State;
> +
> +#define TYPE_DPS310 "dps310"
> +#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
> +
> +#define DPS310_PRS_B2           0x00
> +#define DPS310_PRS_B1           0x01
> +#define DPS310_PRS_B0           0x02
> +#define DPS310_TMP_B2           0x03
> +#define DPS310_TMP_B1           0x04
> +#define DPS310_TMP_B0           0x05
> +#define DPS310_PRS_CFG          0x06
> +#define DPS310_TMP_CFG          0x07
> +#define  DPS310_TMP_RATE_BITS   (0x70)
> +#define DPS310_MEAS_CFG         0x08
> +#define  DPS310_MEAS_CTRL_BITS  (0x07)
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
> +    static const uint8_t regs_reset_state[] = {
> +        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, 0x00,
> +        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, 0x52,
> +        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, 0x00,
> +        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +        0x60, 0x15, 0x02
> +    };
> +
> +    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) != sizeof(s->regs));
> +
> +    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
> +    s->pointer = 0;
> +
> +    /* TODO: assert these after some timeout ? */
> +    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
> +        | DPS310_TMP_RDY | DPS310_PRS_RDY;
> +}
> +
> +static void dps310_read(DPS310State *s)
> +{
> +    if (s->pointer >= sizeof(s->regs)) {
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
> +    case 0x32: /* Undocumented register to indicate workaround not required */
> +        s->buf[s->len++] = s->regs[s->pointer];
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
> +            device_cold_reset(DEVICE(s));
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


