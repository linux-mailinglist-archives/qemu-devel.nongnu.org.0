Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B32C36D4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 03:52:52 +0100 (CET)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khkvL-0007pY-HG
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 21:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khks0-00072e-Jw; Tue, 24 Nov 2020 21:49:24 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khkry-0005jr-NM; Tue, 24 Nov 2020 21:49:24 -0500
Received: by mail-qk1-x742.google.com with SMTP id v143so1913208qkb.2;
 Tue, 24 Nov 2020 18:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kXVueYUa/uAk7l7Au0UFCAqyQlpGibXkR/Ajck+DQXw=;
 b=T0sbynXvxjJlW2mjh707bCTWU8V0Dsga87ovVjeF8E7cAGvB9v8460dSyXMIzpwTy/
 I7YGrwCjMAdgOWdMubbR0KxaM4GSlM/ulR3SDqWx2OQvzpRMBpv+FCk1iw1Z5IOli5K5
 7wgA91/RYLaKC+59/0/5nlrUaOCkXHG0Oz3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kXVueYUa/uAk7l7Au0UFCAqyQlpGibXkR/Ajck+DQXw=;
 b=Aie8Z9t4E/Kx+APUK4+gdQ9oUjdZKLlh4w4Kw5JsCNzWNhoFNLElyz4YUhyqbKKtGX
 jfCaM+yaFinA2ivondYMfK9syCeQ7nzYvQdyR7BQa2apwhi3d+yPI8aGBdYeoJjsZF89
 pYptc3wbZc03rU3CJVSj7ul7drKE/b1DKPsLUAvKteFbpB++6Y83315C8FFngjOmTfyJ
 MjTprMPr46q4HX8wn+RYuE3FBuNEu6HfNTG+ohrpBLu3QFJIwQwTdzi1+cYk+JIVNGsf
 IpGkB7beMSisIff7RxHdXpJs86ewfzSq2ZtPai7hAFIVSEP/FsarlaOIWVtFTW0hbHNf
 N3sw==
X-Gm-Message-State: AOAM5301T335zTGERyqove/wB97R1PWmX6GcVc4WQUmJ9OSDWD2BtQUa
 NGGch4YlAELvpXSGC1niEE7gL1xHVenirMmQTGI=
X-Google-Smtp-Source: ABdhPJynmt36rCQhmafCL+sKQdn2roqka8pPdKZkeMfOVDuVChRlYsOWSBEW8EaGAYCVS14LftFo2qcGwZRr9HV8vWw=
X-Received: by 2002:a37:664d:: with SMTP id a74mr1330409qkc.487.1606272560639; 
 Tue, 24 Nov 2020 18:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201120161547.740806-1-clg@kaod.org>
 <20201120161547.740806-3-clg@kaod.org>
In-Reply-To: <20201120161547.740806-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Nov 2020 02:49:08 +0000
Message-ID: <CACPK8Xf_Q2_r=B54hvxmq4ezwmAndDPqGqOh9+YGFDCb4jfqig@mail.gmail.com>
Subject: Re: [PATCH for-6.0 2/2] aspeed/smc: Add extra controls to request DMA
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x742.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 16:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The controller has a set of hidden bits to request/grant DMA access.

Do you have the ast2600 datasheet? It describes these bits:

31 RW DMA Request

Write SPIR80 =3D 0xAEED0000 to set this bit ot '1'.
And hardware will clear the request to '0' after DMA done, or FW can
clear to '0' by writing SPIR80 =3D 0xDEEA0000.

30 RO DMA Grant

0: DMA is not allowed to be used. All DMA related control registers
are not allowed to be written.
1: DMA is granted to be used.

Do you want to add the magic behavior to your model?

>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index e3d5e26058c0..c1557ef5d848 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -127,6 +127,8 @@
>
>  /* DMA Control/Status Register */
>  #define R_DMA_CTRL        (0x80 / 4)
> +#define   DMA_CTRL_REQUEST      (1 << 31)
> +#define   DMA_CTRL_GRANT        (1 << 30)
>  #define   DMA_CTRL_DELAY_MASK   0xf
>  #define   DMA_CTRL_DELAY_SHIFT  8
>  #define   DMA_CTRL_FREQ_MASK    0xf
> @@ -1237,6 +1239,11 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
>
>  static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
>  {
> +    if (dma_ctrl & DMA_CTRL_REQUEST) {
> +            s->regs[R_DMA_CTRL] =3D dma_ctrl | DMA_CTRL_GRANT;
> +            return;
> +    }
> +
>      if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
>          s->regs[R_DMA_CTRL] =3D dma_ctrl;
>
> --
> 2.26.2
>

