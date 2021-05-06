Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BA3755FB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:55:31 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefPX-0003O8-1F
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefJ7-00065N-QN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:48:53 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefJ3-000095-JY
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:48:53 -0400
Received: by mail-qk1-x731.google.com with SMTP id a22so4567060qkl.10
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Gb0I7ISeIJ1QqvZBHcd3YAVMORjuBTVTOovRqj2pUM=;
 b=QXKAsXRdzB6Z9p0YOiFHSVzJNKe0Z3+WxHCeAtGu+Ki/CSZc+6gKRztKHg1GYPcCUk
 EBIJzueuPrTdG3LH8gPG9a3dpaJl9Tld0lj3OXa9zlWE2cRaSIuZ8N+Iqi79hWpCjCIZ
 uik3l+bZ/25pVklG4hvu6x6XMTbcHCzO2XvGbe+AGacUUYzaYE4HAuJbsAeAgf5EzSmN
 bzetqBfqU4bdr6ScQ73ckMsFAqzTsMDyS+G5g+RoE59xxbB4qYFNcxMt7XYeaHzQWj4a
 ZKZ0nOnrsRa44bFlekEdMXtSBbhjfV8tciIBlem9RlKC+MdrtQmI55qAJPm7jAwTPQRO
 hqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Gb0I7ISeIJ1QqvZBHcd3YAVMORjuBTVTOovRqj2pUM=;
 b=Em1vAg4fo0pbTpohmVGHfwkvX9FDiobNDcj1nb7yuMc3nMLtaGQhxBPjJLt1mW/oqW
 L1QqZyhLMp4UqTP/ylt0QtXOQdSfDgdrQWJ9MaC+E6Gzex9u/EUNwRrQlsz6cw/ZGqDO
 aLHuwzSusDLFz+6tdqnLUcBtILNNtYvzxvY1vpC2f7B5a0r3YVDD/OKEjY/RGhNIn2xL
 kyryoXIzdT58uJc1RgImbu3cQXxwdyrRZ7lVrFGzWjN5ikZL+WGI2Rqp8ekQ9ZuHUBf2
 89k7vVPg2iGEenyvpcRkxjfP5pAcpdYa8CXa9wX46w68zYFPfZscf3/CvShxKeBkXVy2
 oSQQ==
X-Gm-Message-State: AOAM532qoGplkNfivb6G++kGLDJh7WqBjyGapZl+bKUf0GFl8Br7Tz6T
 A1zixnS0bQ/wMw36d5SwE0h2pJ0TRfFG+HmT7rTKNw==
X-Google-Smtp-Source: ABdhPJzoB4t5FgdV/5LEzVbTgT6jcxavkAR8WxPXlAl2GKUGjqdxD/h6izTHh3Nv+CBGgNK48IoVV6xmeGpj/lhF7N8=
X-Received: by 2002:a37:7685:: with SMTP id r127mr4125026qkc.359.1620312528205; 
 Thu, 06 May 2021 07:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
In-Reply-To: <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:48:37 -0600
Message-ID: <CANCZdfpXjDECHmZq55zP43g32OVhnfjf9W+ERtPMFeDs2MmvXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ab554205c1aa6823"
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x731.google.com
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ab554205c1aa6823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:21 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 6 May 2021 at 15:17, Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
> wrote:
> >>
> >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >>
> >> Replace it by a g_new() call.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  bsd-user/syscall.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> >> index 4abff796c76..dbee0385ceb 100644
> >> --- a/bsd-user/syscall.c
> >> +++ b/bsd-user/syscall.c
> >> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num=
,
> abi_long arg1,
> >>      case TARGET_FREEBSD_NR_writev:
> >>          {
> >>              int count =3D arg3;
> >> -            struct iovec *vec;
> >> +            g_autofree struct iovec *vec =3D g_new(struct iovec, coun=
t);
> >
> >
> > Where is this freed?
>
> g_autofree, so it gets freed when it goes out of scope.
>
> https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-=
autofree


Ah. I'd missed that feature and annotation...  Too many years seeing
patches like
this in other projects where a feature like this wasn't there to save the
day...

This means you can ignore my other message as equally misinformed.


>
> > Also, alloca just moves a stack pointer, where malloc has complex
> interactions. Are you sure that's a safe change here?
>
> alloca()ing something with size determined by the guest is
> definitely not safe :-) malloc as part of "handle this syscall"
> is pretty common, at least in linux-user.
>

