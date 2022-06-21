Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C1553B31
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:10:57 +0200 (CEST)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kDA-0003jp-Ai
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kAS-0002GM-O3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:08:09 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kAP-0003uO-5Y
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:08:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-317a66d62dfso81625317b3.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9snTh4mitA+bB7L3MiFboKsnqCFfA5OZFX+Ply9wjw=;
 b=JSnZUDntDWVZkIDetCqYKq914Yheu8vt4UbY7ln97RzXWFWtznBO1DpKZyRaYh1ng4
 Xy7UveELqFGjQXWFCNLIttKmZZyw24U1uU+bGraFdigSzNP9a0KZfRoXhqXw9z3LOrOe
 y9fewC9ZzkwxIXtHhPrHZ0A7RMWlsNvTz+AeY6X4cNtNz+Ykbi+KngbOhfZDiRDDc9Is
 Xp1iMXm5PNwFBDpnoKIU0FTgEWF0YQa27lmArlRAgduiZDg4LqVWdP94564MzlZII7tR
 LYVm6Xu4scp9Tdn0iFazubkwzxFNV5ipTSzerRAHVFoWu5NnQdZtnuA5lW57LV1vdqpL
 TxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9snTh4mitA+bB7L3MiFboKsnqCFfA5OZFX+Ply9wjw=;
 b=AM44RTc0BOQFY8lC9Iotpq39UzH9LptvPm8zFFpmlCW3JhBj7DX2X9vbw4MrBwN4OU
 CZoIycf80F0eR8ObyYNZi1XLk6zxB0yShyfUXuVUMu0qioFGtbvjkIJIjmu0tautP3jF
 +960HrQU1aBZgACte8JdYypja7XJfw0FTUzgj2uomiUmqt3PAgKJft5tiyh2A7QABHE0
 7Z+ohjRsMMK83PE5+7R2RCPAXIEMvYhy9hEF8HrDyzv8744/BtoH2cE5+C7JikgynXM/
 N3tlH/YEaGuEQnw4QTaOAXwwGtYWxRLCBAgX+/vPg8o8AtV4fwuCMgGn9yF3sGdvu7mH
 IygQ==
X-Gm-Message-State: AJIora/J2r+A55GNbD0HjEl98yeXJ+ng4xxL3iPPDSd35eOkk00TA1dQ
 lt17c5taj/Yhy0HOM/E9oA3Ns7GUBfKFGUCUO7/CBQ==
X-Google-Smtp-Source: AGRyM1s6bdnHOQw4/vSPKomcwfg6adcgLRISSVkKxa9mq5WROBUfmmQvaoaUcVdPT9VB//fxhIvIoo32OUtuiEKp9YM=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr20300377ywb.10.1655842082255; Tue, 21
 Jun 2022 13:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-25-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 21:07:24 +0100
Message-ID: <CAFEAcA8Mz6rB5V5jOP4n1hJPw_azuuqP42S8v78=Go+TPmkZ=g@mail.gmail.com>
Subject: Re: [PATCH v3 24/51] target/arm: Implement SME ZERO
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  2 ++
>  target/arm/translate-a64.h |  1 +
>  target/arm/sme.decode      |  4 ++++
>  target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
>  target/arm/translate-a64.c | 14 ++++++++++++++
>  target/arm/translate-sme.c | 13 +++++++++++++
>  6 files changed, 59 insertions(+)
>

> +void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
> +{
> +    uint32_t i;
> +
> +    /*
> +     * Special case clearing the entire ZA space.
> +     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
> +     * parts of the ZA storage outside of SVL.
> +     */
> +    if (imm == 0xff) {
> +        memset(env->zarray, 0, sizeof(env->zarray));
> +        return;
> +    }
> +
> +    /*
> +     * Recall that ZAnH.D[m] is spread across ZA[n+8*m].
> +     * Unless SVL == ARM_MAX_VQ, each row is discontiguous.

This comment led me down a garden path for a while. Each
row in a tile *is* contiguous, whatever the value of SVL.
What isn't contiguous is the entire tile, because the rows
of the tile are striped across the ZA[] array so rows that
are adjacent in the tile aren't adjacent in the ZA[] array.
(And this is true even if SVL is ARM_MAX_VQ.)

> +     */
> +    for (i = 0; i < svl; i++) {
> +        if (imm & (1 << (i % 8))) {
> +            memset(&env->zarray[i], 0, svl);
> +        }
> +    }
> +}

With the comment fixed,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll also go back to the patch that adds env->zarray to
suggest a beefed-up comment there, because I just had to
spend half an hour with the spec to make sure I understood
what the zarray is compared to the architecture (some of
which is the spec being complicated, of course ;-))

thanks
-- PMM

