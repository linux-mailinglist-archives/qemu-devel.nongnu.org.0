Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD534C4B1A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:45:04 +0100 (CET)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdiJ-0003dj-Ld
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:45:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nNdd3-0000KO-OM
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:39:37 -0500
Received: from [2a00:1450:4864:20::12d] (port=33518
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nNdco-0005vd-8p
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:39:37 -0500
Received: by mail-lf1-x12d.google.com with SMTP id bu29so10498042lfb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 08:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8huJoxAlw/YNTa0xvJ/8ZWK0bTik/jD80cwnwkU/AIs=;
 b=gePOTGsAumJRwveKCITq2ovLB1jMjsau31z/JDde4ANYVEw4EvR8d3tjLQxoHvP/oT
 i3Ezs67uzJzzSLetefyLmyiVYrDBmfwh7McTd0fFU/h5nXtI5m3sQHDVD2CAia7Br7pm
 5Ow0NuLvVv7gy+IDEF6OhIzxRRo55w/LJYDabjZDyEcDXiCjMl3+O/amdgMWjuEHJo8o
 Y+d5zpZZMnca2ADKlxGTKq1VkxjfWWW/uFY+gImNggRvS7c/mIvZ9oOh2aNZZ4TuoLql
 UccvjK8iNtf3xAoPBisJiJyHufVS9LaixP0yjUsniv17psbaTc3iQ6FfHVoZYNIyynnw
 g3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8huJoxAlw/YNTa0xvJ/8ZWK0bTik/jD80cwnwkU/AIs=;
 b=mIUYAiwA5fERlm5NnAbmQ8kD4aHxuiLwdU9M2JT9sxqWRn2YtE4g2uAFS4C5J3ge9J
 0O4MBy6fUp2YJR6JPKoAROCFyIT2bg2jR6a03GOrb/od0/W3IxGEf04D4SgLlo8ci3Ag
 i0NbudxP2C3LTmyP/nFNX5i45rJabI+Z9q6bjI1ryyozD0TRvlbcHXE69rDD/C5k9RP5
 s2DNWpEafDLNIjaL2DObI6WWyRJNOjeF+YeB4raO6hm7wypJCRYtsecspks6kjQ4FlVq
 9CQe0l4k8SD0/5WbEDUG5x2RWiQin8CBwwNtE+ktTWK2hsftGd9ngbiXX1QbuWWG7Way
 v0vg==
X-Gm-Message-State: AOAM531hmbXGNmvEl5p8EtZj8yHPXIo51b1GdHkjFTeAkClAfj3NZq4u
 02GDZbWMULg+TUXrmbyBr1A2nXbziCNjSrOz6Ag=
X-Google-Smtp-Source: ABdhPJxGDOUBtBxqJkNRHP4VO9z8sSh9x7s0XVtM1eCzqWoNDpV65JT0TXZXyPmxq3K9o9xCQ+Y8+wrKkU11kWW98Sc=
X-Received: by 2002:a05:6512:c2:b0:443:3d36:970 with SMTP id
 c2-20020a05651200c200b004433d360970mr5245629lfp.46.1645807145292; Fri, 25 Feb
 2022 08:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <8571874.GWnKUVsiaS@silver>
 <CAB26zV2ePB=1ZHogaWndR5cc1Hru9BXRk88cbnN4LahLSFxCmQ@mail.gmail.com>
 <2843831.zseRdOWLSh@silver>
In-Reply-To: <2843831.zseRdOWLSh@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Fri, 25 Feb 2022 11:38:51 -0500
Message-ID: <CAB26zV2PaeWhq_PkwTjC1XaOXB-cBo4fmPgOnnTsjGLBZbUvLw@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000439d1505d8da56a3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000439d1505d8da56a3
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 11:31 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Freitag, 25. Februar 2022 15:00:40 CET Will Cohen wrote:
> > On Tue, Feb 22, 2022 at 9:27 AM Christian Schoenebeck <
> >
> > qemu_oss@crudebyte.com> wrote:
> > > On Sonntag, 20. Februar 2022 17:50:54 CET Will Cohen wrote:
> > > > From: Keno Fischer <keno@juliacomputing.com>
> > > >
> > > > Darwin does not support mknodat. However, to avoid race conditions
> > > > with later setting the permissions, we must avoid using mknod on
> > > > the full path instead. We could try to fchdir, but that would cause
> > > > problems if multiple threads try to call mknodat at the same time.
> > > > However, luckily there is a solution: Darwin includes a function
> > > > that sets the cwd for the current thread only.
> > > > This should suffice to use mknod safely.
> > > >
> > > > This function (pthread_fchdir_np) is protected by a check in
> > > > meson in a patch later in this series.
> > > >
> > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > [Will Cohen: - Adjust coding style
> > > >
> > > >              - Replace clang references with gcc
> > > >              - Note radar filed with Apple for missing syscall
> > > >              - Replace direct syscall with pthread_fchdir_np and
> > > >
> > > >                adjust patch notes accordingly
> > > >
> > > >              - Move qemu_mknodat from 9p-util to osdep and os-posix
> > > >              - Move pthread_fchdir_np declaration only to osdep
> > > >              - Declare pthread_fchdir_np with
> > > >              - __attribute__((weak_import)) to allow checking for
> > > >
> > > >                its presence before usage
> > > >
> > > >              - Move declarations above cplusplus guard
> > > >              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> > > >
> > > >                presence in osdep.h and os-posix.c
> > > >
> > > >              - Rebase to apply cleanly on top of the 2022-02-10
> > > >
> > > >                changes to 9pfs]
> > > >
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-local.c   |  4 ++--
> > > >  include/qemu/osdep.h | 12 ++++++++++++
> > > >  meson.build          |  1 +
> > > >  os-posix.c           | 35 +++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 50 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > > index a0d08e5216..d42ce6d8b8 100644
> > > > --- a/hw/9pfs/9p-local.c
> > > > +++ b/hw/9pfs/9p-local.c
> > > > @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx,
> V9fsPath
> > > > *dir_path,
> > > >
> > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > > >
> > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > >
> > > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > >
> > > >          if (err == -1) {
> > > >
> > > >              goto out;
> > > >
> > > >          }
> > > >
> > > > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx,
> V9fsPath
> > > > *dir_path, }
> > > >
> > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > > >
> > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > >
> > > > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > > credp->fc_rdev);
> > > >
> > > >          if (err == -1) {
> > > >
> > > >              goto out;
> > > >
> > > >          }
> > > >
> > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > index ce12f64853..c0f442d791 100644
> > > > --- a/include/qemu/osdep.h
> > > > +++ b/include/qemu/osdep.h
> > > > @@ -818,6 +818,18 @@ static inline int
> > > > platform_does_not_support_system(const char *command) */
> > > >
> > > >  struct dirent *qemu_dirent_dup(struct dirent *dent);
> > > >
> > > > +/*
> > > > + * As long as mknodat is not available on macOS, this workaround
> > > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > > > + * os-posix.c. pthread_fchdir_np is weakly linked here as a guard
> > > > + * in case it disappears in future macOS versions, because it is
> > > > + * is a private API.
> > > > + */
> > > > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > > > +int pthread_fchdir_np(int fd) __attribute__((weak_import));
> > > > +#endif
> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >
> > > dev);
> > >
> > > > +
> > > >
> > > >  #ifdef __cplusplus
> > > >  }
> > > >  #endif
> > >
> > > Peter just informed me that osdep.h is not the right place to add
> > > something
> > > like this:
> > >
> > >
> https://lore.kernel.org/qemu-devel/CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKL
> > > WUDjk7v6Khmg@mail.gmail.com/
> > >
> > > So this should be moved into a different header file.
> >
> > Does that logic apply here too? In some ways I'd say that mknodat falls
> > into the category of "things without which code would work on most
> > platforms but fail to compile or misbehave on a minority of host OSes."
> If
> > osdep.h is the wrong place, should it go back to 9p-util, where it lived
> > before it moved to osdep?
>
> The other function Peter wanted out from osdep.h would fall into that
> category
> as well. I understand it like "only put things into osdep.h as very last
> resort". CCing Peter on this. If he doesn't give you green light, or on
> doubt,
> then yes please move it from osdep -> 9p-util.
>
> Will, are you planning to send a v9 of this series soon? Next week I need
> to
> add changes that would collide with these here. So if you intend to send
> it
> soon, then I just wait so that we can finally queue these macOS patches
> here
> for QEMU 7.0, before I would go along with my changes.
>
> Best regards,
> Christian Schoenebeck
>

