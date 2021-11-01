Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282E44239D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:58:11 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgFl-0005kQ-VG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhgCS-0003kR-7A
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:54:44 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:37382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhgCM-0000ri-8g
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:54:43 -0400
Received: by mail-lf1-x133.google.com with SMTP id i3so9609100lfu.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ruDq+Ue1WCLZHP1+LuUhcoRPYr7uhk7nMY90VIZo7wU=;
 b=N+9gLia2HokKlYGI+fHD4xmymwO/1iqqX5jSNw5yx5u0DpUCvvCwd/l/ulWZ2zfZLn
 B1+UEdCgYKqoUsB8T+3wM02ddsukWrZqgVlEKCCAv/UffL66kMTHV1ckNjX4TPVgjU3z
 rEqnsyoIkWLDkf9joEtbgmRInGfJN/vbG7+Hp603DsDPDtX1dF+ezELS0Z3rS6oSN8bQ
 U5aJQlwppe+rcil+azAZIcYRqyF/fCq/xQVXnoUkah5uvsQLJT0mpg+IH7TK1mJ1IexC
 eiPJ6xHmYDF6Gp27RQisON8O7u+Yl7kkxM9Q99XTg371+Y0pJ2XZtCEQlOJk1E1JR/fH
 XNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ruDq+Ue1WCLZHP1+LuUhcoRPYr7uhk7nMY90VIZo7wU=;
 b=zhazO/UfNo+kB3tV7Pfv28b4acLg7oC8EvGOilfS+4pfPFz1lLND3OQkkE/TlhCPK5
 0NzyEx/nBSYZNuE88qb2rlB9EuBxy+0eF1wJEWHgX8AQnf4wQmQy+Q4JIWxKJ0XD6Rjj
 ujwSfuqZKZFFfaTPeyYYc9DGBfGG+XdiAoEijSw+vWN3Gi58zSfCP8trmxcFi6Dem6b1
 joMcuaQy3XrdQPuuxAkY7XrbCE4wbC+V4w4Eu9nvmN3wSbfF98OriIChbIl1d3Ga2bf4
 0ShLICQN4jEu8cSc/+twYnupALbuP8N+lK3r0GmImZJV4pyZcyiJf+g02a2Wv5rNpt12
 Nz2Q==
X-Gm-Message-State: AOAM532gg0zRPCm2gQxDBHYCeRlo8aT5i18Fx2L4H6w1zrswcFTD/3B1
 9rGisVQO5sSQVL/qPHnseym3u8oo8NtJZMWJ9XSuAw==
X-Google-Smtp-Source: ABdhPJxQSieG7uUT5oQHY001NIKZp/LXn7E3RDk0y7itFxvem4lpbmOR5lgnkTPMfidm93KiGdc7GIudOWJ8RHtji2E=
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr31060538lfq.334.1635807276014; 
 Mon, 01 Nov 2021 15:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-8-wuhaotsh@google.com>
 <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8B9uKOyVycq7+kbOSVSfXD9-xsAuBaNowy56CvZKpTUQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 1 Nov 2021 15:54:13 -0700
Message-ID: <CAGcCb124=YD1f+93RoytAGecoAuVCOwvEpsMA1nrwQPL8Bihnw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm: Add ID for NPCM7XX SMBus
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, KFTING@nuvoton.com, hskinnemoen@google.com
Content-Type: multipart/alternative; boundary="0000000000009c08de05cfc20f90"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--0000000000009c08de05cfc20f90
Content-Type: text/plain; charset="UTF-8"

I was trying to allow attaching a device using "-device xxx,bus=smbus[0]"
Maybe there's a better way to allow that?

I guess I can drop this one from the patch set.

On Mon, Nov 1, 2021 at 10:33 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > The ID can be used to indicate SMBus modules when adding
> > dynamic devices to them.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> > index 2ab0080e0b..72953d65ef 100644
> > --- a/hw/arm/npcm7xx.c
> > +++ b/hw/arm/npcm7xx.c
> > @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)
> >      for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
> >          object_initialize_child(obj, "smbus[*]", &s->smbus[i],
> >                                  TYPE_NPCM7XX_SMBUS);
> > +        DEVICE(&s->smbus[i])->id = g_strdup_printf("smbus[%d]", i);
> >      }
>
> This one looks weird to me -- I'm pretty sure we shouldn't be messing
> about with the DeviceState id string like that. It's supposed to be
> internal to the QOM/qdev code.
>
> -- PMM
>

--0000000000009c08de05cfc20f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was trying to allow attaching a device using &quot;-devi=
ce xxx,bus=3Dsmbus[0]&quot;<div>Maybe there&#39;s a better way to allow tha=
t?</div><div><br></div><div>I guess I can drop this one from the patch set.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Nov 1, 2021 at 10:33 AM Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 21 Oct 2021 at 19:=
40, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuh=
aotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The ID can be used to indicate SMBus modules when adding<br>
&gt; dynamic devices to them.<br>
&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c<br>
&gt; index 2ab0080e0b..72953d65ef 100644<br>
&gt; --- a/hw/arm/npcm7xx.c<br>
&gt; +++ b/hw/arm/npcm7xx.c<br>
&gt; @@ -421,6 +421,7 @@ static void npcm7xx_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;smbus); i++)=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;s=
mbus[*]&quot;, &amp;s-&gt;smbus[i],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_NPCM7XX_SMBUS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVICE(&amp;s-&gt;smbus[i])-&gt;id =3D g_=
strdup_printf(&quot;smbus[%d]&quot;, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This one looks weird to me -- I&#39;m pretty sure we shouldn&#39;t be messi=
ng<br>
about with the DeviceState id string like that. It&#39;s supposed to be<br>
internal to the QOM/qdev code.<br>
<br>
-- PMM<br>
</blockquote></div>

--0000000000009c08de05cfc20f90--

