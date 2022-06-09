Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E980545421
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:27:31 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMsS-0000RT-AO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLGS-0003SC-Lm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:44:09 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:42472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLGN-0005qU-A9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:44:08 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ef5380669cso247178797b3.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lgo/BgbIJSMWW6RBKu9rdwZ/51M+gT4m9V13+86mgU=;
 b=obq2uePCJnAPYBn2gpVFBmD2luYkjtjJkVXrKlFwjGhx/YMzl31Vh8wkiDJsrnXy26
 8813Q3pbsO5ggzpOrgLOnKQDZfp+2jvLAakfEXSpQBxhtluR+fB8Fw6yyNlCTus+WNXg
 hLNCcYIfMVb8GSwF3Rf3lG8CM9pLrUSUHQtsy/iqcY1Fm4vU1yrD2LIFMzokZZPTm7bC
 I+OZuIZAxWMFChIyCjsH8zJMUpyjkrRtzdNTI+7Wx1S4gcniOc9H2z2w0jBRBR/JAM+H
 cMeEHc4Em8Jg/Fhup4rY7behymOxeGANWt8lnGjU5gY+y5WKQkFn0Aec+lwgCgcKAclM
 Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lgo/BgbIJSMWW6RBKu9rdwZ/51M+gT4m9V13+86mgU=;
 b=ESpcTrAevd3tC/N307lnaTM6UIrEzlAAoRFVa9WIgW06OzncjlxPJflYurTjRFxTEG
 KPhbB3VidaMzIuWtk4j2KidVtKZIQ1lY4F3egQxP3g3AN4O8f8l7yBZy57eEBodONr+D
 6QGFB9wzVhk5JiBv2WMNY8bsrPmvrFr/xgYmjs3mprey8lt7ZK7yqzLerEbo64T5A+ET
 5qh8uUOrPLDua1Uz8ULgmbqFWrdoma8KQdBBI2nkO3uulVHT0VtdBTRqHmvtfx6kw3fP
 luS/yv7ibgL/bbRIqk+gXd/m26/krK64gr+PGDAR+ouDKI7MBHo1cBjEo+UqiRzVhYhx
 xTmA==
X-Gm-Message-State: AOAM5332MHuOlF2KphFDfY+n1ihNx8hEsdAAtSL0Hvm5ippBwP7DQPJY
 Alv4amJYUFNCxo1Jtu70Xo5W9GlMCnTp6SVL44VDMw==
X-Google-Smtp-Source: ABdhPJwybBgL2Pfc60j9BQsDYlNF+aQKThVs7iOwJ/H9BSyuICtFoVfeXRZdrLF1iLYd66iePf9J3JGxnaIYx3H6DYg=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43440849ywb.10.1654793042346; Thu, 09
 Jun 2022 09:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-24-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:43:52 +0100
Message-ID: <CAFEAcA8Ba7hVp5fDk9C=ARarJTmGhUmPdzNQt52O0S5mQhDc_g@mail.gmail.com>
Subject: Re: [PATCH v2 23/25] target/arm: Move arm_debug_target_el to
 debug_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 04:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is no longer used outside debug_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

