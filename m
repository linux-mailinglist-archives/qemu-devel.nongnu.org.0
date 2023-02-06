Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEE68C8D9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9CT-0005o8-2M; Mon, 06 Feb 2023 16:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP9CQ-0005nd-ID
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:38:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP9CO-0002N3-6t
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:38:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y1so11786305wru.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OZW+6ARDIbwGfQfoURqZMkkZS/l4UsheveM0zykAfNk=;
 b=ijxZ7IxWjA40sxVLcC2y6yYSR7QVseZYw7GTLt3W0gy1CYlbjCo3hMiBHyiH8pCrWp
 SzZn0gnBJZo0itPJePjvAfxaV/vyTlTWp+FZaRgIJ3KcCFX54wg8sccAHzkguR1+hWRX
 Od3LwOxjN6Vkfe5rGdn7SsdZ5aiPuWEBTTb95uRdH2bCeS7+Nj/NZn++3fi4q4Vmrw+N
 f9sksZQpplowOHLN+tpzhtqn+RsN6TM8NfupayzmieNOrS5sTQhI1si8j1ZZW6/3Woow
 c7QUG6n9vMesrq3g9FaNI/yxgvorQ5Hec0mQEl33qbsRvN6sTO5gj0C18CQxOgpoi0OE
 Jlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZW+6ARDIbwGfQfoURqZMkkZS/l4UsheveM0zykAfNk=;
 b=44W+wJR4uxOpa4Cn04ckTnvsZJvMyPe0DViVpFN0sY9tj3MZkx/8/rvwP04KC3RVva
 dKVrjZCBPRUlQUlmoZZNGVP0LEi6mZqRl/88OtpNKBD4Byv3sDSFuCptrFOzXDS+uqFI
 47dXtyDuYEXaG/QCfWVFf5Yrd5jnFBn4hoMLoSuxjUXp7X12Rt5MvVWC0Amg90wgqRmw
 KOYK6ZK2MLRDaafl5epvN34AN7rkYJG5bLz5Fsb9x3soudGLapXl+ZnIa7LgMNfmM9ds
 97EDaH5W4RjLvN5RlO0HlfKpCc4/nl+At1bUokz3zNv00nOhUWDHsJ6RraJ2a/tVLdER
 GNAQ==
X-Gm-Message-State: AO0yUKXNzkju4DFTKjlrsGdOCHEsbVJsg6y0MhXnvntjnsCbDdViCRx5
 S0JZS4qlpVrAfqatGYMbPdbTXg==
X-Google-Smtp-Source: AK7set+56+NyK7A2rfgBD44QrM3FSSxp4pOufywvrPBpc3BOpcJvxTZYJwGWBdr80P5kn1QMtaX4mg==
X-Received: by 2002:adf:f6cc:0:b0:2c3:e356:694e with SMTP id
 y12-20020adff6cc000000b002c3e356694emr353373wrp.22.1675719530354; 
 Mon, 06 Feb 2023 13:38:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adffb4e000000b002be0b1e556esm9569113wrs.59.2023.02.06.13.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 13:38:49 -0800 (PST)
Message-ID: <3863220f-08b2-6cf2-20e7-eb67691d525b@linaro.org>
Date: Mon, 6 Feb 2023 22:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206194936.168843-2-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

Hi Titus,

On 6/2/23 20:49, Titus Rwantare wrote:
> This is a simple i2c device that allows i2c capable devices to have
> GPIOs.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/arm/Kconfig                  |   1 +
>   hw/gpio/meson.build             |   1 +
>   hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
>   hw/gpio/trace-events            |   5 +
>   hw/i2c/Kconfig                  |   4 +
>   include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
>   tests/qtest/meson.build         |   1 +
>   tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
>   8 files changed, 615 insertions(+)
>   create mode 100644 hw/gpio/pca_i2c_gpio.c
>   create mode 100644 include/hw/gpio/pca_i2c_gpio.h
>   create mode 100644 tests/qtest/pca_i2c_gpio-test.c


