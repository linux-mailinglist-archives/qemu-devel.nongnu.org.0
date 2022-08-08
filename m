Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC558C4EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 10:29:53 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKy8r-0001HV-Ry
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 04:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oKy6i-0008Gg-3w
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:27:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oKy6f-0005eH-ED
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:27:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id f22so10329003edc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9o/BHYE7HlGBTC4d2m0jjpKIkwX4C48BijEGRIQIHL8=;
 b=UrsA348YFu+MDw++F2sySuwZ6nOd1WHg0ZoHLaFGqjKRDRb/KBVb7Iu8+PxKeLTdkJ
 wyZbSEwFDVkBEn+v0h09I+oPgJYJN/go4ng0QjWRVvw1LWHmid40CxzkAIYKYxUHALZR
 J7wynP/vTAPsowcTn1XaU75ovxyDMZpMCilnN/Q54aCSS/yIDSmJoLHbZjA8x89SPPIv
 wLgwRw5Ro/MqORqnjVcfv/Closfxlcb1gOAxCpcQDPWs8fXQaL9LMsMvghObM6ezIjb7
 oGD58kkB5fc5PcOTYJz5NQ985acIdoDcz/RIkoxNvyMwDIvSX/roB2B+EqL3S5dEn4SU
 lJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9o/BHYE7HlGBTC4d2m0jjpKIkwX4C48BijEGRIQIHL8=;
 b=7zgXzkzKFyZaWLQGzcEqx9lQ2gNDM4UGi5P1BkjguFAo3W3tBGb9pU95UTPIbFZY8V
 jMZjWb6F9nQE+C6Eb9p6VbE2o6qiKq/gGMIbng+BuZIv+cdZ5J/pn8ImFl9nGX/VRxpZ
 QK6s/JxqVSQGUgE6ow6hs2eMgc+5G0sNO9utPnolW4/11XxHVj83s/wpKGdkHsxMA/3I
 alUbMBkDzN3lnNU+PyqBnZArWYjE5X/Wec6vUXE7d3i5Tv1Ppy+Uz20FosgsEiAUhHil
 6+X6jA4/fnM5SuHvbo+4eYeymJ8z1kxmUVkSBDU+gTg/SzqbsTj1ZoE8fV08gCeC5flB
 7e/Q==
X-Gm-Message-State: ACgBeo0u7jmwKrRebbFlycxQ1Sm0fZSuQGXmZY2tGT7O31FySG+2RdTM
 qPfuoxsEVUPvkSTpPDa5/lyhqczHdOhOJc58M2Ihvw==
X-Google-Smtp-Source: AA6agR5YM1hASWdSzS5hST1+ofYpv1HXXm5uk4qqLFIFGZ5EbWP0xkJ+OJTykFyA7mwMQfF25WPpPLo7VQ2eTJvAJv8=
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id
 c7-20020a0564021f8700b0043bb88d1d93mr16617196edc.314.1659947243621; Mon, 08
 Aug 2022 01:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <4561100.0A2huPDW8y@silver>
 <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
 <CAFEAcA-ApDzJvYoWMP9un1p+bgNNe6g+J09QPfxUv4Ee=WMyeQ@mail.gmail.com>
 <CAAJ4Ao-P3ZUuvzEkqOrUuw9qUWtmf3JWmvxVqMs4+z4pdqz6qw@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org>
In-Reply-To: <877d3jupln.fsf@pond.sub.org>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 8 Aug 2022 11:27:12 +0300
Message-ID: <CAAJ4Ao8ZFmjGJitc4kBCgOsY8LjKYohAOhU1QgCxrtuwxYzyUg@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd64b805e5b6954d"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000cd64b805e5b6954d
Content-Type: text/plain; charset="UTF-8"

Good point, thank you!
I think it's a bad idea to keep it like I proposed. Though, could I just
copy the definition that Markus has posted or there are any objections?

