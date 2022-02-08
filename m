Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9F4AE1F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:12:21 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVuV-00087c-0d
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHTDD-0004fq-JD
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:19:30 -0500
Received: from [2a00:1450:4864:20::12b] (port=34419
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHTDA-0001dt-IB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:19:27 -0500
Received: by mail-lf1-x12b.google.com with SMTP id o2so8878913lfd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocE2DFz8Rep0JwjINkj0gsqIeLlMKnOFpITJZ6zjSQQ=;
 b=krv0chnOE4pqhZLTy33+/8RAll98RyMw3SWba6BPH9d0WlUN4bi+TrSvhgpjlFnR/Z
 ENfZl+zYvpa1NCrpMupQdF299NEgoG6xaaJ/zCbWNVeWvFRRbXOeoX7qAzd9vqZgQ0G/
 EbsJyfRPSGgyq5xyDfvypwLWYSn7uHhXWStOf7CB9UAF8bO0rdIlGdaK4UiqRC3kHzqy
 L5E6I0Q2F8/U/IQT6/VS66Udgk+3XFfwoUvdhMpH9RlBEyXZFlisRoBYjqibcktOxd53
 0RpuhLRye807c7TU3LeT2g/kzCM9F9aExRF0IuJmoi+QxK6lnSL84adLFMrPqlN7zLwZ
 qvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocE2DFz8Rep0JwjINkj0gsqIeLlMKnOFpITJZ6zjSQQ=;
 b=kn8jZduL4vKFzMRDl/i6zCgCk4dmtVsWB+/qHHbZO3A7e7Oe8rTulY+OstTAAAIVt4
 P8w9YNiLrjhe2+0fLqgrvluOO6Q34pQcIZGUE+IPgqype7KHtXDk2TVKiU1gku6cfnSl
 fs/+F0Tb1uPr9mCfuEjPoYnaAlmTf62WrGJB3WL2IETRLTgWNiSckBmzu2xNHXuAE9UF
 ACup+KnAcAzkXUnkAbcP/Nv+UpePoHmA3R7Wax4tJ1S43ClqoFlE69f3jSikEuy+10U0
 kk8iGvvVj8b7UuSPs0Sh8Y0q1lqjo4QdOGGXEMDWk4iuxZIy+0BSHdCs81Jm9IB/2Iwh
 QGPQ==
X-Gm-Message-State: AOAM5304QWB8i9FfgbH39RHe9dy4bf3CWL7NnyTpJrpO+zeLb/V6TNUM
 LhU2P92K5sv5YH0WeOLNL/a0vW1wPIlLoQ1o3B8=
X-Google-Smtp-Source: ABdhPJxBUj9ggabfQsJAr02i9m9hyjXHTDegolAz/eD2Vuz30OUmZ70QAnFDe4ChSDqrUcxsgsKnCIjVQp7YwUZGYD8=
X-Received: by 2002:a19:5f58:: with SMTP id a24mr3388084lfj.46.1644337162386; 
 Tue, 08 Feb 2022 08:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <44442748.7pOeeLDITA@silver>
 <CAB26zV20ptbz+A9AvV9H_8rv19s2gD6+XBUJGtse2s6zq_HsYA@mail.gmail.com>
 <8390824.yUqPNeXlkU@silver>
In-Reply-To: <8390824.yUqPNeXlkU@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 8 Feb 2022 11:19:10 -0500
Message-ID: <CAB26zV1G3-m2=59j8f+f2q-L40WHr1u+sBWKjW+LqJ=GG+6h2A@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000074815905d7841424"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12b.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074815905d7841424
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 11:11 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Dienstag, 8. Februar 2022 16:57:55 CET Will Cohen wrote:
> > My inclination is to go with the __builtin_available(macOS 10.12, *)
> path,
> > if acceptable, since it partially mirrors the API_AVAILABLE macro idea. I
>
> OTOH that's duplication of the ">= macOS 10.12" info, plus
> __builtin_available
> is direct use of a clang-only extension, whereas API_AVAILABLE() works (or
> more precisely: doesn't error out at least) with other compilers like GCC
> as
> well. GCC is sometimes used for cross-compilation.
>
> Moreover, I would also add an error message in this case, e.g.:
>
>     if (!pthread_fchdir_np) {
>         error_report_once("pthread_fchdir_np() is not available on this
> macOS version");
>         return -ENOTSUPP;
>     }
>
> I should elaborate why I think this is needed: you are already doing a
> Meson
> check for the existence of pthread_fchdir_np(), but the system where QEMU
> is
> compiled and the systems where the compiled binary will be running, might
> be
> different ones (i.e. different macOS versions).
>
> Best regards,
> Christian Schoenebeck
>

Agreed, that way actually closes the edge case. Something along these lines
briefly crossed my mind during a previous version, but I quickly got passed
it by assuming that the compiling entity would always be the bottleneck,
which makes no sense in hindsight, so I very much appreciate that you
caught this.


> > guess it's perhaps a tradeoff between predicting the future unknown
> > availability of functions versus just ensuring a minimum macOS version
> and
> > hoping for the best. With any luck, the distinction between the two
> > approaches will be moot, if we try to assume that a future macOS version
> > that removes this also provides mknodat.
> >
> > On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
> >
> > qemu_oss@crudebyte.com> wrote:
> > > On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
> > > > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
> > > > <qemu_oss@crudebyte.com>
> > > >
> > > > wrote:
> > > > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> > > > > > From: Keno Fischer <keno@juliacomputing.com>
> > > > > >
> > > > > > Darwin does not support mknodat. However, to avoid race
> conditions
> > > > > > with later setting the permissions, we must avoid using mknod on
> > > > > > the full path instead. We could try to fchdir, but that would
> cause
> > > > > > problems if multiple threads try to call mknodat at the same
> time.
> > > > > > However, luckily there is a solution: Darwin includes a function
> > > > > > that sets the cwd for the current thread only.
> > > > > > This should suffice to use mknod safely.
> > > > > >
> > > > > > This function (pthread_fchdir_np) is protected by a check in
> > > > > > meson in a patch later in tihs series.
> > > > > >
> > > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > > > [Will Cohen: - Adjust coding style
> > > > > >
> > > > > >              - Replace clang references with gcc
> > > > > >              - Note radar filed with Apple for missing syscall
> > > > > >              - Replace direct syscall with pthread_fchdir_np and
> > > > > >
> > > > > >                adjust patch notes accordingly
> > > > > >
> > > > > >              - Move qemu_mknodat from 9p-util to osdep and
> os-posix]
> > > > > >
> > > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > > > ---
> > > > >
> > > > > Like already mentioned by me moments ago on previous v4 (just
> echoing)
> > >
> > > ...
> > >
> > > > > >  hw/9pfs/9p-local.c   |  4 ++--
> > > > > >  include/qemu/osdep.h | 10 ++++++++++
> > > > > >  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
> > > > > >  3 files changed, 46 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > > > > index a0d08e5216..d42ce6d8b8 100644
> > > > > > --- a/hw/9pfs/9p-local.c
> > > > > > +++ b/hw/9pfs/9p-local.c
> > > > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx,
> > >
> > > V9fsPath
> > >
> > > > > > *dir_path,
> > > > > >
> > > > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > > > > >
> > > > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > > > >
> > > > > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG,
> > > > > > 0);
> > > > > >
> > > > > >          if (err == -1) {
> > > > > >
> > > > > >              goto out;
> > > > > >
> > > > > >          }
> > > > > >
> > > > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx,
> > >
> > > V9fsPath
> > >
> > > > > > *dir_path, }
> > > > > >
> > > > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > > > > >
> > > > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > > > >
> > > > > > -        err = mknodat(dirfd, name, credp->fc_mode,
> credp->fc_rdev);
> > > > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > > > > credp->fc_rdev);
> > > > > >
> > > > > >          if (err == -1) {
> > > > > >
> > > > > >              goto out;
> > > > > >
> > > > > >          }
> > > > > >
> > > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > > > index d1660d67fa..f3a8367ece 100644
> > > > > > --- a/include/qemu/osdep.h
> > > > > > +++ b/include/qemu/osdep.h
> > > > > > @@ -810,3 +810,13 @@ static inline int
> > > > > > platform_does_not_support_system(const char *command) #endif
> > > > > >
> > > > > >  #endif
> > > > > >
> > > > > > +
> > > > > > +/*
> > > > > > + * As long as mknodat is not available on macOS, this workaround
> > > > > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > > > > > + * os-posix.c
> > > > > > + */
> > > > > > +#ifdef CONFIG_DARWIN
> > > > > > +int pthread_fchdir_np(int fd);
> > > > > > +#endif
> > > > >
> > > > > I would make that:
> > > > >
> > > > > #ifdef CONFIG_DARWIN
> > > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > > > #endif
> > > > >
> > > > > here and ...
> > > > >
> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > > dev_t
> > > > >
> > > > > dev);
> > > > >
> > > > > > diff --git a/os-posix.c b/os-posix.c
> > > > > > index ae6c9f2a5e..95c1607065 100644
> > > > > > --- a/os-posix.c
> > > > > > +++ b/os-posix.c
> > > > > > @@ -24,6 +24,7 @@
> > > > > >
> > > > > >   */
> > > > > >
> > > > > >  #include "qemu/osdep.h"
> > > > > >
> > > > > > +#include <os/availability.h>
> > > > > >
> > > > > >  #include <sys/wait.h>
> > > > > >  #include <pwd.h>
> > > > > >  #include <grp.h>
> > > > > >
> > > > > > @@ -332,3 +333,36 @@ int os_mlock(void)
> > > > > >
> > > > > >      return -ENOSYS;
> > > > > >
> > > > > >  #endif
> > > > > >  }
> > > > > >
> > > > > > +
> > > > > > +/*
> > > > > > + * As long as mknodat is not available on macOS, this workaround
> > > > > > + * using pthread_fchdir_np is needed.
> > > > > > + *
> > > > > > + * Radar filed with Apple for implementing mknodat:
> > > > > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > > > > + */
> > > > > > +#ifdef CONFIG_DARWIN
> > > > > > +
> > > > > > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > > >
> > > > > ... drop the duplicate declaration of pthread_fchdir_np() here.
> > > >
> > > > Trying this out, it reminds me that this use of API_AVAILABLE in
> > >
> > > os-posix.c
> > >
> > > > relies on the added #include <os/availability.h>.
> > > >
> > > > Leaving the include out leads to:
> > > > .../include/qemu/osdep.h:820:31: error: expected function body after
> > > > function declarator
> > > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > >
> > > >                               ^
> > > >
> > > > 1 error generated.
> > > > ninja: build stopped: subcommand failed.
> > > > make[1]: *** [run-ninja] Error 1
> > > > make: *** [all] Error 2
> > > >
> > > > The admonition against modifying osdep.h's includes too much led me
> to
> > > > steer away from putting it all in there. If there's no issue with
> adding
> > > > +#include <os/availability.h> to osdep.h, then this change makes
> sense
> > > > to
> > > > me.
> > >
> > > If you embed that include into ifdefs, sure!
> > >
> > > #ifdef CONFIG_DARWIN
> > > /* defines API_AVAILABLE(...) */
> > > #include <os/availability.h>
> > > #endif
> > >
> > > One more thing though ...
> > >
> > > > > > +
> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > > dev_t
> > > > >
> > > > > dev)
> > > > >
> > > > > > +{
> > > > > > +    int preserved_errno, err;
> > >
> > > pthread_fchdir_np() is weakly linked. So I guess here should be a check
> > >
> > > like:
> > >         if (!pthread_fchdir_np) {
> > >
> > >                 return -ENOTSUPP;
> > >
> > >         }
> > >
> > > Before trying to call pthread_fchdir_np() below. As already discussed
> with
> > > the
> > > Chromium [1] example, some do that a bit differently by using
> > >
> > > __builtin_available():
> > >         if (__builtin_available(macOS 10.12, *)) {
> > >
> > >                 return -ENOTSUPP;
> > >
> > >         }
> > >
> > > Which makes me wonder why they are not doing a simple NULL check?
> > >
> > > [1]
> > >
> https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_
> > > mac.cc#110>
> > > > > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +    err = mknod(filename, mode, dev);
> > > > > > +    preserved_errno = errno;
> > > > > > +    /* Stop using the thread-local cwd */
> > > > > > +    pthread_fchdir_np(-1);
> > > > > > +    if (err < 0) {
> > > > > > +        errno = preserved_errno;
> > > > > > +    }
> > > > > > +    return err;
> > > > > > +}
> > > > > > +#else
> > > > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
> > > > > > dev_t
> > > > >
> > > > > dev)
> > > > >
> > > > > > +{
> > > > > > +    return mknodat(dirfd, filename, mode, dev);
> > > > > > +}
> > > > > > +#endif
>

