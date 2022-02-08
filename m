Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FAB4ADBE3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:02:45 +0100 (CET)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHS0v-0007wV-8W
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHQfz-0000TL-Uw
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:37:01 -0500
Received: from [2607:f8b0:4864:20::32b] (port=34572
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHQfv-00055S-41
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:36:58 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so13252700otf.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zomnzKGrJiIRaVzF3utfBZDJJk3L++zJYDFHpAOJAms=;
 b=NP29JU8z/1nFP6jn8GkPGHPeyj4wPdQNAALqw45qp7w85C9HAwYx3jlkBHYb6vfwJJ
 jKXbXMo8oHbGfqHPmFWU25qQyiGJCFA/qHLmZFluIlv2zHqXs2SKy8Vq2D/qbg8x1EdL
 20UIF8ki5OAkOdIrfTyMRpPL41amnfVmRTkgLF1JYlbSx3BpnL9kL2kRZLmnW5guL/85
 HO+4HyBSx+ZIFjQbPcEzQtoMgzYZhcSJXeUXsMVcLSZDN+A0QzMYN4MJk9Dwp+rfHanw
 e2ryqQO/h0A9pFgAmQYjR6q8tCbvnh0zn+OxH0X4R0CCfRyx5gYyoZ3a3kFv+1u8hyG/
 hxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zomnzKGrJiIRaVzF3utfBZDJJk3L++zJYDFHpAOJAms=;
 b=fe05am6pS+Ll4lNZ0Jb7JQfdpu4o6HlVBgHMr8FSMV25Cn+gtyci+ygenawUMYduPY
 AV7Upb1zDV5r5Dz7YctdjNEgKfOCs8cPjkKd5fOB5mvLBbYeKFwZ++wSbhA7hsi54F3C
 QphChxzRU3FyXLfv/gHdNtqoyc1RMuPo7iqP8Ov/2tW3QTWkHoyGbmBsjv9pDEt/ykHl
 40bHEfhIgmAal8mHIGsSq/gpXCAKTGFoZew921QbatPXr6ZE+IEh6djwQPpg4pMFqso/
 ndK0jS1uTbx11ly6sDrErKcQn6aO2BgO3CcxgWhOn125u3UUigqTlbQrKa7nw18K94Mo
 JmJQ==
X-Gm-Message-State: AOAM531xt7D7EiffNUcHtgVlDYn/Bml07tFOsP0etsYfMqFXhMe+AaAb
 CX4sz3YVfqbTk2geC4nFpiOkj62C3ZuQ59JGDEQ=
X-Google-Smtp-Source: ABdhPJwA2HZe8emPJZwLcUqXxVdBLJJIXU8o7DwkG+uQJlZ7cJ6ZRlrYkL6ir7FmbLcOUCbpoHXYNw3P03m1HBMYsAU=
X-Received: by 2002:a05:6830:108a:: with SMTP id
 y10mr164594oto.285.1644327413312; 
 Tue, 08 Feb 2022 05:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-10-wwcohen@gmail.com>
 <2714656.jhBehFKKHS@silver>
In-Reply-To: <2714656.jhBehFKKHS@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 8 Feb 2022 08:36:42 -0500
Message-ID: <CAB26zV3fC6YDCjVrez2n4TNVmzSVqCs-hDBM0Vv+wmiQeot9EA@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000005d6f6105d781cf94"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=wwcohen@gmail.com; helo=mail-ot1-x32b.google.com
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

--0000000000005d6f6105d781cf94
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Darwin does not support mknodat. However, to avoid race conditions
> > with later setting the permissions, we must avoid using mknod on
> > the full path instead. We could try to fchdir, but that would cause
> > problems if multiple threads try to call mknodat at the same time.
> > However, luckily there is a solution: Darwin includes a function
> > that sets the cwd for the current thread only.
> > This should suffice to use mknod safely.
> >
> > This function (pthread_fchdir_np) is protected by a check in
> > meson in a patch later in tihs series.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust coding style
> >              - Replace clang references with gcc
> >              - Note radar filed with Apple for missing syscall
> >              - Replace direct syscall with pthread_fchdir_np and
> >                adjust patch notes accordingly
> >              - Move qemu_mknodat from 9p-util to osdep and os-posix]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
>
> Like already mentioned by me moments ago on previous v4 (just echoing) ...
>
> >  hw/9pfs/9p-local.c   |  4 ++--
> >  include/qemu/osdep.h | 10 ++++++++++
> >  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 46 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index a0d08e5216..d42ce6d8b8 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path,
> >
> >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> >          if (err == -1) {
> >              goto out;
> >          }
> > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path, }
> >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> >          if (err == -1) {
> >              goto out;
> >          }
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..f3a8367ece 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -810,3 +810,13 @@ static inline int
> > platform_does_not_support_system(const char *command) #endif
> >
> >  #endif
> > +
> > +/*
> > + * As long as mknodat is not available on macOS, this workaround
> > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > + * os-posix.c
> > + */
> > +#ifdef CONFIG_DARWIN
> > +int pthread_fchdir_np(int fd);
> > +#endif
>
> I would make that:
>
> #ifdef CONFIG_DARWIN
> int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> #endif
>
> here and ...
>
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev);
> > diff --git a/os-posix.c b/os-posix.c
> > index ae6c9f2a5e..95c1607065 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -24,6 +24,7 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include <os/availability.h>
> >  #include <sys/wait.h>
> >  #include <pwd.h>
> >  #include <grp.h>
> > @@ -332,3 +333,36 @@ int os_mlock(void)
> >      return -ENOSYS;
> >  #endif
> >  }
> > +
> > +/*
> > + * As long as mknodat is not available on macOS, this workaround
> > + * using pthread_fchdir_np is needed.
> > + *
> > + * Radar filed with Apple for implementing mknodat:
> > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > + */
> > +#ifdef CONFIG_DARWIN
> > +
> > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
>
> ... drop the duplicate declaration of pthread_fchdir_np() here.
>

