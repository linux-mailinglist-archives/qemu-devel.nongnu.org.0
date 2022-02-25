Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4544C4760
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:25:46 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbXV-0007K3-3n
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:25:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nNb9a-0001Ln-Dh
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:01:03 -0500
Received: from [2a00:1450:4864:20::131] (port=45885
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nNb9V-000663-SD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:01:02 -0500
Received: by mail-lf1-x131.google.com with SMTP id b11so9563037lfb.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrB4ioyTKTegza4B50iy6gJBVXVMjam/ZnOay3pEV/k=;
 b=GmSHJU4RoY5cYeFd09GHN57yH1mDhQurq0skvUeEk5oo85b+6XIYQVJMLmFDCasRfF
 2Oo2SIRACYv0qNzGPkYVvK97ocV7drzTROb7DdR4MgHkfz5ZrEL4bjkotQIiVD5cfXy+
 DOurvp4/T5y/aFcekFIifqH/LNUT8UMIQOvny7jNlG0UwlVe0eKop0bG+S/Bi2b9TB+s
 kOqfs9/Nf9JjmhxDTXMwXqVFCLoechkkq1aM87dpDIrD96rQA+TamJ0QqliyJrNcQD6U
 UTFFO7m1mP9LP7/m7h0b8v/HlR8OFyQNkG3hOmxhG28Q/3Fz7MgVr3chSCv27SJjKN3f
 Wd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrB4ioyTKTegza4B50iy6gJBVXVMjam/ZnOay3pEV/k=;
 b=kNcRAcEp4WGcyjVWAsyBHynvddHi0pUxnJ0BFKcsGGr01XKHZUt90fiwSsfHisEosB
 NPv3ad+Ht0nUd6EgtIDMveeF9fYfQoAog/hRyLIYySLn/moBS6TLK9rmW/ni0CVmPDwO
 VQZy/5+Z+r2FgBAxJlmQp9wZ8mlpV8HYiYqqvHtrRO4odXooOWO0zYD7iFa9qrPGm1Wc
 4V7hDpTGa+o76h/FJVb4LCmRsnpMMkk34iZGTvefwJb8mFK/IvPf71zV80hB/Q7tOewJ
 kVkc2yyinhDQQDAV8edFDUXmz7hsLxUk7s11itRL/kIVuOe/gsaHpid16q7tpi14/Sqn
 CKuw==
X-Gm-Message-State: AOAM533lrn8flRfbqOEI7zkUdeQung5b3QFV8jlWvTYpBY6ZBcZ+cqwV
 Ad7jbRGW1/u8RZKMESVg4/BaErn24CxKHb95CCQ=
X-Google-Smtp-Source: ABdhPJyrbxEeHmwP9aZax/glyGh0BXFLyu8WhpSvP3c6ntHoU5Fmh/pEWdLBQCO9RBXhyrqkFaaL4zvqsjy4BmTBwac=
X-Received: by 2002:a05:6512:3619:b0:443:1597:8293 with SMTP id
 f25-20020a056512361900b0044315978293mr5013347lfs.439.1645797654799; Fri, 25
 Feb 2022 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <20220220165056.72289-10-wwcohen@gmail.com>
 <8571874.GWnKUVsiaS@silver>
In-Reply-To: <8571874.GWnKUVsiaS@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Fri, 25 Feb 2022 09:00:40 -0500
Message-ID: <CAB26zV2ePB=1ZHogaWndR5cc1Hru9BXRk88cbnN4LahLSFxCmQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000962a6505d8d82058"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Greg Kurz <groug@kaod.org>, qemu Developers <qemu-devel@nongnu.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000962a6505d8d82058
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 9:27 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Sonntag, 20. Februar 2022 17:50:54 CET Will Cohen wrote:
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
> > meson in a patch later in this series.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust coding style
> >              - Replace clang references with gcc
> >              - Note radar filed with Apple for missing syscall
> >              - Replace direct syscall with pthread_fchdir_np and
> >                adjust patch notes accordingly
> >              - Move qemu_mknodat from 9p-util to osdep and os-posix
> >              - Move pthread_fchdir_np declaration only to osdep
> >              - Declare pthread_fchdir_np with
> >              - __attribute__((weak_import)) to allow checking for
> >                its presence before usage
> >              - Move declarations above cplusplus guard
> >              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> >                presence in osdep.h and os-posix.c
> >              - Rebase to apply cleanly on top of the 2022-02-10
> >                changes to 9pfs]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c   |  4 ++--
> >  include/qemu/osdep.h | 12 ++++++++++++
> >  meson.build          |  1 +
> >  os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 50 insertions(+), 2 deletions(-)
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
> > index ce12f64853..c0f442d791 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -818,6 +818,18 @@ static inline int
> > platform_does_not_support_system(const char *command) */
> >  struct dirent *qemu_dirent_dup(struct dirent *dent);
> >
> > +/*
> > + * As long as mknodat is not available on macOS, this workaround
> > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
> > + * in case it disappears in future macOS versions, because it is
> > + * is a private API.
> > + */
> > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > +int pthread_fchdir_np(int fd) __attribute__((weak_import));
> > +#endif
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev);
> > +
> >  #ifdef __cplusplus
> >  }
> >  #endif
>
> Peter just informed me that osdep.h is not the right place to add something
> like this:
>
> https://lore.kernel.org/qemu-devel/CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com/
>
> So this should be moved into a different header file.
>

