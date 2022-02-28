Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9284C6EC1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:59:41 +0100 (CET)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgYu-00060U-Ps
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOgDN-0006bC-P5
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:37:25 -0500
Received: from [2a00:1450:4864:20::233] (port=34772
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOgDL-0004qb-Bm
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:37:25 -0500
Received: by mail-lj1-x233.google.com with SMTP id r20so17457684ljj.1
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xHkp5VplCWvchMuRwOgANnFroOKzo8fy6KiyAhBK3Ec=;
 b=l1w43l8/hmtcs6T6nCb7s+cvQdPa6tcDAm0dcLf3OFVcsWZ0UVFXm4ryXi7ojSqgQU
 PKf0SBv79ApuetXs7HnWRekndgYE3WKh4hAADAHBVKTK/GXKB2JvZt0p64/Ulm0WYUCJ
 r0HGxnaOGcUdInbiSEY6r0gdZzKnvSk2yKGeP0DVsEYjbpUmGGkbhXc8Yq/bxDXk5QMs
 w5vi5gz9O9d3oYqPfYj15pEiUd9G2cnhLSD4uR9fLUEGfENZ8wu8e1pxkRpAj/kq4WQK
 Q3ScMT3yGur5KyW2EPLHc/yy7f0goKjyyapN8miqE0atPkZPhSlUiOMuVG8CXA5bMMlP
 lSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xHkp5VplCWvchMuRwOgANnFroOKzo8fy6KiyAhBK3Ec=;
 b=vJQMJawzoj9tu/PGyfzwgJfNCr49FdwrEFQG+2ExuSUz9EyrMWrMhEVxQDDomaAKH7
 kLSBRIKP7hsNXC9Zp7Z65rQvUPPCBy+0QpmuGggVdIJ9MZF2NDV1GroPpM+H+/4CQzN/
 z7Ya1XeOqABzfCpKqADjChH0kepKwoAvDRjuKhCIhnzks5dm2GO6Php14q4MAinZFqO0
 u6+tUygKdyV9tPPTyn2qsTYd57RXK+1ymduD2dmzskaSLIUkO7KAwzJFD3dCQbCMcm36
 d0z3YcIQF5gMkHcPD0MM7kqPlbSzUf9WZaPFDQW82l26BqwFg1Q/2/QA+IGXzK9WyjWV
 WhRw==
X-Gm-Message-State: AOAM532IJMKZptwgKQcSUZMuX5mJ0ZBC/nsM8bcAh7Er4iDrzpNFIdcB
 LXFVcl4XPhFPEzNFY8MeEJI7uesoXVP4RD6bQEI=
X-Google-Smtp-Source: ABdhPJw5emTST3Lw7XbVJVR5UeEfbYETtOBGyRwnBm/Rqa+Gdta5GvwXoA1mKkOdbd1w6HpnMpcYPCgRnfokuYBa8No=
X-Received: by 2002:a2e:a4b4:0:b0:246:2930:53d7 with SMTP id
 g20-20020a2ea4b4000000b00246293053d7mr13798670ljm.74.1646055441431; Mon, 28
 Feb 2022 05:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com>
 <5277572.8N0aQqchxN@silver>
In-Reply-To: <5277572.8N0aQqchxN@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 28 Feb 2022 08:37:10 -0500
Message-ID: <CAB26zV1WGKCCD3xHzKq-DWuX7fNRo-jk8of6kPNVN0eH=yW5Ag@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000ddff0f05d91425ba"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x233.google.com
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ddff0f05d91425ba
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 8:20 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:
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
> >              - Declare pthread_fchdir_np with
> >              - __attribute__((weak_import)) to allow checking for
> >                its presence before usage
> >              - Move declarations above cplusplus guard
> >              - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> >                presence in 9p-util
> >              - Rebase to apply cleanly on top of the 2022-02-10
> >                changes to 9pfs
> >              - Fix line over 90 characters formatting error]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c       |  4 ++--
> >  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
> >  hw/9pfs/9p-util-linux.c  |  6 ++++++
> >  hw/9pfs/9p-util.h        | 11 +++++++++++
> >  meson.build              |  1 +
> >  5 files changed, 53 insertions(+), 2 deletions(-)
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
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index cdb4c9e24c..bec0253474 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -7,6 +7,8 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "qemu/xattr.h"
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> >  #include "9p-util.h"
> >
> >  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char
> > *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename, const char *name, close_preserve_errno(fd);
> >      return ret;
> >  }
> > +
> > +/*
> > + * As long as mknodat is not available on macOS, this workaround
> > + * using pthread_fchdir_np is needed.
> > + *
> > + * Radar filed with Apple for implementing mknodat:
> > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > + */
> > +#if defined CONFIG_PTHREAD_FCHDIR_NP
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    int preserved_errno, err;
> > +    if (!pthread_fchdir_np) {
> > +        error_report_once("pthread_fchdir_np() not available on this
> version of macOS");
>
> You took the code style error message a bit too literal; this line is still
> too long:
>
> WARNING: line over 80 characters
> #199: FILE: hw/9pfs/9p-util-darwin.c:81:
> +        error_report_once("pthread_fchdir_np() not available on this
> version of macOS");
>
> total: 0 errors, 1 warnings, 91 lines checked
>
> However this is too trivial to send a v10 just for this. If there are no
> other
> issues in this v9 then I'll simply fix this on my end. My plan is to queue
> this series tomorrow.
>
> Best regards,
> Christian Schoenebeck


Sorry for the over-literalness. I was just trying to avoid a need for
further changes by being too dramatic on my end for a small fix! Any
stylistic changes needed here are, of course, totally acceptable!

>
>
> > +        return -ENOTSUP;
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
> > +
> > +#endif
> > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> > index 398614a5d0..db451b0784 100644
> > --- a/hw/9pfs/9p-util-linux.c
> > +++ b/hw/9pfs/9p-util-linux.c
> > @@ -61,4 +61,10 @@ int fsetxattrat_nofollow(int dirfd, const char
> *filename,
> > const char *name, ret = lsetxattr(proc_path, name, value, size, flags);
> >      g_free(proc_path);
> >      return ret;
> > +
> > +}
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    return mknodat(dirfd, filename, mode, dev);
> >  }
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 9abff79884..1f74d37558 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -112,5 +112,16 @@ static inline off_t qemu_dirent_off(struct dirent
> > *dent) #endif
> >  }
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
> >
> >  #endif
> > diff --git a/meson.build b/meson.build
> > index 8df40bfac4..3f8dca2c7a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1609,6 +1609,7 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE',
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
> > cc.has_function('unshare'))
>
>
>

