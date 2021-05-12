Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C643D37C759
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:07:44 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrOh-0005DQ-2j
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgrJW-0003wx-G1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:02:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgrJR-0001kr-Gr
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:02:22 -0400
Received: by mail-ej1-x631.google.com with SMTP id b25so35704348eju.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HaSnU5lco+xDqofHQOPkmuJjHDlKID4Hn6u6FJJ3AhE=;
 b=jK9xdWViTfOKgM7Ey4sfS+68biIKkP6BQfrZoQ/9gFqZN/t2s17x9r7WKeFB2BdDtP
 KOb+28OGU9zF6HBPUhXYNfJocYkqwerDJe9lrbfTQLTtFRILCTu4C1kiID360nAhzbrE
 xCa0qzeYsvQZxy5cayfT2mP2vmYOTl67QzAF0dERzjcVeVmJp14liCbEFQ8JVD2p6grF
 ExpaCBe2c2UBhXWmvHmbMp4iouEkx1lTXZ5Og56mohNjgx/XSqA/ZAaaN+hz1Mks7ry2
 LIgSFchSQsNEV8/IDoNyZdf3cGmnpEJ3DfbhkXq4puO/CU+jRG32crZTjpLOa0tgLS68
 xPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HaSnU5lco+xDqofHQOPkmuJjHDlKID4Hn6u6FJJ3AhE=;
 b=BlET/XaO9cZMrjNgGnfj9r8LFwuRgvez9zswbLIjJDsXUfPzS6tm9HqSR4dYRRGJL2
 xhOR8m4YFOmgmvHa3EkXsy/wiiAvJNp4rLV1+E1ipw6OnrqxlFql3z2NH9RRg23dgNSJ
 hmDWvdhE4oDlJzMXbRERO0EakLhicJMdycSy9RUPH6rowJGHqfCZ0s9U3I9g7DvMQ1es
 FX3GAWZ+jOwcsV6DbgoSFQIVXqphyJAtnaKInDOS0GREGylDzr12sICd1+ts0Z396Qfh
 kTcCPMHJnjlbBuEEGq5B6rpsI/Fy5w68ePxNeinHDmkTIrSVEy5/YsDMAcyEg+mPy+m8
 IiTQ==
X-Gm-Message-State: AOAM530RjmPyn5OhqXayzw5ecAomCReHt8WIngDn+/zwB9VeXd6Hl4nW
 aBGq1wI+B1EDEkm9Ss0uXSbB9O39mCuRPVNr7qg=
X-Google-Smtp-Source: ABdhPJw/6maiExf4T4K6P+uA0PR7diOG6M9f83I23cRCBWcRzMVvF/nmqzg3DxIxcCJBp64ktWZOIKaTQG0iVTNSdlw=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr38839356ejs.105.1620835335632; 
 Wed, 12 May 2021 09:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
