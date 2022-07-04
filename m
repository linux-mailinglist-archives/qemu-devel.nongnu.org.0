Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD556584E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:09:21 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MlM-00064B-R7
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M78-0005lT-CA
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:27:46 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M75-0003q3-LH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:27:46 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-317a66d62dfso82179707b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZF++SnHbGINp9j4VThPP1kO2VsSWfX3+ejqQtjXnl4=;
 b=qyb05NJa6vI23HNo2ZLLgOfu4HGY4DoFpupD95s/EBhsz1sbiVfXKYivIhLqUKAQ8F
 3WE8xKuMvT4AEoKPWeSu0/W+FAUhWagok8EwnfLPvqaOBO8lqj2+Nt//tdKDsGmGa4DP
 nYNKLmdn3gPfeBr1Pp80Otk8LMmpO5Y2U1kTe2jlbKYqLPJn/0qkvwjuHyFvGcqOovrJ
 Kz0f7zVLh0lVhDr5p2dDxQll0EUQxmERVnDkVIWgSysjQZSbTdrWTPaZbg8f+f61t+QA
 0OUW7IooY6jM+5Q/QUkjcmfGn6qLjP/cPQOS6NgkVAvks9FON2UkQ6kFYhNVEvPwYLCW
 ZPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZF++SnHbGINp9j4VThPP1kO2VsSWfX3+ejqQtjXnl4=;
 b=ZcmhLrebZRFsrg8N52RpSMxy/E4DOSeofhybxsdhBvP1QHK/BWPZ4G/ez9Z4IqVJut
 EbeBBTMT0f8/BUpXM99kc5tbsLD/h7HFU8E+Zu2vwrAIyDAa8OTSq3r7hXw0i+pA/PfP
 Zn/0VhOkzbpKRSQJsa3ufS9bQEO0tl1D0l4Js3GmLKZu6KJtJc+rp4OkQT827AyncVGx
 eSc4RxvmeVYwS9uohhImXZrq910pycelLygNJsGAaWYJJQtM9SAgANnDcG4O6tfDB6z9
 eUhhPopCaBwr2QXumiyMktpUqExaS2CP+wevm4u2MovJK8VeyZRCX8vI78lE+3uDsWRi
 s8kg==
X-Gm-Message-State: AJIora/eQmkRdRRqvgabxnGaRPowg6JZH7fWWkcVlm6oHgStjSi1F49v
 j5X4kfVYwW0oxc8Oc262lUSu5MpKqBo4CT3hNerirA==
X-Google-Smtp-Source: AGRyM1vY6onl5Rgp8q9HQAieR4BvnLqf5z0PuCeLMYFxDRHUJs7qnsX9oTy37gyADnSTuxA+MhjyKa4BHMIVwgvle28=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34155934ywd.347.1656941262714; Mon, 04
 Jul 2022 06:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:27:32 +0100
Message-ID: <CAFEAcA_pesFDQK0BSB5+cv8PRZ53pcbArketiJL2P8vxiyf=Bw@mail.gmail.com>
Subject: Re: [PATCH 27/40] lasips2: add named input gpio to handle incoming
 port IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The LASIPS2 device named input gpio is soon to be connected to the port output
> IRQs. Add a new int_status field to LASIPS2State which is a bitmap representing
> the port input IRQ status.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 15 +++++++++++++++
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index ec1661a8f1..013d891af6 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -125,6 +125,19 @@ static void lasips2_update_irq(LASIPS2State *s)
>                           s->mouse_port.parent_obj.birq);
>  }
>
> +static void lasips2_set_irq(void *opaque, int n, int level)
> +{
> +    LASIPS2State *s = LASIPS2(opaque);
> +
> +    if (level) {
> +        s->int_status |= BIT(n);
> +    } else {
> +        s->int_status &= ~BIT(n);
> +    }
> +
> +    lasips2_update_irq(s);
> +}
> +
>  static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
>                                unsigned size)
>  {
> @@ -303,6 +316,8 @@ static void lasips2_init(Object *obj)
>                              "ps2-kbd-input-irq", 1);
>      qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
>                              "ps2-mouse-input-irq", 1);
> +    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
> +                            "lasips2-port-input-irq", 2);
>  }
>
>  static void lasips2_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 35e0aa26eb..b79febf64b 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -69,6 +69,7 @@ struct LASIPS2State {
>
>      LASIPS2KbdPort kbd_port;
>      LASIPS2MousePort mouse_port;
> +    uint8_t int_status;
>      qemu_irq irq;

Doesn't this new data field need to be migrated in a vmstate ?

>  };
>

-- PMM

