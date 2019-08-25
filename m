Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA429C650
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 23:44:43 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i20JW-00044m-91
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 17:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i20IO-0003a9-Gk
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i20IN-0003vT-GM
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:43:32 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:47051)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i20IN-0003uS-Ai
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 17:43:31 -0400
Received: by mail-oi1-x243.google.com with SMTP id t24so10682516oij.13
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImR4ENy5xzCZF9RNsJyzhjLrDvK1/C60uZRwJxzrzPU=;
 b=FdjW+nNvH2gsLe4wyqMbrk9TROHCwzVgkW9WWQlxXPSqIA7Rsqo4dSsH2i3hoJ2gOI
 NTggD/h2Y09DLsaeHSni9qjTsq+ulexObkPo+xPs+cqKr9yipdjiUpAZ4QOYHSbs1NtX
 ohj8JeLF507sajv84gLGafnVeK84O0rOxclJWKtqTZe0WaYv03iPDN+/kfMyQS33NrM6
 w9WY8tBj7Jcgs49F3u7T+awhH1OIjajZO3NqFkepoE5WyM/HCJRCsfY6I61OF6sBPG13
 CBp/EIpeic4bvIoaBs6NaMczQd2RRL0Znue16X7sKZPgVh281YK99JvuYKwa8/ugr8c8
 +jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImR4ENy5xzCZF9RNsJyzhjLrDvK1/C60uZRwJxzrzPU=;
 b=gOQrxw+8U31sHaUavzIhmEN9mgIIB+HKn+qzZLOy73H7FROc6K8E8rwGcYkGdge2Ca
 JFOBqakbTXzHfLOm+5ydf/mZq6G0iAy9uXoDYfX6Z1evCW/FILHKoYhx6nbTmoSQ1SHo
 PZAEChpcJTkhqFVfGmTJzDjHpWpU/rz1YTscaMjycSnuyYQC5PFiXRGQSlAyaxw13SMt
 HXEDpy4LPelTilQNxlfPcJ8jfybcxB5DFV+C1TvJfqe0dqwYWluV8oZqQhQGq6/Jm/0K
 Atke8rwk7ptcc0BE4bQ+M8Q3aWOfpdhzNolETAgjg/rF+P7uUYTCYPFLnkl3M71CqfHV
 eA7w==
X-Gm-Message-State: APjAAAUWXbtanbBHGgrR+Q0Bg1blJRXCx+cJbeo+Muvp+5/7qZPA7Zf/
 S37tGSqm1XCjVc0ThPLJFXQ5H6dXDNvhCr8kK/rxgA==
X-Google-Smtp-Source: APXvYqz9E0JToPxnB6IvHVhODLwlVOOCl25IXo+bxWHV8qSj0N/17Z3kfNOhP0Pk71ZA2yhCVaSdo07PSECj7BKry90=
X-Received: by 2002:a54:4718:: with SMTP id k24mr9915810oik.146.1566769410751; 
 Sun, 25 Aug 2019 14:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-54-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:43:19 +0100
Message-ID: <CAFEAcA9DehYFQspdna0mP+pKPj+YZnVi2WzZfzuc1z50P5c5LA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 53/68] target/arm: Convert T16 add,
 compare, move (two high registers)
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

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 49 ++----------------------------------------
>  target/arm/t16.decode  | 10 +++++++++
>  2 files changed, 12 insertions(+), 47 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