--000000000000ddff0f05d91425ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div>On Mon, Feb 28, 2022 at 8:20 AM Christian Schoenebeck &lt;<a href=
=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com=
</a>&gt; wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 presence in 9p-=
util<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Rebase to apply clea=
nly on top of the 2022-02-10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 changes to 9pfs=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Fix line over 90 cha=
racters formatting error]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++<=
br>
&gt;=C2=A0 hw/9pfs/9p-util-linux.c=C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br=
>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 5 files changed, 53 insertions(+), 2 deletions(-)<br>
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
&gt; diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c<br>
&gt; index cdb4c9e24c..bec0253474 100644<br>
&gt; --- a/hw/9pfs/9p-util-darwin.c<br>
&gt; +++ b/hw/9pfs/9p-util-darwin.c<br>
&gt; @@ -7,6 +7,8 @@<br>
&gt; <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/xattr.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 #include &quot;9p-util.h&quot;<br>
&gt; <br>
&gt;=C2=A0 ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, co=
nst char<br>
&gt; *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const ch=
ar<br>
&gt; *filename, const char *name, close_preserve_errno(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
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
&gt; +#if defined CONFIG_PTHREAD_FCHDIR_NP<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; +=C2=A0 =C2=A0 if (!pthread_fchdir_np) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_once(&quot;pthread_fchdir_np=
() not available on this version of macOS&quot;);<br>
<br>
You took the code style error message a bit too literal; this line is still=
<br>
too long:<br>
<br>
WARNING: line over 80 characters<br>
#199: FILE: hw/9pfs/9p-util-darwin.c:81:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_once(&quot;pthread_fchdir_np() no=
t available on this version of macOS&quot;);<br>
<br>
total: 0 errors, 1 warnings, 91 lines checked<br>
<br>
However this is too trivial to send a v10 just for this. If there are no ot=
her<br>
issues in this v9 then I&#39;ll simply fix this on my end. My plan is to qu=
eue<br>
this series tomorrow.<br>
<br>
Best regards,<br>
Christian Schoenebeck</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Sorry for the over-literalness. I was just trying to avoid a need for =
further changes by being too dramatic on my end for a small fix! Any stylis=
tic changes needed here are, of course, totally acceptable!</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto"><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
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
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c<br>
&gt; index 398614a5d0..db451b0784 100644<br>
&gt; --- a/hw/9pfs/9p-util-linux.c<br>
&gt; +++ b/hw/9pfs/9p-util-linux.c<br>
&gt; @@ -61,4 +61,10 @@ int fsetxattrat_nofollow(int dirfd, const char *fil=
ename,<br>
&gt; const char *name, ret =3D lsetxattr(proc_path, name, value, size, flag=
s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(proc_path);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mode, dev);<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 9abff79884..1f74d37558 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -112,5 +112,16 @@ static inline off_t qemu_dirent_off(struct dirent=
<br>
&gt; *dent) #endif<br>
&gt;=C2=A0 }<br>
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
&gt; <br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 8df40bfac4..3f8dca2c7a 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1609,6 +1609,7 @@ config_host_data.set(&#39;CONFIG_POSIX_FALLOCATE=
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
&gt; cc.has_function(&#39;unshare&#39;))<br>
<br>
<br>
</blockquote></div></div>
</div>

--000000000000ddff0f05d91425ba--

