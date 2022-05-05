Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F851BEAB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:57:10 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma6X-0006RN-7v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nma4c-0004jg-AC; Thu, 05 May 2022 07:55:10 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nma4Z-0002DQ-IW; Thu, 05 May 2022 07:55:09 -0400
Received: by mail-lf1-x134.google.com with SMTP id bq30so7070428lfb.3;
 Thu, 05 May 2022 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iduq/YaY7ua7tW2R9TbNVLap0Gitql+BZY7uN4xW6QQ=;
 b=S4jFIovQrNjgwiqR6aRjit1YMMzbcYdxrhLoL8Rw9cI1HKJ8uY7sOrtFSU3yIM9PV2
 PPeIxqLaxEtXAGUg72eDUHCp94eNTEvs4jKvmW/yTxdj5dqZNiMO926RkEbroobBRa0A
 mXVdYOB4b6MyEB4W0mpxPEEA0XmAIOMeiPBLRR/+vWAxs95N+QNrb1mc/K0ECcSBjPQQ
 Yz+V+R6bdcyB7aJQw3eEh0hftQ/2mjMLG0MDW93qG5F1cstlzPWojUtYOIQ7gScG39Ws
 6gGyLTiWahVcCiwUcUMl2jyVeJA6DLcSZdqzz5MksuSj2iRbayIBkZeAUS1MuUbVNLI3
 mTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iduq/YaY7ua7tW2R9TbNVLap0Gitql+BZY7uN4xW6QQ=;
 b=Q7MlbyLf6mDTM9Ba8RrtluZJgU4sxVvrXcwx7DadjS6uA6J+vcsMZZ3xxUUQ3pzvK8
 pVDs+DZdXq7y9k7aaGnxdqp8PocJY+oXFc+L4KqmoYSdEuT5DvICgO3cxsAQn9JT/lu7
 fqjZBE5XqCaGaKGjFpUP3lAnl/hQtb6Oo6S8pqBo9C2DBER3UFoe0DCe6nnxpW3te0lr
 6exlgdcFM5DrJ723muwUvkMn1+zVpSZMQB6mRAbUlmIXZuoqvZ0xA3+iMnCNRJi6seyD
 zFlWEDC2HrAVAuPvg3ivCBXSsppH1tPW1YRkie4+zF1x0PgzlKSxrgfQcsnDi3PaIiTz
 adww==
X-Gm-Message-State: AOAM5312m+KWRAL25aNuNJsiZTB3QVIOlmqBkSwn00eTbc65jKTZr3y4
 Tb8c195nrD88JBkuQ+Sh0ns6leRCZmAJkf789mk=
X-Google-Smtp-Source: ABdhPJz+/DB574FOp6oWME2ZIYw2hYFVeKji3dLsytxd4DuZ8Xp3NWXQC1vo0VLBz9wtAhqXwFK7JnjifWgXj2MaptY=
X-Received: by 2002:a05:6512:33b9:b0:472:10b0:4c14 with SMTP id
 i25-20020a05651233b900b0047210b04c14mr17195844lfg.77.1651751704630; Thu, 05
 May 2022 04:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-10-marcandre.lureau@redhat.com>
 <87bkwcw6hv.fsf@pond.sub.org>
