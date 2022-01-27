Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B038749EDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:52:24 +0100 (CET)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCgp-0002xm-Bl
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:52:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCcj-0000cJ-9k
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:48:09 -0500
Received: from [2a00:1450:4864:20::129] (port=41528
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCch-0004MB-3R
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:48:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id x7so7925317lfu.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LyfVfGqu0/LlLdtKab+Y2QZVuDZLPQzOBNeNQ2j0flU=;
 b=T9pUVDXmyHOLfndbY6x7gyffwnt+oGzvtt3pLuvxzG8OFTGig8El79HgetNRx5AvfD
 h7sZP8YV2tfNY9L2v8txQjv6esVb6E3D/uMfpbZKLAr0OiC/7c/CYdSJX58Yl8SZt6HW
 ninnofIq0cplcZMqwS3p5TLizZg9mOBm9FcHTZb5Zu7lu/LwETs1KzGNWTjRzI574CE3
 rve34FIh7M9KIguzTp07Est/vjqokmCmW/mSLnyZdQ7uVbbV97OX1cz5GntSLZbIXvCi
 HA0DGIkBHSBkjuUEKj/E+ksuvMhJ+zOq2JkIDaj0uyyoEvWe+IToThSXSv0LyKaWRi6K
 2dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LyfVfGqu0/LlLdtKab+Y2QZVuDZLPQzOBNeNQ2j0flU=;
 b=Vo73TSuCQqP1KepeBgO+r7RxeomYE9GKfcnevDGCGFBAGaRROoxV5LhRYECzhFPcgo
 gdWkvNaBHJ0wjSJ4RsdQqHx20LkgC7oFQedI/6yTeoYUUDz4b1Z5TtoEqREkNundqnAm
 rPNeK+PikTGXHcLn6rJv/HUspLU1YxL2ah9jiF44payYqKXvb3F5BI6JvdbFpMAE0Brg
 gbS1nKDXe8x3v+pS9cUWwLz9SBat1H0pp6s9B17YBeeNjwJrFN37+QHd5k1YmdaY4xO6
 6DB303l0+e4GNjQq700M6s81WlGzIicDGwK6aZUyCeCC9Qx8LMJ1s7gXWQh7k0v3Np+T
 wO0g==
X-Gm-Message-State: AOAM533c1xse2xnlLGX/7QpVpWLNa1ewzt3JtVMyb0jOR0+V0kzjuvY4
 2rTUwutwIIUeJwyMxIfOa2jdvykhDcUsoSSyA1M=
X-Google-Smtp-Source: ABdhPJxIhwqHzVVXZtRDcnPWiZUMEzvaXMx2b0ohVmgDEuEU831DvaM+bnFscy4oYqdDIjSoGcBmherITDjnVJU7F7Q=
X-Received: by 2002:a05:6512:3123:: with SMTP id
 p3mr4277953lfd.298.1643320085520; 
 Thu, 27 Jan 2022 13:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-11-wwcohen@gmail.com>
 <3039867.d4g7DdiYNH@silver>
In-Reply-To: <3039867.d4g7DdiYNH@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 27 Jan 2022 16:47:54 -0500
Message-ID: <CAB26zV3uHf1r9nVUcrcysbvMojHE_Jz5sM941pc_uSSjYNnogg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000f327e305d6974556"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f327e305d6974556
Content-Type: text/plain; charset="UTF-8"

Back when this was being proposed, the original proposer did file such a
report to Apple, but we're still in this situation!

Replacing clang with gcc in v3.

On Wed, Nov 24, 2021 at 12:20 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Montag, 22. November 2021 01:49:12 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Darwin does not support mknodat. However, to avoid race conditions
> > with later setting the permissions, we must avoid using mknod on
> > the full path instead. We could try to fchdir, but that would cause
> > problems if multiple threads try to call mknodat at the same time.
> > However, luckily there is a solution: Darwin as an (unexposed in the
> > C library) system call that sets the cwd for the current thread only.
> > This should suffice to use mknod safely.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust coding style]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c       |  5 +++--
> >  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
> >  hw/9pfs/9p-util-linux.c  |  5 +++++
> >  hw/9pfs/9p-util.h        |  2 ++
> >  4 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index 4268703d05..42b65e143b 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path,
> >
> >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> >          if (err == -1) {
> >              goto out;
> >          }
> > @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path, }
> >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> >          if (err == -1) {
> >              goto out;
> >          }
> > @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path,
> >
> >  err_end:
> >      unlinkat_preserve_errno(dirfd, name, 0);
> > +
> >  out:
> >      close_preserve_errno(dirfd);
> >      return err;
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index ac414bcbfd..25e67d5067 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -158,3 +158,36 @@ done:
> >      close_preserve_errno(fd);
> >      return ret;
> >  }
> > +
> > +#ifndef SYS___pthread_fchdir
> > +# define SYS___pthread_fchdir 349
> > +#endif
> > +
> > +/*
> > + * This is an undocumented OS X syscall. It would be best to avoid it,
> > + * but there doesn't seem to be another safe way to implement mknodat.
> > + * Dear Apple, please implement mknodat before you remove this syscall.
> > + */
> > +static int fchdir_thread_local(int fd)
>
> Hooo, that's a brave move. Shouldn't its future and likely becoming
> absence be
> guarded "somehow"? :)
>
> BTW it might make sense to file a report instead of hoping Apple will just
> read this comment: ;-)
> https://feedbackassistant.apple.com/
>
> > +{
> > +#pragma clang diagnostic push
> > +#pragma clang diagnostic ignored "-Wdeprecated-declarations"
> > +    return syscall(SYS___pthread_fchdir, fd);
> > +#pragma clang diagnostic pop
> > +}
>
> Consider s/clang/GCC/ then it would also work with GCC. In the end most
> people
> probably just use clang on macOS anyway, but just saying.
>
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    int preserved_errno, err;
> > +    if (fchdir_thread_local(dirfd) < 0) {
> > +        return -1;
> > +    }
> > +    err = mknod(filename, mode, dev);
> > +    preserved_errno = errno;
> > +    /* Stop using the thread-local cwd */
> > +    fchdir_thread_local(-1);
> > +    if (err < 0) {
> > +        errno = preserved_errno;
> > +    }
> > +    return err;
> > +}
> > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> > index d54bf57a59..4f57d8c047 100644
> > --- a/hw/9pfs/9p-util-linux.c
> > +++ b/hw/9pfs/9p-util-linux.c
> > @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char *filename,
> >  {
> >      return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
> >  }
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    return mknodat(dirfd, filename, mode, dev);
> > +}
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 1c477a0e66..cac682d335 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> > *filename, int utimensat_nofollow(int dirfd, const char *filename,
> >                         const struct timespec times[2]);
> >
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev);
> > +
> >  #endif
>
>
>

