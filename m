Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD0578123
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:44:01 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPAO-0003IX-AF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP5Y-0005ql-85
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:39:00 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP5W-0003OQ-PH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:38:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c86fe1dddso103763047b3.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RB0D8Gy1sjal1YEu+U9y7W1b0qKui6+rYeQwb/RYkI=;
 b=Mcn3S9XbZAz3v8Dp5WKd2ro4ruQsE8mruihtSjZeNXsPBfF7F9xODKf7j8XmPQTLYt
 j9HY37vtv57y9m+L9ICQ/5LnhvA6Mjwk7/bHXd8n9cBxi6T/eVNgVf95nl4xqt+B4v1J
 EWetX39XtL5ijZ5Tma7Zru3BgfiOlFzFwX5NTqEKeTTnVT0K0hXVOZZpfJajYmwn0+Q+
 kCJJRBcBl6gguFt9mbiWBzoliYFddv/kH3oUpM49FLAHxS81mYtjB03aUDroIroasK8A
 p/RmKLVurr8kdDODR5JH05+2E8RAlrGFcKsEGAzMDsXqyAuMZsOVBVcY9MYXijSymad1
 6zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RB0D8Gy1sjal1YEu+U9y7W1b0qKui6+rYeQwb/RYkI=;
 b=b7zJVslkxTqrO4Pa0RdlM9qiJixgrOm/U1jTYwf/c6Gqe7XxthzPvukuZL2Jf0DN72
 RbVEw0fBqQsC574dsChOlNjIIziQXwHeilZmxqgHsJsOm7CkI/xWR6NHkcQiIf95FeY7
 x7EcAAUEcHBznAgVHonKqrlYK2LmKI+eQCVChitD0Rl/BeQ3w6l2czgq6IEZzpO5nEua
 hPlYFQQjJZOKr574WO/NLGuoNC98qBz35CFyvSV4xK4aicWB36XmYUpI5pCKcBk5T09J
 9UYQAz7StaVqcrFvwMp01Hm9dvQPCU9uRgxACE0Xe4ezp1KvChLzX7qQKOh+vUyLr6Ix
 iQzg==
X-Gm-Message-State: AJIora889fD+HJ2ft/0QP/66XB3PF31k8Zf+wAsygISQwZwdY9H58DiA
 98Zp/MH/8fXMlFJpd4HARQu2ugle/L6Lzyy+vQFE7t85teg=
X-Google-Smtp-Source: AGRyM1sneBfrkd0YmuSzDTAx0N6wg9nThlBMnMbnRrZsqorbqn/A5Fqdp4RNKEE6JCM4dB1m6JjjIgdC3zEEomwFz2k=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr30101974ywe.455.1658144337905; Mon, 18
 Jul 2022 04:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-20-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:38:47 +0100
Message-ID: <CAFEAcA942DAgdTHd=aa=6EzprqH4tr6unpf_C2fuHe-rtcYCdA@mail.gmail.com>
Subject: Re: [RISU PATCH v4 19/29] aarch64: Assume system support for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Fri, 8 Jul 2022 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> SVE support is no longer new, assume it's present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

