Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D55525E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:37:59 +0200 (CEST)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3O9m-0000in-LE
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o3O4R-0005Vd-Tj
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:32:28 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o3O4M-0000uN-9k
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:32:27 -0400
Received: by mail-vs1-xe34.google.com with SMTP id f1so11817534vsv.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9r3RTDuYE9gHfA0Ss3y471cU1lqBzM9SNAwrMs7TUQQ=;
 b=oTTL2uDGgelt54q7B5VM+LET/frqdpIbQOXD1PlFfeSMdip+N7apvn1Onr4Py3OCbX
 zoPlJjf2M21zcgkKzeGHl6K5T+prJ4XnqbESQcXoyFVtt+KmwiI7K/fR3E7jz1JtR/qv
 W2drS5EgksAtgJtLzKOyoVxpvOBdAZIh4O1U4t41s7mR+NpsSU/zoFu5FroAe0qHTpTV
 XcqTiRmvw38GanPL1TJE4t/M1CucgX1jWgZRTf+9M9QQtSktYY50R+ie2eLfYzlOqm0q
 7MkTh+8dhebBpGA5zgIeH55eQi+iShnT+3gBG1uTU7UHavhAa9CidwkvSiVngzEZxKV/
 AvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9r3RTDuYE9gHfA0Ss3y471cU1lqBzM9SNAwrMs7TUQQ=;
 b=RWN8l1Kdlk/BdtcjtBQlUrggZAT09TK0aYFTVK3oppZ+QNZm+6dANAX0L8+K+c/bZl
 vJZZin2cF2fBeCUDDgHtON+k6IBBeo2stGH/I+LFp2364gswSy/mqK1LXYTzgCuxczB/
 8OVpApQNQK/3gkgkNFgg2/0M4DsV/JKdBNfIb11FRQazHrUdG2M/egAZ5ZVjiZrIRnAh
 V1gdVKxDtKfIrfZlIYNRlkowQVT93Wf6srnngL8jDOfHmS8NBil96Ar4MU40YUtJQ2Le
 yNEdu7IyHnOWH2p4P0PjV0oJRZw4bcZgmJ0xD6PjqJbccWEOUleDJgqJ6MoT8kvJmyB0
 euTg==
X-Gm-Message-State: AJIora96CSo1eK/Sy4b0L4hGz2W/p5kGqo74ARLw+O8aVBDQBsyexF19
 AjdyR8KPqPGVmqCX1D9H4+nMd4xe86kjN1ddid/tsQ==
X-Google-Smtp-Source: AGRyM1ulkO0m2rTBtzpmLkhbLBdQTwsZ9nNkYOtrS6986J46/qR7VIp+a3PXQVMoNEiB/laEFPe7uuWf4BGW4QjH3rA=
X-Received: by 2002:a05:6102:955:b0:354:2df0:ff20 with SMTP id
 a21-20020a056102095500b003542df0ff20mr3005154vsi.19.1655757141001; Mon, 20
 Jun 2022 13:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-5-imp@bsdimp.com>
 <76249ff6-cd3c-5b1c-f480-8c10c5b04429@linaro.org>
In-Reply-To: <76249ff6-cd3c-5b1c-f480-8c10c5b04429@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 20 Jun 2022 14:32:09 -0600
Message-ID: <CANCZdfrMBa7ErqZLCFcou7S6W8OYkh_8EAL4FPnBhmPGVjTmqA@mail.gmail.com>
Subject: Re: [PATCH 04/10] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Stacey Son <sson@freebsd.org>, Michal Meloun <mmel@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000395d0e05e1e7006f"
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

--000000000000395d0e05e1e7006f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 1:13 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/20/22 10:42, Warner Losh wrote:
> > These implement both the old-pre INO64 mknod variations, as well as the
> > now current INO64 variant. To implement the old stuff, we use some
> > linker magic to bind to the old versions of these functions.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/bsd-file.h           | 59 +++++++++++++++++++++++++++++++++++
> >   bsd-user/freebsd/os-syscall.c | 15 +++++++++
> >   2 files changed, 74 insertions(+)
> >
> > diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> > index 0585f6a2a40..3be832b2a74 100644
> > --- a/bsd-user/bsd-file.h
> > +++ b/bsd-user/bsd-file.h
> > @@ -51,6 +51,16 @@ do {                                        \
> >       unlock_user(p1, arg1, 0);               \
> >   } while (0)
> >
> > +#ifndef BSD_HAVE_INO64
> > +#define freebsd11_mknod         mknod
> > +#define freebsd11_mknodat       mknodat
> > +#else
> > +int freebsd11_mknod(char *path, mode_t mode, uint32_t dev);
> > +__sym_compat(mknod, freebsd11_mknod, FBSD_1.0);
> > +int freebsd11_mknodat(int fd, char *path, mode_t mode, uint32_t dev);
> > +__sym_compat(mknodat, freebsd11_mknodat, FBSD_1.1);
> > +#endif
>
> Where does BSD_HAVE_INO64 come from?  I can't find it defined in freebsd
> git.
>

