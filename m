Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD013EC92A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 14:52:53 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFFdE-0007sW-8B
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 08:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFFcC-0007C0-JV
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 08:51:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFFc7-000137-3S
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 08:51:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id x10so13462241wrt.8
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X1Q2L3qC9/aAKAriF8u8X7GxZHAHxMscZJ9SiNizxyc=;
 b=noKj83ZrlMrs3PnzriJEbBAw0YgcdMi07bZZaU5edKvsfi+PB7sgdLHCEKd1+rZn4k
 Ysfr7hdssaNp0NBtv15U4aX/LQrYdmlM9Zp2LydA5rZripXI3uiTjNHnAFCFr+1z2fc3
 62NmBpXEaqCjHzN1t6kEU7037Tn4io769jnmq3VOCqfeuO++Fk+TyKJRN6SUnZWkYKGQ
 8OVSXtjtrJxD2iDy707SQ0OInitbzjtFR+/cWhT9vToG/Njyy8m8auVCaSGPvS7+4Saz
 0FhoypTywkcSzv2oxTtmzRm3bBQoAxmrpVtbmTA/EN2X2zEHD/7c0AGeBBVX4n3D6NsZ
 jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1Q2L3qC9/aAKAriF8u8X7GxZHAHxMscZJ9SiNizxyc=;
 b=KuKIAL3lr9D88swmajxk2EopLQEM7gjSE9yiyFPK8XkDhiOE21sCWvAAprOEA4P0BZ
 EwJticWIXU5JDgrjHfmKGZ6F4mwAqkPMsZ7JhTURHPIBTKQE0f48LgP0heLWX/U04cCx
 s9SZeI6GrIkfKukgTIUe1kIMVBTINgZiHS6l4C6zbCUcThE9rR2trX02DZQylhRGryCJ
 AfrOY8ke3rLH5frl6yT0P/DcUTeNfKVDFehHNwcFNi39Oaku3B3+8MJL0U9nkCDVFchV
 Uy2VvobxJ0DvrYbjWMN/d5/IrJVTgyzFJNz6Tcpz3yIO1glJxz+UyblNbp0d1a/oU4dt
 ni7w==
X-Gm-Message-State: AOAM533HRVl8rayxR82kFt3ZvDoXCxXX12dehQIGHt5UpKzx9qGT5lEF
 IH2tTHZdUtOm/I0pfzn61n1et+6f2oI=
X-Google-Smtp-Source: ABdhPJx8F0GPGe4Zw4m5+y5to80SheyOmJ+fjpdOHp70Z5DdpBuarqGYDckVR79J203rnQ6h98CRbA==
X-Received: by 2002:adf:a41d:: with SMTP id d29mr13073532wra.297.1629031900401; 
 Sun, 15 Aug 2021 05:51:40 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d145sm3081143wmd.3.2021.08.15.05.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 05:51:39 -0700 (PDT)
Subject: Re: [PATCH] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>, qemu-devel@nongnu.org
References: <20210814220237.33529-1-kevin.townsend@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a6964dd-7dc5-8251-ba21-32d92475c7aa@amsat.org>
Date: Sun, 15 Aug 2021 14:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814220237.33529-1-kevin.townsend@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

On 8/15/21 12:02 AM, Kevin Townsend wrote:
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> magn_x, magn_y and magn_z properties, as well as the 12-bit
> temperature output via the temperature property.

How do we use it?

> Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
> ---
>  hw/sensor/Kconfig          |   4 +
>  hw/sensor/lsm303dlhc_mag.c | 499 +++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build      |   1 +
>  3 files changed, 504 insertions(+)
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
> diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
> new file mode 100644
> index 0000000000..20629b1c79
> --- /dev/null
> +++ b/hw/sensor/lsm303dlhc_mag.c
> @@ -0,0 +1,499 @@
> +/*
> + * LSM303DLHC I2C magnetometer.
> + *
> + * Copyright (C) 2021 Linaro Ltd.
> + * Written by Kevin Townsend <kevin.townsend@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
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
> +
> +/* #define DEBUG_LSM303DLHC_MAG */
> +
> +#ifdef DEBUG_LSM303DLHC_MAG
> +#define DPRINTK(FMT, ...) printf(TYPE_LSM303DLHC_MAG " : " FMT, ## __VA_ARGS__)
> +#else
> +#define DPRINTK(FMT, ...) do {} while (0)

Please don't use DPRINTK() but trace-events instead.

