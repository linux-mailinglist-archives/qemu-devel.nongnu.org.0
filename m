Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281E4AD7C6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:48:53 +0100 (CET)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOzM-0005jc-NF
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOSX-0001FK-AY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOSV-00069v-JU
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XfgDReLZbAyRLhc/2gmn6lTs46EQjf1QJrRoFOyn2Ks=;
 b=CjNWwgWZ73vkuePqCC0PaLnfi8Ar2i9Aj5wFwVcrzpfumu4QJBGJeIEhO2Puwv79QMvfmv
 RlGCrWNHfIt41l8k1gxHB7Zzu0A3I+su2v4BRboyi3lMO26xzfbxseIV3ATBkzjuErM9OY
 wpPcLQ8qA6LkwQdh9YXsyIfDRqQltII=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-kUALP18tOqC9bazhlz0T_A-1; Tue, 08 Feb 2022 06:14:53 -0500
X-MC-Unique: kUALP18tOqC9bazhlz0T_A-1
Received: by mail-yb1-f199.google.com with SMTP id
 127-20020a250f85000000b00611ab6484abso34571531ybp.23
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfgDReLZbAyRLhc/2gmn6lTs46EQjf1QJrRoFOyn2Ks=;
 b=ScCyGCsBR3T9sGYrj6BHJXMgzIkwYqbfgeQID0X4ir77/i04R0TGwEsyM8zqkIzbHP
 dRf23S65reeIIHvqF22qMaTFZuu8vMsNLqM4o6Z0nRdBW1ang7Gbk+9reGOqGPDmwlP8
 qp8CSDDW3gH8TdLBnARCH7UFLPeywA4iProf8WSo2nH9YgCGoKhr9vxVPIlVBx/bcozC
 4hE/DJjG4rTEdOXfG2eyAp8GhXwr1d+TPzqAvJRt+YbBbjIxpX1QuuTgPNEAs2lT07gO
 GKAem2aQBA+7SFuEKw+cIkcDKIPdI8RoOClV3tOrqRVZBOEiUs6CiicN7OBxJLHNo/9Y
 5uUA==
X-Gm-Message-State: AOAM530WDsB2q3o3NTFwvZHGBI1MvBpGBNNpTz57zbgFenAF/ybQ6OZN
 4ojsMa41FWdALFLlmEQDFj5DPytAhkpa/uAfE5QaV88I8V0DGE0FqcY6dN4ih8BSa7lTj2eGMk5
 kHYsLUjsug9jrLABqSjO4T5p7IDYSLI8=
X-Received: by 2002:a81:e445:: with SMTP id t5mr4193210ywl.481.1644318892717; 
 Tue, 08 Feb 2022 03:14:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZVEwu+hF57bKtpYmOAa5FVSlHEXIyfMd7+GOX7xzLX30HFj51y5hgfDylYXH8yXaKptmhuIumTTN4h1dArIA=
X-Received: by 2002:a81:e445:: with SMTP id t5mr4193140ywl.481.1644318891525; 
 Tue, 08 Feb 2022 03:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-24-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-24-pbonzini@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:14:40 +0200
Message-ID: <CAPMcbCqR3Cd2Yo337yvHNPpbCLj_p9M3y2FiK1kTAV+Au2wcqA@mail.gmail.com>
Subject: Re: [PATCH 23/27] meson: do not make qga/vss-win32/meson.build
 conditional on C++ presence
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006d5c5e05d77fd398"
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

--0000000000006d5c5e05d77fd398
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Feb 3, 2022 at 8:14 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> C++ presence is checked by the qga/ directory, so it can be assumed
> when building VSS module.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qga/vss-win32/meson.build | 41 +++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 8f3aff5fe3..8d4c5708d8 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -1,22 +1,29 @@
> -if add_languages('cpp', required: false)
> -  glib_dynamic =3D dependency('glib-2.0', static: false)
> -  link_args =3D cc.get_supported_link_arguments(['-fstack-protector-all'=
,
> '-fstack-protector-strong',
> -                                               '-Wl,--add-stdcall-alias'=
,
> '-Wl,--enable-stdcall-fixup'])
> +glib_dynamic =3D dependency('glib-2.0', static: false)
> +link_args =3D cc.get_supported_link_arguments([
> +  '-fstack-protector-all',
> +  '-fstack-protector-strong',
> +  '-Wl,--add-stdcall-alias',
> +  '-Wl,--enable-stdcall-fixup'
> +])
>
> -  qga_vss =3D shared_module('qga-vss', ['requester.cpp', 'provider.cpp',
> 'install.cpp'],
> -                name_prefix: '',
> -                cpp_args: ['-Wno-unknown-pragmas',
> '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
> -                link_args: link_args,
> -                vs_module_defs: 'qga-vss.def',
> -                dependencies: [glib_dynamic, socket,
> -                               cc.find_library('ole32'),
> -                               cc.find_library('oleaut32'),
> -                               cc.find_library('shlwapi'),
> -                               cc.find_library('uuid'),
> -                               cc.find_library('intl')])
> +qga_vss =3D shared_module(
> +  'qga-vss',
> +  ['requester.cpp', 'provider.cpp', 'install.cpp'],
> +  name_prefix: '',
> +  cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor',
> '-Wno-non-virtual-dtor'],
> +  link_args: link_args,
> +  vs_module_defs: 'qga-vss.def',
> +  dependencies: [
> +    glib_dynamic, socket,
> +    cc.find_library('ole32'),
> +    cc.find_library('oleaut32'),
> +    cc.find_library('shlwapi'),
> +    cc.find_library('uuid'),
> +    cc.find_library('intl')
> +  ]
> +)
>
> -  all_qga +=3D qga_vss
> -endif
> +all_qga +=3D qga_vss
>
>  midl =3D find_program('midl', required: false)
>  widl =3D find_program('widl', required: false)
> --
> 2.34.1
>
>
>
>

