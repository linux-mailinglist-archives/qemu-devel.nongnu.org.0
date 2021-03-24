Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0734762E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:35:01 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0qp-0001Kf-L9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP0nz-0000bw-4A
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:32:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lP0ns-0001P6-Uz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:32:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u21so14003026ejo.13
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPbYSOzn+rj43kxip5hPZG3C2qHYYp6mflC1QTWE+AE=;
 b=dqgWyGF6TB46hamcg9GVb4+2/nDMiPB6YSdZgbltwDQEM8VLinKmPOEiVpmxDO27Ng
 vk1MpnI6J+4UwL+o6VBUfJy/5Td6Z7UQCb7KDRZK2WcjBeQ/FDNrp9JTigXn8GE8xULu
 UBHjLoZShLZghBhGS//lbHbMZmZQwEkDLUUKf6HbP/hUvhln0Wo3q/KJvxUjzv+RC8ta
 ehgok9l2QpyFe1p5BWqHEMXt3Ainh8wXWKBHuKb5+hnjFhgMfk6EFFWvyNBBRKUUPZD2
 koqlVakzCV3dnmbkqx3SPHtlo+1Vv1/UQDAUQxy5F2M5ppmJoOVl6sLXKoBrV0x+1XyF
 UO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPbYSOzn+rj43kxip5hPZG3C2qHYYp6mflC1QTWE+AE=;
 b=Uh8bMfmquAN9BCRKViUQp2W4KpGCdyx7qbfZc12xOgbZr8CTzOcVdJ0RXrGP4ndl4p
 nRAUUuk4bO+9HhsFTCYfa80LaZQaA/oqfH3WR9HnmJD3oy06jS1GMzqFLxZtToU7Twip
 0ymAcTI8CRtsc6OQWdt/loPpp+k/Y5AqA/LAI2dL3Z7h/8VAO/Wz+wIQ9OnY4EX36YvZ
 WTl1jOGBwT+r4PQfpy8B+AiIYkCV0KlxuF/UvoGjp7sRsLgdlZjpnamE9vaK9EikslEc
 SZ92ReVoy4E1o4LKEJOXyIDi4NjJSKoE7sQFoxZ1OkxnGRoQyFs+2XOwUy9irO9e/8ms
 6i6Q==
X-Gm-Message-State: AOAM533dMLH4L3DTMab92Dy/+WWyjr/Hj8eEuB7q2asYkKZZk2pDGnT8
 XOMXzwICPbf2K/Z82LaVMNPxSOAPpzsNtvXL4ac=
X-Google-Smtp-Source: ABdhPJyjYW2fsXAp72OVBtsfWOL8+Mklx//NTqg043iK1JaxV5rXZJHSeImb8Ao6mXAbDNQDw5lkHMixH2zPYhJRdCI=
X-Received: by 2002:a17:906:40c7:: with SMTP id
 a7mr2872463ejk.109.1616581915122; 
 Wed, 24 Mar 2021 03:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-3-kraxel@redhat.com>
 <CAJ+F1CL2mR1BwHfV7FzjV5Dh-nq-4CGP74ptxJgS75LN-6DdpQ@mail.gmail.com>
 <20210322102717.xakx5rfg3gdekjfk@sirius.home.kraxel.org>
 <20210324094658.nfnuufvqm7cqseww@sirius.home.kraxel.org>
In-Reply-To: <20210324094658.nfnuufvqm7cqseww@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Mar 2021 14:31:43 +0400
Message-ID: <CAJ+F1CJyFJMqh2BF9QjLVEg=W98bs8b7vYwr_XL2TyETUa44Yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd201405be45cec0"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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

--000000000000cd201405be45cec0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 1:47 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mon, Mar 22, 2021 at 11:27:17AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> >
> > > > +    if (vd->msgsize !=3D msg->size + sizeof(*msg)) {
> > > > +        /* FIXME: handle parse messages splitted into multiple
> chunks */
> > > > +        fprintf(stderr, "%s: size mismatch: chunk %d, msg %d
> (+%zd)\n",
> > > > +                __func__, vd->msgsize, msg->size, sizeof(*msg));
> > > >
> > >
> > > Not fixing? You handle chunking on sending but not on receiving?
> >
> > linux vdagent doesn't do chunking on send, so no need (and also no
> > testcase) so far.
> >
> > Didn't try windows guests (yet), but that is next on my clipboard
> > todo list.
>
> Hmm, windows guest agent doesn't has VD_AGENT_CAP_CLIPBOARD_SELECTION,
> so I have to deal with that.
>

ok


> Windows guests do actually send large messages in chunks, so I have
> something to test with, good.
>
> What are VD_AGENT_CAP_GUEST_LINEEND_LF + VD_AGENT_CAP_GUEST_LINEEND_CRLF
> are good for btw?  Are linefeeds converted automatically between dos and
> unix conventions?  If so, who is supposed to handle that?
>
>
I think that means the guest agent uses a text clipboard with CRLF ending,
both ways. spice-gtk has dos2unix & unix2dos helpers to deal with that.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cd201405be45cec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 1:47 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Mar 22, 2021 at 11:27:17AM +0100, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (vd-&gt;msgsize !=3D msg-&gt;size + sizeof=
(*msg)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: handle parse messages=
 splitted into multiple chunks */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: size =
mismatch: chunk %d, msg %d (+%zd)\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __f=
unc__, vd-&gt;msgsize, msg-&gt;size, sizeof(*msg));<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; Not fixing? You handle chunking on sending but not on receiving?<=
br>
&gt; <br>
&gt; linux vdagent doesn&#39;t do chunking on send, so no need (and also no=
<br>
&gt; testcase) so far.<br>
&gt; <br>
&gt; Didn&#39;t try windows guests (yet), but that is next on my clipboard<=
br>
&gt; todo list.<br>
<br>
Hmm, windows guest agent doesn&#39;t has VD_AGENT_CAP_CLIPBOARD_SELECTION,<=
br>
so I have to deal with that.<br></blockquote><div><br></div><div>ok <br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Windows guests do actually send large messages in chunks, so I have<br>
something to test with, good.<br>
<br>
What are VD_AGENT_CAP_GUEST_LINEEND_LF + VD_AGENT_CAP_GUEST_LINEEND_CRLF<br=
>
are good for btw?=C2=A0 Are linefeeds converted automatically between dos a=
nd<br>
unix conventions?=C2=A0 If so, who is supposed to handle that?<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">I think that means the guest agent uses a text clipboard with C=
RLF ending, both ways. spice-gtk has dos2unix &amp; unix2dos helpers to dea=
l with that.<br></div><div class=3D"gmail_quote"><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cd201405be45cec0--