> +#endif
> +
> +/* Property Names */
> +#define LSM303DLHC_MSG_PROP_MAGX ("mag_x")
> +#define LSM303DLHC_MSG_PROP_MAGY ("mag_y")
> +#define LSM303DLHC_MSG_PROP_MAGZ ("mag_z")
> +#define LSM303DLHC_MSG_PROP_TEMP ("temperature")
> +
> +enum LSM303DLHC_Mag_Reg {
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
> +
> +typedef struct LSM303DLHC_Mag_State {
> +    I2CSlave parent_obj;
> +
> +    uint8_t cra;
> +    uint8_t crb;
> +    uint8_t mr;
> +    int16_t x;
> +    int16_t z;
> +    int16_t y;
> +    uint8_t sr;
> +    uint8_t ira;
> +    uint8_t irb;
> +    uint8_t irc;
> +    int16_t temperature;

What is the unit?

> +    uint8_t len;
> +    uint8_t buf[6];
> +    uint8_t pointer;
> +} LSM303DLHC_Mag_State;
> +
> +/* 'TYPE_xxx' define is required by OBJECT_DECLARE_SIMPLE_TYPE. */

Hmm?

> +#define TYPE_LSM303DLHC_MAG "lsm303dlhc_mag"
> +OBJECT_DECLARE_SIMPLE_TYPE(LSM303DLHC_Mag_State, LSM303DLHC_MAG)
> +
> +/**
> + * @brief Get handler for the mag_* property. This will be called
> + *        whenever the public 'mag_*' property is read, such as via
> + *        qom-get in the QEMU monitor.
> + */
> +static void lsm303dlhc_mag_get_xyz(Object *obj, Visitor *v,
> +                 const char *name, void *opaque, Error **errp)

Invalid style alignment (multiple times in this patch).

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
> +
> +/**
> + * @brief Set handler for the mag_* property. This will be called
> + *        whenever the public 'mag_*' property is set, such as via
> + *        qom-set in the QEMU monitor.
> + */
> +static void lsm303dlhc_mag_set_xyz(Object *obj, Visitor *v,
> +                 const char *name, void *opaque, Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t temp;

Instead of the confusing 'temp' name, why not name this variable
'pos', 'position' or generically 'value'?

> +
> +    if (!visit_type_int(v, name, &temp, errp)) {
> +        return;
> +    }
> +
> +    if (temp > 2047 || temp < -2048) {
> +        error_setg(errp, "value %d lsb is out of range", temp);
> +        return;
> +    }
> +
> +    if (strcmp(name, LSM303DLHC_MSG_PROP_MAGX) == 0) {
> +        s->x = (int16_t)temp;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGY) == 0) {
> +        s->y = (int16_t)temp;
> +    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGZ) == 0) {
> +        s->z = (int16_t)temp;
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
> +                       const char *name, void *opaque, Error **errp)
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
> +                       const char *name, void *opaque, Error **errp)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
> +    int64_t temp;
> +
> +    if (!visit_type_int(v, name, &temp, errp)) {
> +        return;
> +    }
> +
> +    if (temp > 2047 || temp < -2048) {
> +        error_setg(errp, "value %d lsb is out of range (1 C = 8 lsb)", temp);

"1 C = 8 lsb" is irrelevant in the error message IMO.

> +        return;
> +    }
> +
> +    s->temperature = (int16_t)temp;
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
> +     */
> +
> +    DPRINTK("Read: register = 0x%02x\n", s->pointer);
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
> +        s->buf[s->len++] = (uint8_t)(s->x >> 8);
> +        s->buf[s->len++] = (uint8_t)(s->x);

Rather use the safer load/store API with explicit endianess:

           stw_be_p(s->buf, s->x);
           s->len += 2; // or sizeof(s->x)

> +        s->buf[s->len++] = (uint8_t)(s->z >> 8);
> +        s->buf[s->len++] = (uint8_t)(s->z);
> +        s->buf[s->len++] = (uint8_t)(s->y >> 8);
> +        s->buf[s->len++] = (uint8_t)(s->y);
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
> +        if (s->cra & 0x80) {

What means this 0x80 magic value? Either use a definition
or document it with a comment.

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
> +    DPRINTK("Write: register = 0x%02x, value = 0x%02x\n",
> +        s->pointer, s->buf[0]);
> +
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

       default:
           qemu_log_mask(LOG_GUEST_ERROR, ...

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
> +    DPRINTK("M<-S: 0x%02x (byte = %d)\n", s->buf[s->len], s->len);
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
> +        DPRINTK("M->S: Setting reg pointer to 0x%02x\n", data);
> +        s->pointer = data;
> +        s->len++;
> +    } else if (s->len == 1) {
> +        /* Second byte is the new register value. */
> +        DPRINTK("M->S: Setting reg 0x%02x to 0x%02x\n", s->pointer, data);
> +        s->buf[0] = data;
> +        lsm303dlhc_mag_write(s);

} else {
           g_assert_not_reached();

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
> +        DPRINTK("Event: START_SEND\n");
> +        break;
> +    case I2C_START_RECV:
> +        DPRINTK("Event: START_RECV\n");
> +        lsm303dlhc_mag_read(s);
> +        break;
> +    case I2C_FINISH:
> +        DPRINTK("Event: FINISH\n");
> +        break;
> +    case I2C_NACK:
> +        DPRINTK("Event: NACK\n");
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
> +static void lsm303dlhc_mag_reset(I2CSlave *i2c)
> +{
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    s->len = 0;
> +    s->pointer = 0;         /* Current register. */
> +    s->buf[0] = 0;
> +    s->buf[1] = 0;
> +    s->buf[2] = 0;
> +    s->buf[3] = 0;
> +    s->buf[4] = 0;
> +    s->buf[5] = 0;

       memset(s->buf, 0, sizeof(s->buf));

> +
> +    s->cra = 0x08;          /* Temp Enabled = 0, Data Rate = 3.0 Hz. */
> +    s->crb = 0x20;          /* Gain = +/- 1.3 Guas. */
> +    s->mr = 0x1;            /* Operating Mode = Single conversion. */
> +    s->x = 0;
> +    s->z = 0;
> +    s->y = 0;
> +    s->sr = 0x1;            /* DRDY = 1. */
> +    s->ira = 0x48;
> +    s->irb = 0x34;
> +    s->irc = 0x33;
> +    s->temperature = 0;

I'm unsure about this default value.

> +}
> +
> +/**
> + * @brief Callback handler when DeviceState 'realized' is set to true.
> + */
> +static void lsm303dlhc_mag_realize(DeviceState *dev, Error **errp)

Rather add a DeviceReset handler with the same content.

> +{
> +    I2CSlave *i2c = I2C_SLAVE(dev);
> +    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
> +
> +    /* Set the device into is default reset state. */
> +    lsm303dlhc_mag_reset(&s->parent_obj);> +}

Regards,

Phil.

