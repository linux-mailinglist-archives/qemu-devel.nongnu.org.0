Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D672E51315E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:36:39 +0200 (CEST)
Received: from localhost ([::1]:42578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1Vm-0004IS-Ur
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk15W-000083-Bz
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:09:30 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:42845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk15U-0003Dk-Lw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:09:30 -0400
Received: by mail-yb1-xb30.google.com with SMTP id w17so8078157ybh.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIyT9I6/UG9DGawt0sTjfYUDCqgcvUdTjw8vzKZcamg=;
 b=btvfjEyPe2Q7Mg8DZyaaQ/9qi/+xo1q9ZpgBI+6Y3j++nZUtxgiQ/P2OoKCn8isTds
 FFIEwsR0VeQFR4rA+nnJYMn+LZqhh2RnZwcyMZi7f2htoeCgvTMSml7/zW2f6YGBp7qz
 q8m8Z/W3VPHm1vVNesIh8rlkzxjaOpaerw11qevROdUba/7KN2DrPonVsUqVgngBe7K6
 pQOX4BY6cf0li/0iOnjZNwvJ1PQYrNu2mNcM7Q1QhOzO9c/7EqsrI9+1x0XnmRjabtUw
 VcCXt8CBnSWRIbD/qp0gTG8E6cbi5/j18SisqiL+Ja9t+AGDgRHJHg6bw4lTDLOmt+X5
 6PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIyT9I6/UG9DGawt0sTjfYUDCqgcvUdTjw8vzKZcamg=;
 b=EKcBdtdnfpJMiUVMO1txA2QGa3FP74nyuz7B24grnkb3gtI4Ex0fAr1HzJoXGsaJ2A
 nD36WzEBZaWuxkrV9ZrwJfrWkBnrhl/xo2sEX4ilSF314IWJakvVHgE4NyXPteW61MHK
 INXbcovmoMo4+cDMaNr+t3YDP34eJ7f5xfe8A41BVuU2NrXMgCu3Gm6k5toZh6pxyWId
 xqZiApvwCQwcqOSFnMSvu9rlaMnbFqv7g5fQAHbIaqK0hZwk6zU8BbnB6cMGZoZRC50t
 nZdSo377PvqW7zqVOF/2AbEtUNDmG8JKbTzoBRKicSoVv/BnKb/OivS8oTpY1ny/+fwY
 e1lg==
X-Gm-Message-State: AOAM530VW7r/Vavo7ya+RRBP7asRMFbyOQPhXBCoY7HPmmczXkOactrE
 DrblWPyG617pwzMX7IzNcpUmjcgX6clAuWz8h7ku7A==
X-Google-Smtp-Source: ABdhPJySBDIbH55+M7R+c2wG3hnXSDZerFmWTDXWePYHkz+eLZXp4iEjQffEG55agUI9u2GdY8TvCCkTSuEnSN0ZTVQ=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29582769ybs.39.1651140567582; Thu, 28
 Apr 2022 03:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-19-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:09:16 +0100
Message-ID: <CAFEAcA8PZf14cr74iT-8AXb37xhNUGeu+dqLEvCEEHfiKDAT6g@mail.gmail.com>
Subject: Re: [PATCH 18/47] target/arm: Use tcg_constant in simd shift expanders
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Tue, 26 Apr 2022 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

