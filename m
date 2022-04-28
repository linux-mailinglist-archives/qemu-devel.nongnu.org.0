Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C451322F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:13:10 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk258-0007yY-2E
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Og-0000qm-UR
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:29:26 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Of-0007Pv-Co
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:29:18 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7d19cac0bso47358327b3.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NrKcsVwvSwyJQuWcXWiIrIqPMgFQ0K4+XyZgsG01Bo=;
 b=BUhq8iNUM8knzuZMZLIh9X7AcEePMpp8dXs3yevMKcxBi47Jx5FNB71Pf4PRL/ye8o
 ogKr+uhAN933N+cI4UXHA+oDW5RhB2Qqe1jbM7yG8rWlycSy5uBtAa/WcJohDCoSRltl
 YM/Tmvg7KGYroDqkmnmoVrW7eOoUPwoxYZ09DGnWsbnejGIsiDuREtI51q2gU+RVdpuB
 tN6/ecZOpTNfvrJncYI06tuXHfQUg++/8MjWuvd+DflKWhZaOQvxDwJiQNcC8yU2lf0a
 mJbJdyrhDk6ebT+W4xDL1Ax3gj5ayejUVClvpoEUcc1WJ3mfapFAf7QvwnLILjyheT2G
 u71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NrKcsVwvSwyJQuWcXWiIrIqPMgFQ0K4+XyZgsG01Bo=;
 b=BDFPtpa+0oT44EOfCo8iotKaxbw+NMMQ27hYdvZON9fEjRpvWj6iklijvNmyCKx7eu
 rXnkDa9fPPY8E37kX6JEJS9OK0KirjX/Q02ol8DoHf6AViW31L8/gMRM5PJV9xOeAFR/
 gzOFrPvuhxhm/l1LU921RYJ6Ap/kkNNfbuB/3uNrMjXTm/0AvAJkwNT8rfw0Crr3rwDF
 7xDz/biqD69NsB7WAmDEuroXD23N732Dw++NjrYUtyGLV0OQR79Hhc3yu+4OnRN0BtRF
 q46bqxDj7O37y304U711hnGdN6wM14NEuT/WDiQicmHQeRNRbOH2Msny4lzZYkto1jsk
 45tw==
X-Gm-Message-State: AOAM532ZHMzULR92+y69dqBqFRKdDelvfuzE2wFXC7wjw1uO/R83ugOU
 u5OqjTxt4UXqXkPnFxT6J9UKa/6EuFmYVYU5IJe3mQ==
X-Google-Smtp-Source: ABdhPJw7wvObFl+7C/AyHRYGWA40yN4O0C07aQr4hbhSJJ2JVkYz8UWDc8VG/8vLT8iNru1CJlvMLD1V/j0vtGAYoKA=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr32056261ywt.10.1651141751455; Thu, 28
 Apr 2022 03:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-28-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:29:00 +0100
Message-ID: <CAFEAcA_teoV5C1CjHCtpw4DztfimXchkyGh60qE1xoAJYApZGg@mail.gmail.com>
Subject: Re: [PATCH 27/47] target/arm: Use tcg_constant for gen_srs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 26 Apr 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

