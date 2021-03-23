Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FE345E40
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:36:14 +0100 (CET)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgGb-0007lZ-Kw
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOgFL-00076S-FA
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:34:55 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOgFJ-0001B8-CO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:34:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so26793517ejc.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C6RYRXWG+O8RHLOXxQdwDkr/SVrdCiS2CuP1AwAUs7g=;
 b=OrKQmVlI+00Yz0eSzjdFCckUEAaTpNZ1dHzJO/sUsLOrtvSI+nSIC0xcl7YO/SMdxU
 BuAZAmso0I0icj/qI3mKEsFBTyDXw64+ozey9vNwfhhD9lHaOngYMyERHr9PaJedmJr1
 W9BIovy/F9TMtnwgQmaxU7Nbixgyl9/1/DHC+7XEcZ7aI3CbZ7Y/yvnMw40Xmyi2Xtts
 1zuYwZTgVbGyJ630RjveY3bfNY+kiF4dIEf5E4oX1hKFKPb7sU+NheHMsSmnCUNimjCG
 5F7bnV1M7i4vrXR1uLbZyzEpdu4wLy7AbMtoH+IpRo/2cMyv4nNy52gEUUdxPqe7xuY5
 H4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C6RYRXWG+O8RHLOXxQdwDkr/SVrdCiS2CuP1AwAUs7g=;
 b=Wx68yfbsJA4UZ+ssYUfFKo3djP2kB61zAskjR63kDVHmob9ig/SwKZXQil0dDCzx08
 owBFBLPp4J5oPFrndnwb13YjrgBpxrUXkGNEO9UHU2zTZKdQnzG4GaillIR6uTPSL5yR
 QKXDwOwg9C3osZKiR5DCZWlc8Hn8VrragvrvTPR/X0t5srPCGYW1o4egrIpeQtU5Nzdm
 U6J/T2fsVq0fWn25ydZfG0ggHVDuxG2wOhOMacUb90O0y082l5GQEMJE8Agg7poUXA/c
 BmYRbajFOlu8ye2OmLr7/3NCuA2pOxv+oLuAtbSxxTnkSAWGSTKw15jSWkTkLJ4j7/S3
 Q4OA==
X-Gm-Message-State: AOAM531zBZYU1NxenwcPRXm0cePqsyk0v3KwwSxRlUseeUFAU41xi+Xk
 NZTJpqlgQ2ACAYj0whIC9Cazz8VCb8BgIzqU+Es=
X-Google-Smtp-Source: ABdhPJxHE9hNCRIzyL2X2iHQxrc6kp9GW6/80fO7XmIwPdddzyseTI/lb4E7vbokuec5qHwrD82JiTmvR5oy2/saHps=
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr4717223eju.532.1616502891031; 
 Tue, 23 Mar 2021 05:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
 <4144cbea-4aa9-359c-f01e-34c16f2c1efe@proxmox.com>
In-Reply-To: <4144cbea-4aa9-359c-f01e-34c16f2c1efe@proxmox.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 23 Mar 2021 16:34:39 +0400
Message-ID: <CAJ+F1CJ02sjxne9v3b3m_Dd+yfXW1M5f5opB8Fe-hgKrWOda_g@mail.gmail.com>
Subject: Re: [PATCH v5] sphinx: adopt kernel readthedoc theme
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: multipart/alternative; boundary="0000000000009930c805be336811"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009930c805be336811
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 23, 2021 at 4:27 PM Thomas Lamprecht <t.lamprecht@proxmox.com>
wrote:

> On 23.03.21 12:53, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
>
> Just saw this patch by accident and as we also use the alabaster theme
> for the Proxmox Backup project I wanted to share some insights from our
> usage, as I checked that theme out closely a few months ago and did some
> adaptions for, partially overlapping, short-comings we found.
>
>
> > The default "alabaster" sphinx theme has a couple shortcomings:
> > - the navbar moves along the page
>
> That can be fixed with the following conf.py 'html_theme_options' setting=
:
>
> 'fixed_sidebar': True,
>
>
> https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py=
;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c74=
a50d7223c875a04b#l161
>
> > - the search bar is not always at the same place
>
> Can be also addressed by setting 'html_sidebars' to a fixed order, e.g.:
>
> html_sidebars =3D {
>     '**': [
>         'searchbox.html',
>         'navigation.html',
>         'relations.html',
>     ]
> }
>
> Can also be customized for different pages, e.g., we do so for landing
> pages:
>
>
> https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py=
;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c74=
a50d7223c875a04b#l188
>
> I added also a short JS snipped to scroll the heading of the current
> chapter in
> the sidebar TOC into view (adapted from rust book).
>
> https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/custom.=
js;h=3D7964b2cb0ea9433596845618f1679f1672ce38b8;hb=3D2ab2ca9c241f8315f51f9c=
74a50d7223c875a04b
>
> If you want, you could check out the result at our hosted docs site:
> https://pbs.proxmox.com/docs/managing-remotes.html


