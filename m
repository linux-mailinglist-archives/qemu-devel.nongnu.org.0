Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D5320DA9
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:41:32 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvXl-0007sr-5Q
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lDvWc-00079U-9J; Sun, 21 Feb 2021 15:40:18 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:41315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lDvWZ-0007T9-QV; Sun, 21 Feb 2021 15:40:18 -0500
Received: by mail-io1-xd2b.google.com with SMTP id e133so11146811iof.8;
 Sun, 21 Feb 2021 12:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l0FUBik8MO7SDKDsE4xl2I8btwbve4nOtcFD4Rn1Wl8=;
 b=FIfGR80YanTkpTfM0ppzrBlUlMP3oHcurawjloJYbW00wXI+RFoDdQrAVV5jxTwm2f
 DKYfl3eBmNq3uq4a9ycCAxDC/1cyGw5LQcZP2bi03E89wapb2f4DkZw2Uis2sR0mB0yN
 W/gXSZ50VTYv9uryZlkX/SlT0tajcH7jOs7aGNVcYPaIE/3TLXBv/K6ATU1lYjq0sAYx
 A9HPAo4x8x45f4+2VY9VOB7HXHokJJSTX/rQqKPIz23Mx49gcwwFqPNZ/Ed3x3w3076J
 I6cyAh3L5u8qLjwZKZQ43kArzmRdZA0F0bYSSWvJnr/Xg1SsoBV2dRyj93v7spxZftfC
 1UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0FUBik8MO7SDKDsE4xl2I8btwbve4nOtcFD4Rn1Wl8=;
 b=rHMDX/xtP5pW2t0AVHCYn80x92m2sw//d+jvkL2yrzoKbKm3tYk+AlsmYo3A7L6C/U
 1kZcKmnqfQDevoX8u4VXT/sIMsGIdSnuWrRjWkbD2PmjEvWvYr90R+Q9X7Y2ZJoQ3GIJ
 CXS7GeWmr9l3zc4bqmfykbJCH49/9ysk8oXC1Mao/RyMKWA2BTuWQ4cgEP0wguVbEVOB
 X6NQ0pbyQnf4nXzRphwouti8dzeFzrBmnce0YlvuZQRdUC4kKNobPnywq6zqeNOXJ106
 Wuk6nr9p9XDLGruBYSKa+RV6+hBR5gktMWNrELC6BcEpwIsWTmWQcexSU83J+MqjJ7jt
 vn2g==
X-Gm-Message-State: AOAM532GTwZlziP03/DUnt+XbpGNXssw/aZUcmgbvkiA98tfuRyUUs9m
 vxm/J085G33OkEEWzrRJyXA+gvbNCG2O9eR9Nck=
X-Google-Smtp-Source: ABdhPJyzG0J8fX1kVM7TFqXthA/pwKWawWyu4YuZsBe+SGsz3PTMNz9bArvSb7wVmyNfZuvZGYmvp7RD0lgYPHEISM4=
X-Received: by 2002:a05:6638:3491:: with SMTP id
 t17mr19160041jal.81.1613940013874; 
 Sun, 21 Feb 2021 12:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
 <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
 <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
