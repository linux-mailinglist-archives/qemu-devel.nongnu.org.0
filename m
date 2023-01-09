Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC85662F98
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExJX-0000ib-HS; Mon, 09 Jan 2023 13:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pExJV-0000iH-BU; Mon, 09 Jan 2023 13:56:05 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pExJT-0007Gl-7Q; Mon, 09 Jan 2023 13:56:04 -0500
Received: by mail-lj1-x22b.google.com with SMTP id p25so3695937ljn.12;
 Mon, 09 Jan 2023 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fDzuBBVw5pb/ik8wTopy/kRBtIKZu4/jsXs++/QUKA=;
 b=XMnvqLnj+kl6ybaAheslWJRUf1rwXmkrMZIJnKDGIqrohzdPc3eoR1ybQkUIT3Xnyp
 XrkNnkQrmTqaUDOV0DX0ToLu9w/TNPZirk5H/un1PwnyUWgDjEheurul4ofwzGuTagGu
 j29u/otjjRWD9Yv+J2rZcQgi6SDZ2ReDe+MUYxsxPRXD/H6cUSbW4VaYDzpUQMegzOCZ
 EKVMwl2qFT6Xi//va/wX4j/4YdU1e8vyHmnb38LI/JcQRtRiyOYN0L2iYJgDYreQ7O/g
 PQ93aDg3Lm0XWaQ1vSxY95fxU5ZPY+NAOEPSdmEEo6kIgtrmiRvbi/B+4TiOsrGzuUyB
 B+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fDzuBBVw5pb/ik8wTopy/kRBtIKZu4/jsXs++/QUKA=;
 b=ojanoDUbdI6MTo2F72UX+4XkR1nZzS/ApztDT4NHQZnVuJgul7H5bLCRFRCv/0e7eh
 sFUn80IHnnZ2vPtOFdtW8s5uGMM7H6kmQu8PUcQXuqD5LNSaioU0Y0nkNHfmmHv9lT9y
 7sH+EqV4Mqn3S4rq44fx0g2+uN1LJB4KP1iaoBr6lf0lks9Do/A2cFFrRBdtMtBTOzee
 U29t5j/mvI/JUYwcgrIXuDnJs7WxRzIwsi90VMYsqIL9ItbdD8ZWzXdsK8YQ/bs/GewX
 WZyl5HqLIquJgEKTGghwh52+f1afFEYtPTF4i9c1k00o30rXAQQSQF6hg/rjIur/SkXo
 8TJg==
X-Gm-Message-State: AFqh2krQ/nh2hQjJ61kTlN3MGcqbI7UxfUHsrFhggj4GyGfx2ziL9abo
 EunWNkKObenhEDhz8UuUPRnX5nDVR4jGV2n4ZoQ=
X-Google-Smtp-Source: AMrXdXtSRjyJt37J34pGfOx7xUAhLmEj/qgUk3OqGj9JVSZeQHNVgw8gY5mGTJwRGyJ0u4vy1V5lnDee6cxMfrW8WLo=
X-Received: by 2002:a05:651c:1949:b0:27a:51d:274c with SMTP id
 bs9-20020a05651c194900b0027a051d274cmr2776674ljb.94.1673290560456; Mon, 09
 Jan 2023 10:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
 <20230109181447.235989-5-marcandre.lureau@redhat.com>
 <CAFEAcA_YHvJWJMwxSQAQRphCgDNOSf2arbqMY8_T7VCByXCVsA@mail.gmail.com>
In-Reply-To: <CAFEAcA_YHvJWJMwxSQAQRphCgDNOSf2arbqMY8_T7VCByXCVsA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 9 Jan 2023 22:55:48 +0400
Message-ID: <CAJ+F1CJUDo=r-OX_xbe6Q7MYHLZ_Q8pb0NbWVHJgfi2LgEVsYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] meson: replace Perl usage with Python
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, David Hildenbrand <david@redhat.com>,
 kraxel@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi

On Mon, Jan 9, 2023 at 10:52 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Mon, 9 Jan 2023 at 18:16, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Let's try to remove Perl usage during build time.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/qapi-schema/meson.build | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.bu=
ild
> > index 9dfe98bc9a..d85b14f28c 100644
> > --- a/tests/qapi-schema/meson.build
> > +++ b/tests/qapi-schema/meson.build
> > @@ -259,22 +259,23 @@ if build_docs
> >    # Fix possible inconsistency in line endings in generated output and
> >    # in the golden reference (which could otherwise cause test failures
> >    # on Windows hosts). Unfortunately diff --strip-trailing-cr
> > -  # is GNU-diff only. The odd-looking perl is because we must avoid
> > +  # is GNU-diff only. The odd-looking python is because we must avoid
> >    # using an explicit '\' character in the command arguments to
> >    # a custom_target(), as Meson will unhelpfully replace it with a '/'
> >    # (https://github.com/mesonbuild/meson/issues/1564)
>
> This comment is not applicable to your Python rewrite of this.

To my interpretation, the comment still applies. I would have written
a much simpler sed invocation if we were allowed to use backslashes.

> It's talking about the way that the Perl code has to create
> a variable with a '\r' value in a weird way (using "$x =3D chr 13")
> and then do a substitution using that variable, rather than the obvious
> direct s// command ("s/\r//"), to work around a meson bug if the code
> has a literal \ character in it. Your python has no '\'s in it.
>
> > +  remove_cr =3D [python, '-c', 'import sys;[sys.stdout.write(line.repl=
ace(chr(13), "")) for line in sys.stdin]']
> >    qapi_doc_out_nocr =3D custom_target('QAPI rST doc newline-sanitized'=
,
> >                                      output: ['doc-good.txt.nocr'],
> >                                      input: qapi_doc_out[0],
> >                                      build_by_default: true,
> > -                                    command: ['perl', '-pe', '$x =3D c=
hr 13; s/$x$//', '@INPUT@'],
> > +                                    command: [remove_cr, '@INPUT@'],
> >                                      capture: true)
> >
> >    qapi_doc_ref_nocr =3D custom_target('QAPI rST doc reference newline-=
sanitized',
> >                                      output: ['doc-good.ref.nocr'],
> >                                      input: files('doc-good.txt'),
> >                                      build_by_default: true,
> > -                                    command: ['perl', '-pe', '$x =3D c=
hr 13; s/$x$//', '@INPUT@'],
> > +                                    command: [remove_cr, '@INPUT@'],
> >                                      capture: true)
> >
> >    test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_d=
oc_out_nocr[0]],
> > --
> > 2.39.0
>
> Maybe we should consider putting the Python into a script in
> scripts/ ? "Remove \r characters" is pretty trivial, but on the
> other hand I think this is the only Meson custom_target() we
> have where we directly invoke a script interpreter with a
> bit of inline script, and inline bits of script doesn't really
> seem to be a style Meson encourages (unlike Make).

It's a quite simple one-liner, and I hope we can drop it when meson
fix the mentionned bug. But I am fine putting it in a script, if that
can help.

--=20
Marc-Andr=C3=A9 Lureau

