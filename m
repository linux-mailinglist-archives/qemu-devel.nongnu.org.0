Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B56FF67
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 14:21:03 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpXJN-0001Bj-Sx
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 08:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34605)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpXJA-0000m4-Fm
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpXJ9-0008Gq-Af
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:20:48 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpXJ9-0008GJ-56
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:20:47 -0400
Received: by mail-ot1-x343.google.com with SMTP id j11so15701847otp.10
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nd78VhKe7f3+Lqz/m9b7qbQAz2aVNuY5cckhF/7UWac=;
 b=rrCZJxYKZUmUy3fbqMEW255QRzfj2LLfck5cm1F8VY1FB8Dsve07kBnIhj4sbXdTuh
 niMc4jWe8dWzTTjDo4T2zHfUC51wm6WWNkvolTadxT4ABrBKdvrL1VV0EFCoH5Oy6B7u
 vNSnlJkbTWNT4p7M+m9S10IlwNB283X7SIQRB3BHY/MX9NBNle4gt1B4h5lKq7t/74ss
 eMPfbFMNhubfKnYFxXtrkXyHrRD3Zf65Kx2K6si8OfLJu7Mu7jY50r27k+SVrjdbnStC
 i58kbx2tw1V/kehcxHKLJC3rb0Tpc+lOUzxi/0+U09KHOMxAH3O+v+EYr7DufC/UwLT0
 tVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nd78VhKe7f3+Lqz/m9b7qbQAz2aVNuY5cckhF/7UWac=;
 b=cA1ianmfbKbPV2H9zKAzLcDsGvtMhbr0FcAJfIpUrAf9RmaMqeSQ4BSQqpfzT9wBKY
 0eoISr7qbpMowDBhD84gcp/xVo07R52IVpg/JKkyni8EW9R500qr6Dn7LcFGN1xH89Xg
 GJ+ZKSLn+z+KZ29+CcD+rsTHdrP854hV/sCeWVneBQdrJo7kX5lOoqiJ4+I75OQEICr9
 Dj3mlxK0UahSb5FP83lSCHQWGy9uIyRs1PsOWyfgnVxu8Nhh2qdMrM3qoETeI0p3uuqa
 Eq1qiG/t3G0U3JDXTBgRVeZtI78Adma5sYEQO5LJ88KB/R6vxl74iKpitfG8z6TZ4xPr
 pscg==
X-Gm-Message-State: APjAAAU3jFplczjFROu3mfoslHI+xUC9aR91hW62fSeDq0Qc11uTdPFW
 ooMwTQgp4L+P1dZXRCLIxHDDshrDqMnQwVn1PmQu3Q==
X-Google-Smtp-Source: APXvYqyQTQrQzW5gre1CkdxZ1EaULg7MbkL5RSaUqGXAb5JNE5EI48lcml50vc97QRx0m2yw+5p9h5QCdQ75CRM6614=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr4566582otk.221.1563798046245; 
 Mon, 22 Jul 2019 05:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190719202119.24792-1-eblake@redhat.com>
In-Reply-To: <20190719202119.24792-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2019 13:20:35 +0100
Message-ID: <CAFEAcA-WCkNE=ieSC919nRxTXFvGJVkD8bSeeP2vOr1Jdjmstg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PULL 0/1] NBD patches for -rc2
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

On Fri, 19 Jul 2019 at 21:21, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit e2b47666fe1544959c89bd3ed159e9e37cc9fc73:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/misc-next-pull-request' into staging (2019-07-19 14:29:13 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-07-19
>
> for you to fetch changes up to 5cf42b1c1f75499b467701926d3c9691d27712e1:
>
>   nbd: Initialize reply on failure (2019-07-19 13:19:18 -0500)
>
> ----------------------------------------------------------------
> nbd patches for 2019-07-19
>
> - silence harmless compiler/valgrind warning
>
> ----------------------------------------------------------------
> Eric Blake (1):
>       nbd: Initialize reply on failure
>
>  block/nbd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

