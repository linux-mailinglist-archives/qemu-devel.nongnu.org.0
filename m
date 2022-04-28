Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3C512F85
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:39:28 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0cR-0002SQ-KO
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ab-000050-Px
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:37:34 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aW-0006Zi-Od
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:37:33 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f83983782fso46306287b3.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moyXODMe1Ia2De6nxT3cgL1euDBOHHq4varns68EEaQ=;
 b=hOdW3olRRYGWb5N8JVBn2DTQyxv0J6vvKzhs6sYH9br7ID/H0O3cpz4WcVTv2SEJ2+
 bkUWfy28iGl3+eLxIcN4GOSnezPCg/yzMH7slpTYizWaFEGYTcTjkm1qXxmnu9NUFMD5
 o4H8eJaGVPVSyF2nBlv4kPMwzRiNJ47kzPw5FccbtqLpa/lNt6besqWa4cf4FpxDUMtk
 ejKviG+/988Z6Ekk2bdWRXqx0vY8Y5C9IC0wrS3tZIAnHWunMuQ9K+NM+OVHUt6lBP9c
 CW2iFS503Pe7GJM3dWymtILK/rJdzENYA/umWiYBdT60RX7YpJuayPdyp0/oOi8ttyPe
 C2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moyXODMe1Ia2De6nxT3cgL1euDBOHHq4varns68EEaQ=;
 b=LEN2eVRJVcc74UbRpv3mtFphBdIuNwLB65P224nC/SXlIxJX4bOQSSs59QpG2q7uWX
 1zIdC1NLhtZlWzfmBSlATFdizm1ULcD1EoJmL/ripmDJgJgN7QGszuJiuDGupd/zJgHM
 hiPCY3r/h/ae9cpw9jySD/VuxMQGFz2SXPqa/tKnbPXwSMF+moTMtbdv9Mz/HKmLBDKQ
 6qh338MtQ4M0NNmnGf22oVO1CmlK2HO+7D0+9iTKhuBpsC7/exDazgm0DSI6rnKCZ3tF
 nEMGZfkF7m3adTwUnyughDB0ConHV0HwCvPQ24vTy3Eo5u90gmTuqYw5n2qoA/lUtzSW
 jaHQ==
X-Gm-Message-State: AOAM533yO09Vd4vuA9eJYWIIrvz08oUp6JoKjrLeRW0xYC1VD0R73GQf
 chS8xGdY8op/OrgxVmFv+i38Bmgnux8jECrmkWyethSMP2s=
X-Google-Smtp-Source: ABdhPJzYI87IYTHtdyCX64tef9m0LInEc94njadCGnbmOLcgbNpO7n09SJmKKk4eF3UF04qsxSL79tcA/SR6xNysohw=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22902387ywb.469.1651138647826; Thu, 28
 Apr 2022 02:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-4-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:37:16 +0100
Message-ID: <CAFEAcA9QGbUWK4jCiB_rROQ5kJ-Sx20gC1dnwEwEy82KcgFmyA@mail.gmail.com>
Subject: Re: [PATCH 03/47] target/arm: Use tcg_constant in gen_exception*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

