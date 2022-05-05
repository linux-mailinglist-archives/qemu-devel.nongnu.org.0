Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3951BB86
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:10:55 +0200 (CEST)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXVe-0001zU-1r
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWkV-0006tD-8p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:22:14 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWkR-0000hQ-6L
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:22:09 -0400
Received: by mail-lj1-x231.google.com with SMTP id l19so4631421ljb.7
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMHDl+sen8pqzKFwEH6b24BepcfJPdpCmPLodKwHAxk=;
 b=ETiMVXYezpAJceX0e5k2M29CVjy30djlP1HtQ1tg6IZtU1uILvQgb4UigRszjizFgj
 MgoMqb85tSCdQMUHX6LCD1akV4nllMMgVzdHzLxKcl38Bk9DOS4kmE8KViMCgZMPh0BC
 u3JQoOip/nX9HZ58nwlEzBhqN2rFzVUCaR4O2jKVToAbRjWNkE9HUe56UmnEsEOUNQ2f
 bOpl8dCKw0S5AUzllZGHO+zm03clveM4Pcq2dAIPURQVOyVWzHgZ4oy+F+tpyoIeLf1h
 uJT0SNHaOwQZ2o2MMY4PKUnyy+LchFtNiqPzp21sDbo2gWkoGo4DOCzhAFLq5MjlhPFX
 p+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMHDl+sen8pqzKFwEH6b24BepcfJPdpCmPLodKwHAxk=;
 b=ZNA45V+AwozzpKbpujd4B697+SRRcYvZ/T+w6E6KKBkq64d0+Oj9j7kL9neJsHwQxB
 GI6vzc/SXXRzQ1ZB/uzv4yK35GojRWED+PVeqN7uaVgg+FEP7c+nR7q+cjdxwERDyVBG
 a4dJR6yr7Sjvjqwj4JCXT3nKVKHTnh7jpHORRxvNxnx0J3iP/tPytfNda6EdK5349Kqa
 xlcrVDuYsD50dccxgbN4wR8rSkTs7GTd5glOMtWvs5vNdetsylQrMNwCUeG1NSpDl64N
 BbT2WAURQiwMP8En9G82wBohC4yP2BQfFA+qZzxbrFcZaRdr5x3Z2+KHOqlrpPq9VxIi
 9x2w==
X-Gm-Message-State: AOAM531+FzfIRUkXFXmOMoz1ikmNuuEXpBbfIeNBLM+YOCS3BxfFDlRf
 8WL//MlnuOhBhDY8300OgQpbNLzs8j/OLmUxTDM=
X-Google-Smtp-Source: ABdhPJzBQrtQV/82Tceb7PirTrgR51yEhntPIHtRsRI3RthGvE6BIwRPteIBT7SFo3Eu6VMuD21tHossdQ/v2YTWkV0=
X-Received: by 2002:a2e:bc26:0:b0:24f:528f:fb9f with SMTP id
 b38-20020a2ebc26000000b0024f528ffb9fmr12163346ljf.344.1651738925551; Thu, 05
 May 2022 01:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-6-pbonzini@redhat.com>
In-Reply-To: <20220504210001.678419-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:21:54 +0400
Message-ID: <CAJ+F1CLCN_1AhnXA_sUhwQq5Rrf23wAccCkPZ5FYVuLd7KtZLg@mail.gmail.com>
Subject: Re: [PATCH 5/5] net: slirp: allow CFI with libslirp >= 4.7
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000eb527305de3f6f22"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
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

