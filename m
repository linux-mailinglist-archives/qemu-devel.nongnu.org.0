Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B935FAC4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 20:42:30 +0200 (CEST)
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkT7-0003Ln-7L
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 14:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkRL-0002hl-9a
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:40:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkRJ-0006Zp-DK
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:40:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id m3so24927711edv.5
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xJEZjlIJz+wXkdfovxnilIKY6GxS6pAcbHCPv01wg80=;
 b=bsIaWKkpFazYMiFZdh+Dj7/23b99Kk5TV/1aa4LVYj3y3PV/PeyEuOCeVDjSYYsKhc
 SELw1Zn0s+/JImxBKXUPBipdJ2cVJezZDp7YmVGYbzT1fh/ykGD5IsH6AmePy6UzFPIv
 Jmqw42r+fQKXdWl2fQwLtpiP7YiZZ1M0ZmSVsWg+WAAJGXoBYOnpBSBcRxUSjQdiWMmG
 Id36P4PQXj+4h3tGgfZ0jcd6X7XXyGFm66WTWax8fu5u7S4d8cqXOF8ylcAXuViMsLcq
 vpSQPFqAtSjN2L65tszwfnmgSYe58SNuSioU3aoV18Y9DNz7hT0JxJjpZ5dzfvNTPLLi
 iZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xJEZjlIJz+wXkdfovxnilIKY6GxS6pAcbHCPv01wg80=;
 b=T6/9LO/Ktjh2oceSDeYxzg37tuM4AzF7cj0BInUjuOnisXdNWsL5vmxBPeBjWVUfoA
 aOQd0x5pWUmwMjL/HsLXXah1ho0cWTAnivzwoeC0DAq2sYZbbZ6Z7yweRxmL067y3akE
 28EkeeH640y0rsvDy5tipjNdVbiNGRiI9BzVwGWZGwD/ZObOCSVbwKOwBg7Hr44OrCUY
 AIdxWXJNp3lafZW1xIi1qB2Hsp406ZNUozm7RrGQleO/r20TpMjp/d4jISU7w9E0RGjL
 M5QoWOYx/mMqwb4GfJ3kpR/9yD5uKQNZy7b/y5lR8NXU3Fs4i9ueoOSEKR+QQMGgOhsP
 9+ow==
X-Gm-Message-State: AOAM532hTc/LbHqv+X3stchTAaQUFGe1cJU3qhvN4rB4AOWUMAplr87P
 McVt5yHpapqPOx6xJ9/TaYWVvFMlAqZxpHj8vwRJlA==
X-Google-Smtp-Source: ABdhPJz2j1hcXn5zMWzBYD1gg7BvDA7VveaXVYLrLDjxXAGIhcKM2enemm7tANzu7yRnpZoquzNY2j9djPNXUCBL4uc=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr347306eds.52.1618425635630;
 Wed, 14 Apr 2021 11:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <20210413160850.240064-3-pbonzini@redhat.com>
 <YHchNfXnhyzZBTg5@redhat.com>
In-Reply-To: <YHchNfXnhyzZBTg5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 19:39:49 +0100
Message-ID: <CAFEAcA9xqHBtEEu39GpM8_xtax4r47P4jLQsjT-P6rsfALQ+8g@mail.gmail.com>
Subject: Re: [PULL v2 2/3] osdep: protect qemu/osdep.h with extern "C"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 18:26, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Apr 13, 2021 at 06:08:49PM +0200, Paolo Bonzini wrote:
> > System headers may include templates if compiled with a C++ compiler,
> > which cause the compiler to complain if qemu/osdep.h is included
> > within a C++ source file's 'extern "C"' block.  Add
> > an 'extern "C"' block directly to qemu/osdep.h, so that
> > system headers can be kept out of it.
> >
> > There is a stray declaration early in qemu/osdep.h, which needs
> > to be special cased.  Add a definition in qemu/compiler.h to
> > make it look nice.
> >
> > config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
> > are included outside the 'extern "C"' block; that is not
> > an issue because they consist entirely of preprocessor directives.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  disas/nanomips.cpp      |  2 +-
> >  include/qemu/compiler.h |  6 ++++++
> >  include/qemu/osdep.h    | 10 +++++++++-
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> > index 2b09655271..8ddef897f0 100644
> > --- a/disas/nanomips.cpp
> > +++ b/disas/nanomips.cpp
> > @@ -27,8 +27,8 @@
> >   *      Reference Manual", Revision 01.01, April 27, 2018
> >   */
> >
> > -extern "C" {
> >  #include "qemu/osdep.h"
> > +extern "C" {
> >  #include "disas/dis-asm.h"
> >  }

> This and os-posix.h both include other system headers. We don't currently
> have problem, so this is ok as the minimal fix for 6.0, but long term we
> need more work on this header to further narrow the extern {} block.

The other path where we can include system headers inside extern "C"
is that the code above still has dis-asm.h inside the extern C block,
but dis-asm.h includes qemu/bswap.h (midway down the file!) and bswap.h
in turn includes some system headers.

thanks
-- PMM

