Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3132B89A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:28:57 +0100 (CET)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSUi-0005SI-R3
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lHSTW-0004kj-Qa
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:27:42 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lHSTV-0004ai-82
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:27:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id ci14so23543637ejc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rLtSE2NkE3PuXZJWWpgYoeSBFrDJx44Td65D1MUi7M=;
 b=rHqyMYWk8AqzWdEZodebz1BC+uSG5d6Mx6xrkVSGA1nU3CHwlnxM5q414nv23azjDu
 TsJDOIhESEjkXQ8lip83Z/1+96MrkXdQ4GbniIMWBT/NrXrfPm+llefJ/4Ul4dUZylRq
 1h2o2VjJwiv6quL7/C9dvkpfAO1qCJQj3knwDATRIy1TEUJ65tkUYOXCunxXhL+Fh6Yd
 KyiYqCIu7t+uRKfCVxmUNuQbm6cEFkdiQeVNbz9lQs0ieW4VsO85zclRE57pRdQKriIS
 tI+Xyyp0UfOF2Ml+Y3I7GBm6vMAv+A2Hu1XhmjMh7hr6sNM8yfZ2DmFBBc+b4zg+5dBJ
 rcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rLtSE2NkE3PuXZJWWpgYoeSBFrDJx44Td65D1MUi7M=;
 b=izYVfJi+fF9HrhlcgvYTCWSe7zbbM8v+WTihcAGw8E/DVNP75KPUnAi1OKTO4YiTdq
 Pg9Yn6CaVX7zLo3eQJWCnT2t7ctuVcb7P0DHXOjdutK04FmIjMNr7XkhhiFxSUkzwEBa
 su+7lJ4boTpbWVZBaNQwHee5Ocz6XT78nt5o5z9eP9V6ccfkiH/yxwSPerQQo1nmAAdV
 Uu8TqH+l5eLvaoyQLjkCUBXJitwdXD6n9mtEoRvFFsDAvim4z8p4w2q9cmU3q6AYm4rY
 vv8wQjdlG9rXtkOsgFY6e9LTfAh0531eeGsypISDo1U8KsUmAwXnYE8ESX/fcidxN5s8
 5bmw==
X-Gm-Message-State: AOAM533O+t6deI3Cx5PauFLjloGXiljkBxWYMzO2Uz23YziVbExwcGHD
 /hJnUxrpYIoIyUcCIPhIiIA9vnUlqaqv3mHkdjw=
X-Google-Smtp-Source: ABdhPJzNyImLyPL6XqfPAJrhP+wodDZILQ1BY2aT5mg6vOJwspCcs+SZ5t/XzhQydKiU4AMuwS19+xZ1beBwhZSo5fk=
X-Received: by 2002:a17:907:2953:: with SMTP id
 et19mr25480078ejc.527.1614781659776; 
 Wed, 03 Mar 2021 06:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-6-kraxel@redhat.com>
 <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
 <20210303121314.2ql3yj6ju4i3wvmx@sirius.home.kraxel.org>
In-Reply-To: <20210303121314.2ql3yj6ju4i3wvmx@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Mar 2021 18:27:27 +0400
Message-ID: <CAJ+F1CJxSfEa2Y2WDdOS-x3RmiM490GotgpwETweaH1h+MPt+A@mail.gmail.com>
Subject: Re: [PATCH 5/7] ui/vnc: clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000388c2505bca2a761"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000388c2505bca2a761
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 3, 2021 at 4:13 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > +        case Z_BUF_ERROR:
> > > +            out_len <<=3D 1;
> > > +            if (out_len > (1 << 20)) {
> > >
> >
> > 1Mb isn't that much, is it? Well, since it handles only text for now it=
's
> > probably enough. Would it make sense to make this a #define for clarity=
 ?
>
> Yep.  While talking about sizes:  How does vdagent handles large
> clipboard chunks?  There is ...
>
> #define VD_AGENT_MAX_DATA_SIZE 2048
>
> ... but I suspect clipboard content isn't limited to that ...
>
>
The client splits large data to send in many messages.  I don't see the
agent doing the same (I might be missing something). I guess the rationale
behind is to be able to transmit other (agent or not) messages interleaved
on the main channel, and this is more important from the client side. The
amount of client outgoing agent messages is rate-controlled by a token
counter.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000388c2505bca2a761
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 3, 2021 at 4:13 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
Hi,<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case Z_BUF_ERROR:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_len &lt;&lt;=3D 1;=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (out_len &gt; (1 &l=
t;&lt; 20)) {<br>
&gt; &gt;<br>
&gt; <br>
&gt; 1Mb isn&#39;t that much, is it? Well, since it handles only text for n=
ow it&#39;s<br>
&gt; probably enough. Would it make sense to make this a #define for clarit=
y ?<br>
<br>
Yep.=C2=A0 While talking about sizes:=C2=A0 How does vdagent handles large<=
br>
clipboard chunks?=C2=A0 There is ...<br>
<br>
#define VD_AGENT_MAX_DATA_SIZE 2048<br>
<br>
... but I suspect clipboard content isn&#39;t limited to that ...<br clear=
=3D"all"><br></blockquote><div><br></div><div>The client splits large data =
to send in many messages.=C2=A0 I don&#39;t see the agent doing the same (I=
 might be missing something). I guess the rationale behind is to be able to=
 transmit other (agent or not) messages interleaved on the main channel, an=
d this is more important from the client side. The amount of client outgoin=
g agent messages is  rate-controlled by a token counter.<br></div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<b=
r></div></div>

--000000000000388c2505bca2a761--

