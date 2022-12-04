Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5C641FEB
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 22:41:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1wiR-0006Un-9x; Sun, 04 Dec 2022 16:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wiQ-0006Sr-2s
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:40:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wiN-0007ri-TD
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:40:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so7823901wmc.0
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 13:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZiivK4Ue41Ik5hpxQLCRrMjLtGXHowbGQJxopnI6iAQ=;
 b=M99M1hy1wFhcmWz+Tklo13iYeSHIMU8Ml6o1/c6vqaG2QF5Bu78tEQYQemtawKzaZ2
 U5KoztvFzU/OyhgMcwedG7F+4WIMgGm/jEOIp6Tdu6Z0GYlQrLJO2OVA5tNYDNdgUEfT
 COxkh5w7wK4fyzwQeq17LnemKfSHBrjdPfjRz7h97HT5BXVVbZUYG3h/g5Nh6cfTLxYZ
 jopBLZI9W2gnOEhzWUXqotJ+GXrENQWk4wCTxLYCeW9tv/ABFE4pr8rlgQ1h4IcrFiFG
 Bqfr1pG7mmXdS8KdI8YdyTCvNDUU+eh9iMgXKO+1QqfskjUnwXXu8oB8tN4i2mkN2mdH
 YxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiivK4Ue41Ik5hpxQLCRrMjLtGXHowbGQJxopnI6iAQ=;
 b=niDs2XxwI25Q2Kd0g75vBxnfYxT8Si3tRqyoAPQhJVkaCK23Fk3PERxOB9zsspEX2f
 mv4QbgU0DT2oI2m8qIdDj3DxN+LGosEzst+R6ZAZcVygHbol1Zk/fETknSfalbaAfk87
 I4P26XzPVjnGEsSrbja/MXWDE5YbZBYTMD9DgZHklpm2hhn8KhEPRP80/mXix4A55bYZ
 XpuVeWkWPqdxGEmEU7iLSR1g38O2duo041HRQRoUGhbdnG/yc6MD6ITgLieIihxJUlr+
 YXS+znXG5tF0O2XzgWIHtHeI+1mPq57M6WaQGACkCp5WhA8I01aBVuh8+HtKlCCVqyA2
 6yqA==
X-Gm-Message-State: ANoB5pnkwk8JV5VD1Iz/gUnaLIzIPb9GqeK/XrKAIVZgphR4xpz0A3yi
 0PtCo24DeNXEd9rkPPI1sj8dPA==
X-Google-Smtp-Source: AA0mqf5MBZLwVg/TPRR46zxypNq5nRrEJqYMFOUz0wumysPkXF0oX3eT6lPhSwFRv6dfyzidTibcaw==
X-Received: by 2002:a05:600c:554b:b0:3d0:88b4:9cda with SMTP id
 iz11-20020a05600c554b00b003d088b49cdamr7735375wmb.114.1670189997677; 
 Sun, 04 Dec 2022 13:39:57 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b002421ce6a275sm12459530wrx.114.2022.12.04.13.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 13:39:57 -0800 (PST)
Message-ID: <4af65cc1-965a-24e7-80f5-7b23d33f8e89@linaro.org>
Date: Sun, 4 Dec 2022 22:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] hw/misc: Allwinner AXP-209 Emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-5-strahinja.p.jankovic@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221203231904.25155-5-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

Hi Strahinja,

On 4/12/22 00:19, Strahinja Jankovic wrote:
> This patch adds minimal support for AXP-209 PMU.
> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> the chip ID register, reset values for two more registers used by A10
> U-Boot SPL are covered.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   hw/arm/Kconfig              |   1 +
>   hw/misc/Kconfig             |   4 +
>   hw/misc/allwinner-axp-209.c | 263 ++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build         |   1 +
>   4 files changed, 269 insertions(+)
>   create mode 100644 hw/misc/allwinner-axp-209.c


> diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
> new file mode 100644
> index 0000000000..229e3961b6
> --- /dev/null
> +++ b/hw/misc/allwinner-axp-209.c
> @@ -0,0 +1,263 @@
> +/*
> + * AXP-209 Emulation
> + *
> + * Written by Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *

You missed the "Copyright (c) <year> <copyright holders>" line.

> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.

If you mind, please also include:

     * SPDX-License-Identifier: MIT

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +
> +#ifndef AXP_209_ERR_DEBUG
> +#define AXP_209_ERR_DEBUG 0
> +#endif
> +
> +#define TYPE_AXP_209 "allwinner.axp209"
> +
> +#define AXP_209(obj) \
> +    OBJECT_CHECK(AXP209I2CState, (obj), TYPE_AXP_209)
> +
> +#define DB_PRINT(fmt, args...) do { \
> +    if (AXP_209_ERR_DEBUG) { \
> +        fprintf(stderr, "%s: " fmt, __func__, ## args); \

Please replace the DB_PRINT() calls by trace events which are more
powerful: when a tracing backend is present, the events are built
in and you can individually enable them at runtime.

> +    } \
> +} while (0)


> +#define AXP_209_CHIP_VERSION_ID             (0x01)
> +#define AXP_209_DC_DC2_OUT_V_CTRL_RESET     (0x16)
> +#define AXP_209_IRQ_BANK_1_CTRL_RESET       (0xd8)


> +/* Reset all counters and load ID register */
> +static void axp_209_reset_enter(Object *obj, ResetType type)
> +{
> +    AXP209I2CState *s = AXP_209(obj);
> +
> +    memset(s->regs, 0, NR_REGS);
> +    s->ptr = 0;
> +    s->count = 0;
> +    s->regs[REG_CHIP_VERSION] = AXP_209_CHIP_VERSION_ID;
> +    s->regs[REG_DC_DC2_OUT_V_CTRL] = AXP_209_DC_DC2_OUT_V_CTRL_RESET;
> +    s->regs[REG_IRQ_BANK_1_CTRL] = AXP_209_IRQ_BANK_1_CTRL_RESET;
> +}


> +/* Initialization */
> +static void axp_209_init(Object *obj)
> +{
> +    AXP209I2CState *s = AXP_209(obj);
> +
> +    s->count = 0;
> +    s->ptr = 0;
> +    memset(s->regs, 0, NR_REGS);
> +    s->regs[REG_CHIP_VERSION] = AXP_209_CHIP_VERSION_ID;
> +    s->regs[REG_DC_DC2_OUT_V_CTRL] = 0x16;
> +    s->regs[REG_IRQ_BANK_1_CTRL] = 0xd8;

The device initialization flow is:

  - init()
  - realize()
  - reset()

So these values are already set in axp_209_reset_enter().

Besides, you should use the definition you added instead of
magic values (AXP_209_DC_DC2_OUT_V_CTRL_RESET and
AXP_209_IRQ_BANK_1_CTRL_RESET).

> +
> +    DB_PRINT("INIT AXP209\n");
> +
> +    return;
> +}

Otherwise LGTM!

Thanks,

Phil.