It used to be defined conditionally on FreeBSD 12 vs earlier. Now it's
defined unconditionally
in a file that wasn't part of the upstreaming. I'll rework now that it's
unconditional because
there's no way we could run on a FreeBSD 11 system. Normally we'd just
retire these older
system calls to limit the scope of what we need to maintain, but we have to
have the old FreeBSD-11
era pre-INO64 system calls (here and elsewhere) to support rust since it
doesn't use libc at all.


> You should probably avoid the linker tricks and use direct syscalls of
> SYS_freebsd11_mknodat etc
>

Yea, on pre-ino64 systems, there were no system calls like that. Now that
we have them, I think
you are right that we'd be better off just using the system call directly
rather than needing this hack
to get the old system calls. the old symbols will be around forever, but
it's better to be more direct here.
There's nothing hidden in the libc versions of these symbols.

tl;dr: It's always defined now, so I'll unifdef it.

Warner

--000000000000395d0e05e1e7006f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 1:13 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 6/20/22 10:42, Warner Losh wrote:<br>
&gt; These implement both the old-pre INO64 mknod variations, as well as th=
e<br>
&gt; now current INO64 variant. To implement the old stuff, we use some<br>
&gt; linker magic to bind to the old versions of these functions.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Michal Meloun &lt;mmel@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/bsd-file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 59 +++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.c | 15 +++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 74 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h<br>
&gt; index 0585f6a2a40..3be832b2a74 100644<br>
&gt; --- a/bsd-user/bsd-file.h<br>
&gt; +++ b/bsd-user/bsd-file.h<br>
&gt; @@ -51,6 +51,16 @@ do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(p1, arg1, 0);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0} while (0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#ifndef BSD_HAVE_INO64<br>
&gt; +#define freebsd11_mknod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mknod<br>
&gt; +#define freebsd11_mknodat=C2=A0 =C2=A0 =C2=A0 =C2=A0mknodat<br>
&gt; +#else<br>
&gt; +int freebsd11_mknod(char *path, mode_t mode, uint32_t dev);<br>
&gt; +__sym_compat(mknod, freebsd11_mknod, FBSD_1.0);<br>
&gt; +int freebsd11_mknodat(int fd, char *path, mode_t mode, uint32_t dev);=
<br>
&gt; +__sym_compat(mknodat, freebsd11_mknodat, FBSD_1.1);<br>
&gt; +#endif<br>
<br>
Where does BSD_HAVE_INO64 come from?=C2=A0 I can&#39;t find it defined in f=
reebsd git.<br></blockquote><div><br></div><div>It used to be defined condi=
tionally on FreeBSD 12 vs earlier. Now it&#39;s defined unconditionally</di=
v><div>in a file that wasn&#39;t part of the upstreaming. I&#39;ll rework n=
ow that it&#39;s unconditional because</div><div>there&#39;s no way we coul=
d run on a FreeBSD 11 system. Normally we&#39;d just retire these older</di=
v><div>system calls to limit the scope of what we need to maintain, but we =
have to have the old FreeBSD-11</div><div>era pre-INO64 system calls (here =
and elsewhere) to support rust since it doesn&#39;t use libc at all.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
You should probably avoid the linker tricks and use direct syscalls of <br>
SYS_freebsd11_mknodat etc<br></blockquote><div><br></div><div>Yea, on pre-i=
no64=C2=A0systems, there were no system calls like that. Now that we have t=
hem, I think</div><div>you are right that we&#39;d be better off just using=
 the system call directly rather than needing this hack</div><div>to get th=
e old system calls. the old symbols will be around forever, but it&#39;s be=
tter to be more direct here.</div><div>There&#39;s nothing hidden in the li=
bc versions of these symbols.</div><div><br></div><div>tl;dr: It&#39;s alwa=
ys defined now, so I&#39;ll unifdef it.</div><div><br></div><div>Warner</di=
v></div></div>

--000000000000395d0e05e1e7006f--

