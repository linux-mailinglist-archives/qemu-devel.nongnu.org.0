Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3341AE69
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:05:26 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBrR-0003Km-9T
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVBqQ-0002fJ-3A
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:04:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVBqN-0005Tg-VO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:04:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so2569331wme.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UbobyFoSgaHTmqRIXslHLLqFrqPpfXLlqrAUVUuBZ4E=;
 b=IfTUIrcLolW1YhpKgfS9k5LMnaWKmdK44q7SVXH4LCfkJSGBUgGeS9ObBXaO52gQVB
 o4TJoim94pQnVo8JOLHqAvVCDGV4K9KyFsKa2C4MMOckLh+V4jXRQLitfHoYm8JMRhQ2
 kdDMNiLf/IzWe1Hn3a7cMnFoxhmYhCBOKO13vEapgsaftJ80zzMAtMe//CTyN5KzySHD
 gbZBx2T4cEaJ6AH/pbxGE46oDhvp0Ae1WLwNSSD3fuRPwHbLKLCdOU9hxB2ywCDTBUPm
 AOka5LfMro7qb3hdYHW4JiyiLGQU7mstolorl0CCcp8fK4Hwj0Zcb2CMNoXxQyATGceT
 /Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UbobyFoSgaHTmqRIXslHLLqFrqPpfXLlqrAUVUuBZ4E=;
 b=t/hhylPUf96m7yPLLwZHb5vb5GfRJahULfR340hKMG0bUf+v/+lP9TiU4//aBdYg9c
 GTeKNOhNd3ViZFRW2e6rrGmCELAdckPGTm5xrUvZrIr259Qa0bBpix60vA/tzltRydfg
 bWS54GclDO7NgQFTaORo7jSmM6syFtiwxDUpGQ0AgakZyhNyHGSUJZBcdcH0c2hq//0U
 qS/USOKlxSxj4j7uYfvMIxc70jZNriv1rNbNRUiu70wTGkyZtxJFjg/mZRlUsdJx/9A/
 yRxWTxvH5+wMWa5fH0tvOkxEFt5NWqJNy//0ogJBuDk0M/Q40xAP0aS0iYGMdwN14spb
 uFsA==
X-Gm-Message-State: AOAM530SgI4QSlWchmAnpRo3kHJGaggTnZwxG6XBBWoOtG31lbjGBsVM
 xsDm2laNGCJ3UplYjL9PfNd1VrXzrVml48xJrEahHhU1kMTfcQ==
X-Google-Smtp-Source: ABdhPJyhXuRoEkMFlX8BaJ8obLyLYl5m0yicFdzW+3GzIdLg/AwlvXRwFmOsXIYag77nmGf1Cih0rflPOzO+Fw+5Igc=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr4470286wmc.126.1632830656006; 
 Tue, 28 Sep 2021 05:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210921093227.18592-1-kevin.townsend@linaro.org>
 <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
 <CAFPHj6OFoYkcoQYM-LAW9gfgYpp8HY-87HXREbJ_M9B7gk=czQ@mail.gmail.com>
In-Reply-To: <CAFPHj6OFoYkcoQYM-LAW9gfgYpp8HY-87HXREbJ_M9B7gk=czQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 13:03:22 +0100
Message-ID: <CAFEAcA89ZA2Q6rpLLKOYbJd3itZTqJ0gZGswP4gVi0ERu8U8NQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

On Tue, 28 Sept 2021 at 11:36, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> Hi Peter,
>
> On Mon, 27 Sept 2021 at 18:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> I thought we'd agreed to implement the whole of the auto-increment
>> logic, not just for specific registers ?
>
>
> Thanks again for the feedback. Dealing with one register value at a time
> (versus a buffer of response values) does simplify the code flow.
>
> The following code appears to handle multi-byte reads correctly. I just
> wanted to confirm this is what you were looking for before moving on to
> the test code?
>
> /*
>  * Callback handler whenever a 'I2C_START_RECV' (read) event is received.
>  */
> static void lsm303dlhc_mag_read(LSM303DLHCMagState *s)
> {
>     /*
>      * Set the LOCK bit whenever a new read attempt is made. This will be
>      * cleared in I2C_FINISH. Note that DRDY is always set to 1 in this driver.
>      */
>     s->sr = 0x3;
> }
>
> /*
>  * Callback handler whenever a 'I2C_FINISH' event is received.
>  */
> static void lsm303dlhc_mag_finish(LSM303DLHCMagState *s)
> {
>     /*
>      * Clear the LOCK bit when the read attempt terminates.
>      * This bit is initially set in the I2C_START_RECV handler.
>      */
>     s->sr = 0x1;
> }

