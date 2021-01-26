Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E6303732
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:13:24 +0100 (CET)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IXT-0007hu-2X
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4ITr-00069U-5m
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:09:39 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4ITl-0007m7-9S
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:09:38 -0500
Received: by mail-qt1-x82c.google.com with SMTP id v3so11595993qtw.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DRjed0XCUX40JB7bPtj7jz8KEmHqKue74aZa4SM/LI=;
 b=jWYgT4cvyOdsqGyeQozxNN7iO5M3yHOB9WFnUqn/ehezXBYuONtjS/q3hUgrEKTD6Y
 Z9jW1jhhJHTcrvl0lC/ZmP1FmfSNnJAsMeTcI9NFaRym+P8huFcp5YSwzRPyNraQAgGg
 cv3q44gxWh1S8n+0I35xp1EQRgXXT9lyXh09aZq+N9UoGRzNcrPB2bfWFIppn5zZSBI6
 iPlrBUKCNMvw4EtmGzGzHYvUL3DmLQNfCmmShwsHFiqf5CkBexGxKS8NR4n1i6ZDaHpg
 Qqi+ZwlhK24zJcmk+a48P99hvtY5TD9/tD/R5AmGd35vCS/MBACE7AznJ/qWPbu9oJ2e
 LeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DRjed0XCUX40JB7bPtj7jz8KEmHqKue74aZa4SM/LI=;
 b=BOBu9nurfXNJdK0OVLCDhQYtLGpKf2Zypi8z6O2HhPfCa42I2v1Y6VIIpa6vq4WlrW
 rpW3otNxHK+b5Abix5ydlAo94aBPoacAYJgwWuwZD8Zmyv9xx/X6enQlQBGcrJ4JZrc+
 VgSCzxDTA9B1t/U+lN7G+7IE+CdQqTB8gd+S2/1gUmoOZrlZ2H4m/D7gBqTTsU7TVjSd
 90v8Kv792Uw3vUgoDpYgFLlLwnF9MywKvebBWrlTGeys/1p4N1n4oi1xf71XXrlY1BJl
 ftLKR34WWyylEXFkWFrAyFf9w67sa9MAnxSP2SPVCxfUXNacFWEzGQ/SabzkKFKZF+5U
 lsVw==
X-Gm-Message-State: AOAM5331N/a/2hn/X/1H9mPcOQWZkjjEYNK0PEokP5MnmU8sFIHE70KS
 M5A89mNqtH0OYv08dnndyEsvGNBHC+raByPD0eLatg==
X-Google-Smtp-Source: ABdhPJwugA+PIeLwIZQ0KteKmukmEq/1ETPYnznrgh10aBIFdNzNLKyj/9GKbJTzAAyuvXHnEH4+YwKbiCptp/6Ofdk=
X-Received: by 2002:ac8:72cc:: with SMTP id o12mr3951044qtp.101.1611644971838; 
 Mon, 25 Jan 2021 23:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-4-j@getutm.app>
 <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
 <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
In-Reply-To: <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 26 Jan 2021 00:09:20 -0700
Message-ID: <CANCZdfpPAKfKnBs4q+PyjNh+4S6J1wdb-MLKFR8gCEJGuL9jNA@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] configure: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>
Content-Type: multipart/alternative; boundary="0000000000000d00e305b9c85661"
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d00e305b9c85661
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 10:55 PM Joelle van Dyne <j@getutm.app> wrote:

> Previously, the only case where sys/disk.h does not exist is on
> platforms that define __DragonFly__. However, iOS also does not have
> this header. Previously, I had it as
>
> #if defined(__DragonFly__) || defined(CONFIG_IOS)
>
> But there was a code review comment that we should use feature flags
> instead of platform defines. So I added the HAS_SYS_DISK_H flag.
>

Right. I like that the #include is now protected like that. However,
sys/disk.h never was standardized and varies considerably among the systems
that it exists on.


