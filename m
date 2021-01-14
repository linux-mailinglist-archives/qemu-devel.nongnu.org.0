Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EE2F5F82
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:11:06 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Wv-0004ht-Pn
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l00U2-0002HK-V3
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:08:07 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l00Tz-0006V0-2c
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:08:06 -0500
Received: by mail-ej1-x636.google.com with SMTP id t16so7501472ejf.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFV3fnoBttIPC4FHFJe7231DjI6DUzmxJwtVO04koJg=;
 b=N1JxENp9AzPRpJsaTgfcHbOtV/Ntlspw5iHLL0QV6jnw7kTKZ1KpUguidvkmibBLs7
 dirtdGU2fkStX9cIRJt1IbxJUiESA45lCEzlLSqZEqq/jQb81xZyXuCh2Fy06yw3+Mw+
 JlpFAz+fta0PrRIIEN6okn+DdqQzCcVVM+LkibMF0RpRyj4cdRg+DN/P5Uja+52QKehE
 VREbmjyVbcgFXR5Jr4gcgWeamyDNFdui4FcPTNUiuFhUwEkzowDpKxELG0Pox/HtSqy2
 MyAmU2WrkP5r+Ky4KIYAHJvra5y3OFGCt4Kl6JTLn/FqnH0jjHBQscM1RqUZ1E/ikCIl
 1qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFV3fnoBttIPC4FHFJe7231DjI6DUzmxJwtVO04koJg=;
 b=Evk25QZDRtCTiIGHM3T2wfo9tMGECs5wf+SoKYMXcrLQ0MfJpLIVf/HJlgSmEV3Gdp
 EJc3relVD3Hdon2vhHEtPX/UueI7mkbVzjKaHtPylVc9rhEQyK8K6SbiA2XSNN38wpf1
 /Put56VqRD+M8GPJzgUtlnLX29zUj7GxPXkY/6etkIAO71tVCM8trACm8/bqZsdvCuv/
 kw31wAHajXXY49QaA017YZEZGRyfOvMesAfbixV94NQURV6OH28zopUfFCoIPycV01ts
 jwIv2eh3Vvk0ZYqN/BelArmG7opyOVgxUuUxg4eN08BxzLHICSMTkIwXBdtH6/zLU1at
 0NUA==
X-Gm-Message-State: AOAM5339cabFEUGGHVFSs8dPwBB2VDct41HIUpmqQ8TrpB/lF/HO4Up3
 EFIg/jWJeNIUcTSGr5sGcoGNEQL/dMUaw1fQLUA=
X-Google-Smtp-Source: ABdhPJwJczRSA10lUGSe+cGFaaULp9EJmV030sCgJrQcxDiTRcs7WX+SJS4s/+j/+bRBZcO68IBXVlsePxXctjdI+vY=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr4849571ejb.532.1610622481585; 
 Thu, 14 Jan 2021 03:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-7-j@getutm.app>
 <1b4c4f34-8b27-3b45-7de8-19eed100f6f8@redhat.com>
In-Reply-To: <1b4c4f34-8b27-3b45-7de8-19eed100f6f8@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Jan 2021 15:07:49 +0400
Message-ID: <CAJ+F1CLn6NuK_EcV+6SEg-vwq4HhKMTgVJOAXapR3YpguR3Sdg@mail.gmail.com>
Subject: Re: [Slirp] [PATCH v6 6/7] slirp: update build flags for iOS resolv
 fix
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e1ddf705b8da44ac"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: slirp@lists.freedesktop.org, QEMU <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1ddf705b8da44ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 12, 2021 at 3:52 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Joelle,
>
> On 1/5/21 3:20 AM, Joelle van Dyne wrote:
> > A future libslirp update will use libresolv on Darwin systems, so we ad=
d
> the
> > flags in QEMU build now.
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  meson.build | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 900dbc36c8..d8951d4d6c 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1205,6 +1205,8 @@ if have_system
> >      slirp_deps =3D []
> >      if targetos =3D=3D 'windows'
> >        slirp_deps =3D cc.find_library('iphlpapi')
> > +    elif targetos =3D=3D 'darwin'
> > +      slirp_deps =3D cc.find_library('resolv')
>
> This is done in libSLiRP commit 9f82a47 ("Add DNS resolving for iOS").
>
> Maybe this commit need to be backported in the stable branch,
> or QEMU should use a newer commit. Cc'ing Samuel and Marc-Andr=C3=A9
> who maintain the project (and the SLiRP list).
>

Yes, I am going to send an update to git upstream.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e1ddf705b8da44ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 3:52 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Joelle,<br>
<br>
On 1/5/21 3:20 AM, Joelle van Dyne wrote:<br>
&gt; A future libslirp update will use libresolv on Darwin systems, so we a=
dd the<br>
&gt; flags in QEMU build now.<br>
&gt; <br>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Joelle van Dyne &lt;j@getutm.app&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 900dbc36c8..d8951d4d6c 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1205,6 +1205,8 @@ if have_system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 slirp_deps =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if targetos =3D=3D &#39;windows&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 slirp_deps =3D cc.find_library(&#39;iphlpap=
i&#39;)<br>
&gt; +=C2=A0 =C2=A0 elif targetos =3D=3D &#39;darwin&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 slirp_deps =3D cc.find_library(&#39;resolv&#39;)=
<br>
<br>
This is done in libSLiRP commit 9f82a47 (&quot;Add DNS resolving for iOS&qu=
ot;).<br>
<br>
Maybe this commit need to be backported in the stable branch,<br>
or QEMU should use a newer commit. Cc&#39;ing Samuel and Marc-Andr=C3=A9<br=
>
who maintain the project (and the SLiRP list).<br></blockquote><div><br></d=
iv>Yes, I am going to send an update to git upstream.</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">thanks</div><div class=3D"g=
mail_quote"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Mar=
c-Andr=C3=A9 Lureau<br></div></div>

--000000000000e1ddf705b8da44ac--

