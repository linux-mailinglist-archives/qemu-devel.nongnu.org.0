Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097F369C1D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:39:55 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3Wk-00049w-0q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la3VQ-0003cv-Lo
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:38:32 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1la3VM-0001ML-9c
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:38:31 -0400
Received: by mail-qt1-x836.google.com with SMTP id y12so37482507qtx.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=navJrR31B3USMt5OXJyPHwLb+P9H4lygthDWw32FQhA=;
 b=EmCy2LQ5qXQlbNsDF5O6SxetSwHHgzxeUG0xpIebjjoaPjjNbg7JeNsV/uS0nWraUk
 mHT/d7Qkf4gdSxNNbbHNOiSUEsaIegvjANgOyZaU/pF5fr5X8esfMkl8TI1cPp5NrbTv
 LtR4gFqdpZfIWYMQswyQrGRaaUGBISG8JaBQnoBBzdBwbe7ArT+v7O7BvNO6mOAj63vn
 p+nlp7+Oi5GYfsQly3sWMEaol5yrwRWY/bdojVeQVu0KnsgdVd7EfbrlGRnwpqoVwaci
 az8NTty2Go257i+UHebzRYCkpMtsDOlLE3P59ZVPhsW9Am5e2Pe9Sk0+faNoddLMvZkI
 nM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=navJrR31B3USMt5OXJyPHwLb+P9H4lygthDWw32FQhA=;
 b=sjm3k9xH9R7EopTlH6jbLaNakr0OCOaTRDfAHNI0e3jUfVSYIidE0kvt3MI6zW7Chz
 8WeZPE9AEpBDL7toH52j5WGUSywhzgPOh04qGSP6aOV2fwiOBK5IcYAhrKPyp0kTLM23
 ixup04pZloGycEiL05ZfErW06+MODFYFnj4AKCvt6FMYcpjaPBfAa0LjLUD94CA90Kf1
 JC1oY1TGbyZpQgeoLfI5ow6rbSF2H6717cE/UtbVxeZywBqZY629/dpTeztI+N0a+pKo
 U0IaftLZHSDTH/PJGFIHh+Z2lWDOO+yZkfRtivs5ScFRgXvWI0K1/BmJ2jP03XHbD3Ob
 xqCw==
X-Gm-Message-State: AOAM5335ya+KrbV2qtaMkvxyOXmWTF7XgiD/LFpu3WuZbP2zCeOAIa/k
 PAP9u0VDoinE16mlc5SBqqUWAcKTTVthjWvKlI9pMw==
X-Google-Smtp-Source: ABdhPJxpoQpAR4kTlCrsI7QYe5nMA1dPmz3P0oj0qnJqr2whyaReLeyEd9e3Yy3UdTGB6pfH8/X/unhlHHwrE8RcRXw=
X-Received: by 2002:ac8:7e95:: with SMTP id w21mr5835103qtj.244.1619213906852; 
 Fri, 23 Apr 2021 14:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-2-imp@bsdimp.com>
 <2e4fb308-07c3-c998-89b2-f49b69e90092@amsat.org>
In-Reply-To: <2e4fb308-07c3-c998-89b2-f49b69e90092@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 23 Apr 2021 15:38:15 -0600
Message-ID: <CANCZdfr5z4hASiHWqxJG4A+6V_TTEo6ETanHGNkpm9q_fX3SVg@mail.gmail.com>
Subject: Re: [PULL 11/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000bbd9ff05c0aa9def"
Received-SPF: none client-ip=2607:f8b0:4864:20::836;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x836.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbd9ff05c0aa9def
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 3:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 4/23/21 10:39 PM, imp@bsdimp.com wrote:
> > From: Warner Losh <imp@bsdimp.com>
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/elfload.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> > index 87154283ef..07a00ddbd5 100644
> > --- a/bsd-user/elfload.c
> > +++ b/bsd-user/elfload.c
> > @@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm *bprm,
> struct target_pt_regs *regs,
> >                ibcs2_interpreter =3D 1;
> >              }
> >
> > -#if 0
> > +#ifdef notyet
>
> Better describe in the cover letter "ignored checkpatch errors" and keep
> this unmodified rather than trying to bypass them by dubious code style
> IMO. The checkpatch.pl script is here to help us ;)
>

This one I honestly was unsure about. To be honest, it's fear that kept
me keeping this code....  Maybe it would be even better to just delete
this code entirely. I have a working final state to pull from, now that I
think about it to forumlate a reply, so maybe that would be even
better?

Warner


> >              printf("Using ELF interpreter %s\n", path(elf_interpreter)=
);
> >  #endif
>

--000000000000bbd9ff05c0aa9def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 3:23 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 4/23/21 10:39 PM, <a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">=
imp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/elfload.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
&gt; index 87154283ef..07a00ddbd5 100644<br>
&gt; --- a/bsd-user/elfload.c<br>
&gt; +++ b/bsd-user/elfload.c<br>
&gt; @@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm *bprm, s=
truct target_pt_regs *regs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibcs2_interpret=
er =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -#if 0<br>
&gt; +#ifdef notyet<br>
<br>
Better describe in the cover letter &quot;ignored checkpatch errors&quot; a=
nd keep<br>
this unmodified rather than trying to bypass them by dubious code style<br>
IMO. The <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bla=
nk">checkpatch.pl</a> script is here to help us ;)<br></blockquote><div><br=
></div><div>This one I honestly was unsure about. To be honest, it&#39;s fe=
ar that kept</div><div>me keeping this code....=C2=A0 Maybe it would be eve=
n better to just delete</div><div>this code entirely. I have a working fina=
l state to pull from, now that I</div><div>think about it to=C2=A0forumlate=
=C2=A0a reply, so maybe that would be even</div><div>better?</div><div><br>=
</div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Using ELF=
 interpreter %s\n&quot;, path(elf_interpreter));<br>
&gt;=C2=A0 #endif<br>
</blockquote></div></div>

--000000000000bbd9ff05c0aa9def--

