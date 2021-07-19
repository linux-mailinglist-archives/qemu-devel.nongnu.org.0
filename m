Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C923CD564
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:02:34 +0200 (CEST)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Sun-00082o-BC
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Spv-00042l-Pc
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:57:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sps-00071d-TT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:57:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id hr1so28559756ejc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HQknEjTIN1tSqJiCVeSfVqHdr7Ga/K4X1FOAufQKm0=;
 b=PD/My/wSYjUiBtw2f4y+ovfpqNiHHymU0Esi51lJy/BcFCpnOdOn1q/sq6gcS0jGaq
 M16+nlWxjiDscRud6rSzJSRG3GsDsmjuwpvheXafTNP0G1sRM+5+W/DZcnpNURWaGQlS
 cePVTmMzJn1gG3FUcweqZrhhmHU5+WeOwQHfhRSc6xdYcgGF7Pvxcu4j54UBnjZC9PId
 gYDYsoPWel1xgQdlFbaGY55TTZXctcVwYyszV4DGpA4cP0LdANYkPAmGbijBwumEYdOU
 nAiBfbalYjwoJZ1Z4udxAYO1AfYL28uFROKE1tn2wVIsA8Ys8tnbLWhoPJ3MFZ3t6w/u
 kFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HQknEjTIN1tSqJiCVeSfVqHdr7Ga/K4X1FOAufQKm0=;
 b=n7pOOGtHPhHegeii3ybhCi9Ul2H6K3OJOR/3vs5v+K7EUxVSvNES+eMdB7YChEqvPB
 SGS+msZxE4pG56Kg/nf8zfPfc0uYaw7V0be3JIfv1ZFxlTxAqNcOdTrZC8t+2N43akE9
 zwYIbdA74lkKHzgHS1/4+jNFXqyboPPmvL2yAv5QXDkGMoGVFFbgjIXx8d7heULX7/wA
 qrEmsg/Q8nkdn1Azs7yrsOxg5wKSIVHhKtHh4mDLQCFAoxgHNEzJH/oFy/FInFnHMZu7
 ai9j9+8nYOezShmYAHPRrFXGqaEjiP2Hq73Hap4Io729KDyM9Wsgnm21ErQ2g8uiHm6C
 It2g==
X-Gm-Message-State: AOAM532n89YPaH3oPQn9QQTs7jEmmQnZOau5k57LeTrA9Mvy8Xd7DJOj
 9RjUyhX+LvuS32rB/S6WOn4ePW9vWx6WZYs1Z5gxFg==
X-Google-Smtp-Source: ABdhPJwYEbDB363OA0aBkSmprJIIBGSwrAQdbQWHJD+N0ohJvnQym0gOEdDe1Dmr/nRMBS4hihePDfnnkcZvoe1F1CY=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr20488836eja.85.1626699447508; 
 Mon, 19 Jul 2021 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-4-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-4-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:56:46 +0100
Message-ID: <CAFEAcA_GX7u4TxS8ha8s0utO=b4c5FcUvucJkChH8oZnhJ3Bxg@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/arm-cpu-features: Add A64FX processor related
 tests
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  tests/qtest/arm-cpu-features.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85..979c6f8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -472,6 +472,9 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "max", "sve128");
>          assert_has_feature_enabled(qts, "cortex-a57", "pmu");
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "pmu");
> +        assert_has_feature_enabled(qts, "a64fx", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "sve");
>
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
> --
> 1.8.3.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

