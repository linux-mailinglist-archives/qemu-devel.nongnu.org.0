Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68250A6FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:21:06 +0200 (CEST)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaUL-0008Ua-Rl
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZeq-0006DW-Id
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:27:53 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZep-0000iC-4J
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:27:52 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f16645872fso57976777b3.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHQPfwL4ar6ck6OydhQmkIf9PG0jSvjA6PVgU/Afq18=;
 b=YzB0+Y0F5GDmj4pP9KtMMC1tUJG0QkmPI2Pw+x1uJQJJx0LGCeojyckkR2voeXRLFF
 0gxLbj9fdqHroztOemCCPppRKTrjktZmty7ZjJ+jsQjwsofHUemV+8Eq85I+NVt5mxUU
 RCBf7g0Q+WFZmckKl2uC70XJ6ko3I9Tnpe9dizr7+2vUs99AU4MgXrW4dOCbX3PeH6O1
 XZfhUwF5CBWEtgYYPoyjQTCfueQ6CKtiZxniREpD6N4Pqrd3ZVwnPhMu+ws2AZQQhIXr
 sB2EEGxoM9YHRZ/2scmgeDp9INxi0dYKvz4uuyOh8sfv1XT849jxQFHXhnKnmrk2H7nX
 um5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHQPfwL4ar6ck6OydhQmkIf9PG0jSvjA6PVgU/Afq18=;
 b=pB6w9PhxJuPq6V1ypl2tojo66nA8kuMXrh0gE1jtS5M0nihsH1MKkLvlF6NLCFfWyU
 p6Iyo1/zC3O8m/O23w3V7QN6LTylbTyV631vH/vukEnfX/p1+UABi0CuHbqLZRISbDIq
 DoYoUWd0n/6bx2LmjuHMIiMfgAFY9IdnxKB4w+p9xawKA74JYdbm0oU7ZoCxOsqV1CU8
 d+TNX7cX4ygCnLuicB41w2aJRvS/EskZAWoiertua6FsAdJU4XNvAcy90lJE8qcTr5vN
 wPGpW6f8j13HPAmiH8FlbUh+J0sTbuC/6x15h/DvVYWhFnsdxeiFzdlLAMIBj0vwQRrt
 IG3Q==
X-Gm-Message-State: AOAM5325IsdAK8OWJ2SEMbZB8eUVjc7u4D/ETDXVUbJASvvMuK2e5EqW
 9wcz19+stTFx0YOOMm/iAjGO8+ts2FkwgRjVf2u44g==
X-Google-Smtp-Source: ABdhPJxAleNFNJWKM1lVBtqU07KDn29x+SAobjT2mufqcSNlm+fhqbAutCpJKdgCqkQe4rWgO1s1h6rB8bFgWBkaZYo=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr461729ywj.329.1650558470144; Thu, 21
 Apr 2022 09:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-12-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:27:39 +0100
Message-ID: <CAFEAcA98E_tOiXzHiMUggNVePs1S1=iDwWnrwiSi5JR5RFo8uA@mail.gmail.com>
Subject: Re: [PATCH v3 11/60] target/arm: Split out set_btype_raw
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 18:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Common code for reset_btype and set_btype.
> Use tcg_constant_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

