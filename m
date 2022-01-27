Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025449E839
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:59:47 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD87e-0001cB-1k
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6k7-0001zY-II
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:31:23 -0500
Received: from [2607:f8b0:4864:20::92c] (port=43907
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6jt-0005kw-AX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:31:14 -0500
Received: by mail-ua1-x92c.google.com with SMTP id 2so5364636uax.10
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChyTdruyX+giHFehtQsu7kTJuKplatFOqf5g8qB20r8=;
 b=QrqKEZMK5StH1k48BMdGYAuA45hSxEQE0xS3scRU92tupaNDcC3n3Ng2Z0yFOcKt78
 77ubbFja3lXcNPTRDp/kYPXvXssNcYT3Vkf1AvzVZE5WMO4gYjUkKA4mFi7sYDp/0pbk
 SIxii0gL0Cts1semlzix4IGgxt366jmg06ySWfE4XkXfgI0ykZOBlxi3Z8U5M2NPucWl
 m+HxjDObGzroeoW2sUBoErViCgm5qWxhiCoQ9vFCVGDGaqoRQ8b711BobJjG2pABPXJH
 vWDsQUUUREuJBLaNXzsZCL5tbhXdR4mx59iH1NYvgj2MoJXKbBGwZ2nz5gmwCNhYtoNe
 3VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChyTdruyX+giHFehtQsu7kTJuKplatFOqf5g8qB20r8=;
 b=VuRYilFlN74ofNEBE+1oPqxgUVUVE8R1XTxeLx0P/VReJEWp2jO4oL1Md5w/QXk4tu
 97gwvJsOkLehxupOnLVr6qUgFi3I+zIk26xdt+arscmN2lGkEUhjsHe6rkUGtQf4WoW2
 FPC4KOslXXaFE983JJnEkdci4hgUzI5NW3i+5APbBlpDPXe3/Y2WZtS9UDcbKCXrbMno
 hjCf1KF493d5+Jab8ZlWFZNrVct99SkuzMNieSdnQiwNS2Yka2/xoToR5adeUStTjtQQ
 jMgpR5pLxj9fGWXPAhk5mD2jZkflBGaUZNpeICyOhM5ra5StsEf0HzEPcZODbdaMaGCy
 tZ9w==
X-Gm-Message-State: AOAM531/Q+2EhXWOIgtGcxNB1zP94/4gyf4pzrYfFtyk6RjHU7h96fXO
 DY9OwkPWtVQCVp96CZOoFzKS33eWnjLgDBKq58GhZQ==
X-Google-Smtp-Source: ABdhPJzjBZKEy5jG7mxx4eJ+yAXa+f7BBEbBbEWUuevAdJbyBnN9wbCHyTNI9kMsoy8ZvzPtQVyzs5xh6/JQ4w3KGaY=
X-Received: by 2002:a05:6102:3a0f:: with SMTP id
 b15mr1785592vsu.13.1643297465527; 
 Thu, 27 Jan 2022 07:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-32-imp@bsdimp.com>
 <04bd7a8b-78b7-c437-f67d-25a13cbcec88@linaro.org>
In-Reply-To: <04bd7a8b-78b7-c437-f67d-25a13cbcec88@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Jan 2022 08:30:54 -0700
Message-ID: <CANCZdfq-gQfnBwyCH7U_mXFgQfCFn-sWgX_4aBi2L8teTfmphg@mail.gmail.com>
Subject: Re: [PATCH v2 31/40] bsd-user/signal.c: setup_frame
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b183bc05d6920134"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b183bc05d6920134
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 12:47 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/25/22 12:29, Warner Losh wrote:
> > setup_frame sets up a signalled stack frame. Associated routines to
> > extract the pointer to the stack frame and to support alternate stacks.
> >
> > Signed-off-by: Stacey Son<sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans<kevans@freebsd.org>
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/main.c   |  5 +++
> >   bsd-user/qemu.h   |  3 +-
> >   bsd-user/signal.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 89 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> > +#if defined(TARGET_ARM)
> > +    return (sp - frame_size) & ~7;
> > +#elif defined(TARGET_AARCH64)
> > +    return (sp - frame_size) & ~15;
> > +#else
> > +    return sp - frame_size;
> > +#endif
>
> Just double-checking that this is still in the cleanup queue.
> I would expect x86 to require 16 byte alignment as well, for sse


I'll add

/* TODO: make this a target_arch function / define */

to make it clear that it's still on the list...  Thanks for the reminder.
There's
a lot on the list, alas...

 Warner


>
> r~
>

--000000000000b183bc05d6920134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 12:47 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/25/22 12:29, Warner Losh wrote:<br>
&gt; setup_frame sets up a signalled stack frame. Associated routines to<br=
>
&gt; extract the pointer to the stack frame and to support alternate stacks=
.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son&lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans&lt;<a href=3D"mailto:kevans@freebsd.org" tar=
get=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c=C2=A0 =C2=A0|=C2=A0 5 +++<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 82 +++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 89 insertions(+), 1 deletion(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
&gt; +#if defined(TARGET_ARM)<br>
&gt; +=C2=A0 =C2=A0 return (sp - frame_size) &amp; ~7;<br>
&gt; +#elif defined(TARGET_AARCH64)<br>
&gt; +=C2=A0 =C2=A0 return (sp - frame_size) &amp; ~15;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 return sp - frame_size;<br>
&gt; +#endif<br>
<br>
Just double-checking that this is still in the cleanup queue.<br>
I would expect x86 to require 16 byte alignment as well, for sse</blockquot=
e><div><br></div><div>I&#39;ll add</div><div><br></div><div>/* TODO: make t=
his a target_arch function / define */<br></div><div><br></div><div>to make=
 it clear that it&#39;s still on the list...=C2=A0 Thanks for the reminder.=
 There&#39;s</div><div>a lot on the list, alas...</div><div><br></div><div>=
=C2=A0Warner</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000b183bc05d6920134--

