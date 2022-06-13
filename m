Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B707E54A2E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 01:47:55 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0tmk-0008GO-9P
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 19:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o0tl6-0007X2-9g
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:46:12 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:45729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o0tl3-00068c-BT
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:46:12 -0400
Received: by mail-vs1-xe34.google.com with SMTP id q14so7378219vsr.12
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 16:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fUXTF865aF2MATWVJ+PoTLZ6yTdcUmUGLzESZ8w+B5c=;
 b=Zf4QWdNFtYlYcVgjO0QqMAvWNOMDe0RK/9uhoG9xka1S0j0ZYRqIFWT8kwcX1+0eHP
 jQ+Y1rPMJBY6p7XVevrdP9jC6ijxN9IWyA0yhGw8MkHMt4CLula1naP34w67t7txQRw1
 REOXDVFe3fWuBuVkCajN/lvhTeEEXar7Ws/gd+Vwc2qx09YdHAOZ4xdOjzM9zVXm2JiF
 lMiDLDjuJ/OZ0fva1eOZz5CvPnZbEe2FS49SqjXF98OSW5YsDjECVnnZHw3MVar06CEq
 tsmVz2Ck/Hjd3QbSiY0l4R7i0srhE4lTj57dQsQN0cbCmliK2WwUL8b9CwWy0BEpJa4P
 valA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fUXTF865aF2MATWVJ+PoTLZ6yTdcUmUGLzESZ8w+B5c=;
 b=7kXgz5Qf114Ewbx81iLwgkHtLFl4rs57yG5IIaY0oYry2z6WdfWH3pNp1sqV0S8V9u
 eqRlYPklSx8ckuwGaO7PA15ta5IFl/dE8QIqTBs6AVdIA2eMU0V214wlXYJEOaAPp7UM
 bAbibjXDffdSKBKsNlrn736g2bCfsgPtBHuzBYpCmSxrUx8VMULd/Y9UvnxRgFFFuQUP
 TZmWVSA3DRpg20/hrnzxPN5TaqMygYF5qqaL8Fu/Vok0jWWuocNcbRsBGEui6lbNF4/d
 Idt+jzZIi8ajEwlkivyQgxk+LjK+O5ZOXtNWtUtB4sPk8QuFcEQduBPTHaTDMF7pco6Y
 A/Ag==
X-Gm-Message-State: AJIora/zHhxYvGiXSEePNp0Nk+tKQEa1MnwCYPAiznYbDmk33UhrUOzB
 0hRcWC9PyMxEjNv0l09W2VjDGz+1HPmZ4RuaoXBovQ==
X-Google-Smtp-Source: AGRyM1udUohyTWab/Vsv8Ac5mI4twDp9vzUaQMhRoFsH08NPUn1f+3EFC4Em2VYtKQxumKDR774uitNSx6k5byRKPRo=
X-Received: by 2002:a67:7186:0:b0:34b:a3f6:c6fd with SMTP id
 m128-20020a677186000000b0034ba3f6c6fdmr831293vsc.53.1655163956459; Mon, 13
 Jun 2022 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-9-imp@bsdimp.com>
 <4fa22f2c-406f-25a8-4a13-f349512bff94@linaro.org>
In-Reply-To: <4fa22f2c-406f-25a8-4a13-f349512bff94@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 13 Jun 2022 17:45:45 -0600
Message-ID: <CANCZdfoLxoqPAMX+UZAvXS-6wwEeiJdFveBfJ-bOpTwwL6VDWA@mail.gmail.com>
Subject: Re: [PATCH 08/11] bsd-user: Implement rmdir and undocumented -_getcwd
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jessica Clarke <jrtc27@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Gleb Popov <arrowd@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 Stacey Son <sson@freebsd.org>, Jung-uk Kim <jkim@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000ab8d2b05e15ce3f3"
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

--000000000000ab8d2b05e15ce3f3
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 13, 2022 at 1:52 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/12/22 13:48, Warner Losh wrote:
> > Implemenet rmdir and __getcwd. Declare __getcwd as extern because
> > there's no installed FreeBSD header that has it. It's used internally by
> > libc, which doesn't provide an external declaration, but does export the
> > symbol.
>
> Typo in subject: s/-/_/.
>

Indeed.


> > @@ -55,6 +55,7 @@ extern struct iovec *lock_iovec(int type, abi_ulong
> target_addr, int count,
> >           int copy);
> >   extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int
> count,
> >           int copy);
> > +extern int __getcwd(char *path, size_t len);
>
> Do you really want to rely on this export?
> Unless it does something special, I'd just declare a local version of the
> syscall as you
> do with safe_*.
>

Indeed not. I was just copying what we've been running, but I see now that
was unwise.
I'll do a safe_syscall directly here since we don't need to call it
anywhere else. I'll do a
sanity check on our upstream and make sure I can still run my favorite
shells, which
I believe use this call.


> > +/* undocumented __getcwd(char *buf, size_t len)  system call */
>
> Surely the syscall itself is documented?
>

One would think it was documented, but there's no man page for it and the
getcwd()
call has some extensions that it implements, plus there's some weird
special cases
that __getcwd() can sometimes return that getcwd() knows how to unwind (the
oddest being that sometimes paths are returned backwards). All these quirks
are not,
alas, documented in any place except the code. Hence the characterization
that this
is undocumented :)... I was rather surprised by this when I went looking.

Warner

--000000000000ab8d2b05e15ce3f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 13, 2022 at 1:52 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 6/12/22 13:48, Warner Losh wrote:<br>
&gt; Implemenet rmdir and __getcwd. Declare __getcwd as extern because<br>
&gt; there&#39;s no installed FreeBSD header that has it. It&#39;s used int=
ernally by<br>
&gt; libc, which doesn&#39;t provide an external declaration, but does expo=
rt the<br>
&gt; symbol.<br>
<br>
Typo in subject: s/-/_/.<br></blockquote><div><br></div><div>Indeed.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; @@ -55,6 +55,7 @@ extern struct iovec *lock_iovec(int type, abi_ulong =
target_addr, int count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int copy);<br>
&gt;=C2=A0 =C2=A0extern void unlock_iovec(struct iovec *vec, abi_ulong targ=
et_addr, int count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int copy);<br>
&gt; +extern int __getcwd(char *path, size_t len);<br>
<br>
Do you really want to rely on this export?<br>
Unless it does something special, I&#39;d just declare a local version of t=
he syscall as you <br>
do with safe_*.<br></blockquote><div><br></div><div>Indeed not. I was just =
copying what we&#39;ve been running, but I see now that was unwise.</div><d=
iv>I&#39;ll do a safe_syscall directly here since we don&#39;t need to call=
 it anywhere else. I&#39;ll do a</div><div>sanity check on our upstream and=
 make sure I can still run my favorite shells, which</div><div>I believe us=
e this call.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +/* undocumented __getcwd(char *buf, size_t len)=C2=A0 system call */<=
br>
<br>
Surely the syscall itself is documented?<br></blockquote><div><br></div><di=
v>One would think it was documented, but there&#39;s no man page for it and=
 the getcwd()</div><div>call has some extensions that it implements, plus t=
here&#39;s some weird special cases</div><div>that __getcwd() can sometimes=
 return that getcwd() knows how to unwind (the</div><div>oddest being that =
sometimes paths are returned backwards). All these quirks are not,</div><di=
v>alas, documented in any place except the code. Hence the characterization=
 that this</div><div>is undocumented :)... I was rather surprised by this w=
hen I went looking.</div><div><br></div><div>Warner</div></div></div>

--000000000000ab8d2b05e15ce3f3--

