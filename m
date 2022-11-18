Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F95062F9A9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:49:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3bD-0000c0-2x; Fri, 18 Nov 2022 10:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3bC-0000br-19
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:48:14 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3b9-0001mV-1y
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:48:13 -0500
Received: by mail-pf1-x42b.google.com with SMTP id b185so5217357pfb.9
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iz2DFoK6l+9YBTKCKIBKy1dbR11sYBzDgRUtXIFKZwc=;
 b=E7rOsaEQb2KeMS1WhqUO7lHMhN8TlO4ipbumDg57UEVMQeX0AzXLic2oXKnfZeiVUh
 So+tqsEC/RliRWxKhAsRcfmSWjj9C2Z5jwLo/lzT1O8sliQ4FxrjGpJS7nMFdYWaPjAO
 HCK0tP7rxz7RWnNNw0lUW8Kpxt2aC3bbVGc8toDHein/YOaXvtw75zgNWmZb+mcRLc/c
 e+ZXi2KFVACKjfy5YFka+6VuCGUEReNbKsxsQAfeyCbnuynWnQ2kZkANxTFS8uCx5GBZ
 UtEzmDQsTOSTcCB9iIm8+53NkwUYgYSRVOrTcjoaZWgeOexGoTq0lxLZrd5PQuOLumK0
 tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iz2DFoK6l+9YBTKCKIBKy1dbR11sYBzDgRUtXIFKZwc=;
 b=mNNKa8EFRMH9I4+eGFmBbvpWT6UpHAYjOwUGv9ZmEg5tsBZwHAFcSpw6GtzoXSJtZx
 669j5wKwv1UaVu+uRr4ccjs3wEefuzFyVx3pv30Zx9rLIs8XnhofyVkO1KNHxbL35QDl
 tLXsnQZkKsvXB8JDFjYQqOaqXtIHJZEMXOjyAiZ9mB1o4tRbsIqcY4xXEdrejhbUba5B
 HpJTcCkuH4SWMVqoTvzCsOSErC9i3LkH7/jB4ny3CLs797E3rv7SKNEcUYKhCcLY/a3O
 3OnToFatjbW09MNIyf5+Pn4M4L6tYFgKN1Aa8LtMEiXnCoXB8c1tF2S3UvzGFC07G3eA
 QwFQ==
X-Gm-Message-State: ANoB5pmd16d82ZSmcCWXbvDgpb5TD+vAtI4tm/rRPX+X0fajC4h1+n02
 sN+xBhIInvPqUXLth7ehDMLVBx0WfGbFpDvkSV2/aA==
X-Google-Smtp-Source: AA0mqf60WtXMUT6NpQoDCXaaGDNE+En2ypZ7va+XPTT9mywvQJ3nHO41vNB33vqG31wkyXDJZQGB2FuESACNB80exa8=
X-Received: by 2002:a65:681a:0:b0:43c:7da:e64b with SMTP id
 l26-20020a65681a000000b0043c07dae64bmr7319447pgt.231.1668786488418; Fri, 18
 Nov 2022 07:48:08 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-5@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-5@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:47:57 +0000
Message-ID: <CAFEAcA8tVAqf8aF2Gf=0KJGXmytv7aw10o4+RyfQLB4qO7KVvg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 5/9] hw/timer/imx_epit: do not persist CR.SWR
 bit
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 5315d9633e..6af460946f 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -191,8 +191,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>      case 0: /* CR */
>
>          oldcr = s->cr;
> -        s->cr = value & 0x03ffffff;
> -        if (s->cr & CR_SWR) {
> +        /* SWR bit is never persisted, it clears itself once reset is done */
> +        s->cr = (value & ~CR_SWR) & 0x03ffffff;
> +        if (value & CR_SWR) {
>              /* handle the reset */
>              imx_epit_reset(DEVICE(s));
>              /*

There's a comment just below here that says "can we just 'break'
in this case?". That's there because last time we had to touch
this device we didn't have enough specific knowledge of the hardware
or test cases so we made a refactor that left the code with the same
probably-incorrect behaviour it had before the refactor. But, since
you're working on this device anyway: can we simply add the "break"
after imx_epit_reset() ?

If we can just say "if CR_SWR is set then the device resets like
a hardware reset", then this all simplifies out a lot and this
patch isn't necessary at all. (imx_epit_reset() clears the CR_SWR bit.)
I'm fairly sure we ought to be able to do that, and the missing 'break'
was just a bug...

> @@ -205,7 +206,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>          ptimer_transaction_begin(s->timer_reload);
>
>          /* Update the frequency. Has been done already in case of a reset. */
> -        if (!(s->cr & CR_SWR)) {
> +        if (!(value & CR_SWR)) {
>              imx_epit_set_freq(s);
>          }

thanks
-- PMM

