Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7941562F9D8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 17:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3lr-0004id-TP; Fri, 18 Nov 2022 10:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3la-0004gl-W7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:59:03 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3lX-0003hi-Vy
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:58:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id f9so1143952pgf.7
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QhKFiLFptcJxmooOlQ95gaC78AS1IC3R5ChgGL1T8Ec=;
 b=p2w1uHkw/V638pSxJisvj50WxnuofcuC6xA3AfeoaYRVLSmCQvO5A7yAJH4UWYGevb
 g+UjAxknxDyn/WBuCHXDGnQR8Ep26mnyfscoE/tEr2UTUsFSJ4HV7inY/D6PABEScvqK
 bs4g8RBKnc1kwJbdrqXfq+6923QdbG6XxZcV4H9PjYR15s+HNRqK6EDCmdPZDcvhgIsl
 Bb6riH294BPMetxBqCrrCYLwxlpwz+Un3cCiIOk7StYn00XZTDG0Pn/wWUoxT47+pE/n
 6Wq7zA/HVKT2Lg9ZEYMTSWXLf5H4ie/l8FQzwaMl0idqZmNnBKq4xQkR2MUlexCgp1Bo
 Bzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhKFiLFptcJxmooOlQ95gaC78AS1IC3R5ChgGL1T8Ec=;
 b=jyxTt+bTMfEeXpkSpuuSl9iwkha7OQ7GtR4J54c7a7bMd7cJO3o6HWbe4SzaTp7+Fa
 XrgW71Rkq5cguLVuwbT8UcRtQmhGfUiwXSrHcQVj/8VvvphRbIRQKCvw/pacveBBgPbI
 1tZ3Nhu3Kq7+yjL/JyPiEhc/f1W9/PCDwYp+Opv3bhbwXiqkMN9DuTZ0e2+16qK0FHyM
 /h1LtaMRkwLs5Jd1n5Ikq5FOgdJSEP1+2h6HUvTlQvF151TVqS0OVIIY9sVPf9pJGdv7
 pf3opK2Szt0rPFR1rMcMRkNCznKv3uhAW/mYe140fXHoLrsqKWaGUBNCSziJjLi5Nq1j
 QE5A==
X-Gm-Message-State: ANoB5pmwFjuZNVg22jdSw+LqqlNEkbiPPQ01+E9tJORWF0r7fqKlgv1e
 dC8vRft5dFtN5RECjRfanUl6NEsCYylkt9E+7NnEWw==
X-Google-Smtp-Source: AA0mqf7L6i6Dzd5DZH5uvTPeeUHuCBXakqWrd44F7wjnTCYiZRHWK8Go4mgCQ4WSe0F1saDYFW7cX0ax3zP8+pHgP/I=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr8402441pfq.26.1668787132394; Fri, 18
 Nov 2022 07:58:52 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-8@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:58:40 +0000
Message-ID: <CAFEAcA9As2gAigMP1GNgWyCXvANWoqfTUjAQ0Ve0iCMCdV2ptg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 8/9] hw/timer/imx_epit: change reset handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - inline software reset
> - make hardware reset invoke software reset
> - simplify code flow

I think this patch is fixing a bug, right? We weren't
previously clearing CR for the hardware reset. If so,
that's worth noting in the commit message.

> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>


> +static void imx_epit_reset(DeviceState *dev)
> +{
> +    IMXEPITState *s = IMX_EPIT(dev);
> +
> +    /* initialize CR and perform a software reset */
> +    s->cr = 0;
> +    imx_epit_write_cr(s, CR_SWR);
> +}

Generally we prefer not to do this for the hardware reset
function, as it makes it harder to see what the reset
is doing (eg to confirm that it isn't changing qemu IRQ
state). You can have a common helper function to do the
work of the reset though if that helps.

thanks
-- PMM

