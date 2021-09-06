Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE5401D7E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:18:18 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGO1-0005gf-3t
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNGLe-00045g-6p
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:15:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNGLc-0004u5-FC
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:15:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id n5so10313904wro.12
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=63ZmusEvEngYsWIBNKfb3cuGMYc3fjhjMobxo/Ftokk=;
 b=KedyXJLXey/i1SYL++P9A6AEL5ZZ85vTQsZPCorfM/ueMqn0K4dsMhB3Xjv4oVZDlU
 jO4DigP32z/QNRrNtJOgn7EF23uApjKVEWHh2oxai45jVs+Qapy0MWbjq4opCRKGbz6H
 KRhnqbE+bYO3zE4BvXRnVGXRaZXtLgguVdtOgNkLjRqU0iEzhi2Mf5VRsjelIzwhE5qA
 bhj07PVrixl9ecwI59z4TDcxbMoyS25UQDOC3/u2xij6xqWfIdaGPoA0MTBK0b6XESGp
 Pks9ynBg+Z5RO3jPqcd9XArFhvtr3SVPQTjJyeLtyomEUR4xXGPS2oYp0vKvzMTQxcBA
 hQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=63ZmusEvEngYsWIBNKfb3cuGMYc3fjhjMobxo/Ftokk=;
 b=RQ3woXnVVgrqwY8gV8VCFJo8u1oCks1thszY3MGWKU6GDwemjivOSSNOOaB3WcVVAJ
 n5K/bRItDe8PcvL27vglLmgPiwtrLFdP6Dc098WHRFGza3hhl+vZ2CNfNE9dqcN6Y+/X
 DoT/RBVdGzq16Semo1YgnCt9Dnpd5u/XCx99c5EcoP2iqxTjgq8DE5cT4WUxPVyxjyAI
 su3lejPuhT/t4AHhCesOWjpwOy2LcQdwJvOgfa5ajndLqfrEBhN/QIZmcERLsvpHIUO7
 KR2di+mDefZcUVTlq7husWgUcbj468jtCYXbuMeRHUWUVelYPpt5VoniG1uP4Xyk1PaN
 7qYw==
X-Gm-Message-State: AOAM531sYv4tB7jfC1kvrLIsOnYM6tdoSKW5DVdGG7epEtMrcNt4F/ux
 qvc/O6CTK8NfOEMrCDAOC5DGOELVRYl+c7mD/PWWzA==
X-Google-Smtp-Source: ABdhPJxaQsSGdTne9xmCl6GPExYKuHZsDAMeRH0XsfynzcGuDCu9KW5DDJBSAglfLnQgZ8vdATviaZEFuRHHSjOU5h8=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr14277936wra.275.1630941346931; 
 Mon, 06 Sep 2021 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210902124911.822423-1-thuth@redhat.com>
 <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
 <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com> <87v93hpqdj.fsf@linaro.org>
 <CAFEAcA9eWukPg87mBCA-UfGuy6i-HdOyjnOpYF1eRsbCHfUjvg@mail.gmail.com>
 <2afbb10f-b813-e1b6-8b61-5c7874994813@redhat.com>
 <4c6dde86-b6d1-c61e-0a5a-824deff79521@redhat.com>
In-Reply-To: <4c6dde86-b6d1-c61e-0a5a-824deff79521@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 16:14:57 +0100
Message-ID: <CAFEAcA8nzgQP6nah5XifT7vN-z0an6Nn5JWFun9=jdYtZ1TS3w@mail.gmail.com>
Subject: Re: [PULL 00/13] Testing, build system and misc patches
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 16:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 06/09/21 11:51, Thomas Huth wrote:
> > On 03/09/2021 18.49, Peter Maydell wrote:
> >> But I think there is an underlying meson bug here which that kind of
> >> use of an if is merely working around: if we ask for a static library
> >> it should not give us a dynamic library.
> >
> > Agreed. Actually, when I run configure with "--static --disable-system"
> > on my laptop, I'm also getting some warnings:
> >
> > WARNING: Static library 'z' not found for dependency 'zlib', may not be
> > statically linked
> > Run-time dependency zlib found: YES 1.2.11
> > Run-time dependency appleframeworks found: NO (tried framework)
> > Library rt found: YES
> > WARNING: Static library 'png16' not found for dependency 'libpng', may
> > not be statically linked
> > WARNING: Static library 'z' not found for dependency 'libpng', may not
> > be statically linked
> >
> > ... and linking then later fails while running "make".
> >
> > Paolo, could the behavior of meson be changed to fail already the
> > configuration step in this case instead of only printing a warning?
>
> The reason why this is just a warning is explained only in the code, and
> it's this:
>
>      # Library wasn't found, maybe we're looking in the wrong
>      # places or the library will be provided with LDFLAGS or
>      # LIBRARY_PATH from the environment (on macOS), and many
>      # other edge cases that we can't account for.
>      #
>      # Add all -L paths and use it as -lfoo
>
> In other words, Meson doesn't really know the library will be used for a
> statically-linked binary (as opposed to just not wanting a shared
> library for whatever reason).  So it looks for a .a file, and forces use
> of the a static library by passing a path to that file.  If it cannot
> find one, it warns.

Then Meson needs a feature so we can tell it "yes, we really did mean
that we want a static library, and only a static library will do".

thanks
-- PMM

