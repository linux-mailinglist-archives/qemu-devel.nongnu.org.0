Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607D57034F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:50:08 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsrX-0007vx-En
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAsp9-00050B-6y
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:47:39 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAsp7-00027U-G0
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:47:38 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 64so8478935ybt.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ny5moR436jEE4ZB4BywUae5NLSW14L3Afj99oc8s6/s=;
 b=z3w1YAju32hsQ5eIfcDzqCZXuvcvtcQlpewipMWFb63Fk6Ue4Lp7cz4d7/wcMVnW6L
 RsHwkRImEit1O1HqxpuDDP8S8brjUikStAOyG55WuUMSgqK86iqyNMNyrpUaGLjf3XW8
 YBSXBSEqreqZJ9xRYAPl93tk34xuTgfN3IBi30Le/iQvRjSehdQerLgWkXQNfZnDw6tq
 6y/s/BwKx/a/wUruBLL+/bDuz6iYZ9Z7JgQ4nhJfBILRdhOzm6xsi9UzdMN1eayb3lSx
 UqgqtbQOgw+Bm7+NMPNCvYeuhiDQ51jL/2HDbNqbztm3HmmDQq9GpvGu59nQwrBXu2Ld
 eEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ny5moR436jEE4ZB4BywUae5NLSW14L3Afj99oc8s6/s=;
 b=n9KH6WiFXDyUudwsFVYJfnRVPCAxgaq4SYAluq4ETN5SFqpCWHfpVW0lUyirnGvfdM
 FnXYUoowL5tWfEQhvweKyYGLFrS/gYC1NsfMnSMr1rOJ/uEHptbTbpMZahW3OaCjp4FL
 zP6EqDJpxOA402MtxIBIbdi8XWI73FXTW2S4u02pHE8boAAYu3ussKNnSSX7cun8FlC5
 0e8XeXim1SpZGejf5tUduv7BI9g/ptrsm2SgPFZPXMpHFGH5saKWaS7vDwsjnaVZlGZz
 984uqD++HFPAS/k4toPhOB5SY4uG80B99TOYHYx8+qWGXQJEB9ztUJglpjMXme/mIkry
 HBIA==
X-Gm-Message-State: AJIora+P/Bu+njhu08kUBZUJXuKuvzi5uXUL9iw3k7otafYqP4AbGuVJ
 b11dxSNEF9N3OnAHGRZtfImyTrP5Y7plMp1XK/FhuQ==
X-Google-Smtp-Source: AGRyM1uFHNrRrlKDsm1cUF/XrVkJeu53gs5DWczfswezB5ZpdY0B5bI454etipJsDB1M1mSFWMNFUN/Oo/MW7UfNwIY=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr17172252ybr.39.1657543656419; Mon, 11
 Jul 2022 05:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220705145814.461723-1-clg@kaod.org>
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 13:46:57 +0100
Message-ID: <CAFEAcA8q35_skS4RZLFt416Qk_h0URQYhiZbeb9sZ1RfNpqgEQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ppc: Remove irq_inputs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Tue, 5 Jul 2022 at 16:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This replaces the IRQ array 'irq_inputs' with GPIO lines and removes
> 'irq_inputs' when all CPUs have been converted.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (5):
>   ppc64: Allocate IRQ lines with qdev_init_gpio_in()
>   ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
>   ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
>   ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
>   ppc: Remove unused irq_inputs

Whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

