Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3BB57FE55
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 13:26:26 +0200 (CEST)
Received: from localhost ([::1]:44438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFwEC-0008JH-Qg
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 07:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oFwBa-0006h9-GZ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:23:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oFwBY-0004Xb-No
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:23:42 -0400
Received: by mail-lj1-x22d.google.com with SMTP id w18so1664787lje.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FemZC50nbRhdAr+2tYqkduBw4NjSbIuHSmf0fWTtu4g=;
 b=MQJ/C2NlJgkE34Hzrh3NF95x4gmLtwwx4S9RItt1mkFim6BTyEGbRSymOSzyucdzSc
 vkLioQV3P3eVjNn8AvtcTNjrqmA5NInuUq/uaRw8tDyM/rTPeRpH6fB6Or/ywRQz/FkJ
 i9N0u/P3HuX5bi/NYwrs09FzGK7ze7FeZqW/uo+9mxA+8M/SBDmxS32sv9GoscUKe6OR
 qk4zSAP4+w2/J4N9rj+5Omdm6e8ogIuhtxys+FfNhBzuh13o6PuQFg9RcVkJWnrwmk1z
 JCsI8OH26YIMfs6jYsOgf7A/91XTwCrF+Tkr/Iftxy8Z0AwlmSuo3YL0aDZX43Pf4E06
 yECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FemZC50nbRhdAr+2tYqkduBw4NjSbIuHSmf0fWTtu4g=;
 b=MFPfhoNYlMAXcT8ZapeBprNzw+RKuZr02EoSIKh2+NDVUyp9rAILYNtfgPb8pT31sY
 yQ40exKhsFIA2MH9kclEUFlSDOFo7w62bD9Qg+d7AjAqQ2ni7LihjDVzQX+0LFJ/j/9o
 gqEocyScqClUFKtfTvju3OkvWTE9xnjyxrdHJmCfagadVDvly/aoe8opAM87h36Hiaql
 /PgHx9HenCiMNRlB/hhkNRVvn15Sgg6tPzUIjtvCTx8eBfb8ksnoAUxx8EBp/F6dW5fQ
 Efw1J+jl8KypLNO/D7wk9oMFBs/z70WxdazRwUvaFnGnd0rfw78IHB5HAitNilviXEV7
 xfew==
X-Gm-Message-State: AJIora8p2O+V+ENEB+NDZPvawgVxEbZ8fz76094vOdXu6JXfhkECP+FD
 msRca9IVOKTv5XoJybDnvupuL5iJ+edjXPOxQEI=
X-Google-Smtp-Source: AGRyM1twCkSJhy43oNXsFr87SVs9K78A+LpaR3EdLRz1SioLPFev7CGD/04o38xOlKaU7pVu/S/iO90UHO1my3uxKO8=
X-Received: by 2002:a2e:b88a:0:b0:25d:aa7b:e6ec with SMTP id
 r10-20020a2eb88a000000b0025daa7be6ecmr3874180ljp.67.1658748217764; Mon, 25
 Jul 2022 04:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
In-Reply-To: <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 25 Jul 2022 15:23:26 +0400
Message-ID: <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004ab2bc05e49f6a13"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ab2bc05e49f6a13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:

> On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > As reported earlier by Richard Henderson ("virgl avocado hang" thread),
> avocado
> > tests may hang when QEMU exits before the QMP connection is established=
.
> >
> > v2:
> >  - use a socketpair() for QMP (instead of async concurrent code from v1=
)
> as
> >    suggested by Daniel Berrange.
> >  - should not regress (hopefully)
> >
> > Marc-Andr=C3=A9 Lureau (3):
> >   python/qmp/protocol: add open_with_socket()
> >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
> >   python/qemu/machine: use socketpair() for QMP by default
> >
> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
> >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
> >  3 files changed, 51 insertions(+), 16 deletions(-)
> >
> > --
> > 2.37.0.rc0
> >
>
> For anything that touches python/qemu/qmp/*, may I please ask that you
> submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
>
>
Ok


> (I'll review them in the meantime on-list just in the interest of
> moving things along.)
>

I was waiting for a review before updating the patches / moving to
python-qemu-qmp.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004ab2bc05e49f6a13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 1, 2022 at 2:51 AM John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 3=
0, 2022 at 8:34 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" targe=
t=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; As reported earlier by Richard Henderson (&quot;virgl avocado hang&quo=
t; thread), avocado<br>
&gt; tests may hang when QEMU exits before the QMP connection is establishe=
d.<br>
&gt;<br>
&gt; v2:<br>
&gt;=C2=A0 - use a socketpair() for QMP (instead of async concurrent code f=
rom v1) as<br>
&gt;=C2=A0 =C2=A0 suggested by Daniel Berrange.<br>
&gt;=C2=A0 - should not regress (hopefully)<br>
&gt;<br>
&gt; Marc-Andr=C3=A9 Lureau (3):<br>
&gt;=C2=A0 =C2=A0python/qmp/protocol: add open_with_socket()<br>
&gt;=C2=A0 =C2=A0python/qmp/legacy: make QEMUMonitorProtocol accept a socke=
t<br>
&gt;=C2=A0 =C2=A0python/qemu/machine: use socketpair() for QMP by default<b=
r>
&gt;<br>
&gt;=C2=A0 python/qemu/machine/machine.py | 24 ++++++++++++++++--------<br>
&gt;=C2=A0 python/qemu/qmp/legacy.py=C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++++=
++---<br>
&gt;=C2=A0 python/qemu/qmp/protocol.py=C2=A0 =C2=A0 | 25 ++++++++++++++++++=
++-----<br>
&gt;=C2=A0 3 files changed, 51 insertions(+), 16 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.37.0.rc0<br>
&gt;<br>
<br>
For anything that touches python/qemu/qmp/*, may I please ask that you<br>
submit them to <a href=3D"https://gitlab.com/qemu-project/python-qemu-qmp" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/python=
-qemu-qmp</a> ?<br>
<br></blockquote><div><br></div><div>Ok</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
(I&#39;ll review them in the meantime on-list just in the interest of<br>
moving things along.)<br></blockquote><div><br></div><div>I was waiting for=
 a review before updating the patches / moving to python-qemu-qmp.</div><di=
v><br></div><div>thanks</div><div>=C2=A0<br></div></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004ab2bc05e49f6a13--