Prepping a v9 now based on all the other changes + the formatting issues.
I'll send this weekend if that's okay!


>
> > > > diff --git a/meson.build b/meson.build
> > > > index ae5f7eec6e..6fdc0281ad 100644
> > > > --- a/meson.build
> > > > +++ b/meson.build
> > > > @@ -1557,6 +1557,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
> > > > cc.has_function('posix_fallocate'
> > > > config_host_data.set('CONFIG_POSIX_MEMALIGN',
> > > > cc.has_function('posix_memalign'))
> config_host_data.set('CONFIG_PPOLL',
> > > > cc.has_function('ppoll'))
> > > >
> > > >  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv',
> prefix:
> > > > '#include <sys/uio.h>'))
> > >
> > > +config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP',
> > >
> > > > cc.has_function('pthread_fchdir_np'))
> > > > config_host_data.set('CONFIG_SEM_TIMEDWAIT',
> > > > cc.has_function('sem_timedwait', dependencies: threads))
> > > > config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> > > > config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and
> > > > cc.has_function('unshare')) diff --git a/os-posix.c b/os-posix.c
> > > > index ae6c9f2a5e..ccc3d1e9d3 100644
> > > > --- a/os-posix.c
> > > > +++ b/os-posix.c
> > > > @@ -332,3 +332,38 @@ int os_mlock(void)
> > > >
> > > >      return -ENOSYS;
> > > >
> > > >  #endif
> > > >  }
> > > >
> > > > +
> > > > +/*
> > > > + * As long as mknodat is not available on macOS, this workaround
> > > > + * using pthread_fchdir_np is needed.
> > > > + *
> > > > + * Radar filed with Apple for implementing mknodat:
> > > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > > + */
> > > > +#if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > > > +
> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >
> > > dev)
> > >
> > > > +{
> > > > +    int preserved_errno, err;
> > > > +    if (!pthread_fchdir_np) {
> > > > +        error_report_once("pthread_fchdir_np() is not available on
> this
> > > > version of macOS"); +        return -ENOTSUP;
> > > > +    }
> > > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > > +        return -1;
> > > > +    }
> > > > +    err = mknod(filename, mode, dev);
> > > > +    preserved_errno = errno;
> > > > +    /* Stop using the thread-local cwd */
> > > > +    pthread_fchdir_np(-1);
> > > > +    if (err < 0) {
> > > > +        errno = preserved_errno;
> > > > +    }
> > > > +    return err;
> > > > +}
> > > > +#else
> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >
> > > dev)
> > >
> > > > +{
> > > > +    return mknodat(dirfd, filename, mode, dev);
> > > > +}
> > > > +#endif
>
>
>

