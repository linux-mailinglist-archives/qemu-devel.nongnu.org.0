Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBB37A745
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:01:56 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgS1L-00080Y-2T
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRzQ-0006l0-Rk
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:59:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRzK-0000Hv-M5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:59:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c22so1498130ejd.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rR8Hl1WyGAI1IyS5+ncTXn0IsHjUc9V0xXJ3i+mxI0g=;
 b=lW1AvSU6aWqqbkG9++ORgVMQxKnvpnyxXKuNGdFpmCfrRtFGFn3tK9LaSBfPf300KP
 EhZV92rlIFxYNMbxabohkzwlUI1l8Wi2VXmbfmf8ezboz2E5d44fgI+zwyE9gGBF9Ucl
 fZGE/OMC1gYEheDZ7sN/T0FwgBIvGH8B+Hl76Hgw/mLmWYfVcviKVz0ctXrhMsn3Kjzq
 lo2WXGaXJcRR80Y/t72NkaZD25JMBq1y9v03skFMCGDUFaUrFNeR1E843Y4nQq5P8Y4B
 PxeoeFD3DLYqXtZSAHS3NcHYJQAX/FjHXNdwArcfbcYzABnXaTR3VDw5yys05639fs0P
 WOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rR8Hl1WyGAI1IyS5+ncTXn0IsHjUc9V0xXJ3i+mxI0g=;
 b=uh8Lzb1ECm7uKjka8af3Z7HERgNxfzNO+9z5XoyZdF+UdHIcU6q6OBrBjKAD9rwneB
 /IwCNh6kTk+966zTz78Me4qOyWv/Sd5Mk+avE4ZghMN2pq3XSdqFq1GPGzxjPnuZTfZW
 xeGzk5+7KDya9hVZ2uim12qncky7q5oSbJsIigguumPZ3WhxVxom0t3ku78zZk42Iz+x
 LHKI/S1hJWSfzw27Hfr+66izoRo4pF2sXKj81r/R1kwI9qEhDlejN46zMj57mUQmr6PA
 7ZD/PLFz0wB3jgf/sR17zGj1hFFc8Vusq2KhakH4NPXBC9wSnCEikxUCwTycB8cHF1zV
 1miA==
X-Gm-Message-State: AOAM531dydh8p4r0kWIcu4FXu0wB5Rr56d7CklcpuxW4EJRjJnhcFBYw
 FxudcFwYvoOVNlwWIxL6DKDt6AIGXWCup4sorYq+Kw==
X-Google-Smtp-Source: ABdhPJyTRqc46U5Vc2/83m84eNovSXFVZ3MuL2jFiUtySk4yDIH/MnyrfcZSMmLd++s3iWainNhW46MhA8+qX25eYq8=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr2119382ejb.482.1620737988822; 
 Tue, 11 May 2021 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-18-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:58:36 +0100
Message-ID: <CAFEAcA9g8y4QvObcNwaO7p0bmOtJw_BvDb5AHU2WUenZANfkKQ@mail.gmail.com>
Subject: Re: [PATCH v6 17/82] target/arm: Implement SVE2 bitwise permute
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Fri, 30 Apr 2021 at 21:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++
>  target/arm/helper-sve.h    | 15 ++++++++
>  target/arm/sve.decode      |  6 ++++
>  target/arm/sve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 36 +++++++++++++++++++
>  5 files changed, 135 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