Great, thanks for the tips.

However, the result doesn't seem as good on mobile yet.


>
> > - it lacks some contrast and colours
>
> That is true, and IMO the rtd theme really uses a better colour palette,
> especially for things like "Topic" blocks.
> In fact we pondered switching over to rtd, so please don't see my mail
> as me advertising that all issues can be fixed into alabaster, just wante=
d
> to share what we did to overcome the first two short-comings mentioned
> here.
>

Would you prefer QEMU to keep alabaster as a working and supported fallback
for consistency? or you could maintain a downstream patch for your version
perhaps?


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009930c805be336811
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 4:27 PM Tho=
mas Lamprecht &lt;<a href=3D"mailto:t.lamprecht@proxmox.com">t.lamprecht@pr=
oxmox.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 23.03.21 12:53, <a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
<br>
Just saw this patch by accident and as we also use the alabaster theme<br>
for the Proxmox Backup project I wanted to share some insights from our<br>
usage, as I checked that theme out closely a few months ago and did some<br=
>
adaptions for, partially overlapping, short-comings we found.<br>
<br>
<br>
&gt; The default &quot;alabaster&quot; sphinx theme has a couple shortcomin=
gs:<br>
&gt; - the navbar moves along the page<br>
<br>
That can be fixed with the following conf.py &#39;html_theme_options&#39; s=
etting:<br>
<br>
&#39;fixed_sidebar&#39;: True,<br>
<br>
<a href=3D"https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddoc=
s/conf.py;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f831=
5f51f9c74a50d7223c875a04b#l161" rel=3D"noreferrer" target=3D"_blank">https:=
//git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py;h=3Dcfa=
4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c74a50d7223=
c875a04b#l161</a><br>
<br>
&gt; - the search bar is not always at the same place<br>
<br>
Can be also addressed by setting &#39;html_sidebars&#39; to a fixed order, =
e.g.:<br>
<br>
html_sidebars =3D {<br>
=C2=A0 =C2=A0 &#39;**&#39;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;searchbox.html&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;navigation.html&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;relations.html&#39;,<br>
=C2=A0 =C2=A0 ]<br>
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
<br>
Can also be customized for different pages, e.g., we do so for landing page=
s:<br>
<br>
<a href=3D"https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddoc=
s/conf.py;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f831=
5f51f9c74a50d7223c875a04b#l188" rel=3D"noreferrer" target=3D"_blank">https:=
//git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py;h=3Dcfa=
4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c74a50d7223=
c875a04b#l188</a><br>
<br>
I added also a short JS snipped to scroll the heading of the current chapte=
r in<br>
the sidebar TOC into view (adapted from rust book).<br>
<a href=3D"https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddoc=
s/custom.js;h=3D7964b2cb0ea9433596845618f1679f1672ce38b8;hb=3D2ab2ca9c241f8=
315f51f9c74a50d7223c875a04b" rel=3D"noreferrer" target=3D"_blank">https://g=
it.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/custom.js;h=3D7964=
b2cb0ea9433596845618f1679f1672ce38b8;hb=3D2ab2ca9c241f8315f51f9c74a50d7223c=
875a04b</a><br>
<br>
If you want, you could check out the result at our hosted docs site:<br>
<a href=3D"https://pbs.proxmox.com/docs/managing-remotes.html" rel=3D"noref=
errer" target=3D"_blank">https://pbs.proxmox.com/docs/managing-remotes.html=
</a></blockquote><div><br></div><div>Great, thanks for the tips.</div><div>=
<br></div><div>However, the result doesn&#39;t seem as good on mobile yet.<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; - it lacks some contrast and colours<br>
<br>
That is true, and IMO the rtd theme really uses a better colour palette,<br=
>
especially for things like &quot;Topic&quot; blocks.<br>
In fact we pondered switching over to rtd, so please don&#39;t see my mail<=
br>
as me advertising that all issues can be fixed into alabaster, just wanted<=
br>
to share what we did to overcome the first two short-comings mentioned here=
.<br></blockquote><div><br></div><div>Would you  prefer QEMU to keep alabas=
ter as a working and supported fallback for consistency? or you could maint=
ain a downstream patch for your version perhaps?<br></div></div><br clear=
=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--0000000000009930c805be336811--