--000000000000f327e305d6974556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Back when this was being proposed, the original propo=
ser did file such a report to Apple, but we&#39;re still in this situation!=
</div><div><br></div><div>Replacing clang with gcc in v3.<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Nov 24, 2021 at 12:20 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_o=
ss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Montag, 22. No=
vember 2021 01:49:12 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Darwin does not support mknodat. However, to avoid race conditions<br>
&gt; with later setting the permissions, we must avoid using mknod on<br>
&gt; the full path instead. We could try to fchdir, but that would cause<br=
>
&gt; problems if multiple threads try to call mknodat at the same time.<br>
&gt; However, luckily there is a solution: Darwin as an (unexposed in the<b=
r>
&gt; C library) system call that sets the cwd for the current thread only.<=
br>
&gt; This should suffice to use mknod safely.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Adjust coding style]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
&gt;=C2=A0 hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++<=
br>
&gt;=C2=A0 hw/9pfs/9p-util-linux.c=C2=A0 |=C2=A0 5 +++++<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 4 files changed, 43 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index 4268703d05..42b65e143b 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath=
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
&gt; @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath=
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
&gt; @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath=
<br>
&gt; *dir_path,<br>
&gt; <br>
&gt;=C2=A0 err_end:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unlinkat_preserve_errno(dirfd, name, 0);<br>
&gt; +<br>
&gt;=C2=A0 out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 close_preserve_errno(dirfd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return err;<br>
&gt; diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c<br>
&gt; index ac414bcbfd..25e67d5067 100644<br>
&gt; --- a/hw/9pfs/9p-util-darwin.c<br>
&gt; +++ b/hw/9pfs/9p-util-darwin.c<br>
&gt; @@ -158,3 +158,36 @@ done:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +#ifndef SYS___pthread_fchdir<br>
&gt; +# define SYS___pthread_fchdir 349<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This is an undocumented OS X syscall. It would be best to avoid it=
,<br>
&gt; + * but there doesn&#39;t seem to be another safe way to implement mkn=
odat.<br>
&gt; + * Dear Apple, please implement mknodat before you remove this syscal=
l.<br>
&gt; + */<br>
&gt; +static int fchdir_thread_local(int fd)<br>
<br>
Hooo, that&#39;s a brave move. Shouldn&#39;t its future and likely becoming=
 absence be <br>
guarded &quot;somehow&quot;? :)<br>
<br>
BTW it might make sense to file a report instead of hoping Apple will just =
<br>
read this comment: ;-)<br>
<a href=3D"https://feedbackassistant.apple.com/" rel=3D"noreferrer" target=
=3D"_blank">https://feedbackassistant.apple.com/</a><br>
<br>
&gt; +{<br>
&gt; +#pragma clang diagnostic push<br>
&gt; +#pragma clang diagnostic ignored &quot;-Wdeprecated-declarations&quot=
;<br>
&gt; +=C2=A0 =C2=A0 return syscall(SYS___pthread_fchdir, fd);<br>
&gt; +#pragma clang diagnostic pop<br>
&gt; +}<br>
<br>
Consider s/clang/GCC/ then it would also work with GCC. In the end most peo=
ple <br>
probably just use clang on macOS anyway, but just saying.<br>
<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; +=C2=A0 =C2=A0 if (fchdir_thread_local(dirfd) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
&gt; +=C2=A0 =C2=A0 preserved_errno =3D errno;<br>
&gt; +=C2=A0 =C2=A0 /* Stop using the thread-local cwd */<br>
&gt; +=C2=A0 =C2=A0 fchdir_thread_local(-1);<br>
&gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D preserved_errno;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return err;<br>
&gt; +}<br>
&gt; diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c<br>
&gt; index d54bf57a59..4f57d8c047 100644<br>
&gt; --- a/hw/9pfs/9p-util-linux.c<br>
&gt; +++ b/hw/9pfs/9p-util-linux.c<br>
&gt; @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char *filena=
me,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return utimensat(dirfd, filename, times, AT_SYMLIN=
K_NOFOLLOW);<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mode, dev);<br>
&gt; +}<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 1c477a0e66..cac682d335 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const c=
har<br>
&gt; *filename, int utimensat_nofollow(int dirfd, const char *filename,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const struct timespec times[2]);<br>
&gt; <br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev);<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
<br>
<br>
</blockquote></div>

--000000000000f327e305d6974556--

