Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513A30374E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:26:29 +0100 (CET)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ik8-0000l8-IS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4IZ2-00020c-Ur
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:15:01 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:35224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l4IZ0-00017h-QT
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:15:00 -0500
Received: by mail-qt1-x831.google.com with SMTP id t17so11623752qtq.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2pEc1603nllVFbgO9nOE74H5PHMS3LnVBqVhnpqCTn4=;
 b=EHJrQzSxn7Z5I2+AYzDs2lBm0e0OHaK50s+zqv9ZSrUUZeXDFAhkyy/9XFfLiZ+aJs
 edhhArLSCvyLE7oH+N6G0q9mUshJ+Cq1ziiwPA19Dqsh+1nJkl0GQBGa818CaYW3uCK7
 X2Klr86JKkd2IoIS7UT4MINFF/CR87dQT5+HBi2Wdt38ByzrMzmf1uQL2UiAlcVfWvPh
 wTN3awdYgqlKiYGYAPll52mCYUxB+rROrnviP9EvxCR+2nCSHKOCrdAdPyDPlQCUs+bt
 lYr1C67MVBV3uv5pwDMLrMmLjYZaq2NeO35ee9tm3cU7Lgi8a54UhPegtvi/AucV+LUx
 GtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2pEc1603nllVFbgO9nOE74H5PHMS3LnVBqVhnpqCTn4=;
 b=TsXxBU6R/XFu1iNsyedu3LpSZogy+FY+TwJ8Kov66O2hfFivQwAllDuJ1pxwuud/El
 TzXwRv9a0foTy5Aai1YPDQ3XDsm43fYmy6Mf3pzizSFVfNWQ2rlVXRj7E9P2SH8LHKL9
 hkF3iY3Uo/Ki0SJApxEGly2kW8f1Iy+I4xocaC7Io9R04c33tZSw7cLeJuOL7/oP/F73
 sHHev94OAYDnyaHrBZC9C1BG8PXSFH/ittvVbQp3B0yUU8ilNJmxPbYAUVMFYd3GnOon
 cHxEb7/JA89kZlhu9yxNLhlpT2HCLQNABRXhQfzsbLAPdORwRXy6ouKH9YRRNHGWQ02Y
 XIlw==
X-Gm-Message-State: AOAM530Yc7nLrIATeoBupRZKi1DwFzvf5MTuOnOv83cDTh2PkA2d1QeN
 xnHWY6OAyOFrXtbIFCJkPLJyP79T23VovSPoZtUNdg==
X-Google-Smtp-Source: ABdhPJw2QNQfeueAuI+58D66mf/DQenFZ+0JK4YRdbQXGX6OveLVzcMKuFGjNOYZSjDITyp9eceKNj1y7Dd57TLiaX4=
X-Received: by 2002:a05:622a:1c9:: with SMTP id
 t9mr3987023qtw.244.1611645297729; 
 Mon, 25 Jan 2021 23:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-4-j@getutm.app>
 <CANCZdfqcbb5r_BmsqCN6uymBghbJg6nd1aAr1qfNryVQmfdOwQ@mail.gmail.com>
 <CA+E+eSAAaMagLdb_oUA2xS41jVLBSop-Z1AARKZ4A6uCLbqK+A@mail.gmail.com>
 <e361b373-75bd-e75d-027c-51b6562ed81c@redhat.com>
