Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906653FAB86
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 14:55:06 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKKL3-0003dA-4h
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 08:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKIt-0001Ry-To
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 08:52:53 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKIp-0005In-NG
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 08:52:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id t19so24772858ejr.8
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UMWcvC1Oo/coHlhi+kPpyMRKj8UuE4xoJqmFhSTVzQ=;
 b=taD+cZXUZsbbv5mCLPZNVUGNU87gInnVPCwvg+eoEwIgP7OYr0vVhLQ1sacTommfng
 vUJlmNBY46cHJ4rbD5EI04sRVvdLS92ZUfoC+UXB1CWnD8a4kZZwKHNB5hAfmOfc3XaM
 OpB/AR3XZPfeoC+ffQo8ytdTzPVoUP+aDbechrcanosah9hmsGq6Ca6popmo6Fvtc4wm
 KkTDyNP+RuLUC0cCRLKWO0sdaxAMZRcKWrqZ9bZ+PYrXmIaQriR3LwLvZjd9r1T6TsUa
 15SV9J4JzQ47M+6upxxvjR3VJ8SsiAW0xBLoLJ00AmBDYWQ/5g9X5aIroKQGryBQODXi
 z5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UMWcvC1Oo/coHlhi+kPpyMRKj8UuE4xoJqmFhSTVzQ=;
 b=KPOzsxun6rFji7QcGSESu+hQG66EX27VRXn96Z2660dfhkabEz8KXA2BXlMXhg44BH
 1xllxbUCxemwhEB9keLCcDOvgj1i+YpHGBULLgsdyAXU5NU0S5yJuuV2rVk4kXKvfRG0
 a/FRzm6Wa4e3xpwsKK1Iun3qVbucaK1grePAaz6Gp9VtHupRZ4lInINPjQLfoPx7wAod
 Shd0OTT39FPDMOCHE3C2bfH4lfK65OU8RIHOq3VO8T+LJumpjrC1LR+kuEDe8dx1opjH
 k4/VtTaegdWVKp8c0aAnlqRqr1xKbmtR/9gwYROz8Gog79t8l8kAuddNGm/S1SLuO0vS
 REUg==
X-Gm-Message-State: AOAM531BRaV9xRxV/SNqyzCG5PFSUDwEduP8135GyB10K26pe2BXoZ75
 +KUVdP4M5P1ZIK7T2XL/u4HLkQ6jU4z53/eCIXjSIg==
X-Google-Smtp-Source: ABdhPJxYwu2FHcOHtA6R9euiQcSc0WS5E2b5OQg0dAMiaN9tB5BAt0Elww8o6YejaisEV0j7pWFhFadV7HtjMTSbh6c=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20082143ejy.407.1630241565715; 
 Sun, 29 Aug 2021 05:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
 <20210829100103.1950-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210829100103.1950-2-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 13:51:57 +0100
Message-ID: <CAFEAcA_PaiCAffLE83FZxD8t4EjATRju2xR3Xj=Fs+dWgFGK0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] escc: checkpatch fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 11:04, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 160 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 96 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

You might want to fix this existing typo:

> @@ -300,21 +308,25 @@ static void escc_reset(DeviceState *d)
>  static inline void set_rxint(ESCCChannelState *s)
>  {
>      s->rxint = 1;
> -    /* XXX: missing daisy chainnig: escc_chn_b rx should have a lower priority
> -       than chn_a rx/tx/special_condition service*/
> +    /*
> +     * XXX: missing daisy chainnig: escc_chn_b rx should have a lower priority
> +     * than chn_a rx/tx/special_condition service
> +     */

"daisy chaining"


> -    // MSC protocol specify two extra motion bytes
> +    /* MSC protocol specify two extra motion bytes */

and this should be "specifies".

-- PMM

