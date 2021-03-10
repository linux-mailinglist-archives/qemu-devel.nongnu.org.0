Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDA334333
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:38:51 +0100 (CET)
Received: from localhost ([::1]:48000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1rG-0006pk-HA
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lK1lD-0002Zv-H3; Wed, 10 Mar 2021 11:32:36 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:33940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lK1lB-0005OB-L1; Wed, 10 Mar 2021 11:32:35 -0500
Received: by mail-io1-f49.google.com with SMTP id o11so18614712iob.1;
 Wed, 10 Mar 2021 08:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nGoz51odQdJ1ye5K2BBGVryu90Vwpk1hMQTOhYqbdlw=;
 b=Jf38IjFi6AQjSBoCfH7RNPlK7BLVjvQKudrQlAV2huGfwGaVPRCHyj40behpm4LiLx
 xx3wZjUwt3rKNajTascF32Ro3BjbKZ6s6gHL7m+w3nKWKCZdcnmjlzMnYm2+F77mSyM7
 /MYRlIz2qF/IDAjTz40VUDIxZ10MITJYbx68r6rNAkHbzfhXDkhJoMSUZW7j+6uemHHr
 5eB9Ab3GZOn8UXyz+8332tnLKvqrKTmbUMkOuvhvAhGwom1xKIKtcmiw6kLVN62eFFJ2
 0WH/5RIDueLKEBtz3qQzmuzUYidyVfZ5hj1UatvC1FSR2c1qt88rGbPHp6cB0ZLaof7p
 2y1w==
X-Gm-Message-State: AOAM533GAle3d3q4Ny7QqZnf8w7ctWQbFt17t9+e8XTZdH+iUSXldC4W
 0NyNr3uTX7aYaRhv32x65xmGhB370v4=
X-Google-Smtp-Source: ABdhPJzUAeUsatd7Ddgykz5zoG/4zXXV1fL2nOpqy7VkeY3EzWsvlHSDIXCfm6NPLPLf/UIiGlPYkg==
X-Received: by 2002:a6b:7302:: with SMTP id e2mr2878147ioh.106.1615393950061; 
 Wed, 10 Mar 2021 08:32:30 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id i67sm55654ioa.3.2021.03.10.08.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:32:29 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id y20so247700iot.4;
 Wed, 10 Mar 2021 08:32:29 -0800 (PST)
X-Received: by 2002:a05:6638:91:: with SMTP id
 v17mr3663311jao.69.1615393949276; 
 Wed, 10 Mar 2021 08:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app>
 <YEeWimKd1QVd176N@stefanha-x1.localdomain>
 <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
 <CA+E+eSAdKg2_8KNnM89v5XWf8=RJ+gi4HzgyySOYEROtYxU6rw@mail.gmail.com>
 <YEiRlrCo40oQlNih@redhat.com>
In-Reply-To: <YEiRlrCo40oQlNih@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Wed, 10 Mar 2021 08:32:18 -0800
X-Gmail-Original-Message-ID: <CA+E+eSArTseWuR2OtRP-5gO6pkpTSmER8WFdppEOeZGdjh4kDg@mail.gmail.com>
Message-ID: <CA+E+eSArTseWuR2OtRP-5gO6pkpTSmER8WFdppEOeZGdjh4kDg@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.49; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Joelle van Dyne <j@getutm.app>, "open list:raw" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Good point, I only ran the PC BIOS but it did time out of 56 tests.

-j

On Wed, Mar 10, 2021 at 1:30 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Mar 09, 2021 at 01:21:29PM -0800, Joelle van Dyne wrote:
> > On Tue, Mar 9, 2021 at 10:24 AM Joelle van Dyne <j@getutm.app> wrote:
> > >
> > > On Tue, Mar 9, 2021 at 7:38 AM Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > > >
> > > > On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> > > > > iOS does not support ucontext natively for aarch64 and the sigalt=
stack is
> > > > > also unsupported (even worse, it fails silently, see:
> > > > > https://openradar.appspot.com/13002712 )
> > > > >
> > > > > As a workaround we include a library implementation of ucontext a=
nd add it
> > > > > as a build option.
> > > > >
> > > > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > > > ---
> > > > >  configure                 | 21 ++++++++++++++++++---
> > > > >  meson.build               | 12 +++++++++++-
> > > > >  util/coroutine-ucontext.c |  9 +++++++++
> > > > >  .gitmodules               |  3 +++
> > > > >  MAINTAINERS               |  6 ++++++
> > > > >  meson_options.txt         |  2 ++
> > > > >  subprojects/libucontext   |  1 +
> > > > >  7 files changed, 50 insertions(+), 4 deletions(-)
> > > > >  create mode 160000 subprojects/libucontext
> > > > >
> > > > > diff --git a/configure b/configure
> > > > > index 34fccaa2ba..5f225894a9 100755
> > > > > --- a/configure
> > > > > +++ b/configure
> > > > > @@ -1773,7 +1773,7 @@ Advanced options (experts only):
> > > > >    --oss-lib                path to OSS library
> > > > >    --cpu=3DCPU                Build for host CPU [$cpu]
> > > > >    --with-coroutine=3DBACKEND coroutine backend. Supported option=
s:
> > > > > -                           ucontext, sigaltstack, windows
> > > > > +                           ucontext, libucontext, sigaltstack, w=
indows
> > > >
> > > > This approach mixes the concept of the coroutine backend (ucontext,
> > > > sigaltstack, etc) with the optional libucontext library dependency.
> > > >
> > > > libucontext is not a coroutine backend. The patch had to introduce
> > > > $coroutine_impl in addition to $coroutine in order to work around t=
his.
> > > > Let's avoid combining these two independent concepts into
> > > > --with-coroutine=3D.
> > > >
> > > > I suggest treating libucontext as an optional library dependency in
> > > > ./configure with explicit --enable-libucontext/--disable-libucontex=
t
> > > > options. Most of the time neither option will be provided by the us=
er
> > > > and ./configure should automatically decide whether libucontext is
> > > > needed or not.
> > > >
> > > > > +case $coroutine in
> > > > > +libucontext)
> > > > > +  git_submodules=3D"${git_submodules} subprojects/libucontext"
> > > > > +  mkdir -p libucontext
> > > >
> > > > Why is this mkdir necessary?
> > >
> > > That is a typo, will fix.
> > >
> > > Thanks to all the feedback in this thread. I will shelve this patchse=
t
> > > for now and see if it's possible to fix ucontext on Darwin. Or if we
> > > go with gcoroutine that would work as well. Either way it seems like
> > > this isn't ready yet.
> > >
> > > -j
> >
> > The following is enough to get ucontext working on macOS 11 (Apple
> > seems to have fixed it when they added ARM64 support for M1 Macs).
> > However, ucontext still does not work (no symbols) on iOS so there's
> > not much point in switching from sigaltstack.
> >
> > -j
> >
> > diff --git a/configure b/configure
> > index a2736ecf16..042f4e87a5 100755
> > --- a/configure
> > +++ b/configure
> > @@ -774,7 +774,8 @@ Darwin)
> >    audio_possible_drivers=3D"coreaudio sdl"
> >    # Disable attempts to use ObjectiveC features in os/object.h since t=
hey
> >    # won't work when we're compiling with gcc as a C compiler.
> > -  QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
> > +  # _XOPEN_SOURCE and _DARWIN_C_SOURCE needed for ucontext
> > +  QEMU_CFLAGS=3D"-D_XOPEN_SOURCE=3D500 -D_DARWIN_C_SOURCE
> > -DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
> >  ;;
> >  SunOS)
> >    solaris=3D"yes"
> > @@ -4486,17 +4487,15 @@ fi
> >  # specific one.
> >
> >  ucontext_works=3Dno
> > -if test "$darwin" !=3D "yes"; then
> > -  cat > $TMPC << EOF
> > +cat > $TMPC << EOF
> >  #include <ucontext.h>
> >  #ifdef __stub_makecontext
> >  #error Ignoring glibc stub makecontext which will always fail
> >  #endif
> >  int main(void) { makecontext(0, 0, 0); return 0; }
> >  EOF
> > -  if compile_prog "" "" ; then
> > -    ucontext_works=3Dyes
> > -  fi
> > +if compile_prog "" "" ; then
> > +  ucontext_works=3Dyes
> >  fi
> >
> >  if test "$coroutine" =3D ""; then
>
> I have tried doing this before, and while it was enough for the compile
> to succeed, I found that tests failed / hung when running the macOS CI
> jobs.  Did you actually try running tests with this change directly,
> and/or under Cirrus CI ?
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

