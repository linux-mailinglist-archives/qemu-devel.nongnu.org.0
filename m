Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD8053E46E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:38:30 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyC05-0006fD-Qu
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBsE-0000kC-FW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:30:22 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBsC-0001fB-Im
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:30:21 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-300628e76f3so140993107b3.12
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJ6djCGXG5SCbIMEi0VJ96TTYQqprpoIWm/UFJuYk8I=;
 b=MzMN3z7g1A//wz2AB+JpUsTRodyUJ16s4ove5wk0igGJ7DTEO/Mb1TIS2sRVJj4r9J
 nzEZGqpqoLIMNknjCt3vPzzr/8yyPHkIUgT+FodG2Mk52zH7QhmSsb3BYWHrvJLUBYVj
 cfaQSN0yjUxEpcECa1f/W76eRkoeafVDcXtKUgsW5Rmrmj0BN4Ubs/GHbOQ/K7RyTG4D
 d/q4aMyUlWbM2eawOat7vydYp6v//QoTq2Ats+ll06IA3f5N/4jPnrXN0bRN3rrn6Y3v
 vaUZty8bNhEsb5QVdZfQ0O8yODRkT3qLXf5PTM6BPMIIcEbe29ID8OtTn/BztNQAvC//
 CaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJ6djCGXG5SCbIMEi0VJ96TTYQqprpoIWm/UFJuYk8I=;
 b=4UgvypxTeRD+pBQZh+9VCB1+jNVpPZ8A7n57Ah6WpLGB6n1jBpla83Vuds9v/lu3oI
 6AeG6d2z8ZQefId35aPrC0ONTVKNnhrf7fijw0aleyrmNJaYyg6zKyH+jZ+Vb11Zpl6R
 9avzBUrEwI3sNT4Wdp1e+1mjOElcCtiJh4EyE0qoBFC9cLsY4PEvg7d57JKMVNRPcH2p
 Zu3W6Y8lf9uQZFWAKyLQ6DhhsmZBgB0494rnSEG24z6Bga3CX6F2Kzr+2hyQsJ25WaH1
 dxA7+YUFU+1hfVVruvczuLnwSRMa8j07wWeHpKuAPzVqx8qHzPfLgUVDweA6OG7gAwGa
 fIJA==
X-Gm-Message-State: AOAM533UFRBNvQ+ZFjCzDkNB423vmEasB1MfGuoA2LA187ClNUAgYBPy
 yoqcKg8PUL0/Ghf6lgqh/RXZH59vy87DjfPfudkp1w==
X-Google-Smtp-Source: ABdhPJzf6EYz+tBPBM5KzIvrSHMSWkmmMAYvckdyZF0E6M+j6zLd9+RIuyl8y2gI5mxBywuRTBXnAVifyK3Rdh09xL0=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr26400372ywf.347.1654518619569; Mon, 06
 Jun 2022 05:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-11-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:30:09 +0100
Message-ID: <CAFEAcA_3=u--WUo5imgHL4tq_bJnXtARuq0PYpUbY3oLaMvtUA@mail.gmail.com>
Subject: Re: [PATCH 10/71] target/arm: Merge aarch64_sve_zcr_get_valid_len
 into caller
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is used only once, and will need modification
> for Streaming SVE mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

