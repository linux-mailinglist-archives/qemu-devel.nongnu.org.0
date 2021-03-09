Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2313330F7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:33:51 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjzB-0001j6-S6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJjnU-0003u5-Em; Tue, 09 Mar 2021 16:21:44 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:45152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJjnS-0007YR-K9; Tue, 09 Mar 2021 16:21:44 -0500
Received: by mail-io1-f50.google.com with SMTP id a7so15515367iok.12;
 Tue, 09 Mar 2021 13:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPXDJIsTtMERCHgPlWpG+kNRPVUVDmPUcq4HuHCiKVw=;
 b=TytJiFqVqjL5UahEXTe41+6xmyDMrmIwcggVkkfiSfIxQzn9GQR6qtl7jCcF89I9nr
 nfH/TL1bxYNRyVdj+Gc8hqAk0/AJbffLH5J3M3tMuZo+Hi4k4B6mw50GHAIplkmzwSZw
 cwpx2rUV9yHxnGg+IgTT8V2AeERg4Pl6mH+rUDhDUg8I0OrmQoLiTT9OkzeD7OT6iG/0
 jKcQT1GXxGmJIM9aZMb6u6Sz2QkkdEnZaSS/+GZ93y41tyad89vKbdBfOotyn+JbOL1e
 tqqjX+XHG7yQ4UQoy/TsHrKlIsjLtBf7F3JtEesrgnTcQoE/qNcmIsh9rMYWq3LVudbD
 STCg==
X-Gm-Message-State: AOAM532xHMM5RiO8eb44tM+7dWe5zMGQ+41mixONYvQ5BDLCLnZxUON1
 +ikRvsXsX0HJvt5L/klEJpMpYWWFVv0=
X-Google-Smtp-Source: ABdhPJz+jeM3AfA3gz3Zz7GWQrOTTzfgDN1xRaH98oCzHc/nO0cxyj8o9lXbj53Q5lcisMcmy7PcLw==
X-Received: by 2002:a05:6602:82:: with SMTP id h2mr78304iob.20.1615324900527; 
 Tue, 09 Mar 2021 13:21:40 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id a16sm965468ild.82.2021.03.09.13.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 13:21:40 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id b5so13507534ilq.10;
 Tue, 09 Mar 2021 13:21:39 -0800 (PST)
X-Received: by 2002:a05:6e02:1c2c:: with SMTP id
 m12mr108835ilh.173.1615324899791; 
 Tue, 09 Mar 2021 13:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app>
 <YEeWimKd1QVd176N@stefanha-x1.localdomain>
 <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
In-Reply-To: <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 9 Mar 2021 13:21:29 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAdKg2_8KNnM89v5XWf8=RJ+gi4HzgyySOYEROtYxU6rw@mail.gmail.com>
Message-ID: <CA+E+eSAdKg2_8KNnM89v5XWf8=RJ+gi4HzgyySOYEROtYxU6rw@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.50; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 10:24 AM Joelle van Dyne <j@getutm.app> wrote:
>
> On Tue, Mar 9, 2021 at 7:38 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> > > iOS does not support ucontext natively for aarch64 and the sigaltstack is
> > > also unsupported (even worse, it fails silently, see:
> > > https://openradar.appspot.com/13002712 )
> > >
> > > As a workaround we include a library implementation of ucontext and add it
> > > as a build option.
> > >
> > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > ---
> > >  configure                 | 21 ++++++++++++++++++---
> > >  meson.build               | 12 +++++++++++-
> > >  util/coroutine-ucontext.c |  9 +++++++++
> > >  .gitmodules               |  3 +++
> > >  MAINTAINERS               |  6 ++++++
> > >  meson_options.txt         |  2 ++
> > >  subprojects/libucontext   |  1 +
> > >  7 files changed, 50 insertions(+), 4 deletions(-)
> > >  create mode 160000 subprojects/libucontext
> > >
> > > diff --git a/configure b/configure
> > > index 34fccaa2ba..5f225894a9 100755
> > > --- a/configure
> > > +++ b/configure
> > > @@ -1773,7 +1773,7 @@ Advanced options (experts only):
> > >    --oss-lib                path to OSS library
> > >    --cpu=CPU                Build for host CPU [$cpu]
> > >    --with-coroutine=BACKEND coroutine backend. Supported options:
> > > -                           ucontext, sigaltstack, windows
> > > +                           ucontext, libucontext, sigaltstack, windows
> >
> > This approach mixes the concept of the coroutine backend (ucontext,
> > sigaltstack, etc) with the optional libucontext library dependency.
> >
> > libucontext is not a coroutine backend. The patch had to introduce
> > $coroutine_impl in addition to $coroutine in order to work around this.
> > Let's avoid combining these two independent concepts into
> > --with-coroutine=.
> >
> > I suggest treating libucontext as an optional library dependency in
> > ./configure with explicit --enable-libucontext/--disable-libucontext
> > options. Most of the time neither option will be provided by the user
> > and ./configure should automatically decide whether libucontext is
> > needed or not.
> >
> > > +case $coroutine in
> > > +libucontext)
> > > +  git_submodules="${git_submodules} subprojects/libucontext"
> > > +  mkdir -p libucontext
> >
> > Why is this mkdir necessary?
>
> That is a typo, will fix.
>
> Thanks to all the feedback in this thread. I will shelve this patchset
> for now and see if it's possible to fix ucontext on Darwin. Or if we
> go with gcoroutine that would work as well. Either way it seems like
> this isn't ready yet.
>
> -j

The following is enough to get ucontext working on macOS 11 (Apple
seems to have fixed it when they added ARM64 support for M1 Macs).
However, ucontext still does not work (no symbols) on iOS so there's
not much point in switching from sigaltstack.

-j

diff --git a/configure b/configure
index a2736ecf16..042f4e87a5 100755
--- a/configure
+++ b/configure
@@ -774,7 +774,8 @@ Darwin)
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
-  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
+  # _XOPEN_SOURCE and _DARWIN_C_SOURCE needed for ucontext
+  QEMU_CFLAGS="-D_XOPEN_SOURCE=500 -D_DARWIN_C_SOURCE
-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
 ;;
 SunOS)
   solaris="yes"
@@ -4486,17 +4487,15 @@ fi
 # specific one.

 ucontext_works=no
-if test "$darwin" != "yes"; then
-  cat > $TMPC << EOF
+cat > $TMPC << EOF
 #include <ucontext.h>
 #ifdef __stub_makecontext
 #error Ignoring glibc stub makecontext which will always fail
 #endif
 int main(void) { makecontext(0, 0, 0); return 0; }
 EOF
-  if compile_prog "" "" ; then
-    ucontext_works=yes
-  fi
+if compile_prog "" "" ; then
+  ucontext_works=yes
 fi

 if test "$coroutine" = ""; then