> +/* slave to master */
> +static uint8_t pca6416_recv(I2CSlave *i2c)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
> +    uint8_t data;
> +
> +    switch (ps->command) {
> +    case PCA6416_INPUT_PORT_0:
> +        data = ps->curr_input;
> +        break;
> +
> +    case PCA6416_INPUT_PORT_1:
> +        data = ps->curr_input >> 8;
> +        break;
> +
> +    /*
> +     * i2c reads to the output registers reflect the values written
> +     * NOT the actual values of the gpios
> +     */
> +    case PCA6416_OUTPUT_PORT_0:
> +        data = ps->new_output;
> +        break;
> +
> +    case PCA6416_OUTPUT_PORT_1:
> +        data = ps->new_output >> 8;
> +        break;
> +
> +    case PCA6416_POLARITY_INVERSION_PORT_0:
> +        data = ps->polarity_inv;
> +        break;
> +
> +    case PCA6416_POLARITY_INVERSION_PORT_1:
> +        data = ps->polarity_inv >> 8;
> +        break;
> +
> +    case PCA6416_CONFIGURATION_PORT_0:
> +        data = ps->config;
> +        break;
> +
> +    case PCA6416_CONFIGURATION_PORT_1:
> +        data = ps->config >> 8;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: reading from unsupported register 0x%02x",

Some of your qemu_log_mask() calls miss the trailing newline.

> +                      __func__, ps->command);
> +        data = 0xFF;
> +        break;
> +    }
> +
> +    trace_pca_i2c_recv(DEVICE(ps)->canonical_path, ps->command, data);
> +    return data;
> +}
> +
> +/* master to slave */
> +static int pca6416_send(I2CSlave *i2c, uint8_t data)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
> +    if (ps->i2c_cmd) {
> +        ps->command = data;
> +        ps->i2c_cmd = false;
> +        return 0;
> +    }
> +
> +    trace_pca_i2c_send(DEVICE(ps)->canonical_path, ps->command, data);
> +
> +    switch (ps->command) {
> +    case PCA6416_INPUT_PORT_0:
> +    case PCA6416_INPUT_PORT_1:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing to read only reg: 0x%02x",
> +                      __func__, ps->command);
> +        break;


> +static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_RECV");

Maybe add the canonical_path to trace_i2c_event() so this is useful
for all I2C devices.

> +        break;
> +
> +    case I2C_START_SEND:
> +        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_SEND");
> +        ps->i2c_cmd = true;
> +        break;
> +
> +    case I2C_FINISH:
> +        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "FINISH");
> +        break;
> +
> +    case I2C_NACK:
> +        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "NACK");
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: unknown event 0x%x\n",
> +                      DEVICE(ps)->canonical_path, __func__, event);
> +        return -1;
> +    }
> +
> +    return 0;
> +}


> +static void pca_i2c_realize(DeviceState *dev, Error **errp)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(dev);
> +    pca_i2c_update_irqs(ps);

There is no reset() handler, is that on purpose?


> +static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
> +
> +    dc->desc = "PCA6416 16-bit I/O expander";

Why not set these 3 ...:

> +    dc->realize = pca_i2c_realize;
> +    dc->vmsd = &vmstate_pca_i2c_gpio;
> +
> +    k->event = pca_i2c_event;

... in a base abstract class pca_i2c_gpio_class_init()?

> +    k->recv = pca6416_recv;
> +    k->send = pca6416_send;
> +
> +    pc->num_pins = PCA6416_NUM_PINS;
> +}

> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 14886b35da..b59a79fddf 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -42,6 +42,10 @@ config PCA954X
>       bool
>       select I2C
>   
> +config PCA_I2C_GPIO
> +    bool
> +    select I2C

This should be 'depends on I2C'.

Apparently various entries are incorrect in this file.

