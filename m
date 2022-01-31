Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F1A4A525B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 23:29:03 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEfAT-0000Ps-PS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 17:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nEf8Z-00085X-RS
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:27:03 -0500
Received: from [2a00:1450:4864:20::131] (port=45762
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nEf8X-00086A-7A
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:27:03 -0500
Received: by mail-lf1-x131.google.com with SMTP id o12so29860072lfg.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZEXMDHhKolNCTzYWufa6k24RvHx5Ur8lMDuaS9w0fY=;
 b=Mb1ECfPwuv75h5irw84d2VtPfEFg+m8QjnB9RsIk8DG9sI2l0iwbAD3SFDeYHfUx7k
 yAUpO6j62KJNGp1TeWIOG0Btv6lafh0eXOUZxwxbPAicrGRa/EyBf7kQLsACA0iLz8q1
 K60Y4MuyFjzbe7mCBtSGvlvb3ZrWnYmvJ+9THipqS4eXwWF6Nk4pJ5dljWksh6Of154C
 GdQnhxpZVTXHbrVurqbqTLlbe2dKTw2RfrBj1l9SZZJebIupBFsA1ZFw34c92rVAsyAF
 hYCtY53vKQcWNyCgCgTM+a3in+IVHLrNh6OUz9as0aGvtRqHFK1JR+nWEExZbuK60TO2
 MFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZEXMDHhKolNCTzYWufa6k24RvHx5Ur8lMDuaS9w0fY=;
 b=DHVT3c6lFg4GU99NwcEsx1IPuAwpVqBGn07KkZS8j78uHWFo4e5j+OIx1fTuF7AM4q
 l0LTTJNkzHVgdheJ6IgPhvFxHXgKUhMOTafILmfCiJ6P0vyGWKFmYUD7afshMJz7Pnpi
 Y5y8KXb1hr0GPDadbaBbinc02k1/mITONBw8Kxc8BpkLBF3YLh1Qca6ETGmfWuBr7XAC
 oMbdMYi27flqyAiRjaP+VueM0oTtAk0rymTrUvBMYmgWztdO8rFAAasMBorhmgf8AnI+
 774XSLvJJMh9HbgU9kDqKj7t8H0dGqUdyFhyhlSeUHc3qduspQcCmmi+/7PqGj8cDfy4
 hnHw==
X-Gm-Message-State: AOAM5306pTEFbleCTTTKGdlXw1i28WbOdWu1JhrYa9sO41Ud+UNlVP7x
 N7q17hE1O+/rtf8MK/mzPUcPz6C54FY2pQbpEIE=
X-Google-Smtp-Source: ABdhPJxpYYfv/Lq+T1I12g2SVIDc02EVwIX4mq2jfmG1LTiues4b3IffWVAl30BNDcmS0p+4nYcxN3L2CRGdPtMYK78=
X-Received: by 2002:a05:6512:2243:: with SMTP id
 i3mr14659706lfu.598.1643668018224; 
 Mon, 31 Jan 2022 14:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <3039867.d4g7DdiYNH@silver>
 <CAB26zV3uHf1r9nVUcrcysbvMojHE_Jz5sM941pc_uSSjYNnogg@mail.gmail.com>
 <1868804.s9PD02ncGZ@silver>
 <CAB26zV0Lf==9f62RM10vaLHEMcjPwVshs51Z9oNLu17GYV2kDw@mail.gmail.com>
In-Reply-To: <CAB26zV0Lf==9f62RM10vaLHEMcjPwVshs51Z9oNLu17GYV2kDw@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 31 Jan 2022 17:26:46 -0500
Message-ID: <CAB26zV3_oQ-tAfOrRefJNG8w6DPOiNhn5VBwahLPOmrKsO1LTA@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000005ae10805d6e8482a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x131.google.com
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005ae10805d6e8482a
Content-Type: text/plain; charset="UTF-8"

Upon further review, it looks like since 10.12 there's actually a
(not-heavily-documented) function that wraps this syscall and avoids the
need to call the private syscall directly:
https://opensource.apple.com/source/libpthread/libpthread-218.51.1/src/pthread_cwd.c.auto.html.
Chromium uses it too (
https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_mac.cc#110)
-- given that we're not looking for pre-10.12 compatibility, I'm a little
less worried about the workaround breaking in the future if this wrapper
gets used instead.

Would it work to change to pthread_fchdir_np, remove all the syscall
discussion in the comment, and add a meson check for pthread_fchdir_np as a
prereq for virtfs on darwin?

On Fri, Jan 28, 2022 at 1:28 PM Will Cohen <wwcohen@gmail.com> wrote:

> Understood. Since I cannot find the original number, I have submitted a
> new report at rdar://FB9862426 <https://openradar.appspot.com/FB9862426> (
> https://openradar.appspot.com/FB9862426).
>
> I'll note that and work on a testcase/error message for v4.
>
> Many thanks,
> Will
>
> On Fri, Jan 28, 2022 at 10:15 AM Christian Schoenebeck <
> qemu_oss@crudebyte.com> wrote:
>
>> On Donnerstag, 27. Januar 2022 22:47:54 CET Will Cohen wrote:
>> > Back when this was being proposed, the original proposer did file such a
>> > report to Apple, but we're still in this situation!
>>
>> Ok, but still, do you find it appropriate to just blindly use a private
>> syscall that may or may not exist or might change its behaviour at any
>> time
>> without a user being aware?
>>
>> I am not opposed to using workarounds at all, but what I worry about is
>> that
>> Apple might change this in whatever way at any time, and as this sycall
>> is
>> currently not guarded in this patch at all, we might one day receive bug
>> reports by macOS users with symptoms that might not immediately be
>> obvious to
>> relate to this being the root cause.
>>
>> Options that would come to my mind:
>> - a test case for this syscall
>> - a clear runtime error message for ordinary users
>>
>> Is there a rdar or FB number for the report on Apple's side?
>>
>> > Replacing clang with gcc in v3.
>> >
>> > On Wed, Nov 24, 2021 at 12:20 PM Christian Schoenebeck <
>> >
>> > qemu_oss@crudebyte.com> wrote:
>> > > On Montag, 22. November 2021 01:49:12 CET Will Cohen wrote:
>> > > > From: Keno Fischer <keno@juliacomputing.com>
>> > > >
>> > > > Darwin does not support mknodat. However, to avoid race conditions
>> > > > with later setting the permissions, we must avoid using mknod on
>> > > > the full path instead. We could try to fchdir, but that would cause
>> > > > problems if multiple threads try to call mknodat at the same time.
>> > > > However, luckily there is a solution: Darwin as an (unexposed in the
>> > > > C library) system call that sets the cwd for the current thread
>> only.
>> > > > This should suffice to use mknod safely.
>> > > >
>> > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
>> > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
>> > > > [Will Cohen: - Adjust coding style]
>> > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
>> > > > ---
>> > > >
>> > > >  hw/9pfs/9p-local.c       |  5 +++--
>> > > >  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
>> > > >  hw/9pfs/9p-util-linux.c  |  5 +++++
>> > > >  hw/9pfs/9p-util.h        |  2 ++
>> > > >  4 files changed, 43 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
>> > > > index 4268703d05..42b65e143b 100644
>> > > > --- a/hw/9pfs/9p-local.c
>> > > > +++ b/hw/9pfs/9p-local.c
>> > > > @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx,
>> V9fsPath
>> > > > *dir_path,
>> > > >
>> > > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>> > > >
>> > > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
>> > > >
>> > > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>> > > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG,
>> 0);
>> > > >
>> > > >          if (err == -1) {
>> > > >
>> > > >              goto out;
>> > > >
>> > > >          }
>> > > >
>> > > > @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx,
>> V9fsPath
>> > > > *dir_path, }
>> > > >
>> > > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
>> > > >
>> > > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
>> > > >
>> > > > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
>> > > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
>> > > > credp->fc_rdev);
>> > > >
>> > > >          if (err == -1) {
>> > > >
>> > > >              goto out;
>> > > >
>> > > >          }
>> > > >
>> > > > @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx,
>> V9fsPath
>> > > > *dir_path,
>> > > >
>> > > >  err_end:
>> > > >      unlinkat_preserve_errno(dirfd, name, 0);
>> > > >
>> > > > +
>> > > >
>> > > >  out:
>> > > >      close_preserve_errno(dirfd);
>> > > >      return err;
>> > > >
>> > > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
>> > > > index ac414bcbfd..25e67d5067 100644
>> > > > --- a/hw/9pfs/9p-util-darwin.c
>> > > > +++ b/hw/9pfs/9p-util-darwin.c
>> > > >
>> > > > @@ -158,3 +158,36 @@ done:
>> > > >      close_preserve_errno(fd);
>> > > >      return ret;
>> > > >
>> > > >  }
>> > > >
>> > > > +
>> > > > +#ifndef SYS___pthread_fchdir
>> > > > +# define SYS___pthread_fchdir 349
>> > > > +#endif
>> > > > +
>> > > > +/*
>> > > > + * This is an undocumented OS X syscall. It would be best to avoid
>> it,
>> > > > + * but there doesn't seem to be another safe way to implement
>> mknodat.
>> > > > + * Dear Apple, please implement mknodat before you remove this
>> syscall.
>> > > > + */
>> > > > +static int fchdir_thread_local(int fd)
>> > >
>> > > Hooo, that's a brave move. Shouldn't its future and likely becoming
>> > > absence be
>> > > guarded "somehow"? :)
>> > >
>> > > BTW it might make sense to file a report instead of hoping Apple will
>> just
>> > > read this comment: ;-)
>> > > https://feedbackassistant.apple.com/
>> > >
>> > > > +{
>> > > > +#pragma clang diagnostic push
>> > > > +#pragma clang diagnostic ignored "-Wdeprecated-declarations"
>> > > > +    return syscall(SYS___pthread_fchdir, fd);
>> > > > +#pragma clang diagnostic pop
>> > > > +}
>> > >
>> > > Consider s/clang/GCC/ then it would also work with GCC. In the end
>> most
>> > > people
>> > > probably just use clang on macOS anyway, but just saying.
>> > >
>> > > > +
>> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
>> dev_t
>> > >
>> > > dev)
>> > >
>> > > > +{
>> > > > +    int preserved_errno, err;
>> > > > +    if (fchdir_thread_local(dirfd) < 0) {
>> > > > +        return -1;
>> > > > +    }
>> > > > +    err = mknod(filename, mode, dev);
>> > > > +    preserved_errno = errno;
>> > > > +    /* Stop using the thread-local cwd */
>> > > > +    fchdir_thread_local(-1);
>> > > > +    if (err < 0) {
>> > > > +        errno = preserved_errno;
>> > > > +    }
>> > > > +    return err;
>> > > > +}
>> > > > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
>> > > > index d54bf57a59..4f57d8c047 100644
>> > > > --- a/hw/9pfs/9p-util-linux.c
>> > > > +++ b/hw/9pfs/9p-util-linux.c
>> > > > @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char
>> > > > *filename,
>> > > >
>> > > >  {
>> > > >
>> > > >      return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
>> > > >
>> > > >  }
>> > > >
>> > > > +
>> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
>> dev_t
>> > >
>> > > dev)
>> > >
>> > > > +{
>> > > > +    return mknodat(dirfd, filename, mode, dev);
>> > > > +}
>> > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
>> > > > index 1c477a0e66..cac682d335 100644
>> > > > --- a/hw/9pfs/9p-util.h
>> > > > +++ b/hw/9pfs/9p-util.h
>> > > > @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const
>> > > > char
>> > > > *filename, int utimensat_nofollow(int dirfd, const char *filename,
>> > > >
>> > > >                         const struct timespec times[2]);
>> > > >
>> > > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode,
>> dev_t
>> > >
>> > > dev);
>> > >
>> > > > +
>> > > >
>> > > >  #endif
>>
>>
>> Best regards,
>> Christian Schoenebeck
>>
>>
>>

