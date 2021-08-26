Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110B3F8B42
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:41:25 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHVG-0006Pt-QQ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHU0-0005ej-PA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:40:00 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHTx-0001fp-NW
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:40:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id d6so5295971edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxLikI0YHcRKbQGTqOg0wJm2/vVEJfpcbpaFGiUyrD8=;
 b=Ya2Ddl4I3dlcwrKuVM+x23mptP5WOI6fMNOfzrk8uA9Q/z8/TB6d1hoMC0FS7/qvby
 CW9NR5sgOdZXIQcOSaoWop1iXE6yHLj7YOP2GjMxOpFHLBzVmGtrmLxoC+FHPEVePlKD
 MbIteRz9nWWrF0hPesOXxyzN0d5QECbpVmYyzpX/31wy8AYqKfRdLOmjSRBlfigLFnNC
 NbZgLYtbYu4WV25OGpyS6vkbh+en8Qhv78s8Kx3DlNN3LY8t4JWS5VDZ0AFrAl3ZMqUy
 XdCG4ZAT8nSJI4MRcCqIuQXtsqgZHsfWm6uvwCUEG80Uyu2+9CzOPz+H57xJeYalvpn7
 8TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxLikI0YHcRKbQGTqOg0wJm2/vVEJfpcbpaFGiUyrD8=;
 b=SQAhtzob4kLZaiP9N+TaK/Z2VheHHekPUZ3F4I/6+gzsQ6IHzq34N4K6UuRISki7h1
 PnMVAB5kE94v8Qtlq0o5OnO8eu9KO4oEWwc+ZxsBx81CHPoS8r7z9ktmZtxkUbVcm6kj
 adqtW6UawbaORZ2pEWCvlzBapYN8Ve3uqJwiqRZLGl0eAg1rVfz4RJHCzejJ6GPljwKb
 a/Wl/7VscTMAfP20MftgiIVA2EE8pdoienjqaK1LcKGMcFr/aRVVFZ9hb7MeNd+LPKiB
 VK3gUtrtiz+V9ryR1lVnAF802VA5CQ+gbgZlaIEhgOHsjwqfR0tJwB6i8aO2gLCJpEvh
 wMhg==
X-Gm-Message-State: AOAM531CnUDt2wWDfYgt8dbWFWo09UJtE2Df6VdwfS2sk0gZnbHOAMTk
 z0on2YXrZKSs0p8SnEx0U0QM0YTuzG+MyWhfW10UCJydbRoKjg==
X-Google-Smtp-Source: ABdhPJy4XtY/jyoD/v3mg2yMlU1GikF41IScTYBofVIN7zyluXnU0TGFXOTK8giXejHqHNDROnYhfIIspX5kf8lvXyA=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr4905403eda.52.1629992395541; 
 Thu, 26 Aug 2021 08:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
In-Reply-To: <20210815162738.75461-2-kevin.townsend@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 16:39:07 +0100
Message-ID: <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Sun, 15 Aug 2021 at 17:31, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> mag_x, mag_y and mag_z properties, as well as the 12-bit
> temperature output via the temperature property.
>
> Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>

Hi; thanks for this patch. I have some code review comments below.

> ---
>  hw/sensor/Kconfig          |   4 +
>  hw/sensor/lsm303dlhc_mag.c | 502 +++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build      |   1 +
>  3 files changed, 507 insertions(+)
>  create mode 100644 hw/sensor/lsm303dlhc_mag.c
>
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index a2b55a4fdb..f9d0177433 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -17,3 +17,7 @@ config ADM1272
>  config MAX34451
>      bool
>      depends on I2C
> +
> +config LSM303DLHC_MAG
> +    bool
> +    depends on I2C
> \ No newline at end of file

Should have the newline.

> diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
> new file mode 100644
> index 0000000000..009b6dae6b
> --- /dev/null
> +++ b/hw/sensor/lsm303dlhc_mag.c
> @@ -0,0 +1,502 @@
> +/*
> + * LSM303DLHC I2C magnetometer.
> + *
> + * Copyright (C) 2021 Linaro Ltd.
> + * Written by Kevin Townsend <kevin.townsend@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

You could add the URL of the datasheet here:
https://www.st.com/resource/en/datasheet/lsm303dlhc.pdf

> + */
> +
> +/*
> + * The I2C address associated with this device is set on the command-line when
> + * initialising the machine, but the following address is standard: 0x1E.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "qemu/bswap.h"
> +
> +/* Property Names */
> +#define LSM303DLHC_MSG_PROP_MAGX ("mag_x")
> +#define LSM303DLHC_MSG_PROP_MAGY ("mag_y")
> +#define LSM303DLHC_MSG_PROP_MAGZ ("mag_z")
> +#define LSM303DLHC_MSG_PROP_TEMP ("temperature")

