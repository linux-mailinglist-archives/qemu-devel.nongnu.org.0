Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70028419967
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:43:22 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtir-0008Ah-FQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUtfT-0005MJ-U1
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:39:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUtfR-0000bU-Bh
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:39:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so1136747wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UuJ1HW8ztM4JNQAQkV28zghegf0VVYrN/n6gjaVUeqk=;
 b=RVCKhyzi7tHDcaxK7Hw3jsLL3poKKY0iS0JCQQvdQyXam5fThvrdG5FNQtTWsOvRkh
 iI8LUSlsM2vPubdqHfvbhMnJTqQRG7w5uKuUkpz7938rUz4zpnPETaGbeA8MEF1Cn9H1
 SFdsNone/YFiClRP7mAFcLtBaLoqaKlKuczo7N1T3EmKw/X3nPd9AltZ8axpvKPCSeF+
 WfutSmlrULGBR8eBZtOeQK70CmwVIE4WK9EEb1woGEt+286GkhVOlt9iBVfywZPiFPlR
 SX8f2igekpsBa8nInB/5nMYO/40Doj90tkAx6xBxqQjP2RTmC5TOyfMoIMZbo3CR2JaJ
 rdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UuJ1HW8ztM4JNQAQkV28zghegf0VVYrN/n6gjaVUeqk=;
 b=GEdKPAvJtOWGzknjUGn1Go+UEJvHYq3URGONlm5dWMs2EPY1m5P/tXQKbuRcdEI2bM
 CT8yN2OdzT+HtcSyEGOb+F8vUt+lq8QLseBMpBczu3c5FSFgoCFfyKshkC1+8qOtJcC6
 S8Dg8aKoc+I/RRzGnrdDXAv3V2BeV6ivsefJNqyDDBcVlRf+yEIUtpRW0lXRHJXyhhge
 A51McPs5RD7Td76TO/wgarAaRWJpVOrruB2Tx9KL+aPVMD0uCpgzpCENckpq+lyNqdHu
 gcPJMA2gXsFpzWOxwOVwSr8a+rvjmBuevsN8QZNATwuajKdg1TMgq2rFTZmaCa41PRfv
 zDkA==
X-Gm-Message-State: AOAM530bkm6Q/mBXpKSVJJBuYkxsCDAcokEWBtyGNKB7TPjWg7wDNcQH
 Gs78htu5O8MTOFd9CfqE6dKftx7GFxq2qVQCuVrb3Q==
X-Google-Smtp-Source: ABdhPJxEiFpzhaeepq/L7LIFrtYJirO+dYAZp/GjB41HjhwSkHtaTN2DKZJpmlWqEmVpnXe6rq/hiXLAGXh30CuaKJA=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr852607wmm.133.1632760787520; 
 Mon, 27 Sep 2021 09:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210921093227.18592-1-kevin.townsend@linaro.org>
In-Reply-To: <20210921093227.18592-1-kevin.townsend@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 17:38:54 +0100
Message-ID: <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 10:41, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> mag-x, mag-y and mag-z properties, as well as the 12-bit
> temperature output via the temperature property.

Thanks; this is generally looking pretty good. I have some review
commenst below.

> Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
> ---
>  hw/sensor/Kconfig          |   4 +
>  hw/sensor/lsm303dlhc_mag.c | 754 +++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build      |   1 +
>  3 files changed, 759 insertions(+)
>  create mode 100644 hw/sensor/lsm303dlhc_mag.c

