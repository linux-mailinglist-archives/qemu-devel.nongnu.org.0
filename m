Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30B3AA425
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:19:13 +0200 (CEST)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltb4C-0001jC-QD
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltb2J-0007md-5N
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:17:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltb2E-0001Xs-B1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:17:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id k7so5544066ejv.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9+l61Q++4DLO0NRjeba7DPn6Wu6+UaKrwQb87a9KjR4=;
 b=HvcKDj9rPLWYYgW9qT70r+WYi2O2xktWUcbcfoHMDA/KM3CTMvXUZUix3srCfpmlFd
 maImoV0LMOXqorqzt4UW8LO9/XcEDKU39l9jB77hPnHIzylVkgWQ6K96+5TQ+3EuDdx8
 lSlVmAtuAHLghVT4NowpL6JxKsPY4N6ArvH0v5zlNGnlgqY9jvqT/T4vuYqOMIB/5f3P
 OStvXJAh4MzoGbTtpifEkOsva4Wk7a3IHdx3xVnY3NWZwA8EuroHpm7nGs3c7UYwZede
 YbOMZHNbfONenn+VpdjrQCaCWWIDu8ABA8Y/C3lIxXAEFfUMYSxS6JuVRnBu0wf3PEmE
 6d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9+l61Q++4DLO0NRjeba7DPn6Wu6+UaKrwQb87a9KjR4=;
 b=Cu3m+lx+v7F2tVAN40Qyd/cBu77r8MTX0b5ly5a8LOca3tL2BV4pHMGTdXlm51JVZH
 QF0EUb/dHRGaVb1/OOINeqWgBUgfv+n//bxoIs2T1HCDn2wJEA9K9Wj8Nz7ZXrHbC6xH
 eSx/jg79L/jcTeQdVsauFcRKVvxWUehlemQQSc0G93xiKJt1bHLm+UWu2kcr/koigFuA
 t7iIUVEZhSJMsYWL7huCa5uFE58EW7IounTEI43/QDsCi77sQJHQUGUS70aILcABpHau
 mb4kmsdafnoqpaV96PBA9VtHUBLvEg0PC6jj65ZLJkh5vF6PNK+2nIVnPK7uUzPaOewF
 pIuw==
X-Gm-Message-State: AOAM531KqbMxGISKjEFd5/nKn9p8ejeNQBPrR56JNtmFjdgVciQYKH+M
 L6F3jGuOF0SanFchTYErRdEx+QxkcJumUYAElof7sG4UqVE=
X-Google-Smtp-Source: ABdhPJxANoRorqrJmG6fAC5AGEFHSM9fH12Yw4Q/AAqujwXk5dQ7jnUgVzGu5n2G8oRCohNWxLlVVlWyeFxkJdgtpbw=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr1099554ejb.482.1623871028184; 
 Wed, 16 Jun 2021 12:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210616133559.9211-1-peter.maydell@linaro.org>
In-Reply-To: <20210616133559.9211-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 20:16:33 +0100
Message-ID: <CAFEAcA9nfu32pdHanE=gEz7g2wF4V28TeyUwQ_aHvJnQ2B0hUw@mail.gmail.com>
Subject: Re: [PULL 00/25] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 14:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: dropped the hw/acpi/ghes-stub.c changes, which produce a
> weird Meson error ("Tried to extract unknown source ghes-stub.c")
> which didn't happen on my local builds; I'll investigate later...
>
> -- PMM
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210616
>
> for you to fetch changes up to 703235a303d6862a7e3f5c6aa9eff7471cb138b2:
>
>   include/qemu/int128.h: Add function to create Int128 from int64_t (2021-06-16 14:33:52 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
>  * handle some UNALLOCATED decode cases correctly rather
>    than asserting
>  * hw: virt: consider hw_compat_6_0
>  * hw/arm: add quanta-gbs-bmc machine
>  * hw/intc/armv7m_nvic: Remove stale comment
>  * target/arm: Fix mte page crossing test
>  * hw/arm: quanta-q71l add pca954x muxes
>  * target/arm: First few parts of MVE support
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

