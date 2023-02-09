Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5AE69017A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1bP-0001TR-Sb; Thu, 09 Feb 2023 02:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1bN-0001T9-30
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:44:17 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1bL-0004Ap-3H
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:44:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso818067wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGyY6FbE8zsJUrBYhfART7wwWlWbqWHQeHDnszkJ5jk=;
 b=CXcX9+h4lIktamScyorzeB1ug2jDmkIy39P4LGS4dSs7Vt+QWrI2HxIx1pC7I645NY
 z2pqzZeEceG1srrmInFQyTPbUWWO1naiP9nYN3cyJ/yP2e5nmO6bf824bBRpwJpCad7h
 NHg4UXhjQAZNID8RUM4lZcn1sVHqrqsBc1XJJ7vh7GIHD933yRXGKe08kwqa0g2BJ3BH
 z4u49BOmIbZMzjTO+XvwJHd4HYYAQvncANb8Tvl4Ak2qypGabpudEdzqTTioc02WbJmc
 /D6lA0I0QrjwabVCfhXWf8m/SO1wkxW1hcRetBiJvADBqR6U6Rhg6becj3pHRJtRhJ5R
 01rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGyY6FbE8zsJUrBYhfART7wwWlWbqWHQeHDnszkJ5jk=;
 b=i/Y6siYN92T18UTmjHPXWyH6zVWMUF/HhL3lIMyTDdIdjmHOL9Xhk0/SsQDJZTaFIl
 umrL2d4hwsg40J7NW+rzXFAZu4JYwHOf/vVioNoo/k0O+VVa8z9Ylobf9NHB2JOXo9iV
 jGX1Poy5Pqi3GGmEB8RhHVESvPq99KxvpR1wkaEoGKmKjlc+m3Ezz8uWV8ChqnXqKzlu
 1SnFlI+lCvjZZSByzgHebhKv9vmIjj4iKN25QrSm0RxSAo59LTaEPSY31MXkyKIzODAR
 XTTH7OAvVHdbGfLitpm/IYdFmR8HisunoK+mXr34VIgPuY+MlOjKofETtdRCPfLZmV/A
 5OAw==
X-Gm-Message-State: AO0yUKWP18JfsP5B8bOhHgRSZEfoKlI5Va3H9PfaboHJyj0OP1j9BAZU
 SaMahxA1WipSWM/6jfZQrqJG/w==
X-Google-Smtp-Source: AK7set9ERxNeBXwgVwglXH4HUqnpjsSH8BTPK9bnTM2d+ZycGzxbBC5DM4ezGsyZBN3nlH0F2jDlZQ==
X-Received: by 2002:a05:600c:1716:b0:3df:f7cc:4da2 with SMTP id
 c22-20020a05600c171600b003dff7cc4da2mr8949795wmn.16.1675928653400; 
 Wed, 08 Feb 2023 23:44:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b003e0238d9101sm1062080wms.31.2023.02.08.23.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:44:12 -0800 (PST)
Message-ID: <4c7d5d77-4001-69d5-7a95-eb546a627b70@linaro.org>
Date: Thu, 9 Feb 2023 08:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/4] hw/gpio: add PCA6416 i2c GPIO expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au,
 Hao Wu <wuhaotsh@google.com>
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-2-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-2-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 23:43, Titus Rwantare wrote:
> The PCA6416 is an i2c device with 16 GPIOs.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/arm/Kconfig                  |   1 +
>   hw/gpio/Kconfig                 |   4 +
>   hw/gpio/meson.build             |   1 +
>   hw/gpio/pca_i2c_gpio.c          | 388 ++++++++++++++++++++++++++++++++
>   hw/gpio/trace-events            |   5 +
>   include/hw/gpio/pca_i2c_gpio.h  |  69 ++++++
>   tests/lcitool/libvirt-ci        |   2 +-
>   tests/qtest/meson.build         |   1 +
>   tests/qtest/pca_i2c_gpio-test.c | 169 ++++++++++++++
>   9 files changed, 639 insertions(+), 1 deletion(-)
>   create mode 100644 hw/gpio/pca_i2c_gpio.c
>   create mode 100644 include/hw/gpio/pca_i2c_gpio.h
>   create mode 100644 tests/qtest/pca_i2c_gpio-test.c
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..1b533ddd76 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -418,6 +418,7 @@ config NPCM7XX
>       select SSI
>       select UNIMP
>       select PCA954X
> +    select PCA_I2C_GPIO

