Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7945163E3
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 12:53:34 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl7Cn-0005p8-13
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 06:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nl77Q-0004XB-82
 for qemu-devel@nongnu.org; Sun, 01 May 2022 06:48:01 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nl77L-0006Hx-QR
 for qemu-devel@nongnu.org; Sun, 01 May 2022 06:47:58 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so123569087b3.8
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLAIFtX2tJnIhI6+THl8JJ9/NHHQWaAX323v8aQzTng=;
 b=XfsLYHaWsxCDjuMv5xog3fSADGn9X4qQCnRM5ZpCYnKlu583CFMf0w7mr2OYTH05dC
 32plZYFU/w37Bf5oPdfPerAtCgb2qDc94wOFt19x1hlT67JlLe4sazfOskqcqb96Oame
 6rvLfnfT1K7xkBxnMzQfdfDBW3h9+OAhP3BaGg9mtrVKiR/xP6jzVNUznRsUsDWg+6bv
 ZKuEB5Joe4MeVaxERIFFYVKCNGb1oEofLBBHXp/QEM4ckQUjluxoTvzoi8VH6mR/h3SH
 vzVMGltj0jhHj5Qw1bpSx49PBcEQh0jZGzP0f8asG/kXm2LQ+25iqJF8wkDqtZju+JmB
 Wp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLAIFtX2tJnIhI6+THl8JJ9/NHHQWaAX323v8aQzTng=;
 b=ry9Mhfv+roXbjYgu58YQNgnLjGVwSjJ/mRpltIJHxMrSYKQidyLjPXJ9miHGeLYdmu
 3pGf+sdwBHHolQgTY2gNVib0DPHNiyhKF4iCcl6wF59X6sudVSc8fL65lOEK8j48hVqG
 3mqXlDRcsJqcUmj1JUlj1vhsw5kiIFx0aPG5YakpLn8zakEf14lztpPKzE3f4nwO/yih
 9OnPe9nbFCYABrjCSwCcdlLNJPiHgHK2fK/aQNzbTcwnCMs4Rf0KtY+pM3XpcqDkH3lQ
 BtQB8JPlGd8AyBMHitiOAywj7TtWveHll2+gvcMfWsc4naD7d54qcc4cY3GF2zTtiBvL
 xoUQ==
X-Gm-Message-State: AOAM530ju2Sdd0zGNID+xSpazfkiYHTVHKBsYDF6GavVhvXK+P/BjqmL
 SiPf7ZGk7O1jUQxg8I6vxgAsRadJlUvLbB9KQny+/g==
X-Google-Smtp-Source: ABdhPJwXcVaTtwRVMExEuLIJTFWEmahB8Y0yv32kTGBELO/ciHzLXxZg7OPl9rJJPt3q1+TyYTYOQZBHd4M3eN/S0R0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr7235635ywb.257.1651402072851; Sun, 01 May
 2022 03:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-7-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 May 2022 11:47:41 +0100
Message-ID: <CAFEAcA-09LuiKfLySiCwzhwJfLSo+aUGnb3gnA7Jdj_q_R5-Bg@mail.gmail.com>
Subject: Re: [PATCH v4 06/45] target/arm: Avoid bare abort() or assert(0)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 1 May 2022 at 06:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Standardize on g_assert_not_reached() for "should not happen".
> Retain abort() when preceeded by fprintf or error_report.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