In-Reply-To: <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 21 Feb 2021 21:40:02 +0100
Message-ID: <CAPan3WqvNYh3+=1b3juzNg7r8nAJ4yhAeqqdhsJvMf8GC1ke5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003745c105bbdeb1d4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Pavel.Dovgaluk@ispras.ru, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003745c105bbdeb1d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 7:24 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Niek,
>
> On 2/17/21 9:57 PM, Niek Linnenbank wrote:
> > Hi Daniel, Philippe,
> >
> > Op di 16 feb. 2021 10:49 schreef Daniel P. Berrang=C3=A9 <berrange@redh=
at.com
> > <mailto:berrange@redhat.com>>:
> >
> >     On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe Mathieu-Daud=C3=
=A9
> wrote:
> >     > Hi Niek and QEMU community,
> >     >
> >     > On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> >     > > The following are maintenance patches for the Allwinner H3. The
> >     first patch
> >     > > is a proposal to relocate the binary artifacts of the acceptanc=
e
> >     tests away
> >     > > from the apt.armbian.com <http://apt.armbian.com> domain. In th=
e
> >     past we had problems with artifacts being
> >     > > removed, and now the recently added Armbian 20.08.1 image has
> >     been removed as well:
> >     > >
> >     > > $ wget
> >
> https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bion=
ic_current_5.8.5.img.xz
> >     <
> https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bion=
ic_current_5.8.5.img.xz
> >
> >     > > Connecting to dl.armbian.com <http://dl.armbian.com>
> >     (dl.armbian.com <http://dl.armbian.com>)|2605:7900:20::5|:443...
> >     connected.
> >     > > ...
> >     > > HTTP request sent, awaiting response... 404 Not Found
> >     > > 2021-02-11 22:34:45 ERROR 404: Not Found.
> >     > >
> >     > > I've now added the artifacts to a server maintained by me. The
> >     machine has a stable
> >     > > uptime of several years, ~100Mbit bandwidth and plenty of
> >     available storage.
> >     > > Also for other artifacts if needed. I'm open to discuss if ther=
e
> >     is a proposal
> >     > > for a better location for these artifacts or a more generic qem=
u
> >     location.
> >     >
> >     > Thanks for trying to fix this long standing problem.
> >     >
> >     > While this works in your case, this doesn't scale to the communit=
y,
> >     > as not all contributors have access to such hardware and bandwidt=
h
> /
> >     > storage.
> >     >
> >     > While your first patch is useful in showing where the artifacts a=
re
> >     > stored doesn't matter - as long as we use cryptographic hashes - =
I
> >     > think it is a step in the wrong direction, so I am not keen on
> >     > accepting it.
> >     >
> >     > My personal view is that any contributor should have the same
> >     > possibilities to add tests to the project. Now I am also open to
> >     > discuss with the others :) I might be proven wrong, and it could
> >     > be better to rely on good willing contributors rather than having
> >     > nothing useful at all.
> >
> >     There aren't many options here
> >
> >      1. Rely on a vendor to provide stable download URLs for images
> >
> >      2. QEMU host all images we use in testing
> >
> >      3. Contributor finds some site to upload images to
> >
> >
> >     For the armbian images we rely on (1), but the URLs didn't turn out
> >     to be
> >     stable. In fact no OS vendor seems to have guaranteed stable URLs
> >     forever,
> >     regardless of distro, though most eventually do have an archive sit=
e
> >     that
> >     has good life. Armbian was an exception in this respect IIUC.
> >
> >     (2) would solve the long term stability problem as QEMU would be in
> full
> >     control, and could open it up for any images we need. The big
> challenge
> >     there is that QEMU now owns the license compliance problem. Merely
> >     uploading
> >     binary images/packages without the corresponding source is generall=
y
> >     a license
> >     violation. QEMU could provide hosting, but we need to be clear abou=
t
> >     the fact
> >     that we now own the license compliance problem ourselves. Many site=
s
> >     hosting
> >     images simply ignore this problem, but that doesn't make it right.
> >
> >
> >     This series is proposing (3), with a site the contributor happens t=
o
> >     control
> >     themselves, but using a free 3rd party hosting site is no different
> >     really.
> >     Again there is a the same need for license compliance, but it is no=
w
> the
> >     responsibility of the user, not QEMU project.
> >
> >     In this http://www.freenos.org/pub/qemu/cubieboard/
> >     <http://www.freenos.org/pub/qemu/cubieboard/> site I can't even see
> a
> >     directory listing, so even if corresponding source does exist in
> >     this server,
> >     I can't find it.
> >
> >     The isn't really a problem for QEMU CI to consume the images, but a=
s
> >     a free
> >     software developer I don't like encouraging practices that are not
> >     compliant
> >     with licensing reuqirement.
> >
> >     It is an open question whether the (3) is really better than (1) in
> >     terms
> >     of URL stability long term, especially if running off a user's
> personal
> >     server.
> >
> >
> > I understand your concerns. My goal here was to be able to re-activate
> > the orangepi tests, so we can capture bugs early on.
>
> I hope you understand the concern I have is not with you in particular,
> and I used your case to start a discussion with the QEMU community.
>

Hi Philippe,

Yeah I understand. I agree as well we should try to find a long-term
general solution.


>
> FWIW I missed the URL change because I still have the image cached in
> Avocado so my testing ran fine. Which makes me wonder...
>
> Cleber, Willian, should Avocado display information about cached
> artifacts? Such "Using artifact downloaded 7 months ago".
>
> > So what I can do
> > instead is:
> >
> >   - update the patch to use github to store the artifacts, and their
> > licenses (other tests also use github)
>
> Until there is better solutions, this is the option I prefer.
>

Allright, I'll prepare a reworked patch soon that uses github and re-send
it.

Kind regards,
Niek


>
> >   - or change the patch to use updated armbian links that work (for now=
)
> >
> > If we can agree on either of these solutions, so the orangepi tests can
> > be re-activated, that would be great.
> >
> > Kind regards,
> > Niek
>
>

--=20
Niek Linnenbank

