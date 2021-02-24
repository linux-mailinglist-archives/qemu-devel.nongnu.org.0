Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133AE323802
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 08:40:33 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEome-0006CS-3E
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 02:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEolB-0005iE-Gk
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:39:01 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEol9-0008Vz-6k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:39:01 -0500
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lEol7-0006ze-Ql
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:38:57 +0000
Received: by mail-qk1-f198.google.com with SMTP id y79so1034617qka.23
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 23:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IaCPotSaq2RdELvuM6MnXfXDRFNGrYVDDvi/e1m1Gr8=;
 b=CHDw4kNB7bUnv8uqlumtMcym6I+0y8ubR7nKSTxWwYhA0BpUORsyT4OdAaw2uBrYZM
 8V+Xad0FMiR3Lr7BYanqainngcdLf6hzF8fYwR0D/vu7+rBp4rglnL2PHYjABDpUBywB
 tQrMqYqfDdnPzUQ6skQnSWPvZY1QLSOQkMyMAzj+z9TAVdpSGtEXYyAWUYCcPOGwTEVV
 Ksj221H8u8H65DZ2Yea3o1SvB+IFSuuJ2YI4e5BY13GvkWLzFIYZ+mSTU9HPuws+dlik
 DcgYSaVZoX10B0zCPdzmpToUL7jvNJrSgzGrgshA79F+FHrkIkux6wEI8eErq5Sp9YPw
 j3Mw==
X-Gm-Message-State: AOAM530bOa/VoW5QZMOaD9qMhNETLa70Awm2C/4WJiNaxHHuZaosQlQd
 i8wRAD8syF6oTRv12TFjWKhyig7ZG/lHSYgRNwd8J8QK5T2mK+Wb1kEZn/6+4Bg9g9u2yK5Oua3
 jveeWaInz5+S+tDxnu6+JdTeRG5MlR3Z2PalHfZY6are9pReA
X-Received: by 2002:a05:622a:93:: with SMTP id
 o19mr28587517qtw.336.1614152336687; 
 Tue, 23 Feb 2021 23:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVsEL/bShz2XMJ7LTLLByAlcoTb+pI2taVBW3/bH2xitJRdqIljLD4kUES6GnLEm9lmML1EkO0S2fPUOLVQSc=
X-Received: by 2002:a05:622a:93:: with SMTP id
 o19mr28587505qtw.336.1614152336196; 
 Tue, 23 Feb 2021 23:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
In-Reply-To: <YDUoX0DZz6jcxjVy@redhat.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Wed, 24 Feb 2021 08:38:30 +0100
Message-ID: <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=christian.ehrhardt@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 5:12 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Feb 23, 2021 at 03:43:48PM +0000, Peter Maydell wrote:
> > On Tue, 23 Feb 2021 at 15:03, Christian Ehrhardt
> > <christian.ehrhardt@canonical.com> wrote:
> > >
> > > glib2.0 introduced a change in 2.67.3 and later which triggers an
> > > issue [1] for anyone including it's headers in a "extern C" context
> > > which a few files in disas/* do. An example of such an include chain
> > > and error look like:
> > >
> > > ../../disas/arm-a64.cc
> > > In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
> > >                  from /usr/lib/x86_64-linux-gnu/glib-2.0/include/glib=
config.h:9,
> > >                  from /usr/include/glib-2.0/glib/gtypes.h:32,
> > >                  from /usr/include/glib-2.0/glib/galloca.h:32,
> > >                  from /usr/include/glib-2.0/glib.h:30,
> > >                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/glib-compat=
.h:32,
> > >                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/qemu/osdep.=
h:126,
> > >                  from ../../disas/arm-a64.cc:21:
> > > /usr/include/c++/10/type_traits:56:3: error: template with C linkage
> > >    56 |   template<typename _Tp, _Tp __v>
> > >       |   ^~~~~~~~
> > > ../../disas/arm-a64.cc:20:1: note: =E2=80=98extern "C"=E2=80=99 linka=
ge started here
> > >    20 | extern "C" {
> > >       | ^~~~~~~~~~
> > >
> > > To fix that move the include of osdep.h out of that section. It was a=
dded
> > > already as C++ fixup by e78490c44: "disas/arm-a64.cc: Include osdep.h=
 first".
> > >
> > > [1]: https://gitlab.gnome.org/GNOME/glib/-/issues/2331
> >
> > I'm not convinced by this as a fix, though I'm happy to be corrected
> > by somebody with a fuller understanding of C++. glib.h may be supposed
> > to work as a C++ header, but osdep.h as a whole is definitely a C heade=
r,
> > so I think it ought to be inside 'extern C'; and it has to be
> > the first header included; and it happens to want to include glib.h.
> >
> > Fixing glib.h seems like it would be nicer, assuming they haven't
> > already shipped this breakage.

They have already shipped this. And in the linked issue and from there
MR discussions
you'll find that everyone acknowledges that the "error" is in the
consuming projects
and that glib upstream is rejecting to fix it for e.g. the argument of
backward compatibility.

> Failing that, does it work to do:
>
> This was raised in Fedora and upstream GLib already
>
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1935
> https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.o=
rg/thread/J3P4TRHLWNDIKXF76OLYZNAPTABCZ3U5/#7LXFUDBBBIT23FE44QJYWX3I7U4EHW6=
M
>
> The key comment there is this one:
>
>   "Note that wrapping the header include in an extern declaration violate=
s
>    C++ standard requirements.  ("A translation unit shall include a heade=
r
>    only outside of any declaration or definition", [using.headers]/3)"
>
> IOW, if we need to make osdep.h safe to use from C++, then we
> need to put the 'extern "C" { ... }'  bit in osdep.h itself,
> not in the things which include it.
>
> >
> > /*
> >  * glib.h expects to be included as a C++ header if we're
> >  * building a C++ file, but osdep.h and thus glib-compat.h are
> >  * C headers and should be inside an "extern C" block.
> >  */
> > #ifdef __cplusplus
> > extern "C++" {
> > #include <glib.h>
> > #if defined(G_OS_UNIX)
> > #include <glib-unix.h>
> > #endif
> > }
> >
> > in include/glib-compat.h ?
>
> That'd be even worse.
>
> We need to make headers that need to be used from C++ code follow
> the pattern:
>
>     #include <foo1>
>     #include <foo2>
>     #include <foo3>
>     ...all other includs..
>
>     extern "C" {
>         ..
>         only the declarations, no #includes
>         ...
>     };

While I can follow the words and always awesome explanations by Daniel,
I must admit that I'm a bit lost at what a v2 of this could look like.

osdep.h as of today unfortunately isn't as trivial as 1. include 2.
declarations.
There are late includes deep in cascading ifdef's and we all know that "jus=
t
moving includes around for the above fix to work in an easy way" in headers
will likely (maybe even silently) break things.

So I wonder is this going to become a massive patch either moving a lot or
adding many extern C declarations all over the place in osdep-h? Or did I
just fail to see that there is an obviously better approach to this?

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


--=20
Christian Ehrhardt
Staff Engineer, Ubuntu Server
Canonical Ltd