Well, since this is userland emulation, the normal process boundaries will
fix that. allocating from
the heap is little different..., so while unsafe, it's the domain of
$SOMEONE_ELSE to enforce
the safety. linux-user has many similar usages for both malloc and alloca,
and it's ok for the
same reason.

Doing a quick grep on my blitz[*] branch in the bsd-user fork shows that
alloca is used almost
exclusively there. There's 24 calls to alloca in the bsd-user code. There's
almost no malloc
calls (7) in that at all outside the image loader: all but one of them are
confined to sysctl
emulation with the last one used to keep track of thread state in new
threads...
linux-user has a similar profile (20 alloca's and 14 mallocs outside the
loader),
but with more mallocs in other paths than just sysctl (which isn't present)=
.

I had no plans on migrating to anything else...

Warner

--000000000000ab554205c1aa6823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:21 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 6 May 2021 at 15:17, Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;=
.<br>
&gt;&gt;<br>
&gt;&gt; Replace it by a g_new() call.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 bsd-user/syscall.c | 3 +--<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
&gt;&gt; index 4abff796c76..dbee0385ceb 100644<br>
&gt;&gt; --- a/bsd-user/syscall.c<br>
&gt;&gt; +++ b/bsd-user/syscall.c<br>
&gt;&gt; @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int=
 num, abi_long arg1,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case TARGET_FREEBSD_NR_writev:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D arg3=
;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree struct iovec=
 *vec =3D g_new(struct iovec, count);<br>
&gt;<br>
&gt;<br>
&gt; Where is this freed?<br>
<br>
g_autofree, so it gets freed when it goes out of scope.<br>
<a href=3D"https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macro=
s.html#g-autofree" rel=3D"noreferrer" target=3D"_blank">https://developer.g=
nome.org/glib/stable/glib-Miscellaneous-Macros.html#g-autofree</a></blockqu=
ote><div><br></div><div>Ah. I&#39;d missed that feature and annotation...=
=C2=A0 Too many years seeing patches like</div><div>this in other projects =
where a feature like this wasn&#39;t there to save the day...</div><div><br=
></div><div>This means you can ignore my other message as equally misinform=
ed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
&gt; Also, alloca just moves a stack pointer, where malloc has complex inte=
ractions. Are you sure that&#39;s a safe change here?<br>
<br>
alloca()ing something with size determined by the guest is<br>
definitely not safe :-) malloc as part of &quot;handle this syscall&quot;<b=
r>
is pretty common, at least in linux-user.<br></blockquote><div><br></div><d=
iv>Well, since this is userland emulation, the normal process boundaries wi=
ll fix that. allocating from</div><div>the heap is little different..., so =
while unsafe, it&#39;s the domain of $SOMEONE_ELSE to enforce</div><div>the=
 safety. linux-user has many similar usages for both malloc and alloca, and=
 it&#39;s ok for the</div><div>same reason.</div><div><br></div><div>Doing =
a quick grep on my blitz[*] branch in the bsd-user fork shows that alloca i=
s used almost</div><div>exclusively there. There&#39;s 24 calls to alloca i=
n the bsd-user code. There&#39;s almost no malloc</div><div>calls (7) in th=
at at all outside the image loader: all but one of them are confined to sys=
ctl</div><div>emulation with the last one used to keep track of thread stat=
e in new threads...</div><div>linux-user has a similar profile (20 alloca&#=
39;s and 14 mallocs outside the loader),</div><div>but with more mallocs in=
 other paths than just sysctl (which isn&#39;t present).</div><div><br></di=
v><div>I had no plans on migrating to anything else...</div><div><br></div>=
<div>Warner</div><div><br></div></div></div>

--000000000000ab554205c1aa6823--

