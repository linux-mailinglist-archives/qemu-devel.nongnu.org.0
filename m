Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7437A3B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:31:27 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOje-0000cQ-Kl
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOEp-0001wd-VZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:59:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOEo-0000y0-Ck
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:59:35 -0400
Received: by mail-ej1-x629.google.com with SMTP id b25so28586949eju.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=COT1W1g2vBNFAz9botDYPIDiRTdJxx+YApaOX4ZYy4U=;
 b=iXRF4XPATd9i0Wdl8TwDUW+ScnLmZqTmQZfJwEcf1oJ62K7IkvSUv9mE8eONgM9jie
 kIMPBA6w2A3BEoIsAWzMiYyV7tIz9tBOZn/ujxJD/2XjQDvpVqZ9K68rjHaDx58r9mTg
 l9EhuDhtnJRXGbUYYY5doDgoFKHAKX9OIRebQiBRHRiy1I+3A8vaXEqzpujxvnNnGqjP
 89lnp/UNfzwH+lyx2iSeFCYasb3/sgWSmb+HSsNBhF90C1XskcolraXL7fqt1BH1mVbx
 q46E8Jkwxt/rc1+Iwz9gDMl+UrV9G+c4ldBpIKmfAqE3HKFw44o4dP0hafQKA/iVV8PS
 ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=COT1W1g2vBNFAz9botDYPIDiRTdJxx+YApaOX4ZYy4U=;
 b=aBArNoWS8wkQgwFvtCgdaDkdPTPPov/WUTg6chIb3/rnHAGnWVR9C5qzDEJ5o1NJwu
 FzRv84Xfyp2oHpSedjPnYFLP9rY5S6WSjUs24CwW+VdD8yMj6eRqODZfzZwwMJ64OtE5
 2fMiMplaqK+ujtjsaUx2Zkkz5AcNwLPZ+YUnMBHLLQ0Qo6vhRI//crY/0mkPOeEU19Mf
 V5wmKLAfw4lRsLTg/7LQoX1ELQsRjCK5ZuITIEI6aL9tjRpHTj3wrYfRmAifmnbg3ZcN
 5M+XX6u/s0kkvEj2EaxY+3B9m5Ujeb1x29f15uCh+xE1ezodHwVkG7Rz24Gy+lPNlG+D
 kWPA==
X-Gm-Message-State: AOAM532BVIJqJMBNwVygVf3sW7b9B2fAHB7Uzu0j1fVxJNVS9whJEV1i
 o80g/H7z7eck1nzWx4LAeNv1OeOfxd20o5GXjTln5g==
X-Google-Smtp-Source: ABdhPJyxO+Wk4+MkKgo9VfaOhu4JCyDMuD1IYrjIazY6dBIkJ/gF1UZ29nQEViQms8QkIiaOoBIE4+v2sIPShfDT0/I=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr8407143ejb.56.1620723572656; 
 Tue, 11 May 2021 01:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-9-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:58:20 +0100
Message-ID: <CAFEAcA-OvV6gQSTuGYfLk1G6430TEZ-DOYn76NwnARzb4NcZhg@mail.gmail.com>
Subject: Re: [PATCH v6 08/82] target/arm: Implement SVE2 integer pairwise
 arithmetic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Fri, 30 Apr 2021 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Load all inputs before writing any output (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 45 ++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++
>  target/arm/sve_helper.c    | 76 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  6 +++
>  4 files changed, 135 insertions(+)


> +DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)

H1_2 again;
otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

