Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E531751D75D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:14:21 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwqi-0001B0-E0
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwoi-0000AM-8d
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:12:17 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwog-0004cl-OC
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:12:15 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso78915757b3.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 05:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVqmGE2uPQElijj3+6D1j/KSIGQ3WeBppv2U5idx3nw=;
 b=gLMXPRZfXG+O62P4avaySl1o6FbBhT+w3q+wgvds/BVm3BLVO9Y0hkRB6Z4GEImoea
 rAIjy94Ah/W6WhzGDC8ncNqmcIHXaVxi8k5dB8dfUQmvrq1Z/izQguDzQXiGAGTNoztM
 WilvDZP0ayH0I1uQZ/JnNLHis0agGhQiCZjI4iE8b8r40x6gR2uQkIHi3Gxn09WBtxMS
 P9q+fUepyUrWhPXHSixdCalTDzbgtUVTX+OL+BI7fHD+/X9uMOaezMzGyyJtwWJhynWD
 Ry0qc80Edni7hPC52vSjVqWCOb7R9veAjOvsuEbkSIhopjD0XXIt+pTcM3b/TVaSjvD2
 RbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVqmGE2uPQElijj3+6D1j/KSIGQ3WeBppv2U5idx3nw=;
 b=YFBTZnQm5xegy/W06qXE8IJwfZTTxxxC7ad+t+Jg1r76yb8wkPNWnFSue4MkdgzMbG
 AEQnbLJHUmg1xNPovwfTc9cwCqP8ACFWmWdNJ+camt3vslKUpWYD/w8c+ykv8wtW7wAI
 3Li7NSzBKmtC9Dim5jcsP/3jg1RsHoJrfqCRtIjYfss61m8CjSG2Z5T6G3M9hhy92AkH
 gKmO1qqIoxOKlZ9oze7Voa6ECB9hs5/TKjKSQ+KXRP7Tns4MbmKPh0FVmLzuwi9/1mSi
 ABtv+vXMBN3lJcTIRe3B4lndDEGmgpuT5GGEMhzlwtqN7m6X0yVsYKQbkGf7n1ykETi4
 UeSA==
X-Gm-Message-State: AOAM532ScwmAvduYdKNnsZ3fDlqjAFtWPzKuTIW9VfswCWM8KWuvLHqL
 i3TUJVZDGUbXaw++cblDemca+NW/CqjDnhK0Q1tcXK5zrj4=
X-Google-Smtp-Source: ABdhPJwCWr4FzBf1Mwz/ppdO7QBUn3Rn81GEE14yQ9fdYVdaKVtpyyFculG+fXAXvUrXV3LG0WKMUUPDA1Vl6OCNiaU=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr2237620ywc.64.1651839133199; Fri, 06
 May 2022 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220505185006.200555-1-richard.henderson@linaro.org>
 <20220505185006.200555-21-richard.henderson@linaro.org>
In-Reply-To: <20220505185006.200555-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 13:12:01 +0100
Message-ID: <CAFEAcA998FFitC6=EoP51wg-sirdoAP9MS9Y3OnEfceHcvq0MQ@mail.gmail.com>
Subject: Re: [PATCH v5 20/24] target/arm: Enable FEAT_CSV2_2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 5 May 2022 at 20:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
> v3: Rely on EL3-no-EL2 squashing during registration.
> v5: Set SCTLR_EL1.TSCXT at user-only startup.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

