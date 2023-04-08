Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D036DBCC4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:30:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plEFd-0002JC-9P; Sat, 08 Apr 2023 15:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plEFU-0002Il-MV
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:29:20 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1plEFS-0007qS-EY
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:29:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id gb34so4183408ejc.12
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680982154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HBwZjoMef3VxK6BVfK8AV5+XcZanopEEzqB864jQj/k=;
 b=027qqZUGChhS9jiu8HcuYFDJuGtebvIDhsjhZoEbgcY5DgJKUL5rEVVavPJeaH7ayr
 eCMzWvlol0f3yxccp4Souq1LcaQbDnDjH5VL25zNbGQd82FLsyH/JbY/u7DqzRkZPtcK
 innUGgVBiaCub+OeYBEZDQrgAzNgELMtek0ghRPOF3y49j4KAaMw6ji43GrO6lMGBQOg
 Oon7w8dsp9OG/QyNybfG4yoWheZxTBwGVS9li77Bj13mRbUcZyA2h+AG8CaVtXFbQIok
 g5Q/nHGrJmW7cbLEdtz17beXvqLpZEPJ3jBLXKrxFyl0kRE79hroBoxmqHP8Uw8nNraB
 R7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680982154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBwZjoMef3VxK6BVfK8AV5+XcZanopEEzqB864jQj/k=;
 b=iL+kOlCCibQqEcv8riQEjhandbsDnFAhi2iShRJNq+bcn1yvACmvwPk2tJTd4X6YYN
 nO0l5btKty+Jm6RhFMBfKIygD2kj9GgOa952tfFK/Vp8KOR9AQPjMY2jKzHKuG+XNQld
 G27CEx4p0bGoViEq5TM8N2bslaCeeLgQL8P6bulLDn6d3cTy7HLj5hBFsZtGb6KlJP5C
 CMmsE4ZbeY/rW8/aKndDCHcD3RlqgDDtZvr5x05xezYsfcAiwY+iZ4kio2lcD7QCUQ+b
 Nya1ZlF1P9sfUWKiVFANHF6c2flLqMHznUzh9kTYo3EFMUabXfKe2En1zQ4lsT4OIzKr
 U5pg==
X-Gm-Message-State: AAQBX9ftOjQqcb4i64t4Wagt2JvOPwASm/c0hkEniH+wVENVOkoBsKKs
 51Z+TJT5pRcKZHdF4gDPgrmi8Jm/roROm2Shi+yfXw==
X-Google-Smtp-Source: AKy350aZKgTErbeqlYdC6cJhGumvHS7cOKP0oPuTeX90nLDJsAbSqkIs686+lsXwK01PTPU7TFHZKe7/fU4RmjZYxls=
X-Received: by 2002:a17:907:c208:b0:947:c623:2c84 with SMTP id
 ti8-20020a170907c20800b00947c6232c84mr1479498ejc.2.1680982154366; Sat, 08 Apr
 2023 12:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-3-imp@bsdimp.com>
 <c90d9be4-45bf-5aee-0765-369dbe75aaad@linaro.org>
In-Reply-To: <c90d9be4-45bf-5aee-0765-369dbe75aaad@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 8 Apr 2023 13:29:05 -0600
Message-ID: <CANCZdfrcbWnDw4DoGthQrQkro1MdDsau94BCO-BOEgKnzX4Arg@mail.gmail.com>
Subject: Re: [PATCH 02/16] bsd-user: Ifdef a few MAP_ constants for NetBSD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, reinoud@netbsd.org, riastradh@netbsd.org, 
 ryoon@netbsd.org, jrtc27@jrtc27.com, kevans@freebsd.org, 
 Brad Smith <brad@comstyle.com>
Content-Type: multipart/alternative; boundary="0000000000002f66de05f8d8286b"
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000002f66de05f8d8286b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 8, 2023 at 1:03=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/5/23 14:35, Warner Losh wrote:
> > MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Add back the
> > ifdefs that I removed in 36d5d891559f (but only these ifdefs, the
> > rest of the commit is not reverted).
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/mmap.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> > index d6c5a344c9b..f732a6f6f2b 100644
> > --- a/bsd-user/mmap.c
> > +++ b/bsd-user/mmap.c
> > @@ -416,27 +416,33 @@ abi_long target_mmap(abi_ulong start, abi_ulong
> len, int prot,
> >               qemu_log("MAP_ALIGNED(%u) ",
> >                        (flags & MAP_ALIGNMENT_MASK) >>
> MAP_ALIGNMENT_SHIFT);
> >           }
> > +#ifdef MAP_GUARD
> >           if (flags & MAP_GUARD) {
> >               qemu_log("MAP_GUARD ");
> >           }
> > +#endif
>
> Maybe better as
>
> #ifndef MAP_GUARD
> #define MAP_GUARD 0
> #endif
>
> etc, somewhere common, and let the compiler eliminate the always false
> conditions.
>

Interesting notion...  I can do that in syscall_defs.h. If that's the
pattern in qemu I'll
do it here.... but I've been burned in the past by warnings about always
true or always
false conditions...  It would be less invasive though...

Warner

--0000000000002f66de05f8d8286b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 8, 2023 at 1:03=E2=80=AFP=
M Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ric=
hard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 4/5/23 14:35, Warner Losh wrote:<br>
&gt; MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Add back the<br>
&gt; ifdefs that I removed in 36d5d891559f (but only these ifdefs, the<br>
&gt; rest of the commit is not reverted).<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
&gt; index d6c5a344c9b..f732a6f6f2b 100644<br>
&gt; --- a/bsd-user/mmap.c<br>
&gt; +++ b/bsd-user/mmap.c<br>
&gt; @@ -416,27 +416,33 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;M=
AP_ALIGNED(%u) &quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (flags &amp; MAP_ALIGNMENT_MASK) &gt;&gt; MAP_ALIGNMENT_SHIFT=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#ifdef MAP_GUARD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; MAP_GUARD) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;M=
AP_GUARD &quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#endif<br>
<br>
Maybe better as<br>
<br>
#ifndef MAP_GUARD<br>
#define MAP_GUARD 0<br>
#endif<br>
<br>
etc, somewhere common, and let the compiler eliminate the always false cond=
itions.<br></blockquote><div><br></div><div>Interesting notion...=C2=A0 I c=
an do that in syscall_defs.h. If that&#39;s the pattern in qemu I&#39;ll</d=
iv><div>do it here.... but I&#39;ve been burned in the past by warnings abo=
ut always true or always</div><div>false conditions...=C2=A0 It would be le=
ss invasive though...<br></div><div><br></div><div>Warner<br></div></div></=
div>

--0000000000002f66de05f8d8286b--

