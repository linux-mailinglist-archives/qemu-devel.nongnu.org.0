Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05464AE525
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:01:56 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZUh-0006e1-Bm
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHZQu-0005A9-A0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:58:00 -0500
Received: from [2a00:1450:4864:20::230] (port=37731
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHZQo-0000Mk-Ps
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:57:59 -0500
Received: by mail-lj1-x230.google.com with SMTP id z7so982970ljj.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s4lUBXb/tJlU7WpAB5hkahQmgbO8DWdLHsBf3QSzq1Y=;
 b=Zorf0W59Xzb5A3wNfhIIbCWg1TUWtHCQWtK0URxk3IjcKkor1mvjO/f/jf+V7+3PeM
 tuGdDonz5AYq/fgmhZAEqZ74Y2ts+diWYsqHYxb+pMkwLlvn6Nju3uxwOzPkWI7mjW2g
 c42/dYJZOE9EQYqLq4wZCMiWqjvULueNIhbNQKDAzw2Mvnse0DzTCSx8FqWCRrjWLfzw
 WODphtEsUumBuIuZHGmWGnfJbP2Ys0MHcG6fcyyaxJd9S5An49enc43MTEuMItFN49vi
 RTEc7sLbSTHyvRYXH0Iy2/2HOgwW0h67FWodTO8R6QUeHZOgU1ZLDcO0JXmwwJQ+iRmX
 Uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4lUBXb/tJlU7WpAB5hkahQmgbO8DWdLHsBf3QSzq1Y=;
 b=HwmjYkLCU5aLnKazsuGnxyzhtg342xf6xsejBKk6T2UDEHqNv/VjuykvOltcS/8+zY
 Yba8g8xfeQbEC+BQnt0L6jtuWHdY3jfKkoY4D8Yao0bWVE2LqjMCi6xeSZAKeDPVpDEX
 kMdrjF8+56UM4hVXQ3zZ6p0oQuj4xDLGyAopeQ+WVzBnFQ3JMqzIa+S99dBefFl7s6Zw
 qVeg8HFEl0Yn+4twyoyo3w3stInyxAe8Pbxi8agmlsnlqXL64loP8tW9etxNaYrn6/cD
 q4KyFc+yRn4sIZPelltFpi2Yx5Se5QMvIvgvZ19s3B3t8zyM/mqEjKTWM7NBpieFg7Jq
 y5zg==
X-Gm-Message-State: AOAM533yGXeNBFuX90B69ymmzNgCNIBtJkBFnJYP0Z7GLYUIdh8/KU4N
 RH6HcIPxgjsrkhm3DftTMmWZftuGQBhEtUUO+9A=
X-Google-Smtp-Source: ABdhPJwEhEADid5s3S19QQqwnRQBFFoKalZqmY5FTVI9GWclaG+p9VJpkdLk9IKz447IGwXcfGHngl6xKjm1BW3T0iA=
X-Received: by 2002:a2e:bc11:: with SMTP id b17mr4130420ljf.74.1644361064429; 
 Tue, 08 Feb 2022 14:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV3e+WWqJrs7_fJ_xgEc99swYHBqUrY66XCrBFSsptwP5A@mail.gmail.com>
 <4809377.qIIDLkA7W8@silver> <4999355.dprqNvMIp6@silver>
In-Reply-To: <4999355.dprqNvMIp6@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 8 Feb 2022 17:57:32 -0500
Message-ID: <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000020bdae05d789a579"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000020bdae05d789a579
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 2:49 PM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Dienstag, 8. Februar 2022 19:28:21 CET Christian Schoenebeck wrote:
> > On Dienstag, 8. Februar 2022 19:04:31 CET Will Cohen wrote:
> > > On Tue, Feb 8, 2022 at 11:19 AM Will Cohen <wwcohen@gmail.com> wrote:
> > > > On Tue, Feb 8, 2022 at 11:11 AM Christian Schoenebeck <
> > > >
> > > > qemu_oss@crudebyte.com> wrote:
> > > >> On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wrote:
> > > >> > My inclination is to go with the __builtin_available(macOS 10.12,
> *)
> > > >>
> > > >> path,
> > > >>
> > > >> > if acceptable, since it partially mirrors the API_AVAILABLE macro
> > > >> > idea.
> > > >>
> > > >> I
> > > >>
> > > >> OTOH that's duplication of the ">= macOS 10.12" info, plus
> > > >> __builtin_available
> > > >> is direct use of a clang-only extension, whereas API_AVAILABLE()
> works
> > > >> (or
> > > >> more precisely: doesn't error out at least) with other compilers
> like
> > > >> GCC
> > > >> as
> > > >> well. GCC is sometimes used for cross-compilation.
> > > >>
> > > >> Moreover, I would also add an error message in this case, e.g.:
> > > >>     if (!pthread_fchdir_np) {
> > > >>
> > > >>         error_report_once("pthread_fchdir_np() is not available on
> this
> > > >>
> > > >> macOS version");
> > > >>
> > > >>         return -ENOTSUPP;
> > > >>
> > > >>     }
> > > >>
> > > >> I should elaborate why I think this is needed: you are already
> doing a
> > > >> Meson
> > > >> check for the existence of pthread_fchdir_np(), but the system where
> > > >> QEMU
> > > >> is
> > > >> compiled and the systems where the compiled binary will be running,
> > > >> might
> > > >> be
> > > >> different ones (i.e. different macOS versions).
> > > >>
> > > >> Best regards,
> > > >> Christian Schoenebeck
> > > >
> > > > Agreed, that way actually closes the edge case. Something along these
> > > > lines briefly crossed my mind during a previous version, but I
> quickly
> > > > got
> > > > passed it by assuming that the compiling entity would always be the
> > > > bottleneck, which makes no sense in hindsight, so I very much
> appreciate
> > > > that you caught this.
> > >
> > > Ah, rebuilding leads to a compiler error:
> > >
> > > ../os-posix.c:348:10: warning: address of function 'pthread_fchdir_np'
> > > will
> > > always evaluate to 'true' [-Wpointer-bool-conversion]
> > >
> > >     if (!pthread_fchdir_np) {
> > >
> > >         ~^~~~~~~~~~~~~~~~~
> > >
> > > I don't have a machine that's pre-10.12 so I can't see what the result
> is
> > > there, but this might be why the __builtin_available approach got
> taken.
> >
> > I guess that's because you are compiling QEMU with minimum deployment
> target
> > being macOS >= 10.12 already. In this case the compiler won't make
> > pthread_fchdir_np a weak link, it only does emit a weak link if you are
> > targeting macOS versions prior than the defined availablity attribute,
> > hence the address would never be NULL here and hence the compiler
> warning.
> >
> > So I guess it is okay if you just omit checking presence of
> > pthread_fchdir_np at runtime and just assume it exists.
> >
> > Added Akihiko on CC, just in case he would have something to add on this
> > macOS issue here. :)
>
> On a second thought: this case a bit special. Are we worried that
> pthread_fchdir_np() is "not yet" available on macOS, or "no longer"
> available.
> Probably both, right?
>
> So maybe it would make sense to replace the API_AVAILABLE() attribute
> directly
> with a __attribute__((weak)) attribute. Then the runtime check with the
> proposed error message would also trigger if a bleeding edge macOS version
> no
> longer has pthread_fchdir_np().
>
> Also keep in mind: there are always also the MAC_OS_X_VERSION_MIN_REQUIRED
> and
> MAC_OS_X_VERSION_MAX_ALLOWED macros to query the deployment target at
> compile
> time to wrap deployment target dependent code accordingly.
>
> On doubt you could just make some tests there by simply "inventing" a non-
> existent function.
>
> Best regards,
> Christian Schoenebeck
>

I like the idea of switching it to __attribute__((weak)). I should note
that I'm not sure that I can actually fully test this out since I'm getting
stuck with the linker noting my undefined fake function during the build,
but the idea does make logical sense to me for the future fail case and the
happy case builds again when implemented with actual pthread_fchdir_np:

[1075/2909] Linking target qemu-nbd
FAILED: qemu-nbd
cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_dylibs
-Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load
libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa
-Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load
libio.fa -fstack-protector-strong
-Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
-Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a libblockdev.fa
libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms
/usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil
-L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib -lgio-2.0
-lgobject-2.0 -lglib-2.0 -lintl -L/usr/local/Cellar/glib/2.70.3/lib
-L/usr/local/opt/gettext/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
-L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
-lgmodule-2.0 -lglib-2.0 -lintl
/usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2 -framework
CoreFoundation -framework IOKit -lcurl -L/usr/local/Cellar/glib/2.70.3/lib
-L/usr/local/opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
/usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam
Undefined symbols for architecture x86_64:
  "_pthread_fchdir_npfoo", referenced from:
      _qemu_mknodat in libblockdev.fa(os-posix.c.o)
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see
invocation)
ninja: build stopped: subcommand failed.
make[1]: *** [run-ninja] Error 1
make: *** [all] Error 2

With that caveat re testing in mind, unless there's another recommended
path forward, I think it makes sense to stick with __attribute__((weak))
and prepare v6 which incorporates this and all the other feedback from this
round.


>
> > > >> > guess it's perhaps a tradeoff between predicting the future
> unknown
> > > >> > availability of functions versus just ensuring a minimum macOS
> > > >> > version
> > > >>
> > > >> and
> > > >>
> > > >> > hoping for the best. With any luck, the distinction between the
> two
> > > >> > approaches will be moot, if we try to assume that a future macOS
> > > >> > version
> > > >> > that removes this also provides mknodat.
> > > >> >
> > > >> > On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
> > > >> >
> > > >> > qemu_oss@crudebyte.com> wrote:
> > > >> > > On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
> > > >> > > > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
> > > >> > > > <qemu_oss@crudebyte.com>
> > > >> > > >
> > > >> > > > wrote:
> > > >> > > > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> > > >> > > > > > From: Keno Fischer <keno@juliacomputing.com>
> > > >> > > > > >
> > > >> > > > > > Darwin does not support mknodat. However, to avoid race
> > > >>
> > > >> conditions
> > > >>
> > > >> > > > > > with later setting the permissions, we must avoid using
> mknod
> > > >> > > > > > on
> > > >> > > > > > the full path instead. We could try to fchdir, but that
> would
> > > >>
> > > >> cause
> > > >>
> > > >> > > > > > problems if multiple threads try to call mknodat at the
> same
> > > >>
> > > >> time.
> > > >>
> > > >> > > > > > However, luckily there is a solution: Darwin includes a
> > > >> > > > > > function
> > > >> > > > > > that sets the cwd for the current thread only.
> > > >> > > > > > This should suffice to use mknod safely.
> > > >> > > > > >
> > > >> > > > > > This function (pthread_fchdir_np) is protected by a check
> in
> > > >> > > > > > meson in a patch later in tihs series.
> > > >> > > > > >
> > > >> > > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > >> > > > > > Signed-off-by: Michael Roitzsch <
> reactorcontrol@icloud.com>
> > > >> > > > > > [Will Cohen: - Adjust coding style
> > > >> > > > > >
> > > >> > > > > >              - Replace clang references with gcc
> > > >> > > > > >              - Note radar filed with Apple for missing
> > > >> > > > > >              syscall
> > > >> > > > > >              - Replace direct syscall with
> pthread_fchdir_np
> > > >> > > > > >              and
> > > >> > > > > >
> > > >> > > > > >                adjust patch notes accordingly
> > > >> > > > > >
> > > >> > > > > >              - Move qemu_mknodat from 9p-util to osdep and
> > > >>
> > > >> os-posix]
> > > >>
> > > >> > > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > >> > > > > > ---
> > > >> > > > >
> > > >> > > > > Like already mentioned by me moments ago on previous v4
> (just
> > > >>
> > > >> echoing)
> > > >>
> > > >> > > ...
> > > >> > >
> > > >> > > > > >  hw/9pfs/9p-local.c   |  4 ++--
> > > >> > > > > >  include/qemu/osdep.h | 10 ++++++++++
> > > >> > > > > >  os-posix.c           | 34
> ++++++++++++++++++++++++++++++++++
> > > >> > > > > >  3 files changed, 46 insertions(+), 2 deletions(-)
> > > >> > > > > >
> > > >> > > > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > >> > > > > > index a0d08e5216..d42ce6d8b8 100644
> > > >> > > > > > --- a/hw/9pfs/9p-local.c
> > > >> > > > > > +++ b/hw/9pfs/9p-local.c
> > > >> > > > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext
> *fs_ctx,
> > > >> > >
> > > >> > > V9fsPath
> > > >> > >
> > > >> > > > > > *dir_path,
> > > >> > > > > >
> > > >> > > > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > > >> > > > > >
> > > >> > > > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > >> > > > > >
> > > >> > > > > > -        err = mknodat(dirfd, name, fs_ctx->fmode |
> S_IFREG,
> > > >> > > > > > 0);
> > > >> > > > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode |
> > > >>
> > > >> S_IFREG,
> > > >>
> > > >> > > > > > 0);
> > > >> > > > > >
> > > >> > > > > >          if (err == -1) {
> > > >> > > > > >
> > > >> > > > > >              goto out;
> > > >> > > > > >
> > > >> > > > > >          }
> > > >> > > > > >
> > > >> > > > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext
> *fs_ctx,
> > > >> > >
> > > >> > > V9fsPath
> > > >> > >
> > > >> > > > > > *dir_path, }
> > > >> > > > > >
> > > >> > > > > >      } else if (fs_ctx->export_flags &
> V9FS_SM_PASSTHROUGH ||
> > > >> > > > > >
> > > >> > > > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > >> > > > > >
> > > >> > > > > > -        err = mknodat(dirfd, name, credp->fc_mode,
> > > >>
> > > >> credp->fc_rdev);
> > > >>
> > > >> > > > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > >> > > > > > credp->fc_rdev);
> > > >> > > > > >
> > > >> > > > > >          if (err == -1) {
> > > >> > > > > >
> > > >> > > > > >              goto out;
> > > >> > > > > >
> > > >> > > > > >          }
> > > >> > > > > >
> > > >> > > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > >> > > > > > index d1660d67fa..f3a8367ece 100644
> > > >> > > > > > --- a/include/qemu/osdep.h
> > > >> > > > > > +++ b/include/qemu/osdep.h
> > > >> > > > > > @@ -810,3 +810,13 @@ static inline int
> > > >> > > > > > platform_does_not_support_system(const char *command)
> #endif
> > > >> > > > > >
> > > >> > > > > >  #endif
> > > >> > > > > >
> > > >> > > > > > +
> > > >> > > > > > +/*
> > > >> > > > > > + * As long as mknodat is not available on macOS, this
> > > >>
> > > >> workaround
> > > >>
> > > >> > > > > > + * using pthread_fchdir_np is needed. qemu_mknodat is
> > > >> > > > > > defined
> > > >>
> > > >> in
> > > >>
> > > >> > > > > > + * os-posix.c
> > > >> > > > > > + */
> > > >> > > > > > +#ifdef CONFIG_DARWIN
> > > >> > > > > > +int pthread_fchdir_np(int fd);
> > > >> > > > > > +#endif
> > > >> > > > >
> > > >> > > > > I would make that:
> > > >> > > > >
> > > >> > > > > #ifdef CONFIG_DARWIN
> > > >> > > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > >> > > > > #endif
> > > >> > > > >
> > > >> > > > > here and ...
> > > >> > > > >
> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t
> > > >> > > > > > mode,
> > > >> > > > > > dev_t
> > > >> > > > >
> > > >> > > > > dev);
> > > >> > > > >
> > > >> > > > > > diff --git a/os-posix.c b/os-posix.c
> > > >> > > > > > index ae6c9f2a5e..95c1607065 100644
> > > >> > > > > > --- a/os-posix.c
> > > >> > > > > > +++ b/os-posix.c
> > > >> > > > > > @@ -24,6 +24,7 @@
> > > >> > > > > >
> > > >> > > > > >   */
> > > >> > > > > >
> > > >> > > > > >  #include "qemu/osdep.h"
> > > >> > > > > >
> > > >> > > > > > +#include <os/availability.h>
> > > >> > > > > >
> > > >> > > > > >  #include <sys/wait.h>
> > > >> > > > > >  #include <pwd.h>
> > > >> > > > > >  #include <grp.h>
> > > >> > > > > >
> > > >> > > > > > @@ -332,3 +333,36 @@ int os_mlock(void)
> > > >> > > > > >
> > > >> > > > > >      return -ENOSYS;
> > > >> > > > > >
> > > >> > > > > >  #endif
> > > >> > > > > >  }
> > > >> > > > > >
> > > >> > > > > > +
> > > >> > > > > > +/*
> > > >> > > > > > + * As long as mknodat is not available on macOS, this
> > > >>
> > > >> workaround
> > > >>
> > > >> > > > > > + * using pthread_fchdir_np is needed.
> > > >> > > > > > + *
> > > >> > > > > > + * Radar filed with Apple for implementing mknodat:
> > > >> > > > > > + * rdar://FB9862426
> > > >> > > > > > (https://openradar.appspot.com/FB9862426)
> > > >> > > > > > + */
> > > >> > > > > > +#ifdef CONFIG_DARWIN
> > > >> > > > > > +
> > > >> > > > > > +int pthread_fchdir_np(int fd)
> API_AVAILABLE(macosx(10.12));
> > > >> > > > >
> > > >> > > > > ... drop the duplicate declaration of pthread_fchdir_np()
> here.
> > > >> > > >
> > > >> > > > Trying this out, it reminds me that this use of API_AVAILABLE
> in
> > > >> > >
> > > >> > > os-posix.c
> > > >> > >
> > > >> > > > relies on the added #include <os/availability.h>.
> > > >> > > >
> > > >> > > > Leaving the include out leads to:
> > > >> > > > .../include/qemu/osdep.h:820:31: error: expected function body
> > > >> > > > after
> > > >> > > > function declarator
> > > >> > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > >> > > >
> > > >> > > >                               ^
> > > >> > > >
> > > >> > > > 1 error generated.
> > > >> > > > ninja: build stopped: subcommand failed.
> > > >> > > > make[1]: *** [run-ninja] Error 1
> > > >> > > > make: *** [all] Error 2
> > > >> > > >
> > > >> > > > The admonition against modifying osdep.h's includes too much
> led
> > > >> > > > me
> > > >>
> > > >> to
> > > >>
> > > >> > > > steer away from putting it all in there. If there's no issue
> with
> > > >>
> > > >> adding
> > > >>
> > > >> > > > +#include <os/availability.h> to osdep.h, then this change
> makes
> > > >>
> > > >> sense
> > > >>
> > > >> > > > to
> > > >> > > > me.
> > > >> > >
> > > >> > > If you embed that include into ifdefs, sure!
> > > >> > >
> > > >> > > #ifdef CONFIG_DARWIN
> > > >> > > /* defines API_AVAILABLE(...) */
> > > >> > > #include <os/availability.h>
> > > >> > > #endif
> > > >> > >
> > > >> > > One more thing though ...
> > > >> > >
> > > >> > > > > > +
> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t
> > > >> > > > > > mode,
> > > >> > > > > > dev_t
> > > >> > > > >
> > > >> > > > > dev)
> > > >> > > > >
> > > >> > > > > > +{
> > > >> > > > > > +    int preserved_errno, err;
> > > >> > >
> > > >> > > pthread_fchdir_np() is weakly linked. So I guess here should be
> a
> > > >>
> > > >> check
> > > >>
> > > >> > > like:
> > > >> > >         if (!pthread_fchdir_np) {
> > > >> > >
> > > >> > >                 return -ENOTSUPP;
> > > >> > >
> > > >> > >         }
> > > >> > >
> > > >> > > Before trying to call pthread_fchdir_np() below. As already
> > > >> > > discussed
> > > >>
> > > >> with
> > > >>
> > > >> > > the
> > > >> > > Chromium [1] example, some do that a bit differently by using
> > > >> > >
> > > >> > > __builtin_available():
> > > >> > >         if (__builtin_available(macOS 10.12, *)) {
> > > >> > >
> > > >> > >                 return -ENOTSUPP;
> > > >> > >
> > > >> > >         }
> > > >> > >
> > > >> > > Which makes me wonder why they are not doing a simple NULL
> check?
> > > >> > >
> > > >> > > [1]
> > > >>
> > > >>
> https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/laun
> > > >> ch
> > > >> _
> > > >>
> > > >> > > mac.cc#110>
> > > >> > >
> > > >> > > > > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > >> > > > > > +        return -1;
> > > >> > > > > > +    }
> > > >> > > > > > +    err = mknod(filename, mode, dev);
> > > >> > > > > > +    preserved_errno = errno;
> > > >> > > > > > +    /* Stop using the thread-local cwd */
> > > >> > > > > > +    pthread_fchdir_np(-1);
> > > >> > > > > > +    if (err < 0) {
> > > >> > > > > > +        errno = preserved_errno;
> > > >> > > > > > +    }
> > > >> > > > > > +    return err;
> > > >> > > > > > +}
> > > >> > > > > > +#else
> > > >> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t
> > > >> > > > > > mode,
> > > >> > > > > > dev_t
> > > >> > > > >
> > > >> > > > > dev)
> > > >> > > > >
> > > >> > > > > > +{
> > > >> > > > > > +    return mknodat(dirfd, filename, mode, dev);
> > > >> > > > > > +}
> > > >> > > > > > +#endif
> >
> > Best regards,
> > Christian Schoenebeck
>
>
> Best regards,
> Christian Schoenebeck
>
>
>

