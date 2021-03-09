Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA6332E84
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:50:02 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhQf-0002wY-V4
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfJ6-0002Fl-9w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:34:08 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfIz-0004On-OP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:34:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id mm21so29351403ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eoW+NUBLXQVth9I7uZ/xZMgYGiijLShaBIeMmb6/YYM=;
 b=kYna4ykoFSnqrAa9gotN/tRVQ2uP/EY/flfIElYHfQjWFTfPLdKHzo6oyKRto2cYS7
 O6dOi7lLUM+qbBO/+Mwnf3hhiiZ/HAD4fFGbkuXN7lGPMVE/UYlSJf1SwMpTF3wZA+ip
 bgY3XPpAHXRCcs89kQkVYW5jVhfV5RcgoF9oPOnUF9UiyZfEczImDPYdPdI2XqaSvISk
 mefesAhEvUNuLzIt4HljcMJuF8GTM02Kwwl4sZCM3LFUiVlhVxLLAMDrFOF65q29Vr/d
 JqgQJojiA490E/HmKkz/a9GS8TH2xdlW7wn0f6EAIRpuBjQ21D8ybfPFpLPNA9e/oqOE
 PRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eoW+NUBLXQVth9I7uZ/xZMgYGiijLShaBIeMmb6/YYM=;
 b=UQpkY9o1e61+ZJ1habhMsDM4FmPfQ/3J3M74lYr4Ng91ptXyjpCsZ01omgVO4S9pDx
 VwLQBpos8mtsf6YdYvMa2uqFfs0o3mrPrDfYQFzhpD+5h1Bdl/ZtUF6oJTTgV/+nN4R+
 kjevZxH7MpXD8kzMXkVZfX+muPwV+09OG7+gj7UeokPW3y2MzXiMv9VpnTSwKxdDYlnr
 S+MnttICMyYGSgp1DNDP7FfDNGItgGdkJUEcxKyXqWni9hAc/XxooJm3cFDv8WeK9P1g
 OhEiTljhsmBDAbssC7kiaEXtosSWMMu45ehgx5lAHxVtecI7A3X4LUn7YTuAHolxhxtY
 NOSw==
X-Gm-Message-State: AOAM5315hukGaKXmyYjkkWlWpbgz3SuAfzHoy5h2VTTJDbZJlTTyhiL9
 nmEOAtD62NU0gK7bvSTjpxP8csxWk5aI9cVlkeabFg==
X-Google-Smtp-Source: ABdhPJwzAVqDc0kf8XFkq7891VgcoZC+SmrbNScZ5iOLUrV7n1I4lVsTbyUxXK7lwnK4bkNbJ7nhXswLimpCrI+GqxA=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr21464505ejd.85.1615307635884; 
 Tue, 09 Mar 2021 08:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-3-alex.bennee@linaro.org>
In-Reply-To: <20210309141727.12522-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 16:33:38 +0000
Message-ID: <CAFEAcA_qNqFbKvbEsLZuPUPyp+aQQSgZg1HMztbVBPW=vGRxyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] semihosting/arm-compat-semi: unify GET/SET_ARG
 helpers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 14:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From the semihosting point of view what we want to know is the current
> mode of the processor. Unify this into a single helper and allow us to
> use the same GET/SET_ARG helpers for the rest of the code.
>
> Note: we aren't currently testing riscv32 due to missing toolchain for
> check-tcg tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 54 ++++++++++++-----------------------
>  1 file changed, 18 insertions(+), 36 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 94950b6c56..733eea1e2d 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -767,15 +767,28 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>      },
>  };
>
> -/* Read the input value from the argument block; fail the semihosting
> - * call if the memory read fails.
> +/*
> + * Read the input value from the argument block; fail the semihosting
> + * call if the memory read fails. Eventually we could use a generic
> + * CPUState helper function here.
>   */
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
>  #ifdef TARGET_ARM
> +    return is_a64(env);
> +#elif defined(TARGET_RISCV)

can we be consistent about whether we use defined() or not, please ?

> +    return !riscv_cpu_is_32bit(env);
> +#else
> +#error un-handled architecture
> +#endif

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

