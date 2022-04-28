Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EA51325F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:22:22 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2E2-00069k-3B
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Wh-0007Bf-OC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:39 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:41087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Wf-0000K2-4y
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:34 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ebf4b91212so47893057b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SL7Dt+JgQexzoWT3uVwb7dTDk9XMW3uyZE3tXJdDdsc=;
 b=OAJnEfoQku5h+fZWEzu2bL+jd4PjVGmOyFxUAtLzykbOcBfXuu5hVMLt6UT6uxpF4t
 m4/36dFZPKLMvUXXvDg6y6ZH3Vino4CWcyiu7VQ1ju79yjedkTAls1geQUd4prfsSw9m
 QHny+4nJKaol/aByThM5NRluQki9VYbuxZGY43AHdUNSauxH414HFtvnVVUfx//JukY1
 hml69Fv264pL/aL28xaJ4j2+/vZi8Osgq0G9jbMO4N2m59dYReAE0/ahtPydy8N1Hkdd
 sbDnIAWUc+Ob5SO1WRfi/hS/kJGPAdaT8qDwTguTiBdyiKuyoryX50XvM+2mpWQScKzU
 IDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SL7Dt+JgQexzoWT3uVwb7dTDk9XMW3uyZE3tXJdDdsc=;
 b=weWRB8Qx1x8KXorAr781pKYVt9a3mYUAhg8OgGAfr/gJdiPJjoBfK/VPSo/2iI+kG1
 AgYfEFNwTD9so2blvF1s19cc2iZRamPIDN1UNs9Xib/ZCm5uQ44h+Nc9hmgTZ3iD37dU
 9EhxlpT6KCxKIi0B6nLTa8FUUr4DEiBnrqhFjgI6orhI8MEsmjicQXEa74WYanmTl6rQ
 s1xF9vUjCDzx2v1IyGDwgfVpP3sQlE6TnOvD2vIpxL3u6b2kOQ3uue7nNXa7EUs8L/Zq
 tY78fj3+mYgupokrZv6P/74ZSLM0p+dyv95JHrM9jAgS0k9xq8i0FSpAGKaiLTsyq1MM
 vtMg==
X-Gm-Message-State: AOAM532JgWDjEUobAnNv0sbKgrwuZ0Fu9Sw4WiiSTrLzHp8TGoBmLGnQ
 wgrOoV3iz0wMVYnDzMSVfn56wZpcE5cqHlPluFrhlw==
X-Google-Smtp-Source: ABdhPJzqctjhUBCDGEs+4/CXJinE0ZG9Xh3+xjHcH2g6wFPV6SsUQ9I/INXHsRQNvyxUvfKrEqh1OzCELhFTQk2hy4c=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23128488ywb.469.1651142249434; Thu, 28
 Apr 2022 03:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-32-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:37:18 +0100
Message-ID: <CAFEAcA84pVaDJeOviBfE1QaNcPLtN1CbdLRCPribLenkWkqVrg@mail.gmail.com>
Subject: Re: [PATCH 31/47] target/arm: Use tcg_constant for TT, SAT, SMMLA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 26 Apr 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

