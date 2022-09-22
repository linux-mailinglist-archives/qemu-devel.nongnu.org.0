Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9235E672B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:32:25 +0200 (CEST)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOBc-0005ot-5n
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMm2-0007td-2I
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:01:55 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMlz-00038n-5p
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:01:53 -0400
Received: by mail-ej1-x631.google.com with SMTP id z13so2092642ejp.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fsV7eS4USxpKc1nQ54y7IcHgkqrSV3V3QPYg29FrWp4=;
 b=AfiRIwP1LJykPq6SCBloKSGoS/gcMNRPP0XJdZXjjATXsunOMIye/gTQTrEC8STOd6
 l2OkG2tRQDkbztAU/UMazpcIcIjeGBK6/gPHOhooZOrOmA2UQfNPRcPQpJp6y29lnMlf
 u4P+6DSMOe8CgLUQ7L/Lm5Dgndxw2+N+/Q1DnIT+RhiTDmixToA2zU21tbFSDsgOHB6t
 GHiRf1RI0975UXug3F+JgbhP21BAyuEjQvNIvWMLYEOjDdoTYrg0YyohCsfn1kmgUlXC
 Np5iTCbf16c3t0a0yT01NZLtq5es2pIFHN65H3wxpG6vGEacoAs251htiFHUBQNQBgDM
 jEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fsV7eS4USxpKc1nQ54y7IcHgkqrSV3V3QPYg29FrWp4=;
 b=6MJUdHcEOgPg6wAxZ77YOA59j3fsCHSoS1yJiSNTCzBU2oNvEoo1iKcz/xKTFXl6+L
 F4c3tu2bUaHX6tzEw8M7RFE+x7f7k+CdpnVPuxorB0GCiq7SXcur+cul0AeSk/zjJwam
 xZmoTvA+ZM2Xke2Pw4hO4dOjpqFRCqJ7C8uGxwfk7jcnpfbHjUa6ssGewvJhUi2PtoUM
 59O+pM2h42yZwDbpZU1+Jte7Wi1NyuPoLOLVvx5yVuhAUyk+vgPb8P2J9fpabu6OTL9t
 KoQSlN+guQ95yXndWGs6EKOJICe0kF0UApmHW0UQlh8cMf5XlndQ8LdeTQrMt4rHoiph
 vfGQ==
X-Gm-Message-State: ACrzQf3zlaUxAJ33g6p10Cf0kHUSRjggkEjFZdm0CB/Pj6VnR29H5QK3
 7wTZowoc3062pXfsbiKZ7X6kluzmV0wjVMo0llSsLQ==
X-Google-Smtp-Source: AMsMyM6n8MfqRvyfucDz1aiV2Bt2nyvp3kU7S00g/K1ZRGGmCjUVOSabnw1UHR6iMpeAZ7jKPLMU/SFWEO7CChNZLMM=
X-Received: by 2002:a17:906:730f:b0:781:6a70:ea4 with SMTP id
 di15-20020a170906730f00b007816a700ea4mr3017559ejc.36.1663855308756; Thu, 22
 Sep 2022 07:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-3-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:01:37 +0100
Message-ID: <CAFEAcA9WHFT8imd7-3bZCkBuXtq_Kh0Tuqsri35yAHFF_kvQRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] target/arm: Change gen_goto_tb to work on
 displacements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 6 Sept 2022 at 11:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
>  target/arm/translate.c     | 10 ++++++----
>  2 files changed, 27 insertions(+), 23 deletions(-)
>

> @@ -14965,7 +14967,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          switch (dc->base.is_jmp) {
>          case DISAS_NEXT:
>          case DISAS_TOO_MANY:
> -            gen_goto_tb(dc, 1, dc->base.pc_next);
> +            gen_goto_tb(dc, 1, curr_insn_len(dc));

Why does this one need to be curr_insn_len() when all the others
in translate-a64.c used a hardcoded 4 ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