--0000000000006d5c5e05d77fd398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kk=
ostiuk@redhat.com">kkostiuk@redhat.com</a>&gt;</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 8:14 P=
M Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
C++ presence is checked by the qga/ directory, so it can be assumed<br>
when building VSS module.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/meson.build | 41 +++++++++++++++++++++++---------------=
-<br>
=C2=A01 file changed, 24 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 8f3aff5fe3..8d4c5708d8 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -1,22 +1,29 @@<br>
-if add_languages(&#39;cpp&#39;, required: false)<br>
-=C2=A0 glib_dynamic =3D dependency(&#39;glib-2.0&#39;, static: false)<br>
-=C2=A0 link_args =3D cc.get_supported_link_arguments([&#39;-fstack-protect=
or-all&#39;, &#39;-fstack-protector-strong&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&#39;-Wl,--add-stdcall-alias&#39;, &#39;-Wl,--enable-st=
dcall-fixup&#39;])<br>
+glib_dynamic =3D dependency(&#39;glib-2.0&#39;, static: false)<br>
+link_args =3D cc.get_supported_link_arguments([<br>
+=C2=A0 &#39;-fstack-protector-all&#39;,<br>
+=C2=A0 &#39;-fstack-protector-strong&#39;,<br>
+=C2=A0 &#39;-Wl,--add-stdcall-alias&#39;,<br>
+=C2=A0 &#39;-Wl,--enable-stdcall-fixup&#39;<br>
+])<br>
<br>
-=C2=A0 qga_vss =3D shared_module(&#39;qga-vss&#39;, [&#39;requester.cpp&#3=
9;, &#39;provider.cpp&#39;, &#39;install.cpp&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name_prefix: &#39;=
&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args: [&#39;-W=
no-unknown-pragmas&#39;, &#39;-Wno-delete-non-virtual-dtor&#39;, &#39;-Wno-=
non-virtual-dtor&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: link_ar=
gs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs_module_defs: &#=
39;qga-vss.def&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [gli=
b_dynamic, socket,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;ole32&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;oleaut32&#39;),<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;shlwapi&#39;),<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;uuid&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;intl&#39;)])<br>
+qga_vss =3D shared_module(<br>
+=C2=A0 &#39;qga-vss&#39;,<br>
+=C2=A0 [&#39;requester.cpp&#39;, &#39;provider.cpp&#39;, &#39;install.cpp&=
#39;],<br>
+=C2=A0 name_prefix: &#39;&#39;,<br>
+=C2=A0 cpp_args: [&#39;-Wno-unknown-pragmas&#39;, &#39;-Wno-delete-non-vir=
tual-dtor&#39;, &#39;-Wno-non-virtual-dtor&#39;],<br>
+=C2=A0 link_args: link_args,<br>
+=C2=A0 vs_module_defs: &#39;qga-vss.def&#39;,<br>
+=C2=A0 dependencies: [<br>
+=C2=A0 =C2=A0 glib_dynamic, socket,<br>
+=C2=A0 =C2=A0 cc.find_library(&#39;ole32&#39;),<br>
+=C2=A0 =C2=A0 cc.find_library(&#39;oleaut32&#39;),<br>
+=C2=A0 =C2=A0 cc.find_library(&#39;shlwapi&#39;),<br>
+=C2=A0 =C2=A0 cc.find_library(&#39;uuid&#39;),<br>
+=C2=A0 =C2=A0 cc.find_library(&#39;intl&#39;)<br>
+=C2=A0 ]<br>
+)<br>
<br>
-=C2=A0 all_qga +=3D qga_vss<br>
-endif<br>
+all_qga +=3D qga_vss<br>
<br>
=C2=A0midl =3D find_program(&#39;midl&#39;, required: false)<br>
=C2=A0widl =3D find_program(&#39;widl&#39;, required: false)<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006d5c5e05d77fd398--


