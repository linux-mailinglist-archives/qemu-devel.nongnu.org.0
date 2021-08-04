Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079623E0995
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:44:32 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNkd-00007X-3u
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBNjM-0007rg-Fy
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:43:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBNjK-0003wg-4h
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:43:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id go31so5659370ejc.6
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 13:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95OlW5Ou68JiESRkZh0fhkHDMMYZKMsNMzGc7nfBBP0=;
 b=xmdDOEInUk1rIC771h77TiBMzraFl/AhdTia+EeS4uUw+J5Px9urYugkChzmc2WInH
 9ZJmERd1kY2/rM5aV9y4qFPdhMegHyxi/oRa/B9JAU8JA8MwgohDzEnikvJSJRZmGmgM
 P4R56FtASBFkLKFwh1TMxE+djRGkzr96dmvb6BBYjBxrC+IIpsp7evmKW/ARYBH4Q8Oo
 mdThM+1DcySxeHbYoIXmXUCikzxaQ++WCDOlLjOFBLxFfGZOqSoxr/22BLlbZqLWwuQ+
 GwhTYYL/C9TKavHNEJDEx96RQn/j6GgiqhFMCEeYB9E1haYCzgPU8vttH2ptBRpOj69Z
 KXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95OlW5Ou68JiESRkZh0fhkHDMMYZKMsNMzGc7nfBBP0=;
 b=KqCXVwSi7cvZ/aCPHj+woSCa6oTwAbbJwav7BLysv59yM2MJSwXio8YMNiR9zCBQ8n
 eKIrWSs0QqeQ8R/tf7BNCcHKG5ThDjtctiBzl8ACq5TRSzLljGGqCRDS7/KWF0WzyCYz
 bleWlyk6pHvBu/YIpzUw23JJuAXxpLtadVFT0MbE/wXubecgOomfT9b8Y05Xpg9DMQyl
 mWhtyi/Kon+0SnEIZ4JhT+9/+iJkR4qBZzj7U43WSbn5L+zUeaTg7GV8r2fbnpOBf6Wa
 r9DrxOpWK+13wJAMe6MRFBXgGain6eJUBsXYArQ2sVs5TpWyyRrKmFyT05LEntjwkBMR
 7FzA==
X-Gm-Message-State: AOAM530iV+Y/mPChrhXG2P7LVF/7/62/2y14jNnAP6r1ug7YpjO8ZkX6
 XpSCnv98agLBuAJ4WhpMVsWuAC2+Iex/asoOobxDrw==
X-Google-Smtp-Source: ABdhPJyhLF3M9KyaLVMmVYmQUyt2dg7FgG4opX18tHirRXnWvNCE5f1Ha9TVe2nreASmxOhkTWobwj1Y6uC9QoXRxy0=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr1055088ejb.56.1628109787845; 
 Wed, 04 Aug 2021 13:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
 <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
 <20210804203116.nawhr7px2zhkpzxk@habkost.net>
In-Reply-To: <20210804203116.nawhr7px2zhkpzxk@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 21:42:24 +0100
Message-ID: <CAFEAcA-cJe9NRVMJ6JFyEs+AJV6Wo8MfT+_1P4coWGVjfzLzVg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 21:31, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Mon, Aug 02, 2021 at 01:14:57PM +0100, Peter Maydell wrote:
> > On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > > index e5fe3597cd8..9c1be5d7fc2 100644
> > > --- a/docs/devel/qom.rst
> > > +++ b/docs/devel/qom.rst
> > > @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
> > >  ===========================
> > >
> > >  .. highlight:: c
> > > +.. default-role:: any
> > >
> > >  The QEMU Object Model provides a framework for registering user creatable
> > >  types and instantiating objects from those types.  QOM provides the following
> > > @@ -42,8 +43,8 @@ features:
> > >
> > >     type_init(my_device_register_types)
> > >
> > > -In the above example, we create a simple type that is described by #TypeInfo.
> > > -#TypeInfo describes information about the type including what it inherits
> > > +In the above example, we create a simple type that is described by `TypeInfo`.
> > > +`TypeInfo` describes information about the type including what it inherits
> >
> > I've just gone through all of docs/ finding the places where we had `foo` and
> > probably meant ``foo``, so please don't add any new ones. I would suggest
> > that you either use the ``double-backtick`` syntax to render as fixed-width
> > font, or use an explicit role tag so readers of the rST source can tell that
> > that's what you meant to use, ie avoid "default-role".
>
> I don't understand why that would be a reason to not use
> default-role.  With default-role, we get an error when misusing
> `foo`.  Without default-role, misuse won't be detected at all
> (except by manual inspection).

Ah, I didn't realize that we got an error if we set the default-role
to 'any'. That certainly makes it nicer than the default default
of 'cite'.

Is there a sensible default-role we can use as the default for the whole manual,
rather than only declaring it in individual .rst files ?  One of the
things I don't
like about the change here is that it means that `thing` in this individual .rst
file is different from `thing` in every other .rst file in our docs.

Ccing John, who I have just remembered wrote something about Sphinx roles
a few months back:
https://lore.kernel.org/qemu-devel/9fe98807-7d68-2c86-163a-af374c789401@redhat.com/

-- PMM

