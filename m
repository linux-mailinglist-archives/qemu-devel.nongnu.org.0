Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B9330B0C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:26:20 +0100 (CET)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD5f-0000BQ-PN
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJD45-0007hF-QS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:24:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJD41-0003ah-U9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:24:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d13so13892244edp.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hg9ubrdsHUz45NmHy6q8CpLEczDjWqgrHQzzHuEg8oE=;
 b=MZ9tAAeFOnEblwYZdwql9n6h9uPg8wLbkj2B099vOtIgihSdMAfW3fbMs4vbQNuCEZ
 V3dw4gR8IJxRBwHX0Zjonp0EuVHNK6phmaSOnOHVFRZaJhXnYhV5rGp66GDpjNS1yu2a
 6VU1lGx7RYjT/eisk9xYg7wNqvLhhww3V6Dt6RjIloZU89L7fhcrmiHx9rlSNTsFgzrG
 BsL1AiDnjdsG5ugQ2JfAPAveAEbLE00Qm0vXWQS1OO3dYq2Oe/Wnlr3FWsV6o82NAEQ5
 lZ1YVtQaBOr3rAIXM1v9Zj8B7uGKciqRYkZo/4tnU9L31Ef1J3haPSHi9KoUmryFsizd
 RlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hg9ubrdsHUz45NmHy6q8CpLEczDjWqgrHQzzHuEg8oE=;
 b=Xv30RzA1XmgEwWPsFq/4uRXWjuDZd1KmDjq6SnlwfRJjM0S34hHE0hX9lrdzQolrzc
 SvQkJ3NZPnHuCR7d9YB6HsDL7bQlzQfjzvRGCAkoTjnH2k41sJJ9HM05Q7rowVfM/N3s
 dsE1p0dVVAAxpDiOnqOjeK95DDeNW5ii0je8Y/BFIKuz67rGyjrG7GptvbdQL43O9t23
 YzS3tciuxXgE3Ps1xV0gcQfL7mNG8G7kBq2Crt/d3X89oRnKAViPuuQDujn3FTed5SCl
 fGyc94wJ586diUh6tJsEWU7PUgKcXVR0KFgXGadGCPBnC2LQKzrz16FTClWvDGmUKJCK
 GZbQ==
X-Gm-Message-State: AOAM533pbtuLEVlW1OXnGBZt1xkDc+SS9fIa2WwLCXFLXIRogy0JpUH4
 zlHl2RNCLZCpBz0drbvrs9zoPYmtHA3BwoHk2Ui32nbMKJU=
X-Google-Smtp-Source: ABdhPJwmN0nmXfCxDUBJxclJiz1GGVSbmICjuy+MuhtCsweeXTG5zcmN7772cKSjlkcfSkYM+Q5duk+R28b01055QWE=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr20893779edu.100.1615199076096; 
 Mon, 08 Mar 2021 02:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
In-Reply-To: <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 10:24:19 +0000
Message-ID: <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
>
> On 07/03/2021 16.56, Warner Losh wrote:
> > The FreeBSD project has a number of enhancements to bsd-user. Add myself
> > as maintainer and Kyle Evans as a reviewer. Also add our github repo.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   MAINTAINERS | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 26c9454823..ec0e935038 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2896,9 +2896,12 @@ F: thunk.c
> >   F: accel/tcg/user-exec*.c
> >
> >   BSD user
> > -S: Orphan
> > +M: Warner Losh <imp@bsdimp.com>
> > +R: Kyle Evans <kevans@freebsd.org>
> > +S: Maintained
> >   F: bsd-user/
> >   F: default-configs/targets/*-bsd-user.mak
> > +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
>
> BSD is not really my home turf, but since nobody else picked this up and I
> plan to send a pull request for a bunch of patches anyway this week, I can
> also put it into my queue.

Fine with me. (The v1 was in my to-review queue, but I'm currently
running somewhat behind on processing patches.)

-- PMM

