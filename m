Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023802FBDD2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:38:20 +0100 (CET)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uxO-00050o-P7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1ubm-0005HG-Ub
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:15:58 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1ubk-00067n-NC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:15:58 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r12so18227372ejb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ncWAUAGuijVNHIKgFRq3rANZv7pmtTZH2PFzjq385xI=;
 b=XEqS5+SDnyXokQzBnbPpt9Qk8b3wj97xFZHqU3d50ujG4DJzBr6ZxIGvil3AKGohhE
 9tjYss7gbQsdoOR3SRnUXTKN/IuCJKQPuOrQheDr+EKFVnkxWkpIiujnuW0kXslvJx4G
 O1OJoe81bQE5YkjTygsKSqPKU9pf4igerFUEVEYY2nBD6cnYOBzyGcNffgB1S/PeivFO
 hGCEvUl2l6lfeUEb24ePZKb+kJi9N0uV6RSGl+MEw5LBzLjEWIzpEaIcskjbPkNWY3W0
 JYYhkupd3hCt1EmLUwmQ1FcGZ9yKuvrdAxpdWVgKC6d4xR2Vk9AZcxoMSErKpfiRgSV/
 mzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ncWAUAGuijVNHIKgFRq3rANZv7pmtTZH2PFzjq385xI=;
 b=CXeolCDScuLFBK3aam4MOI+AH5yMlytz5aYeu7Rgl73I+yuU6HB03ehlIKDAE2xLkt
 vHWRg97MEASbR95yI420m8XdT4Qn0J6kXBjUR8FTSMq+RmbeSWxarXY8VV/DZHazYN3M
 JR9+VhKcw3E5D/x+Ve8g0IMyiKY0cy1gXYkua9k77s+2Lf2XBKGi7j2qnyQKKMZiw/Di
 PxaRP4ffoUe+KU1cnDSx+OgpySwjjGUfD2aTb3rB3QL4G77YQ6yNEcZH+fIOBQ4Xgn2R
 n94joSq8kRD9xi6XCAeliLNCaesIAleWtE8DtC5s6cB0uAwk0WXgy64KbYvn5tNfUgkI
 efuQ==
X-Gm-Message-State: AOAM530j0i3xNnwXigdaM09g8k4Vh3m0qLdBthzXcdOD0gLl0mjqrk8y
 de8IDUXf7Gt8omjEFQWnjYuhs5woCKr2ePHJ65uf2InmeP0=
X-Google-Smtp-Source: ABdhPJyQERcI5/Y16oq8jLLuDIakO1RnO3wG/08M0v4H3WerKe5zoQBIl7UO235vV5rFuerMpJb+5Uunsa3Hb8k2Jyw=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr3527053ejb.382.1611076554909; 
 Tue, 19 Jan 2021 09:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20210119154706.22310-1-peter.maydell@linaro.org>
In-Reply-To: <20210119154706.22310-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:15:43 +0000
Message-ID: <CAFEAcA-ZdLpE=YjLx2u8CwTUkusG2jsc1+M=COQW==y1E7zh5Q@mail.gmail.com>
Subject: Re: [PULL v2 00/29] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 19 Jan 2021 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: drop pvpanic-pci patches.
>
> The following changes since commit f1fcb6851aba6dd9838886dc179717a11e344a1c:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-19' into staging (2021-01-19 11:57:07 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210119-1
>
> for you to fetch changes up to b93f4fbdc48283a39089469c44a5529d79dc40a8:
>
>   docs: Build and install all the docs in a single manual (2021-01-19 15:45:14 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Implement IMPDEF pauth algorithm
>  * Support ARMv8.4-SEL2
>  * Fix bug where we were truncating predicate vector lengths in SVE insns
>  * npcm7xx_adc-test: Fix memleak in adc_qom_set
>  * target/arm/m_helper: Silence GCC 10 maybe-uninitialized error
>  * docs: Build and install all the docs in a single manual
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