--0000000000003745c105bbdeb1d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 7:24 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Niek,<br>
<br>
On 2/17/21 9:57 PM, Niek Linnenbank wrote:<br>
&gt; Hi Daniel, Philippe,<br>
&gt; <br>
&gt; Op di 16 feb. 2021 10:49 schreef Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a><b=
r>
&gt; &lt;mailto:<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">be=
rrange@redhat.com</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe =
Mathieu-Daud=C3=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Niek and QEMU community,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 2/11/21 11:00 PM, Niek Linnenbank wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; The following are maintenance patches for=
 the Allwinner H3. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0first patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; is a proposal to relocate the binary arti=
facts of the acceptance<br>
&gt;=C2=A0 =C2=A0 =C2=A0tests away<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; from the <a href=3D"http://apt.armbian.co=
m" rel=3D"noreferrer" target=3D"_blank">apt.armbian.com</a> &lt;<a href=3D"=
http://apt.armbian.com" rel=3D"noreferrer" target=3D"_blank">http://apt.arm=
bian.com</a>&gt; domain. In the<br>
&gt;=C2=A0 =C2=A0 =C2=A0past we had problems with artifacts being<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; removed, and now the recently added Armbi=
an 20.08.1 image has<br>
&gt;=C2=A0 =C2=A0 =C2=A0been removed as well:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; $ wget<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://dl.armbian.com/orangepipc/archiv=
e/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz" rel=3D"noreferrer=
" target=3D"_blank">https://dl.armbian.com/orangepipc/archive/Armbian_20.08=
.1_Orangepipc_bionic_current_5.8.5.img.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://dl.armbian.com/orangepipc/ar=
chive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz" rel=3D"norefe=
rrer" target=3D"_blank">https://dl.armbian.com/orangepipc/archive/Armbian_2=
0.08.1_Orangepipc_bionic_current_5.8.5.img.xz</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Connecting to <a href=3D"http://dl.armbia=
n.com" rel=3D"noreferrer" target=3D"_blank">dl.armbian.com</a> &lt;<a href=
=3D"http://dl.armbian.com" rel=3D"noreferrer" target=3D"_blank">http://dl.a=
rmbian.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"http://dl.armbian.com" rel=3D"noreferre=
r" target=3D"_blank">dl.armbian.com</a> &lt;<a href=3D"http://dl.armbian.co=
m" rel=3D"noreferrer" target=3D"_blank">http://dl.armbian.com</a>&gt;)|2605=
:7900:20::5|:443...<br>
&gt;=C2=A0 =C2=A0 =C2=A0connected.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; HTTP request sent, awaiting response... 4=
04 Not Found<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; 2021-02-11 22:34:45 ERROR 404: Not Found.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; I&#39;ve now added the artifacts to a ser=
ver maintained by me. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine has a stable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; uptime of several years, ~100Mbit bandwid=
th and plenty of<br>
&gt;=C2=A0 =C2=A0 =C2=A0available storage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Also for other artifacts if needed. I&#39=
;m open to discuss if there<br>
&gt;=C2=A0 =C2=A0 =C2=A0is a proposal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; for a better location for these artifacts=
 or a more generic qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0location.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks for trying to fix this long standing pr=
oblem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; While this works in your case, this doesn&#39;=
t scale to the community,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; as not all contributors have access to such ha=
rdware and bandwidth /<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; storage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; While your first patch is useful in showing wh=
ere the artifacts are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; stored doesn&#39;t matter - as long as we use =
cryptographic hashes - I<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; think it is a step in the wrong direction, so =
I am not keen on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; accepting it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; My personal view is that any contributor shoul=
d have the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; possibilities to add tests to the project. Now=
 I am also open to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; discuss with the others :) I might be proven w=
rong, and it could<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; be better to rely on good willing contributors=
 rather than having<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; nothing useful at all.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0There aren&#39;t many options here<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01. Rely on a vendor to provide stable downloa=
d URLs for images<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A02. QEMU host all images we use in testing<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03. Contributor finds some site to upload imag=
es to<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For the armbian images we rely on (1), but the URLs=
 didn&#39;t turn out<br>
