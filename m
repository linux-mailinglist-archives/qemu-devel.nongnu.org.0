Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53E31D9C7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:56:13 +0100 (CET)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMNI-0003rQ-7N
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lCMMN-0003K9-M8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:55:15 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:39352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lCMMH-00020a-N1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:55:13 -0500
Received: by mail-qv1-xf34.google.com with SMTP id y10so6169178qvo.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GJ23AoUhjKim9Rnu6mo0lfVAGO+budPY0azTOi7KMQM=;
 b=e9CuUXL09sUwbDmFyYVFsFGWp/br/5bdXz3HcuzfJnjVjFA7TpAl2xd2BS2cj4Qwe6
 rMixnkHDxlBQ26fa4oh83BmTWUR0qJWFA8Ut0RR8BF85y5LP16W+NYbsYgl+FaqUX1bc
 4J/u+gG+3yG52E4RVPBypzw3/WIzKOchZhNcNH7CHnH1Z82qGQo8MBYhR87TKlSDQtHu
 DVEuLQEuBScR7Vx+IAl4YNRE4kHxxG2fO7EWN01EWYBHi0+7EJsna8/IM9EMt50IyzvT
 lJ2GNSg+t/gKcnkWLKc7Exavet0uxHtxmJB7B52OjZ/fMhmqBvrb7J8lmgMAyw4VyM9I
 ramw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GJ23AoUhjKim9Rnu6mo0lfVAGO+budPY0azTOi7KMQM=;
 b=EaNaYesZTF03hzjNDb9to+OHvLouES0EqYziJhF5z8L1WblgTJGu5b7GclqL1FK4dY
 NdZo/cdf7Z++WapXZRwqJiTd7Osa5+K03/w07wBHyCCeYcdxqSD703LCq/XfgbthJNL6
 IUhZsoIbKbB618mo6VXmfjGVnGMhYZSMdx1dJOA/3wDGrIt4fSWD4FBP89Vplpz49q7L
 5z9R8mxjEqIQbtuSle0WV5mMh9q9ulufoDWu06pYVHxdbvKm90xl0nxZuRQSw9heKxT8
 h7jCdlIYjuIxf2XV35FjyHcZ+fnYAeHxClF51MuzpOpFKGb7+lnuzJrLt7PlldjdkMYA
 /BBw==
X-Gm-Message-State: AOAM531dXDzGxK2OnmeCUiGlYIAx/3uKjdp6t9+r9TNB9IprwINJVA6i
 iUrgK0YbEt4rwbuvUUeNlRHTkg4vUx6lYtgfBHVXnzGhVJI=
X-Google-Smtp-Source: ABdhPJxc4aSE+Xkbxv3isCo+CjVqyzR11VWo67HHdefcvtNfJ+T6s1lw9zQtCsezQLBSPCjbflgl5/g+UyVnp+i3+GU=
X-Received: by 2002:ad4:55aa:: with SMTP id f10mr2348692qvx.46.1613566508216; 
 Wed, 17 Feb 2021 04:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20210209145423.178611-1-konstantin@daynix.com>
In-Reply-To: <20210209145423.178611-1-konstantin@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 17 Feb 2021 14:54:57 +0200
Message-ID: <CAJ28CFTTu3oSAGJWe8Crs9s9yqB9wJgudGLcucireDH8dSvrAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] qga-vss: Use dynamic linking for GLib
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008b474d05bb87bac0"
Received-SPF: none client-ip=2607:f8b0:4864:20::f34;
 envelope-from=konstantin@daynix.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008b474d05bb87bac0
Content-Type: text/plain; charset="UTF-8"

ping

On Tue, Feb 9, 2021 at 4:54 PM Kostiantyn Kostiuk <konstantin@daynix.com>
wrote:

> The current GLib version implements the DllMain function. DllMain is also
> present in the provider.cpp code. So in the case of static linking, the
> DllMain redefinition error occurs. For now, just switch to dynamic linking
> and revert this patch when the issue will be solved.
>
> See Glib issue for more details
> https://gitlab.gnome.org/GNOME/glib/-/issues/692
>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/vss-win32/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 780c461432..90825edef3 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -1,5 +1,5 @@
>  if add_languages('cpp', required: false)
> -  glib_static = dependency('glib-2.0', static: true)
> +  glib_dynamic = dependency('glib-2.0', static: false)
>    link_args = cc.get_supported_link_arguments(['-fstack-protector-all',
> '-fstack-protector-strong',
>                                                 '-Wl,--add-stdcall-alias',
> '-Wl,--enable-stdcall-fixup'])
>
> @@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
>                  cpp_args: ['-Wno-unknown-pragmas',
> '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
>                  link_args: link_args,
>                  vs_module_defs: 'qga-vss.def',
> -                dependencies: [glib_static, socket,
> +                dependencies: [glib_dynamic, socket,
>                                 cc.find_library('ole32'),
>                                 cc.find_library('oleaut32'),
>                                 cc.find_library('shlwapi'),
> --
> 2.25.1
>
>

--0000000000008b474d05bb87bac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 4:54 PM Ko=
stiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@da=
ynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The current GLib version implements the DllMain function. DllMain i=
s also<br>
present in the provider.cpp code. So in the case of static linking, the<br>
DllMain redefinition error occurs. For now, just switch to dynamic linking<=
br>
and revert this patch when the issue will be solved.<br>
<br>
See Glib issue for more details <a href=3D"https://gitlab.gnome.org/GNOME/g=
lib/-/issues/692" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome=
.org/GNOME/glib/-/issues/692</a><br>
<br>
Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.c=
om" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/meson.build | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 780c461432..90825edef3 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -1,5 +1,5 @@<br>
=C2=A0if add_languages(&#39;cpp&#39;, required: false)<br>
-=C2=A0 glib_static =3D dependency(&#39;glib-2.0&#39;, static: true)<br>
+=C2=A0 glib_dynamic =3D dependency(&#39;glib-2.0&#39;, static: false)<br>
=C2=A0 =C2=A0link_args =3D cc.get_supported_link_arguments([&#39;-fstack-pr=
otector-all&#39;, &#39;-fstack-protector-strong&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;-Wl,--add-stdcall-alias&#39;, &#39;-Wl,--enable-s=
tdcall-fixup&#39;])<br>
<br>
@@ -8,7 +8,7 @@ if add_languages(&#39;cpp&#39;, required: false)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpp_args: [&#=
39;-Wno-unknown-pragmas&#39;, &#39;-Wno-delete-non-virtual-dtor&#39;, &#39;=
-Wno-non-virtual-dtor&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: li=
nk_args,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs_module_def=
s: &#39;qga-vss.def&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [gli=
b_static, socket,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [gli=
b_dynamic, socket,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.find_library(&#39;ole32&#39;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.find_library(&#39;oleaut32&#39;),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.find_library(&#39;shlwapi&#39;),<=
br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000008b474d05bb87bac0--

