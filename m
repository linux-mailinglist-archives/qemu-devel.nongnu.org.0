Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9BD50A8CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:10:34 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcCH-0004lQ-KL
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc2Y-0004VG-7O
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:00:31 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc2W-0000iy-K7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:00:29 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r189so10413075ybr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8eX23W7pldfOLI7pFtXnJ1vmkiRbMtXhILLO6hMUp0=;
 b=DNVXuwgKZJz6Ah5Lik+cKixyludCKSm5QoZjsfibKn1P7wELTMU6tc0tP9THq8Acg6
 tGLXUPSNIBYeKFYw3cKC/eN1ZW3lWkEJW0zSt/VlGGxK+Cvu5xbdGrxuUymz9/4EHEnF
 0mLA6IHQlZb414WZaR9WnQPxGEVhKA4lCQ8uyEfg8h0Jldz4mi6TGrZ1OonhvEx/GMzM
 8chCD/qSjwOXz8esYvXoe70ma1hHzz54IBXDgfNT6nTuUCn/DrVZrMtOFp8Jd1QhO2Kp
 M7HYu68Oj8FOWuY9OeJ7sU7vdaRPVvHNfXvZ1Ikb9G73lyKwQOF1rwDMb9phchjv1Rz/
 1S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8eX23W7pldfOLI7pFtXnJ1vmkiRbMtXhILLO6hMUp0=;
 b=SkGUyimoBP6KAd59EIczAZuJt1RVzijZV9ylhlMICr06aGmlQ+ghaFYL6HK403lUEH
 uSMdRP7BPQkcEQX8LQvBeTLuMEH3tj7o8vOX06eGxhx/luI1dOFgGkkgcQNQQQuqHHpu
 1CQKrUd6kGIb+qMu4H6ZUTQjL7rw5mLUVIna3apMPCExDwzE9HMnL9/k9YGMi2az23Xx
 Bk+6gEZ/RSMVTdLB/jUseQCOunH3uQoCOA9RmZCO+UIJWqH9SSJDi/cI9pN69GjfVZKP
 h3ONeW99+OQRLgjWE0bK1bKEp5FiTIfDZQ7M7c8RttDW191z42+ROSuy5poVZ+ljdtd0
 EMRw==
X-Gm-Message-State: AOAM530bVLqc4uFHW14HolNUmBRVuMJv9RQhgEcXv12YLiJD1U1tC5Va
 ueZ7Pou007KHAMht2yijgZEZg30Wttk+dezbeq23nw==
X-Google-Smtp-Source: ABdhPJzpuVlpI40hn9vZXeWlTjQY4BWEp/VhsLqRpNg0s5i+FLjGP+rRWhsOQVqsc199Eu4QjcvdG5cL2A8v+ds/rIc=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1157665ybq.67.1650567627574; Thu, 21 Apr
 2022 12:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-17-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:00:16 +0100
Message-ID: <CAFEAcA9TcLZ9t=gGRoghgXT-8uTnk6pUP-trDHm3Qx2OB2M3rQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/60] target/arm: Simplify aa32 DISAS_WFI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Sun, 17 Apr 2022 at 19:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The length of the previous insn may be computed from
> the difference of start and end addresses.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