&gt;=C2=A0 =C2=A0 =C2=A0to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0stable. In fact no OS vendor seems to have guarante=
ed stable URLs<br>
&gt;=C2=A0 =C2=A0 =C2=A0forever,<br>
&gt;=C2=A0 =C2=A0 =C2=A0regardless of distro, though most eventually do hav=
e an archive site<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0has good life. Armbian was an exception in this res=
pect IIUC.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0(2) would solve the long term stability problem as =
QEMU would be in full<br>
&gt;=C2=A0 =C2=A0 =C2=A0control, and could open it up for any images we nee=
d. The big challenge<br>
&gt;=C2=A0 =C2=A0 =C2=A0there is that QEMU now owns the license compliance =
problem. Merely<br>
&gt;=C2=A0 =C2=A0 =C2=A0uploading<br>
&gt;=C2=A0 =C2=A0 =C2=A0binary images/packages without the corresponding so=
urce is generally<br>
&gt;=C2=A0 =C2=A0 =C2=A0a license<br>
&gt;=C2=A0 =C2=A0 =C2=A0violation. QEMU could provide hosting, but we need =
to be clear about<br>
&gt;=C2=A0 =C2=A0 =C2=A0the fact<br>
&gt;=C2=A0 =C2=A0 =C2=A0that we now own the license compliance problem ours=
elves. Many sites<br>
&gt;=C2=A0 =C2=A0 =C2=A0hosting<br>
&gt;=C2=A0 =C2=A0 =C2=A0images simply ignore this problem, but that doesn&#=
39;t make it right.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This series is proposing (3), with a site the contr=
ibutor happens to<br>
&gt;=C2=A0 =C2=A0 =C2=A0control<br>
&gt;=C2=A0 =C2=A0 =C2=A0themselves, but using a free 3rd party hosting site=
 is no different<br>
&gt;=C2=A0 =C2=A0 =C2=A0really.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Again there is a the same need for license complian=
ce, but it is now the<br>
&gt;=C2=A0 =C2=A0 =C2=A0responsibility of the user, not QEMU project.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In this <a href=3D"http://www.freenos.org/pub/qemu/=
cubieboard/" rel=3D"noreferrer" target=3D"_blank">http://www.freenos.org/pu=
b/qemu/cubieboard/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://www.freenos.org/pub/qemu/cubi=
eboard/" rel=3D"noreferrer" target=3D"_blank">http://www.freenos.org/pub/qe=
mu/cubieboard/</a>&gt; site I can&#39;t even see a<br>
&gt;=C2=A0 =C2=A0 =C2=A0directory listing, so even if corresponding source =
does exist in<br>
&gt;=C2=A0 =C2=A0 =C2=A0this server,<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can&#39;t find it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The isn&#39;t really a problem for QEMU CI to consu=
me the images, but as<br>
&gt;=C2=A0 =C2=A0 =C2=A0a free<br>
&gt;=C2=A0 =C2=A0 =C2=A0software developer I don&#39;t like encouraging pra=
ctices that are not<br>
&gt;=C2=A0 =C2=A0 =C2=A0compliant<br>
&gt;=C2=A0 =C2=A0 =C2=A0with licensing reuqirement.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It is an open question whether the (3) is really be=
tter than (1) in<br>
&gt;=C2=A0 =C2=A0 =C2=A0terms<br>
&gt;=C2=A0 =C2=A0 =C2=A0of URL stability long term, especially if running o=
ff a user&#39;s personal<br>
&gt;=C2=A0 =C2=A0 =C2=A0server.<br>
&gt; <br>
&gt; <br>
&gt; I understand your concerns. My goal here was to be able to re-activate=
<br>
&gt; the orangepi tests, so we can capture bugs early on.<br>
<br>
I hope you understand the concern I have is not with you in particular,<br>
and I used your case to start a discussion with the QEMU community.<br></bl=
ockquote><div><br></div><div>Hi Philippe,</div><div><br></div><div>Yeah I u=
nderstand. I agree as well we should try to find a long-term general soluti=
on.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
FWIW I missed the URL change because I still have the image cached in<br>
Avocado so my testing ran fine. Which makes me wonder...<br>
<br>
Cleber, Willian, should Avocado display information about cached<br>
artifacts? Such &quot;Using artifact downloaded 7 months ago&quot;.<br>
<br>
&gt; So what I can do<br>
&gt; instead is:<br>
&gt; <br>
&gt; =C2=A0 - update the patch to use github to store the artifacts, and th=
eir<br>
&gt; licenses (other tests also use github)<br>
<br>
Until there is better solutions, this is the option I prefer.<br></blockquo=
te><div><br></div><div>Allright, I&#39;ll prepare a reworked patch soon tha=
t uses github and re-send it.</div><div><br></div><div>Kind regards,</div><=
div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; =C2=A0 - or change the patch to use updated armbian links that work (f=
or now)<br>
&gt; <br>
&gt; If we can agree on either of these solutions, so the orangepi tests ca=
n<br>
&gt; be re-activated, that would be great.=C2=A0<br>
&gt; <br>
&gt; Kind regards,<br>
&gt; Niek<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000003745c105bbdeb1d4--