> +static void lsm303dlhc_mag_get_x(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
> +    int64_t value = s->x;
> +
> +    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
> +    value *= 1000000;
> +    switch (s->crb >> 5) {
> +        case 1:
> +            /* 11 lsb per uT. */
> +            value /= 11000;
> +            break;
> +        case 2:
> +            /* 8.55 lsb per uT. */
> +            value /= 8550;
> +            break;
> +        case 3:
> +            /* 6.70 lsb per uT. */
> +            value /= 6700;
> +            break;
> +        case 4:
> +            /* 4.50 lsb per uT. */
> +            value /= 4500;
> +            break;
> +        case 5:
> +            /* 4.00 lsb per uT. */
> +            value /= 4000;
> +            break;
> +        case 6:
> +            /* 3.30 lsb per uT. */
> +            value /= 3300;
> +            break;
> +        case 7:
> +            /* 2.30 lsb per uT. */
> +            value /= 2300;
> +            break;
> +        default:
> +            break;
> +    }

This gain conversion code is quite long-winded and duplicated
between the get_x and get_y functions. I think we could reduce it:

/*
 * Conversion factor from Gauss to sensor values for each GN gain setting,
 * in units "lsb per Gauss" (see data sheet table 3). There is no documented
 * behaviour if the GN setting in CRB is incorrectly set to 0b000;
 * we arbitrarily make it the same as 0b001.
 */
uint32_t xy_gain[] = { 1100, 1100, 855, 670, 450, 400, 330, 230 };
uint32_t z_gain[] = { 980, 980, 760, 600, 400, 355, 295, 205 };

static void lsm303dlhc_mag_get_x(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
{
    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
    int64_t value;
    int gm = extract32(s->crb, 5, 3);

    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
    int64_t value = muldiv64(s->x, 100000, xy_gain[gm]);
    visit_type_int(v, name, &value, errp);
}

static void lsm303dlhc_mag_set_x(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
{
    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
    int64_t value;
    int64_t reg;
    int gm = extract32(s->crb, 5, 3);

    if (!visit_type_int(v, name, &value, errp)) {
        return;
    }

    reg = muldiv64(value, xy_gain[gm], 100000);

    /* Make sure we are within a 12-bit limit. */
    if (reg > 2047 || reg < -2048) {
        error_setg(errp, "value %lld out of register's range", value);
        return;
    }

    s->x = (int16_t)reg;
}

Similarly for y and z (z uses z_gain[], obviously).

(muldiv64() is in "qemu/host-utils.h"; it avoids potential overflows
by calculating a * b / c with a higher-precision intermediate value;
we don't need that in the get but we do for the set, and it makes the
two functions clearly the inverse of each other to use it both places.)

> +/*
> + * Callback handler whenever a 'I2C_START_RECV' (read) event is received.
> + */
> +static void lsm303dlhc_mag_read(LSM303DLHCMagState *s)
> +{
> +    s->len = 0;
> +
> +    /*
> +     * The address pointer on the LSM303DLHC auto-increments whenever a byte
> +     * is read, without the master device having to request the next address.
> +     *
> +     * The auto-increment process has the following logic:
> +     *
> +     *   - if (s->pointer == 8) then s->pointer = 3
> +     *   - else: if (s->pointer >= 12) then s->pointer = 0
> +     *   - else: s->pointer += 1
> +     *
> +     * Reading an invalid address return 0.
> +     *
> +     * The auto-increment logic is only taken into account in this driver
> +     * for the LSM303DLHC_MAG_REG_OUT_* and LSM303DLHC_MAG_REG_TEMP_OUT_*
> +     * registers, which are the two common uses cases for it. Accessing either
> +     * of these register sets will also populate the rest of the related
> +     * dataset.
> +     */

I thought we'd agreed to implement the whole of the auto-increment
logic, not just for specific registers ?

Could I ask you to write a test case for this new device?
tests/qtest/tmp105-test.c is probably a good model to follow.
It doesn't have to be an exhaustive functionality test, but some
basic tests like:
 * if you set the sensor values via the qom properties and
   read them back do you get the same value you read?
 * if you set the values, change the gain, read back, ditto?
 * does reading the sensor values via the i2c registers
   give the right results?
would help in ensuring this doesn't accidentally regress in future.
(Make the test case a patch 2 in the patchset.)

thanks
-- PMM

