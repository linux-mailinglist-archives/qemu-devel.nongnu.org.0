Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BA399DB8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:27:11 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojd8-0008AU-CJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojZ3-0004YG-AZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:22:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojZ0-0005RB-Dz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:22:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id ci15so8160176ejc.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9qWXOgCOHO+YbEkj0N3B2e/3m+pUj43rh7cMwlh8sU=;
 b=ByFI3/wGDkiJvszg9fd+/Jdp/cuD4GT9wYgVwwTLjQuJrXrC3Y9TAqoY12AEYpk1/e
 TieFi0KOvMa13vy4KcIg5shcvsy4a7jVpF2OGG5HemlxBLiP17G17XN/LrBBUhFbFoNR
 OGzJK2nPiKMN5eff3hY9ZIlEU2Am4ByUGezrze2hkI0zOhcaXoO+yVZmNIW7goXQWsNM
 MNvXSZc1ziQp8eufTutSA10UglldTp3DEs2x15bvz7EmWyHGdCmpZGlxcKlGS0TYLH2h
 BI3tX8+eq/Fer1RthutrZ51WrMwtXEGQJK3stY5HbH5qMm04Ghp9BZipAIdk529OjFsb
 tIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9qWXOgCOHO+YbEkj0N3B2e/3m+pUj43rh7cMwlh8sU=;
 b=Ab/tdR//b91Vghf9B+2Ackt3bk1orW5eWoi8G5GUEDSKfCVy1QAq7cWf5xYIiBPdgF
 Bdh1LhPfS2MhI9bKYpV7ytVE1vCGtfx6PBIU7dLteDKYFFpYngf8zXm1zFXTMlOVSW2I
 NVzDOW3lLSqnpWoTpptuCaE0UE4NCVCPvKuDZFVa/EaPaTbuZWXATvhZwSm4iZVAtiFL
 EoPEbPdaIr+5hKTQBFGqcmI4KLr1IxcGKwrylQdtG7FcF3RXFbzEdIT7RRG8znfeHOFk
 RgKES6EG5oEzuID9LHJUipcADVr2BgbTo1JkEkeYHqn33X8OlKRVG9MMtXHK/kCBXo8d
 5lKw==
X-Gm-Message-State: AOAM532dKOHZw1vxkuWb5t2yNrcC5v3mCLGn6P7KBykAh1Ilht6Vlave
 FB8Nl7AVSQ4Di372KUS54d0QkJhBQq/KLzYoWISI8g==
X-Google-Smtp-Source: ABdhPJzAh+zESpRhuQsRBABg5R2Swavx6Yj89a6+a3/iWK2Zx9cs4upTPWZKknoNJ64uaMN0bRrBs+ALIKF9vJr4dzs=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr16276443ejb.482.1622712173024; 
 Thu, 03 Jun 2021 02:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602020720.47679-1-richard.henderson@linaro.org>
In-Reply-To: <20210602020720.47679-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 10:22:20 +0100
Message-ID: <CAFEAcA-rc7vFwwmvXVZtsZ9VQgxRFbr8vaf-YfUO6wmXv8-vNg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 2 Jun 2021 at 03:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
> be signed, so that the inputs are properly extended.
> Zero extend the result afterward, as needed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

