Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6434D7FE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 21:19:56 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQxQZ-0005LD-Cx
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 15:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ttr9droid@gmail.com>)
 id 1lQwuu-0001v3-SU
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:47:14 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ttr9droid@gmail.com>)
 id 1lQwus-0006IK-Ea
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:47:12 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 h3-20020a4ae8c30000b02901b68b39e2d3so3183994ooe.9
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 11:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ocqKDylW1ZNXFNbmp0rk66cJmvs5eErDPFuhhnmcwI=;
 b=d0zq4ywnBUnaGqRda3SNcvgHibeebslUVJ0IXRSZtdUhAZtqMEOFdxdh5uHeEYB5QF
 7V7lTgKpwzldEGrw8jwo/l6n97P5vnlM90qmalKVPegrRmMwcujiz5jfTnnSu4es6JE+
 iYkdzk8evVYnfRHGMwcsK6Vv5PGK/Mhswpg6KjrlroXe++Ur92lQxd5Os7rINLUAGKof
 x4LPCoxQPCaBHnLukcraN1B80oYXwGZZ37PvuH3XaB4IKOh2Ncv6I9wQu7Ojhkzf3o5E
 AiR6ayD+0ccc44rekBSE/aMgTEonQ+0TPSZ2Uc1vMdF3S//kWRQZc2m4s+nqSaBZ73E+
 owXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ocqKDylW1ZNXFNbmp0rk66cJmvs5eErDPFuhhnmcwI=;
 b=WrkrkK900oheWzrj37097ex7dv0mv5f8Ih1pSAAlS4AjmKkObrNFdWcFGHiysTWSQJ
 R+d41qTCC8LicbkS2iMLxJckwP66a5uhfczK2eK/APc7Z6wchwVcki9ph1f4CHF4thZb
 oQf4ENzGLMCEMIirYQpbjWL+KMWaQbknP5OJB7tgfwFL3gOPlKuHUGucexgtD+ZHtTci
 DTiZupWEufryfGoh+8dB2MSe+wjKXsZEIqjzyArsuptRsvwZCxkOG5zMqD2oNKIklgSr
 DKbd2XI/WlBb+X3c1at6ucdzFA7qdb0PCV9nikHkIocoIqqmzrOykr6M+ic6IS96YGWL
 6KWw==
X-Gm-Message-State: AOAM531TZ9JXfgyr4c/UbU4279iINvfI4TXaCpmMNf9BWl99GAACCZa9
 BdN3yQB9E1Srs47ozORpZAT28evidtEgbzLz9Nl6msGfbSJfQA==
X-Google-Smtp-Source: ABdhPJziZOZlCS036I60U840Y6K8xRc/0qc99dnwwLVNHc236c3g3mm8yMLA/v69hZSK7YW+SA+lq4g26hMOlugHpsM=
X-Received: by 2002:a4a:1ac3:: with SMTP id 186mr4176430oof.8.1617043627657;
 Mon, 29 Mar 2021 11:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
In-Reply-To: <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
From: John Simpson <ttr9droid@gmail.com>
Date: Mon, 29 Mar 2021 21:46:49 +0300
Message-ID: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
Subject: Re: An error due to installation that require binutils package
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000034cd405beb14f97"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=ttr9droid@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Mar 2021 15:18:10 -0400
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
Cc: "gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000034cd405beb14f97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Kindly ask you to have a look at this bug.
Thank you for your replies.

On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
wrote:

> John,
>
> Thanks for your report.  Can you post your bug report
> xen-devel@lists.xenproject.org ?
>
> The bug is in the compilation of QEMU, which is an external project; so
> it=E2=80=99s possible that we=E2=80=99ll end up having to raise this with=
 that community as
