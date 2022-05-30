Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D7537AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:48:46 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvepB-0005By-K0
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvela-0001yL-Tf
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:45:03 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvelY-0002Y2-0S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:45:02 -0400
Received: by mail-yb1-xb35.google.com with SMTP id t31so5933643ybi.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPLUyoydZMua44IM/ytwipbwgJ3gjNvSsGogcEbsxOw=;
 b=PiywGyO+GAWmim5SYtAqISWUuS4o/KRki95Nb4lisYEH5VegwEEEgqUs2Vs3XttHST
 HA86+zwS78m+cv+XVZrn/kduAQ+34tdouFAVSu4aQHjxYYj0ZjUfsbbX9Treqxw5oljA
 MMe8DS/mKZKN/1AU3qILLnDRYxyMPNNHzBT3c8afawHiYdjD79JHjwVFqF8gV+N6XdpU
 wRPZEaQT/phg9I3CptxiNCIzQ74ZAqmJd3B8n7BJ1r/7HB0WGxJl4kt7SeTWVgm5dkq4
 sv6cAquKkR22Jvn2RuiteZSHYxQksV7EHwzYQ/XB45zqRiNYuc6E2JH2K99Ujz/KAFyp
 QnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPLUyoydZMua44IM/ytwipbwgJ3gjNvSsGogcEbsxOw=;
 b=pvSzENLmTBK0uylgBJOirjKVrD1othpcMFRWlJIhVjOab069mwFVbIJOnxGruFx9D7
 Ova3BylvHRG49tYuPjkvFFobHHT0gXOLu0SEuf6J65jllFhbqcB9pfFX2MtSvGLiFYn6
 QnNo1OPxqcS2/WIiAeOgXcoApFLjZB7nNV1jYSbVEMWApRsBBZLlu3laDqOSrsIPNKBe
 QHIChACHkJ0TdPV3S8RGWgOWEJ6LBoQXOgHsniXpDelpSKE9yhe5ESgEe5YszvIEBj0Y
 q+yJMXF90vohuMH4Kj5iphqaKF1DHdigHJUVzrb5zy7d5NimlVhGQiL4R6OY/omEtL0R
 qfqQ==
X-Gm-Message-State: AOAM533Lnm8Vl5wHWvdPksYfLyzjIZGKcWodcjad17w9/jVk/r6tAeGs
 xDk44bDPnlNmTj8UdH4kOeYw0UiPNmEvekDc8FllGw==
X-Google-Smtp-Source: ABdhPJzEhSH3aXuhDUsQNi1ovUfza0k5CxBTzS31SjTDxlWsgVyxP7Gb7Y4GaSz6Y0G4nTmSIId/RuXJHrBbS/0t0Kw=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr53322761ybq.67.1653914698930; Mon, 30
 May 2022 05:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 13:44:47 +0100
Message-ID: <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Mon, 23 May 2022 at 21:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The work of finding the correct target EL for an exception is
> currently split between raise_exception and target_exception_el.
> Begin merging these by allowing the input to raise_exception
> to be zero and use exception_target_el for that case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 11 ++++++-----
>  target/arm/op_helper.c | 13 +++++++++----
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index b654bee468..03363b0f32 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -111,18 +111,19 @@ FIELD(DBGWCR, SSCE, 29, 1)
>  /**
>   * raise_exception: Raise the specified exception.
>   * Raise a guest exception with the specified value, syndrome register
> - * and target exception level. This should be called from helper functions,
> - * and never returns because we will longjump back up to the CPU main loop.
> + * and the current or target exception level. This should be called from
> + * helper functions, and never returns because we will longjump back up
> + * to the CPU main loop.
>   */
>  G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
> -                                uint32_t syndrome, uint32_t target_el);
> +                                uint32_t syndrome, uint32_t cur_or_target_el);

"cur_or_target_el" is odd, because it's mixing what the architecture
sets up as two distinct things: the state the exception is
"taken from", and the state the exception is "taken to". I was
hoping this was just a temporary thing for the purposes of the
refactoring and it would go away near the end of the series, but
it doesn't seem to.

-- PMM