In-Reply-To: <e361b373-75bd-e75d-027c-51b6562ed81c@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 26 Jan 2021 00:14:46 -0700
Message-ID: <CANCZdfos+7C=xhB103UcipT38J7QYPp7a3BiR9paQpzYQmQRrg@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] configure: check for sys/disk.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000079bb7005b9c869a6"
Received-SPF: none client-ip=2607:f8b0:4864:20::831;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Joelle van Dyne <j@getutm.app>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000079bb7005b9c869a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 12:08 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 1/26/21 6:55 AM, Joelle van Dyne wrote:
> > Previously, the only case where sys/disk.h does not exist is on
> > platforms that define __DragonFly__. However, iOS also does not have
> > this header. Previously, I had it as
> >
> > #if defined(__DragonFly__) || defined(CONFIG_IOS)
> >
> > But there was a code review comment that we should use feature flags
> > instead of platform defines. So I added the HAS_SYS_DISK_H flag.
>
> On technical lists, it's best to avoid top-posting, and to
> instead reply inline to make the conversation easier to follow.
>
> >
> > -j
> >
> > On Mon, Jan 25, 2021 at 8:35 PM Warner Losh <imp@bsdimp.com> wrote:
> >>
> >>
> >>
> >> On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne <j@getutm.app> wrote:
> >>>
> >>> Some BSD platforms do not have this header.
> >>>
> >>> Signed-off-by: Joelle van Dyne <j@getutm.app>
> >>> ---
> >>>  meson.build        | 1 +
> >>>  block.c            | 2 +-
> >>>  block/file-posix.c | 2 +-
> >>>  3 files changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meson.build b/meson.build
> >>> index 27110075df..6818d97df5 100644
> >>> --- a/meson.build
> >>> +++ b/meson.build
> >>> @@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H',
> cc.has_header('pty.h'))
> >>>  config_host_data.set('HAVE_SYS_IOCCOM_H',
> cc.has_header('sys/ioccom.h'))
> >>>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> >>>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_devic=
e)
> >>> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
> >>>
> >>>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> >>>  arrays =3D ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST',
> 'CONFIG_BDRV_RO_WHITELIST']
> >>> diff --git a/block.c b/block.c
> >>> index 8b9d457546..c4cf391dea 100644
> >>> --- a/block.c
> >>> +++ b/block.c
> >>> @@ -54,7 +54,7 @@
> >>>  #ifdef CONFIG_BSD
> >>>  #include <sys/ioctl.h>
> >>>  #include <sys/queue.h>
> >>> -#ifndef __DragonFly__
> >>> +#if defined(HAVE_SYS_DISK_H)
> >>>  #include <sys/disk.h>
> >>>  #endif
> >>>  #endif
> >>> diff --git a/block/file-posix.c b/block/file-posix.c
> >>> index 11d2021346..666d3e7504 100644
> >>> --- a/block/file-posix.c
> >>> +++ b/block/file-posix.c
> >>> @@ -2320,7 +2320,7 @@ again:
> >>>          }
> >>>          if (size =3D=3D 0)
> >>>  #endif
> >>> -#if defined(__APPLE__) && defined(__MACH__)
> >>> +#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) &&
> defined(__MACH__)
> >>
> >>
> >> Why is this needed? __DragonFly__ doesn't define either __APPLE__ or
> __MACH__
>
> Hmm we could also add:
>
>   config_host_data.set('HAVE_DKIOCGETBLOCKCOUNT', cc.compiles(...))
>
> Then this block would be easier to read:
>
>   #if defined(HAVE_DKIOCGETBLOCKCOUNT)
>   ...
>
> (Maybe this is what Warner meant?)
>

Close. I'd test it more directly since DKIOCGETBLOCKCOUNT is already a
#define, and is unlikely to change...

When I saw Joelle's response, I realized I'd been needlessly cryptic in my
comments, so posted what I had in mind for cleanup. I'm not sure if the
norms of qemu code reviews would say my suggestion was too big to be in
scope, or not.

Warner

