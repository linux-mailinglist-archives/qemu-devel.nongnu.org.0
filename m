Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF77D72C3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 12:06:15 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKJiY-0008OW-6F
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 06:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iKJYE-0003wq-9o
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iKJYB-0005OW-Kg
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:55:33 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:41197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iKJYB-0005OC-C6
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:55:31 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w65so16252644oiw.8
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOrc+lBWcBjJSieDQDJV2kbPkgS4lpEkrvkTEH0M3JY=;
 b=UnrtBPjQ/M9jzW7nh2hBB5c6OXUcVWCA6X5U4pJPgqc91pzhlXnFVIqMi2d+NCZ4Z1
 vMgLeg9c64l7R8IgEUJR0X/35oPTkbyc0cFuxpGsfggznluSrQlOHVj2509uFzAfah6Y
 tNonmtLk0hTq0Q8O4sL1CQJBuRaR2SBj6YPApZcoFBQGkA/TmD8gwWfaU/LK/+1pk6Pe
 Eogo/BbAKtEs8GvB/qYtxJgJKKX789qu8Db/6P8ZSZn9uXC1CQrot+M9VC7qxbRPBaH8
 1XV3om6l3uafJRGTzzcak2PmAPPS4EpULQfv1yUmVt5+oVQFmwUSjMqArdUVo5RLJb9n
 AC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOrc+lBWcBjJSieDQDJV2kbPkgS4lpEkrvkTEH0M3JY=;
 b=ixmKcgJqmT+Ks8/E55cn+SYgOgO93jnwBdRWb+iKPhFVAcJV0OSc9a0uwc61bdNLWO
 8rP4AFL1SHFu9MTG6Y7J5UnadupgMiRnO7001uDtn6ve/b03fxQpJ5y+3W97uktbMx5+
 M6GJOQ7Z4uWrUz174z+FtgEL3vm2j39418YkdlUyOhFl6U/x02zIPoUB/ta28zljyUrk
 lxFyepnFscsN7fSor1c3J/3etHTjra3aA3BtJGGfX7Xr5IQZJf+3DnG2ykvtjpQUvPW8
 B2ARfFJ71Y8rnBFlyq5Wsd3ry/ev5qBtTggaZSK0RDlAlTGwsTm9+fnE82iLXXRbuXGj
 m29g==
X-Gm-Message-State: APjAAAUWEHOOWj7/qY/kMk+z391kAzHwQJQatpgSVWCWEbLpzksJfVuk
 z+RQmwkZNICXBW2EsRIfhtSSJQyRBCud5gOAMK4qlnOF2pw=
X-Google-Smtp-Source: APXvYqwSrN8zL/X0lvPGC/q830ZLPBa2/HIPoKip1TxgUrqVljjeVqUatOzdXaNSH+84VFAvkEfpHUFoyuTp1ts2teE=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr26671155oia.48.1571133330238; 
 Tue, 15 Oct 2019 02:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191012102240.22329-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20191012102240.22329-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2019 10:55:18 +0100
Message-ID: <CAFEAcA8wGOo9C5moapy9wVj2rFO+HTH2FXZosN+qLfiMWsF3Uw@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20191012
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22d
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

On Sat, 12 Oct 2019 at 11:24, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e72d:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-10-08 16:08:35 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-openbios-20191012
>
> for you to fetch changes up to 25bf1811cffc2772fedaa9345026cb5375ae11b4:
>
>   Update OpenBIOS images to f28e16f9 built from submodule. (2019-10-12 10:18:18 +0100)
>
> ----------------------------------------------------------------
> qemu-openbios queue
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