> well.
>
> Thanks,
>  -George Dunlap
>
> > On Mar 28, 2021, at 2:26 PM, John Simpson <ttr9droid@gmail.com> wrote:
> >
> > Hello,
> >
> > Just forwarding this message to you. Can you give some thoughs about
> this? Thanks a lot.
> >
> >
> > ---------- Forwarded message ---------
> > From: Alan Modra <amodra@gmail.com>
> > Date: Sun, Mar 28, 2021 at 2:21 PM
> > Subject: Re: An error due to installation that require binutils package=
.
> > To: John Simpson <ttr9droid@gmail.com>
> > Cc: <binutils@sourceware.org>
> >
> >
> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
> wrote:
> > >   BUILD   pc-bios/optionrom/kvmvapic.img
> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >
> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
> > option.  The fault lies with whatever passed -no-pie to ld.
> >
> > --
> > Alan Modra
> > Australia Development Lab, IBM
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: Andreas Schwab <schwab@linux-m68k.org>
> > Date: Sun, Mar 28, 2021 at 2:17 PM
> > Subject: Re: An error due to installation that require binutils package=
.
> > To: John Simpson via Binutils <binutils@sourceware.org>
> > Cc: John Simpson <ttr9droid@gmail.com>
> >
> >
> > Please report that to the xen project.  ld -no-pie doesn't have a usefu=
l
> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie" a=
s
> > the output file name.
> >
> > Andreas.
> >
> > --
> > Andreas Schwab, schwab@linux-m68k.org
> > GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA A=
EC1
> > "And now for something completely different."
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: John Simpson <ttr9droid@gmail.com>
> > Date: Sun, Mar 28, 2021 at 12:55 PM
> > Subject: An error due to installation that require binutils package.
> > To: <binutils@sourceware.org>
> >
> >
> > Hello,
> >
> > Recently I got a following error due to installation xen on
> 5.11.6-1-MANJARO kernel:
> >
> >   GEN     target/riscv/trace.c
> >   GEN     target/s390x/trace.c
> >   GEN     target/sparc/trace.c
> >   GEN     util/trace.c
> >   GEN     config-all-devices.mak
> > make[1]: Entering directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> > make[1]: Nothing to be done for 'all'.
> > make[1]: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> >   BUILD   pc-bios/optionrom/multiboot.img
> >   BUILD   pc-bios/optionrom/linuxboot.img
> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
> >   BUILD   pc-bios/optionrom/kvmvapic.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: multiboot.img] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
> >   BUILD   pc-bios/optionrom/pvh.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:50: pvh.img] Error 1
> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
> > make: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[2]: ***
> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
> subdirs-install] Error 2
> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[1]: *** [Makefile:72: install] Error 2
> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make: *** [Makefile:134: install-tools] Error 2
> > =3D=3D> ERROR: A failure occurred in build().
> >     Aborting...
> >
> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
> issue is related to this part of code:
> >
> > https://github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
> >
> > It seems to me that this could impact far more users than just me.
> >
>
>

--000000000000034cd405beb14f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Kind=
ly ask you to have a look at this bug. <br></div><div>Thank you for your re=
plies.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 29, 2021 at 7:07 PM George Dunlap &lt;<a href=
=3D"mailto:George.Dunlap@citrix.com">George.Dunlap@citrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John,<br>
<br>
Thanks for your report.=C2=A0 Can you post your bug report <a href=3D"mailt=
o:xen-devel@lists.xenproject.org" target=3D"_blank">xen-devel@lists.xenproj=
ect.org</a> ?<br>
<br>
The bug is in the compilation of QEMU, which is an external project; so it=
=E2=80=99s possible that we=E2=80=99ll end up having to raise this with tha=
t community as well.<br>
<br>
Thanks,<br>
=C2=A0-George Dunlap<br>
<br>
&gt; On Mar 28, 2021, at 2:26 PM, John Simpson &lt;<a href=3D"mailto:ttr9dr=
oid@gmail.com" target=3D"_blank">ttr9droid@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Just forwarding this message to you. Can you give some thoughs about t=
his? Thanks a lot.<br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com" target=3D"_bl=
ank">amodra@gmail.com</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 2:21 PM<br>
&gt; Subject: Re: An error due to installation that require binutils packag=
e.<br>
&gt; To: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=3D"=
_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; Cc: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"_blank">b=
inutils@sourceware.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils wr=
ote:<br>
&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic.img<br>
&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie=
 ?)<br>