> -j
>
> On Mon, Jan 25, 2021 at 8:35 PM Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne <j@getutm.app> wrote:
> >>
> >> Some BSD platforms do not have this header.
> >>
> >> Signed-off-by: Joelle van Dyne <j@getutm.app>
> >> ---
> >>  meson.build        | 1 +
> >>  block.c            | 2 +-
> >>  block/file-posix.c | 2 +-
> >>  3 files changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 27110075df..6818d97df5 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H',
> cc.has_header('pty.h'))
> >>  config_host_data.set('HAVE_SYS_IOCCOM_H',
> cc.has_header('sys/ioccom.h'))
> >>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> >>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> >> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
> >>
> >>  ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> >>  arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST',
> 'CONFIG_BDRV_RO_WHITELIST']
> >> diff --git a/block.c b/block.c
> >> index 8b9d457546..c4cf391dea 100644
> >> --- a/block.c
> >> +++ b/block.c
> >> @@ -54,7 +54,7 @@
> >>  #ifdef CONFIG_BSD
> >>  #include <sys/ioctl.h>
> >>  #include <sys/queue.h>
> >> -#ifndef __DragonFly__
> >> +#if defined(HAVE_SYS_DISK_H)
> >>  #include <sys/disk.h>
> >>  #endif
> >>  #endif
> >> diff --git a/block/file-posix.c b/block/file-posix.c
> >> index 11d2021346..666d3e7504 100644
> >> --- a/block/file-posix.c
> >> +++ b/block/file-posix.c
> >> @@ -2320,7 +2320,7 @@ again:
> >>          }
> >>          if (size == 0)
> >>  #endif
> >> -#if defined(__APPLE__) && defined(__MACH__)
> >> +#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) && defined(__MACH__)
> >
> >
> > Why is this needed? __DragonFly__ doesn't define either __APPLE__ or
> __MACH_
>

Which is why I asked this question...

Let me ask it another way. Why not base this on the
ioctl  DKIOCGETBLOCKCOUNT like the rest of this function? It's simple and
on platforms that don't have that ioctl, it won't be used.  I don't even
know how to read the proposed change logically. If IOS doesn't have this
interface, then you'll need another #else <something-else> to work reliably
anyway, since the seek trick that's used there may or may not work. However
that starts to get kinda nested and twisty.  So maybe something more like
the following would make it clearer... though that might be beyond the
scope of what you're trying to do.

diff --git a/block/file-posix.c b/block/file-posix.c
index 00cdaaa2d4..704ded68b0 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2295,8 +2295,10 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
         if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+            size = 0;
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -2305,9 +2307,7 @@ again:
                 else
                         size = 0;
         }
-        if (size == 0)
-#endif
-#if defined(__APPLE__) && defined(__MACH__)
+#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
         {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
@@ -2315,19 +2315,15 @@ again:
             if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
                && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
                 size = sectors * sector_size;
-            } else {
-                size = lseek(fd, 0LL, SEEK_END);
-                if (size < 0) {
-                    return -errno;
-                }
             }
         }
-#else
-        size = lseek(fd, 0LL, SEEK_END);
+#endif
+        if (size == 0) {
+            size = lseek(fd, 0LL, SEEK_END);
+        }
         if (size < 0) {
             return -errno;
         }
