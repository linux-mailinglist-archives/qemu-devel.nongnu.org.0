Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98E3B6507
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:18:31 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt1q-000615-Ro
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsz8-0001J7-8S
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:15:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsz6-0000yz-A9
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:15:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h17so26406679edw.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C+DG1AME7dJRiBWNuW3rosBrnun5A45ZB91QkekBhLA=;
 b=XiqdnjcKOh6KIBD0KyTV06+TsdmGYh8xegJ/WZc3HHLR4UM3OWIFpxz0+NCLLPSiUh
 E5OsdEIBIDICb4NDzfzQHt9QB/eB1Rr+wXEBwoBpYevrmqIPN2uOVo0EkJZUM/8fxUbP
 Rcrv6fGCFFrpHEwEsKEGEpLD0lUb/51Ef3c/DICVHuHgAYOFM8CLZ2EqEjC+dIGrYANK
 UekBLG/DTY2ppBPhrBY22nfbn19uSfrgyDwU1+HZCOL+r4gyKb7guF0hNxorfg2xilMZ
 bVV48Y3/i8wScjF9FAdu9au2TZFDM2rhyoXDTjdyO3Ehh40yYhBQiAiNJGoDnJ2Vaqmu
 6MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+DG1AME7dJRiBWNuW3rosBrnun5A45ZB91QkekBhLA=;
 b=FtPdXirYn/oG6LHDvHIhPn/UuQCRHzGNaPLrVbWypnlPjG0yfRYuvpD4qYj2dVMSXn
 YL6LFPxlbw1RDno8SLWljFA/ZfSY9tFe8ShUrNKbseAzMvqNWP1n4E5L2EJ2i9irromB
 u0gLQ1lFztYx3gnLyJsPEVasWGq9E/tBt+sVX5McLZ2ybXeHR2qn3+EML5bgVYIAEffp
 eIz4+QKT3dWAOZk8FFt9JvZ1udU47d7Gnp+DbEDA1XX8+F3iSEYz7qrdajp7q+O7mcLs
 7AwQ4Xinvn8g6c6tZEyL49nwnT7xgwzrdqDKhQ9msyf9EKEr9xBmOdoiJXr2X5hcNcV6
 9lqA==
X-Gm-Message-State: AOAM533unIiTp2bXTr6MV6+cZNJdZh8isRSi/ZD8DUd70Y1EsdBRfKYM
 uno5/F6fbqza4S1HdYq/FYPj5v+gz0UeDdOF+H1sg4jAvz1dNw==
X-Google-Smtp-Source: ABdhPJzGR8gnkraN7AQdBYop6jdd/1Pn8QwJjBrp3ZUFYiSQYFPk1zmKta0I8l7sD6KYz4qY4X0yEkHJEmDDoQxJkFc=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr33511209edz.44.1624893338228; 
 Mon, 28 Jun 2021 08:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-3-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:15:01 +0100
Message-ID: <CAFEAcA_7nsn4G2n42OZfzqWMMB5SdOSaPJ09dks_DMg58hySrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] target/nios2: Use global cpu_env
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We do not need to copy this into DisasContext.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

just replied to the v1 version of this mail by mistake, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

