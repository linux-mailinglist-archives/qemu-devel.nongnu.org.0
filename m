Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA44ACC5D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:57:50 +0100 (CET)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCxB-0002Dw-Kl
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCvL-00008c-AQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:55:55 -0500
Received: from [2a00:1450:4864:20::132] (port=43524
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCvG-0007r5-F7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:55:54 -0500
Received: by mail-lf1-x132.google.com with SMTP id u6so29760691lfm.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzrttEmtF4BR8x43y/JifBU2uPJkUu811DTCbO3dJKU=;
 b=fBW1KLrqYRT4LsH1z4r7R6W8RHlEf5xqDmomEfjz08GDaqJUsV3SsXcMke2oarr/PD
 uMGTTFOKteFPhnVgZ7UCD8eYIQzFgzhcVfqkWPMrFC8Sl88vAmtvYJFt9qlkYOF4Fzc9
 7YzweO39dCXtT6slGKemhOSnCXLlL22oxUBNFGoT0oPXGlf6JLglTBWNZK2XzsTOkiLC
 5OybgqVN74Cm2//1QKc1vsK9J0I9erf+aJWil7xJTG/OjOLV0u1nwl0xye34PBOoYWYM
 dhNO9fD5/CObJ1v0hcad1OUr/cyjIclB9Nf8BOEHt1uNGEpl/LwDeMXWXRx/fMmVH544
 rkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzrttEmtF4BR8x43y/JifBU2uPJkUu811DTCbO3dJKU=;
 b=lWNWdVJJUh0nc1SspwX6aw35mnq/37DVwDWouvpDxRBeWUH3ze+lPDYjrqGh82HWlh
 ZFl3jr6v6W5nMSjiiJr6KxyUJfOvD1MdxR/ObrsjQt0npwIh+tV41jcr04Tg9HZOxEKG
 cmtt59Clb0l7ODDj36Hq5y8QBVyU45W5GR/wZCo9eTBz6MJnFq2MeTp6LNP18ukvlAxz
 C2Q/HBlPWC62JkPamr31U1UcgS6mvG+iSiQQxddCcL9Klz26tjLjwIpmpo8fBSTbpX1B
 zqEtPitz7ifM0yOGpbFWRsiEQplE5wL4N5ClMVGYDnAZRBnvaDOdcF/GX8DM0DcYNa2/
 Vf6Q==
X-Gm-Message-State: AOAM531w9Qam58ayr6Row0W5XlEIqGunFVzLnlDfLr8EbtHwpMf8SiPq
 72e3HQrWUUV+7WiyLLwvkn93P97mEyJCq7r8vic=
X-Google-Smtp-Source: ABdhPJyFHjRagUs3qVxX0e8pKAFkW5ACjWAv4h+Jv+rnYQv8UUHFKrls1uncS1XjLie6EnK33e3Mk1yNZeZrB0WMEyQ=
X-Received: by 2002:a05:6512:2243:: with SMTP id
 i3mr1146946lfu.598.1644274542898; 
 Mon, 07 Feb 2022 14:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <5204641.elYuxvqpol@silver>
 <CAB26zV23fCzmtQd+heort4rXkqU0SD-dSBVwzabxE-64edWFmg@mail.gmail.com>
 <8937604.n9ZydULHvW@silver>
In-Reply-To: <8937604.n9ZydULHvW@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 17:55:31 -0500
Message-ID: <CAB26zV2kf64p=oi9zz1BhzyATa3eiWY7ooQbtUM34MGhXTX33A@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000000af25e05d7758053"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x132.google.com
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
 hi@alyssa.is, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Michael Roitzsch <reactorcontrol@icloud.com>,
 Vivek <vgoyal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000af25e05d7758053
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 5:48 PM Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
wrote:

> On Montag, 7. Februar 2022 22:07:34 CET Will Cohen wrote:
> > On Mon, Feb 7, 2022 at 9:21 AM Christian Schoenebeck
> > <qemu_oss@crudebyte.com>
> > wrote:
> > > On Montag, 7. Februar 2022 11:57:25 CET Dr. David Alan Gilbert wrote:
> > > > * Greg Kurz (groug@kaod.org) wrote:
> > > > > On Mon, 7 Feb 2022 11:30:18 +0100
> > > > >
> > > > > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > > > > > On 7/2/22 09:47, Greg Kurz wrote:
> > > > > > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > > > > >
> > > > > > > Will Cohen <wwcohen@gmail.com> wrote:
> > > > > > >> This patch set currently places it in 9p-util only because 9=
p
> is
> > >
> > > the
> > >
> > > > > > >> only
> > > > > > >> place where this issue seems to have come up so far and we
> were
> > >
> > > wary
> > >
> > > > > > >> of
> > > > > > >> editing files too far afield, but I have no attachment to it=
s
> > > > > > >> specific
> > > > > > >> location!
> > > > > > >
> > > > > > > Inline comments are preferred on qemu-devel. Please don't top
> post
> > >
> > > !
> > >
> > > > > > > This complicates the review a lot.
> > > > > > >
> > > > > > > This is indeed a good candidate for osdep. This being said,
> unless
> > > > > > > there's
> > > > > > > some other user in the QEMU code base, it is acceptable to
> leave
> > > > > > > it
> > > > > > > under
> > > > > > > 9pfs.
> > > > > >
> > > > > > virtiofsd could eventually use it.
> > > > >
> > > > > Indeed but virtiofsd is for linux hosts only AFAICT and I'm not
> aware
> > >
> > > of
> > >
> > > > > any work to support any other host OS.
> > > > >
> > > > > Cc'ing virtio-fs people for inputs on this topic.
> > > >
> > > > Indeeed, there's a lot of Linux specific code in the virtiofsd - I
> know
> > > > people are interested in other platforms, but I'm not sure that's t=
he
> > > > right starting point.
> > > >
> > > > Dave
> > >
> > > Agreeing with Greg here: i.e. I would have placed this into osdep, bu=
t
> I
> > > would
> > > not insist on it either.
> > >
> > > Best regards,
> > > Christian Schoenebeck
> >
> > This makes sense. A revised version of this patch, moving qemu_mknodat
> from
> > 9p-util to osdep and os-posix, is attached below. I'd appreciate any
> > feedback from those looped in here, so that the context isn't lost befo=
re
> > resubmitting as a v5 patch, especially since this is starting to touch
> > files outside of 9p.
> >
> > From c9713c87163da7c96b5357d0d85ac318ae3d3051 Mon Sep 17 00:00:00 2001
> > From: Keno Fischer <keno@juliacomputing.com>
> > Date: Sat, 16 Jun 2018 20:56:55 -0400
> > Subject: [PATCH] 9p: darwin: Implement compatibility for mknodat
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
> > -        err =3D mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > +        err =3D qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> >          if (err =3D=3D -1) {
> >              goto out;
> >          }
> > @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > *dir_path,
> >          }
> >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > -        err =3D mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > +        err =3D qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rd=
ev);
> >          if (err =3D=3D -1) {
> >              goto out;
> >          }
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..f3a8367ece 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -810,3 +810,13 @@ static inline int
> > platform_does_not_support_system(const char *command)
> >  #endif
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
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev)
> > +{
> > +    int preserved_errno, err;
> > +    if (pthread_fchdir_np(dirfd) < 0) {
> > +        return -1;
> > +    }
> > +    err =3D mknod(filename, mode, dev);
> > +    preserved_errno =3D errno;
> > +    /* Stop using the thread-local cwd */
> > +    pthread_fchdir_np(-1);
> > +    if (err < 0) {
> > +        errno =3D preserved_errno;
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

Noted and all of that makes sense to me. Sorry about trying to lump this in
v4. If more things come up with v5 I'll stick these changes in for v6 as
well. If there's no other major comments with v5, I can either still
resubmit as v6 or defer to whatever process is easiest for the maintainers
to integrate, given that I accept all of these modifications.

--0000000000000af25e05d7758053
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 7, 2022 at 5:48 PM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Montag, 7. Februar 2022 22:07:34 CET Wi=
ll Cohen wrote:<br>
&gt; On Mon, Feb 7, 2022 at 9:21 AM Christian Schoenebeck<br>
&gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_o=
ss@crudebyte.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Montag, 7. Februar 2022 11:57:25 CET Dr. David Alan Gilbert wr=
ote:<br>
&gt; &gt; &gt; * Greg Kurz (<a href=3D"mailto:groug@kaod.org" target=3D"_bl=
ank">groug@kaod.org</a>) wrote:<br>
&gt; &gt; &gt; &gt; On Mon, 7 Feb 2022 11:30:18 +0100<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; On 7/2/22 09:47, Greg Kurz wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Sun, 6 Feb 2022 20:10:23 -0500<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; This patch set currently places it in 9p-=
util only because 9p is<br>
&gt; &gt; <br>
&gt; &gt; the<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; only<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; place where this issue seems to have come=
 up so far and we were<br>
&gt; &gt; <br>
&gt; &gt; wary<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; of<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; editing files too far afield, but I have =
no attachment to its<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; specific<br>
&gt; &gt; &gt; &gt; &gt; &gt;&gt; location!<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Inline comments are preferred on qemu-devel. =
Please don&#39;t top post<br>
&gt; &gt; <br>
&gt; &gt; !<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; This complicates the review a lot.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; This is indeed a good candidate for osdep. Th=
is being said, unless<br>
&gt; &gt; &gt; &gt; &gt; &gt; there&#39;s<br>
&gt; &gt; &gt; &gt; &gt; &gt; some other user in the QEMU code base, it is =
acceptable to leave<br>
&gt; &gt; &gt; &gt; &gt; &gt; it<br>
&gt; &gt; &gt; &gt; &gt; &gt; under<br>
&gt; &gt; &gt; &gt; &gt; &gt; 9pfs.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; virtiofsd could eventually use it.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Indeed but virtiofsd is for linux hosts only AFAICT and=
 I&#39;m not aware<br>
&gt; &gt; <br>
&gt; &gt; of<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; any work to support any other host OS.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Cc&#39;ing virtio-fs people for inputs on this topic.<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Indeeed, there&#39;s a lot of Linux specific code in the vir=
tiofsd - I know<br>
&gt; &gt; &gt; people are interested in other platforms, but I&#39;m not su=
re that&#39;s the<br>
&gt; &gt; &gt; right starting point.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Dave<br>
&gt; &gt; <br>
&gt; &gt; Agreeing with Greg here: i.e. I would have placed this into osdep=
, but I<br>
&gt; &gt; would<br>
&gt; &gt; not insist on it either.<br>
&gt; &gt; <br>
&gt; &gt; Best regards,<br>
&gt; &gt; Christian Schoenebeck<br>
&gt; <br>
&gt; This makes sense. A revised version of this patch, moving qemu_mknodat=
 from<br>
&gt; 9p-util to osdep and os-posix, is attached below. I&#39;d appreciate a=
ny<br>
&gt; feedback from those looped in here, so that the context isn&#39;t lost=
 before<br>
&gt; resubmitting as a v5 patch, especially since this is starting to touch=
<br>
&gt; files outside of 9p.<br>
&gt; <br>
&gt; From c9713c87163da7c96b5357d0d85ac318ae3d3051 Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Date: Sat, 16 Jun 2018 20:56:55 -0400<br>
&gt; Subject: [PATCH] 9p: darwin: Implement compatibility for mknodat<br>
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
&gt; *dir_path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
&gt; platform_does_not_support_system(const char *command)<br>
&gt;=C2=A0 #endif<br>
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
... drop the duplicate declaration of pthread_fchdir_np() here.<br>
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
&gt; +#endif<br></blockquote><div><br></div><div>Noted and all of that make=
s sense to me. Sorry about trying to lump this
 in v4. If more things come up with v5 I&#39;ll stick these changes in for =
v6 as
 well. If there&#39;s no other major comments with v5, I can either still r=
esubmit
 as v6 or defer to whatever process is easiest for the maintainers to integ=
rate, given that I accept all of these modifications. <br></div></div></div=
>

--0000000000000af25e05d7758053--