-#endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
         switch(s->type) {
         case FTYPE_CD:

Warner

>
> >>
> >>          {
> >>              uint64_t sectors = 0;
> >>              uint32_t sector_size = 0;
> >> --
> >> 2.28.0
> >>
> >>
>

--0000000000000d00e305b9c85661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25, 2021 at 10:55 PM Joel=
le van Dyne &lt;j@getutm.app&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Previously, the only case where sys/disk.h does not=
 exist is on<br>
platforms that define __DragonFly__. However, iOS also does not have<br>
this header. Previously, I had it as<br>
<br>
#if defined(__DragonFly__) || defined(CONFIG_IOS)<br>
<br>
But there was a code review comment that we should use feature flags<br>
instead of platform defines. So I added the HAS_SYS_DISK_H flag.<br></block=
quote><div><br></div><div>Right. I like that the #include is now protected =
like that. However, sys/disk.h never was standardized and varies considerab=
ly among the systems that it exists on.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-j<br>
<br>
On Mon, Jan 25, 2021 at 8:35 PM Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne &lt;j@getutm.app&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Some BSD platforms do not have this header.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Joelle van Dyne &lt;j@getutm.app&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;&gt;=C2=A0 block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;=C2=A0 block/file-posix.c | 2 +-<br>
&gt;&gt;=C2=A0 3 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt; index 27110075df..6818d97df5 100644<br>
&gt;&gt; --- a/meson.build<br>
&gt;&gt; +++ b/meson.build<br>
&gt;&gt; @@ -1117,6 +1117,7 @@ config_host_data.set(&#39;HAVE_PTY_H&#39;, c=
c.has_header(&#39;pty.h&#39;))<br>
&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_SYS_IOCCOM_H&#39;, cc.has_hea=
der(&#39;sys/ioccom.h&#39;))<br>
&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_SYS_KCOV_H&#39;, cc.has_heade=
r(&#39;sys/kcov.h&#39;))<br>
&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_HOST_BLOCK_DEVICE&#39;, have_=
host_block_device)<br>
&gt;&gt; +config_host_data.set(&#39;HAVE_SYS_DISK_H&#39;, cc.has_header(&#3=
9;sys/disk.h&#39;))<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually=
 per-target<br>
&gt;&gt;=C2=A0 arrays =3D [&#39;CONFIG_AUDIO_DRIVERS&#39;, &#39;CONFIG_BDRV=
_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_WHITELIST&#39;]<br>
&gt;&gt; diff --git a/block.c b/block.c<br>
&gt;&gt; index 8b9d457546..c4cf391dea 100644<br>
&gt;&gt; --- a/block.c<br>
&gt;&gt; +++ b/block.c<br>
&gt;&gt; @@ -54,7 +54,7 @@<br>
&gt;&gt;=C2=A0 #ifdef CONFIG_BSD<br>
&gt;&gt;=C2=A0 #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;sys/queue.h&gt;<br>
&gt;&gt; -#ifndef __DragonFly__<br>
&gt;&gt; +#if defined(HAVE_SYS_DISK_H)<br>
&gt;&gt;=C2=A0 #include &lt;sys/disk.h&gt;<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt;&gt; index 11d2021346..666d3e7504 100644<br>
&gt;&gt; --- a/block/file-posix.c<br>
&gt;&gt; +++ b/block/file-posix.c<br>
&gt;&gt; @@ -2320,7 +2320,7 @@ again:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0)<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
&gt;&gt; +#if defined(HAVE_SYS_DISK_H) &amp;&amp; defined(__APPLE__) &amp;&=
amp; defined(__MACH__)<br>
&gt;<br>
&gt;<br>
&gt; Why is this needed? __DragonFly__ doesn&#39;t define either __APPLE__ =
or __MACH_<br></blockquote><div><br></div><div>Which is why I asked this qu=
estion...=C2=A0</div><div><br></div><div>Let me ask it another way. Why not=
 base this on the ioctl=C2=A0=C2=A0DKIOCGETBLOCKCOUNT=C2=A0like the rest of=
 this function? It&#39;s simple and on platforms that don&#39;t have that i=
octl, it won&#39;t be used.=C2=A0 I don&#39;t even know how to read the pro=
posed change logically. If IOS doesn&#39;t have this interface, then you&#3=
9;ll need another #else &lt;something-else&gt; to work reliably anyway, sin=
ce the seek trick that&#39;s used there may or may not work. However that s=
tarts to get kinda nested and twisty.=C2=A0 So maybe something more like th=
e following would make it clearer... though that might be beyond the scope =
of what you&#39;re trying to do.</div><div><br></div><div>diff --git a/bloc=
k/file-posix.c b/block/file-posix.c<br>index 00cdaaa2d4..704ded68b0 100644<=
br>--- a/block/file-posix.c<br>+++ b/block/file-posix.c<br>@@ -2295,8 +2295=
,10 @@ static int64_t raw_getlength(BlockDriverState *bs)<br>=C2=A0again:<b=
r>=C2=A0#endif<br>=C2=A0 =C2=A0 =C2=A0if (!fstat(fd, &amp;sb) &amp;&amp; (S=
_IFCHR &amp; sb.st_mode)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 0;<br>=
=C2=A0#ifdef DIOCGMEDIASIZE<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(=
fd, DIOCGMEDIASIZE, (off_t *)&amp;size))<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0size =3D 0;<br>=C2=A0#elif defined(DIOCGPART)<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct partinfo pi;<br>@@ -2305,9 +2307,7 @@ again:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (size =3D=3D 0)<br>-#endif<br>-#if defined(__APPLE__) &amp=
;&amp; defined(__MACH__)<br>+#elif defined(DKIOCGETBLOCKCOUNT) &amp;&amp; d=
efined(DKIOCGETBLOCKSIZE)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t sectors =3D 0;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t sector_size =3D 0;<br>@@ =
-2315,19 +2315,15 @@ again:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (ioctl(fd, DKIOCGETBLOCKCOUNT, &amp;sectors) =3D=3D 0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ioctl(fd, DKIOC=
GETBLOCKSIZE, &amp;sector_size) =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sectors * sector_size;<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D lseek(fd, 0LL, SEEK_END);<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt; 0) {<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn -errno;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>-#else<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D lseek=
(fd, 0LL, SEEK_END);<br>+#endif<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =
=3D=3D 0) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D lseek(fd=
, 0LL, SEEK_END);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (size &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>-#endif<=
br>=C2=A0#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(s-&gt;type) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case FTYPE_CD:<br></div><div><br></div><div>Warner</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t sectors =
=3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t sector_si=
ze =3D 0;<br>
&gt;&gt; --<br>
&gt;&gt; 2.28.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000000d00e305b9c85661--

