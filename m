Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BE513051
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:50:13 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0mo-0005Iv-Pz
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0iG-0001Fj-Ge
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:45:28 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0iE-00080N-VM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:45:28 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ec42eae76bso46370577b3.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HCUZlCVrTl9IEmprNmJLZi1E+8Ufq3r3v1ma4AgZIpI=;
 b=whsqJ1r6e3oACo0ByGjmGoNTToW/8bm2i/bYJ47VCJT2yjFIw0YblOBmDnvWWNqIiq
 +xKdLLO7IDEaRm/eLTy+SyOQrQ8+HcA0Ky7Y+gPGfFY2IJNXjTAG0bhBnhg+SONGsLnd
 XeOnLJOcsJuTNY0BIDCeAQbg6L5Cgpqa59jpr2zzNJ0kPIbNPAmBG6Lnn3y86VgbAfVr
 L+t2dgVkFJaA/wIE3Z+ziTmVY+9q8QH4JhDg1oXPNCumTgWHMNgk/A2sNOXuk2bYVdcT
 hFGfPIsSEGHP/O74inzNFibOSQoXbY+BEWMgaDgHfMIjSIRZxAH3L12CTv7o9DgpAFKC
 UpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HCUZlCVrTl9IEmprNmJLZi1E+8Ufq3r3v1ma4AgZIpI=;
 b=2opsooZtS9yPCcLI3Y4nXvveoeNGxsYdkD4M/y9HK3UaupPo2CSOHNWNNIsioFPh5X
 OnUNKR8zqRJXSi0szYtgBgrDdBF0rU1he5S0ccd3iOazPpQP6Qgir293qYwEAgYHn58j
 OE08chUYt6FVWs66egvl3E8W3RU+TkAns4uHu9d2ckGQ2BXA/UziWJe+4XDQfcwD1dQI
 EUYmCRS2qw/R9HOg6tsjjRg7fP+vLj3W1h0u60kJBK59gKCF6zTsUGh1DXIza3UXeq2v
 4ljX6PN7Hjt6MSirI5j+t6BWBmWGLsn17v+hwWebjtmOTgzt8jRCXOQCEy0zdl++CAuj
 8NsQ==
X-Gm-Message-State: AOAM53114vjJ8Ax6D6TEGxWSBODf5XTiaQlNGXo0ThntiJVh4mcOMMX1
 rAQj9ZS+6yKdYUGPDu1DBsFwhZDRkIN9jm3whe2Qqw==
X-Google-Smtp-Source: ABdhPJxc5i6MQUjIx0Rrzv+oe/lWbDz9GJW7inF+dzsM+5J0q376RxetDNmF8fDPO3JWmPG7/pi3pglNX5gyXxjp49g=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32353253ywb.257.1651139125819; Thu, 28
 Apr 2022 02:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-10-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:45:14 +0100
Message-ID: <CAFEAcA_RajBcS12aSdHxtqhqnfz+CAX37m=HjAPNKNVwFNChJw@mail.gmail.com>
Subject: Re: [PATCH 09/47] target/arm: Use tcg_constant in disas_ld_lit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 26 Apr 2022 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

