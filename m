Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A8835DF6C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:54:33 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIYq-0005Wz-Nw
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWIWP-0004uV-Cp
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:52:01 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWIWJ-0003xJ-Bx
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:51:59 -0400
Received: by mail-ej1-x631.google.com with SMTP id sd23so17079042ejb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hfR6pe3ytSWICb39d4NCRDJ5aMNnxG9/9/oP8GJ+jY=;
 b=cODSJSKcUnSANwlxofBWMdsh2lz4FHfJ/r2+koGtbIhCeY4aSf2MtGOx/CSvmgLrJL
 Hk1bSfR4ztLPKegO2B5jAZV573rxuLaXKVwF6lD0GGWJRi8lroo10kynbvhoPuzKtp8l
 cWiItN8jCYmUERFx9R50H/vFZ1hYfPbcHQbdJXhN1Vtt3dFgB4aJ0qB5uo2vJR+KX29N
 4qT6453ApURSoMQqi54ftnAOWcnQlNmujcypVmUCUr/vN94cCJ3QSmYhie0/Xl83nhw1
 YjkXaCrb8PUPZHO+SZmsK+Cz6BmtxfyJ6rBnXgA+YAB8EDkwatuIFlyMyhd3l/OmSOvT
 al5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hfR6pe3ytSWICb39d4NCRDJ5aMNnxG9/9/oP8GJ+jY=;
 b=YBFAf7NjSL+A9G/aZBXrk4qSKjs4N7iKaNZFjAFDWURfpv95lacKC+R3V+BVKTo3Np
 HrysxGHIyM7YTOKl3S5bEnOUjXGTioROxiL+0VWjOcUhfpJ7qM1tB1TtBl/NrMJSskwK
 00u3MCen/b0ZwWjdrSvEIr2VE43CdeVog56QljftNgRE9gWo8U1TJqYTumT3O3CMmDBC
 A/C+sSxJ0dfDm0vEacLFEW+yf0hZrC6i13AP4xiNY0WCVhfs4IYSbvjk6hgkvC9zU/cy
 dVQ9FugZL1/57b07QFWNP9XA7GE07N/SXQIzZqwzY9ZSPsqK5e2JnJkCPjpFnidVxV1s
 bTgQ==
X-Gm-Message-State: AOAM533d2IQ4wdkL856U+SqQoVoYb828E7sGHRGfona43dNLG4MShyUU
 xrNqD+J7z8FrWEcHwyeBUdOG9MTdZvdoGEGKnMooKQ8Bafs=
X-Google-Smtp-Source: ABdhPJy8uoriNShZCVSyX785F3quRDC6y6f8pbge5vaqf3VYyXMe4BC+74PNBDY5o/RKkFzyYnOGtshZ49N6ZDU8ZVg=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr2567692ejd.56.1618318313763; 
 Tue, 13 Apr 2021 05:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210413124800.216095-1-pbonzini@redhat.com>
In-Reply-To: <20210413124800.216095-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 13:51:08 +0100
Message-ID: <CAFEAcA88i+t8MCRwmT=zNGgHpHaSAJ-1cgvE6+-=AN+1SrPNzg@mail.gmail.com>
Subject: Re: [PULL 0/2] osdep.h changes for QEMU 6.0-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Tue, 13 Apr 2021 at 13:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 12763913a3e44d9968a9ab0da01a0880fc7d61df:
>
>   osdep: protect qemu/osdep.h with extern "C" (2021-04-13 13:00:37 +0200)
>
> ----------------------------------------------------------------
> Fix C++ compilation of qemu/osdep.h.

I had some unaddressed review comments on patch 2...

thanks
-- PMM

