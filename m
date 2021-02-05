Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DB310BD8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:34:28 +0100 (CET)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81Fj-00043C-QS
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l81E7-0003Nq-G6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:32:49 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l81E4-0004Rh-O2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:32:47 -0500
Received: by mail-pg1-x530.google.com with SMTP id j2so4580796pgl.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+iyGWaAQs+cG649Us3GVhl0V0SFFOnCZd7RZcTGzmY=;
 b=bZIzHzNUbM54kLw1hebfoqnFbYl+yiUqbj0NZp1KoZwKSGUiU0tLinCguwIgpSCGer
 plPFfunzl1sSOqSEr1R1RIGvBXpxIybWE8GXlrAyuPc0/RCU5dBQB1HpwnXV1QjSvlmL
 7WEd7Nib8tqDRiGVSisDzYWauU1ZH6H7zGMKp5Zo7psIkmuHSNFPWmIXn9TtVlpsEIfq
 y0bjelQ+TGpc5I71BOjDzOAs54pQtuuQIAwIcJem8YzbsnPh3PC8SQJN14gEaoENo4hY
 xKrRbTFjXsbFpm7CMueBHC2VQk5kZPw9x8cZDVP8pCHLlKrHpdiJjeYkFA9Ykkod/equ
 xg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+iyGWaAQs+cG649Us3GVhl0V0SFFOnCZd7RZcTGzmY=;
 b=OZW6cNd4/n0oWcfENeHOBTLVobubGlLb3buwHYWpOAraNplLuyEvAiZwjfAm17gxr3
 O3ENkWGly5U8mqN3fOw8Nk1/QhcpiZ3gRyMaW0FfsDIETe55bAQ0TKWeW1RRSAKLgfyT
 7q/OofwT4+kbHMzD32dIZFcVTm7kmcH0NeDI7KRcP0+TJLexenJa7yNv/c/w7R7aD9+6
 VFb5MOVRDda7Y1YC5+BBm7ZJi6y7OphttXiVau8VmEcyF4lkU145y9X7z69zXDBR3cUM
 Mru24VH9rq2utgwQj3rP+UF/Hlcf1Y3xc3lkLHqmCcZoGPkeVESt/m9xgIhfudZg/JWu
 cSzQ==
X-Gm-Message-State: AOAM531NYRDE+lQLoDQmnrCnHcvcapwRGidY3YsIUuq4evCWLZ9Yq7mv
 VEBaHXPPjiualWpgQsXwQnhrGAP5I8ic6oFAgP0=
X-Google-Smtp-Source: ABdhPJxGsx1kgigStaeU3u2silTZvW7zJWs/HZX1t5h8tB42KTY9HDgplIY24tfEwRkhKqGxnhLJMNe2ymjFv2dxQPg=
X-Received: by 2002:a63:4444:: with SMTP id t4mr4305293pgk.329.1612531962930; 
 Fri, 05 Feb 2021 05:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
 <20210204162544.65439-2-phillip.ennen@gmail.com>
 <eacb4adb-3139-e8ed-0d1f-d070af226872@redhat.com>
In-Reply-To: <eacb4adb-3139-e8ed-0d1f-d070af226872@redhat.com>
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Fri, 5 Feb 2021 14:32:31 +0100
Message-ID: <CAAi_9z5Y5QA+n_1vy8sqb9dmVLA3XYjA+kvGfAQ1DUVOrJV3=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] build: add configure flag to indicate when the host
 is Darwin
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d6e8b605ba96da50"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d6e8b605ba96da50
Content-Type: text/plain; charset="UTF-8"

Hrm, good catch. I'm not sure how I missed that.

I'm removing this patch for my next round.

Thanks!
Phillip

On Fri, Feb 5, 2021 at 6:56 AM Thomas Huth <thuth@redhat.com> wrote:

> On 04/02/2021 17.25, phillip.ennen@gmail.com wrote:
> > From: Phillip Tennen <phillip@axleos.com>
> >
> > Although we already have CONFIG_BSD, I added this flag to be sure that
> we could rely on various macOS-specific subsystems, such as vmnet.framework.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > ---
> >   configure | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/configure b/configure
> > index 87de49e2c2..4afd22bdf5 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5825,6 +5825,10 @@ if [ "$bsd" = "yes" ] ; then
> >     echo "CONFIG_BSD=y" >> $config_host_mak
> >   fi
> >
> > +if [ "$darwin" = "yes" ] ; then
> > +  echo "CONFIG_DARWIN=y" >> $config_host_mak
> > +fi
>
>   Hi!
>
> We already have these lines in "configure":
>
> if test "$darwin" = "yes" ; then
>    echo "CONFIG_DARWIN=y" >> $config_host_mak
> fi
>
> ... so your patch here looks pretty redundant?
>
>   Thomas
>
>

--000000000000d6e8b605ba96da50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hrm, good catch. I&#39;m not sure how I missed that.<div><=
br></div><div>I&#39;m removing this patch for my next round.</div><div><br>=
</div><div>Thanks!</div><div>Phillip</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 5, 2021 at 6:56 AM Th=
omas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex">On 04/02/2021 17.25, <a href=3D"mailto:phi=
llip.ennen@gmail.com" target=3D"_blank">phillip.ennen@gmail.com</a> wrote:<=
br>
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" target=
=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; <br>
&gt; Although we already have CONFIG_BSD, I added this flag to be sure that=
 we could rely on various macOS-specific subsystems, such as vmnet.framewor=
k.<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index 87de49e2c2..4afd22bdf5 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -5825,6 +5825,10 @@ if [ &quot;$bsd&quot; =3D &quot;yes&quot; ] ; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_BSD=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +if [ &quot;$darwin&quot; =3D &quot;yes&quot; ] ; then<br>
&gt; +=C2=A0 echo &quot;CONFIG_DARWIN=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
&gt; +fi<br>
<br>
=C2=A0 Hi!<br>
<br>
We already have these lines in &quot;configure&quot;:<br>
<br>
if test &quot;$darwin&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DARWIN=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
fi<br>
<br>
... so your patch here looks pretty redundant?<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--000000000000d6e8b605ba96da50--

