Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A32D7865
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:02:28 +0100 (CET)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjwB-0007np-CU
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjuU-0006pS-0q
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:00:46 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjuR-0005gB-Ub
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:00:41 -0500
Received: by mail-ej1-x644.google.com with SMTP id bo9so12716172ejb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbwFRFqVrh9sNg9S7ni5ChPWq6dvxRynRK/5BclhVLc=;
 b=Gvq6hJErrXUHKvBFZd+AhoMcvwkFIiPLmo4P+8IppYy227qCSOfHUkTPirEn+6ppZL
 3Skh4YHE28n/y/ac6HcJmgqz8UJV8NHZUXsqETvETYe05aVQUZpC1Gbd7ry6I1U7QRsT
 7yuzAx5KwAduDhIcK74MsknJ+OOh2x7ZqbBmEK0XYHxlwItdBHBNZDETtJJ9rN5MsnJW
 GEElwhw6ZUf8IXigmBCHX6TYR1XSYjDgvRzV/e8iO6CuoD1Wx+quTAIyxtwyjuLO2+4U
 IIVzGRQIBEMAZss4RvKlj5t3r6kJia6OZpYobkLrpIeGNeRdzjMPUeY+wOmGf20cje//
 Bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbwFRFqVrh9sNg9S7ni5ChPWq6dvxRynRK/5BclhVLc=;
 b=kCCa9Ig51WpCBpiK446HqJad24aGsESDiwgWd0ceWNxmJ9LhMG5Icmu8EmBDt985/w
 hCmjiBsUxL+moB/a9d8BFVzcE5de9IDf5sWZXo0fAcJVDJB9b4gQUQusyAcTggr0hzoS
 4VEPqpRk4lqWwAuwCYu8D8Or9HE1FUgP8V/OAyXg1dZdhPTnmw6/7kAbojq9NvDCd254
 +fg5jPcK1MIBLFfk8LYVHPjWmVJp4JL+EEyKC1RvMzTRcc0jbQauHnJv+q9POF5GNRJb
 EdY6rmKjHOtpGZ26EM/v+M1D22oT+mWl/2+XPIOlfe98GyDkVrvmfczYaerXj6yyb6bC
 Z11Q==
X-Gm-Message-State: AOAM532FEjts05Vi68M/kKgB2Ek2Erxnf6X9X2COCPT5L043xY1XsSlP
 mdUxjFRncsjs/DBk1EZEO+dMB8IpveNTIiy/5QY/zlNqZt4=
X-Google-Smtp-Source: ABdhPJwlctGZs4nbhYpH6E3j1JJpfsY3X/LnVYalA/kP/V3GjP4EwZhN1kXh21Puk5HWssFP68bf68e1HaP9keGkopA=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11572612eja.250.1607698838246; 
 Fri, 11 Dec 2020 07:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20201209174225.401337-1-stefanha@redhat.com>
 <20201209174225.401337-3-stefanha@redhat.com>
In-Reply-To: <20201209174225.401337-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:00:26 +0000
Message-ID: <CAFEAcA9Jq87JAWt+pBF0R1Px1zfSKf5uD4spTj=spcR3vCa5pg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tracing: convert documentation to rST
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 17:42, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> This is a simple rST conversion of the documentation.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/index.rst                    |   1 +
>  docs/devel/{tracing.txt => tracing.rst} | 134 ++++++++++++++----------
>  2 files changed, 81 insertions(+), 54 deletions(-)
>  rename docs/devel/{tracing.txt => tracing.rst} (89%)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

