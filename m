Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A54CE163
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:18:03 +0100 (CET)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQI7W-0004sA-Nt
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI6f-0003zo-RN; Fri, 04 Mar 2022 19:17:09 -0500
Received: from [2607:f8b0:4864:20::635] (port=33622
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI6e-0006A4-53; Fri, 04 Mar 2022 19:17:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id m2so3159439pll.0;
 Fri, 04 Mar 2022 16:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/+LBsr+R8aZv4TEpfYVzSgOSHkJOKaDP2KR3gMyfG8c=;
 b=qP3uEoRzHacmu0jvmy0WivbwforaxjN7oD0Iq1WiycXPis2GxdGtVLBYug4YcphiCx
 9REefjcMPytRW2xIAmDmopOzpbWYZIHZXpU6gEH059H1EFzCAjj45ZQqappqRSLEQVG5
 E7yN1bWCc5Cnuq3bsaho8fj65t0WkSfOu2z+unzn3a+/d6tE4HmmYYKfKCp/8Fwaryfa
 TmT30qjR6lEMUXa4P1M0w+3V5S63QrvsFdPfIvFW9EppWjacuDt0hXMNi8Nm/t8JiAKd
 TS7Cg6ANDnLnSpzRWdJECba9yFRfLhrA7hVbxixmeu6vLGUJ5NiQZzkeZmwbsgBz3eE6
 QJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+LBsr+R8aZv4TEpfYVzSgOSHkJOKaDP2KR3gMyfG8c=;
 b=dbZCyiYKU/6tuuQlJlU553agfDLsGyx5e4AW6Jvxa1YM4F+MUkAYmwfPszTlqJAIzL
 hEYIPAYvz+PmUuBKfrXrn/tWwxtFiiwJAwwJ4e1mQnRADTSmVG4K+HFmqKGzN+Rje3Sy
 Z+MtiBUCpWo0djuVX2BEqI9yeatPOr+jgylTifUrc3KrRz7IJVBnb+IKVBR+U0/ojGFl
 M4W0SavTP1qmnA5p9ck8XoDBZw4PFbY0TZruXv81b6dkJb/AjReTubjWk+00bohYMTOI
 xwdAIvzFFCysN/Ak7mzzJ0z5ziVUNtShoeUT8dbMmtObDO6zBnHHNmvdQiYPZOZmqZX5
 2fNA==
X-Gm-Message-State: AOAM532dpqX8Eup7VfH72T3XFcPAVeDTUsMtxGmN78/ZP7M3Ah0vNmj7
 ORMB3pqKiHHtAXoun+KhiUA=
X-Google-Smtp-Source: ABdhPJz3ez7nEh1yo3ZkPdqoPQu/bzNd37Y6hzW34oMkdHOyULMt/XmTh7wu9UhE7j7RPu/2Xz9Ftw==
X-Received: by 2002:a17:90b:1193:b0:1bc:1b5a:84e4 with SMTP id
 gk19-20020a17090b119300b001bc1b5a84e4mr13425326pjb.113.1646439426295; 
 Fri, 04 Mar 2022 16:17:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s42-20020a056a0017aa00b004df8133df4asm7243463pfg.179.2022.03.04.16.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:17:05 -0800 (PST)
Message-ID: <1a2a23d4-b00f-24f5-aec2-f60a02ef36b6@gmail.com>
Date: Sat, 5 Mar 2022 01:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 7/9] hw/sensor: add Intersil ISL69260 device model
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-8-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-8-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   MAINTAINERS                      |   3 +
>   hw/arm/Kconfig                   |   1 +
>   hw/sensor/Kconfig                |   5 +
>   hw/sensor/isl_pmbus_vr.c         | 211 +++++++++++++++++
>   hw/sensor/meson.build            |   1 +
>   include/hw/sensor/isl_pmbus_vr.h |  50 ++++
>   tests/qtest/isl_pmbus_vr-test.c  | 394 +++++++++++++++++++++++++++++++
>   tests/qtest/meson.build          |   1 +
>   8 files changed, 666 insertions(+)
>   create mode 100644 hw/sensor/isl_pmbus_vr.c
>   create mode 100644 include/hw/sensor/isl_pmbus_vr.h
>   create mode 100644 tests/qtest/isl_pmbus_vr-test.c

> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index 215944decc..a834d2f814 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -30,3 +30,8 @@ config LSM303DLHC_MAG
>       bool
>       depends on I2C
>       default y if I2C_DEVICES
> +
> +config ISL_PMBUS_VR
> +    bool
> +    depends on I2C

