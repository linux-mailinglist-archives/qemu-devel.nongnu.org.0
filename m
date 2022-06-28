Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBE55C091
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:09:01 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o695Y-00059q-Ao
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o692P-0000P1-LL
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:05:45 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o692N-0000O5-Jc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:05:45 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id h187so19386598ybg.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFiw+YEaJ8hLQfBiMazi0tYmEyK0DDorf+sLDSbTO2A=;
 b=vFIV5AuqFkDI/DkNISnotzCeTkVOSaSkAbLEwqz7bY0QVtYyBecIfMYdvLODggLqmw
 Ycp5tzLaZ0l0IdrWoGNU8orRejXWRldYv14ZDv971ZysZHe/YoZH24shsAMHdmTVTSVt
 +qHMHv0Cx9Yj08Mc2jXlDB/BJnMtHS9u+JZyO5RHTNYrjLeUn5RZs3sxjNeEnzP1Lez3
 zaUAIg2ZL+DusEjWSezaFvxRF2t9ZzK7Fk5MLdqPdPACuEn8bEs//U8k/hW4GKOAGD0A
 sBftCCFIYq5WQF24KlrQNH5diEIchUg2nQUdSRwGFOGTUwHX0IyVqPh77DxT7QVP13bm
 qY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFiw+YEaJ8hLQfBiMazi0tYmEyK0DDorf+sLDSbTO2A=;
 b=SQjWSN2fhT3peG4Sc+sa3TvcsFv18qtbBD96sM2KzzvSVOnS5brmG4lQbYC7VTqUL3
 wAvqvILz4mXtISRdNTNWTNfrCy+tfdZwhfVjugIjCI+WijkMm9dOYiPW+EWxLD+kCUzO
 QB58DzR893uz9t2ZX+qn8vhjFeKYPdfyR//kYCSWb2khO9L/2Y7nT/geMODVuiFAza+5
 yw9rIry7A3FnYuZBLgUhN5nZnSEi+wXWBn+2E0ucRHbvlpmiNe/POWTF67BambA20jKR
 j3kgCPfNPj7tnUi12WgNpG7Yk5B3+OH65JBNZmadXAnavXDHPRwgstLjeA4cyNHY3Moc
 VQ4A==
X-Gm-Message-State: AJIora/m5PAZz0UmMbXJQXnziizxJZ+/GtDRj2Ur788+aU+5wXKhbgZU
 4AxFBCxqw/hBNjS/ULFO34Qi9pRsNNcGdS08e1M1Jg==
X-Google-Smtp-Source: AGRyM1sVXwHHEXiq9JU8drJjJXhmtaHTwKyQRpFDFmb0p4IJ5E/FhY+hg0obpnhGtgttoiqjNvoZjNsLVQSTtgKQMxs=
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr19030153ybc.85.1656414340752; Tue, 28
 Jun 2022 04:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220606231450.448443-1-richard.henderson@linaro.org>
 <20220606231450.448443-39-richard.henderson@linaro.org>
In-Reply-To: <20220606231450.448443-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 12:05:02 +0100
Message-ID: <CAFEAcA91qww2x1iO7L+CsMnJA3txA_cmTzAQ=RLd6ftO0HOkuQ@mail.gmail.com>
Subject: Re: [PULL 38/43] hw/loongarch: Add LoongArch ls7a rtc device support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =gaosong@loongson.cn, yangxiaojuan@loongson.cn, 
 Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 7 Jun 2022 at 00:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>
> This patch add ls7a rtc device support.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220606124333.2060567-39-yangxiaojuan@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Hi; Coverity points out some issues with this code, and I
noticed a few more reading through it.

