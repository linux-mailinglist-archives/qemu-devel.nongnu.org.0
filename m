Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2B525F8F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:10:18 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSFV-0003n3-L0
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSA7-0006gC-S2
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:04:44 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSA4-0007Vi-Vs
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:04:42 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2fb9a85a124so81668367b3.13
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=adsQYjL15jG8LTI6sT25k5BQKkKnNMGCoUQptk5wTX4=;
 b=qizE0vj/09jtOGF6aAOi5J1O3mqlC2Gl2m0IJpfSlz5DEzlFRbeyNEa40Si76I15eU
 bG0oayccbHwRlGQapagIgkBsMo/f+Hb6ssIrIE+8MELGuMqjecy9/ym5p8LHpATLTVXP
 RUzRooSr2Q0izPmIqV7J6f3+9XHS8PAIkbYuEyY4f+uPul5llDFM8TNm2nMRmQ/cqVAf
 ad3eDbdh7bKjxCiiOUb5zob5UqVwRlebMVRVwV0N+y/NZeIu0xJhB4Uck2lV1dhYUmNS
 HdpSAK+dmltvVlUK7Liej3kYcmygpvQ/OgipiXl+Nimc1i/CMpgSn2rTxaX/Yj4WT+oM
 qYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=adsQYjL15jG8LTI6sT25k5BQKkKnNMGCoUQptk5wTX4=;
 b=LEYiVdIe7vR6tPlnpv1SNbbtAY3M5Z0+LjwKtXaf9VBqN0QnIO0CvfFpNJAhtuHypf
 9Cf1slgQJavM49W77PpPbYLLHtK1iiF3NrMGBXV+/s506140FxFHF6WPOU7aj/KP6mg3
 dhimKSqU5sttCToapEvDC+WXGUwjNaMVQ8m18oio7sSl0123HQMj43ypfRKvJNCLjr6h
 fBYs9bcxNXYnCvhyEAnsyfI4Z1PH2IMQxUfEDb9qk9XmqhiNEDvZ0HzfTN/mZF4WkSVu
 me5OwqVIxuJ3rasdHg6V863cBbUJb3WEH45F2ZYe495TkCo1PYkIbHIOQhUnYONPfu5b
 ZocA==
X-Gm-Message-State: AOAM5315xUALU6Wit/4T8erGZKfdnqxuTig0R1qQySFBMswumBFNgECp
 uBuNgjVhj/E37KxV0w1FHHI7t9FiIVjHDFZPHyo/Ag==
X-Google-Smtp-Source: ABdhPJyCBLrWCEgEEZ9S6aNw3UKxvJVA0+CNTxQoRQ7sZg70G7eMt9O/RSYYammaZEe+w22B30m5koPrJFCA/7IDlf0=
X-Received: by 2002:a81:3685:0:b0:2fb:947b:5247 with SMTP id
 d127-20020a813685000000b002fb947b5247mr4643530ywa.64.1652436279925; Fri, 13
 May 2022 03:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220510000426.45797-1-richard.henderson@linaro.org>
 <20220510000426.45797-2-richard.henderson@linaro.org>
In-Reply-To: <20220510000426.45797-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 11:04:29 +0100
Message-ID: <CAFEAcA86Wcfwmg_kfYDERxa6eVWki0xkKMW7MRLd9UA662z78w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Enable FEAT_HCX for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 10 May 2022 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature adds a new register, HCRX_EL2, which controls
> many of the newer AArch64 features.  So far the register is
> effectively RES0, because none of the new features are done.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 20 ++++++++++++++++++
>  target/arm/cpu64.c  |  1 +
>  target/arm/helper.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