On Mon, Aug 8, 2022 at 11:06 AM Markus Armbruster <armbru@redhat.com> wrote:

> Nikita Ivanov <nivanov@cloudlinux.com> writes:
>
> > Summing up the discussion above, I suggest the following patch for TFR()
> > macro refactoring. (The patch is sequential to the first one I introduced
> > in the start of the discussion).
> >
> >>From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001
> > From: Nikita Ivanov <nivanov@cloudlinux.com>
> > Date: Mon, 8 Aug 2022 09:30:34 +0300
> > Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
> >
> > glibc's unistd.h header provides the same macro with the
> > subtle difference in type casting. Adjust macro name to the
> > common standard and define conditionally.
> >
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> >  chardev/char-fd.c      |  2 +-
> >  chardev/char-pipe.c    | 12 +++++++++---
> >  hw/9pfs/9p-local.c     |  6 ++++--
> >  include/qemu/osdep.h   |  6 ++++--
> >  net/l2tpv3.c           |  8 +++++---
> >  net/tap-linux.c        |  2 +-
> >  net/tap.c              | 10 ++++++----
> >  os-posix.c             |  2 +-
> >  qga/commands-posix.c   |  2 +-
> >  tests/qtest/libqtest.c |  2 +-
> >  util/main-loop.c       |  2 +-
> >  util/osdep.c           |  2 +-
> >  12 files changed, 35 insertions(+), 21 deletions(-)
> >
> > diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> > index cf78454841..7f5ed9aba3 100644
> > --- a/chardev/char-fd.c
> > +++ b/chardev/char-fd.c
> > @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int
> flags,
> > Error **errp)
> >  {
> >      int fd = -1;
> >
> > -    TFR(fd = qemu_open_old(src, flags, 0666));
> > +    TEMP_FAILURE_RETRY(fd = qemu_open_old(src, flags, 0666));
> >      if (fd == -1) {
> >          error_setg_file_open(errp, errno, src);
> >      }
> > diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> > index 66d3b85091..aed97e306b 100644
> > --- a/chardev/char-pipe.c
> > +++ b/chardev/char-pipe.c
> > @@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,
> >
> >      filename_in = g_strdup_printf("%s.in", filename);
> >      filename_out = g_strdup_printf("%s.out", filename);
> > -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> > -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> > +    TEMP_FAILURE_RETRY(
> > +        fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY)
> > +    );
> > +    TEMP_FAILURE_RETRY(
> > +        fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY)
> > +    );
>
> Style question: do we want the ");" on its own line?  I think we
> generally don't do that for function and function-like macro calls.
>
> >      g_free(filename_in);
> >      g_free(filename_out);
> >      if (fd_in < 0 || fd_out < 0) {
> > @@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
> >          if (fd_out >= 0) {
> >              close(fd_out);
> >          }
> > -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR |
> O_BINARY));
> > +        TEMP_FAILURE_RETRY(
> > +            fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY)
> > +        );
> >          if (fd_in < 0) {
> >              error_setg_file_open(errp, errno, filename);
> >              return;
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index c90ab947ba..e803c05d0c 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> > V9fsPath *fs_path,
> >          if (fd == -1) {
> >              return -1;
> >          }
> > -        TFR(tsize = read(fd, (void *)buf, bufsz));
> > +        TEMP_FAILURE_RETRY(tsize = read(fd, (void *)buf, bufsz));
> >          close_preserve_errno(fd);
> >      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > @@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const
> char
> > *oldpath,
> >          }
> >          /* Write the oldpath (target) to the file. */
> >          oldpath_size = strlen(oldpath);
> > -        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
> > +        TEMP_FAILURE_RETRY(
> > +            write_size = write(fd, (void *)oldpath, oldpath_size)
> > +        );
> >          close_preserve_errno(fd);
> >
> >          if (write_size != oldpath_size) {
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index b1c161c035..55f2927d8b 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
> >  #if !defined(ESHUTDOWN)
> >  #define ESHUTDOWN 4099
> >  #endif
> > -
> > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#if !defined(TEMP_FAILURE_RETRY)
> > +#define TEMP_FAILURE_RETRY(expr) \
> > +    do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#endif
>
> GLibc's version is
>
>    # define TEMP_FAILURE_RETRY(expression) \
>      (__extension__
>    \
>        ({ long int __result;
>     \
>           do __result = (long int) (expression);
>             \
>           while (__result == -1L && errno == EINTR);
>     \
>           __result; }))
>
> The difference isn't just "type casting", it's also statement
> vs. expression.
>
> Is it a good idea to have the macro expand into a statement on some
> hosts, and into an expression on others?  Sure, CI should catch any uses
> as expression, but delaying compile errors to CI wastes developer time.
>
> >
> >  /* time_t may be either 32 or 64 bits depending on the host OS, and
> >   * can be either signed or unsigned, so we can't just hardcode a
>
> [...]
>
>

-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--000000000000cd64b805e5b6954d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good point, thank you!<br>I think it&#39;s a bad idea to k=
eep it like I proposed. Though, could I just copy the definition that Marku=
s has posted or there are any objections?</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 8, 2022 at 11:06 AM Ma=
rkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">N=
ikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" target=3D"_blank=
">nivanov@cloudlinux.com</a>&gt; writes:<br>
<br>
&gt; Summing up the discussion above, I suggest the following patch for TFR=
()<br>
&gt; macro refactoring. (The patch is sequential to the first one I introdu=
ced<br>
&gt; in the start of the discussion).<br>
&gt;<br>
&gt;&gt;From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2=
001<br>
&gt; From: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" targ=
et=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
&gt; Date: Mon, 8 Aug 2022 09:30:34 +0300<br>
&gt; Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()<br>
&gt;<br>
&gt; glibc&#39;s unistd.h header provides the same macro with the<br>
&gt; subtle difference in type casting. Adjust macro name to the<br>
&gt; common standard and define conditionally.<br>
&gt;<br>
&gt; Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.=
com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 chardev/char-pipe.c=C2=A0 =C2=A0 | 12 +++++++++---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
&gt;=C2=A0 include/qemu/osdep.h=C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
&gt;=C2=A0 net/l2tpv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +=
++++---<br>
&gt;=C2=A0 net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +=
+++++----<br>
&gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt;=C2=A0 qga/commands-posix.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 tests/qtest/libqtest.c |=C2=A0 2 +-<br>
&gt;=C2=A0 util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
&gt;=C2=A0 12 files changed, 35 insertions(+), 21 deletions(-)<br>
&gt;<br>
&gt; diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>
&gt; index cf78454841..7f5ed9aba3 100644<br>
&gt; --- a/chardev/char-fd.c<br>
&gt; +++ b/chardev/char-fd.c<br>
&gt; @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int fl=
ags,<br>
&gt; Error **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fd =3D -1;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 TFR(fd =3D qemu_open_old(src, flags, 0666));<br>
&gt; +=C2=A0 =C2=A0 TEMP_FAILURE_RETRY(fd =3D qemu_open_old(src, flags, 066=
6));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(errp, errno, sr=
c);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c<br>
&gt; index 66d3b85091..aed97e306b 100644<br>
&gt; --- a/chardev/char-pipe.c<br>
&gt; +++ b/chardev/char-pipe.c<br>
&gt; @@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filename_in =3D g_strdup_printf(&quot;%<a href=3D"=
http://s.in" rel=3D"noreferrer" target=3D"_blank">s.in</a>&quot;, filename)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filename_out =3D g_strdup_printf(&quot;%s.out&quot=
;, filename);<br>
&gt; -=C2=A0 =C2=A0 TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BIN=
ARY));<br>
&gt; -=C2=A0 =C2=A0 TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_B=
INARY));<br>
&gt; +=C2=A0 =C2=A0 TEMP_FAILURE_RETRY(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_in =3D qemu_open_old(filename_in, O_RD=
WR | O_BINARY)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 TEMP_FAILURE_RETRY(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_out =3D qemu_open_old(filename_out, O_=
RDWR | O_BINARY)<br>
&gt; +=C2=A0 =C2=A0 );<br>
<br>
Style question: do we want the &quot;);&quot; on its own line?=C2=A0 I thin=
k we<br>
generally don&#39;t do that for function and function-like macro calls.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(filename_in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(filename_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (fd_in &lt; 0 || fd_out &lt; 0) {<br>
&gt; @@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_out &gt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(fd_in =3D fd_out =3D qemu_open_old(fi=
lename, O_RDWR | O_BINARY));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEMP_FAILURE_RETRY(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_in =3D fd_out =3D qemu_o=
pen_old(filename, O_RDWR | O_BINARY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_in &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_file_open(e=
rrp, errno, filename);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index c90ab947ba..e803c05d0c 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,<b=
r>
&gt; V9fsPath *fs_path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(tsize =3D read(fd, (void *)buf, bufsz=
));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEMP_FAILURE_RETRY(tsize =3D read(fd, (vo=
id *)buf, bufsz));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if ((fs_ctx-&gt;export_flags &amp; V9FS_SM_=
PASSTHROUGH) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fs_ctx-&=
gt;export_flags &amp; V9FS_SM_NONE)) {<br>
&gt; @@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const =
char<br>
&gt; *oldpath,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Write the oldpath (target) to the=
 file. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldpath_size =3D strlen(oldpath);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFR(write_size =3D write(fd, (void *)oldp=
ath, oldpath_size));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEMP_FAILURE_RETRY(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_size =3D write(fd, (v=
oid *)oldpath, oldpath_size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write_size !=3D oldpath_size) {<=
br>
&gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
&gt; index b1c161c035..55f2927d8b 100644<br>
&gt; --- a/include/qemu/osdep.h<br>
&gt; +++ b/include/qemu/osdep.h<br>
&gt; @@ -242,8 +242,10 @@ void QEMU_ERROR(&quot;code path is reachable&quot=
;)<br>
&gt;=C2=A0 #if !defined(ESHUTDOWN)<br>
&gt;=C2=A0 #define ESHUTDOWN 4099<br>
&gt;=C2=A0 #endif<br>
&gt; -<br>
&gt; -#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=
=3D EINTR)<br>
&gt; +#if !defined(TEMP_FAILURE_RETRY)<br>
&gt; +#define TEMP_FAILURE_RETRY(expr) \<br>
&gt; +=C2=A0 =C2=A0 do { if ((expr) !=3D -1) break; } while (errno =3D=3D E=
INTR)<br>
&gt; +#endif<br>
<br>
GLibc&#39;s version is<br>
<br>
=C2=A0 =C2=A0# define TEMP_FAILURE_RETRY(expression) \<br>
=C2=A0 =C2=A0 =C2=A0(__extension__=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0({ long int __result;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do __result =3D (long int) (expression);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (__result =3D=3D -1L &amp;&amp; er=
rno =3D=3D EINTR);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __result; }))<br>
<br>
The difference isn&#39;t just &quot;type casting&quot;, it&#39;s also state=
ment<br>
vs. expression.<br>
<br>
Is it a good idea to have the macro expand into a statement on some<br>
hosts, and into an expression on others?=C2=A0 Sure, CI should catch any us=
es<br>
as expression, but delaying compile errors to CI wastes developer time.<br>
<br>
&gt;<br>
&gt;=C2=A0 /* time_t may be either 32 or 64 bits depending on the host OS, =
and<br>
&gt;=C2=A0 =C2=A0* can be either signed or unsigned, so we can&#39;t just h=
ardcode a<br>
<br>
[...]<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--000000000000cd64b805e5b6954d--

