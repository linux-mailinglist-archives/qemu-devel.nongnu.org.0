Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4A9C4DB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 18:29:04 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1vO3-0001ab-IZ
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 12:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vMM-00013I-Lu
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vML-0004QA-PB
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:27:18 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vML-0004O0-Je
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 12:27:17 -0400
Received: by mail-ot1-x342.google.com with SMTP id m24so13021682otp.12
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OImiG2cDAenKoZj3WQWQ8ZnkWoAxTGj0z60lc768Cm0=;
 b=bNzzb6boW3s+JAJPd+MYx2GpYFf3t8LdngstA9wH2QbHLnh9eRyoeWz+wl4NgkLbuJ
 qkweZjO1Y+iXia5DmWe5g+5hrO1CVKVH93Ws2zFZbCsSlit0lwFx2/LHhraWf3Yi394T
 5JSpv3oysfZjWIk4MWzZSDqbWJLZn3g5V3t0LXLdpPAItGIzeyAluZEeWr53nGrJ8etl
 j8mo7sW9LKEC9TnY6mo8M5fF0KOJ4Mps9JklrPJOjcu0hBvzjoPobWvscpgiyJBeWqqM
 X03TwV6opct5fSEKyP+RyXaeLWcB4I1eTx3nT9agqidk5Y+LGUzK+2JdIilqZBvBileL
 k4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OImiG2cDAenKoZj3WQWQ8ZnkWoAxTGj0z60lc768Cm0=;
 b=cSTgA4Iov1abS5QfiEkl79STj/Hty13ZyshRg1dTFfP/aG331N/5y+OslCYQSGLavH
 vvst3B/12lpwMk9NjS/bYNis2+phBbe7SXLi5xkcpFj58Gjtq5t/SntVsAq6Yh+eslaQ
 6nCVaL7VAfNohKNan9jzj5CKmWfcthulR0t48fAm14Befdxn+CX6pZz/5sWM+xWqUzMy
 ZsVyQR9IxaSzOzrlk+06NAtUeF0VcSRyufUTqjsDBsNdTTLYHUoksqQj9C6PhsrQenoe
 7aqO7apEC68Z3pyxsclD1Yrcnbkv7GgBs8DowbtxUBruI9MX3wOGpEP+MsqHPrjT4MQk
 CHZA==
X-Gm-Message-State: APjAAAXub2fncJT041nhLRXtSOD8jAUtGX2WBsOY72hSxOI9lwGuIeH/
 aVzEUXPz9wH8JbWllslnUKdcqYkNknEsSjIqwRlY+w==
X-Google-Smtp-Source: APXvYqx/6fB/TTlSN6Z9/t+uO10iMe/tmgcYXIvXT/UsK6rIbf9z5ADXgktfOPs3uEF7vqmvy20ItgwGB247A8O+JEI=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr8729062otf.97.1566750436663; 
 Sun, 25 Aug 2019 09:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-40-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:27:05 +0100
Message-ID: <CAFEAcA9eJCF+tjoUfQnJMyAX9YPkyOHCU1OAjR=hW3O4-p5xdQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 39/68] target/arm: Convert Table Branch
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 57 +++++++++++++++++++++++++-----------------
>  target/arm/t32.decode  |  8 +++++-
>  2 files changed, 41 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