Does that logic apply here too? In some ways I'd say that mknodat falls
into the category of "things without which code would work on most
platforms but fail to compile or misbehave on a minority of host OSes." If
osdep.h is the wrong place, should it go back to 9p-util, where it lived
before it moved to osdep?


> > diff --git a/meson.build b/meson.build
> > index ae5f7eec6e..6fdc0281ad 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1557,6 +1557,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
> > cc.has_function('posix_fallocate'
> > config_host_data.set('CONFIG_POSIX_MEMALIGN',
> > cc.has_function('posix_memalign')) config_host_data.set('CONFIG_PPOLL',
> > cc.has_function('ppoll'))
> >  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix:
> > '#include <sys/uio.h>'))
> +config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP',
> > cc.has_function('pthread_fchdir_np'))
> > config_host_data.set('CONFIG_SEM_TIMEDWAIT',
> > cc.has_function('sem_timedwait', dependencies: threads))
> > config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> > config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and
> > cc.has_function('unshare')) diff --git a/os-posix.c b/os-posix.c
> > index ae6c9f2a5e..ccc3d1e9d3 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -332,3 +332,38 @@ int os_mlock(void)
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
> > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    int preserved_errno, err;
> > +    if (!pthread_fchdir_np) {
> > +        error_report_once("pthread_fchdir_np() is not available on this
> > version of macOS"); +        return -ENOTSUP;
> > +    }
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

--000000000000962a6505d8d82058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 22, 2022 at 9:27 AM Christian=
 Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank=
">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Sonntag, 20. Februar =
2022 17:50:54 CET Will Cohen wrote:<br>
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
&gt; meson in a patch later in this series.<br>
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
om 9p-util to osdep and os-posix<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move pthread_fchdir_=
np declaration only to osdep<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Declare pthread_fchd=
ir_np with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - __attribute__((weak_=
import)) to allow checking for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 its presence be=
fore usage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move declarations ab=
ove cplusplus guard<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add CONFIG_PTHREAD_F=
CHDIR_NP to meson and check for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 presence in osd=
ep.h and os-posix.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Rebase to apply clea=
nly on top of the 2022-02-10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 changes to 9pfs=
]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 include/qemu/osdep.h | 12 ++++++++++++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++++=
+++++++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 50 insertions(+), 2 deletions(-)<br>
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
&gt; index ce12f64853..c0f442d791 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -818,6 +818,18 @@ static inline int<br>
&gt; platform_does_not_support_system(const char *command) */<br>
&gt;=C2=A0 struct dirent *qemu_dirent_dup(struct dirent *dent);<br>
&gt; <br>
&gt; +/*<br>
&gt; + * As long as mknodat is not available on macOS, this workaround<br>
&gt; + * using pthread_fchdir_np is needed. qemu_mknodat is defined in<br>
&gt; + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard<br>
&gt; + * in case it disappears in future macOS versions, because it is<br>
&gt; + * is a private API.<br>
&gt; + */<br>
&gt; +#if defined CONFIG_DARWIN &amp;&amp; defined CONFIG_PTHREAD_FCHDIR_NP=
<br>
&gt; +int pthread_fchdir_np(int fd) __attribute__((weak_import));<br>
&gt; +#endif<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev);<br>
&gt; +<br>
&gt;=C2=A0 #ifdef __cplusplus<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
<br>
Peter just informed me that osdep.h is not the right place to add something=
<br>
like this:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa=
5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa5mrk22A=
1oHKLWUDjk7v6Khmg@mail.gmail.com/</a><br>
<br>
So this should be moved into a different header file.<br></blockquote><div>=
<br></div><div>Does that logic apply here too? In some ways I&#39;d say tha=
t mknodat falls into the category of &quot;things without which code would =
work on most platforms but fail to compile or misbehave on a minority of ho=
st OSes.&quot; If osdep.h is the wrong place, should it go back to 9p-util,=
 where it lived before it moved to osdep?<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index ae5f7eec6e..6fdc0281ad 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1557,6 +1557,7 @@ config_host_data.set(&#39;CONFIG_POSIX_FALLOCATE=
&#39;,<br>
&gt; cc.has_function(&#39;posix_fallocate&#39;<br>
&gt; config_host_data.set(&#39;CONFIG_POSIX_MEMALIGN&#39;,<br>
&gt; cc.has_function(&#39;posix_memalign&#39;)) config_host_data.set(&#39;C=
ONFIG_PPOLL&#39;,<br>
&gt; cc.has_function(&#39;ppoll&#39;))<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_PREADV&#39;, cc.has_function(&#=
39;preadv&#39;, prefix:<br>
&gt; &#39;#include &lt;sys/uio.h&gt;&#39;)) +config_host_data.set(&#39;CONF=
IG_PTHREAD_FCHDIR_NP&#39;,<br>
&gt; cc.has_function(&#39;pthread_fchdir_np&#39;))<br>
&gt; config_host_data.set(&#39;CONFIG_SEM_TIMEDWAIT&#39;,<br>
&gt; cc.has_function(&#39;sem_timedwait&#39;, dependencies: threads))<br>
&gt; config_host_data.set(&#39;CONFIG_SENDFILE&#39;, cc.has_function(&#39;s=
endfile&#39;))<br>
&gt; config_host_data.set(&#39;CONFIG_SETNS&#39;, cc.has_function(&#39;setn=
s&#39;) and<br>
&gt; cc.has_function(&#39;unshare&#39;)) diff --git a/os-posix.c b/os-posix=
.c<br>
&gt; index ae6c9f2a5e..ccc3d1e9d3 100644<br>
&gt; --- a/os-posix.c<br>
&gt; +++ b/os-posix.c<br>
&gt; @@ -332,3 +332,38 @@ int os_mlock(void)<br>
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
&gt; +#if defined CONFIG_DARWIN &amp;&amp; defined CONFIG_PTHREAD_FCHDIR_NP=
<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; +=C2=A0 =C2=A0 if (!pthread_fchdir_np) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_once(&quot;pthread_fchdir_np=
() is not available on this<br>
&gt; version of macOS&quot;); +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
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

--000000000000962a6505d8d82058--

