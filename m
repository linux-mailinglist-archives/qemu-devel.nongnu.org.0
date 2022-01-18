Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7884930BF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:30:03 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9wzK-0007ks-Ci
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9wwp-0006D3-0S
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:27:27 -0500
Received: from [2a00:1450:4864:20::130] (port=46699
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9wwl-0003Iq-KN
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 17:27:26 -0500
Received: by mail-lf1-x130.google.com with SMTP id d3so1109569lfv.13
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ykq7TspZtsuhUKv0lYTbqqdYtdwWvgSCObgbbxzCFP8=;
 b=trHw6FxnRAYQHVdLV2JfiY+DKjxyubKfpYETd3bKSJPoCfUla2pqjHGeM1/skpjFEG
 9y72P+twBnn2Tj/Qe5guS4p2HVOOOSrrN+fxXEu0dHS1q7ZwbVEJxjnfVPGHaKcZmjEV
 sFAc6VH8Y+1sXmbM6aEdAH+1BtCOQm70M2W0xLhCeeY3JeGrLvfm8H0cs5St01xLfg4/
 UtSnZeD6CLr4HHLqOqTEwmVQJlN329jrjSuYvpfg9aeW8egpSipgKm8sKH0vVdm0hn0X
 6t+CTcfWE9zpfaNKZAJppvpctZveqoJqW58/JGSerEJZG1Avl+jlJWRNYWlsGyw0YCo9
 Ijzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ykq7TspZtsuhUKv0lYTbqqdYtdwWvgSCObgbbxzCFP8=;
 b=Bqd3GMQho5KUrqPC6qaZULDzXCYbzfvcmo7Qshc/11bcuXMbjODyrpAkBvYgBtbaqn
 rzLdeq659UqNIxGiWpEbZkls84MyNUxCkKSRbTMW+QiyrNtqjEtfhJzlNGVyMyZDSG4/
 BojVhB+fc4/jDxGUj7qGgnbvEIX/U/eP0EKtnEXs8ufzsKKl4geUOUxQFKm9MU4fbrs1
 Oy9tRfdQZTiNRIINnULv4BBrvAeFjMceinsV4yiSA23mwe0c+nGCyQI2dXjBPBAlngco
 +fypLBfmPXWWrqvj3NpibMCFwwJu5f2de0/bFuZKrzM1p/nYu1F5kff9OfXLncTSOCo0
 qe4A==
X-Gm-Message-State: AOAM531mjEMvQ+CllGPBSU7r0RT1zRdJr0Z3mdb/4NFnysBHGZ3gSSgj
 FfvL/H0oyUSjssVZoripg+3qFfbjUOmF/c2zua30AA==
X-Google-Smtp-Source: ABdhPJyJcplJfYT0sMPyi1+S0kQQdt9cZPOLVlcJERGeJ7NGKMdqunf5pMOTYE6081SQ3uZF9gukkLZSjiPblV3u9Es=
X-Received: by 2002:a05:6512:3328:: with SMTP id
 l8mr24013063lfe.222.1642544840710; 
 Tue, 18 Jan 2022 14:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-22-imp@bsdimp.com>
 <CAFEAcA9xbOCjc7ZLULuyWNYi5jHtS=N8_HWiob_gaAE+3vxZAA@mail.gmail.com>
 <CAFEAcA8bdDdn8-UOeGX_aHu1E1QuEasCK++x3qNrvRfg6MqCaw@mail.gmail.com>
 <CACNAnaF29EyoQSsGKQyXTC+9bYZaTra4DuunkbBC6jeDt4VAVw@mail.gmail.com>
In-Reply-To: <CACNAnaF29EyoQSsGKQyXTC+9bYZaTra4DuunkbBC6jeDt4VAVw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 18 Jan 2022 15:27:09 -0700
Message-ID: <CANCZdfqqPhD03Ly8o=3RVqKyh8i6kvgxQH7Ay+FJi=5MHS2hyQ@mail.gmail.com>
Subject: Re: [PATCH 21/30] bsd-user/signal.c: force_sig
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000c2450c05d5e2c5df"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=wlosh@bsdimp.com; helo=mail-lf1-x130.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2450c05d5e2c5df
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 4:04 PM Kyle Evans <kevans@freebsd.org> wrote:

> On Thu, Jan 13, 2022 at 2:53 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Thu, 13 Jan 2022 at 20:29, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > >
> > > On Sun, 9 Jan 2022 at 16:44, Warner Losh <imp@bsdimp.com> wrote:
> > > >
> > > > Force delivering a signal and generating a core file.
> >
> > > > +/* Abort execution with signal. */
> > > > +void QEMU_NORETURN force_sig(int target_sig)
> > >
> > > In linux-user we call this dump_core_and_abort(), which is
> > > a name that better describes what it's actually doing.
> > >
> > > (Today's linux-user's force_sig() does what the Linux kernel's
> > > function of that name does -- it's a wrapper around
> > > queue_signal() which delivers a signal to the guest with
> > > .si_code = SI_KERNEL , si_pid = si_uid = 0.
> > > Whether you want one of those or not depends on what BSD
> > > kernels do in that kind of "we have to kill this process"
> > > situation.)
> >
> > It looks like the FreeBSD kernel uses sigexit() as its equivalent
> > function to Linux's force_sig(), incidentally. Not sure if
> > you/we would prefer the bsd-user code to follow the naming that
> > FreeBSD's kernel uses or the naming linux-user takes from
> > the Linux kernel.
> >
>
> My $.02: let's go with linux-inherited linux-user names and drop in a
> comment with the FreeBSD name, if they're functionally similar enough
> (in general, not just for this specific case). My gut feeling is that
> it'll be more useful in the long run if we can more quickly identify
> parallels between the two, so changes affecting linux-user that may
> benefit bsd-user are more easily identified and exchanged (and
> vice-versa).
>

OK. I've updated the patches to do the renaming. There was  one bad call
to force_sig (do_sigreturn should just return EFAULT instead of generating
a core). I've also fixed the SIGILL on BSD as well. The rest all look like
they
should be renamed. None look like they were copied from linux-user and
should
be the linux version :).

