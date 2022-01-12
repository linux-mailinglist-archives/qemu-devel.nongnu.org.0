Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD848C3D9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:18:59 +0100 (CET)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cag-000861-4T
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7c6J-0005IB-OG
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:47:35 -0500
Received: from [2a00:1450:4864:20::42c] (port=45032
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7c6A-0006Le-8m
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:47:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k18so3672606wrg.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iPzahR7LY8rdmYb3nzNrYhi/6pQvLTR/WsI/s9Ygsg0=;
 b=inoSp3PIgHcOaBAkE5W9M73nLUI7rZ2Op1uFzihpoiQAXTVHjsCSjYCSSU2mpuZT0w
 50BS4MHO4J+XrqPyYCZYCyfNAfYEoxdjvAYtRd4ep4k7qTpUbw4yS7oJxc4ScywvJX1F
 y2OWmPDKIUKrh7QI8hdI2ZNokQVjvuhenW6ar7mQbh/tNGLm1J7/yTApD0FI4mQ0j/BZ
 79L+jzTM/JV3XjVccfQwR3izdKU5Wnip1VnBUoagP6fG5W1rcWnpclw/qcXeO6yBiGO6
 JG+7+4xzOk8ODQWPJtqUSg8NaXdWylnuhe98M1eqGPGzhDyhRhAJM9z0ywdKAEda+BYy
 iBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iPzahR7LY8rdmYb3nzNrYhi/6pQvLTR/WsI/s9Ygsg0=;
 b=K0AXR8k3rVEj85X25KJEw8SXf2jH9Gs+VOoxPyMB9uoXfqdK9JfwBy235fkav8bAoi
 UIPMxlhBIl0wyMlKbuwjn5H1nl75MStUc/zp8cU+v/OEM5xwH86ezf3fxROjkN5l4MUp
 3Ys/GWDs3p1F0JGaI9q2yoWa5KOlj80gNjCTw48hDBOBu6oX+zOQoOM7C0UnsIIP1L/h
 zOHopDaR3MoPCgZongsbN1DZbs147kmrA07+XKkCLaRq1OcpQWTMaN7ZrNbxBn1MRl34
 wXk+SxvbtdF72oIM3poqWrtfxZCwMT2SIOsS04a85D/3g1nSl5K9iFoPf0ehO89aqqo8
 aFrg==
X-Gm-Message-State: AOAM531pdNK5+wBc4GMXEODGX1CbkdLx9pTvMcm0vZZYZAJl89Z3VvFb
 pdfjhCBmqs7zf3E6+M8k1L/us45EZsLXPRqFmMXvIw==
X-Google-Smtp-Source: ABdhPJz1O9pyzvl95ZulMnOw3WS+b+utIQhi5gIe0S4oH9kGvD6StzuE/PjYnKY3ed+aVVk3LD/CL+sMr0hAohrtRmY=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr7917147wrv.521.1641988044244; 
 Wed, 12 Jan 2022 03:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20220111082900.3341274-1-peter.maydell@linaro.org>
 <788123b9-1d4a-3f70-52d9-416e7f5c0e9b@vivier.eu>
In-Reply-To: <788123b9-1d4a-3f70-52d9-416e7f5c0e9b@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 11:47:13 +0000
Message-ID: <CAFEAcA9zsjT2L=6QAVdcNiPw8wDdvkW-ZdoB03eC4SBmR0uj4A@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user: Fix clang warning for nios2-linux-user code
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 09:00, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 11/01/2022 =C3=A0 09:29, Peter Maydell a =C3=A9crit :
> > The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
> > on the code added in commit f5ef0e518d03 where we use a
> > shifted expression in a boolean context:
> >
> > ../../linux-user/elfload.c:2423:16: error: converting the result of '<<=
' to a boolean always evaluates to true [-Werror,-Wtautological-constant-co=
mpare]
> >      } else if (LO_COMMPAGE) {
> >                 ^
> > ../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMP=
AGE'
> > #define LO_COMMPAGE  TARGET_PAGE_SIZE
> >                       ^
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:3=
1: note: expanded from macro 'TARGET_PAGE_SIZE'
> > #define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
> >                                ^
> > 1 error generated.
> >
> > The warning is bogus because whether LO_COMMPAGE is zero or not
> > depends on compile-time ifdefs; shut the compiler up by adding
> > an explicit comparison to zero.
> >
> > Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > v1->v2: fix sense of comparison (oops!)
> >
> >   linux-user/elfload.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 329b2375ef1..d3274edfdb7 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, ab=
i_ulong orig_loaddr,
> >           } else {
> >               offset =3D -(HI_COMMPAGE & -align);
> >           }
> > -    } else if (LO_COMMPAGE) {
> > +    } else if (LO_COMMPAGE !=3D 0) {
> >           loaddr =3D MIN(loaddr, LO_COMMPAGE & -align);
> >       }
> >
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks; applied to master as a build fix.

-- PMM

