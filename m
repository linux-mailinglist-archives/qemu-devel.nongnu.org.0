Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4EF9D6E4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:37:23 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Knq-0005fX-Ei
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KmJ-0004QB-Lh
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KmI-00087m-H0
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:35:47 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46169)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KmI-00087G-8V
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:35:46 -0400
Received: by mail-oi1-x243.google.com with SMTP id t24so13011780oij.13
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2QoHKA2OCd2jkD8edxRJeo/sWqZAOnTjs4iTwpCNS6I=;
 b=A2xZHtHjtrcxMTX3QUOdjjdRWL7oNwOsd8GcvzQO7f438qS/+I0Ht6jUrfVuYo3AJ+
 kWqPA8e5e5Ma2GsQ6TM6HkTpSFJ6axtgu2sQi5sWmRb0PTfiYNOOlVJMlZAsjKPqj56f
 zabtaIDeDukAT441qqvTNPoqNj1WlkpxFjNqkzX7XLf0hPAdadvAs4qn4OU1IXIktywC
 JruXMi3OfJPu19eVaWitrcybJIeHwYpzV7Hom2SMPg8FF+QxDUosiRtMsGqif/CKPaLJ
 qHLgl2yu7B6bOodd9eU3juLhERdeN1fD0pyv26/gxt0O6uVUJTRm6KhT2zpKXE3qjhHO
 h/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2QoHKA2OCd2jkD8edxRJeo/sWqZAOnTjs4iTwpCNS6I=;
 b=J86mm6wDPJRQ61GBc7PqSrJNLx4CqNhFNbkmn5p+bic3fgYR+hTkpSeOf8Sl26aApP
 i1XFrYJgfExubxI1MKuMd+gg/k3+RqE+C2uXJx2NFtPAtn1Fvxv+3uG73iIycZB4Z+bg
 i+//cpUk2zY+nbieH4ABbuXz7pUE43X9yrF1ZA2swe82O5ojG4XngA+7LJ4Wj/zT1CIT
 SR5RvE5ReooI01wmLVUCPYAvQjfAs0MhoNFljJG4VzpLqN/fxrmS13L2BzbdKqmFM5I/
 wpyVoZuVenuN/w+NlAobxWEa19F6fE0cxHS408nd/CwrRnw1DpP0MKe6bKlsLXfKOghA
 TJdA==
X-Gm-Message-State: APjAAAUdQJnI58hhaACUsgObmhBTpatzXk5w8edLKE5+Y5Z7/jvkh4Hb
 ZWB3FzHNMOXwKGTTSY1jnMnzicZuL7Tw62YPSwNgiQ==
X-Google-Smtp-Source: APXvYqxjQ9YQjEmN0VKhGo/neqyhhJzkkyO+nlLAfCEA6gPm/5AzHa8/R3WxinQuXPynAW8w8qnaGtdh7sWyKDHLk+I=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr12692151oib.48.1566848145306; 
 Mon, 26 Aug 2019 12:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-58-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:35:33 +0100
Message-ID: <CAFEAcA8-H5dF7AmiZDt=MA7OpNVJGw6WcfKk6Fox5fQsWC3mwQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 57/68] target/arm: Convert T16,
 Reverse bytes
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
>  target/arm/translate.c | 18 +++---------------
>  target/arm/t16.decode  |  9 +++++++++
>  2 files changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

