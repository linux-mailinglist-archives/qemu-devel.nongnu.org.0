Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F14508D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:37:37 +0200 (CEST)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDKi-0001xv-8F
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhChz-0005K4-6L
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:57:35 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhChw-0004fI-U9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:57:34 -0400
Received: by mail-qk1-x731.google.com with SMTP id b68so1530942qkc.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8OrGe+ZRYDp6N4txSPKgf/BNYi1JuOcCyVSZbMVxxs=;
 b=YXWDxjCg6H+ZXTrLSm8Z4XVN6tRc+jYdVDxBL1E1HSVxlGDnzLiGjIsNx+GK+j2a22
 FgS7T79hWZWJ5baO/r+mkff5PlbtJ1YPVf6SmpHfQiLbEvZy1P3o74IXtHPHXNVte6wg
 aB+g+KUZ8Lr0gX5U5vsIqdtVpSMYuJoqzZ8yudxnOR2PTy8b2ItHo44Kd5NbzRAE6ebd
 oAMplY+cJ1nM75YoP11wV1KRrQa7JUWIcx8hfS9LgYc9HTw3uiIHUKclTovLfQnodC2p
 LxHyfsjUbwes9qM+5jUirZJhfolEi5ByqYILUngIVfTbLPn/ErNeATyrMcP2/cnuSndR
 wYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8OrGe+ZRYDp6N4txSPKgf/BNYi1JuOcCyVSZbMVxxs=;
 b=Q+lRaK4Uw42SL8nj8cWUjgioqYS9vyx1aTxID7GCXmhggtyZ7cOKjxubLhwqTxPocR
 c/fNGOt0GpmJ/ARCe3mYVVxs3rSvZ58uMEmKd72d3/wrMYy21MQuxDA8Jec3HCIcKr0t
 2ZHUqlLmk4o8wRazNTMueFxOIGip4/zGHdVUiNp1iYgBKPnCXPrFI0Ymx+eMLbs+C/6W
 cOPECUgdayHoIC58HJBBvg8930PM/J952JqKJQ2OIHj7dufoTcAAckRub8EeBhrqILGa
 wPpCswbv6qBL+nedHBtVn5PGgDYepcUBE0Uc0e/xWSk+fHbpOb/xXPNO8QkZMLtHl/8/
 lnGw==
X-Gm-Message-State: AOAM530HGOQ56XxMdLvM15AmW1xaKsW0SOfs99OzuJrBTmZv7qPX8Xtz
 yxnybqzb3ICRFSdJO+qzeOQvRqJ9FOjCG0sZeQw=
X-Google-Smtp-Source: ABdhPJyHee4Twwh2BgSupSvDFXVywRgTGfIHQ6/kKarA6sqs8g636lUEJYVvYK+TubOI6UphqZFWAif/zKRcg6QJP14=
X-Received: by 2002:a05:620a:2415:b0:69e:784d:3a4c with SMTP id
 d21-20020a05620a241500b0069e784d3a4cmr12152613qkn.14.1650470251898; Wed, 20
 Apr 2022 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-2-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 19:57:20 +0400
Message-ID: <CAJ+F1C+TfKeCXCKw+iYgdgjACZYsNPm=Z=AaJS7E8OwU-WeT8g@mail.gmail.com>
Subject: Re: [PATCH 01/34] meson: show final set of compiler flags
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000013b95b05dd180d6d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013b95b05dd180d6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:38 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The actual set of compiler flags can grow beyond what is found by the
> configure
> script, for example if gprof is used.  Show the full set in the summary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 6ba60950c8..cf3b1b39cf 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3521,10 +3521,10 @@ link_args =3D get_option(link_language +
> '_link_args')
>  if link_args.length() > 0
>    summary_info +=3D {'LDFLAGS':         ' '.join(link_args)}
>  endif
> -summary_info +=3D {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
> -summary_info +=3D {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
> -summary_info +=3D {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
> -summary_info +=3D {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
> +summary_info +=3D {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
> +summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
> +summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
> +summary_info +=3D {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
>  summary_info +=3D {'profiler':          get_option('profiler')}
>  summary_info +=3D {'link-time optimization (LTO)': get_option('b_lto')}
>  summary_info +=3D {'PIE':               get_option('b_pie')}
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000013b95b05dd180d6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:38 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
actual set of compiler flags can grow beyond what is found by the configure=
<br>
script, for example if gprof is used.=C2=A0 Show the full set in the summar=
y.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 6ba60950c8..cf3b1b39cf 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3521,10 +3521,10 @@ link_args =3D get_option(link_language + &#39;_link=
_args&#39;)<br>
=C2=A0if link_args.length() &gt; 0<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;LDFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39; &#39;.join(link_args)}<br>
=C2=A0endif<br>
-summary_info +=3D {&#39;QEMU_CFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0config=
_host[&#39;QEMU_CFLAGS&#39;]}<br>
-summary_info +=3D {&#39;QEMU_CXXFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0config_host=
[&#39;QEMU_CXXFLAGS&#39;]}<br>
-summary_info +=3D {&#39;QEMU_OBJCFLAGS&#39;:=C2=A0 =C2=A0 config_host[&#39=
;QEMU_OBJCFLAGS&#39;]}<br>
-summary_info +=3D {&#39;QEMU_LDFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
[&#39;QEMU_LDFLAGS&#39;]}<br>
+summary_info +=3D {&#39;QEMU_CFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39; =
&#39;.join(qemu_cflags)}<br>
+summary_info +=3D {&#39;QEMU_CXXFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0&#39; &#39;=
.join(qemu_cxxflags)}<br>
+summary_info +=3D {&#39;QEMU_OBJCFLAGS&#39;:=C2=A0 =C2=A0 &#39; &#39;.join=
(qemu_objcflags)}<br>
+summary_info +=3D {&#39;QEMU_LDFLAGS&#39;:=C2=A0 =C2=A0 =C2=A0 &#39; &#39;=
.join(qemu_ldflags)}<br>
=C2=A0summary_info +=3D {&#39;profiler&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 get_option(&#39;profiler&#39;)}<br>
=C2=A0summary_info +=3D {&#39;link-time optimization (LTO)&#39;: get_option=
(&#39;b_lto&#39;)}<br>
=C2=A0summary_info +=3D {&#39;PIE&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0get_option(&#39;b_pie&#39;)}<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000013b95b05dd180d6d--