I would just inline these in the event lsm303dlhc_mag_event()
function. You might also #define some constants for the
register bits.

>
> /*
>  * Low-level slave-to-master transaction handler (read attempts).
>  */
> static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
> {
>     LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
>
>     switch (s->pointer) {
>     case LSM303DLHC_MAG_REG_CRA:
>         s->buf = s->cra;
>         break;
>     case LSM303DLHC_MAG_REG_CRB:
>         s->buf = s->crb;
>         break;
>     case LSM303DLHC_MAG_REG_MR:
>         s->buf = s->mr;
>         break;
>     case LSM303DLHC_MAG_REG_OUT_X_H:
>         s->buf = (uint8_t)(s->x >> 8);
>         break;
>     case LSM303DLHC_MAG_REG_OUT_X_L:
>         s->buf = (uint8_t)(s->x);
>         break;
>     case LSM303DLHC_MAG_REG_OUT_Z_H:
>         s->buf = (uint8_t)(s->z >> 8);
>         break;
>     case LSM303DLHC_MAG_REG_OUT_Z_L:
>         s->buf = (uint8_t)(s->z);
>         break;
>     case LSM303DLHC_MAG_REG_OUT_Y_H:
>         s->buf = (uint8_t)(s->y >> 8);
>         break;
>     case LSM303DLHC_MAG_REG_OUT_Y_L:
>         s->buf = (uint8_t)(s->y);
>         break;
>     case LSM303DLHC_MAG_REG_SR:
>         s->buf = s->sr;
>         break;
>     case LSM303DLHC_MAG_REG_IRA:
>         s->buf = s->ira;
>         break;
>     case LSM303DLHC_MAG_REG_IRB:
>         s->buf = s->irb;
>         break;
>     case LSM303DLHC_MAG_REG_IRC:
>         s->buf = s->irc;
>         break;
>     case LSM303DLHC_MAG_REG_TEMP_OUT_H:
>         /* Check if the temperature sensor is enabled or not (CRA & 0x80). */
>         if (s->cra & 0x80) {
>             s->buf = (uint8_t)(s->temperature >> 8);
>         } else {
>             s->buf = 0;
>         }
>         break;
>     case LSM303DLHC_MAG_REG_TEMP_OUT_L:
>         if (s->cra & 0x80) {
>             s->buf = (uint8_t)(s->temperature & 0xf0);
>         } else {
>             s->buf = 0;
>         }
>         break;
>     default:
>         s->buf = 0;
>         break;
>     }
>
>     /*
>      * The address pointer on the LSM303DLHC auto-increments whenever a byte
>      * is read, without the master device having to request the next address.
>      *
>      * The auto-increment process has the following logic:
>      *
>      *   - if (s->pointer == 8) then s->pointer = 3
>      *   - else: if (s->pointer >= 12) then s->pointer = 0
>      *   - else: s->pointer += 1
>      *
>      * Reading an invalid address return 0.
>      */
>     if (s->pointer == LSM303DLHC_MAG_REG_OUT_Y_L) {
>         s->pointer = LSM303DLHC_MAG_REG_OUT_X_H;
>     } else if (s->pointer >= LSM303DLHC_MAG_REG_IRC) {
>         s->pointer = LSM303DLHC_MAG_REG_CRA;
>     } else {
>         s->pointer++;
>     }
>
>     return s->buf;

I think you don't need to write the value to s->buf, you can just
use a local variable and return that. Nothing should be able to read
the value back out of s->buf later. I think you should also implement
the actual lock part, to avoid wrong values in the case of
 * read starts, reads X_H
 * s->x updated via the QOM property setter
 * read continues, reads X_L
Basically just capture x,y,z,temp at the point of lock, and then
return those values in the recv function.

> }

thanks
-- PMM