--0000000000005ae10805d6e8482a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Upon further review, it looks like since 10.12 there&=
#39;s actually a (not-heavily-documented) function that wraps this syscall =
and avoids the need to call the private syscall directly: <a href=3D"https:=
//opensource.apple.com/source/libpthread/libpthread-218.51.1/src/pthread_cw=
d.c.auto.html">https://opensource.apple.com/source/libpthread/libpthread-21=
8.51.1/src/pthread_cwd.c.auto.html</a>. Chromium uses it too (<a href=3D"ht=
tps://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_mac=
.cc#110">https://chromium.googlesource.com/chromium/src/+/lkgr/base/process=
/launch_mac.cc#110</a>) -- given that we&#39;re not looking for pre-10.12 c=
ompatibility, I&#39;m a little less worried about the workaround breaking i=
n the future if this wrapper gets used instead.</div><div><br></div><div>Wo=
uld it work to change to pthread_fchdir_np, remove all the syscall discussi=
on in the comment, and add a meson check for pthread_fchdir_np as a prereq =
for virtfs on darwin?<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jan 28, 2022 at 1:28 PM Will Cohen &=
lt;<a href=3D"mailto:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div>Understood. Since I cannot find the original number, I have submitted a=
 new report at <a>rdar</a>://<a href=3D"https://openradar.appspot.com/FB986=
2426" target=3D"_blank">FB9862426</a> (<a href=3D"https://openradar.appspot=
.com/FB9862426" target=3D"_blank">https://openradar.appspot.com/FB9862426</=
a>). <br></div><div><br></div><div>I&#39;ll note that and work on a testcas=
e/error message for v4.</div><div><br></div><div>Many thanks,</div><div>Wil=
l<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jan 28, 2022 at 10:15 AM Christian Schoenebeck &lt;<a hr=
ef=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Donnerstag, 27. Januar 2022 22:47:54 CET Will Cohen wrote:<br>
&gt; Back when this was being proposed, the original proposer did file such=
 a<br>
