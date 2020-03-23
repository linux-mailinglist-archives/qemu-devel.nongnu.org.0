Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5118FFE6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 21:55:12 +0100 (CET)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGU6J-0006gX-B7
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 16:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGU5V-0006Ej-UT
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGU5U-00012Z-Bk
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:54:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36184)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGU5U-00012O-3I
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:54:20 -0400
Received: by mail-ot1-x341.google.com with SMTP id l23so4869451otf.3
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=j3uJmSP4vlK1HqfzZtz4mEHi7T+3x0n12teeL1VvaF8=;
 b=CYq8s+ndzwoSc4VGDn0TBAjsA4Yhyyjh0UKcgi263/+GahpiYL7cmX9UkMoa4cgEW+
 juacKZQKmuOwm5GU/r8G4+5wSJ80B9LYB5b3UmJuAMOy4vspkWbWMlSqXwAMwNCGerKO
 nxSBFKQ+rTe2OK5qDHJI2GId/rg1tNpHC0wXSiV59fKh289krPFIFb50eg41f/xcRbGs
 5LxoZyEgNftj3cJyd8/yRkNOSj/etDIWP/ChBI0+SWSZThbvWteRVkB7TB4PnQvraBSj
 fsj4kT0ksZWSHO/GF3/rjonm/rda8iTsnLdOaeiT7t9HAR+XkndlcaYsldt4s8dIaw9d
 2EcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=j3uJmSP4vlK1HqfzZtz4mEHi7T+3x0n12teeL1VvaF8=;
 b=U6MRKw1Lc5qFLAyyKFXzdab4gtBaSazD2/J1p8IgclngbkvfSPS6IG4VboI5dqv7s2
 blLjBSY9dk/V4Qf2x+xRLVK5vNc2Y0uEvSgd8Xuy8wLm1xndSJGkawv8K+Hpa8R0SDua
 cgSxkLlmYqd0T2gLN6mBT03ENU0wfJvTx8amtkGi9orE+QDA0TkTXW79lNwiRmcb8cr2
 Vecq+w6SBSLfUKRmbn1u+r2ssqbEdcHRDyTc7YXUKpDzjR4cc+4zLuaY9CDS5SGUixaP
 fPfk/He99r5bwKNPdx/3QS7suyy1zZUeSqnM7WHRd2v4QsX+rz1izdY6oV8IazL1vvI9
 4hQg==
X-Gm-Message-State: ANhLgQ1RL/JY5N/wjP8noGkjQnRwZomGVNysv/FMuSVjzroq8/bdxCKi
 9KYRfRSLuxtLpHkunl6Gk/YocpQ3Exf1pPyfDyfOrI+eIB0=
X-Google-Smtp-Source: ADFU+vv+kn4W+o0rrm9mQ8XBSxBZlAoUcbjtculkvVj4SDjwi+k0ktiKX1kSe3kkarZiUgWTypyXHWNtmPKnSMF9tPA=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr4499214oth.135.1584996858213; 
 Mon, 23 Mar 2020 13:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200323174006.8468-1-peter.maydell@linaro.org>
In-Reply-To: <20200323174006.8468-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 20:54:06 +0000
Message-ID: <CAFEAcA-DvrFyqzYLTkD=jQUoLMEQsXME8EG94ucMhUU2nBMUgQ@mail.gmail.com>
Subject: Re: [PULL 0/5] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Mon, 23 Mar 2020 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Just a few minor bugfixes, but we might as well get them in
> for rc0 tomorrow.
>
> -- PMM
>
> The following changes since commit 787f82407c5056a8b1097e39e53d01dd1abe406b:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200323' into staging (2020-03-23 15:38:30 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200323
>
> for you to fetch changes up to 550a04893c2bd4442211b353680b9a6408d94dba:
>
>   target/arm: Move computation of index in handle_simd_dupe (2020-03-23 17:22:30 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * target/arm: avoid undefined behaviour shift in watchpoint code
>  * target/arm: avoid undefined behaviour shift in handle_simd_dupe()
>  * target/arm: add assert that immh != 0 in disas_simd_shift_imm()
>  * aspeed/smc: Fix DMA support for AST2600
>  * hw/arm/bcm283x: Correct the license text ('and' vs 'or')


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

