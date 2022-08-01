Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3B587438
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 01:03:31 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIeRW-0005q6-Rm
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 19:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oIePw-0003xo-DT
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:01:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oIePu-0006A6-TS
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:01:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f7so12309288pjp.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9uQrpkHatBOf/1T9Sq3sW6L/FSBkGl5woPAXbZZ2GQ4=;
 b=bXOl39UIIJA51JaU4Rjkxo7iMvMvif3mGLSy9zBe7aag5thJXYaMJ5gL9t4/STtBYH
 9jL7VfXcEWg0rsojORhnTxJezVla9iTQo+FG5TZNBHZuPwAxVWtrD4f8ImqLSwEmN9f7
 V4bHWedt42VGgqod+ozfyXMSgiaE3qPN0pAn2JbHslT28L8Cea+j95Qit1cGufJXruz7
 AQAbGgYgcaIN5fL5Sd2e1uNAHZzsHhe0kqzMykNnIQvO5YTxj2CSGSEyreJIsQoXBgpN
 qO6myii1cm2J3Zj1fzTjmi9WPH88D0oRtJji4w5D+FcM0aZwA3Fz7ZHTwpGm0CGW1x1o
 QCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9uQrpkHatBOf/1T9Sq3sW6L/FSBkGl5woPAXbZZ2GQ4=;
 b=JeG7WuoWf4q1GIvUT9Kt7VEWDcU4QkE4NJ9DbmnL2jlWi3lfWeB5G8W6cG8sMK8VeT
 QrvIeu3GRN+qGhLI0lFVSuboNss0hcB44ZgfUegvLftZRYnhG21sbOtOiytzDNPdEZGf
 +1FZVd77wkUXxBRRojPrfZMYnlpA4QADoTAEESu0qhxY/vdEKPw2AVvTvYWGVjGeuDV7
 aFJbFX/4nAxN+vkTJTySghvYUXjifu7Bvii6BeM1Nvrh1fFBzkUz4MzG9iV1dEyKlHZG
 7n+scb+UAgxSuJYbN+pg5e2Nwz2DvZFkvtV7vWiUOYS0Nc2Y7ob45EkdH1qR7uaCwDiu
 28Mg==
X-Gm-Message-State: ACgBeo30KS0PaiEQQ77brqINvIwOGuooFhaRTfGKh9+4pjJHPpK9YB7l
 P/SuCJTcgS4XSI0hAaR1XGoLbVS8x0Xch0h/dzI=
X-Google-Smtp-Source: AA6agR5Fws/FDzlt8881YeDXJxL0JmunnJiEXKOYB/jPlEWaag7sTHHnpHFD8z6sbg8laytc+XXulagpywrpwHo3Buc=
X-Received: by 2002:a17:90a:b391:b0:1f3:6c3:392c with SMTP id
 e17-20020a17090ab39100b001f306c3392cmr21506463pjr.166.1659394900123; Mon, 01
 Aug 2022 16:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220729201942.30738-1-richard.henderson@linaro.org>
In-Reply-To: <20220729201942.30738-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Aug 2022 09:01:13 +1000
Message-ID: <CAKmqyKPgL5AaG9T92yfKFTzRhKuiezSThYoo-pwNB3MLrx53Bw@mail.gmail.com>
Subject: Re: [PATCH for-7.1?] linux-user/riscv: Align signal frame to 16 bytes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Jul 30, 2022 at 6:19 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Follow the kernel's alignment, as we already noted.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1093
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  linux-user/riscv/signal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index 296e39fbf0..eaa168199a 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -64,9 +64,7 @@ static abi_ulong get_sigframe(struct target_sigaction *ka,
>
>      /* This is the X/Open sanctioned signal stack switching.  */
>      sp = target_sigsp(sp, ka) - framesize;
> -
> -    /* XXX: kernel aligns with 0xf ? */
> -    sp &= ~3UL; /* align sp on 4-byte boundary */
> +    sp &= ~0xf;
>
>      return sp;
>  }
> --
> 2.34.1
>
>

