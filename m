Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07845370788
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 16:18:12 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcqRe-0003b6-GF
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 10:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcqPV-0002SF-5Z
 for qemu-devel@nongnu.org; Sat, 01 May 2021 10:15:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcqPT-0000eg-8V
 for qemu-devel@nongnu.org; Sat, 01 May 2021 10:15:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id h10so1270895edt.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJEYo5P9iv0XTo3JsFd30+kknUCrO/hjgkIzSxlPo1Q=;
 b=fBZ2hn4l9rUqeR7jXigHr8Zb9iqZzKFJjVOKGM2+uXDPrHzhLuZptM8Wiie17zKoTj
 KcLtCABysdRjENum39p2jMKJqR8b6MBNHf5LFnbtgwu322YGi4A6J9goo3pxuyGIYtw8
 543CILVCV/HQZLqt+5G5+J8jY0C+oDPp7W6OGWBgDBoHJ9+0741zKuf9qm4qhftB7ibk
 SejM7AYG9BUadJt4xC4R++da7Bl3pGQcOgnE9g+EqqCW1EuNfsTn+8I/MwE92J9Kff3I
 rU/3dFu5dZ3EpoGOUr1+x1spdzUaXxpV1L7jVlNRMFyrka4hDtSGINPIlO6YG6KZU7ll
 9S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJEYo5P9iv0XTo3JsFd30+kknUCrO/hjgkIzSxlPo1Q=;
 b=VrcLq6nOyq+QUk+7qALsQQsmLp57BV6Xa+xz0y8GLakdnFekRs/vsQ8pyXRk6X11wk
 dzyR8OUb+Uow79Lsdkg51voj998/fkmFHCRc/u5j6Xwq1eRL7jq5uhkpf4eAA/y8Dhfx
 7+KAV0vIulx+jcnOjsIuIB9FZW4YPzELZj8nvaODzlEkPnQlpwNPhVeljRvDsLj2uR3y
 vISTtpb5/btzXTHm+Mobd+/rdCGpPnsd2S60dvT2fkUDKG70igsACg9vlaQgZjXcELNw
 uDMfezwYhaHQyVXKTuDbBhXUGUFZaz/Vd0OdqLOoy0wOZ9Y6W4sdPKBnxXnNVtFKvSs/
 BC3Q==
X-Gm-Message-State: AOAM533j586dAvnw3zUX+0JFtX/X2n4C9ChPHsZNnVmfItXoJZteQBS2
 9H4iGcrxHzifMHQbRdKf6SnQGgKujyuHohS57/Y6tg==
X-Google-Smtp-Source: ABdhPJyGbR7RqKhX8YWCZ8vlLhtTWgNRBYokgyqQNEKjLgWwzx0brB7C7gP6cRyJK+6J2eu6tQALpXezbMOfX1Dd2qA=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr11462065edv.204.1619878552588; 
 Sat, 01 May 2021 07:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210501093026.189429-1-pbonzini@redhat.com>
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 May 2021 15:14:49 +0100
Message-ID: <CAFEAcA-A-Ey1JwwWWTVe8eNZWKfp6iEGoh1QpPR=Ta_KX2zrGg@mail.gmail.com>
Subject: Re: [PULL 00/10] Misc patches for 2021-04-30 (incl. NVMM accelerator)
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Sat, 1 May 2021 at 10:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit b1cffefa1b163bce9aebc3416f562c1d3886eeaa:
>
>   Update version for v6.0.0-rc4 release (2021-04-20 16:30:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 29740bdf1418c1193524356389cec825051c7a64:
>
>   gitlab-ci: use --meson=internal for CFI jobs (2021-04-30 21:39:59 +0200)
>
> ----------------------------------------------------------------
> * NetBSD NVMM support
> * RateLimit mutex
> * Prepare for Meson 0.57 upgrade
>
> ----------------------------------------------------------------

Fails to build on netbsd (on our usual tests/vm setup):

../src/target/i386/nvmm/nvmm-all.c: In function 'nvmm_vcpu_loop':
../src/target/i386/nvmm/nvmm-all.c:753:13: warning: implicit
declaration of function 'nvmm_vcpu_stop'; did you mean
'nvmm_vcpu_loop'? [-Wimplicit-function-declaration]
             nvmm_vcpu_stop(vcpu);
             ^~~~~~~~~~~~~~
             nvmm_vcpu_loop
../src/target/i386/nvmm/nvmm-all.c:753:13: warning: nested extern
declaration of 'nvmm_vcpu_stop' [-Wnested-externs]
../src/target/i386/nvmm/nvmm-all.c:770:14: error:
'NVMM_VCPU_EXIT_STOPPED' undeclared (first use in this function); did
you mean 'NVMM_VCPU_EXIT_CPUID'?
         case NVMM_VCPU_EXIT_STOPPED:
              ^~~~~~~~~~~~~~~~~~~~~~
              NVMM_VCPU_EXIT_CPUID
../src/target/i386/nvmm/nvmm-all.c:770:14: note: each undeclared
identifier is reported only once for each function it appears in

thanks
-- PMM

