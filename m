Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637E648941
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 20:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3jSA-0007W1-Iz; Fri, 09 Dec 2022 14:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3jRv-0007Vp-DH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 14:54:23 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3jRc-0007Dy-GU
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 14:54:20 -0500
Received: by mail-pf1-x42b.google.com with SMTP id k79so4437869pfd.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 11:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=usGF94ULSgfoLSbP96GonyQrHI5JnXyySywakP97meQ=;
 b=JK/hsW0eupng9A7N7uywygZ1bR5OrqPUIE821V435IH0veDGt13/MeVvLDYGLhwocZ
 VdiQDLiZNS5rtQ0iqOUQQlXitZRyRajbAAqyUYD+Nf3/Gyc1iBVVKSwDBtw+v2iW+P57
 flIOVzpcz8McaexnKLFp92jKmT/I32uNrcg9TBbithA28UpfSbV8Mij5uDLRMU+hFMW4
 0jcYdF3L5uoxlLEkj8x7gZZuFcHTcakvACScrfVcnTjkBw6C/9cxV47DovhkjbmGaN9i
 tmRVakKLc9EzfjN7QV/IQ0Gh2OzrFZV/p38AaC81I8MOm2d9IdjgW3P4sCP5Z12hQlk4
 DiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usGF94ULSgfoLSbP96GonyQrHI5JnXyySywakP97meQ=;
 b=PnXMJZDLISL1r4ujAawPAPHXNbNKVY9OZlFzu7RKuklA1fqekW6U+CZKxGAD87rzC3
 UOamXv7Py7pBZKHE1Y+CusZT7wOlvR6WsWXOTiK2iWjmpYO+fBICgDCGSPdzhWdo4F9y
 sm/4uUORZcOPkdBo5yAtBKyOuhZ/wk7Ciyi5u/0kx/S5xG/b+hfjrR+Doc3jgpVQ4h02
 uQzpVslPDPj65N9G3OFhulq++q/1pGoLVo+22Y+lfGL96KoZZ/1TF7Bv2qD8ihljuP4g
 L1uRD8Gd+1bB6BxVHxwIjTtYVghq3nqIRE99KKj4zv6UQ6r67wUiAyKXUuZ3b4FLDycD
 k+gg==
X-Gm-Message-State: ANoB5pmmO7yLlEYwIB9Mi4ZMStqnbIBCUpGxvDMOfPxSLJdXq2pSLju6
 WycGAuaTCmEd3+nmKEHFe4yGRY0EQUQ1/Ox1lFTe4w==
X-Google-Smtp-Source: AA0mqf6lut7XFZN4VOafyZ7Jc9WDuZG8wE8hlDqTBl+jh4qnR5yCoEI3KdWH8AMTSFmc88Q8Ww/YYMiF4B0TCE8+KkM=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr69677731pgl.231.1670615635868; Fri, 09
 Dec 2022 11:53:55 -0800 (PST)
MIME-Version: 1.0
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
 <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
 <CAFEAcA8MrUwOt+gaSVF6tMpG_HO_wCN_O11Ezst97-_52PR9pQ@mail.gmail.com>
 <a14c2624-36fa-b5c1-a358-95694e01a339@redhat.com>
In-Reply-To: <a14c2624-36fa-b5c1-a358-95694e01a339@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 19:53:44 +0000
Message-ID: <CAFEAcA8DttcCD7ofcjfifigssAZpnLAe23-J9=iadmM31+nV0Q@mail.gmail.com>
Subject: Re: Target-dependent include path, why?
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 17:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/9/22 17:52, Peter Maydell wrote:
> >> Dependencies are usually added near the .c files that use them.  That's
> >> a bit messy of course if you have an "#include <>" in a heavily-included
> >> QEMU header.  You can consider it a way to discourage heavily-included
> >> headers.
> > This has always seemed to me to be a recipe for bugs that only
> > show up in the uncommon case of "some dependent library's
> > header files have been installed somewhere other than in
> > a system include directory". Is it possible to get meson to do
> > things the more standard way, where if a binary has a dependency
> > declared then the CFLAGS for that dependency get used for all
> > objects that go into it?
>
> This *is* what Meson does, it's QEMU that has always done non-standard
> things in order to share the .o files for target-independent sources.
> Back in the day is was -Wl,--whole-archive, then it became foo-obj-y.
> Now it's foo_ss but it's the same thing as foo-obj-y in the end.
>
> Once the relation between objects and binaries becomes many-to-many, you
> can't really apply "the CFLAGS for the binaries' dependencies" to all
> the objects.  Pre-Meson, there were three ways to declare dependencies:
>
> - placing pkg-config output directly in $(QEMU_CFLAGS) and $(LIBS).
> This caused binaries to have unnecessary dependencies at times.

Yeah, this is what I think of as "the standard thing".

> - mentioning dependencies in $(obj)/foo.o_{CFLAGS,LIBS} or something
> like that, declaring dependencies in objects and applying them to
> binaries.  The Makefile implementation was very buggy.
>
> - a mix of the two, with the include path added to QEMU_CFLAGS and a
> target variable definition "foo$(EXESUF): LIBS += ..." that avoided the
> unnecessary dependencies.
>
> The sourceset thing was added to Meson specifically for QEMU, inspired
> by the second option.  Without the bugs[1], everything could become
> fine-grained.  Only glib stayed in QEMU_CFLAGS (the third option);
> anything else was unnecessary because everything includes glib.h through
> osdep.h anyway.
>
> The closest thing to what you're suggesting is to keep LIBS fine-grained
> while making CFLAGS coarse-grained, i.e. the third option above.  That
> is what the patches I sent today do when moving the glib tests to Meson,
> so it is not hard to expand it to other dependencies; but while it might
> avoid the gnutls issues, it will probably cause other issues---think of
> SDL messing with "#define main".  Overall, I'm not sure it's a win.

The thing I find counterintuitive about what we have currently
is that I can add a #include of a QEMU-internal header to a
source file, and now the build can be broken on some host
system configurations.

I'd be happier with either:
 (1) it's always safe to #include QEMU's own headers in its
     source files
 (2) sometimes a new QEMU header #include requires you to add a
     dependency to a meson.build file, but if you forget to do
     this then the build reliably fails on *all* host systems

thanks
-- PMM