In-Reply-To: <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 May 2021 20:02:03 +0400
Message-ID: <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006b7ab305c22422a9"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b7ab305c22422a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 12 May 2021 at 16:17, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, May 12, 2021 at 5:47 PM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >>
> >> On Mon, 10 May 2021 at 14:06, <marcandre.lureau@redhat.com> wrote:
> >> >
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > The following changes since commit
> d90f154867ec0ec22fd719164b88716e8fd48672:
> >> >
> >> >   Merge remote-tracking branch
> 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05
> 20:29:14 +0100)
> >> >
> >> > are available in the Git repository at:
> >> >
> >> >   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
> >> >
> >> > for you to fetch changes up to
> f1852f5d7e6fc2ead874261c0388b18898257000:
> >> >
> >> >   sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09 +0400)
> >> >
> >> > ----------------------------------------------------------------
> >> > Pull request
> >> >
> >> > ----------------------------------------------------------------
> >> >
> >> > Marc-Andr=C3=A9 Lureau (1):
> >> >   sphinx: adopt kernel readthedoc theme
> >>
> >> NetBSD now complains:
> >>
> >> Configuring 60-edk2-x86_64.json using configuration
> >> Program qemu-keymap found: NO
> >> Program sphinx-build found: YES
> >> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> >> Configuration error:
> >> There is a programable error in your configuration file:
> >>
> >> Traceback (most recent call last):
> >>   File "conf.py", line 154, in <module>
> >>     import sphinx_rtd_theme
> >> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
> >>
> >> During handling of the above exception, another exception occurred:
> >>
> >> Traceback (most recent call last):
> >>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in
> __init__
> >>     execfile_(filename, config)
> >>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
> >> 150, in execfile_
> >>     exec_(code, _globals)
> >>   File "conf.py", line 157, in <module>
> >>     'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
> >> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
> >> was not found.
> >>
> >>
> >>
> >> Program python3 found: YES (/usr/bin/python3)
> >> Program diff found: YES
> >> Program dbus-daemon found: YES
> >>
> >>
> >> as does freebsd and openbsd. Can we get the theme added to the VM
> >> configs for those ?
>
> > What is used for the BSD configs? If it's tests/vm, I don't see
> readthedoc being installed there, and vm-build-* should work (at least so=
me
> work for me, freebsd fails with ssh issue here)
>
> It's tests/vm.  The build doesn't fail, but the printing of the WARNING
> is caught by my wrapper scripts (which grep for various warning/error
> words to catch issues which don't trigger complete build failures).
> Adding the theme to the configs would mean that we can continue to
> test docs builds on those platforms.
>

Didn't you install readthedoc manually there? I don't see those warnings.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000006b7ab305c22422a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 7:56 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 12 May 2021 at 16:17, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, May 12, 2021 at 5:47 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 10 May 2021 at 14:06, &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The following changes since commit d90f154867ec0ec22fd719164b=
88716e8fd48672:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/dg-gitl=
ab/tags/ppc-for-6.1-20210504&#39; into staging (2021-05-05 20:29:14 +0100)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0git@gitlab.com:marcandre.lureau/qemu.git tags/rtd=
-pull-request<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b1=
8898257000:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0sphinx: adopt kernel readthedoc theme (2021-05-10=
 15:12:09 +0400)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -------------------------------------------------------------=
---<br>
&gt;&gt; &gt; Pull request<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -------------------------------------------------------------=
---<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Marc-Andr=C3=A9 Lureau (1):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0sphinx: adopt kernel readthedoc theme<br>
&gt;&gt;<br>
&gt;&gt; NetBSD now complains:<br>
&gt;&gt;<br>
&gt;&gt; Configuring 60-edk2-x86_64.json using configuration<br>
&gt;&gt; Program qemu-keymap found: NO<br>
&gt;&gt; Program sphinx-build found: YES<br>
&gt;&gt; ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:<br>
&gt;&gt; Configuration error:<br>
&gt;&gt; There is a programable error in your configuration file:<br>
&gt;&gt;<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;conf.py&quot;, line 154, in &lt;module&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0import sphinx_rtd_theme<br>
&gt;&gt; ModuleNotFoundError: No module named &#39;sphinx_rtd_theme&#39;<br=
>
&gt;&gt;<br>
&gt;&gt; During handling of the above exception, another exception occurred=
:<br>
&gt;&gt;<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3/dist-packages/sphinx/confi=
g.py&quot;, line 157, in __init__<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0execfile_(filename, config)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3/dist-packages/sphinx/util/=
pycompat.py&quot;, line<br>
&gt;&gt; 150, in execfile_<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0exec_(code, _globals)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;conf.py&quot;, line 157, in &lt;module&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;The Sphinx \&#39;sphinx_rtd_theme\&#39; HT=
ML theme was not found.\n&#39;<br>
&gt;&gt; sphinx.errors.ConfigError: The Sphinx &#39;sphinx_rtd_theme&#39; H=
TML theme<br>
&gt;&gt; was not found.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Program python3 found: YES (/usr/bin/python3)<br>
&gt;&gt; Program diff found: YES<br>
&gt;&gt; Program dbus-daemon found: YES<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; as does freebsd and openbsd. Can we get the theme added to the VM<=
br>
&gt;&gt; configs for those ?<br>
<br>
&gt; What is used for the BSD configs? If it&#39;s tests/vm, I don&#39;t se=
e readthedoc being installed there, and vm-build-* should work (at least so=
me work for me, freebsd fails with ssh issue here)<br>
<br>
It&#39;s tests/vm.=C2=A0 The build doesn&#39;t fail, but the printing of th=
e WARNING<br>
is caught by my wrapper scripts (which grep for various warning/error<br>
words to catch issues which don&#39;t trigger complete build failures).<br>
Adding the theme to the configs would mean that we can continue to<br>
test docs builds on those platforms.<br></blockquote><div><br></div><div>Di=
dn&#39;t you install readthedoc manually there? I don&#39;t see those warni=
ngs. <br></div><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006b7ab305c22422a9--