There is a PMBUS kconfig selector (which selects SMBUS -> I2C).

> +
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> new file mode 100644
> index 0000000000..b3d24e40ab
> --- /dev/null
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -0,0 +1,211 @@
> +/*
> + * PMBus device for Renesas Digital Multiphase Voltage Regulators
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sensor/isl_pmbus_vr.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/visitor.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: reading from unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;

Eventually PMBUS_ERROR_BYTE.

> +}
> +
> +static int isl_pmbus_vr_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> +                              uint8_t len)

Mis-aligned.

> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: write to unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;
> +}

> +static void raa22xx_init(Object *obj)
> +{
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    uint64_t flags[2];
> +
> +    flags[0] = PB_HAS_VIN | PB_HAS_VOUT | PB_HAS_VOUT_MODE |
> +               PB_HAS_VOUT_RATING | PB_HAS_VOUT_MARGIN | PB_HAS_IIN |
> +               PB_HAS_IOUT | PB_HAS_PIN | PB_HAS_POUT | PB_HAS_TEMPERATURE |
> +               PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
> +    flags[1] = PB_HAS_IIN | PB_HAS_PIN | PB_HAS_TEMPERATURE | PB_HAS_TEMP3 |
> +               PB_HAS_VOUT | PB_HAS_VOUT_MODE | PB_HAS_VOUT_MARGIN |
> +               PB_HAS_VOUT_RATING | PB_HAS_IOUT | PB_HAS_POUT |
> +               PB_HAS_STATUS_MFR_SPECIFIC;
> +
> +    pmbus_page_config(pmdev, 0, flags[0]);
> +    pmbus_page_config(pmdev, 1, flags[1]);
> +    isl_pmbus_vr_add_props(obj, flags, 2);

Eventually 2 -> ARRAY_SIZE(flags).

> +++ b/include/hw/sensor/isl_pmbus_vr.h
> @@ -0,0 +1,50 @@
> +/*
> + * PMBus device for Renesas Digital Multiphase Voltage Regulators
> + *
> + * Copyright 2022 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_MISC_ISL_PMBUS_VR_H
> +#define HW_MISC_ISL_PMBUS_VR_H
> +
> +#include "hw/i2c/pmbus_device.h"
> +#include "qom/object.h"
> +
> +#define TYPE_ISL69260   "isl69260"
> +
> +struct ISLState {
> +    PMBusDevice parent;
> +};
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
> +
> +#define ISL_CAPABILITY_DEFAULT                 0x40
> +#define ISL_OPERATION_DEFAULT                  0x80
> +#define ISL_ON_OFF_CONFIG_DEFAULT              0x16
> +#define ISL_VOUT_MODE_DEFAULT                  0x40
> +#define ISL_VOUT_COMMAND_DEFAULT               0x0384
> +#define ISL_VOUT_MAX_DEFAULT                   0x08FC
> +#define ISL_VOUT_MARGIN_HIGH_DEFAULT           0x0640
> +#define ISL_VOUT_MARGIN_LOW_DEFAULT            0xFA
> +#define ISL_VOUT_TRANSITION_RATE_DEFAULT       0x64
> +#define ISL_VOUT_OV_FAULT_LIMIT_DEFAULT        0x076C
> +#define ISL_OT_FAULT_LIMIT_DEFAULT             0x7D
> +#define ISL_OT_WARN_LIMIT_DEFAULT              0x07D0
> +#define ISL_VIN_OV_WARN_LIMIT_DEFAULT          0x36B0
> +#define ISL_VIN_UV_WARN_LIMIT_DEFAULT          0x1F40
> +#define ISL_IIN_OC_FAULT_LIMIT_DEFAULT         0x32
> +#define ISL_TON_DELAY_DEFAULT                  0x14
> +#define ISL_TON_RISE_DEFAULT                   0x01F4
> +#define ISL_TOFF_FALL_DEFAULT                  0x01F4
> +#define ISL_REVISION_DEFAULT                   0x33
> +#define ISL_READ_VOUT_DEFAULT                  1000
> +#define ISL_READ_IOUT_DEFAULT                  40
> +#define ISL_READ_POUT_DEFAULT                  4
> +#define ISL_READ_TEMP_DEFAULT                  25
> +#define ISL_READ_VIN_DEFAULT                   1100
> +#define ISL_READ_IIN_DEFAULT                   40
> +#define ISL_READ_PIN_DEFAULT                   4

Hmmm we need to expose the DEFAULT definitions for the tests. OK.

Changing Kconfig:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

