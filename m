Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B23C1A6C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:13:24 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aOh-0003wc-MS
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1aHP-0000kN-7W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:05:51 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1aHG-000574-E4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:05:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gn32so11845397ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2G9nBmIYLHh+9p2e6miwlMUurOY+mO96KAtmbCn2hf4=;
 b=rO08ItYPEm7jlI6mzav3ymDMMq/5Fzp8+i2NA5Fw6XCLIYOF3H2ex3lu9UALrlMs3r
 FqIUjxL+yvYw6rFn8aga4wnFKMDVBY1dntkMQQxK4QTW/i1Q4LdxmRGCKUx58jsHmzMs
 6CZOPrC+dySRDbZARweTkg4mNA7sDnDn75F+JuK+JgMo7NfybdcPHuQd/2pkPsYN2TwY
 dbLBfCGiZPyKRdYyEqCMCWWRStHKlLPBIXhKOYsBpsoCLxGfEgfWkOE4Jn6QDGPQ3RXF
 xlhsAZoqgTT5+JFemsEybzcw2sc76mDKAtmLf5m//JrX2Y/Nwb2PQXe60F1mYgIrSCMx
 G84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2G9nBmIYLHh+9p2e6miwlMUurOY+mO96KAtmbCn2hf4=;
 b=aL6I0G323r65daMJuA5qgAzHcurIsb6qj2MZIWlrabtt6+WASw7Q2WpAGd7Z6uIwzk
 my2HMdTT3vCwk/77LiZtivpQ44VZx5Rp99cksBNVGTxu7PRb2B9773k8jT/yK7AEOB99
 ZWC2FfegFmG6+cS9VkJjbzkyf6H6r2qM2YjumJxP52ThVlYI50f1iF12mLcltbshNFUF
 ebGNUsAyZRki3BJPXJG5Ht7YB6zBiN5/cM+0SrcRj3uSNggn+t7EGPTqUPynXfmQSizd
 QWduBuXJfPyoj2f6BxlRmV1SK1KYcKtNd8VKFQeQ6k51rVW8oAVsCSU2Lcme3dcUIsl5
 1qaQ==
X-Gm-Message-State: AOAM532QIKfOpCOteOCdB5TwCmFKAzUf1uUKcDE+H7w1bLMspasoPE/N
 mHFc69h9EOXW/Cr0fWBVHdswEsCEEl2YujjLMeM5Lw==
X-Google-Smtp-Source: ABdhPJzBc3TyiUZpyJ7rk4UykZDAan5hJrDCPiuK8x1DereM/r9626UDyw69aZC3WAjhhHfKQZ0Vd0/15JESdiu0J5g=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr11691506ejb.482.1625774740883; 
 Thu, 08 Jul 2021 13:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
 <20210604104204.z3hhm2cxesnm2jx2@leviathan>
 <16db7ae4bb0b38100a08f0539ae2865c15264f1e.camel@linaro.org>
 <20210708194053.ar4yspiodigxwbwc@leviathan>
In-Reply-To: <20210708194053.ar4yspiodigxwbwc@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 21:05:02 +0100
Message-ID: <CAFEAcA-9XnY=4qsD9RGVy1sTW-d=B6MGPLd-Qqs7HWMRC-dfeQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 20:40, Leif Lindholm <leif@nuviainc.com> wrote:
> I think my summary-summary would be:
> - I think we will need to introduce a compatiblity-breaking change to
>   sbsa-ref.
> - I think we will need to have support for more than one ITS if we're
>   going to be able to use QEMU to prototype real systems.
> - I think we should then start versioning sbsa-ref (like many other
>   platforms already are). And there are other reasons why I would want
>   to do this.
> - But I think it would be unfair to hold this set back for it.

FWIW, I do not currently expect this series to make 6.1, so we
have some time to get things right.

thanks
-- PMM

