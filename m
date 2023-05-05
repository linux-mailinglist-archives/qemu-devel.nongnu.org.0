Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B716F80FB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:43:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pusuW-00038N-3E; Fri, 05 May 2023 06:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusuT-000386-P9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:43:33 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusuS-0007Wn-7h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:43:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so2858263a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283410; x=1685875410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoFlwzXN5mH9Aj4KpFXV88viAD32yd1whvy9VzDa++8=;
 b=GOGN54+QleJEx2Ate18HzRmFFN+84i4/51x+VxUT10qRiAmWcEBA8I598Yykiw4DqC
 kJav5fHhTFC/zqz6qhcQu1t7LBkR1GA8U7bUitEG8RMX26NMMVd4yy0J9Y5A/MuobWGE
 m792Mi3st2oMRIF8TjybtrF/Oe5Nmsgo9HzexA/JovjnmDJouC5UY6MA0QiBcU1CDCsP
 L48eSZBvId98Jsst/VJBOiEk87+GJP9i+O2M09pD+97t4arsi7HHTLBYJLNl0FbZMAn+
 EtAVNu0niCnvF8UWanoljRhb9JRLRIUs1j3gzZVc0VWHYZDMZK25UVqUztVtUhrQWlEH
 u34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283410; x=1685875410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoFlwzXN5mH9Aj4KpFXV88viAD32yd1whvy9VzDa++8=;
 b=Tc+KNk3wm1opHI5U4B2oSSk1IvvKPVTm1hJzC9dXeNWty25dy0AxxNOWi63dkEm3MP
 2WAbGayaaD1RKbH17n5GiJrmkG9j1bfOIQ/sM/0ygDu+lGxAVyffgX0Za0Ue6Y8Yofue
 6W9B/uvsh+4VfLviqq8z5xeo6irJzvqljWjsaR+83rgjWx/UIcTpMZR4c6bJ93xd+VoV
 gjC2XqiKmHxYzRY3wm8etjozgxES/7DFewUqERaBKoQSuxM2pxA7vDrJXTBTNU6WfbVt
 W+rCf+0137dcfNtOHnUHzEVata+PNUcA8ABW6uEQb5owc5je1Ksv1g4DSPpkm7y5xHnt
 AVYg==
X-Gm-Message-State: AC+VfDylrr0D0AOT3C0En/FvTwccfw2Xx8nUOJO2HnS6Gmhf1RNvKUt0
 mTcR7hOF13kMt7Et6nn/BOW34GAPJd9T0R5bey2Gpw==
X-Google-Smtp-Source: ACHHUZ7OlZqBCgw1LNirBvQkahUBqOz2NHXn5wyiCmSMCAM9ruLxw+vNlt6oseN2adqngkwJ/CiRey1xMbS/GnL2Bg0=
X-Received: by 2002:aa7:d54c:0:b0:509:c6e6:c002 with SMTP id
 u12-20020aa7d54c000000b00509c6e6c002mr971466edr.39.1683283410624; Fri, 05 May
 2023 03:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-19-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:43:19 +0100
Message-ID: <CAFEAcA-sXLdmmoHTfsCrPEDQvxczh10tLwcFC1qB05UV2Y1ziQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/57] tcg/aarch64: Detect have_lse,
 have_lse2 for darwin
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These features are present for Apple M1.
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +#ifdef CONFIG_DARWIN
> +static bool sysctl_for_bool(const char *name)
> +{
> +    int val =3D 0;
> +    size_t len =3D sizeof(val);
> +
> +    if (sysctlbyname(name, &val, &len, NULL, 0) =3D=3D 0) {
> +        return val !=3D 0;
> +    }
> +
> +    /*
> +     * We might in ask for properties not present in older kernels,

"might in ask" is a typo for something, but I'm not sure what.

> +     * but we're only asking about static properties, all of which
> +     * should be 'int'.  So we shouln't see ENOMEM (val too small),
> +     * or any of the other more exotic errors.
> +     */
> +    assert(errno =3D=3D ENOENT);
> +    return false;
> +}
> +#endif

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

