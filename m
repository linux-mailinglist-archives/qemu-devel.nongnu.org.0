Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F134ADF24
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:17:48 +0100 (CET)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU7f-0003PG-IF
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHSsi-0007DH-E6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:58:19 -0500
Received: from [2a00:1450:4864:20::232] (port=34738
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHSsc-00065n-E9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:58:13 -0500
Received: by mail-lj1-x232.google.com with SMTP id o17so25138982ljp.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nnm7sDW3IPBHpvFEsfmqDzT2Npgm9IrDOtrpMPEZVAI=;
 b=DuwwDjktTbBhaZcZm7RjxAGp2Vobcx6lrA1Z2MkUYTHYuLDahaKtpbj5DulA9367Sy
 5Fl3nHfE7NbaSRpS/SZa69170v+3W9d70IBLTCltbuwUVLB687nv8d1h2O005wL+EHfO
 E1jifwU0lQUZReG0tt6xcFkQKdvRWstT5RiWvSHUjNVpJYe7VJGeymla/R0J9aAfh6x+
 mtFo2vR98MWivvJ4vjmYvdykZbewkh9GUlc9bUM1Wths+9aH/kbZcRJbbn/FSZVS3ES/
 WEflGey/ZZ7fVqTF2QIeLA/2MtiX0BqaguuE0/BL0/kAbEODHfAfD4/8qLwnXX76ceAB
 mgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nnm7sDW3IPBHpvFEsfmqDzT2Npgm9IrDOtrpMPEZVAI=;
 b=nfbRl4GYkYhb4B05BTKF22NamYz3t9JH4hCXPhlgKeI85DZzJ3vs44h3Q1zRrzuoa4
 JPSTHQ058WG8fyB4VZAL49w53yUknwufDBaedAyKsyF5V0S2A4Ztk7xT4jd6XDwAMbCC
 E84fmojtRwXADZ0VDkm4gz+NHnw6ymA6ep2Ywtnn1c3tYq69noO8RapJshHdEzUFbOkL
 uQ+253FzC7CwUwEPkLq91+SpZvp2kdYhm6WEAIa8zndp0ZKcIIVRqJ9jyQXlmEW1eUL3
 CPAt6TUMAYYRNCTsTXkEEMz8aaq8e8aM2rNAxZbiiXoxqk5HfIXvj4MzDj7eRfSLA2Oc
 OVvw==
X-Gm-Message-State: AOAM530z2U+oOBmT7Pp9tENArK8Tgn2DwXRH/xhUhlmfsCHriIP8bSe9
 /V8SOBXtstbOXmlGrn4HAtB0JiIYj9FJHGxTT3I=
X-Google-Smtp-Source: ABdhPJw5eW5bKCVsqdmLWAjjq8P3RdbPml+uykLMJXfjpZwzRvLzJM0o2DQIjIFoAePxnLtAwpbqvMmhEn2pgtufYS8=
X-Received: by 2002:a2e:bc11:: with SMTP id b17mr3190635ljf.74.1644335888501; 
 Tue, 08 Feb 2022 07:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <2714656.jhBehFKKHS@silver>
 <CAB26zV3fC6YDCjVrez2n4TNVmzSVqCs-hDBM0Vv+wmiQeot9EA@mail.gmail.com>
 <44442748.7pOeeLDITA@silver>
In-Reply-To: <44442748.7pOeeLDITA@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 8 Feb 2022 10:57:55 -0500
Message-ID: <CAB26zV20ptbz+A9AvV9H_8rv19s2gD6+XBUJGtse2s6zq_HsYA@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000008690e605d783c847"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x232.google.com
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

--0000000000008690e605d783c847
Content-Type: text/plain; charset="UTF-8"

My inclination is to go with the __builtin_available(macOS 10.12, *) path,
if acceptable, since it partially mirrors the API_AVAILABLE macro idea. I
guess it's perhaps a tradeoff between predicting the future unknown
availability of functions versus just ensuring a minimum macOS version and
hoping for the best. With any luck, the distinction between the two
approaches will be moot, if we try to assume that a future macOS version
that removes this also provides mknodat.

On Tue, Feb 8, 2022 at 10:03 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wrote:
> > On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck
> > <qemu_oss@crudebyte.com>
> > wrote:
> > > On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:
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
> > > > meson in a patch later in tihs series.
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
> > > >              - Move qemu_mknodat from 9p-util to osdep and os-posix]
> > > >
> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > ---
> > >
> > > Like already mentioned by me moments ago on previous v4 (just echoing)
> ...
> > >
> > > >  hw/9pfs/9p-local.c   |  4 ++--
> > > >  include/qemu/osdep.h | 10 ++++++++++
> > > >  os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 46 insertions(+), 2 deletions(-)
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
> > > > index d1660d67fa..f3a8367ece 100644
> > > > --- a/include/qemu/osdep.h
> > > > +++ b/include/qemu/osdep.h
> > > > @@ -810,3 +810,13 @@ static inline int
> > > > platform_does_not_support_system(const char *command) #endif
> > > >
> > > >  #endif
> > > >
> > > > +
> > > > +/*
> > > > + * As long as mknodat is not available on macOS, this workaround
> > > > + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> > > > + * os-posix.c
> > > > + */
> > > > +#ifdef CONFIG_DARWIN
> > > > +int pthread_fchdir_np(int fd);
> > > > +#endif
> > >
> > > I would make that:
> > >
> > > #ifdef CONFIG_DARWIN
> > > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > > #endif
> > >
> > > here and ...
> > >
> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >
> > > dev);
> > >
> > > > diff --git a/os-posix.c b/os-posix.c
> > > > index ae6c9f2a5e..95c1607065 100644
> > > > --- a/os-posix.c
> > > > +++ b/os-posix.c
> > > > @@ -24,6 +24,7 @@
> > > >
> > > >   */
> > > >
> > > >  #include "qemu/osdep.h"
> > > >
> > > > +#include <os/availability.h>
> > > >
> > > >  #include <sys/wait.h>
> > > >  #include <pwd.h>
> > > >  #include <grp.h>
> > > >
> > > > @@ -332,3 +333,36 @@ int os_mlock(void)
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
> > > > +#ifdef CONFIG_DARWIN
> > > > +
> > > > +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> > >
> > > ... drop the duplicate declaration of pthread_fchdir_np() here.
> >
> > Trying this out, it reminds me that this use of API_AVAILABLE in
> os-posix.c
> > relies on the added #include <os/availability.h>.
> >
> > Leaving the include out leads to:
> > .../include/qemu/osdep.h:820:31: error: expected function body after
> > function declarator
> > int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
> >                               ^
> > 1 error generated.
> > ninja: build stopped: subcommand failed.
> > make[1]: *** [run-ninja] Error 1
> > make: *** [all] Error 2
> >
> > The admonition against modifying osdep.h's includes too much led me to
> > steer away from putting it all in there. If there's no issue with adding
> > +#include <os/availability.h> to osdep.h, then this change makes sense to
> > me.
>
> If you embed that include into ifdefs, sure!
>
> #ifdef CONFIG_DARWIN
> /* defines API_AVAILABLE(...) */
> #include <os/availability.h>
> #endif
>
> One more thing though ...
>
> > > > +
> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > >
> > > dev)
> > >
> > > > +{
> > > > +    int preserved_errno, err;
>
> pthread_fchdir_np() is weakly linked. So I guess here should be a check
> like:
>
>         if (!pthread_fchdir_np) {
>                 return -ENOTSUPP;
>         }
>
> Before trying to call pthread_fchdir_np() below. As already discussed with
> the
> Chromium [1] example, some do that a bit differently by using
> __builtin_available():
>
>         if (__builtin_available(macOS 10.12, *)) {
>                 return -ENOTSUPP;
>         }
>
> Which makes me wonder why they are not doing a simple NULL check?
>
> [1]
> https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_mac.cc#110
>
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

--0000000000008690e605d783c847
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My inclination is to go with the __builtin_available(macOS=
 10.12, *) path, if acceptable, since it partially mirrors the API_AVAILABL=
E macro idea. I guess it&#39;s perhaps a tradeoff between predicting the fu=
ture unknown availability of functions versus just ensuring a minimum macOS=
 version and hoping for the best. With any luck, the distinction between th=
e two approaches will be moot, if we try to assume that a future macOS vers=
ion that removes this also provides mknodat.<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 10:0=
3 AM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qe=
mu_oss@crudebyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Dienstag, 8. Februar 2022 14:36:42 CET Will Cohen wr=
ote:<br>
&gt; On Mon, Feb 7, 2022 at 5:56 PM Christian Schoenebeck<br>
&gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_o=
ss@crudebyte.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Montag, 7. Februar 2022 23:40:22 CET Will Cohen wrote:<br>
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
&gt; &gt; &gt; meson in a patch later in tihs series.<br>
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
mknodat from 9p-util to osdep and os-posix]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; Like already mentioned by me moments ago on previous v4 (just ech=
oing) ...<br>
&gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; &gt;=C2=A0 include/qemu/osdep.h | 10 ++++++++++<br>
&gt; &gt; &gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
4 ++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 3 files changed, 46 insertions(+), 2 deletions(-)<br>
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
&gt; &gt; &gt; index d1660d67fa..f3a8367ece 100644<br>
&gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt; &gt; &gt; @@ -810,3 +810,13 @@ static inline int<br>
&gt; &gt; &gt; platform_does_not_support_system(const char *command) #endif=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * As long as mknodat is not available on macOS, this worka=
round<br>
&gt; &gt; &gt; + * using pthread_fchdir_np is needed. qemu_mknodat is defin=
ed in<br>
&gt; &gt; &gt; + * os-posix.c<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt; +int pthread_fchdir_np(int fd);<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; <br>
&gt; &gt; I would make that:<br>
&gt; &gt; <br>
&gt; &gt; #ifdef CONFIG_DARWIN<br>
&gt; &gt; int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));<br>
&gt; &gt; #endif<br>
&gt; &gt; <br>
&gt; &gt; here and ...<br>
&gt; &gt; <br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev);<br>
&gt; &gt; <br>
&gt; &gt; &gt; diff --git a/os-posix.c b/os-posix.c<br>
&gt; &gt; &gt; index ae6c9f2a5e..95c1607065 100644<br>
&gt; &gt; &gt; --- a/os-posix.c<br>
&gt; &gt; &gt; +++ b/os-posix.c<br>
&gt; &gt; &gt; @@ -24,6 +24,7 @@<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +#include &lt;os/availability.h&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 #include &lt;sys/wait.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;grp.h&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -332,3 +333,36 @@ int os_mlock(void)<br>
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
&gt; &gt; &gt; +#ifdef CONFIG_DARWIN<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));=
<br>
&gt; &gt; <br>
&gt; &gt; ... drop the duplicate declaration of pthread_fchdir_np() here.<b=
r>
&gt; <br>
&gt; Trying this out, it reminds me that this use of API_AVAILABLE in os-po=
six.c<br>
&gt; relies on the added #include &lt;os/availability.h&gt;.<br>
&gt; <br>
&gt; Leaving the include out leads to:<br>
&gt; .../include/qemu/osdep.h:820:31: error: expected function body after<b=
r>
&gt; function declarator<br>
&gt; int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; 1 error generated.<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt; make[1]: *** [run-ninja] Error 1<br>
&gt; make: *** [all] Error 2<br>
&gt; <br>
&gt; The admonition against modifying osdep.h&#39;s includes too much led m=
e to<br>
&gt; steer away from putting it all in there. If there&#39;s no issue with =
adding<br>
&gt; +#include &lt;os/availability.h&gt; to osdep.h, then this change makes=
 sense to<br>
&gt; me.<br>
<br>
If you embed that include into ifdefs, sure!<br>
<br>
#ifdef CONFIG_DARWIN<br>
/* defines API_AVAILABLE(...) */<br>
#include &lt;os/availability.h&gt;<br>
#endif<br>
<br>
One more thing though ...<br>
<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev)<br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
<br>
pthread_fchdir_np() is weakly linked. So I guess here should be a check lik=
e:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pthread_fchdir_np) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUPP;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Before trying to call pthread_fchdir_np() below. As already discussed with =
the<br>
Chromium [1] example, some do that a bit differently by using<br>
__builtin_available():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__builtin_available(macOS 10.12, *)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUPP;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Which makes me wonder why they are not doing a simple NULL check?<br>
<br>
[1] <a href=3D"https://chromium.googlesource.com/chromium/src/+/lkgr/base/p=
rocess/launch_mac.cc#110" rel=3D"noreferrer" target=3D"_blank">https://chro=
mium.googlesource.com/chromium/src/+/lkgr/base/process/launch_mac.cc#110</a=
><br>
<br>
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
</blockquote></div>

--0000000000008690e605d783c847--

