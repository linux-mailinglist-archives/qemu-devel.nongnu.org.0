Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D011157B6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 20:22:34 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idJBR-0000RG-Ba
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 14:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idIme-0004oQ-46
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:56:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idIma-0003vR-CS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:56:54 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33326)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idImY-0003rM-4y
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:56:50 -0500
Received: by mail-oi1-x243.google.com with SMTP id v140so739569oie.0
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 10:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kP/5pFAvMzOxefCNQ8i8WMMJkY9cI7kD/o+Ikdz4W6E=;
 b=TkqWsMTMnEoLANY4iZCCglFADhC9L+qnnuS+rrS2w11asHefRYpHPHHWr9g1rtlXHM
 ca6gm9boIlAehvPd+zIJbdWNfYGdyWalEa6UlEvLkAfo+4//YWZJgkrcY5xBS+P/RFUT
 rbCZs5kPS53eSPdpmQVM16RSJpGkSSlrwZzVEEyX+nihn5zzU7q9Xw5PL4ycdbntLIIu
 veKA2RntrdBgaDhqrXAaZdxMQlJQTWqmZ6p/b3kY4w69AwrMalBxEdZdCzCMGZT8g6mo
 cdzJHNvu3iRJ62rF0a7dfzBKQdOfxIKzMfuhSa5BCCbEJvuZtV0X3oOYkXnR9RQffTKd
 c3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kP/5pFAvMzOxefCNQ8i8WMMJkY9cI7kD/o+Ikdz4W6E=;
 b=rzLs97hgjxMAnbFqVATf6urSyoqhs1kLkzflqXq//4Pf+DXp0Tr/c6mVlPY5K2VfTs
 nCoHMqxwyx/nxSvNS8KR0XxkbN6YFAq9U0D0bxfMTuzpaT/aC8Nmf/rCvM8wuZPn4xMW
 kv/3+1Zn56oGfnVTDG7reZvxDPcuQaFfDMqOy3RhLIMsppuMyP7Fjlq8dr0h9DZvGfuL
 TENK/3fi+ZixKhXxy7bc5jhtcCvqg2k9t60ub+C3axEW0dbZVrQ/+3g8w0w2DToLVLK+
 xMvIRpN1qoGNZ0VqPDqzdcof4u0TmmZYiQSWP0dtyWrHkhbJuFP9c3jiilQg83siO019
 EVvA==
X-Gm-Message-State: APjAAAXnXfzgyHk0DPFl6S23KoOxU6b1sW/J1QZSuSoRfLO/HXAHT+zV
 ObmhewiqMtGuGHi+Ex92wPl6VCws3jQWTXCS8RoCbUpD
X-Google-Smtp-Source: APXvYqwAjl4OaPwI+E3cS1Dpd//mHckgQ0vWsafmE2R7VRZx81D1gPXhYxko5J4LL0tO3ITvheVfLEC79FpMh1g4DEE=
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr13901383oih.163.1575658607846; 
 Fri, 06 Dec 2019 10:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20191203225333.17055-1-richard.henderson@linaro.org>
 <20191203225333.17055-2-richard.henderson@linaro.org>
In-Reply-To: <20191203225333.17055-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 18:56:37 +0000
Message-ID: <CAFEAcA_+kxDNv0nb6MRr6uhv7RuVN3=G6t0-_gvm5C_iNFQXuw@mail.gmail.com>
Subject: Re: [PATCH 01/11] cputlb: Handle NB_MMU_MODES > TARGET_PAGE_BITS_MIN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Dec 2019 at 22:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In target/arm we will shortly have "too many" mmu_idx.
> The current minimum barrier is caused by the way in which
> tlb_flush_page_by_mmuidx is coded.
>
> We can remove this limitation by allocating memory for
> consumption by the worker.  Let us assume that this is
> the unlikely case, as will be the case for the majority
> of targets which have so far satisfied the BUILD_BUG_ON,
> and only allocate memory when necessary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