>>
> >> Warner
> >>
> >>>
> >>>          {
> >>>              uint64_t sectors =3D 0;
> >>>              uint32_t sector_size =3D 0;
> >>> --
> >>> 2.28.0
> >>>
> >>>
> >
>
>

--00000000000079bb7005b9c869a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 26, 2021 at 12:08 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 1/26/21 6:55 AM, Joelle van Dyne wrote:<br>
&gt; Previously, the only case where sys/disk.h does not exist is on<br>
&gt; platforms that define __DragonFly__. However, iOS also does not have<b=
r>
&gt; this header. Previously, I had it as<br>
&gt; <br>
&gt; #if defined(__DragonFly__) || defined(CONFIG_IOS)<br>
&gt; <br>
&gt; But there was a code review comment that we should use feature flags<b=
r>
&gt; instead of platform defines. So I added the HAS_SYS_DISK_H flag.<br>
<br>
On technical lists, it&#39;s best to avoid top-posting, and to<br>
instead reply inline to make the conversation easier to follow.<br>
<br>
&gt; <br>
&gt; -j<br>
&gt; <br>
&gt; On Mon, Jan 25, 2021 at 8:35 PM Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jan 25, 2021 at 6:33 PM Joelle van Dyne &lt;j@getutm.app&g=
t; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Some BSD platforms do not have this header.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Joelle van Dyne &lt;j@getutm.app&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;&gt;&gt;=C2=A0 block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<=
br>
&gt;&gt;&gt;=C2=A0 block/file-posix.c | 2 +-<br>
&gt;&gt;&gt;=C2=A0 3 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt;&gt; index 27110075df..6818d97df5 100644<br>
&gt;&gt;&gt; --- a/meson.build<br>
&gt;&gt;&gt; +++ b/meson.build<br>
&gt;&gt;&gt; @@ -1117,6 +1117,7 @@ config_host_data.set(&#39;HAVE_PTY_H&#39=
;, cc.has_header(&#39;pty.h&#39;))<br>
&gt;&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_SYS_IOCCOM_H&#39;, cc.has=
_header(&#39;sys/ioccom.h&#39;))<br>
&gt;&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_SYS_KCOV_H&#39;, cc.has_h=
eader(&#39;sys/kcov.h&#39;))<br>
&gt;&gt;&gt;=C2=A0 config_host_data.set(&#39;HAVE_HOST_BLOCK_DEVICE&#39;, h=
ave_host_block_device)<br>
&gt;&gt;&gt; +config_host_data.set(&#39;HAVE_SYS_DISK_H&#39;, cc.has_header=
(&#39;sys/disk.h&#39;))<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actu=
ally per-target<br>
&gt;&gt;&gt;=C2=A0 arrays =3D [&#39;CONFIG_AUDIO_DRIVERS&#39;, &#39;CONFIG_=
BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_WHITELIST&#39;]<br>
&gt;&gt;&gt; diff --git a/block.c b/block.c<br>
&gt;&gt;&gt; index 8b9d457546..c4cf391dea 100644<br>
&gt;&gt;&gt; --- a/block.c<br>
&gt;&gt;&gt; +++ b/block.c<br>
&gt;&gt;&gt; @@ -54,7 +54,7 @@<br>
&gt;&gt;&gt;=C2=A0 #ifdef CONFIG_BSD<br>
&gt;&gt;&gt;=C2=A0 #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;&gt;=C2=A0 #include &lt;sys/queue.h&gt;<br>
&gt;&gt;&gt; -#ifndef __DragonFly__<br>
&gt;&gt;&gt; +#if defined(HAVE_SYS_DISK_H)<br>
&gt;&gt;&gt;=C2=A0 #include &lt;sys/disk.h&gt;<br>
&gt;&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt;&gt;&gt; index 11d2021346..666d3e7504 100644<br>
&gt;&gt;&gt; --- a/block/file-posix.c<br>
&gt;&gt;&gt; +++ b/block/file-posix.c<br>
&gt;&gt;&gt; @@ -2320,7 +2320,7 @@ again:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 0)<br>
&gt;&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;&gt; -#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
&gt;&gt;&gt; +#if defined(HAVE_SYS_DISK_H) &amp;&amp; defined(__APPLE__) &a=
mp;&amp; defined(__MACH__)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Why is this needed? __DragonFly__ doesn&#39;t define either __APPL=
E__ or __MACH__<br>
<br>
Hmm we could also add:<br>
<br>
=C2=A0 config_host_data.set(&#39;HAVE_DKIOCGETBLOCKCOUNT&#39;, cc.compiles(=
...))<br>
<br>
Then this block would be easier to read:<br>
<br>
=C2=A0 #if defined(HAVE_DKIOCGETBLOCKCOUNT)<br>
=C2=A0 ...<br>
<br>
(Maybe this is what Warner meant?)<br></blockquote><div><br></div><div>Clos=
e. I&#39;d test it more directly since=C2=A0DKIOCGETBLOCKCOUNT=C2=A0is alre=
ady a #define, and is unlikely to change...</div><div><br></div><div>When I=
 saw Joelle&#39;s response, I realized I&#39;d been needlessly cryptic in=
=C2=A0my comments, so posted what I had in mind for cleanup. I&#39;m not su=
re if the norms of qemu code reviews would say my suggestion was too big to=
 be in scope, or not.</div><div><br></div><div>Warner</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; Warner<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t secto=
rs =3D 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t secto=
r_size =3D 0;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.28.0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000079bb7005b9c869a6--