--00000000000074815905d7841424
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 8, 2022 at 11:11 AM Christian=
 Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudeby=
te.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>On Dienstag, 8. Februar 2022 16:57:55=
 CET Will Cohen wrote:<br>
&gt; My inclination is to go with the __builtin_available(macOS 10.12, *) p=
ath,<br>
&gt; if acceptable, since it partially mirrors the API_AVAILABLE macro idea=
. I<br>
<br>
OTOH that&#39;s duplication of the &quot;&gt;=3D macOS 10.12&quot; info, pl=
us __builtin_available<br>
is direct use of a clang-only extension, whereas API_AVAILABLE() works (or<=
br>
more precisely: doesn&#39;t error out at least) with other compilers like G=
CC as<br>
well. GCC is sometimes used for cross-compilation.<br>
<br>
Moreover, I would also add an error message in this case, e.g.:<br>
<br>
=C2=A0 =C2=A0 if (!pthread_fchdir_np) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_once(&quot;pthread_fchdir_np() is =
not available on this macOS version&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUPP;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br=
>
=C2=A0 =C2=A0 }<br>
<br>
I should elaborate why I think this is needed: you are already doing a Meso=
n<br>
check for the existence of pthread_fchdir_np(), but the system where QEMU i=
s<br>
compiled and the systems where the compiled binary will be running, might b=
e<br>
different ones (i.e. different macOS versions).<br>
<br>
Best regards,<br>
Christian Schoenebeck<br></div></blockquote><div><br></div><div>Agreed, tha=
t way actually closes the edge case. Something along these lines briefly cr=
ossed my mind during a previous version, but I quickly got passed it by ass=
uming that the compiling entity would always be the bottleneck, which makes=
 no sense in hindsight, so I very much appreciate that you caught this.<br>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
>
<br>
&gt; guess it&#39;s perhaps a tradeoff between predicting the future unknow=
n<br>
&gt; availability of functions versus just ensuring a minimum macOS version=
 and<br>
&gt; hoping for the best. With any luck, the distinction between the two<br=
>
&gt; approaches will be moot, if we try to assume that a future macOS versi=
on<br>
&gt; that removes this also provides mknodat.<br>
&gt; <br>
&gt; On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@c=
rudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:<br>
&gt; &gt; &gt; On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_bla=
nk">qemu_oss@crudebyte.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juli=
acomputing.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Darwin does not support mknodat. However, to avoid=
 race conditions<br>
&gt; &gt; &gt; &gt; &gt; with later setting the permissions, we must avoid =
using mknod on<br>
&gt; &gt; &gt; &gt; &gt; the full path instead. We could try to fchdir, but=
 that would cause<br>
&gt; &gt; &gt; &gt; &gt; problems if multiple threads try to call mknodat a=
t the same time.<br>
&gt; &gt; &gt; &gt; &gt; However, luckily there is a solution: Darwin inclu=
des a function<br>
&gt; &gt; &gt; &gt; &gt; that sets the cwd for the current thread only.<br>
&gt; &gt; &gt; &gt; &gt; This should suffice to use mknod safely.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This function (pthread_fchdir_np) is protected by =
a check in<br>
&gt; &gt; &gt; &gt; &gt; meson in a patch later in tihs series.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:=
keno@juliacomputing.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mai=
lto:reactorcontrol@icloud.com" target=3D"_blank">reactorcontrol@icloud.com<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; [Will Cohen: - Adjust coding style<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
Replace clang references with gcc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
Note radar filed with Apple for missing syscall<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
Replace direct syscall with pthread_fchdir_np and<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 adjust patch notes accordingly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
Move qemu_mknodat from 9p-util to osdep and os-posix]<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:ww=
cohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Like already mentioned by me moments ago on previous v4=
 (just echoing)<br>
