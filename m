Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88C375843
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:11:49 +0200 (CEST)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legbM-0000UU-6c
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1legUh-0003JC-7L
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:04:59 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1legUZ-00030p-9h
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:04:54 -0400
Received: by mail-ej1-x629.google.com with SMTP id zg3so9052152ejb.8
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C736AuqidzDQYfgZUZZB0PARKzaD4iAVzFxsLnZvVFc=;
 b=n1fAETreJFQdC7wXEx5ii+pfu/gGH9b/X8P5A9SX9BGHF7EutNs8G9WP/6DeQ2UEEz
 lf3SV4glmo9fE8fMqGf/+JMh4m+fmRshQpmQh79Olzk5LYno3JkeOfytqEKfk/VclzzJ
 of6IX46ugieYUfWu0eEiMPC/A/nIUtuPLE3+dgdoXM7BCZ5ZEewe7BI/qNpNP4P7/eqh
 x1uCSUJPNDOvt3uq/6X68SpaE2eiJRn/D2v+9sJrdNQqvEXBFt5cxsJ77XFujzRe9E0u
 dJSkDbtfDPNtAd+q/qcFmWTw3MJND80Z31hpZSed3D3dtCJNSiU41yxdRE0pLc5YIdKB
 vSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C736AuqidzDQYfgZUZZB0PARKzaD4iAVzFxsLnZvVFc=;
 b=NUly+oCLUDEAfJ/0oPLykuBstg4yLyeLAHw6fEFGn2hSrLp+ZC0aaeSziFJyke5WSM
 8CBIvkMyMmRZ158X71m0ic2GL2auoqlqgAmcKRUNBd9NTefw3RKx+W7ltrVd9UI5s8h/
 6ZmOjqpp4hzMrdh+6Z/mwUsL5CSTwcxYGc7a0EzTVW7ahZYweL9RGGb4A8cx4IxAJnu5
 hxhxf6j/M3YeBna/7CsRnn5u8BJ5LSwgLQc+EwInzkxtf5V0iRbxx0SquBbWLRFdjJBe
 TSIPYRjh9LZurYf4Z4WTjoXNAj2RiHDZgZfhU0K2iPj0ZnZxPQf7mrHCbiRNBU/F6O6p
 lFAg==
X-Gm-Message-State: AOAM530gjjzA+ig//EZJ1HTztUGk/kcnRFuRvi6J+dORv6B//1qnomas
 e0V5Ea9zGdAB7iEFdqhLvGC8/t4TpQjuFV23JmdNFQ==
X-Google-Smtp-Source: ABdhPJxWQt3yjMYSuWKONmSU3rQ4pt6tgqkHulEIhHw9fFhEGRGThw0EfZS8dZ2aVL+Wv3z1hTcsyguw7VV4nt7m6PE=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5163395ejb.407.1620317081062; 
 Thu, 06 May 2021 09:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
 <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com>
 <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
 <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
In-Reply-To: <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 17:03:33 +0100
Message-ID: <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 16:46, Eric Blake <eblake@redhat.com> wrote:
>
> On 5/6/21 10:30 AM, Warner Losh wrote:
>
> >
> > But for the real answer, I need to contact the original authors of
> > this part of the code (they are no longer involved day-to-day in
> > the bsd-user efforts) to see if this scenario is possible or not. If
> > it's easy to find out that way, we can either know this is safe to
> > do, or if effort is needed to make it safe. At present, I've seen
> > enough and chatted enough with others to be concerned that
> > the change would break proper emulation.
>
> Do we have a feel for the maximum amount of memory being used by the
> various alloca() replaced in this series?  If so, can we just
> stack-allocate an array of bytes of the maximum size needed?

In *-user the allocas are generally of the form "guest passed
us a random number, allocate that many structs/whatevers". (In this
specific bsd-user example it's the writev syscall and it's "however
many struct iovecs the guest passed".) So there is no upper limit.

The right thing to do here is probably to use g_try_malloc() and return
ENOMEM or whatever on failure. The use of alloca, at least in the
linux-user code, is purely old lazy coding based on "in practice
real world guest binaries don't allocate very many of these so
we can get away with shoving them on the stack".

thanks
-- PMM