--000000000000439d1505d8da56a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Feb 25, 2022 at 11:31 AM Christia=
n Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudeb=
yte.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Freitag, 25. Februar 2022 15:00:40 CET=
 Will Cohen wrote:<br>
&gt; On Tue, Feb 22, 2022 at 9:27 AM Christian Schoenebeck &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@c=
rudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Sonntag, 20. Februar 2022 17:50:54 CET Will Cohen wrote:<br>
&gt; &gt; &gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing=
.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Darwin does not support mknodat. However, to avoid race cond=
itions<br>
&gt; &gt; &gt; with later setting the permissions, we must avoid using mkno=
d on<br>
&gt; &gt; &gt; the full path instead. We could try to fchdir, but that woul=
d cause<br>
&gt; &gt; &gt; problems if multiple threads try to call mknodat at the same=
 time.<br>
&gt; &gt; &gt; However, luckily there is a solution: Darwin includes a func=
tion<br>
&gt; &gt; &gt; that sets the cwd for the current thread only.<br>
&gt; &gt; &gt; This should suffice to use mknod safely.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This function (pthread_fchdir_np) is protected by a check in=
<br>
&gt; &gt; &gt; meson in a patch later in this series.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@julia=
computing.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reacto=
rcontrol@icloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br=
>
&gt; &gt; &gt; [Will Cohen: - Adjust coding style<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Replace cl=
ang references with gcc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Note radar=
 filed with Apple for missing syscall<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Replace di=
rect syscall with pthread_fchdir_np and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjus=
t patch notes accordingly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move qemu_=
mknodat from 9p-util to osdep and os-posix<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move pthre=
ad_fchdir_np declaration only to osdep<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Declare pt=
hread_fchdir_np with<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - __attribut=
e__((weak_import)) to allow checking for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 its p=
resence before usage<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Move decla=
rations above cplusplus guard<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add CONFIG=
_PTHREAD_FCHDIR_NP to meson and check for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prese=
nce in osdep.h and os-posix.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Rebase to =
apply cleanly on top of the 2022-02-10<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chang=
es to 9pfs]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; &gt;=C2=A0 include/qemu/osdep.h | 12 ++++++++++++<br>
&gt; &gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
&gt; &gt; &gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
5 +++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 4 files changed, 50 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; index a0d08e5216..d42ce6d8b8 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx=
, V9fsPath<br>
&gt; &gt; &gt; *dir_path,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (fs_ctx-&gt;export_flags &amp; V9FS_S=
M_MAPPED ||<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs_ctx-&gt;export_flags &a=
mp; V9FS_SM_MAPPED_FILE) {<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd, name, fs=
_ctx-&gt;fmode | S_IFREG, 0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(dirfd, nam=
e, fs_ctx-&gt;fmode | S_IFREG, 0);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -1) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx=
, V9fsPath<br>
&gt; &gt; &gt; *dir_path, }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (fs_ctx-&gt;export_flags &amp;=
 V9FS_SM_PASSTHROUGH ||<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE) {<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mknodat(dirfd, name, cr=
edp-&gt;fc_mode, credp-&gt;fc_rdev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D qemu_mknodat(dirfd, nam=
e, credp-&gt;fc_mode,<br>
&gt; &gt; &gt; credp-&gt;fc_rdev);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err =3D=3D -1) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; &gt; &gt; index ce12f64853..c0f442d791 100644<br>
&gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt; @@ -818,6 +818,18 @@ static inline int<br>
&gt; &gt; &gt; platform_does_not_support_system(const char *command) */<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 struct dirent *qemu_dirent_dup(struct dirent *dent);<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * As long as mknodat is not available on macOS, this worka=
round<br>
&gt; &gt; &gt; + * using pthread_fchdir_np is needed. qemu_mknodat is defin=
ed in<br>
&gt; &gt; &gt; + * os-posix.c. pthread_fchdir_np is weakly linked here as a=
 guard<br>
&gt; &gt; &gt; + * in case it disappears in future macOS versions, because =
it is<br>
&gt; &gt; &gt; + * is a private API.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +#if defined CONFIG_DARWIN &amp;&amp; defined CONFIG_PTHREAD=
_FCHDIR_NP<br>
&gt; &gt; &gt; +int pthread_fchdir_np(int fd) __attribute__((weak_import));=
<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev);<br>
&gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 #ifdef __cplusplus<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; <br>
&gt; &gt; Peter just informed me that osdep.h is not the right place to add=
<br>
&gt; &gt; something<br>
&gt; &gt; like this:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD=
2wurSVaAHa5mrk22A1oHKL" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa5mrk22A1oHKL</a><br>
&gt; &gt; <a href=3D"http://WUDjk7v6Khmg@mail.gmail.com/" rel=3D"noreferrer=
" target=3D"_blank">WUDjk7v6Khmg@mail.gmail.com/</a><br>
&gt; &gt; <br>
&gt; &gt; So this should be moved into a different header file.<br>
&gt; <br>
&gt; Does that logic apply here too? In some ways I&#39;d say that mknodat =
falls<br>
&gt; into the category of &quot;things without which code would work on mos=
t<br>
&gt; platforms but fail to compile or misbehave on a minority of host OSes.=
&quot; If<br>
&gt; osdep.h is the wrong place, should it go back to 9p-util, where it liv=
ed<br>
&gt; before it moved to osdep?<br>
<br>
The other function Peter wanted out from osdep.h would fall into that categ=
ory <br>
as well. I understand it like &quot;only put things into osdep.h as very la=
st <br>
resort&quot;. CCing Peter on this. If he doesn&#39;t give you green light, =
or on doubt, <br>
then yes please move it from osdep -&gt; 9p-util.<br>
<br>
Will, are you planning to send a v9 of this series soon? Next week I need t=
o <br>
add changes that would collide with these here. So if you intend to send it=
 <br>
