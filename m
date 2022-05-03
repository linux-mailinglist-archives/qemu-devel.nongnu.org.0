Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CD51893E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:02:41 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluz2-0004zN-2i
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluv7-0002uH-1J
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:58:37 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluv0-0001iC-PH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:58:33 -0400
Received: by mail-yb1-xb33.google.com with SMTP id y76so31870056ybe.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KcfiQdYL4XxzfN7gtYC228PiU1901pDjfPtSapNq1Wk=;
 b=J3JGK/8QXGlQnPefIWSD3GRiSiu60cf5pWy99AswnNkKeB3RM+Kho2+6O4LOAYgxCj
 oBWCOmIEEjxXTrikpmx7qSGflR6tn2AN4pegJZAgIlcmZjlPBTXul2a1Axc9y2AYHSS/
 oOmfdMmitlaeW0DIXYBZXILve/A0YB7S3ZhOBb/sNk4JdLOr+CcVVZnJZSydrMoZZ139
 Ujt7Fy/3J0Bt/PoPS+4fPk4eGo3j+bXdRf8+qwE6loW7df1VnA9/Dyc2voOcBf+aM6KT
 0Ivhg5BOG2ls4TTJvGRLoBHVTsAZSTpxWtcxrK3FSbXxJuKRJnM0UvA4Q/utrgoeRKeP
 2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KcfiQdYL4XxzfN7gtYC228PiU1901pDjfPtSapNq1Wk=;
 b=FjqIMdiL4gGbHc71UaQHpTtpBz7wdlD52DQDSUIPmXLTUyUZS3aPGUzqj09l3nvZKA
 h3GqjhpuVDEG+zP0jkr24nsMUJ4cthHPyHiu4R2QeCr2oOOi4Dct4Nle7qhqadzp1Gls
 7Qcz0IEDl9U1U/XcoPUZ3z9OQQFYwO462x+93D2pLSJAcNIA5Hmmy84UzeJYSpXNL7Qg
 rUSYCB3iWbPa/5ePnhKQmS2Q0+3Poj9frGPyGxhzcuqcB3WsBwpkJ1bywCZaN1T/rwHj
 cs6IQz6ptKp5GPlvOVrRMyh9TVMJyZ4qdVy5zB5kIipJgK/WWRwO8LDwiK5t/AHhm1HP
 jYOQ==
X-Gm-Message-State: AOAM532KmV37w3ifoHfwq5+n9kx3FzNOcawdprZnPS8MiglT3yh+wlSD
 PCMDefzLktGED9800IMJ9MJF12V7W4KwvnHHUrq9KA==
X-Google-Smtp-Source: ABdhPJyo93j+6OhVQkjxNTNxoFWdeSltymJ6Vs9cEs0lcNefFYm3WDuW/zNx3tFl3HBUup75doPi78Rd452xost38vI=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr14703481ybu.39.1651593507974; Tue, 03
 May 2022 08:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-6-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:58:16 +0100
Message-ID: <CAFEAcA-WbCdH2xB6rLfWZ5LA_YpkwRur0rwZASQq1pRQBWOtOQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/45] target/arm: Reorg ARMCPRegInfo type field bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Sun, 1 May 2022 at 07:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of defining ARM_CP_FLAG_MASK to remove flags,
> define ARM_CP_SPECIAL_MASK to isolate special cases.
> Sort the specials to the low bits. Use an enum.
>
> Split the large comment block so as to document each
> value separately.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