> +static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
> +{
> +    tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
> +    tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
> +    tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
> +    tm->tm_mday = FIELD_EX32(val, TOY_MATCH, DAY);
> +    tm->tm_mon = FIELD_EX32(val, TOY_MATCH, MON) - 1;
> +    tm->tm_year += (FIELD_EX32(val, TOY_MATCH, YEAR) - (tm->tm_year & 0x3f));
> +}
> +
> +static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
> +{

Why does this function take a pointer to a struct tm? The callsites
all pass in an entirely uninitialized struct tm and don't try to
read from it after the call. It would be clearer to just define
the struct tm as a local in this function.

> +    int64_t now, expire_time;
> +
> +    /* it do not support write when toy disabled */
> +    if (toy_enabled(s)) {
> +        s->toymatch[num] = val;
> +        /* caculate expire time */
> +        now = qemu_clock_get_ms(rtc_clock);
> +        toymatch_val_to_time(val, tm);
> +        expire_time = now + (qemu_timedate_diff(tm) - s->offset_toy) * 1000;

Coverity complains (CID 1489766) that we end up using uninitialized
fields in the struct tm here. There's two reasons for that:
(1) toymatch_val_to_time() doesn't set all the fields in the struct,
and we never zero-initialized the struct. This accounts for
tm_gmtoff, tm_isdst, tm_wday, tm_yday, tm_zone. You need to look
at whether any of those ought to be initialized, and set them.
Zero-init the struct to make Coverity happy about the rest of them.

(2) toymatch_val_to_time() sets tm_year based on the previous value
of tm_year. This doesn't make sense if the struct isn't initialized.
What was the intention here ?


> +        timer_mod(s->toy_timer[num], expire_time);
> +    }
> +}

> +static void ls7a_toy_start(LS7ARtcState *s)
> +{
> +    int i;
> +    uint64_t expire_time, now;
> +    struct tm tm;

Coverity issue CID 1489763: we don't zero initialize the struct tm here,
but we don't individually initialize all its fields. In particular
the tm_wday field is never set up and Coverity complains it might
be used uninitialized.

The easy fix is to zero-init everything:
   struct tm tm = {};

> +    /*
> +     * need to recaculate toy offset

typo: "recalculate" (here and in other comments above and below)

> +     * and expire time when enable it.
> +     */
> +    toy_val_to_time_mon(s->save_toy_mon, &tm);
> +    toy_val_to_time_year(s->save_toy_year, &tm);
> +
> +    s->offset_toy = qemu_timedate_diff(&tm);
> +    now = qemu_clock_get_ms(rtc_clock);
> +
> +    /* recaculate expire time and enable timer */
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        toymatch_val_to_time(s->toymatch[i], &tm);
> +        expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
> +        timer_mod(s->toy_timer[i], expire_time);
> +    }
> +}

> +static void toy_timer_cb(void *opaque)
> +{
> +    LS7ARtcState *s = opaque;
> +
> +    if (toy_enabled(s)) {
> +        qemu_irq_pulse(s->irq);
> +    }
> +}
> +
> +static void rtc_timer_cb(void *opaque)
> +{
> +    LS7ARtcState *s = opaque;
> +
> +    if (rtc_enabled(s)) {
> +        qemu_irq_pulse(s->irq);
> +    }

Does the real hardware really pulse the IRQ line?

> +}
> +
> +static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
> +{
> +    int i;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    LS7ARtcState *d = LS7A_RTC(sbd);
> +    memory_region_init_io(&d->iomem, NULL, &ls7a_rtc_ops,
> +                         (void *)d, "ls7a_rtc", 0x100);
> +
> +    sysbus_init_irq(sbd, &d->irq);
> +
> +    sysbus_init_mmio(sbd, &d->iomem);
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        d->toymatch[i] = 0;
> +        d->rtcmatch[i] = 0;
> +        d->toy_timer[i] = timer_new_ms(rtc_clock, toy_timer_cb, d);
> +        d->rtc_timer[i] = timer_new_ms(rtc_clock, rtc_timer_cb, d);
> +    }
> +    d->offset_toy = 0;
> +    d->offset_rtc = 0;
> +    d->save_toy_mon = 0;
> +    d->save_toy_year = 0;
> +    d->save_rtc = 0;

This device is missing an implementation of the reset method,
and a lot of this looks like it is code that ought to be in reset.

> +
> +    create_unimplemented_device("mmio fallback 1", 0x10013ffc, 0x4);

This call to create_unimplemented_device() is wrong -- device realize
code must not map anything into the system memory map. That is up to
board or SoC level code to do. I'm not sure what it's trying to do,
but it should be done some other way.

> +}

thanks
-- PMM

