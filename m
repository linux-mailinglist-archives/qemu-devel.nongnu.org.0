Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC2423254
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 22:48:17 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXrMH-00024G-1i
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 16:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mXrKZ-0001GJ-DM
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:46:31 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mXrKT-0003HP-Je
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:46:30 -0400
Received: by mail-ua1-x92d.google.com with SMTP id e7so195129ual.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYYVKDXuZrM/U8a1W5D8H5iFRzvBFKAozwyC/3ICJsg=;
 b=wpABJ0Qr0S34/Ntd7cUXbByk1FysQAFsNAlhERwknriJdf7kTS5XOTWXpk6iaSToWX
 RA3hklpnx4PLd0ZuFMmW+HIj1c55nAuCWfKd0m1YbWV4TOCGTCcBNydTSjHWpoPLp1d3
 wYAzskcgKFKk3U+VGud/kHDz9k7FpwBEJfyOHF0HZEQ21g/F5+XwYXUF7JTO0z5GlnaJ
 zr6faHxdYhoD9M5lU5ph2/erfZ51YX1swshZXrAm8meuGWPBd8Ko5yvbqEhAxynqKzeg
 Yn4tOX85xUubiWbHu62jtN2D7swr1pg75qJRfTH2eJWwL+3qPVE1dmLNPpEU6q8voY8D
 3+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYYVKDXuZrM/U8a1W5D8H5iFRzvBFKAozwyC/3ICJsg=;
 b=AMfgjB0X7IreavMKAQX/fkD2MI8uwX9ivWgpcG0rsmQSpsVti/F4gEs2BFSlwKaZ8U
 Zxupd7rGLMLIdk26D08sl9pbOjSFzkkaOne6pFpAYdLVKvCqx1B1Y0cq3x4ut/KpqKBU
 5uz+aS07RhbsjNMHhXk69tTUJMDixtoV6p9c8pSil0P+iEkOe2bJWPRnBwxDaTi/xmUK
 0vCag8dL39aiQz8Hd3h9RK4bmVyr/YU6yfSt/FwW3b5F9s8ppoIMeCjuPTRx7cG170R8
 j6gPHh5xyofbeN+0o0mXeNqHkC3zoru4WQKPZOPsZFqgukad+hYq1u69kq8tr9s5Ce+e
 FNHg==
X-Gm-Message-State: AOAM533HCZiVWMgbMhZweiA+13MkpF4uoVwxMX8++LD7bqVcw2bOrYqD
 x3K8JNKU9xXJ6KV9VdQf6j/Crlj5xNnENnc58mBEUg==
X-Google-Smtp-Source: ABdhPJx7HhPVYr94/13IXit5UPkxPke9DNqKgZO282QR+OJeJBf8z38SXR9X5zUX2v6LEATsnph1MhrZuus1Lbslw6Q=
X-Received: by 2002:ab0:471d:: with SMTP id h29mr14578267uac.11.1633466783725; 
 Tue, 05 Oct 2021 13:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <YVGUX6FZlFBhhgwn@redhat.com>
 <a34e4f8a-36c5-4b87-52b0-f622a78b8d70@redhat.com>
 <f38b33f2-57ff-da66-9d91-679ab5a821f7@vivier.eu>
In-Reply-To: <f38b33f2-57ff-da66-9d91-679ab5a821f7@vivier.eu>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 5 Oct 2021 14:46:12 -0600
Message-ID: <CANCZdfqQMaaKQUP2+Kuq453bs5k6GvP3i1272uqwFhvyZHjf2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000658b3b05cda11f9f"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000658b3b05cda11f9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 2:41 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 05/10/2021 =C3=A0 21:26, Paolo Bonzini a =C3=A9crit :
> > On 27/09/21 11:52, Daniel P. Berrang=C3=A9 wrote:
> >>    bsd_user_ss.add(files('gdbstub.c'))
> >>    specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> >>
> >>
> >> So without this change, we're already correctly dropping bsd_user_ss
> >> in its entirity, when not on BSD.
> >>
> >> With this change, we're dropping some, but not all, of bsd_user_ss
> >> files - gdbstub.c remains.
> >>
> >> So this change on its own doesn't make a whole lot of sense.
> >
> > Agreed; that said, the gdbstub.c files added by
> >
> >   bsd_user_ss.add(files('gdbstub.c'))
> >   linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> >
> > are unnecessary because there is already
> >
> >   specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
> >
> > So, with those two instances of gdbstub.c removed, both patches are
> >
> >   Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
>
> I can take them if a v2 is sent updated accordingly...
>

I'd planned on rolling them into the bsd-user patch set that I'd been
working on
that is almost ready to go in (this is I think the only remaining issue
with the patch
train, though I need to double check threads). I'd planned on doing that
tomorrow,
but would be happy to coordinate with you since one of them does touch
linux-user.

Warner

--000000000000658b3b05cda11f9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 2:41 PM Lauren=
t Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 05/10=
/2021 =C3=A0 21:26, Paolo Bonzini a =C3=A9crit=C2=A0:<br>
&gt; On 27/09/21 11:52, Daniel P. Berrang=C3=A9 wrote:<br>
&gt;&gt; =C2=A0=C2=A0 bsd_user_ss.add(files(&#39;gdbstub.c&#39;))<br>
&gt;&gt; =C2=A0=C2=A0 specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, =
if_true: bsd_user_ss)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So without this change, we&#39;re already correctly dropping bsd_u=
ser_ss<br>
&gt;&gt; in its entirity, when not on BSD.<br>
&gt;&gt;<br>
&gt;&gt; With this change, we&#39;re dropping some, but not all, of bsd_use=
r_ss<br>
&gt;&gt; files - gdbstub.c remains.<br>
&gt;&gt;<br>
&gt;&gt; So this change on its own doesn&#39;t make a whole lot of sense.<b=
r>
&gt; <br>
&gt; Agreed; that said, the gdbstub.c files added by<br>
&gt; <br>
&gt; =C2=A0 bsd_user_ss.add(files(&#39;gdbstub.c&#39;))<br>
&gt; =C2=A0 linux_user_ss.add(files(&#39;gdbstub.c&#39;, &#39;thunk.c&#39;)=
)<br>
&gt; <br>
&gt; are unnecessary because there is already<br>
&gt; <br>
&gt; =C2=A0 specific_ss.add(files(&#39;cpu.c&#39;, &#39;disas.c&#39;, &#39;=
gdbstub.c&#39;), capstone)<br>
&gt; <br>
&gt; So, with those two instances of gdbstub.c removed, both patches are<br=
>
&gt; <br>
&gt; =C2=A0 Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.c=
om" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; <br>
<br>
I can take them if a v2 is sent updated accordingly...<br></blockquote><div=
><br></div><div>I&#39;d planned on rolling them into the bsd-user patch set=
 that I&#39;d been working on</div><div>that is almost ready to go in (this=
 is I think the only remaining issue with the patch</div><div>train, though=
 I need to double check threads). I&#39;d planned on doing that tomorrow,</=
div><div>but would be happy to coordinate with you since one of them does t=
ouch linux-user.</div><div><br></div><div>Warner<br></div></div></div>

--000000000000658b3b05cda11f9f--

