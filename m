Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B6557C5D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:59:33 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MQm-0002gj-64
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MNn-0000pd-OI
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:56:28 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MNm-0007wX-6s
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:56:27 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ef5380669cso192870167b3.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R61v/iPwH5KRi9bjTWRa7Tpm/TZZ3nQfs1k5tUMicU0=;
 b=CfyAChadOteldYBSZO3K48+sg5Z2V+tqrHjV/80mmrJJ2o5mH2AY8xnSUFq15GkPgZ
 hjqe/TeBLJgEj4U1teQ6SehfoJGiDSJgCpsBHEH/ctk0uB7aoZoF8/KnuMEul40oev7z
 RrtkLOjjP5k1T1iohMMZj5DdEzXRINS0V6bIqke2DPKwuzeU93kofmrcCxfs8YfeoqOJ
 ADDL9CQs1cQ9GKVlnqBrfiHzNvlplV2NmZamszXAAur+TUPLbEEVCzLsty7tI6ZortIH
 2O5I1YQwvN8nBOF/aDzokpZzB7zGxI9mhJfifp4pR6Rs8F/OOw+6TS95PuzxVJZ4Chbt
 uKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R61v/iPwH5KRi9bjTWRa7Tpm/TZZ3nQfs1k5tUMicU0=;
 b=iNgUR/GFFdZXVyh8edLZvcLtL74IU0vfPGTP+lJxau2YjD4wrgT1AckHMDtCNn42Su
 uJ7ZjSF1fjQvZl1WFyIM+ewZZKB9Ob/kbDGoW7lnJS2CoXkc53jK+iopSojFbROG9Lg5
 To9uTr2rpF27C7gp5ocFXoX25JRaXS658lihHWcIvjb0xNbqVUP0PENO5ExqwMoT2fp+
 3jFjjjcH1SExab56x9M4NKrL4inBtJxuWUmOCkE3OyPxqfW3Y38TX7DmQoGcqObRU/rA
 COVmUvpNLmlDD+TBzDbJWKSM3JT0+/xVjFgeQSRuOjTvKZtAv7wuhTuuuTD3+Kb/olaj
 ibEA==
X-Gm-Message-State: AJIora9Y/9iDmi0gJ2RqoXpzW8bB0ixzMJtaH3ryYBD7EPM71bKAJ8rQ
 6zqLRXUo3tHZanHDkRxmWNgI/Bi84Mlm7yAbHnxRdA==
X-Google-Smtp-Source: AGRyM1tVLx+H9rwH/n7tGiouqh3J6vgw+U3Yf+geex4bbUsIf922YiYLwp2hXt6Igq1GKIGOrIMA0Gm+U4XJPpcdFxg=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr10304575ywd.64.1655988985132; Thu, 23
 Jun 2022 05:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com>
 <20220623095825.2038562-12-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-12-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:56:14 +0100
Message-ID: <CAFEAcA_iOeL50nGaTSNRa23P0GKH8_0fpiSOxktAOA22CGgZvA@mail.gmail.com>
Subject: Re: [PATCH 11/14] aspeed: Switch to create_unimplemented_device_in
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 23 Jun 2022 at 13:04, Peter Delevoryas <pdel@fb.com> wrote:
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed_ast10x0.c | 10 ++++------
>  hw/arm/aspeed_ast2600.c | 19 ++++++++++---------
>  hw/arm/aspeed_soc.c     |  9 +++++----
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index d259d30fc0..4e6688cc68 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -158,12 +158,10 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>      }
>
>      /* General I/O memory space to catch all unimplemented device */
> -    create_unimplemented_device("aspeed.sbc",
> -                                sc->memmap[ASPEED_DEV_SBC],
> -                                0x40000);
> -    create_unimplemented_device("aspeed.io",
> -                                sc->memmap[ASPEED_DEV_IOMEM],
> -                                ASPEED_SOC_IOMEM_SIZE);
> +    create_unimplemented_device_in("aspeed.sbc", sc->memmap[ASPEED_DEV_SBC],
> +                                   0x40000, s->system_memory);
> +    create_unimplemented_device_in("aspeed.io", sc->memmap[ASPEED_DEV_IOMEM],
> +                                   ASPEED_SOC_IOMEM_SIZE, s->system_memory);

This is SoC code, so it should probably be handling its unimplemented
devices by creating and mapping TYPE_UNIMPLEMENTED_DEVICE child
objects directly, the same way it handles all its other child devices.

thanks
-- PMM