--00000000000020bdae05d789a579
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 8, 2022 at 2:49 PM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Dienstag, 8. Februar 2022 19:28:21 CET =
Christian Schoenebeck wrote:<br>
&gt; On Dienstag, 8. Februar 2022 19:04:31 CET Will Cohen wrote:<br>
&gt; &gt; On Tue, Feb 8, 2022 at 11:19 AM Will Cohen &lt;<a href=3D"mailto:=
wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; On Tue, Feb 8, 2022 at 11:11 AM Christian Schoenebeck &lt;<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">=
qemu_oss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wro=
te:<br>
&gt; &gt; &gt;&gt; &gt; My inclination is to go with the __builtin_availabl=
e(macOS 10.12, *)<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; path,<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; if acceptable, since it partially mirrors the API_A=
VAILABLE macro<br>
&gt; &gt; &gt;&gt; &gt; idea.<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; I<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; OTOH that&#39;s duplication of the &quot;&gt;=3D macOS 1=
0.12&quot; info, plus<br>
&gt; &gt; &gt;&gt; __builtin_available<br>
&gt; &gt; &gt;&gt; is direct use of a clang-only extension, whereas API_AVA=
ILABLE() works<br>
&gt; &gt; &gt;&gt; (or<br>
&gt; &gt; &gt;&gt; more precisely: doesn&#39;t error out at least) with oth=
er compilers like<br>
&gt; &gt; &gt;&gt; GCC<br>
&gt; &gt; &gt;&gt; as<br>
&gt; &gt; &gt;&gt; well. GCC is sometimes used for cross-compilation.<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; Moreover, I would also add an error message in this case=
, e.g.:<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0if (!pthread_fchdir_np) {<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report_once(&quot=
;pthread_fchdir_np() is not available on this<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; macOS version&quot;);<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUPP;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; I should elaborate why I think this is needed: you are a=
lready doing a<br>
&gt; &gt; &gt;&gt; Meson<br>
&gt; &gt; &gt;&gt; check for the existence of pthread_fchdir_np(), but the =
system where<br>
&gt; &gt; &gt;&gt; QEMU<br>
&gt; &gt; &gt;&gt; is<br>
&gt; &gt; &gt;&gt; compiled and the systems where the compiled binary will =
be running,<br>
&gt; &gt; &gt;&gt; might<br>
&gt; &gt; &gt;&gt; be<br>
&gt; &gt; &gt;&gt; different ones (i.e. different macOS versions).<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; Best regards,<br>
&gt; &gt; &gt;&gt; Christian Schoenebeck<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Agreed, that way actually closes the edge case. Something al=
ong these<br>
&gt; &gt; &gt; lines briefly crossed my mind during a previous version, but=
 I quickly<br>
&gt; &gt; &gt; got<br>
&gt; &gt; &gt; passed it by assuming that the compiling entity would always=
 be the<br>
&gt; &gt; &gt; bottleneck, which makes no sense in hindsight, so I very muc=
h appreciate<br>
&gt; &gt; &gt; that you caught this.<br>
&gt; &gt; <br>
&gt; &gt; Ah, rebuilding leads to a compiler error:<br>
&gt; &gt; <br>
&gt; &gt; ../os-posix.c:348:10: warning: address of function &#39;pthread_f=
chdir_np&#39;<br>
&gt; &gt; will<br>
&gt; &gt; always evaluate to &#39;true&#39; [-Wpointer-bool-conversion]<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!pthread_fchdir_np) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~^~~~~~~~~~~~~~~~~<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t have a machine that&#39;s pre-10.12 so I can&#39;t se=
e what the result is<br>
&gt; &gt; there, but this might be why the __builtin_available approach got=
 taken.<br>
&gt; <br>
&gt; I guess that&#39;s because you are compiling QEMU with minimum deploym=
ent target<br>
&gt; being macOS &gt;=3D 10.12 already. In this case the compiler won&#39;t=
 make<br>
&gt; pthread_fchdir_np a weak link, it only does emit a weak link if you ar=
e<br>
&gt; targeting macOS versions prior than the defined availablity attribute,=
<br>
&gt; hence the address would never be NULL here and hence the compiler warn=
ing.<br>
&gt; <br>
&gt; So I guess it is okay if you just omit checking presence of<br>
&gt; pthread_fchdir_np at runtime and just assume it exists.<br>
&gt; <br>
&gt; Added Akihiko on CC, just in case he would have something to add on th=
is<br>
&gt; macOS issue here. :)<br>
<br>
On a second thought: this case a bit special. Are we worried that <br>
pthread_fchdir_np() is &quot;not yet&quot; available on macOS, or &quot;no =
longer&quot; available. <br>
Probably both, right?<br>
<br>
So maybe it would make sense to replace the API_AVAILABLE() attribute direc=
tly <br>
with a __attribute__((weak)) attribute. Then the runtime check with the <br=
>
proposed error message would also trigger if a bleeding edge macOS version =
no <br>
longer has pthread_fchdir_np().<br>
<br>
Also keep in mind: there are always also the MAC_OS_X_VERSION_MIN_REQUIRED =
and <br>
MAC_OS_X_VERSION_MAX_ALLOWED macros to query the deployment target at compi=
le <br>
time to wrap deployment target dependent code accordingly.<br>
<br>
On doubt you could just make some tests there by simply &quot;inventing&quo=
t; a non-<br>
existent function.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br></blockquote><div><br></div><div><div>I like the i=
dea of switching it to __attribute__((weak)). I should note that I&#39;m no=
t sure that I can actually fully test this out since I&#39;m getting stuck =
with the linker noting my undefined fake function during the build, but the=
 idea does make logical sense to me for the future fail case and the happy =
case builds again when implemented with actual pthread_fchdir_np:</div><div=
><br></div><div>[1075/2909] Linking target qemu-nbd<br>FAILED: qemu-nbd <br=
>cc -m64 -mcx16 =C2=A0-o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_d=
ylibs -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load=
 libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa -W=
l,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load libio.f=
a -fstack-protector-strong -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib -W=
l,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a libblockdev.fa l=
ibblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms /usr/loc=
al/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil -L/usr/local/Cellar/glib/=
2.70.3/lib -L/usr/local/opt/gettext/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 =
-lintl -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib -lg=
io-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm -L/usr/local/Cellar/glib/2.70.3/=
lib -L/usr/local/opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl /usr/local=
/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2 -framework CoreFound=
ation -framework IOKit -lcurl -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/lo=
cal/opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl -lbz2 /usr/local/Cellar=
/libssh/0.9.6/lib/libssh.dylib -lpam<br>Undefined symbols for architecture =
x86_64:<br>=C2=A0 &quot;_pthread_fchdir_npfoo&quot;, referenced from:<br>=
=C2=A0 =C2=A0 =C2=A0 _qemu_mknodat in libblockdev.fa(os-posix.c.o)<br>ld: s=
ymbol(s) not found for architecture x86_64<br>clang: error: linker command =
failed with exit code 1 (use -v to see invocation)<br>ninja: build stopped:=
 subcommand failed.<br>make[1]: *** [run-ninja] Error 1<br>make: *** [all] =
Error 2</div><div><br></div><div>With that caveat re testing in mind, unles=
s there&#39;s another recommended path forward, I think it makes sense to s=
tick with __attribute__((weak)) and prepare v6 which incorporates this and =
all the other feedback from this round.</div></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; &gt;&gt; &gt; guess it&#39;s perhaps a tradeoff between predictin=
g the future unknown<br>
&gt; &gt; &gt;&gt; &gt; availability of functions versus just ensuring a mi=
nimum macOS<br>
&gt; &gt; &gt;&gt; &gt; version<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; and<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; hoping for the best. With any luck, the distinction=
 between the two<br>
&gt; &gt; &gt;&gt; &gt; approaches will be moot, if we try to assume that a=
 future macOS<br>
&gt; &gt; &gt;&gt; &gt; version<br>
&gt; &gt; &gt;&gt; &gt; that removes this also provides mknodat.<br>
&gt; &gt; &gt;&gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebe=
ck &lt;<br>
&gt; &gt; &gt;&gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D=
"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt; On Dienstag, 8. Februar 2022 14:36:42 CET Will=
 Cohen wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; On Mon, Feb 7, 2022 at 5:56 PM Christian =
Schoenebeck<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.=
com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; On Montag, 7. Februar 2022 23:40:22 =
CET Will Cohen wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; From: Keno Fischer &lt;<a href=
=3D"mailto:keno@juliacomputing.com" target=3D"_blank">keno@juliacomputing.c=
om</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Darwin does not support mknodat=
. However, to avoid race<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; conditions<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; with later setting the permissi=
ons, we must avoid using mknod<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; on<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; the full path instead. We could=
 try to fchdir, but that would<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; cause<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; problems if multiple threads tr=
y to call mknodat at the same<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; time.<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; However, luckily there is a sol=
ution: Darwin includes a<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; function<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; that sets the cwd for the curre=
nt thread only.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; This should suffice to use mkno=
d safely.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; This function (pthread_fchdir_n=
p) is protected by a check in<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; meson in a patch later in tihs =
series.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Keno Fischer &lt=
;<a href=3D"mailto:keno@juliacomputing.com" target=3D"_blank">keno@juliacom=
puting.com</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Michael Roitzsch=
 &lt;<a href=3D"mailto:reactorcontrol@icloud.com" target=3D"_blank">reactor=
control@icloud.com</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; [Will Cohen: - Adjust coding st=
yle<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Replace clang references with gcc<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Note radar filed with Apple for missing<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 syscall<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Replace direct syscall with pthread_fchdir_np<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 and<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 adjust patch notes accordingly<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Move qemu_mknodat from 9p-util to osdep and<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; os-posix]<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<=
a href=3D"mailto:wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>=
&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; Like already mentioned by me moments=
 ago on previous v4 (just<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; echoing)<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; ...<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =
=C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 include/qemu/osdep.h | 10=
 ++++++++++<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 46 inser=
tions(+), 2 deletions(-)<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/hw/9pfs/9p-local.c=
 b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; index a0d08e5216..d42ce6d8b8 10=
0644<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; --- a/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -682,7 +682,7 @@ static int =
local_mknod(FsContext *fs_ctx,<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; V9fsPath<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; *dir_path,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (fs_ctx-=
&gt;export_flags &amp; V9FS_SM_MAPPED ||<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fs_ctx-&gt;export_flags &amp; V9FS_SM_MAPPED_FILE) {<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
r =3D mknodat(dirfd, name, fs_ctx-&gt;fmode | S_IFREG,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; 0);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
r =3D qemu_mknodat(dirfd, name, fs_ctx-&gt;fmode |<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; S_IFREG,<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; 0);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (err =3D=3D -1) {<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -697,7 +697,7 @@ static int =
local_mknod(FsContext *fs_ctx,<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; V9fsPath<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; *dir_path, }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (=
fs_ctx-&gt;export_flags &amp; V9FS_SM_PASSTHROUGH ||<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE) =
{<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
r =3D mknodat(dirfd, name, credp-&gt;fc_mode,<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; credp-&gt;fc_rdev);<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
r =3D qemu_mknodat(dirfd, name, credp-&gt;fc_mode,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; credp-&gt;fc_rdev);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (err =3D=3D -1) {<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/include/qemu/osdep=
.h b/include/qemu/osdep.h<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; index d1660d67fa..f3a8367ece 10=
0644<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -810,3 +810,13 @@ static inl=
ine int<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; platform_does_not_support_syste=
m(const char *command) #endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +/*<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * As long as mknodat is not a=
vailable on macOS, this<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; workaround<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * using pthread_fchdir_np is =
needed. qemu_mknodat is<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; defined<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; in<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * os-posix.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +int pthread_fchdir_np(int fd);=
<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; I would make that:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; #ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; int pthread_fchdir_np(int fd) API_AV=
AILABLE(macosx(10.12));<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; #endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; here and ...<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, co=
nst char *filename, mode_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; mode,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; dev);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/os-posix.c b/os-po=
six.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; index ae6c9f2a5e..95c1607065 10=
0644<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; --- a/os-posix.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +++ b/os-posix.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -24,6 +24,7 @@<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #include &quot;qemu/osdep=
.h&quot;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#include &lt;os/availability.h=
&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;sys/wait.h&g=
t;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;pwd.h&gt;<br=
>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;grp.h&gt;<br=
>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -332,3 +333,36 @@ int os_mlo=
ck(void)<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return -ENO=
SYS;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +/*<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * As long as mknodat is not a=
vailable on macOS, this<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; workaround<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * using pthread_fchdir_np is =
needed.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * Radar filed with Apple for =
implementing mknodat:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + * rdar://FB9862426<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; (<a href=3D"https://openradar.a=
ppspot.com/FB9862426" rel=3D"noreferrer" target=3D"_blank">https://openrada=
r.appspot.com/FB9862426</a>)<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +int pthread_fchdir_np(int fd) =
API_AVAILABLE(macosx(10.12));<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; ... drop the duplicate declaration o=
f pthread_fchdir_np() here.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; Trying this out, it reminds me that this =
use of API_AVAILABLE in<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; os-posix.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; relies on the added #include &lt;os/avail=
ability.h&gt;.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; Leaving the include out leads to:<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; .../include/qemu/osdep.h:820:31: error: e=
xpected function body<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; after<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; function declarator<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; int pthread_fchdir_np(int fd) API_AVAILAB=
LE(macosx(10.12));<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; 1 error generated.<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; ninja: build stopped: subcommand failed.<=
br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; make[1]: *** [run-ninja] Error 1<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; make: *** [all] Error 2<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; The admonition against modifying osdep.h&=
#39;s includes too much led<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; me<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; to<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; steer away from putting it all in there. =
If there&#39;s no issue with<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; adding<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; +#include &lt;os/availability.h&gt; to os=
dep.h, then this change makes<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; sense<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; me.<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; If you embed that include into ifdefs, sure!<b=
r>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; #ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt;&gt; &gt; &gt; /* defines API_AVAILABLE(...) */<br>
&gt; &gt; &gt;&gt; &gt; &gt; #include &lt;os/availability.h&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; #endif<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; One more thing though ...<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, co=
nst char *filename, mode_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; mode,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; dev)<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int preserved_er=
rno, err;<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; pthread_fchdir_np() is weakly linked. So I gue=
ss here should be a<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; check<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; like:<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pthread_=
fchdir_np) {<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -ENOTSUPP;<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; Before trying to call pthread_fchdir_np() belo=
w. As already<br>
&gt; &gt; &gt;&gt; &gt; &gt; discussed<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; with<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; the<br>
&gt; &gt; &gt;&gt; &gt; &gt; Chromium [1] example, some do that a bit diffe=
rently by using<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; __builtin_available():<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (__builtin=
_available(macOS 10.12, *)) {<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -ENOTSUPP;<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; Which makes me wonder why they are not doing a=
 simple NULL check?<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; [1]<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; <a href=3D"https://chromium.googlesource.com/chromium/sr=
c/+/lkgr/base/process/laun" rel=3D"noreferrer" target=3D"_blank">https://ch=
romium.googlesource.com/chromium/src/+/lkgr/base/process/laun</a><br>
&gt; &gt; &gt;&gt; ch<br>
&gt; &gt; &gt;&gt; _<br>
&gt; &gt; &gt;&gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; mac.cc#110&gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (pthread_fchd=
ir_np(dirfd) &lt; 0) {<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn -1;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 err =3D mknod(fi=
lename, mode, dev);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 preserved_errno =
=3D errno;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Stop using th=
e thread-local cwd */<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pthread_fchdir_n=
p(-1);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (err &lt; 0) =
{<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 er=
rno =3D preserved_errno;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return err;<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, co=
nst char *filename, mode_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; mode,<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; dev)<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return mknodat(d=
irfd, filename, mode, dev);<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt;&gt; &gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Christian Schoenebeck<br>
<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>

--00000000000020bdae05d789a579--