Warner

--000000000000c2450c05d5e2c5df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 4:04 PM Kyle =
Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, J=
an 13, 2022 at 2:53 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 13 Jan 2022 at 20:29, Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, 9 Jan 2022 at 16:44, Warner Losh &lt;<a href=3D"mailto:im=
p@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Force delivering a signal and generating a core file.<br>
&gt;<br>
&gt; &gt; &gt; +/* Abort execution with signal. */<br>
&gt; &gt; &gt; +void QEMU_NORETURN force_sig(int target_sig)<br>
&gt; &gt;<br>
&gt; &gt; In linux-user we call this dump_core_and_abort(), which is<br>
&gt; &gt; a name that better describes what it&#39;s actually doing.<br>
&gt; &gt;<br>
&gt; &gt; (Today&#39;s linux-user&#39;s force_sig() does what the Linux ker=
nel&#39;s<br>
&gt; &gt; function of that name does -- it&#39;s a wrapper around<br>
&gt; &gt; queue_signal() which delivers a signal to the guest with<br>
&gt; &gt; .si_code =3D SI_KERNEL , si_pid =3D si_uid =3D 0.<br>
&gt; &gt; Whether you want one of those or not depends on what BSD<br>
&gt; &gt; kernels do in that kind of &quot;we have to kill this process&quo=
t;<br>
&gt; &gt; situation.)<br>
&gt;<br>
&gt; It looks like the FreeBSD kernel uses sigexit() as its equivalent<br>
&gt; function to Linux&#39;s force_sig(), incidentally. Not sure if<br>
&gt; you/we would prefer the bsd-user code to follow the naming that<br>
&gt; FreeBSD&#39;s kernel uses or the naming linux-user takes from<br>
&gt; the Linux kernel.<br>
&gt;<br>
<br>
My $.02: let&#39;s go with linux-inherited linux-user names and drop in a<b=
r>
comment with the FreeBSD name, if they&#39;re functionally similar enough<b=
r>
(in general, not just for this specific case). My gut feeling is that<br>
it&#39;ll be more useful in the long run if we can more quickly identify<br=
>
parallels between the two, so changes affecting linux-user that may<br>
benefit bsd-user are more easily identified and exchanged (and<br>
vice-versa).<br></blockquote><div><br></div><div>OK. I&#39;ve updated the p=
atches to do the renaming. There was=C2=A0 one bad call</div><div>to force_=
sig (do_sigreturn should just return EFAULT instead of generating</div><div=
>a core). I&#39;ve also fixed the SIGILL on BSD as well. The rest all look =
like they</div><div>should be renamed. None look like they were copied from=
 linux-user and should</div><div>be the linux version :).</div><div><br></d=
iv><div>Warner</div></div></div>

--000000000000c2450c05d5e2c5df--

