Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21E4C5B46
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 13:55:21 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOJ52-0008Nu-2H
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 07:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOJ47-0007VJ-2D
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 07:54:19 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=40871
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOJ44-00032H-SP
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 07:54:18 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id u12so15214223ybd.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 04:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P5ZJOTzNqRnaMvwe5oP1Y9M8/D//A4qg5dHNO6D7v4w=;
 b=zKN6L6o+gOXc1VibtZw3SqV0DFB3eaZXElf+nDMpM/WsFQU5U/PaMPoxZ/WmxrGIFY
 BaKoXG7y8+1BDLX9icjSfOQtI6Pc4QyFUlvv/E2yb5CR+wrPWBdVM0yGP8LuMiZ+hTOn
 eN6M3x04TRkrcxsHq8ZTGHkyyY9NDZY0+A3ncd/x2EfCY7bPp9IWo2IOHkbnph7/YeRi
 Cn6Fep3GZ0a9grVzZBt3Ipv+Zc1u3Ae0c3CSBmd1NdI7EYCjSDGk4uMHT8jR9DqFtWLy
 JGgsbMKbmoszyB+YSnFBl7RDKowRU9/8hIj2PCcI3oKpIzmFr2mnl40+6rha/WmfYLVJ
 yvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5ZJOTzNqRnaMvwe5oP1Y9M8/D//A4qg5dHNO6D7v4w=;
 b=jME593d4rJ0lYoKKZqmXnxwGTr776/WahXJFn6SKhdFUAYfxEQM3akv/hZ0pUsGeU2
 ZRgU798Hx1xfwurWQKUaP/XTssnwKmg7IjGAyyRvcoSr/z47Tx8BOB1g6TxutbkTDf0h
 BLESxjDYBYb4OXJMSPUpM0U+ZlcXgBoi6Ll7FW/jroGFORr9IxrOJerZpGKQqRcJRDql
 5T6gPN4z9YYiGbkX6S4Vz/xcpE2r5FMXjsYKACorGw1Kqd6Wcc8PQsEC4FYopajwwZ8p
 t5TY78F+2OeCHzrvv3aZLiTy1Qohvb/LUfUT52PLYpkSLNbXVjA23wUnQpCdb3U+XuEp
 zxbQ==
X-Gm-Message-State: AOAM531Ja/wVcBWABQSjVShq/ZGTn5tzn/MvMVwROinp1FeRoHmeG3md
 bc/qikWnDSPrHiAWpn8yNZ3JUJvJLuNAiHs0hdf7yA==
X-Google-Smtp-Source: ABdhPJyWQrmV946jhNmZJBV/S9b/udCmohWyR75nHRsyKk1zncq0iFkhFpbspR7caQ3ZtgG8UNQLjzXBuHbsq068nNg=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr15046503ybq.479.1645966455713; Sun, 27
 Feb 2022 04:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
 <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
In-Reply-To: <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 27 Feb 2022 12:54:04 +0000
Message-ID: <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 00:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/26/22 08:07, Peter Maydell wrote:
> > Currently if qemu_try_memalign() is asked to allocate 0 bytes, we assert.
> > Instead return NULL; this is in line with the posix_memalign() API,
> > and is valid to pass to _aligned_free() (which will do nothing).
> >
> > This change is a preparation for sharing the qemu_try_memalign()
> > code between Windows and POSIX -- at the moment only the Windows
> > version has the assert that size != 0.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   util/oslib-win32.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 05857414695..8c1c64719d7 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -48,13 +48,16 @@ void *qemu_try_memalign(size_t alignment, size_t size)
> >   {
> >       void *ptr;
> >
> > -    g_assert(size != 0);
> >       if (alignment < sizeof(void *)) {
> >           alignment = sizeof(void *);
> >       } else {
> >           g_assert(is_power_of_2(alignment));
> >       }
> > -    ptr = _aligned_malloc(size, alignment);
> > +    if (size) {
> > +        ptr = _aligned_malloc(size, alignment);
> > +    } else {
> > +        ptr = NULL;
> > +    }
>
> Oh, should we set errno to something here?
> Otherwise a random value will be used by qemu_memalign.

Yeah, I guess so, though the errno to use isn't obvious. Maybe EINVAL?

The alternative would be to try to audit all the callsites to
confirm they don't ever try to allocate 0 bytes and then have
the assert for both Windows and POSIX versions...

-- PMM

