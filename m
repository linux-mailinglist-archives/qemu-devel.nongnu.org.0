Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A616BFE8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 12:48:34 +0100 (CET)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6YhV-0005qs-DY
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 06:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Yfm-000574-OZ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Yfl-0006I0-6J
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:46:46 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Yfk-0006BE-VN
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:46:45 -0500
Received: by mail-oi1-x243.google.com with SMTP id l136so12245712oig.1
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WIgrSjO36kulyTpaFvSm4AhO1fHqQY7DjaAiBeMN5w=;
 b=e7z133ayg7ypsNfvU2hq5T7gJ6LYrrFgv10GI2Lp+N1D8NiwnkHU9RJ96UHqXC1Ur7
 ADkhkgpAZmIcdm+kLh4wgyxvV+L62M2zCHcgtVmfoWqXhf7UKl5VOVC71IibyBewi4KR
 0jTSl2Kk8BOICQgrXcznIiZxtchterwUJkhEfGRMMuUTm0MWdrD1+UtbDePeYRhWaGzA
 UUDDYaOpTBCPFs0iDy60Im7QoU9u0MyLucrzCBWqFVYVHXjJrdvf8PZ2YS80UHC3+8V6
 dx3n8yZPS58rUD+Fb87wApA5rW+v7tOUIUudy6Gwo3dWccJu+BQvMVym9bFnQLgGTE6a
 wG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WIgrSjO36kulyTpaFvSm4AhO1fHqQY7DjaAiBeMN5w=;
 b=Lg7ptnDfV9r63BnP+KBpmrqhyFQNUOhJJwYaxi034jGMNGiO33QIlc8VzhiA9K+fsi
 fI/uEskjId3QYjSZxCLag/YbG4UddG64XR9ONMfPHFlRbO1PIb54uOWk1tvGGOTP/rue
 34hg/werOe4GzfnzLjIpMCkAZJHGVjAhgDXFUDh8/HkmANKlnazFcr+O7/K5SWp0AOTv
 cIYGErFwbxx2ToVC93dUb73IpXa3rHyvTYf9TyqoyPN9FeeRNi3TSdIxznqTASbVuKau
 6HoxxzjImvo6yP8Xzj3Ea6/8UYKW7oV6R8E4cPgrNSeHzIK/KIRjg+nMoUxmtHHNxNaQ
 Z+yQ==
X-Gm-Message-State: APjAAAUhjNDgIOdz3tdPIA13WgCtMOcpVAwAF6NNmWhcAwd74qo7leb3
 8nBv6Tgc2CIGOaT9QTgI5MX6QkucDKc3bSV5pMIDqw==
X-Google-Smtp-Source: APXvYqykFnwG9vXebu357EkxvPj3ispYeqZMK5pIfLgMh2O3F4T4Uy+PY5P/9nocLAUr0yAlfIRx7fmgmHYRRx/AFKY=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr3129020oif.163.1582631203662; 
 Tue, 25 Feb 2020 03:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-4-richard.henderson@linaro.org>
In-Reply-To: <20200218190958.745-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:46:31 +0000
Message-ID: <CAFEAcA_izWw2PkO-xz3Eu7Jsc1z4SMa4=027hHN172k0f_FeGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] target/arm: Honor the HCR_EL2.TSW bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Feb 2020 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits trap EL1 access to set/way cache maintenance insns.
>
> Buglink: https://bugs.launchpad.net/bugs/1863685
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