Trying this out, it reminds me that this use of API_AVAILABLE in os-posix.c
relies on the added #include <os/availability.h>.

Leaving the include out leads to:
.../include/qemu/osdep.h:820:31: error: expected function body after
function declarator
int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
                              ^
1 error generated.
ninja: build stopped: subcommand failed.
make[1]: *** [run-ninja] Error 1
make: *** [all] Error 2

The admonition against modifying osdep.h's includes too much led me to
steer away from putting it all in there. If there's no issue with adding
+#include <os/availability.h> to osdep.h, then this change makes sense to
me.


> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    int preserved_errno, err;
> > +    if (pthread_fchdir_np(dirfd) < 0) {
> > +        return -1;
> > +    }
> > +    err = mknod(filename, mode, dev);
> > +    preserved_errno = errno;
> > +    /* Stop using the thread-local cwd */
> > +    pthread_fchdir_np(-1);
> > +    if (err < 0) {
> > +        errno = preserved_errno;
> > +    }
> > +    return err;
> > +}
> > +#else
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    return mknodat(dirfd, filename, mode, dev);
> > +}
> > +#endif
>
>
>

--0000000000005d6f6105d781cf94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 7, 2022 at 5:56 PM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank"=
>qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Montag, 7. Februar 202=
2 23:40:22 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Darwin does not support mknodat. However, to avoid race conditions<br>
&gt; with later setting the permissions, we must avoid using mknod on<br>
&gt; the full path instead. We could try to fchdir, but that would cause<br=
>
&gt; problems if multiple threads try to call mknodat at the same time.<br>
&gt; However, luckily there is a solution: Darwin includes a function<br>
&gt; that sets the cwd for the current thread only.<br>
&gt; This should suffice to use mknod safely.<br>
&gt; <br>
&gt; This function (pthread_fchdir_np) is protected by a check in<br>
&gt; meson in a patch later in tihs series.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Adjust coding style<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Replace clang refere=
nces with gcc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Note radar filed wit=
h Apple for missing syscall<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Replace direct sysca=
ll with pthread_fchdir_np and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjust patch no=
tes accordingly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move qemu_mknodat fr=
om 9p-util to osdep and os-posix]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Like already mentioned by me moments ago on previous v4 (just echoing) ...<=
br>
<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 include/qemu/osdep.h | 10 ++++++++++<br>
&gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++++++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 46 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index a0d08e5216..d42ce6d8b8 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath=
<br>
&gt; *dir_path,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fs_ctx-&gt;export_flags &amp; V9FS_SM_MAPPED |=
|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs_ctx-&gt;export_flags &amp; V9FS_S=
M_MAPPED_FILE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd, name, fs_ctx-&gt;f=
mode | S_IFREG, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(dirfd, name, fs_ctx-=
&gt;fmode | S_IFREG, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath=
<br>
&gt; *dir_path, }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (fs_ctx-&gt;export_flags &amp; V9FS_SM_P=
ASSTHROUGH ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_ctx-&g=
t;export_flags &amp; V9FS_SM_NONE) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd, name, credp-&gt;fc=
_mode, credp-&gt;fc_rdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(dirfd, name, credp-&=
gt;fc_mode, credp-&gt;fc_rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; index d1660d67fa..f3a8367ece 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -810,3 +810,13 @@ static inline int<br>
&gt; platform_does_not_support_system(const char *command) #endif<br>
&gt; <br>
&gt;=C2=A0 #endif<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * As long as mknodat is not available on macOS, this workaround<br>
&gt; + * using pthread_fchdir_np is needed. qemu_mknodat is defined in<br>
&gt; + * os-posix.c<br>
&gt; + */<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +int pthread_fchdir_np(int fd);<br>
&gt; +#endif<br>
<br>
I would make that:<br>
<br>
#ifdef CONFIG_DARWIN<br>
int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));<br>
#endif<br>
<br>
here and ...<br>
<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev);<br>
&gt; diff --git a/os-posix.c b/os-posix.c<br>
&gt; index ae6c9f2a5e..95c1607065 100644<br>
&gt; --- a/os-posix.c<br>
&gt; +++ b/os-posix.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &lt;os/availability.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/wait.h&gt;<br>
&gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt;=C2=A0 #include &lt;grp.h&gt;<br>
&gt; @@ -332,3 +333,36 @@ int os_mlock(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * As long as mknodat is not available on macOS, this workaround<br>
&gt; + * using pthread_fchdir_np is needed.<br>
&gt; + *<br>
&gt; + * Radar filed with Apple for implementing mknodat:<br>
&gt; + * rdar://FB9862426 (<a href=3D"https://openradar.appspot.com/FB98624=
26" rel=3D"noreferrer" target=3D"_blank">https://openradar.appspot.com/FB98=
62426</a>)<br>
&gt; + */<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +<br>
&gt; +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));<br>
<br>
... drop the duplicate declaration of pthread_fchdir_np() here.<br></blockq=
uote><div><br></div><div>Trying this out, it reminds me that this use of AP=
I_AVAILABLE in os-posix.c relies on the added #include &lt;os/availability.=
h&gt;. <br></div><div><br></div><div>Leaving the include out leads to:</div=
><div>.../include/qemu/osdep.h:820:31: error: expected function body after =
function declarator<br>int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(1=
0.12));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>1 error generated.<br>ninja:=
 build stopped: subcommand failed.<br>make[1]: *** [run-ninja] Error 1<br>m=
ake: *** [all] Error 2</div><div><br></div><div>The admonition against modi=
fying osdep.h&#39;s includes too much led me to steer away from putting it =
all in there. If there&#39;s no issue with adding +#include &lt;os/availabi=
lity.h&gt; to osdep.h, then this change makes sense to me.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; +=C2=A0 =C2=A0 if (pthread_fchdir_np(dirfd) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
&gt; +=C2=A0 =C2=A0 preserved_errno =3D errno;<br>
&gt; +=C2=A0 =C2=A0 /* Stop using the thread-local cwd */<br>
&gt; +=C2=A0 =C2=A0 pthread_fchdir_np(-1);<br>
&gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D preserved_errno;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return err;<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mode, dev);<br>
&gt; +}<br>
&gt; +#endif<br>
<br>
<br>
</blockquote></div></div>

--0000000000005d6f6105d781cf94--

