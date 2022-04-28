Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543B513172
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:43:06 +0200 (CEST)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1c0-00014h-Jt
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wI-0001kb-2N
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:58 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wG-0001kn-6Z
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:57 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso46768517b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uK7AEl99ZZZ/FE7WFi6tVOeLAhwQv8XyZXlxRlpj34=;
 b=h8g8VuZuXq/Jx3mY80Noofwi7l2z1BZF6+N3DzEl0zSH5bjcTh6i2nUpRFjepf3aVM
 yP6JCCWR/N0fEflY1Y28N1gOEKz5/Q9SmZyACw9wLgb8PnMLlvb9bOzNsq7WcbwRJfMm
 oRhVeSpGoqzFu2hQ2i6/S30Zuv66Ir6C2ynIAhE7nkG2MREkp9HQ40/ZNxEZzYfAAGkq
 v/UCeVO7V9NuIIdDSuJHprONqVZIbBojIsO/fRnCyEo/bsEBXHv+CN/nNj5QhtQtyHi/
 F4SdMZnElaaweuCxwQXDDO5pxSTw7LEmoZNyyVksjyDnsUgnfDZv6frbU3nbA/0PTE9F
 t1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uK7AEl99ZZZ/FE7WFi6tVOeLAhwQv8XyZXlxRlpj34=;
 b=4gPrTPgzTi2d6ca1squtaj5JeRL7456QGOZmQJCgJ7RV9+t09RWgTx95Aay7z8R8A9
 hxWK14uZxJjsr9aYkz98ONdGpD9dPbN05q0L5iJlrECzkFhehi/pimcMQA8qJ2J6ELnl
 WkOa9CZz66i/obc+Wh0R3tpgC4fqDGDSKzqkaQ/7CKL+/utdjwEef2U4VHEZpuzg8X3D
 0XGFiKbrDHe4cYRGdLmwdeXMiRS1k+RWuOPKOPw0R5w426scrIGPlFsOt+gJulY1ffDt
 1Vm1lc30I/H4SRiplCwc/cdRJOSeECXf+phtsdF/tf5mUKpRr4ccCm7SWTbHBE1M33dH
 QxUw==
X-Gm-Message-State: AOAM531d/GDrpSkx2+L2ejDreYdL79uWIEOgjxENZKIZaYuR4HBAnUjT
 3VWFrCUHVljZfsp8wOjf7gyta5yJIgiECUZAXb3Ibw==
X-Google-Smtp-Source: ABdhPJz73gvrZQckbaH9o6fCF38xBvbSFZCUBT5f5iKhepGZ6S3D72srJl0gj5X29NlMIwHZP9Sio7jiRRyUHQyAiPs=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22968679ywb.469.1651139995266; Thu, 28
 Apr 2022 02:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-14-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:59:44 +0100
Message-ID: <CAFEAcA9XRVBeSogF2mC+S9zH35a8sQUeOtArfn1m1Z7E25R0GA@mail.gmail.com>
Subject: Re: [PATCH 13/47] target/arm: Use tcg_constant in shift_reg_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