&gt; &gt; <br>
&gt; &gt; ...<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 include/qemu/osdep.h | 10 ++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 34 ++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 46 insertions(+), 2 deletio=
ns(-)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local=
.c<br>
&gt; &gt; &gt; &gt; &gt; index a0d08e5216..d42ce6d8b8 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -682,7 +682,7 @@ static int local_mknod(FsConte=
xt *fs_ctx,<br>
&gt; &gt; <br>
&gt; &gt; V9fsPath<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; *dir_path,<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (fs_ctx-&gt;export_flags &a=
mp; V9FS_SM_MAPPED ||<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs_ctx-&gt;expor=
t_flags &amp; V9FS_SM_MAPPED_FILE) {<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd=
, name, fs_ctx-&gt;fmode | S_IFREG, 0);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(=
dirfd, name, fs_ctx-&gt;fmode | S_IFREG,<br>
&gt; &gt; &gt; &gt; &gt; 0);<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -=
1) {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go=
to out;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; @@ -697,7 +697,7 @@ static int local_mknod(FsConte=
xt *fs_ctx,<br>
&gt; &gt; <br>
&gt; &gt; V9fsPath<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; *dir_path, }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (fs_ctx-&gt;export_f=
lags &amp; V9FS_SM_PASSTHROUGH ||<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE) {<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd=
, name, credp-&gt;fc_mode, credp-&gt;fc_rdev);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(=
dirfd, name, credp-&gt;fc_mode,<br>
&gt; &gt; &gt; &gt; &gt; credp-&gt;fc_rdev);<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -=
1) {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go=
to out;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/include/qemu/osdep.h b/include/qemu/o=
sdep.h<br>
&gt; &gt; &gt; &gt; &gt; index d1660d67fa..f3a8367ece 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -810,3 +810,13 @@ static inline int<br>
&gt; &gt; &gt; &gt; &gt; platform_does_not_support_system(const char *comma=
nd) #endif<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; &gt; &gt; + * As long as mknodat is not available on macOS, =
this workaround<br>
&gt; &gt; &gt; &gt; &gt; + * using pthread_fchdir_np is needed. qemu_mknoda=
t is defined in<br>
&gt; &gt; &gt; &gt; &gt; + * os-posix.c<br>
&gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt; &gt; &gt; +int pthread_fchdir_np(int fd);<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I would make that:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; #ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt; &gt; int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.1=
2));<br>
&gt; &gt; &gt; &gt; #endif<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; here and ...<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename,=
 mode_t mode,<br>
&gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; dev);<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/os-posix.c b/os-posix.c<br>
&gt; &gt; &gt; &gt; &gt; index ae6c9f2a5e..95c1607065 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/os-posix.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/os-posix.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -24,6 +24,7 @@<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;os/availability.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;sys/wait.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;grp.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; @@ -332,3 +333,36 @@ int os_mlock(void)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; &gt; &gt; + * As long as mknodat is not available on macOS, =
this workaround<br>
&gt; &gt; &gt; &gt; &gt; + * using pthread_fchdir_np is needed.<br>
&gt; &gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; &gt; + * Radar filed with Apple for implementing mknoda=
t:<br>
&gt; &gt; &gt; &gt; &gt; + * rdar://FB9862426 (<a href=3D"https://openradar=
.appspot.com/FB9862426" rel=3D"noreferrer" target=3D"_blank">https://openra=
dar.appspot.com/FB9862426</a>)<br>
&gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +int pthread_fchdir_np(int fd) API_AVAILABLE(macos=
x(10.12));<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; ... drop the duplicate declaration of pthread_fchdir_np=
() here.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Trying this out, it reminds me that this use of API_AVAILABL=
E in<br>
&gt; &gt; <br>
&gt; &gt; os-posix.c<br>
&gt; &gt; <br>
&gt; &gt; &gt; relies on the added #include &lt;os/availability.h&gt;.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Leaving the include out leads to:<br>
&gt; &gt; &gt; .../include/qemu/osdep.h:820:31: error: expected function bo=
dy after<br>
&gt; &gt; &gt; function declarator<br>
&gt; &gt; &gt; int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 1 error generated.<br>
&gt; &gt; &gt; ninja: build stopped: subcommand failed.<br>
&gt; &gt; &gt; make[1]: *** [run-ninja] Error 1<br>
&gt; &gt; &gt; make: *** [all] Error 2<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The admonition against modifying osdep.h&#39;s includes too =
much led me to<br>
&gt; &gt; &gt; steer away from putting it all in there. If there&#39;s no i=
ssue with adding<br>
&gt; &gt; &gt; +#include &lt;os/availability.h&gt; to osdep.h, then this ch=
ange makes sense<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; me.<br>
&gt; &gt; <br>
&gt; &gt; If you embed that include into ifdefs, sure!<br>
&gt; &gt; <br>
&gt; &gt; #ifdef CONFIG_DARWIN<br>
&gt; &gt; /* defines API_AVAILABLE(...) */<br>
&gt; &gt; #include &lt;os/availability.h&gt;<br>
&gt; &gt; #endif<br>
&gt; &gt; <br>
&gt; &gt; One more thing though ...<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename,=
 mode_t mode,<br>
&gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; dev)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; &gt; <br>
&gt; &gt; pthread_fchdir_np() is weakly linked. So I guess here should be a=
 check<br>
&gt; &gt; <br>
&gt; &gt; like:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pthread_fchdir_np) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn -ENOTSUPP;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; <br>
&gt; &gt; Before trying to call pthread_fchdir_np() below. As already discu=
ssed with<br>
&gt; &gt; the<br>
&gt; &gt; Chromium [1] example, some do that a bit differently by using<br>
&gt; &gt; <br>
&gt; &gt; __builtin_available():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (__builtin_available(macOS 10=
.12, *)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn -ENOTSUPP;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; <br>
&gt; &gt; Which makes me wonder why they are not doing a simple NULL check?=
<br>
&gt; &gt; <br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://chromium.googlesource.com/chromium/src/+/lkgr/=
base/process/launch_" rel=3D"noreferrer" target=3D"_blank">https://chromium=
.googlesource.com/chromium/src/+/lkgr/base/process/launch_</a><br>
&gt; &gt; mac.cc#110&gt; <br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (pthread_fchdir_np(dirfd) &lt; 0=
) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);=
<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 preserved_errno =3D errno;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Stop using the thread-local cwd =
*/<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pthread_fchdir_np(-1);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D preserved_e=
rrno;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return err;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename,=
 mode_t mode,<br>
&gt; &gt; &gt; &gt; &gt; dev_t<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; dev)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mod=
e, dev);<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br></div>
</blockquote></div></div>

--00000000000074815905d7841424--