&gt; report to Apple, but we&#39;re still in this situation!<br>
<br>
Ok, but still, do you find it appropriate to just blindly use a private <br=
>
syscall that may or may not exist or might change its behaviour at any time=
 <br>
without a user being aware?<br>
<br>
I am not opposed to using workarounds at all, but what I worry about is tha=
t <br>
Apple might change this in whatever way at any time, and as this sycall is =
<br>
currently not guarded in this patch at all, we might one day receive bug <b=
r>
reports by macOS users with symptoms that might not immediately be obvious =
to <br>
relate to this being the root cause.<br>
<br>
Options that would come to my mind:<br>
- a test case for this syscall<br>
- a clear runtime error message for ordinary users<br>
<br>
Is there a rdar or FB number for the report on Apple&#39;s side?<br>
<br>
&gt; Replacing clang with gcc in v3.<br>
&gt; <br>
&gt; On Wed, Nov 24, 2021 at 12:20 PM Christian Schoenebeck &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@c=
rudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Montag, 22. November 2021 01:49:12 CET Will Cohen wrote:<br>
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
&gt; &gt; &gt; However, luckily there is a solution: Darwin as an (unexpose=
d in the<br>
&gt; &gt; &gt; C library) system call that sets the cwd for the current thr=
ead only.<br>
&gt; &gt; &gt; This should suffice to use mknod safely.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@julia=
computing.com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reacto=
rcontrol@icloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br=
>
&gt; &gt; &gt; [Will Cohen: - Adjust coding style]<br>
&gt; &gt; &gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmai=
l.com" target=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5=
 +++--<br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-util-darwin.c | 33 ++++++++++++++++++++++++=
