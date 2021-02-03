Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E130E28F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:33:01 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MxY-0002AS-Om
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l7MYG-0003h9-NN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:06:54 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l7MYD-0002fa-Vi
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:06:52 -0500
Received: by mail-qk1-x72d.google.com with SMTP id x81so648581qkb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 10:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Srga0kM0wmnBWJA57DtgviklXyVl4bkLcNGl6ypYKFE=;
 b=jCZbkIEYb8Jpc6Y7Ax/5E+eO+CvhCj+ca95NMCbA888W4CDhzGV+9lEhcZwBfch87M
 FAP4oEE3og61c3tIbdekx60QEE2I0NK36fpJimH7B0uQFCG5BtOm2uXAA9o3NAaFCFN8
 /IcuJTxpKrMgI2jBWQK3nqIAdUbtGIp28cRFeT0iW5lJdcH+zalmhLCSLtiDrZK4iyk5
 dhceGG2YdMWbRJfirUePqZ7lhUYe360dwMP+cneRIEh0R8NyrQKvkP73W8adQdrThuXi
 XOYGVlaZOLGAl+k5olIu/wgofPqotibDfoQTB94KkqU/MP4RJeCq73+VVmZz6wubiGYF
 CzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Srga0kM0wmnBWJA57DtgviklXyVl4bkLcNGl6ypYKFE=;
 b=R1HXx/gCfJxl817JfQhRkuzgjj7N33+EXHWTwtMrK1JNIfOPthZ6H1zYW+h9Px9248
 6OtSnY2yUIJwoidsgww9OtHogRgd2M7gxJoTHoavKJI+E9a0o6IOgejKQWf8iTfyhUx1
 oJSyZFC1sD7W6wEplTpspmzB1sSrjjt1OaPnp2cgg4s6mdKPZecI4qMl6qnuKTvPSvXY
 WhNbjboEMFBpPrs1VWpNHehSBT2eG7zLvHSUs+anyetTD+fQhq3nP/otzNUKPdUo1LgZ
 /VsVhlus7xRkGq/veFJEGFakUpHuqUhQcR7ljG/Es2HgktqYA57bNcKDvL3GlWDX+sFW
 At1Q==
X-Gm-Message-State: AOAM533DGDeXwuKgoYd9vrqf0+BwfTCZK43nDtFszNbqaF+Psop/j2BA
 CkMiF6vpaESmdOmfWAsj/hRPc5fvMRreVp2VZnGvRQ==
X-Google-Smtp-Source: ABdhPJwr9BoJTnsX+lhDJvVMegfF5ceUtvukcgsEd/4jTbh2woZrI6Z0gZqUoXToavqMnwxnO08V//LCUyprNZDR5VA=
X-Received: by 2002:a37:a34f:: with SMTP id m76mr3693965qke.89.1612375608294; 
 Wed, 03 Feb 2021 10:06:48 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfp7VDodG_-Po6r9t+-4YNWOMVQUOeoL1hTm4-C989qa0A@mail.gmail.com>
 <27e6eb09-654a-2eae-4b6f-c02419a129b1@redhat.com>
In-Reply-To: <27e6eb09-654a-2eae-4b6f-c02419a129b1@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Feb 2021 11:06:37 -0700
Message-ID: <CANCZdfpgj6AA_N9fjMmxoUJhTMKtewofkcmb_R4G+npfsq2WrA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update bsd-user maintainers
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006094ae05ba72730e"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006094ae05ba72730e
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 11:30 PM Thomas Huth <thuth@redhat.com> wrote:

> On 30/01/2021 17.46, Warner Losh wrote:
> > bsd-user: Add new mainatiners
> >
> > The FreeBSD project has a number of enhancements to bsd-user. Add myself
> > as maintainer and Kyle Evans as a reviewer. Also add our github repo.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> > ---
> >   MAINTAINERS | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bcd88668bc..1b2c276eca 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2845,9 +2845,12 @@ F: thunk.c
> >   F: accel/tcg/user-exec*.c
> >
> >   BSD user
> > -S: Orphan
> > +M: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> > +R: Kyle Evans <kevans@freebsd.org <mailto:kevans@freebsd.org>>
> > +S: Maintained
> >   F: bsd-user/
> >   F: default-configs/*-bsd-user.mak
>
> Oh, by the way, while you're at it, please update the second F: line to:
>
>   F: default-configs/targets/*-bsd-user.mak
>
> Otherwise the scripts/get_maintainer.pl script won't recognize the files
> correctly.
>

Thanks! I notice that the linux-user entry is missing the targets/ part of
the patch as well..

Uploading new version soon...

Warner

--0000000000006094ae05ba72730e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 31, 2021 at 11:30 PM Thom=
as Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30/01/20=
21 17.46, Warner Losh wrote:<br>
&gt; bsd-user: Add new mainatiners<br>
&gt; <br>
&gt; The FreeBSD project has a number of enhancements to bsd-user. Add myse=
lf<br>
&gt; as maintainer and Kyle Evans as a reviewer. Also add our github repo.<=
br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mailto:imp@bsdimp.com=
" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS | 5 ++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index bcd88668bc..1b2c276eca 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -2845,9 +2845,12 @@ F: thunk.c<br>
&gt;=C2=A0 =C2=A0F: accel/tcg/user-exec*.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0BSD user<br>
&gt; -S: Orphan<br>
&gt; +M: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank=
">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mailto:imp@bsdimp.com" target=3D=
"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt; +R: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" target=3D"_bl=
ank">kevans@freebsd.org</a> &lt;mailto:<a href=3D"mailto:kevans@freebsd.org=
" target=3D"_blank">kevans@freebsd.org</a>&gt;&gt;<br>
&gt; +S: Maintained<br>
&gt;=C2=A0 =C2=A0F: bsd-user/<br>
&gt;=C2=A0 =C2=A0F: default-configs/*-bsd-user.mak<br>
<br>
Oh, by the way, while you&#39;re at it, please update the second F: line to=
:<br>
<br>
=C2=A0 F: default-configs/targets/*-bsd-user.mak<br>
<br>
Otherwise the scripts/<a href=3D"http://get_maintainer.pl" rel=3D"noreferre=
r" target=3D"_blank">get_maintainer.pl</a> script won&#39;t recognize the f=
iles <br>
correctly.<br></blockquote><div><br></div><div>Thanks! I notice that the li=
nux-user entry is missing the targets/ part of the patch as well..</div><di=
v><br></div><div>Uploading new version soon...</div><div><br></div><div>War=
ner</div><div>=C2=A0</div></div></div>

--0000000000006094ae05ba72730e--