Is this kind of #define for property names something you've borrowed
from elsewhere in the codebase?

> +enum LSM303DLHC_Mag_Reg {

Our naming convention doesn't have underscores in
type names generally; we prefer CamelCase for those.
(Some older code uses different style.)

> +    LSM303DLHC_MAG_REG_CRA          = 0x00,
> +    LSM303DLHC_MAG_REG_CRB          = 0x01,
> +    LSM303DLHC_MAG_REG_MR           = 0x02,
> +    LSM303DLHC_MAG_REG_OUT_X_H      = 0x03,
> +    LSM303DLHC_MAG_REG_OUT_X_L      = 0x04,
> +    LSM303DLHC_MAG_REG_OUT_Z_H      = 0x05,
> +    LSM303DLHC_MAG_REG_OUT_Z_L      = 0x06,
> +    LSM303DLHC_MAG_REG_OUT_Y_H      = 0x07,
> +    LSM303DLHC_MAG_REG_OUT_Y_L      = 0x08,
> +    LSM303DLHC_MAG_REG_SR           = 0x09,
> +    LSM303DLHC_MAG_REG_IRA          = 0x0A,
> +    LSM303DLHC_MAG_REG_IRB          = 0x0B,
> +    LSM303DLHC_MAG_REG_IRC          = 0x0C,
> +    LSM303DLHC_MAG_REG_TEMP_OUT_H   = 0x31,
> +    LSM303DLHC_MAG_REG_TEMP_OUT_L   = 0x32
> +};

So if I'm reading the datasheet correctly, the LM303DLHC is
really two completely distinct i2c devices in a single
package with different slave addresses; this QEMU device
implements only the magnetometer i2c device, and if we wanted
to add the accelerometer device we'd implement that as a
second separate QEMU i2c device ?

> +
> +typedef struct LSM303DLHC_Mag_State {

Again, CamelCase.

> +    I2CSlave parent_obj;
> +
> +    uint8_t cra;
> +    uint8_t crb;
> +    uint8_t mr;
> +
> +    /**
> +     * @brief X-axis register value in LSB. Exact relationship to gauss
> +     *        varies depending on the current gain settings.
> +     */

This @brief stuff isn't how we do doc comments. For a simple
internal to the device struct like this you don't really need
to mark it up as a doc comment at all; just use a normal
block comment (you could combine these 3 comments, since they're
saying the same thing).

> +    int16_t x;
> +
> +    /**
> +     * @brief Z-axis register value in LSB. Exact relationship to gauss
> +     *        varies depending on the current gain settings.
> +     */
> +    int16_t z;
> +
> +    /**
> +     * @brief Y-axis register value in LSB. Exact relationship to gauss
> +     *        varies depending on the current gain settings.
> +     */
> +    int16_t y;
> +
> +    uint8_t sr;
> +    uint8_t ira;
> +    uint8_t irb;
> +    uint8_t irc;
> +
> +    /**
> +     * @brief Temperature in LSB where 1 degree C = 8 lsb.
> +     */
> +    int16_t temperature;
> +
> +    uint8_t len;
> +    uint8_t buf[6];
> +    uint8_t pointer;
> +} LSM303DLHC_Mag_State;
> +
> +#define TYPE_LSM303DLHC_MAG "lsm303dlhc_mag"
> +OBJECT_DECLARE_SIMPLE_TYPE(LSM303DLHC_Mag_State, LSM303DLHC_MAG)
> +
> +/**
> + * @brief Get handler for the mag_* property. This will be called
> + *        whenever the public 'mag_*' property is read, such as via
> + *        qom-get in the QEMU monitor.
> + */

For a file-internal static function, doc comment formatting is optional
(we only really want it for functions declared in header files).
I would just provide a normal comment here.
(If you do want a doc-comment, QEMU's format for that is not this
@brief style; bitops.h has some examples of what we do, which is
more or less Linux kernel kerneldoc format.)

> +static void lsm303dlhc_mag_get_xyz(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t value;
> +
> +    if (strcmp(name, LSM303DLHC_MSG_PROP_MAGX) == 0) {
> +        value = s->x;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGY) == 0) {
> +        value = s->y;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGZ) == 0) {
> +        value = s->z;
> +    } else {
> +        error_setg(errp, "unknown property: %s", name);
> +        return;
> +    }
> +
> +    visit_type_int(v, name, &value, errp);
> +}