&gt; <br>
&gt; -no-pie is a gcc option.=C2=A0 Neither -no-pie nor --no-pie is a valid=
 ld<br>
&gt; option.=C2=A0 The fault lies with whatever passed -no-pie to ld.<br>
&gt; <br>
&gt; -- <br>
&gt; Alan Modra<br>
&gt; Australia Development Lab, IBM<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Andreas Schwab &lt;<a href=3D"mailto:schwab@linux-m68k.org" targ=
et=3D"_blank">schwab@linux-m68k.org</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 2:17 PM<br>
&gt; Subject: Re: An error due to installation that require binutils packag=
e.<br>
&gt; To: John Simpson via Binutils &lt;<a href=3D"mailto:binutils@sourcewar=
e.org" target=3D"_blank">binutils@sourceware.org</a>&gt;<br>
&gt; Cc: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=3D"=
_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Please report that to the xen project.=C2=A0 ld -no-pie doesn&#39;t ha=
ve a useful<br>
&gt; meaning.=C2=A0 It used to mean the same as ld -n -o-pie, which sets &q=
uot;-pie&quot; as<br>
&gt; the output file name.<br>
&gt; <br>
&gt; Andreas.<br>
&gt; <br>
&gt; -- <br>
&gt; Andreas Schwab, <a href=3D"mailto:schwab@linux-m68k.org" target=3D"_bl=
ank">schwab@linux-m68k.org</a><br>
&gt; GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510=C2=A0 2552 DF73 E780 =
A9DA AEC1<br>
&gt; &quot;And now for something completely different.&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=
=3D"_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 12:55 PM<br>
&gt; Subject: An error due to installation that require binutils package.<b=
r>
&gt; To: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"_blank">b=
inutils@sourceware.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Recently I got a following error due to installation xen on 5.11.6-1-M=
ANJARO kernel:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/riscv/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/s390x/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/sparc/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0util/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0config-all-devices.mak<br>
&gt; make[1]: Entering directory &#39;/home/username/xen/src/xen-4.14.1/too=
ls/qemu-xen/slirp&#39;<br>
&gt; make[1]: Nothing to be done for &#39;all&#39;.<br>
&gt; make[1]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s/qemu-xen/slirp&#39;<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/multiboot.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot_dma.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic.img<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: multiboot.img] Error 1<br>
&gt; make[1]: *** Waiting for unfinished jobs....<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/pvh.img<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: linuxboot.img] Error 1<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: kvmvapic.img] Error 1<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:50: pvh.img] Error 1<br>
&gt; make: *** [Makefile:581: pc-bios/optionrom/all] Error 2<br>
&gt; make: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tools/q=
emu-xen-build&#39;<br>
&gt; make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2<br>
&gt; make[3]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make[2]: *** [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.m=
k:235: subdirs-install] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make[1]: *** [Makefile:72: install] Error 2<br>
&gt; make[1]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make: *** [Makefile:134: install-tools] Error 2<br>
&gt; =3D=3D&gt; ERROR: A failure occurred in build().<br>
&gt;=C2=A0 =C2=A0 =C2=A0Aborting...<br>
&gt; <br>
&gt; Currently I have fresh binutils 2.36.1-2 and it seems to me that the i=
ssue is related to this part of code:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/bminor/binutils-gdb/blob/master/ld/lexsu=
p.c#L451" rel=3D"noreferrer" target=3D"_blank">https://github.com/bminor/bi=
nutils-gdb/blob/master/ld/lexsup.c#L451</a><br>
&gt; <br>
&gt; It seems to me that this could impact far more users than just me.<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000034cd405beb14f97--