Per docs/devel/kconfig.rst:

   Devices *depend on* the bus that they lie on, for example a PCI
   device would specify ``depends on PCI``.  An MMIO device will likely
   have no ``depends on`` directive.  Devices also *select* the buses
   that the device provides, for example a SCSI adapter would specify
   ``select SCSI``.

> diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
> new file mode 100644
> index 0000000000..a10897c0e0
> --- /dev/null
> +++ b/include/hw/gpio/pca_i2c_gpio.h
> @@ -0,0 +1,72 @@
> +/*
> + * NXP PCA6416A
> + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
> + * reset, and configuration registers
> + *
> + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
> + *
> + * Note: Polarity inversion emulation not implemented
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef PCA_I2C_GPIO_H
> +#define PCA_I2C_GPIO_H
> +
> +#include "hw/i2c/i2c.h"
> +#include "qom/object.h"
> +
> +#define PCA6416_NUM_PINS         16

^ This is specific to TYPE_PCA6416_GPIO, and you set
PCAGPIOClass::num_pins to it in pca6416_gpio_class_init(), ...

> +
> +typedef struct PCAGPIOClass {
> +    I2CSlaveClass parent;
> +
> +    uint8_t num_pins;
> +} PCAGPIOClass;
> +
> +typedef struct PCAGPIOState {

... but this defines the generic TYPE_PCA_I2C_GPIO ...

> +    I2CSlave parent;
> +
> +    uint16_t polarity_inv;
> +    uint16_t config;
> +
> +    /* the values of the gpio pins are mirrored in these integers */
> +    uint16_t curr_input;
> +    uint16_t curr_output;
> +    uint16_t new_input;
> +    uint16_t new_output;
> +
> +    /*
> +     * Note that these outputs need to be consumed by some other input
> +     * to be useful, qemu ignores writes to disconnected gpio pins
> +     */
> +    qemu_irq output[PCA6416_NUM_PINS];

... which is now clamped to 16 pins.

Maybe define/use PCA_I2C_GPIO_MAX_PINS instead here, and assert
PCAGPIOClass::num_pins <= PCA_I2C_GPIO_MAX_PINS in
pca_i2c_gpio_class_init() or a realize?

Actually we don't need PCA6416_NUM_PINS, PCA_I2C_GPIO_MAX_PINS is
enough; and we can set 'pc->num_pins = 16' in pca6416_gpio_class_init()
or use PCA6416_NUM_PINS but restrict its definition in pca_i2c_gpio.c.

> +    /* i2c transaction info */
> +    uint8_t command;
> +    bool i2c_cmd;
> +
> +} PCAGPIOState;
> +
> +#define TYPE_PCA_I2C_GPIO "pca_i2c_gpio"
> +OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
> +
> +#define PCA6416_INPUT_PORT_0                 0x00 /* read */
> +#define PCA6416_INPUT_PORT_1                 0x01 /* read */
> +#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
> +#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
> +#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
> +#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
> +#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
> +#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
> +
> +#define PCA6416_OUTPUT_DEFAULT               0xFFFF
> +#define PCA6416_CONFIG_DEFAULT               0xFFFF
> +
> +#define PCA_I2C_OUTPUT_DEFAULT               0xFFFF
> +#define PCA_I2C_CONFIG_DEFAULT               0xFFFF

(These register definitions could be kept internal in pca_i2c_gpio.c).

> +#define TYPE_PCA6416_GPIO "pca6416"
> +
> +#endif

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e97616d327..49f406af6b 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -241,6 +241,7 @@ qos_test_ss.add(
>     'ne2000-test.c',
>     'tulip-test.c',
>     'nvme-test.c',
> +  'pca_i2c_gpio-test.c',

Should this be conditional to
config_all_devices.has_key('CONFIG_PCA_I2C_GPIO')?

>     'pca9552-test.c',
>     'pci-test.c',
>     'pcnet-test.c',

Mostly nitpicking, LGTM otherwise :)

Regards,

Phil.

