Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9E4AD655
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:24:52 +0100 (CET)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOc5-0002eN-J5
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOTO-0001ct-G1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOT3-0006Da-MT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BH0xGYaZuUN0ME/KL5LBJO9SXPK5Xc7yuTnbKH82SX0=;
 b=XK5iEq6HvmL/f6JhGNb4qZ6hO1vcUOa5Zc4hCiYpMS/uL1I2hHAf48ZGL3donSNeQpNBZI
 piyUmn0WjTPraLnDjMbb2/Ubj45Qp+7eKgvNJLwB6vrLFVT3QwHcXnTIKBShjSmfp8vOXE
 RIia5NaU2usSsNUsp/58X2Lkg4PrsNU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-iA0cqeXLMTylpcAo9FIo-Q-1; Tue, 08 Feb 2022 06:15:04 -0500
X-MC-Unique: iA0cqeXLMTylpcAo9FIo-Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 s73-20020a25aa4f000000b0061d764d3c13so18641321ybi.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BH0xGYaZuUN0ME/KL5LBJO9SXPK5Xc7yuTnbKH82SX0=;
 b=Bb8Cf+zJHVDBv0uqsdBvTkER8Ol2CJdh21VlQWCQvz3nrfFGAhIZgxrIBkFPhRu8QM
 sPHQx/p8+wzApr+Z4Fy/Z+dCbsI4BJ+PBEthTEzU9fE6Mzuy0nXcfHvuJdPkxtlx7x+O
 iJDGuQmyQGLfUEHeLam6Lq/rXclXs77YK/dAXnaUd5u3Fm+EZBmV3rTT49t6A4EE0UdU
 JA2PONEhyRW3qjRrIXlM/1tUV+xFpEwvb+QDdmsluGDcf/h8sWoJwERtCMw51jQP4zvJ
 wXMHMNCZCishPa0U2/U+NTa6jZ1RJ96OUOTKJnORjNUr/HB7+RmjO30m4x7HxiVCVPsJ
 TvzA==
X-Gm-Message-State: AOAM530qGxo7zixghixA90qWDU1BbrPLAUDaDzGfoGthZ+N/3YdboeRm
 0uMnHZmyrEOgbPGQ0leOYJbWVVZ40o03mWxPgUI6J1ZRfq/TelghDyiak0zWqAJSGIn7KnSwDpv
 AwfGOOUg8h2uoRJOjI2stNwALM8Ha5uA=
X-Received: by 2002:a81:df0b:: with SMTP id c11mr4419532ywn.49.1644318903800; 
 Tue, 08 Feb 2022 03:15:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrQ2wRPN/HaPd60E1pW8yIT+ETHbywqowNlGCzdP/tSIGwcwXZIjmV0LFipn1DM5/kQjkuFqF7ZSwnS8iEWCE=
X-Received: by 2002:a81:df0b:: with SMTP id c11mr4419514ywn.49.1644318903609; 
 Tue, 08 Feb 2022 03:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-21-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-21-pbonzini@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:14:52 +0200
Message-ID: <CAPMcbCprEY8S2GwW-pUQquLNC7T9R-D09H2VwAdV2BT6sfVLEw@mail.gmail.com>
Subject: Re: [PATCH 20/27] qga/vss-win32: use widl if available
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000025c1a405d77fd43f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000025c1a405d77fd43f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 3, 2022 at 8:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> widl from mingw64-tools and wine can compile a TLB file.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qga/vss-win32/meson.build | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 78bdf5e74a..8f3aff5fe3 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -18,15 +18,18 @@ if add_languages('cpp', required: false)
>    all_qga +=3D qga_vss
>  endif
>
> -# rules to build qga-vss.tlb
> -# Currently, only native build is supported because building .tlb
> -# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in
> VC++).
>  midl =3D find_program('midl', required: false)
> +widl =3D find_program('widl', required: false)
>  if midl.found()
>    gen_tlb =3D custom_target('gen-tlb',
>                            input: 'qga-vss.idl',
>                            output: 'qga-vss.tlb',
>                            command: [midl, '@INPUT@', '/tlb', '@OUTPUT@']=
)
> +elif widl.found()
> +  gen_tlb =3D custom_target('gen-tlb',
> +                          input: 'qga-vss.idl',
> +                          output: 'qga-vss.tlb',
> +                          command: [widl, '-t', '@INPUT@', '-o',
> '@OUTPUT@'])
>  else
>    gen_tlb =3D custom_target('gen-tlb',
>                            input: 'qga-vss.tlb',
> --
> 2.34.1
>
>
>
>

--00000000000025c1a405d77fd43f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kk=
ostiuk@redhat.com">kkostiuk@redhat.com</a>&gt;</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 8:08 P=
M Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
widl from mingw64-tools and wine can compile a TLB file.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/meson.build | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 78bdf5e74a..8f3aff5fe3 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -18,15 +18,18 @@ if add_languages(&#39;cpp&#39;, required: false)<br>
=C2=A0 =C2=A0all_qga +=3D qga_vss<br>
=C2=A0endif<br>
<br>
-# rules to build qga-vss.tlb<br>
-# Currently, only native build is supported because building .tlb<br>
-# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in VC++=
).<br>
=C2=A0midl =3D find_program(&#39;midl&#39;, required: false)<br>
+widl =3D find_program(&#39;widl&#39;, required: false)<br>
=C2=A0if midl.found()<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.idl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0command: [midl, &#39;@INPUT@&#39;, &#39;/tlb&#39;, =
&#39;@OUTPUT@&#39;])<br>
+elif widl.found()<br>
+=C2=A0 gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 input: &#39;qga-vss.idl&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 output: &#39;qga-vss.tlb&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#39;-o&=
#39;, &#39;@OUTPUT@&#39;])<br>
=C2=A0else<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.tlb&#39;,<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000025c1a405d77fd43f--


