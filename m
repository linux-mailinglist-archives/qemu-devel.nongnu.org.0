Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFE53917B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:10:21 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1db-000822-SY
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw16G-0005Fz-P3
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:35:53 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw15i-0007UF-JL
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:35:52 -0400
Received: by mail-yb1-xb31.google.com with SMTP id g4so9973008ybf.12
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2kfGbhgs4tWtp8UaNID7Zm8Cz2K3axy4EM1gqFvvWk=;
 b=iIPvAnsVBYYWS4dMIWCsTV6FFIEgp6dnWzgvpgwDaPN4wcsOJeKhTxoZpO0csFV3eN
 x9JztGsYt1T2EdcCrsahzXRxEbHi+m7RY0ij7QfvHdrD2OWsw92+/1UOCqrqdczZ4S+/
 ibxu4PlqRogg6QCrPTG2dVtUBO2cte3iMEpllzNEy4ronulYYr38dU3LHlKrV5GOSuES
 r7b0aj7C9Frxd0jNODGJ88QphpwwowAYkryXAxqt9y7Qgr3VBMPL+c796YR3c7suDRqB
 OSEnPy0nanO88oJdRVaSjmndZU/YVZc0GlwGip8zmGAneCENpySH1Zes2pjiXg2Kx9mc
 XJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2kfGbhgs4tWtp8UaNID7Zm8Cz2K3axy4EM1gqFvvWk=;
 b=x72t7G+7YLoSP8HRAD31f/CWkZa8wYmnRVHJGUgQXaLOKezIVmfowYkFwktCDaiEnK
 mVTrYY8iaNm+lgUMyJiFa+gKxH4jNZad8zokToSr8XMWBxV8AWYe0IyfFm9BgoLLT04A
 uw9nPpIISExYccKw0SkIaz/1KRWBbOzjfVe3rHx8WbZGg8kmxfCYazGcOHcQMik3aaFo
 AKR/rZ0JrE/F0m0MRDWDOLDZ5tCRJvFQlqPZQNOj80sdn/NJYAyzyvxAl+d23CTKeXww
 mCioYyLo8nId2Rmuxo9VUOV1FncktFRz7z9Tt/dDUQ6rzvBwgnZc+N9b5VXtDcrNAB9J
 jFoA==
X-Gm-Message-State: AOAM532ve8AyINs0zF/0xW48Xn5DNSFV6QJKaVEJs7aITSVRCk7XybG7
 Cw1KS89MMmetaimOimHHefvCL7Y95hMvYtVAQF3UPg==
X-Google-Smtp-Source: ABdhPJy5UcsUxYhYAP8D9qE+wMIkoqbdAu+eH2FUKPswrqiA1HRhgGdxsHd98f4TWAARKBnef+vyewqZcNf6oem9z3M=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr1844490yba.39.1654000516769; Tue, 31
 May 2022 05:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-16-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:35:06 +0100
Message-ID: <CAFEAcA-=A1O2sfaQPJe4D4FjrVU4SZuxy0SfdFfFZtyxiaU=Kw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] target/arm: Export bfdotadd from vec_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Fri, 27 May 2022 at 19:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need this over in sme_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/vec_internal.h | 2 ++
>  target/arm/vec_helper.c   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
> index 43cff5ec7c..5e50c503aa 100644
> --- a/target/arm/vec_internal.h
> +++ b/target/arm/vec_internal.h
> @@ -230,4 +230,6 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
>   */
>  uint64_t pmull_w(uint64_t op1, uint64_t op2);
>
> +float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
> +

A brief doc comment would be nice.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

