Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F35867DF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:58:06 +0200 (CEST)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIT7d-0000KX-3L
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIT1y-0005b4-1o
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:52:16 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIT1w-0007MN-JW
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:52:13 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31f56c42ab5so104626207b3.10
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 03:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DXbU4DQTx25+WxEtHhbS2Yj7rATTbj7JGsPIG9uNmsk=;
 b=aKoj8JmpQJH31Bmj92Y53TCRqEM+nq4DNCKLyWmCnCxt1XtIBUX6t7x0oYq1GC4zgD
 Z0JA+UMJj1Mg6mnKmL1xg0UUN6rBWlf1ZGEvdbXWnljC6drmijDtM8M1+ZWrNKutGYxW
 FJ32tqcSzWYQikd4vZ4t0Z5sWUFoFISnVvq/UiWolzGeF8ot33D2XCG2b62Ke+PTflaq
 qrYXtfknDRpGlYgGuJYdgrSu1uvHTXCA7+C/SyZwSb81eTqYD4GJ+W7FyUjKDDQZQ6ZW
 9Nscaz59gXZgaprp61NIIgrw/71LNeeKSX3viLHQnPXaEsQYoGv3RP1fnys5iGRuUX05
 BuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DXbU4DQTx25+WxEtHhbS2Yj7rATTbj7JGsPIG9uNmsk=;
 b=AKwBLj1c0YeFFmkVqiheHtlQB/S6WPmLU+WJITSWt5FosEBAaEVa+7bWgiS5ff8nOE
 7GA4sCMVKpHMnPbnWCQ18mJ1xTIl2iEzQNwkKiATFW5LDJQAtyWFmRleeFHEoiPwhBYX
 bGydOPho6vtMeixA9+Ez90Xw+nGQWJSrAuMYVgOaaWoCu+81e56+nnIlVISSDp3pgC8z
 PeO13h2XL1SgZwYuVzSm4+SzisMUUUYuScAnx41GWHt7N7nnQbsPprWRwJK6AQ7Rlg65
 Q6oDBF2dbgv3vpVnuclSJ4YbLqc1AbwM7MwK5frBkYxZEeujTyclNm6Xx+ssAJitBA8q
 o9eA==
X-Gm-Message-State: ACgBeo0GOOm7959fez1KyYGLtC2Ul2vkJNvlzMcp/BOfOvfOxGq6Tta0
 +pSO5oTwiwv3V7xfcqM5DMTCeEgP6AwwZapH8yefVg==
X-Google-Smtp-Source: AA6agR58RytlemRt9RLACEI140qX7YVrBbiZp2Sx+DIeVuXRH0RD3RyHEw8ofBE7CA10pDM+vM7HT2jx+8D6SpBjF8A=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr12630137ywg.469.1659351130499; Mon, 01
 Aug 2022 03:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220726045828.53697-1-richard.henderson@linaro.org>
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 11:51:59 +0100
Message-ID: <CAFEAcA_JU2AOF1wkqOM9G0p58dUT+ErDeEvxsVseLiVzyy2C_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Fix kvm probe of ID_AA64ZFR0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yuzenghui@huawei.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jul 2022 at 06:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Our probing of this SVE register was done within an incorrect
> vCPU environment, so that the id register was always RAZ.
>
> Changes for v2:
>   * Include the commit text I forgot.
>   * Fix svm thinko.
>
>
> r~



Applied to target-arm.next, thanks.

-- PMM

