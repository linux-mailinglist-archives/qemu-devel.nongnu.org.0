Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C94B0C7D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:39:06 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7mz-0002X1-HP
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:39:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7he-0006KN-VZ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:33:35 -0500
Received: from [2607:f8b0:4864:20::632] (port=36498
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7hc-0003P2-F2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:33:34 -0500
Received: by mail-pl1-x632.google.com with SMTP id x3so1578909pll.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kKjdH4KHGNFUtDcBgylICB2jOjhi8eSqM/Q9cp9+5Y=;
 b=qhiwn2vKm+FyQfnu//+f7mgULxMQ3UlQo+8Uo41eZU3yQoPPybJr2jzJkAwZQys2sZ
 yvm5MQs/bwXw+W68cbZs2H5yIydyKVlP4EK/YpXVjvs9Lkr+76spd56Z1TmHoHUmS6bw
 Tb0roNJ4uo1kKcDDQLzJsJ0CUkmtlAQoL4vHHcGKiT9EJ8R9u60uH5MCgsAvww6sI9TO
 h3Fc/hrfVI+avwng0LgM2LMfgJrjE2nf9XytucYQmfhaTkXybbGTn2IE15hW2FUUbgNn
 YpGmcSCZfbXDTnnu+xrYR6wU8MXKsBbTVQkfGgkvXBd6dLqHXfMH3Gy00DiIC5UXi1+6
 iX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kKjdH4KHGNFUtDcBgylICB2jOjhi8eSqM/Q9cp9+5Y=;
 b=I+Pdv/lZVVP9WLJ7PYjrvhVbCS7OMD6NEh0FZbIWshJT8ocBHDwMQLK9Qi1vMGUWfZ
 gCmANX4xlbs3shebNm0Lk0/V9uweYjGznrMfKEQgnjUA8AuPgNFF2c8zEx0vxzzeAOEW
 FFGqgU19YZ6vhgAKyDmTQO0BGg8xR8jSSJPoZtUVSnWNLdG9PbYBa4VR+mmj/Iz/8sD7
 JQ2DBzC4/F97ILeAEE/ItmVm0O1/prNFY1J4ZdBwo+dlMiX7Y5hYjNuPjvi1usEpODLL
 YCk8vUg79q8gvUZzINZGT+cIwDwVHRTRaktdDe+eLhVhyhkh+q6ccZKdkAn6jsRm2QZH
 147A==
X-Gm-Message-State: AOAM533+JUwAv8CdIVpSyicGy67N+B9Uh+meequdHoYc3FCtUuQVjd0r
 qXt8GK1txTyCwbdqS4Qw1ps=
X-Google-Smtp-Source: ABdhPJxXV1cS++VkdVBtpI8A3L5ctDBe/Ns4YVkVOaxYYvRyfg0K3c6PUw5GCzzEjy7NOsKMFhbgdw==
X-Received: by 2002:a17:902:d4d2:: with SMTP id
 o18mr7402715plg.70.1644492810843; 
 Thu, 10 Feb 2022 03:33:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w4sm16182155pgs.28.2022.02.10.03.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:33:30 -0800 (PST)
Message-ID: <3f71b1e2-63f0-2d7b-f70c-50e439ba374b@amsat.org>
Date: Thu, 10 Feb 2022 12:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4] hw/sensor: Add lsm303dlhc magnetometer device
Content-Language: en-US
To: Kevin Townsend <kevin.townsend@linaro.org>, qemu-devel@nongnu.org
References: <20220130095032.35392-1-kevin.townsend@linaro.org>
In-Reply-To: <20220130095032.35392-1-kevin.townsend@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Kevin,

On 30/1/22 10:50, Kevin Townsend wrote:
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> mag-x, mag-y and mag-z properties, as well as the 12-bit
> temperature output via the temperature property. Sensor can be
> enabled with 'CONFIG_LSM303DLHC_MAG=y'.
> 
> Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
> ---
>   hw/sensor/Kconfig                 |   4 +
>   hw/sensor/lsm303dlhc_mag.c        | 556 ++++++++++++++++++++++++++++++
>   hw/sensor/meson.build             |   1 +
>   tests/qtest/lsm303dlhc-mag-test.c | 148 ++++++++
>   tests/qtest/meson.build           |   1 +
>   5 files changed, 710 insertions(+)
>   create mode 100644 hw/sensor/lsm303dlhc_mag.c
>   create mode 100644 tests/qtest/lsm303dlhc-mag-test.c

> +static void lsm303dlhc_mag_set_z(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
> +    int64_t value;
> +    int64_t reg;
> +    int gm = extract32(s->crb, 5, 3);

Is it worth using qemu_log_mask(GUEST_ERROR) if gm == 0 here?

> +    if (!visit_type_int(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    reg = muldiv64(value, z_gain[gm], 100000);
> +
> +    /* Make sure we are within a 12-bit limit. */
> +    if (reg > 2047 || reg < -2048) {
> +        error_setg(errp, "value %" PRId64 " out of register's range", value);
> +        return;
> +    }
> +
> +    s->z = (int16_t)reg;
> +}
...

> +/*
> + * Put the device into post-reset default state.
> + */
> +static void lsm303dlhc_mag_default_cfg(LSM303DLHCMagState *s)
> +{
> +    /* Set the device into is default reset state. */
> +    s->len = 0;
> +    s->pointer = 0;         /* Current register. */
> +    s->buf = 0;             /* Shared buffer. */
> +    s->cra = 0x10;          /* Temp Enabled = 0, Data Rate = 15.0 Hz. */
> +    s->crb = 0x20;          /* Gain = +/- 1.3 Gauss. */
> +    s->mr = 0x3;            /* Operating Mode = Sleep. */
> +    s->x = 0;
> +    s->z = 0;
> +    s->y = 0;
> +    s->x_lock = 0;
> +    s->z_lock = 0;
> +    s->y_lock = 0;
> +    s->sr = 0x1;            /* DRDY = 1. */
> +    s->ira = 0x48;
> +    s->irb = 0x34;
> +    s->irc = 0x33;
> +    s->temperature = 0;     /* Default to 0 degrees C (0/8 lsb = 0 C). */
> +    s->temperature_lock = 0;
> +}
> +
> +/*
> + * Callback handler when DeviceState 'reset' is set to true.
> + */
> +static void lsm303dlhc_mag_reset(DeviceState *dev)
> +{
> +    I2CSlave *i2c = I2C_SLAVE(dev);
> +    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
> +
> +    /* Set the device into its default reset state. */
> +    lsm303dlhc_mag_default_cfg(s);

This follow what other I2C devices do, so OK. Now I2C devices often
are on the same machine board, but their nRESET line aren't always
wired to the CPU & co. logic. IOW the I2C chipsets are reset at board
cold power-on, but not at CPU hot reset; and a CPU soft reset could
check the device is in coherent state and keep reading sampled data.

Anyhow, just thinking loudly.

For this patch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