+++++++++<br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-util-linux.c=C2=A0 |=C2=A0 5 +++++<br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
 ++<br>
&gt; &gt; &gt;=C2=A0 4 files changed, 43 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; index 4268703d05..42b65e143b 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; &gt; &gt; @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx=
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
&gt; &gt; &gt; @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx=
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
&gt; &gt; &gt; @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx=
, V9fsPath<br>
&gt; &gt; &gt; *dir_path,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 err_end:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 unlinkat_preserve_errno(dirfd, name, 0);=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 out:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 close_preserve_errno(dirfd);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return err;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darw=
in.c<br>
&gt; &gt; &gt; index ac414bcbfd..25e67d5067 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-util-darwin.c<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-util-darwin.c<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -158,3 +158,36 @@ done:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#ifndef SYS___pthread_fchdir<br>
&gt; &gt; &gt; +# define SYS___pthread_fchdir 349<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * This is an undocumented OS X syscall. It would be best t=
o avoid it,<br>
&gt; &gt; &gt; + * but there doesn&#39;t seem to be another safe way to imp=
lement mknodat.<br>
&gt; &gt; &gt; + * Dear Apple, please implement mknodat before you remove t=
his syscall.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +static int fchdir_thread_local(int fd)<br>
&gt; &gt; <br>
&gt; &gt; Hooo, that&#39;s a brave move. Shouldn&#39;t its future and likel=
y becoming<br>
&gt; &gt; absence be<br>
&gt; &gt; guarded &quot;somehow&quot;? :)<br>
&gt; &gt; <br>
&gt; &gt; BTW it might make sense to file a report instead of hoping Apple =
will just<br>
&gt; &gt; read this comment: ;-)<br>
&gt; &gt; <a href=3D"https://feedbackassistant.apple.com/" rel=3D"noreferre=
r" target=3D"_blank">https://feedbackassistant.apple.com/</a><br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +#pragma clang diagnostic push<br>
&gt; &gt; &gt; +#pragma clang diagnostic ignored &quot;-Wdeprecated-declara=
tions&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return syscall(SYS___pthread_fchdir, fd);<br>
&gt; &gt; &gt; +#pragma clang diagnostic pop<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; <br>
&gt; &gt; Consider s/clang/GCC/ then it would also work with GCC. In the en=
d most<br>
&gt; &gt; people<br>
&gt; &gt; probably just use clang on macOS anyway, but just saying.<br>
&gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev)<br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 int preserved_errno, err;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (fchdir_thread_local(dirfd) &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 err =3D mknod(filename, mode, dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 preserved_errno =3D errno;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Stop using the thread-local cwd */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 fchdir_thread_local(-1);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D preserved_errno;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return err;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux=
.c<br>
&gt; &gt; &gt; index d54bf57a59..4f57d8c047 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-util-linux.c<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-util-linux.c<br>
&gt; &gt; &gt; @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const ch=
ar<br>
&gt; &gt; &gt; *filename,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return utimensat(dirfd, filename, times,=
 AT_SYMLINK_NOFOLLOW);<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev)<br>
&gt; &gt; <br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return mknodat(dirfd, filename, mode, dev);<b=
r>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; &gt; &gt; index 1c477a0e66..cac682d335 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-util.h<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; &gt; &gt; @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirf=
d, const<br>
&gt; &gt; &gt; char<br>
&gt; &gt; &gt; *filename, int utimensat_nofollow(int dirfd, const char *fil=
ename,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct timespec times[2]);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mo=
de, dev_t<br>
&gt; &gt; <br>
&gt; &gt; dev);<br>
&gt; &gt; <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 #endif<br>
<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000005ae10805d6e8482a--

