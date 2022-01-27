Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C07649E86B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:09:29 +0100 (CET)
Received: from localhost ([::1]:40638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8H1-0001nk-R7
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6ng-0000ET-HA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:35:04 -0500
Received: from [2607:f8b0:4864:20::92c] (port=34348
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6nc-0006LK-Md
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:35:03 -0500
Received: by mail-ua1-x92c.google.com with SMTP id y4so5468147uad.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBqhVMCdgBjSv1RpGnknbGDx2G48e5pQCyv1rQdkkiA=;
 b=tkz/GHZWUKKVPGjBLhxaBl+YF8azRRsGeqC0mZYAqpIH75whodDOMq2VXNbyOAyU5g
 Z6HeBgPn9nWwMSrATxM9mypZstQUtd9cXN0nmrNy1jRiXJHmuW7vBKHBpRaRmNniYu5n
 5gxBj/0jZAwoFsBT3IOiPIQAlF6zDn1ultXz3oXAmlYufg7X9qUjM5b+4mDWA2xvTPeN
 tp94vyrrifSZiOVT8PLgEcfIwN8KusnO1jHFJ3jrxbBcYFbgiw8Itmu1hcQvKw3pkN0q
 TBE3orkA29LwXnADQedtYhqAwd3zAkwcBdBbJcGroMqln6Ntvvd+1E5XxCRifAi+eU5t
 PnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBqhVMCdgBjSv1RpGnknbGDx2G48e5pQCyv1rQdkkiA=;
 b=LdtdosuKHlEWAXJ3a4ObQrDz2gwuUqxXpLvq/HtcschPoKsGW5n+IKB+EkC3DhvgaR
 3W0vmJ2r7TD8j3Lp25q5GRWcQAeg3xDFQjWfhIm2HdQjomHFx1WM7KIjYuR0niaBnq+p
 ggt4dBT2qq8zfpYWJMalDLzqHNxqjWjYDP3rhEurw6a/tyo08KfDx6zCiD2VJLlQ5MfT
 UcC5F6/iYZrfhBBlouzYgHF3W2C9gZz36Ep0FLevljayxlnLcFeskNr0I7MW/4bgFfIG
 epiz+A6/QLUmJaqr3zSg7GfDk9TxK9qU9sjtgzVq8jEYyGCpdHQOZp/IhtPzUh+NOsgl
 S78g==
X-Gm-Message-State: AOAM5324+1uQZDDnejD4iQ283pn1mq9+s2hSICCTct7nklpR62zEjdk5
 V5ePvmwL4AYrGrGLLY5L86u0nNRK6jUGZsoNhr02h/jJz6VMhQ==
X-Google-Smtp-Source: ABdhPJw+eDI3k9LLFpgfoC6c2rME5cd+R9NBeFh8es/VH1BtiYf/uWmF/me4j9q6FAteO8KvmNnU8biTG81jNS/tJH4=
X-Received: by 2002:a67:fac3:: with SMTP id g3mr2039032vsq.6.1643297698777;
 Thu, 27 Jan 2022 07:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-30-imp@bsdimp.com>
 <ee0a09cd-b0d8-59b6-ecc4-dc1fd1705d8f@linaro.org>
In-Reply-To: <ee0a09cd-b0d8-59b6-ecc4-dc1fd1705d8f@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Jan 2022 08:34:47 -0700
Message-ID: <CANCZdfpcGnqb-Cg9q8LCbOE168vVdgJCarYhOa3of3uYRur=zQ@mail.gmail.com>
Subject: Re: [PATCH v2 29/40] bsd-user/signal.c: Fill in queue_signal
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000098d11905d6920f8a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
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
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000098d11905d6920f8a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 12:44 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/25/22 12:29, Warner Losh wrote:
> > Fill in queue signal implementation, as well as routines allocate and
> > delete elements of the signal queue.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h   |  1 +
> >   bsd-user/signal.c | 13 ++++++++++++-
> >   2 files changed, 13 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +    struct emulated_sigtable sync_signal;
> >       struct emulated_sigtable sigtab[TARGET_NSIG];
>
> I'll note that we don't need an array of these, since we block all signals
> while returning
> to the main cpu loop, so we can't receive a second async signal.
> Something to be fixed
> for both l-user and b-user later...
>

I'll add
+    /*
+     * TODO: Since we block all signals while returning to the main CPU
+     * loop, this needn't be an array
+     */
before the array to document this so it doesn't get lost...

Warner

--00000000000098d11905d6920f8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 12:44 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/25/22 12:29, Warner Losh wrote:<br>
&gt; Fill in queue signal implementation, as well as routines allocate and<=
br>
&gt; delete elements of the signal queue.<br>
&gt; <br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 13 ++++++++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 13 insertions(+), 1 deletion(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; +=C2=A0 =C2=A0 struct emulated_sigtable sync_signal;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct emulated_sigtable sigtab[TARGET_NSIG]=
;<br>
<br>
I&#39;ll note that we don&#39;t need an array of these, since we block all =
signals while returning <br>
to the main cpu loop, so we can&#39;t receive a second async signal.=C2=A0 =
Something to be fixed <br>
for both l-user and b-user later...<br></blockquote><div><br></div><div>I&#=
39;ll add</div>+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 * TODO: Since we block =
all signals while returning to the main CPU<br>+ =C2=A0 =C2=A0 * loop, this=
 needn&#39;t be an array<br><div>+ =C2=A0 =C2=A0 */</div><div>before the ar=
ray to document this so it doesn&#39;t get lost...=C2=A0</div><div><br></di=
v><div>Warner</div></div></div>

--00000000000098d11905d6920f8a--

