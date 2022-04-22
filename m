Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C750B8DF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:43:35 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtZO-0001QD-Pc
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtGw-0001s5-3H
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:24:30 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtGr-0008Vw-2E
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:24:29 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7bb893309so5229757b3.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4oG520cmTs0S6O43z9IazZiFJLFULyxmsL+Dtruoh4=;
 b=CZ4fuB/JanhHkdQZs9L3oNJYWDeoHBu1mmPQab2ZfigDoro5HcVv45sMUQL1Ez8C0F
 7NggIg6M1ZFTNnZO5xA2qzxqwzkDFdDUcc7sg1i9GNnIDT6Py5t6o3hcfBfYwzYr0U2x
 qnMbZbL3X1EF4F+ahTEJN+2yKSTYCFIui8HI3dhRfkvWNfbRDlkmuFXWY/kpf2wPRb/B
 dV/ZDq920MVAZ/E6rfgBXWLdn36hJ7NRHbK55XdD+Ta/Ga9ZnHfIzZfVaylvKvJXlrgx
 xz/dFMKrAtiGGPDY2x/nHevr8PwG8joEuJcfngghxA8Iz3SBaKOZSmGxDLeRKRjj6wuH
 fh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4oG520cmTs0S6O43z9IazZiFJLFULyxmsL+Dtruoh4=;
 b=eTacZ9IZSDRX5Vx51MsvgxX+RCiZXoVR+6nyzWhCCypjNAIHVwjgBPoofHHA500uJB
 T7TZBpzTvp9h5m54Cjqji8bDAuzB86I0yita/T1QuhAQDkUAC3ToGoofJ7gV2XmKSszp
 Ufa6/bLko32DSv3MV34Nx/VQ58pAVTe82Ttj6srGkctq2/u2TB2WTOCF3nU0d5nALNB0
 dOxn5tAjmuDjuuCkZA/v1v/G7sm9J/qb8dTqcnmt4H5/7Ep0QtwSWIbfCnpM48+4v9/G
 8MzSOZuFcjALskDE0Bc9VRN2u+m7Bm0mZcm7geTWlsYPpm5Z2u5uR8sPZviN43sUnDuq
 G7+g==
X-Gm-Message-State: AOAM533A4ltpaafjv+kLnD8gU4Poc2y1x9Lgy8GOFFXCgY6DNjKB48iI
 Fi0GVh9tAeC9ir9Vv3Akj2+kmP5+g7WwAAuvib7+FqmXA/M=
X-Google-Smtp-Source: ABdhPJzxiHY0rbKEV1jaH/+Tec01oBx456oLEykKiSddfvCfMUhUxfLZ51pMieHrbaZKGJujF1wkeNnFnwqlcwrmiU4=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4677851ywj.329.1650633862603; Fri, 22
 Apr 2022 06:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-57-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:24:11 +0100
Message-ID: <CAFEAcA_BR-+=q8Lo5CuPPQF+SyV99qn8TEwj6Ko=ca64eTmPoA@mail.gmail.com>
Subject: Re: [PATCH v7 56/64] target/nios2: Implement EIC interrupt processing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the cpu side of the operation.  Register one irq line,
> called EIC.  Split out the rather different processing to a
> separate function.
>
> Delay initialization of gpio irqs until realize.  We need to
> provide a window after init in which the board can set eic_present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

