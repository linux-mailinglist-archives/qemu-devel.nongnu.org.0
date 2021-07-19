Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE23CD524
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:53:07 +0200 (CEST)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Slf-0007lJ-1p
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SkM-0006IC-Cr
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:51:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SkI-0002sv-J6
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:51:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dj21so23886497edb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJzQp4T6VNZjp7OmGTaglG3Oa2ZKq03BUH4VsfaK33A=;
 b=FOhK0ICEOJd4x2mgTSGxXQ/uLTciaPCksnplAc1/MoUdlzQXi5YFVxBtehb5ocTIyV
 8z+Z+9x8axFXRlNNg56976I5wgE/5krQWiZoHwvK5wgholHvjLBiI4chbfEyjUDpkIuC
 ir9BUirZfMEweX+KNqag+CDc6VC2P4GRvNX88GDbqhN5iwR9NxuZPTGILPgi2hc2gCb0
 vBp+3wpWSVOBzBpggrWEdIn6mIFTCDpr95UKK3ToCqBGj2EFa7UgswTCCojxn07ef7Uh
 3yh9ZNEUy6alxAcuwm+fq6hlc4JegbnsxXlWBnA3GNGXuNn5pJzMPtqElY2NNb1WlutB
 Z9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJzQp4T6VNZjp7OmGTaglG3Oa2ZKq03BUH4VsfaK33A=;
 b=E5vflYzrjIkqJFi3SQCoomTXkQlYDhhF4PKFFLDkILY7ClrgCTY6YpeJQmSjNadv50
 vR7u02nmQnEydAmilli3v6kfYrnmaUvtxItXq9jl51lbpuvYgUBSrCO7JbSvQmkjUuGP
 616eL/zSBR+zVXdttC/Fmaaj2bj0bS6rylpmrqubZ6qsiEZArOt+dk3rW8AaUUYEBogr
 PMI9Gp+1tSaoKyVvwrfkAnKKQohFxGIoYkO+2BgyK9uvCGossRjoOcb23K58r0vu5BrW
 P1tmIfrJPMWVmODpLg89igMDMr8nUJIbonYWqzNNHkpVfeZnAdI2fLNYKc/zlX6yF//8
 w6Tw==
X-Gm-Message-State: AOAM533Gp5ImWWhTgUS0OSD4AR20WfUMf0yiT59cPqSL+ABT9pAGNN/B
 nrT8B0wI/q1V5RU2gtY7CMHAxMibQZ/UjRI78iCCHw==
X-Google-Smtp-Source: ABdhPJyzZ4Qw+hnGb9BHn6ogi5XWpvATxDSs6/3Enbnh7mzOkTNla365JwWOjVs1wmui/YPCMc4/RR38k2MnYEwdh8Q=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr33713046edy.44.1626699101120; 
 Mon, 19 Jul 2021 05:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-2-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-2-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:51:00 +0100
Message-ID: <CAFEAcA8MbO1qSaF__ytMVho7wu70K8jM=0V03zkOcdH46Hy_dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] target-arm: Introduce ARM_FEATURE_A64FX
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This function is used to distinguish HPC extensions in the Fujitsu A64FX processor.
>
> HPC (High Performance Computing) extensions are A64FX processor-specific features
> that are implemented to improve application performance for HPC.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index be9a4dc..e5c8645 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2140,6 +2140,7 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions support */
>  };

Hi; as far as I can see there's nothing in your patchset that ever
tests this feature bit and behaves differently as a result. We
shouldn't add the feature flag until we have something we want to
control with it.

thanks
-- PMM

