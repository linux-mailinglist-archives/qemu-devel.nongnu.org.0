Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AFC673A22
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxW-00061E-Al; Thu, 19 Jan 2023 08:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIUxT-00060p-ML
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:59 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIUxS-0008G1-1Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:59 -0500
Received: by mail-pl1-x633.google.com with SMTP id jm10so2260818plb.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mr7t+0gYUDkP7iaemK0rBY5JKGNnWbjZ0aNHX22Z/v0=;
 b=q16iTOaeW8srsQj+nJShRqrSdTshsYTZlzzdc24i5eAQzPBmMGf/rQBIP+5DS1QTY4
 XbLG7Yp6G7R2eRNbLh/dt6Ve8/XO21e/0+SxFTe7q8TYKCFIUhbyPKJPds1A9NYHBWS/
 ozQXXeTnt7oYjxp6enXj20u+/9N14sGEn/KS+I8dmlI9jAwSt4SA0AmiFcrtsYwyhIKw
 kTQqqcPauBUaeclKM/L5jxPcYWAi+fj0eWb7q+FFuUC+ta0g1Wd4Lpz2FfTwr64FDFmV
 hlx+l0C9QldInvLjpYLE5vyf8h56tWUU0N7k0SXbTQzSLFNtcGcR0yqfNiB+WvvAprCb
 oXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mr7t+0gYUDkP7iaemK0rBY5JKGNnWbjZ0aNHX22Z/v0=;
 b=ZRF64c4n30MzLZqWJ3u0xfiMwWY4j8kv0+gKKMQPDER3Wt+/ugRpa2gt70omDMY6Bb
 cB7L9GIOxPpIIQnBJ/yeDouRzABHA53LrTjNtMCYgQewzlxkaz+egbHOEDJ8OInfWUO6
 4kP9Z9SQGfMwhWhexOQrP7IsrSiEKEcFC6DyaOhBxKTsp9wKZ1WUj7rl2XCNuzacR6rc
 l50oEgu+3koUoXu8qDHnQLto8webX/2fMy5VWnfF7IVkvPEKSlJ88WaetJ4vwydsqWs7
 PjAnMBufmt0ESd446kHcAcmR/fcO96jQNaRsIzNiSHyfzALZ4/j5RYyDxuQKsKI3XVEy
 WnFA==
X-Gm-Message-State: AFqh2krUvnY6ViA1XBI0wClxN3rxfR0PZKqRlzuZYyguf7x7W/GeXedN
 zHqfRU7r1FLMsI7OUnQDF8H0V2HJuLW7VjWxbNSK/Q==
X-Google-Smtp-Source: AMrXdXuCsEtpDGEAZJj8+HNYd0fZ2WGp9c5wTegYn7GXawhMSERLERMB9TIDd1NxLIVLmkxzy3WWcsIkxxYNx0iW8Ls=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr1128154pjz.221.1674134876360; Thu, 19
 Jan 2023 05:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:27:45 +0000
Message-ID: <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 currently lacks a reset method. Implement it.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 329cc6926d..404d52a3b8 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
>      s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
>                                  ClockUpdate);
>
> -    s->read_trigger = 1;
> -    s->ifl = 0x12;
> -    s->cr = 0x300;
> -    s->flags = 0x90;
> -
>      s->id = pl011_id_arm;
>  }
>
> @@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
>                               pl011_event, NULL, s, NULL, true);
>  }
>
> +static void pl011_reset(DeviceState *dev)
> +{
> +    PL011State *s = PL011(dev);
> +    int i;
> +
> +    s->lcr = 0;
> +    s->rsr = 0;
> +    s->dmacr = 0;
> +    s->int_enabled = 0;
> +    s->int_level = 0;
> +    s->ilpr = 0;
> +    s->ibrd = 0;
> +    s->fbrd = 0;
> +    s->read_pos = 0;
> +    s->read_count = 0;
> +    s->read_trigger = 1;
> +    s->ifl = 0x12;
> +    s->cr = 0x300;
> +    s->flags = 0x90;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> +        qemu_irq_lower(s->irq[i]);
> +    }

Reset should never touch outbound qemu_irq lines.
(The other end of the line will also reset and will end
up in the correct "as if the input is 0" state.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