--000000000000eb527305de3f6f22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 1:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> slirp 4.7 introduces a new CFI-friendly timer callback that does
> not pass function pointers within libslirp as callbacks for timers.
> Check the version number and, if it is new enough, allow using CFI
> even with a system libslirp.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index c26aa442d4..defe604065 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2509,10 +2509,25 @@ if have_system
>    slirp_opt =3D get_option('slirp')
>    if slirp_opt in ['enabled', 'auto', 'system']
>      have_internal =3D fs.exists(meson.current_source_dir() /
> 'slirp/meson.build')
> +    slirp_dep_required =3D (slirp_opt =3D=3D 'system' or
> +                          slirp_opt =3D=3D 'enabled' and not have_intern=
al)
>      slirp =3D dependency('slirp', kwargs: static_kwargs,
>                         method: 'pkg-config',
> -                       required: slirp_opt =3D=3D 'system' or
> -                                 slirp_opt =3D=3D 'enabled' and not
> have_internal)
> +                       required: slirp_dep_required)
> +    # slirp <4.7 is incompatible with CFI support in QEMU.  This is
> because
> +    # it passes function pointers within libslirp as callbacks for timer=
s.
> +    # When using a system-wide shared libslirp, the type information for
> the
> +    # callback is missing and the timer call produces a false positive
> with CFI.
> +    # Do not use the "version" keyword argument to produce a better erro=
r.
> +    # with control-flow integrity.
> +    if get_option('cfi') and slirp.found() and
> slirp.version().version_compare('<4.7')
> +      if slirp_dep_required
> +        error('Control-Flow Integrity requires libslirp 4.7.')
> +      else
> +        warning('Control-Flow Integrity requires libslirp 4.7, not using
> system-wide libslirp.')
> +        slirp =3D not_found
> +      endif
> +    endif
>      if slirp.found()
>        slirp_opt =3D 'system'
>      elif have_internal
> @@ -2585,18 +2600,6 @@ if have_system
>    endif
>  endif
>
> -# For CFI, we need to compile slirp as a static library together with
> qemu.
> -# This is because we register slirp functions as callbacks for QEMU
> Timers.
> -# When using a system-wide shared libslirp, the type information for the
> -# callback is missing and the timer call produces a false positive with
> CFI.
> -#
> -# Now that slirp_opt has been defined, check if the selected slirp is
> compatible
> -# with control-flow integrity.
> -if get_option('cfi') and slirp_opt =3D=3D 'system'
> -  error('Control-Flow Integrity is not compatible with system-wide
> slirp.' \
> -         + ' Please configure with --enable-slirp=3Dgit')
> -endif
> -
>  fdt =3D not_found
>  if have_system
>    fdt_opt =3D get_option('fdt')
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000eb527305de3f6f22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 1:04 AM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">sli=
rp 4.7 introduces a new CFI-friendly timer callback that does<br>
not pass function pointers within libslirp as callbacks for timers.<br>
Check the version number and, if it is new enough, allow using CFI<br>
even with a system libslirp.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 31 +++++++++++++++++--------------<br>
=C2=A01 file changed, 17 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c26aa442d4..defe604065 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2509,10 +2509,25 @@ if have_system<br>
=C2=A0 =C2=A0slirp_opt =3D get_option(&#39;slirp&#39;)<br>
=C2=A0 =C2=A0if slirp_opt in [&#39;enabled&#39;, &#39;auto&#39;, &#39;syste=
m&#39;]<br>
=C2=A0 =C2=A0 =C2=A0have_internal =3D fs.exists(meson.current_source_dir() =
/ &#39;slirp/meson.build&#39;)<br>
+=C2=A0 =C2=A0 slirp_dep_required =3D (slirp_opt =3D=3D &#39;system&#39; or=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 slirp_opt =3D=3D &#39;enabled&#39; and not have_internal)=
<br>
=C2=A0 =C2=A0 =C2=A0slirp =3D dependency(&#39;slirp&#39;, kwargs: static_kw=
args,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 method: &#39;pkg-config&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0required: slirp_opt =3D=3D &#39;system&#39; or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slirp_opt =3D=3D &#39;enabled&=
#39; and not have_internal)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0required: slirp_dep_required)<br>
+=C2=A0 =C2=A0 # slirp &lt;4.7 is incompatible with CFI support in QEMU.=C2=
=A0 This is because<br>
+=C2=A0 =C2=A0 # it passes function pointers within libslirp as callbacks f=
or timers.<br>
+=C2=A0 =C2=A0 # When using a system-wide shared libslirp, the type informa=
tion for the<br>
+=C2=A0 =C2=A0 # callback is missing and the timer call produces a false po=
sitive with CFI.<br>
+=C2=A0 =C2=A0 # Do not use the &quot;version&quot; keyword argument to pro=
duce a better error.<br>
+=C2=A0 =C2=A0 # with control-flow integrity.<br>
+=C2=A0 =C2=A0 if get_option(&#39;cfi&#39;) and slirp.found() and slirp.ver=
sion().version_compare(&#39;&lt;4.7&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 if slirp_dep_required<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;Control-Flow Integrity requires lib=
slirp 4.7.&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning(&#39;Control-Flow Integrity requires l=
ibslirp 4.7, not using system-wide libslirp.&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 slirp =3D not_found<br>
+=C2=A0 =C2=A0 =C2=A0 endif<br>
+=C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 =C2=A0if slirp.found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0slirp_opt =3D &#39;system&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif have_internal<br>
@@ -2585,18 +2600,6 @@ if have_system<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
<br>
-# For CFI, we need to compile slirp as a static library together with qemu=
.<br>
-# This is because we register slirp functions as callbacks for QEMU Timers=
.<br>
-# When using a system-wide shared libslirp, the type information for the<b=
r>
-# callback is missing and the timer call produces a false positive with CF=
I.<br>
-#<br>
-# Now that slirp_opt has been defined, check if the selected slirp is comp=
atible<br>
-# with control-flow integrity.<br>
-if get_option(&#39;cfi&#39;) and slirp_opt =3D=3D &#39;system&#39;<br>
-=C2=A0 error(&#39;Control-Flow Integrity is not compatible with system-wid=
e slirp.&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ &#39; Please configure with --enable-s=
lirp=3Dgit&#39;)<br>
-endif<br>
-<br>
=C2=A0fdt =3D not_found<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0fdt_opt =3D get_option(&#39;fdt&#39;)<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000eb527305de3f6f22--

