Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B65A6627
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 11:58:11 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i55Zi-0006X2-U3
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 05:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i55YR-0005qK-1d
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 05:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i55YP-0001er-UC
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 05:56:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45362)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i55YP-0001eV-Oi
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 05:56:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id g16so4240290otp.12
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/R10hJmIBoUj9rWMDbbGfLuh6SRQU1iZkJR2aZvYgo=;
 b=DYy0mPZWYp0ZrACEyNMrANPcn+dY4JYrVSW72hlO7+1nIArPzFXisIvQJNDF9uKn79
 OOVXknqC5N4AWJqlufsIeCJo1Z71NvrX0C0IEor2dK5Tv30NwV7S3I9iUr+pS9lxhyda
 IWz3UZos7rWFtQjRDNw9nExsy1iJxfYPUTtczSYRK45b7fN1x9V68CXvbCtlYFQeVDUZ
 Fy3N+5/7+hLfGCnDfUBzM5b5KhFL9ghMkn6JTg2br6C7aoqr0dDlfhaiS+afgZprgJUd
 N13qOpTqcwsTmZgPeAwY6TvfTXU1IsQVJZKzYTd7S3TmBC+ubPiREx3h2kPae5tmDTG+
 u23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/R10hJmIBoUj9rWMDbbGfLuh6SRQU1iZkJR2aZvYgo=;
 b=nM1Jq/fOQvEVFttXEKoF93noEF/YaoK8YB7Dx2apQs8b+LjVbVe0GwdbyZO06qEJWY
 6symBqaxqU2+ko2vBahBk0FM8Y0vllDjWHfvunsfvmiMsxCWIl+KTyVXk+Z0TD2YgKa5
 saUogSh9/kgEA5s2fjVxgDwEzK3zld0FfyqRfY9K+AvifdEIrZNcD/zY/UkAL7nQGwhn
 9iigufP7qTbHFi88pOXAHCq6H0E3vJZRqegNRcR2WyWcvxWzf9ETpOe6Regc7g0BcQcX
 U8MfqpORJAmQpbojuFkk0KqliODY4klgwmKG4oFb7ZCkM4JOCoXNz/U1L/zwsPAPsrB9
 4XWg==
X-Gm-Message-State: APjAAAX9cUC3tjU/omLF+nCQrQdWXzEJnef9wOna51VarqnId32xkV3p
 tJISH7xL7sgpUM88PYDqAVafFOwQYtVgbzz6FuK+ZQ==
X-Google-Smtp-Source: APXvYqyWrJCqHLRWcvk+oaVIvd2bAAMgZgAkwVFzIuy3yyuKaIB9PF2xNk80M8fGUTFx/5YBraiLHK2+hiLymU/BJOo=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr9990905otk.221.1567504608764; 
 Tue, 03 Sep 2019 02:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190829013258.16102-1-richard.henderson@linaro.org>
In-Reply-To: <20190829013258.16102-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 10:56:37 +0100
Message-ID: <CAFEAcA_vXKQhfXM8NRmefHc2gFhOrCOQARqJc6EHbVj9sAdVhA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] target/arm: Fix SMMLS argument order
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Aug 2019 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The previous simplification got the order of operands to the
> subtraction wrong.  Since the 64-bit product is the subtrahend,
> we must use a 64-bit subtract to properly compute the borrow
> from the low-part of the product.
>
> Fixes: 5f8cd06ebcf5 ("target/arm: Simplify SMMLA, SMMLAR, SMMLS, SMMLSR")
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

