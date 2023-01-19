Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23826673A50
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIV19-0004Uo-TF; Thu, 19 Jan 2023 08:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIV0q-0004Fe-FM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:31:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIV0W-0000Sx-CG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:31:16 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g68so1489248pgc.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mlC/RDm+dqwFsarqc4M4rAFc7/fAHBu449+tofX9+Tc=;
 b=l8sJbUBGmKkC5zBBlZDZXQRujUbCSjkZQl1vfUNUlZmrAI3GXedfvVvKVSybBifzvY
 AnGznNuW6X/xc0GMVpztsmvBHVnGbQOvwaTr3/eRBz2Jn60O68fXrRQJPmVMnYSRUxjK
 IhnAhQLteJLSliv4q4MGZcGzl1HtQbj7bkBoYQhvCwL/GPciCdP3G+d4532pF6WsXeFm
 PsM1hq/o8eUEBEJD4XA2ZKObWzhDETSMP/QNq1CNMMDPL+PIiymkuIYNmAY2ZoN28jIW
 +Ex3UU/lJeMSDQW/NojgQzfBcEzq3fZ42+GAh3XpE9Ano4pSjcxRpBvHLMN/8txVhaqz
 fYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mlC/RDm+dqwFsarqc4M4rAFc7/fAHBu449+tofX9+Tc=;
 b=n2Df/M5iTJmyPRA3FZ9/dnYoNwizLeJab9n8Hph/T+Q/W++qB9PuQwR9PWHFa6uc9G
 0Oc9GWZGrvI37tda74BceI/cqh7z/xkBpo+N9mDUG8rRqI3pOIS3J8dJ0mlCPnc6zCHV
 /uW43x8NdLWqHaaqFFPYSgbIINrfIwiREedqGvi3U/QUiqx6w8VtpZfser80eppo5i8K
 m+rO1DGMvWXGF2inaPbKx9nYWtXJmEKF2hNGb2YDZr7gGYY7cCp36LBZCglRkZ39Z7C4
 3vidOc+khHpi/e9XzO1lvJQA6MrsO2SFxDsaoLEM3BSIvauu8q90vNpYny2/1tUy0Wuw
 U43g==
X-Gm-Message-State: AFqh2kr/X/uc0VxncP76AYn8q5faEAu6LeKGA5CCpxGKv40MfBjd3xw3
 QADNFbJFtj3momg8yoiLyOdrzdbwGo9AYGxGxuEQp6InQ63zjQ==
X-Google-Smtp-Source: AMrXdXtXHt9EiUL6rLOUErg8vbkC4MXmrih6kcvLV/YXneL4PjZGbwxjGxYhNHxNUkUyQHdALklVxluN4DX+9Ibwk8w=
X-Received: by 2002:a63:ff4e:0:b0:4ad:1c64:54c2 with SMTP id
 s14-20020a63ff4e000000b004ad1c6454c2mr969007pgk.233.1674135058519; Thu, 19
 Jan 2023 05:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-4-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-4-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:30:47 +0000
Message-ID: <CAFEAcA_r_jeuFnpJfDkvhXCWKO81wHTuE31Wsjuuu8_Uaxfc6w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/char/pl011: better handling of FIFO flags on
 LCR reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> resets FIFO by writing to UARTLCR register, although internal FIFO state
> is reset to 0 read count. Actual guest-visible flag update will happen
> only on next data read or write attempt. As a result of that any guest
> that expects RXFE flag to be set (and RXFF to be cleared) after resetting
> FIFO will never see that happen.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 404d52a3b8..3184949d69 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -87,6 +87,13 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
>      return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
>  }
>
> +static inline void pl011_reset_pipe(PL011State *s)
> +{
> +    s->read_count = 0;
> +    s->read_pos = 0;
> +    s->flags = PL011_FLAG_RXFE | PL011_FLAG_TXFE;

Should this really be resetting all the other flags to 0 ?
I think we should set/clear only the FIFO related flags, and
leave the others alone. We don't yet implement the
modem-status signals, but if/when we ever do, clearing them
would be the wrong thing here.

(Reset still needs to reset all the flag register bits.)

thanks
-- PMM

