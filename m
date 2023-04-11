Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE56DE1D6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:04:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHPK-0002FT-Gs; Tue, 11 Apr 2023 13:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pmHPH-0002EY-QG
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:03:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pmHPF-0004h1-Ow
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:03:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id gb34so22309653ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681232623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aDxP4SuoZe2uk00af4jRQ2wPYT1KJNIEJ75F5wKysSo=;
 b=1/bE3zM6z2bCJvj87dFd9PDHcIRyGrUi3zkEDHx2yTdIb/rve37mgSR7owMv6wrMr0
 3tWYL6CqKwTL4/ZXuVZUN6vBJw3y8NeaRmG0uokK4CYaJPIYj0hqIwCvkQWrnDYJqesJ
 Pz+Lr0nZyyRIIuYg0o3MHvVkcIVQBucAIRDTCWsTf0OUsXKnA2Osf+hhBUAo+RH+CcN2
 2+V+Ea5Ycf5cIsT9eUkd1Ut2dNmtnPxh3Yn1txbFI3pbu4fz+DwVkqLYH+b3gjF7SEh+
 ygsDF6xpiXn5AFaEhFQixnhj0sucLVYv4Nikyf2Y6yQDjyrpwStz/Vah3R/zEWRUYo5z
 zoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681232623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aDxP4SuoZe2uk00af4jRQ2wPYT1KJNIEJ75F5wKysSo=;
 b=PdKbNj8g2wYtv7EpiMOR/ixdp5E2qXUhXoxfZ6Hd0B23LSmfYw9fh8KCqKhanGLNth
 1c+i8/4LHrlzxczITH4wYHcIPmgdryVlyIqi4DA2pxbzJjnja5tIz/GmmKL6iN8ypSEr
 qPGftx0ADcv2BAghVHpJqjrhFg26sd/naXX1DYvZ+jsxeYQC7fKm1CBHQCTlU7NmQasT
 pWyS8WQeouMHlYL+HyauarK2KdmHZr4RUo84wQe1MtXsVp0PFJ6QRI9JlXQuH0d2tZ0l
 J7Zq3YPjWI9Bqix0Nxo3lLRfw6b4KuDwVjEH/ijUS6iWCqBz6zpXeJVVPElCmrorXWai
 fljw==
X-Gm-Message-State: AAQBX9fDsf8mbbHoFoomdNXr6+g97sTF5VfdQavHDmZwJNeRLqW2TG1z
 UCNmKDGIh6i+fRLavHANk+AMk+Ihov65t7AlGjYpZA==
X-Google-Smtp-Source: AKy350YD/8dvZ4h1leDFWp8h243wRiPHsa6A1UbKy2ijvGx4ixBK6GHyIVPBikVAF/pQTdgeBtnJxY/YkfoyS3nyU8s=
X-Received: by 2002:a17:906:3617:b0:94e:4925:3c41 with SMTP id
 q23-20020a170906361700b0094e49253c41mr231987ejb.2.1681232623453; Tue, 11 Apr
 2023 10:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-19-imp@bsdimp.com>
 <29131a8f-f7e1-ece1-4dbb-f07d07b4f8c3@linaro.org>
In-Reply-To: <29131a8f-f7e1-ece1-4dbb-f07d07b4f8c3@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 11 Apr 2023 11:03:32 -0600
Message-ID: <CANCZdfqByML9wLc47ainsBgS5u8=v0vAkGizcQdJUAQRgoy93w@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] bsd-user: Update system call list
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, jrtc27@jrtc27.com, riastradh@netbsd.org, 
 Kyle Evans <kevans@freebsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, reinoud@netbsd.org
Content-Type: multipart/alternative; boundary="0000000000004e5b3d05f91279ab"
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x630.google.com
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

--0000000000004e5b3d05f91279ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 7:37=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/10/23 11:20, Warner Losh wrote:
> > Update the system call list. We have one hokey thing in here for swapof=
f
> > that depends on the version number (so this is not completely generated
> > at the moment). For this, we need to include sys/param.h. The method of
> > generation has changed, so this diff looks way bigger than it needs to
> > be to add the few lines of code for the new system calls.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/os-syscall.h |    2 +
> >   bsd-user/freebsd/syscall_nr.h | 1035 +++++++++++++++++---------------=
-
> >   2 files changed, 529 insertions(+), 508 deletions(-)
>
> What is the method of generation?
>
> If it's complicated, it should be in scripts/.
> If it's trivial, e.g.
>
>      sed 's/xxx/yyy/' < in.h > out.h
>
> it is worth including the command in the commit message.
>
> Anyway,
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

I'm dropping this chunk, and will just commit the bits to generate it each
build.
It's easier than trying to document what I've done to generate things. I've
sorted
out the __FreeBSD_version stuff that was in here in blitz fork, so why not?

Warner


> r~
>

--0000000000004e5b3d05f91279ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 10, 2023 at 7:37=E2=80=AF=
PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 4/10/23 11:20, Warner Losh wrote:<br>
&gt; Update the system call list. We have one hokey thing in here for swapo=
ff<br>
&gt; that depends on the version number (so this is not completely generate=
d<br>
&gt; at the moment). For this, we need to include sys/param.h. The method o=
f<br>
&gt; generation has changed, so this diff looks way bigger than it needs to=
<br>
&gt; be to add the few lines of code for the new system calls.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.h |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/syscall_nr.h | 1035 +++++++++++++++++----=
------------<br>
&gt;=C2=A0 =C2=A02 files changed, 529 insertions(+), 508 deletions(-)<br>
<br>
What is the method of generation?<br>
<br>
If it&#39;s complicated, it should be in scripts/.<br>
If it&#39;s trivial, e.g.<br>
<br>
=C2=A0 =C2=A0 =C2=A0sed &#39;s/xxx/yyy/&#39; &lt; in.h &gt; out.h<br>
<br>
it is worth including the command in the commit message.<br>
<br>
Anyway,<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquote=
><div><br></div><div>I&#39;m dropping this chunk, and will just commit the =
bits to generate it each build.</div><div>It&#39;s easier than trying to do=
cument what I&#39;ve done to generate things. I&#39;ve sorted</div><div>out=
 the __FreeBSD_version stuff that was in here in blitz fork, so why not?</d=
iv><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--0000000000004e5b3d05f91279ab--