Shouldn't this be s/select/imply/? See docs/devel/kconfig.rst:

   Boards specify their constituent devices using ``imply`` and
   ``select``  directives.  A device should be listed under ``select``
   if the board cannot be started at all without it.  It should be
   listed under ``imply`` if (depending on the QEMU command line) the
   board may or may not be started without it.  Boards also default to
   false; they are  enabled by the ``default-configs/*.mak`` for the
   target they apply to.

Better to split this as another "hw/arm: Allow NPCM7xx machines to use
the PCA6416 i2c GPIO expander" patch.

> +/*
> + * compare new_output to curr_output and update irq to match new_output
> + *
> + * The Input port registers (registers 0 and 1) reflect the incoming logic
> + * levels of the pins, regardless of whether the pin is defined as an input or
> + * an output by the Configuration register.
> + */
> +static void pca_i2c_update_irqs(PCAGPIOState *ps)
> +{
> +    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(ps);
> +    uint16_t out_diff = ps->new_output ^ ps->curr_output;
> +    uint16_t in_diff = ps->new_input ^ ps->curr_input;
> +    uint16_t mask, pin_i;
> +
> +    if (in_diff || out_diff) {
> +        for (int i = 0; i < pc->num_pins; i++) {
> +            mask = BIT(i);
> +            /* pin must be configured as an output to be set here */
> +            if (out_diff & ~ps->config & mask) {
> +                pin_i = mask & ps->new_output;
> +                qemu_set_irq(ps->output[i], pin_i > 0);
> +                ps->curr_output &= ~mask;
> +                ps->curr_output |= pin_i;
> +            }
> +
> +            if (in_diff & mask) {
> +                ps->curr_input &= ~mask;
> +                ps->curr_input |= mask & ps->new_input;
> +            }
> +        }
> +        /* make diff = 0 */
> +        ps->new_input = ps->curr_input;
> +    }
> +}

> +static void pca_i2c_enter_reset(Object *obj, ResetType type)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(obj);
> +    PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(obj);
> +
> +    for (int i = 0; i < pc->num_pins; i++) {
> +        qemu_irq_lower(ps->output[i]);
> +    }
> +
> +    ps->polarity_inv = 0;
> +    ps->config = 0;
> +    ps->curr_input = 0;
> +    ps->curr_output = 0;
> +    ps->new_input = 0;
> +    ps->new_output = 0;
> +    ps->command = 0;
> +}
> +
> +static void pca_i2c_realize(DeviceState *dev, Error **errp)
> +{
> +    PCAGPIOState *ps = PCA_I2C_GPIO(dev);
> +    pca_i2c_update_irqs(ps);
> +}

pca_i2c_realize() occurs once before the reset() handler, so it
seems redundant. We can probably remove it.

> +static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    dc->realize = pca_i2c_realize;
> +    dc->vmsd = &vmstate_pca_i2c_gpio;
> +    rc->phases.enter = pca_i2c_enter_reset;
> +    k->event = pca_i2c_event;
> +}

> +static const TypeInfo pca_gpio_types[] = {
> +    {
> +    .name = TYPE_PCA_I2C_GPIO,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(PCAGPIOState),
> +    .instance_init = pca_i2c_gpio_init,
> +    .class_size = sizeof(PCAGPIOClass),
> +    .class_init = pca_i2c_gpio_class_init,
> +    .abstract = true,

Per CODING_STYLE this should be indented +4 spaces.

> +    },
> +    {
> +    .name = TYPE_PCA6416_GPIO,
> +    .parent = TYPE_PCA_I2C_GPIO,
> +    .class_init = pca6416_gpio_class_init,
> +    },
> +};


> +#define PCA6416_INPUT_PORT_0                 0x00 /* read */
> +#define PCA6416_INPUT_PORT_1                 0x01 /* read */
> +#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
> +#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
> +#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
> +#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
> +#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
> +#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */

IIUC the registers are 16-bit but the I2CSlaveClass API forces you
to process 8-bit at a time. Possible simpler to use the extract /
deposit API:

     #define PCA6416_INPUT_PORT                 0x00 /* read */
     #define PCA6416_OUTPUT_PORT                0x02 /* read/write */

     static uint8_t pca6416_recv(I2CSlave *i2c)
     {
         PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
         unsigned shift = (ps->command) & 1 ? 8 : 0;
         uint8_t data;

         switch (ps->command) {
         case PCA6416_INPUT_PORT:
             data = extract16(ps->curr_input, shift, 8);
             break;

     static int pca6416_send(I2CSlave *i2c, uint8_t data)
     {
         PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
         unsigned shift = (ps->command) & 1 ? 0 : 8;
         ...
         switch (ps->command) {
         ...
         case PCA6416_OUTPUT_PORT:
             ps->new_output = deposit32(ps->new_output, shift 8,
                                        extract16(data, shift, 8));
             break;

Regards,

Phil.

