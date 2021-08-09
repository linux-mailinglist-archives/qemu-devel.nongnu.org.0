Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F193E4960
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:00:33 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7hX-0005OO-GK
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7g9-0004Wa-Ke; Mon, 09 Aug 2021 11:59:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7g7-00044V-Sh; Mon, 09 Aug 2021 11:59:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id b13so22143194wrs.3;
 Mon, 09 Aug 2021 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5XkhmCkO8+LwzDYUTgKzA6Y1oFL1BxjxbU1uw4eK90c=;
 b=Sz9HOqzbhQ1LEuWI2mx6b5RRLClb5ZZ92yU5YcVyjilZzArZt6kukbCmeiBzxOC8mA
 UF6NfTBHOt6WMsrLEvpp167LWpmWVOeQt+sip337FOLMmgQVOU9yzr1cwx+zogCH2P6G
 1nPA6ZpOAxVLrkX5bq1ptUPiAQ0ptcZOkGvtYfPu6swawkXDc/C7Gch8Jc53cI8lr68q
 52rfBGC7EJ3nXhgoX1aAeHOmhnDjmLVznAVevx6tl2IJT8SAd/J8tjNawdw/3kzFV+wZ
 42EYu1jzmkoScIlgy7r2RCbqyLEpXm3Xh6BYiHTUsZHsmi1W6uNNrqBMooMkxJQzuXmB
 FrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5XkhmCkO8+LwzDYUTgKzA6Y1oFL1BxjxbU1uw4eK90c=;
 b=Wk32UhrJCQxKQvTps4bISx8LQuycuFCZtMVC0Q2l4DEx758sZS/VsI3SW0gbPytY0M
 KyaekA/BYfmzvBbwX5sa+45pIgb/wL3g1waEGmcsMqWwCMpLkxnIqcuY75YSyvttFX7D
 bk7OuGdXWEG+pjwajqj14hAXhSYqvKVk8EGmN50aqyG353bcWFVvbpRRFVQIJTVKVOv3
 TbOUVidZT5aftynrRGB+JujYMIxsu/06jrhit67X2HMLTzgfbgYaI0SDDk9zCCh4/2nR
 z4OpVRjnQlj0txPExTEkQO9+0CNJ9dDhdkYxbPZzx4wU0xBgc8MzDkE0qvU03KzpMR6V
 1lug==
X-Gm-Message-State: AOAM533OjQaQam9lrwT4OmM1OyyoLxcxxwylWBOqKux0jb00Lgo8W+Om
 C0gVlRsU591LoaYiuIRewGVHIW5bsfw=
X-Google-Smtp-Source: ABdhPJx45hNh2wWPoG9d6hUq1yiYtXeO0QN+Lo4dneRLc4k8ooMazrn+SyRnzVY37S2wd1kIZjpYRQ==
X-Received: by 2002:a5d:63cf:: with SMTP id c15mr25758682wrw.230.1628524741469; 
 Mon, 09 Aug 2021 08:59:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g16sm24279377wro.63.2021.08.09.08.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 08:59:01 -0700 (PDT)
Subject: Re: [PATCH 09/10] hw/misc: Add Infineon DPS310 sensor model
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-10-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1efe1466-a8ee-40be-c703-6cf868721110@amsat.org>
Date: Mon, 9 Aug 2021 17:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131556.686260-10-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:15 PM, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> This contains some hardcoded register values that were obtained from the
> hardware after reading the temperature.
> 
> It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
> operation modes other than the default as used by Linux are not modelled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: Fix sequential reading ]
> Message-Id: <20210616073358.750472-2-joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20210629142336.750058-4-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig      |   1 +
>  hw/misc/Kconfig     |   4 +
>  hw/misc/meson.build |   1 +
>  4 files changed, 233 insertions(+)
>  create mode 100644 hw/misc/dps310.c
> 
> diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
> new file mode 100644
> index 000000000000..893521ab8516
> --- /dev/null
> +++ b/hw/misc/dps310.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
> + *
> + * Infineon DPS310 temperature and humidity sensor
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
> +    uint8_t len;
> +    uint8_t pointer;
> +
> +} DPS310State;

> +static void dps310_reset(DeviceState *dev)
> +{
> +    DPS310State *s = DPS310(dev);
> +
> +    static const uint8_t regs_reset_state[] = {

       static const uint8_t regs_reset_state[NUM_REGISTERS] = {

> +        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, 0x00,
> +        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, 0x52,
> +        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, 0x00,
> +        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +        0x60, 0x15, 0x02
> +    };
> +
> +    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) != sizeof(s->regs));

and drop QEMU_BUILD_BUG_ON?

> +
> +    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
> +    s->pointer = 0;
> +
> +    /* TODO: assert these after some timeout ? */
> +    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
> +        | DPS310_TMP_RDY | DPS310_PRS_RDY;
> +}

