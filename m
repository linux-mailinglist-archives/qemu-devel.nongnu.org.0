Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48829B3D0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 17:48:17 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1BnU-0007VF-9k
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 11:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BfO-00015i-RZ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:39:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BfN-0008Kn-P9
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:39:54 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1BfN-0008KL-K0
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:39:53 -0400
Received: by mail-oi1-x243.google.com with SMTP id g128so7349438oib.1
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ouVqUis1oCi506+X/SpDgRBR7w4wcMn92n2M4p+p5Fs=;
 b=sf5/VcY5CmGrK3bLH5B37PkRpuwapuzK24oQ0xoK6NyAHInpg+lUmIYwK8Pw5QDYrC
 BXmwA7XrFd/NaDDFj3YOAZmzE6+VeMvi7yPt2oYEWexVZAkZkLW6dRQ09vQpOG9vg4GB
 f44wBe3rpc05JEXwCPxrcJ2+RvO6NqDhzVShjR9UqqyxkVQR0M8uffKD1dpTYnZuHJbN
 leCQBXS1EKg/D6CYN2SFiUHQXbN4xF+J7ugHO0Vrmr3zpA5522cKPy7aqrYQrzARBNtB
 vMRsrMXJAUWHuwd5CzFGaG/lFu4ulYVWvT2fKOC5X4UbrlU9AVxfDXF4XTm9osBST5r1
 CSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ouVqUis1oCi506+X/SpDgRBR7w4wcMn92n2M4p+p5Fs=;
 b=bEFFMBIcrtIKal9sLII7SUmISV50oRs0mkMON90TTkl5NocCYYuKBap9cli/IKFxv0
 3jRCmKBPdcTm7slwq+kc4EKRbCq6IXfRDtR0tWap5+2031Mr7vkTsg0KvjS1V8RMIWAo
 QoQ+j0V0cNQtvYbadFS9rtN6SHIaHH8MoGOH5U5d9IuTQD+voiM56Pb+Js8P0dFt8Y3r
 ePg7LULIB4GbXTjWIxjAOxc3j0FRiH843uogMRRObSK8mufgaBKOvB/AphwdN5dFkl6Q
 FIuy1wGgS6daHdEqGH5JeDlfrB8pJMCqXNdmHXg8bgS877doPTMFEfok2ILA+Fm8pA8H
 xRXg==
X-Gm-Message-State: APjAAAWflHDQzlL6vBbNRnUzBCKjfMRgJ+SMVoaIgVuLyBv+IUfpE2vb
 prHVhlrInf/TzPCXgjtn5RaPrOTLO0ldoZUNJ6LhrA==
X-Google-Smtp-Source: APXvYqxie89JjP9nnhzemBL8mymJoxSx1775Zwehl3SUm5CfCVQk3RUbBFPb29hLMq2LgRkEGy2qjNoS67+I/n4FLFM=
X-Received: by 2002:aca:4814:: with SMTP id v20mr3707424oia.98.1566574792626; 
 Fri, 23 Aug 2019 08:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-23-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 16:39:41 +0100
Message-ID: <CAFEAcA_ctR2KvXkpw=q4mx1aZRzUJFK44kwWUHHe1XN8qsFBLA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 22/68] target/arm: Convert USAD8, USADA8,
 SBFX, UBFX, BFC, BFI, UDF
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 200 +++++++++++++++++++++--------------------
>  target/arm/a32.decode  |  20 +++++
>  target/arm/t32.decode  |  19 ++++
>  3 files changed, 143 insertions(+), 96 deletions(-)


> +static bool op_bfx(DisasContext *s, arg_UBFX *a, bool u)
> +{
> +    TCGv_i32 tmp;
> +    int width = a->widthm1 + 1;
> +    int shift = a->lsb;
> +
> +    if (!ENABLE_ARCH_6T2) {
> +        return false;
> +    }
> +
> +    tmp = load_reg(s, a->rn);
> +    if (shift + width > 32) {
> +        return false;

This UNDEF check should go before we
generate any code with the load_reg().

> +    } else if (width < 32) {
> +        if (u) {
> +            tcg_gen_extract_i32(tmp, tmp, shift, width);
> +        } else {
> +            tcg_gen_sextract_i32(tmp, tmp, shift, width);
> +        }
> +    }
> +    store_reg(s, a->rd, tmp);
> +    return true;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

