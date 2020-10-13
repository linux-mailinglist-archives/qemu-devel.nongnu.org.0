Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9D28CF95
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 15:54:54 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSKlR-0001Aw-Hm
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 09:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSKkI-0000Tv-2n
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 09:53:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSKkG-0004Js-6F
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 09:53:41 -0400
Received: by mail-ej1-x62d.google.com with SMTP id md26so28370968ejb.10
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/eqp0B9foMZv0Z94rbZKLVxmZglCcFqsiFehliRorw=;
 b=AirjSVkHDc5yLGJytnAWzyce53n0WfYjJ8VTcXoQWULy3rfCTsoSBHgqlbvknw1oaH
 Vpxm/A4KzuE1rjK5B3/cAWK4Ok3cA1eWoAAuwTg61sZSPwFbodYNZOeSnP17pKQV7i+d
 xw6pYkHX9F1Oz4uKjKfQRjbpQ/8fHojFzTFyxHy37a3Xq3++5cd+QY7Bstvgumgtc3Ch
 mJvSvYECJPmGmUA8RNHyOZNkYBfXPyD9kkAigTTdXuhVyt6EeNkmK7BOvfqvpE4ny542
 Fb4bXTtJimqrSnNAEtSvm3melLLvTYoOK3SSB6hms6ryTCxb65nosTeFBZm6ko4beG4a
 jyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/eqp0B9foMZv0Z94rbZKLVxmZglCcFqsiFehliRorw=;
 b=AsainwaI/iE0C4ahxd9tlpkyy+EX/kUsKrHpRvu6gWz109MUKriNfLRhdQ8iSU5+6m
 9bo5yrC08/QttwK+ZsKJtLK0H4/1QOT0xDZ9Us33DJEYFHzUUdfgEd6Py1gRywuV3+Oz
 J2ETD/oitOquZCGbll2JmTvlR4NFMmD6axhc1vAbd0BsHt1I0WMvaK58BlKh19wHaAUt
 1ox/+8V+c3JHvsWFj40Q4AVZVhTCBgdnZd2HjGPdYb21hsLY0IYGewQci/0W5ZVOfcJL
 ndEgEfM2nrY2PoipfQyowe94Lk/IJSNrkNiz8WZR4imyOvkI4L2K4S1NDf54Io6z3Vkg
 V0cg==
X-Gm-Message-State: AOAM531SCAmEzs4wybdPS1SRPIS4s0K2tMPOJfNNTIIw02UexCAJ/6lR
 IrHMl+ca7+X9J0X99gls8dH690d7WJzFX2+74dKZyA==
X-Google-Smtp-Source: ABdhPJzVu41+mBUe4RXs6W6YdZqFty23rTanmUQ3e4vVYFzbDQRzOSb43Oj7Wyir8dd2wfn7zfEUtxWcKaPuvu0NDdQ=
X-Received: by 2002:a17:906:60d6:: with SMTP id
 f22mr33527684ejk.250.1602597217947; 
 Tue, 13 Oct 2020 06:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201013115052.133355-1-laurent@vivier.eu>
In-Reply-To: <20201013115052.133355-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 14:53:26 +0100
Message-ID: <CAFEAcA9G_3xYJOar+Afo1w8WNmh4g5d0qwsZi=ikO-jAOEqcJA@mail.gmail.com>
Subject: Re: [PULL 00/14] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Oct 2020 at 12:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2387df497b4b4bcf754eb7398edca82889e2ef54:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-10-10' int=
> o staging (2020-10-12 11:29:42 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to 6125673eaf711247405e796604204bb7d74090f4:
>
>   meson.build: drop duplicate 'sparc64' entry (2020-10-13 13:33:46 +0200)
>
> ----------------------------------------------------------------
> Trivial Patches Pull request 20201013
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

