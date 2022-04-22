Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A650B966
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:02:41 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtrs-0000rk-J7
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtoH-0007RX-5O
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:58:57 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtoF-0006F6-AS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:58:56 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f16645872fso86208517b3.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Ik7npuGHBMEGDunx4LZVyVMwW06oRuzFtQXfw5a/KA=;
 b=PYVTr9+aasydNrStJQ8IXAF4xj1ywbbsDyskxZn2ssCO5h9LriTL31MctdTaN33/4L
 MPIF+PxHV9XyvXniiL1bu2tJkFzeMJ5qk0+qsBAxNFWaXvR2QpuAIZfv3wS0JJdGJbVN
 Qv7X5gryI3jQ4r8Pk6StQe5tNAGPC+8DqLNy7NjN3m+bK+GxlwHIWE9r/R1WCkfdniIV
 kr+SrLXPZ+EGSBbLBKS++xfLWGBdS3J+lcYWc1qN5PzScazwRUJ6x7NDFF/LTyoFEHkA
 p99UQsXzcWRTGsFmFTqypPI2yEt4srHccb7T5JiMWkfFmOF5nl4E7hN8I7BuKAxtqVaq
 2Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Ik7npuGHBMEGDunx4LZVyVMwW06oRuzFtQXfw5a/KA=;
 b=3iwCfOFGm0N72pmz/KgjTF0qoBO8CBoheUKB2okscFYP1HXkrttjSchfOMomtxEvp6
 BfYioEC4umuI98oIKD8bEFINdKCjmhhup1eohnfqNNdeFLmAc3OAfVAiy/4JX9YDURB/
 8I4GfFbG85vAzIDT7XasJQsovE1suRd1PZzhXkHRgYKy4m2G0V911GGQCIBelyaswUUc
 deTS1Sbbt1FIfeoBIRj/N4nxFT/s1LUz1fZq1kevEnIJxd2iMIzhTcuTIq93nRKVXQQR
 2aPnTYKL7QIUxg3IGcUQA2IkArnOTBfNSlBvuxmXbCYb0N0k7SWb+RUQ6l5GNjkNokb+
 9uhw==
X-Gm-Message-State: AOAM5307J+JcrBYNHgoIOjHBSJgR1BXuJH4IDRXGPNT7D2D/kUltEvPp
 HMCZIZb5rlKDAWbgKcELGOdXiDlinTj10/jz9CrV8Q==
X-Google-Smtp-Source: ABdhPJz6vPzUAjrzy7GVBz25cPLUBmx5umvIGAzGdyVSepaspu7+NvGyrikAL0+p6tiK8oaI2iNnJlpM7AMijVXhZPw=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4827277ywj.329.1650635934311; Fri, 22
 Apr 2022 06:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650633281.git.balaton@eik.bme.hu>
 <2969a92711ead9d5f64a68d2e10e9780a9472fc9.1650633281.git.balaton@eik.bme.hu>
In-Reply-To: <2969a92711ead9d5f64a68d2e10e9780a9472fc9.1650633281.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:58:43 +0100
Message-ID: <CAFEAcA_dADJGULwwXK5xVva+wbX+eQoOWhQnfhzMEGsQCZdznA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/audio/ac97: Remove unimplemented reset functions
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 14:40, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> The warm_reset() and cold_reset() functions are not implemented and do
> nothing so no point in calling them or keep around as dead code.
> Therefore remove them for now.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/audio/ac97.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index 0b1d8ce9c6..2799d64acd 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -222,16 +222,6 @@ static void po_callback(void *opaque, int free);
>  static void pi_callback(void *opaque, int avail);
>  static void mc_callback(void *opaque, int avail);
>
> -static void warm_reset(AC97LinkState *s)
> -{
> -    (void)s;
> -}
> -
> -static void cold_reset(AC97LinkState *s)
> -{
> -    (void)s;
> -}
> -
>  static void fetch_bd(AC97LinkState *s, AC97BusMasterRegs *r)
>  {
>      uint8_t b[8];
> @@ -921,12 +911,6 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
>          dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
>          break;
>      case GLOB_CNT:
> -        if (val & GC_WR) {
> -            warm_reset(s);
> -        }
> -        if (val & GC_CR) {
> -            cold_reset(s);
> -        }

Removing the dead code is OK, but I think we should then add a comment here:
 /* TODO: Handle WR or CR being set (warm/cold reset requests) */
so it remains clear that there's missing functionality here.

>          if (!(val & (GC_WR | GC_CR))) {
>              s->glob_cnt = val & GC_VALID_MASK;
>          }
> --
> 2.30.2

thanks
-- PMM