I think you'd be better off defining different get/set functions
for x,y,z rather than sharing them and then having to do a bunch
of strcmps on the property name to split them apart again.

> +
> +/**
> + * @brief Set handler for the mag_* property. This will be called
> + *        whenever the public 'mag_*' property is set, such as via
> + *        qom-set in the QEMU monitor.
> + */
> +static void lsm303dlhc_mag_set_xyz(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t value;
> +
> +    if (!visit_type_int(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value > 2047 || value < -2048) {
> +        error_setg(errp, "value %d lsb is out of range", value);

Why "lsb" ?

> +        return;
> +    }
> +
> +    if (strcmp(name, LSM303DLHC_MSG_PROP_MAGX) == 0) {
> +        s->x = (int16_t)value;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGY) == 0) {
> +        s->y = (int16_t)value;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGZ) == 0) {
> +        s->z = (int16_t)value;
> +    } else {
> +        error_setg(errp, "unknown property: %s", name);
> +        return;
> +    }
> +}
> +
> +/**
> + * @brief Get handler for the temperature property. This will be called
> + *        whenever the public 'temperature' property is read, such as via
> + *        qom-get in the QEMU monitor.
> + */
> +static void lsm303dlhc_mag_get_temperature(Object *obj, Visitor *v,
> +                                           const char *name, void *opaque,
> +                                           Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t value;
> +
> +    value = s->temperature;
> +
> +    visit_type_int(v, name, &value, errp);
> +}
> +
> +/**
> + * @brief Set handler for the temperature property. This will be called
> + *        whenever the public 'temperature' property is set, such as via
> + *        qom-set in the QEMU monitor.
> + */
> +static void lsm303dlhc_mag_set_temperature(Object *obj, Visitor *v,
> +                                           const char *name, void *opaque,
> +                                           Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t value;
> +
> +    if (!visit_type_int(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value > 2047 || value < -2048) {
> +        error_setg(errp, "value %d lsb is out of range", value);
> +        return;
> +    }
> +
> +    s->temperature = (int16_t)value;
> +}
> +
> +/**
> + * @brief Callback handler whenever a 'I2C_START_RECV' (read) event is received.
> + */
> +static void lsm303dlhc_mag_read(LSM303DLHC_Mag_State *s)
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
> +     * for the LSM303DLHC_MAG_REG_OUT_X_H and LSM303DLHC_MAG_REG_TEMP_OUT_H
> +     * registers, which are the two common uses cases for it. Accessing either
> +     * of these registers will also populate the rest of the related dataset.

How hard would it be to implement the behaviour correctly for all cases?
I find it's usually better to model something correctly from the start:
usually the person writing the code knows the h/w behaviour better than
anybody else coming along later trying to figure out why some other
guest code doesn't work on the model...

> +     */
> +
> +    switch (s->pointer) {
> +    case LSM303DLHC_MAG_REG_CRA:
> +        s->buf[s->len++] = s->cra;
> +        break;
> +    case LSM303DLHC_MAG_REG_CRB:
> +        s->buf[s->len++] = s->crb;
> +        break;
> +    case LSM303DLHC_MAG_REG_MR:
> +        s->buf[s->len++] = s->mr;
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_X_H:
> +        stw_be_p(s->buf, s->x);
> +        s->len += sizeof(s->x);
> +        stw_be_p(s->buf + 2, s->z);
> +        s->len += sizeof(s->z);
> +        stw_be_p(s->buf + 4, s->y);
> +        s->len += sizeof(s->y);
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_X_L:
> +        s->buf[s->len++] = (uint8_t)(s->x);
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_Z_H:
> +        s->buf[s->len++] = (uint8_t)(s->z >> 8);
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_Z_L:
> +        s->buf[s->len++] = (uint8_t)(s->z);
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_Y_H:
> +        s->buf[s->len++] = (uint8_t)(s->y >> 8);
> +        break;
> +    case LSM303DLHC_MAG_REG_OUT_Y_L:
> +        s->buf[s->len++] = (uint8_t)(s->y);
> +        break;
> +    case LSM303DLHC_MAG_REG_SR:
> +        s->buf[s->len++] = s->sr;
> +        break;
> +    case LSM303DLHC_MAG_REG_IRA:
> +        s->buf[s->len++] = s->ira;
> +        break;
> +    case LSM303DLHC_MAG_REG_IRB:
> +        s->buf[s->len++] = s->irb;
> +        break;
> +    case LSM303DLHC_MAG_REG_IRC:
> +        s->buf[s->len++] = s->irc;
> +        break;
> +    case LSM303DLHC_MAG_REG_TEMP_OUT_H:
> +        /* Check if the temperature sensor is enabled of not (CRA & 0x80). */

"or not"

> +        if (s->cra & 0x80) {
> +            s->buf[s->len++] = (uint8_t)(s->temperature >> 8);
> +            s->buf[s->len++] = (uint8_t)(s->temperature & 0xf0);
> +        } else {
> +            s->buf[s->len++] = 0;
> +            s->buf[s->len++] = 0;
> +        }
> +        break;
> +    case LSM303DLHC_MAG_REG_TEMP_OUT_L:
> +        if (s->cra & 0x80) {
> +            s->buf[s->len++] = (uint8_t)(s->temperature & 0xf0);
> +        } else {
> +            s->buf[s->len++] = 0;
> +        }
> +        break;
> +    default:
> +        s->buf[s->len++] = 0;
> +        break;
> +    }
> +}
> +
> +/**
> + * @brief Callback handler when a device attempts to write to a register.
> + */
> +static void lsm303dlhc_mag_write(LSM303DLHC_Mag_State *s)
> +{
> +    switch (s->pointer) {
> +    case LSM303DLHC_MAG_REG_CRA:
> +        s->cra = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_CRB:
> +        s->crb = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_MR:
> +        s->mr = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_SR:
> +        s->sr = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_IRA:
> +        s->ira = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_IRB:
> +        s->irb = s->buf[0];
> +        break;
> +    case LSM303DLHC_MAG_REG_IRC:
> +        s->irc = s->buf[0];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "reg is read-only: 0x%02X", s->buf[0]);
> +        break;
> +    }
> +}
> +
> +/**
> + * @brief Low-level slave-to-master transaction handler.
> + */
> +static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    if (s->len < 6) {
> +        return s->buf[s->len++];
> +    } else {
> +        return 0xff;
> +    }
> +}
> +
> +/**
> + * @brief Low-level master-to-slave transaction handler.
> + */
> +static int lsm303dlhc_mag_send(I2CSlave *i2c, uint8_t data)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    if (s->len == 0) {
> +        /* First byte is the reg pointer */
> +        s->pointer = data;
> +        s->len++;
> +    } else if (s->len == 1) {
> +        /* Second byte is the new register value. */
> +        s->buf[0] = data;
> +        lsm303dlhc_mag_write(s);
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
> +    return 0;
> +}
> +
> +/**
> + * @brief Bus state change handler.
> + */
> +static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    switch (event) {
> +    case I2C_START_SEND:
> +        break;
> +    case I2C_START_RECV:
> +        lsm303dlhc_mag_read(s);
> +        break;
> +    case I2C_FINISH:
> +        break;
> +    case I2C_NACK:
> +        break;
> +    }
> +
> +    s->len = 0;
> +    return 0;
> +}
> +
> +/**
> + * @brief Device data description using VMSTATE macros.
> + */
> +static const VMStateDescription vmstate_lsm303dlhc_mag = {
> +    .name = "LSM303DLHC_MAG",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +
> +        VMSTATE_I2C_SLAVE(parent_obj, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(len, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8_ARRAY(buf, LSM303DLHC_Mag_State, 6),
> +        VMSTATE_UINT8(pointer, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(cra, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(crb, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(mr, LSM303DLHC_Mag_State),
> +        VMSTATE_INT16(x, LSM303DLHC_Mag_State),
> +        VMSTATE_INT16(z, LSM303DLHC_Mag_State),
> +        VMSTATE_INT16(y, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(sr, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(ira, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(irb, LSM303DLHC_Mag_State),
> +        VMSTATE_UINT8(irc, LSM303DLHC_Mag_State),
> +        VMSTATE_INT16(temperature, LSM303DLHC_Mag_State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +/**
> + * @brief Put the device into post-reset default state.
> + */
> +static void lsm303dlhc_mag_default_cfg(I2CSlave *i2c)
> +{
> +       LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    /* Set the device into is default reset state. */
> +    s->len = 0;
> +    s->pointer = 0;         /* Current register. */
> +    memset(s->buf, 0, sizeof(s->buf));
> +    s->cra = 0x08;          /* Temp Enabled = 0, Data Rate = 3.0 Hz. */
> +    s->crb = 0x20;          /* Gain = +/- 1.3 Guas. */

"gauss" ?

> +    s->mr = 0x1;            /* Operating Mode = Single conversion. */
> +    s->x = 0;
> +    s->z = 0;
> +    s->y = 0;
> +    s->sr = 0x1;            /* DRDY = 1. */

Do you understand how the DRDY and LOCK bits work ? The datasheet
is unclear. Also, what's the difference between "single-conversion"
and "continuous-conversion" modes ?

> +    s->ira = 0x48;
> +    s->irb = 0x34;
> +    s->irc = 0x33;
> +    s->temperature = 0;     /* Default to 0 degrees C (0/8 lsb = 0 C). */
> +}
> +
> +/**
> + * @brief Callback handler when DeviceState 'reset' is set to true.
> + */
> +static void lsm303dlhc_mag_reset(DeviceState *dev)
> +{
> +    I2CSlave *i2c = I2C_SLAVE(dev);
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +       /* Set the device into is default reset state. */
> +       lsm303dlhc_mag_default_cfg(&s->parent_obj);

Misindentation.

Also, don't use the parent_obj field;
always use the QOM cast macro when you need the pointer
to something as a different type. In this case you already
have the I2CSlave*, in 'i2c'. But better would be to make
lsm303dlhc_mag_default_cfg() take a LSM303DLHC_Mag_State*
directly rather than taking an I2CSlave* and casting it
internally.

> +}
> +
> +/**
> + * @brief Initialisation of any public properties.
> + *
> + * @note Properties are an object's external interface, and are set before the
> + *       object is started. The 'temperature' property here enables the
> + *       temperature registers to be set by the host OS, for example, or via
> + *       the QEMU monitor interface using commands like 'qom-set' and 'qom-get'.
> + */

You don't need to say that kind of thing, you can assume the reader
knows what properties are.

> +static void lsm303dlhc_mag_initfn(Object *obj)
> +{
> +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGX, "int",
> +                lsm303dlhc_mag_get_xyz,
> +                lsm303dlhc_mag_set_xyz, NULL, NULL);
> +
> +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGY, "int",
> +                lsm303dlhc_mag_get_xyz,
> +                lsm303dlhc_mag_set_xyz, NULL, NULL);
> +
> +    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGZ, "int",
> +                lsm303dlhc_mag_get_xyz,
> +                lsm303dlhc_mag_set_xyz, NULL, NULL);

What units are these in? It looks like your implementation just
uses the property values as the raw -2048..+2048 value that the
X/Y/Z registers read as. Would it be better for the properties to
set the value in Gauss, and then the model to honour the
gain settings in CRB_REG_M.GN{0,1,2} ?  That way guest code that
adjusts the gain will get the results it is expecting.

> +
> +    object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, "int",
> +                lsm303dlhc_mag_get_temperature,
> +                lsm303dlhc_mag_set_temperature, NULL, NULL);

What units is this in?

> +}
> +
> +/**
> + * @brief Set the virtual method pointers (bus state change, tx/rx, etc.).
> + */
> +static void lsm303dlhc_mag_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    /* DeviceState 'reset' handler. */
> +    dc->reset = lsm303dlhc_mag_reset;
> +
> +    /* VM State description (device data). */
> +    dc->vmsd = &vmstate_lsm303dlhc_mag;
> +
> +    /* Bus state change handler. */
> +    k->event = lsm303dlhc_mag_event;
> +
> +    /* Slave to master handler. */
> +    k->recv = lsm303dlhc_mag_recv;
> +
> +    /* Master to slave handler. */
> +    k->send = lsm303dlhc_mag_send;

These comments are all kind of superfluous too.

> +}
> +
> +static const TypeInfo lsm303dlhc_mag_info = {
> +    .name = TYPE_LSM303DLHC_MAG,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(LSM303DLHC_Mag_State),
> +    .instance_init = lsm303dlhc_mag_initfn,
> +    .class_init = lsm303dlhc_mag_class_init,
> +};
> +
> +static void lsm303dlhc_mag_register_types(void)
> +{
> +    type_register_static(&lsm303dlhc_mag_info);
> +}
> +
> +type_init(lsm303dlhc_mag_register_types)
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> index 034e3e0207..95406abd24 100644
> --- a/hw/sensor/meson.build
> +++ b/hw/sensor/meson.build
> @@ -3,3 +3,4 @@ softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
>  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
> +softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))

You need also a stanza in hw/sensor/Kconfig, like this:

config LSM303DLHC_MAG
    bool
    depends on I2C

Also, unless the Kconfig for some board does 'select LSM303DLHC_MAG'
I don't think this code will ever be compiled in...

thanks
-- PMM

