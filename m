Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF337F82F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:49:20 +0200 (CEST)
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAmF-0000un-3W
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAZJ-0006gU-8S
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:35:57 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAZF-0001B1-Vw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:35:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id l7so30837687edb.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gY8o2jDq8yl04wCo4NWQaqJUW7SIxlKO9dxEj2af2zU=;
 b=UtUUS6nHw2JM3yEO7Xf0ehJ7O/QCibVDMFRo3fsI5j/yQzX1aZnLI5Jd1VYmV7CYsg
 cYMZoZa3alnD4a/nfon4ReBvag9Nqpc0iTJ6eydL++KPG7fnsNKctw0lgecxsOMuFIXZ
 JkfBqJxhHBiVPvJt2Hl5BBlQDnuZmuK5HuszbhiPl9bg0gjLiltdnAqMuPHky+b0IC5o
 /TV+3Gvs6OFOYpIX+qJ5hHsfhZBWwOdbtIhJSTqXYrlV7EICJ9AeysYZ/ck0C8LQHxWF
 juZYencnttN9agOkHbVPOjodhtyCezXvgm9J0a0UR68evdPVmQKK0in/+LT7tOxdXtk3
 AL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gY8o2jDq8yl04wCo4NWQaqJUW7SIxlKO9dxEj2af2zU=;
 b=qzzz1+zpiWWDK2T/PGsAlrdbDsj8siRRxWJTrsSOjk6bA2cQDa9JOGE3SoSqXkZw+F
 k+YT+bH7skc9Vud22YAoEhhAFIGdj7uQ3/3OcS5b0ODewZlCS4bp7UnZk62oUJJE4hZv
 ik5N3yA0rGLKSj5OFV+S1geeGZcRpPwnnQNTuRT/YYeAHTMgHnRuJJE9AAsQc5SXWrZz
 5V+64UMW/8IyJKPUybMUzmO9+f+/bOp+sfubbnElBFTKB39Liw831AN72/qJ8gupjkao
 8OWuYSRWNNwvxzMIQGVndzpBldeFNZpcbmj85dbu3lAdUs5movvoEsf6OLcwrd0OSWA3
 fxkw==
X-Gm-Message-State: AOAM531tQ8T/t9P3rl4dkQ8BttIgMl+OWdd3kJZFKAMzY7H1gRuSDeC+
 EzzIXZF72IkpEeZ8VyxvREguPWBE36phSrXSkpMjKRRdp40=
X-Google-Smtp-Source: ABdhPJzQV1VoezW09kuVZ3T2CJFYIR4ngKiNskVxf5ze+5IDK5vjUtjK7NlivB3nLtidEErVtlk7OQXjCT64oP2MuAk=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr49393724edv.44.1620909352364; 
 Thu, 13 May 2021 05:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-55-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:35:40 +0100
Message-ID: <CAFEAcA97yrN+Yyk1fbDHerBuuRe15A-7ieaAkEb=Fm-58Xw9Dw@mail.gmail.com>
Subject: Re: [PATCH v6 54/82] target/arm: Implement SVE2 saturating
 multiply-add high (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1487,9 +1487,49 @@ DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
>  DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
>  DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
>
> +#undef DO_SQRDMLAH_B
> +#undef DO_SQRDMLAH_H
> +#undef DO_SQRDMLAH_S
> +#undef DO_SQRDMLAH_D
>  #undef do_cmla
>  #undef DO_CMLA

Maybe these undefs should go in an earlier patch? Or perhaps
we just shouldn't use the same DO_foo name for two different
operations...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

