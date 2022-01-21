Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1B496067
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:05:38 +0100 (CET)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuXn-0002xb-ND
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAtUe-0007Xp-RU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:58:16 -0500
Received: from [2a00:1450:4864:20::32c] (port=38858
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAtUc-0007rw-PY
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:58:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso22147730wmb.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jBb7HOs1aITVHop9zO2I+O5MkZzCicjZ5m1waVFueY=;
 b=a+bKkq0TyA0suQz2dNV4heiXR3NAe3M5+2GQkIJMNqEoav3lLeDikK3LNLNJMpltAO
 3/3XU4bFUsZUIxUYFxb/Vn7KTuLKYftk5moYXv7Fjc7B50AjpO5lm1HwWfs/1itb5ZH6
 wgdnbQ1DEN8IsT6LPxzrJt76Txd4VYG3AtoAsyISg5qPRCb8lNBZ+pG0sId+iCM44Jb0
 2DXcUd6YQlXeGWQv69+U0lMah1lWqQucV/e6/2v3Wbzv6KT0IzSSrAVyy4uZ5MmBjPGK
 Ls5CBTJgxoloXZ/7oeor/fQ6PWPWw114S6bT3EHRvvDBEVKKDxU2za/3ws27HsY2x+po
 bCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jBb7HOs1aITVHop9zO2I+O5MkZzCicjZ5m1waVFueY=;
 b=cyzbly9BHSIRdKEr8+ICHlD69M4nKyvawHhPNPXn1LO4gC1eRya9Ldv4+RrfNkdB+a
 NsSUIYgu9WqPzQ/RMUzRVnO2aFQZ8SFAgJBF9FCA7P1jvs74iMWeCN2mVDJJAhOh/kH0
 qLQYY8eQk1WhO6Nucc3+uyxQ0WC8vpdSu9R/j/0fVYwlcF8meKoMa5IGoaq2KLGPmWQN
 Et26XH+4EgSp9FcYPdUWxZhg2p8eXdLEc3YVs1TpP7eIsLCzPY3UUrPog9mDI4o86qcx
 wzWYRNHQTU2nJqoWCgknG8jMIqfVNzNspYkpixd1aoorRdBV8TQWbJlrNrG45zVv6s1e
 aCzg==
X-Gm-Message-State: AOAM532Ye2ATNsiNMIlIZOsateiagC5eCBCZTsBFQzApXxHby9RdTh48
 J06z/D0hJMPU5Wv7jgrcaTTq+xoJxvXeBtwJN0FjWA==
X-Google-Smtp-Source: ABdhPJx0bjw72ao9r1yIwzbss+dJjWLpPS9uxP8Xmk8Z2AGNSlGKEGgbsSuueMKFj5mta9N6cg1hS0jalZIWEjZno80=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr3915989wrv.521.1642769892350; 
 Fri, 21 Jan 2022 04:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jan 2022 12:58:01 +0000
Message-ID: <CAFEAcA8stCZy1md4vdofxRErygj5VYZWfrto4QdbMkNb-4CLCw@mail.gmail.com>
Subject: Re: [PULL 00/61] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022 at 06:11, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 2c89b5af5e72ab8c9d544c6e30399528b2238827:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220120-1' into staging (2022-01-20 16:13:17 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220121-1
>
> for you to fetch changes up to f297245f6a780f496fb171af6fcd21ff3e6783c3:
>
>   target/riscv: Relax UXL field for debugging (2022-01-21 15:52:57 +1000)
>
> ----------------------------------------------------------------
> Third RISC-V PR for QEMU 7.0
>
>  * Fixes for OpenTitan timer
>  * Correction of OpenTitan PLIC stride length
>  * RISC-V KVM support
>  * Device tree code cleanup
>  * Support for the Zve64f and Zve32f extensions
>  * OpenSBI binary loading support for the Spike machine
>  * Removal of OpenSBI ELFs
>  * Support for the UXL field in xstatus
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