In-Reply-To: <87bkwcw6hv.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 15:54:52 +0400
Message-ID: <CAJ+F1CJ5F6VhAZnyfxVhP2XbH-cW8ZqVbK8MFcHF+Bgi8id5fA@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] qga: replace qemu_open_old() with
 qemu_open_cloexec()
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009c9c6405de426929"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009c9c6405de426929
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 3:43 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > qemu_open_old() uses qemu_open_internal() which handles special
> > "/dev/fdset/" path for monitor fd sets, set CLOEXEC, and uses Error
> > reporting (and some O_DIRECT special error casing).
> >
> > The monitor fdset handling is unnecessary for qga, use
> > qemu_open_cloexec() instead.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/channel-posix.c  | 14 +++++++++-----
> >  qga/commands-posix.c | 24 ++++++++++++------------
> >  2 files changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> > index 0ce594bc36c2..a1262b130145 100644
> > --- a/qga/channel-posix.c
> > +++ b/qga/channel-posix.c
> > @@ -1,4 +1,5 @@
> >  #include "qemu/osdep.h"
> > +#include "qemu/cutils.h"
> >  #include <termios.h>
> >  #include "qapi/error.h"
> >  #include "qemu/sockets.h"
> > @@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c,
> const gchar *path,
> >      switch (c->method) {
> >      case GA_CHANNEL_VIRTIO_SERIAL: {
> >          assert(fd < 0);
> > -        fd =3D qemu_open_old(path, O_RDWR | O_NONBLOCK
> > +        fd =3D qemu_open_cloexec(
> > +            path,
> >  #ifndef CONFIG_SOLARIS
> > -                           | O_ASYNC
> > +            O_ASYNC |
> >  #endif
> > -                           );
> > +            O_RDWR | O_NONBLOCK,
> > +            0,
> > +            errp
> > +        );
> >          if (fd =3D=3D -1) {
> >              error_setg_errno(errp, errno, "error opening channel");
> >              return false;
> > @@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
> >          struct termios tio;
> >
> >          assert(fd < 0);
> > -        fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
> > +        fd =3D qemu_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK,=
 0,
> errp);
> >          if (fd =3D=3D -1) {
> > -            error_setg_errno(errp, errno, "error opening channel");
> >              return false;
> >          }
> >          tcgetattr(fd, &tio);
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 8ebc327c5e02..f82205e25813 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -1392,6 +1392,7 @@ static GuestDiskInfoList *get_disk_partitions(
> >
> >  static void get_nvme_smart(GuestDiskInfo *disk)
> >  {
> > +    Error *err =3D NULL;
> >      int fd;
> >      GuestNVMeSmart *smart;
> >      NvmeSmartLog log =3D {0};
> > @@ -1404,9 +1405,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)
> >                   | (((sizeof(log) >> 2) - 1) << 16)
> >      };
> >
> > -    fd =3D qemu_open_old(disk->name, O_RDONLY);
> > +    fd =3D qemu_open_cloexec(disk->name, O_RDONLY, 0, &err);
> >      if (fd =3D=3D -1) {
> > -        g_debug("Failed to open device: %s: %s", disk->name,
> g_strerror(errno));
> > +        g_debug("Failed to open device: %s: %s", disk->name,
> error_get_pretty(err));
> > +        error_free(err);
> >          return;
> >      }
> >
> > @@ -1737,9 +1739,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool
> has_mountpoints,
> >              }
> >          }
> >
> > -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> > +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
> >          if (fd =3D=3D -1) {
> > -            error_setg_errno(errp, errno, "failed to open %s",
> mount->dirname);
> >              goto error;
> >          }
> >
> > @@ -1804,7 +1805,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
> >
> >      QTAILQ_FOREACH(mount, &mounts, next) {
> >          logged =3D false;
> > -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> > +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, NULL);
> >          if (fd =3D=3D -1) {
> >              continue;
> >          }
> > @@ -1864,21 +1865,20 @@ static void guest_fsfreeze_cleanup(void)
> >  GuestFilesystemTrimResponse *
> >  qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> >  {
> > +    ERRP_GUARD();
> >      GuestFilesystemTrimResponse *response;
> >      GuestFilesystemTrimResult *result;
> >      int ret =3D 0;
> >      FsMountList mounts;
> >      struct FsMount *mount;
> >      int fd;
> > -    Error *local_err =3D NULL;
> >      struct fstrim_range r;
> >
> >      slog("guest-fstrim called");
> >
> >      QTAILQ_INIT(&mounts);
> > -    build_fs_mount_list(&mounts, &local_err);
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > +    build_fs_mount_list(&mounts, errp);
> > +    if (*errp) {
>
> Suggest to change build_fs_mount_list() to return bool, in accordance
> with the guidance under =3D Rules =3D in include/qapi/error.h, then do
>
>        if (!build_fs_mount_list(&mounts, errp)) {
>
>
ack


> No need for ERRP_GUARD() then.
>
>
This is not a demand.
>
> >          return NULL;
> >      }
> >
> > @@ -1890,11 +1890,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t
> minimum, Error **errp)
> >
> >          QAPI_LIST_PREPEND(response->paths, result);
> >
> > -        fd =3D qemu_open_old(mount->dirname, O_RDONLY);
> > +        fd =3D qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
> >          if (fd =3D=3D -1) {
> > -            result->error =3D g_strdup_printf("failed to open: %s",
> > -                                            strerror(errno));
> > +            result->error =3D g_strdup(error_get_pretty(*errp));
> >              result->has_error =3D true;
> > +            g_clear_pointer(errp, error_free);
> >              continue;
> >          }
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009c9c6405de426929
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 3:43 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; qemu_open_old() uses qemu_open_internal() which handles special<br>
&gt; &quot;/dev/fdset/&quot; path for monitor fd sets, set CLOEXEC, and use=
s Error<br>
&gt; reporting (and some O_DIRECT special error casing).<br>
&gt;<br>
&gt; The monitor fdset handling is unnecessary for qga, use<br>
&gt; qemu_open_cloexec() instead.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qga/channel-posix.c=C2=A0 | 14 +++++++++-----<br>
&gt;=C2=A0 qga/commands-posix.c | 24 ++++++++++++------------<br>
&gt;=C2=A0 2 files changed, 21 insertions(+), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
&gt; index 0ce594bc36c2..a1262b130145 100644<br>
&gt; --- a/qga/channel-posix.c<br>
&gt; +++ b/qga/channel-posix.c<br>
&gt; @@ -1,4 +1,5 @@<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/cutils.h&quot;<br>
&gt;=C2=A0 #include &lt;termios.h&gt;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/sockets.h&quot;<br>
&gt; @@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c, co=
nst gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (c-&gt;method) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case GA_CHANNEL_VIRTIO_SERIAL: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &lt; 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(path, O_RDWR | O_NON=
BLOCK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path,<br>
&gt;=C2=A0 #ifndef CONFIG_SOLARIS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| O_ASYNC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O_ASYNC |<br>
&gt;=C2=A0 #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O_RDWR | O_NONBLOCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp,=
 errno, &quot;error opening channel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; @@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, cons=
t gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct termios tio;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &lt; 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(path, O_RDWR | O_NOC=
TTY | O_NONBLOCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(path, O_RDWR | O=
_NOCTTY | O_NONBLOCK, 0, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o, &quot;error opening channel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcgetattr(fd, &amp;tio);<br>
&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; index 8ebc327c5e02..f82205e25813 100644<br>
&gt; --- a/qga/commands-posix.c<br>
&gt; +++ b/qga/commands-posix.c<br>
&gt; @@ -1392,6 +1392,7 @@ static GuestDiskInfoList *get_disk_partitions(<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void get_nvme_smart(GuestDiskInfo *disk)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GuestNVMeSmart *smart;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NvmeSmartLog log =3D {0};<br>
&gt; @@ -1404,9 +1405,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
(((sizeof(log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 fd =3D qemu_open_old(disk-&gt;name, O_RDONLY);<br>
&gt; +=C2=A0 =C2=A0 fd =3D qemu_open_cloexec(disk-&gt;name, O_RDONLY, 0, &a=
mp;err);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: =
%s&quot;, disk-&gt;name, g_strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: =
%s&quot;, disk-&gt;name, error_get_pretty(err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(err);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -1737,9 +1739,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_=
mountpoints,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O=
_RDONLY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirnam=
e, O_RDONLY, 0, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o, &quot;failed to open %s&quot;, mount-&gt;dirname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -1804,7 +1805,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(mount, &amp;mounts, next) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logged =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O=
_RDONLY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirnam=
e, O_RDONLY, 0, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -1864,21 +1865,20 @@ static void guest_fsfreeze_cleanup(void)<br>
&gt;=C2=A0 GuestFilesystemTrimResponse *<br>
&gt;=C2=A0 qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp=
)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FsMountList mounts;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct FsMount *mount;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fd;<br>
&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct fstrim_range r;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_INIT(&amp;mounts);<br>
&gt; -=C2=A0 =C2=A0 build_fs_mount_list(&amp;mounts, &amp;local_err);<br>
&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt; +=C2=A0 =C2=A0 build_fs_mount_list(&amp;mounts, errp);<br>
&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
<br>
Suggest to change build_fs_mount_list() to return bool, in accordance<br>
with the guidance under =3D Rules =3D in include/qapi/error.h, then do<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!build_fs_mount_list(&amp;mounts, errp)) {<b=
r>
<br></blockquote><div><br></div><div>ack</div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
No need for ERRP_GUARD() then.<br>=C2=A0 <br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
This is not a demand.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -1890,11 +1890,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t min=
imum, Error **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_PREPEND(response-&gt;paths=
, result);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(mount-&gt;dirname, O=
_RDONLY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_cloexec(mount-&gt;dirnam=
e, O_RDONLY, 0, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strd=
up_printf(&quot;failed to open: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strd=
up(error_get_pretty(*errp));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(errp, error=
_free);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009c9c6405de426929--

