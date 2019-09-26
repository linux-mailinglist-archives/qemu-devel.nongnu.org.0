Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0BBECE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 09:55:35 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDOcf-00029z-T8
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 03:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDOZ8-0007qg-UA
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDOZ5-00075M-KP
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:51:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDOZ4-00071E-Lr
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:51:51 -0400
Received: by mail-oi1-f196.google.com with SMTP id w17so1262659oiw.8
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
 b=UnbxwicJoCt+RX4tEOGBppHUBGSAJRNXpyj3gWj0oaK7EJcKfTSgqmlfn8uLsLbNgq
 jRORyjsOZBBG0kxWeg17GL/0CfiWml7dh6C6mwpwaYH4TvD/SOvnNqBpz1RkGZTwZBBm
 ZskEap5x9+crxkENXwueR/hsNRKZyQ9pCRaqzgtAJwGEyazYf4JWU+H2yLOTxbIUaUrF
 dZFg7hcRd2/8WuULWy7WORvj58P1O47BFxoMt7IeRx1S8hhQEd0x5q+Nz5Ww/H5vID/7
 Am7bdhL11kJCunGI2jduLzBnuiT8o1pE1bgxvapi/jNUZsbgKvW/ACtquUKlQT3GQKjg
 k/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
 b=QVd7TzgP96o3RzCylfagplpJ57tlr02qzVP46VB3UNVNt8av3+HOQ5xylEfHmg9ccg
 J/++jIp1e8YMS4me6sY7cGLfikMBHCiHNJIkbtAaT4yOJ/Op4yS7Bf3oywmJWex0O2az
 EZTC8mBprKNWXhCnlJC7Wz/FxVNhP11eFBvSXcYJCOKYY1Q36RyXZdj39oSdaJGxCq/R
 G03K4U87wlmyMHH3NAxjy5+63mbVp2oBYAd23UmOjBixkn9d5djoabGt7MyOn2+OrmXd
 ayx9ax1PGcMGVqSzrY1iswo0HJiBnCNwAdy/iFMXUMg3znAXR1zl8oykUncx1MNU9NOy
 SR0Q==
X-Gm-Message-State: APjAAAUIYrv7LeKxQ+aeMJIGKzMZh9twilcPw9xiekxuzq8pbllwL0H7
 GZzV9pM61glJpJp0ZxSAbjKs1YF0mUDpGhXieSJnsg==
X-Google-Smtp-Source: APXvYqxbWijizyJrPpz2AKFW3LQQpjXFZqprBuEWlwQub8z9oY8l3hkBkTX0AgQnhmMosvxD2itTGADbuVM6MWGJ00k=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr1517628oib.48.1569484248796; 
 Thu, 26 Sep 2019 00:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2019 08:50:36 +0100
Message-ID: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.196
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
>
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.

For KVM we should wait until the kernel chooses to drop support,
I think.

> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu=3D"arm"
> -    supported_cpu=3D"yes"
>    ;;

I'll leave others to voice opinions about their architectures,
but I still have 32-bit arm in my test set for builds, and
I'm pretty sure we have users (raspi users, for a start).


thanks
-- PMM

