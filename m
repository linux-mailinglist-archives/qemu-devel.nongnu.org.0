Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AE409A3E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:00:58 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpKD-0008NI-Fn
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPpHz-0006eT-V2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:58:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPpHw-00071I-Ri
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:58:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so15758309wrn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUD+mrtHkSKRhyvdI5smwIzw+7TUb+2oi/QrNA4Ogug=;
 b=cJ+bHzSP95j80MtO9x+c75H5XwT+driDYclHEKnQDh+fnT2PLI3FSH4D2AZ9AMQAJL
 A6Pck36k/jm0wSYWBNXpLN1/F/KgL1VH8TBAjSiS0h4JwrhgUVadBzumZSYvK/MmGYQW
 3YJwTBj70CPRl5E5bc1VWCVqAHVBgvLz+8v2nn6Oc5nSg7blV0YBb5mffgWCR+kpkanB
 tFSHG+FJZf+Z22VbdBMaW3TnCfHi/Z57HnwEZTUGV9V2lyBhA2QeKHIvuY0lI2DqXlQ7
 ld0lzqRE/tj3xNFw1/kOiLYSofI+fB7zF+eFpff1g2o1Af7v985bOIGqRGU8vL2uMWfH
 /XZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUD+mrtHkSKRhyvdI5smwIzw+7TUb+2oi/QrNA4Ogug=;
 b=PnbhS6gU/+279AzTZFG+e/xHkMdBas1IvZy6nw6MtQcf31HRGeYyz8QeHbuCdFrZ3T
 9i/PpoQSu/JRWmosj2vQY+RSLkO0vjvwo2VJIahPbYAHqinnXB+9YL3e97ssEX6g90fs
 bYDYBuhWj4a7IS8+DgHEaIF7Sc2wDeDmT4CHliKJnUx604K7Y+ev0afdjdmciiQNZkt8
 56iRANocMR1NBxhrrHDYAFKo9gZSvQmno589Sj7+FbAwV9fH8js3kKd6rOuK6UlH7dpJ
 w3h+nSz5R+R11UVGtOY4duV9sKRqNEbYVvEyus7IXUT8TEoKjOfCH4lJJSjEg+pPtMa9
 2GdQ==
X-Gm-Message-State: AOAM531ycaodUURiuGR83RsCM2SI6tpPbwwoYuCYi39JcO31LUcgsC+z
 10TeaX2a4Y2+X95POzjU1GhtqwtfUrI/O/mWhGItKw==
X-Google-Smtp-Source: ABdhPJxdtfty8h7qweFECwFEKGBKILLtHjkR3R+jpJUmqOCyi9rQ+sIF3vRys+SntajsXjW3s6VW1KZ7jpw/obslWVg=
X-Received: by 2002:adf:f185:: with SMTP id h5mr13959716wro.302.1631552315173; 
 Mon, 13 Sep 2021 09:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210913115742.533197-1-pbonzini@redhat.com>
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 17:57:44 +0100
Message-ID: <CAFEAcA_m9ULoF5MPSG7D5D1ijj6m2mybB5bWZwVhYgAp83h8cg@mail.gmail.com>
Subject: Re: [PULL 00/21] x86, docs, meson changes for 2021-09-13
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Mon, 13 Sept 2021 at 13:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 8d97327342ea8b32ede19fadaf8290dc29fcfa048:
>
>   docs: link to archived Fedora code of conduct (2021-09-13 09:33:27 +0200)
>
> ----------------------------------------------------------------
> * Fixes for "-cpu max" on i386 TCG (Daniel)
> * vVMLOAD/VMSAVE and vGIF implementation (Lara)
> * Reorganize i386 targets documentation in preparation for SGX (myself)
> * Meson cleanups (myself, Thomas)
> * NVMM fixes (Reinoud)
> * Suppress bogus -Wstringop-overflow (Richard)
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