soon, then I just wait so that we can finally queue these macOS patches her=
e <br>
for QEMU 7.0, before I would go along with my changes.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br></blockquote><div><br></div><div>Prepping a v9 now=
 based on all the other changes + the formatting issues. I&#39;ll send this=
 weekend if that&#39;s okay!<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
&gt; &gt; &gt; diff --git a/meson.build b/meson.build<br>
&gt; &gt; &gt; index ae5f7eec6e..6fdc0281ad 100644<br>
&gt; &gt; &gt; --- a/meson.build<br>
&gt; &gt; &gt; +++ b/meson.build<br>
&gt; &gt; &gt; @@ -1557,6 +1557,7 @@ config_host_data.set(&#39;CONFIG_POSIX=
_FALLOCATE&#39;,<br>
&gt; &gt; &gt; cc.has_function(&#39;posix_fallocate&#39;<br>
&gt; &gt; &gt; config_host_data.set(&#39;CONFIG_POSIX_MEMALIGN&#39;,<br>
&gt; &gt; &gt; cc.has_function(&#39;posix_memalign&#39;)) config_host_data.=
set(&#39;CONFIG_PPOLL&#39;,<br>
&gt; &gt; &gt; cc.has_function(&#39;ppoll&#39;))<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 config_host_data.set(&#39;CONFIG_PREADV&#39;, cc.has_f=
unction(&#39;preadv&#39;, prefix:<br>
&gt; &gt; &gt; &#39;#include &lt;sys/uio.h&gt;&#39;))<br>
&gt; &gt; <br>
&gt; &gt; +config_host_data.set(&#39;CONFIG_PTHREAD_FCHDIR_NP&#39;,<br>
&gt; &gt; <br>
&gt; &gt; &gt; cc.has_function(&#39;pthread_fchdir_np&#39;))<br>
&gt; &gt; &gt; config_host_data.set(&#39;CONFIG_SEM_TIMEDWAIT&#39;,<br>
&gt; &gt; &gt; cc.has_function(&#39;sem_timedwait&#39;, dependencies: threa=
ds))<br>
&gt; &gt; &gt; config_host_data.set(&#39;CONFIG_SENDFILE&#39;, cc.has_funct=
ion(&#39;sendfile&#39;))<br>
&gt; &gt; &gt; config_host_data.set(&#39;CONFIG_SETNS&#39;, cc.has_function=
(&#39;setns&#39;) and<br>
&gt; &gt; &gt; cc.has_function(&#39;unshare&#39;)) diff --git a/os-posix.c =
b/os-posix.c<br>
&gt; &gt; &gt; index ae6c9f2a5e..ccc3d1e9d3 100644<br>
&gt; &gt; &gt; --- a/os-posix.c<br>
&gt; &gt; &gt; +++ b/os-posix.c<br>
&gt; &gt; &gt; @@ -332,3 +332,38 @@ int os_mlock(void)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * As long as mknodat is not available on macOS, this worka=
round<br>
&gt; &gt; &gt; + * using pthread_fchdir_np is needed.<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * Radar filed with Apple for implementing mknodat:<br>
&gt; &gt; &gt; + * rdar://FB9862426 (<a href=3D"https://openradar.appspot.c=
om/FB9862426" rel=3D"noreferrer" target=3D"_blank">https://openradar.appspo=
t.com/FB9862426</a>)<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +#if defined CONFIG_DARWIN &amp;&amp; defined CONFIG_PTHREAD=
_FCHDIR_NP<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev)<br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (!pthread_fchdir_np) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_once(&quot;pthread=
_fchdir_np() is not available on this<br>
&gt; &gt; &gt; version of macOS&quot;); +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -ENOTSUP;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (pthread_fchdir_np(dirfd) &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 preserved_errno =3D errno;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Stop using the thread-local cwd */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 pthread_fchdir_np(-1);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D preserved_errno;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return err;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev)<br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mode, dev);<b=
r>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +#endif<br>
<br>
<br>
</blockquote></div></div>

--000000000000439d1505d8da56a3--

