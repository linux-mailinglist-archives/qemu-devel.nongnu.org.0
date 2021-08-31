Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE043FC9A5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:22:04 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4eI-00046C-Nb
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL4Di-00043s-Ux
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL4De-0007Sq-Be
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630418069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0tVaU8DZcm8ZAmdDeLmbu/4Vl8f85fmkA4K+ms7qH6g=;
 b=CUmr3lsdIgRcvhjLSQx6PvKZm2nmJb+0zlnyZP04fqI/07PqGu6H0dkyTzsw9dePs+yACZ
 oA0mBo9w5LJ1nUUjOVUQObuhK24sJWZobTkMfcafl0xniHwws99pv0ROJ9HiRUPdYMIQY8
 aSQnd5qPt7ZTieweb96TEuUnQT+wyfQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-VBJ4IWHEMACOD42f2ShnHA-1; Tue, 31 Aug 2021 09:54:28 -0400
X-MC-Unique: VBJ4IWHEMACOD42f2ShnHA-1
Received: by mail-pl1-f197.google.com with SMTP id
 u12-20020a170902a60c00b00138b944e10fso2362381plq.9
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 06:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tVaU8DZcm8ZAmdDeLmbu/4Vl8f85fmkA4K+ms7qH6g=;
 b=N4/u6DFmhh4OtRk/s2kSbxLhDyl9fihzf0BuOLpoOMZGmt9aOR182Cv9/hYzVU2m/7
 SlqNNbp8vxZ4PAbsRClJK4JGwVgWzYTRSa9zrbfRSy3GfmWd4twujtdGH3x9fZiB9a7v
 rOyX7hSOfYKdFvhcb0EIT6gAMC7vcBPW8aIUqyFvfuh59Mf5rgxfqruGgb13syMGse9M
 gdLjQTWJ1PjKZ9VHN6Srgfj5hPC7gdseWyCNdkigRZiuyEH1hWmXLInINgwtsPGHdXCg
 ESx24lsnoo/sTY8yH/VRnMMftNoQVhTSuqp9+O3aRIb3s5BPsSxQVPk824NHNNdlkVTE
 I4kA==
X-Gm-Message-State: AOAM532XQLJlOITJkrjYtZ2wqH+1l+pKL1RMGgLDL+9YhDzTAzVmk1tx
 DVc8Jus2TArIZ9iutMiJu2tB32+zIHQaqtVwRh3PDgdD3QOMQKVclSc/IBvd5xR2qDie26ZFvgK
 Kgg3JJV7oPG7iSJYGaYHjN/kK94UdKpw=
X-Received: by 2002:a63:25c5:: with SMTP id l188mr3060989pgl.281.1630418066718; 
 Tue, 31 Aug 2021 06:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRsBX1RXDSyrzZJQ7QBrBYHLKUDbBAcxpS8bumH0d7LUdqflorrAgiE7hhiybpy9yuS6E29yJxffGGJUJuBAI=
X-Received: by 2002:a63:25c5:: with SMTP id l188mr3060971pgl.281.1630418066467; 
 Tue, 31 Aug 2021 06:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-3-thuth@redhat.com>
In-Reply-To: <20210825092023.81396-3-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Aug 2021 15:54:14 +0200
Message-ID: <CABgObfbuqJmv7BHNbuTKBU5g0QAMweyLvGtHEB2hyPi2e6Nzog@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] softmmu/vl: Deprecate the old grab options
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000affeb805cadb49d7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Armbruster, Markus" <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000affeb805cadb49d7
Content-Type: text/plain; charset="UTF-8"

No objections at all here, though. :)

Paolo

Il mer 25 ago 2021, 11:20 Thomas Huth <thuth@redhat.com> ha scritto:

> The alt_grab and ctrl_grab parameter of the -display sdl option prevent
> the QAPIfication of the "sdl" part of the -display option, so we should
> eventually remove them. And since this feature is also rather niche anyway,
> we should not clutter the top-level option list with these, so let's
> also deprecate the "-alt-grab" and the "-ctrl-grab" options while we're
> at it.
>
> Once the deprecation period of "alt_grab" and "ctrl_grab" is over, we
> then can finally switch the -display sdl option to use QAPI internally,
> too.
>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  qemu-options.hx           | 12 ++++++++----
>  softmmu/vl.c              |  6 ++++++
>  3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d438f1c8d..868eca0dd4 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -138,6 +138,16 @@ an underscore between "window" and "close").
>  The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
>  should be used instead.
>
> +``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
> +
> +``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use ``-display sdl,grab-mod=rctrl`` instead.
> +
>
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0bff756ded..4f46233527 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1884,9 +1884,11 @@ SRST
>          the mouse grabbing in conjunction with the "g" key. `<mods>` can
> be
>          either `lshift-lctrl-lalt` or `rctrl`.
>
> -        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse
> grabbing
> +        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse
> grabbing.
> +        This parameter is deprecated - use ``grab-mod`` instead.
>
> -        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse
> grabbing
> +        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse
> grabbing.
> +        This parameter is deprecated - use ``grab-mod`` instead.
>
>          ``gl=on|off|core|es`` : Use OpenGL for displaying
>
> @@ -1971,7 +1973,8 @@ SRST
>  ``-alt-grab``
>      Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that
>      this also affects the special keys (for fullscreen, monitor-mode
> -    switching, etc).
> +    switching, etc). This option is deprecated - please use
> +    ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
>  ERST
>
>  DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
> @@ -1981,7 +1984,8 @@ SRST
>  ``-ctrl-grab``
>      Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this
>      also affects the special keys (for fullscreen, monitor-mode
> -    switching, etc).
> +    switching, etc). This option is deprecated - please use
> +    ``-display sdl,grab-mod=rctrl`` instead.
>  ERST
>
>  DEF("no-quit", 0, QEMU_OPTION_no_quit,
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 294990debf..613948ab46 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1043,6 +1043,7 @@ static void parse_display(const char *p)
>                  } else {
>                      goto invalid_sdl_args;
>                  }
> +                warn_report("alt_grab is deprecated, use grab-mod
> instead.");
>              } else if (strstart(opts, ",ctrl_grab=", &nextopt)) {
>                  opts = nextopt;
>                  if (strstart(opts, "on", &nextopt)) {
> @@ -1052,6 +1053,7 @@ static void parse_display(const char *p)
>                  } else {
>                      goto invalid_sdl_args;
>                  }
> +                warn_report("ctrl_grab is deprecated, use grab-mod
> instead.");
>              } else if (strstart(opts, ",window_close=", &nextopt) ||
>                         strstart(opts, ",window-close=", &nextopt)) {
>                  if (strstart(opts, ",window_close=", NULL)) {
> @@ -3253,9 +3255,13 @@ void qemu_init(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_alt_grab:
>                  alt_grab = 1;
> +                warn_report("-alt-grab is deprecated, please use "
> +                            "-display sdl,grab-mod=lshift-lctrl-lalt
> instead.");
>                  break;
>              case QEMU_OPTION_ctrl_grab:
>                  ctrl_grab = 1;
> +                warn_report("-ctrl-grab is deprecated, please use "
> +                            "-display sdl,grab-mod=rctrl instead.");
>                  break;
>              case QEMU_OPTION_no_quit:
>                  dpy.has_window_close = true;
> --
> 2.27.0
>
>

--000000000000affeb805cadb49d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No objections at all here, though. :)<div dir=3D"auto"><b=
r></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Il mer 25 ago 2021, 11:20 Thomas Huth =
&lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The alt_grab and ctrl_grab parame=
ter of the -display sdl option prevent<br>
the QAPIfication of the &quot;sdl&quot; part of the -display option, so we =
should<br>
eventually remove them. And since this feature is also rather niche anyway,=
<br>
we should not clutter the top-level option list with these, so let&#39;s<br=
>
also deprecate the &quot;-alt-grab&quot; and the &quot;-ctrl-grab&quot; opt=
ions while we&#39;re<br>
at it.<br>
<br>
Once the deprecation period of &quot;alt_grab&quot; and &quot;ctrl_grab&quo=
t; is over, we<br>
then can finally switch the -display sdl option to use QAPI internally,<br>
too.<br>
<br>
Acked-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">pkrempa@redhat.com</a>&gt;<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/about/deprecated.rst | 10 ++++++++++<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++=
----<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
6 ++++++<br>
=C2=A03 files changed, 24 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst<br>
index 6d438f1c8d..868eca0dd4 100644<br>
--- a/docs/about/deprecated.rst<br>
+++ b/docs/about/deprecated.rst<br>
@@ -138,6 +138,16 @@ an underscore between &quot;window&quot; and &quot;clo=
se&quot;).<br>
=C2=A0The ``-no-quit`` is a synonym for ``-display ...,window-close=3Doff``=
 which<br>
=C2=A0should be used instead.<br>
<br>
+``-alt-grab`` and ``-display sdl,alt_grab=3Don`` (since 6.2)<br>
+&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
+<br>
+Use ``-display sdl,grab-mod=3Dlshift-lctrl-lalt`` instead.<br>
+<br>
+``-ctrl-grab`` and ``-display sdl,ctrl_grab=3Don`` (since 6.2)<br>
+&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;<br>
+<br>
+Use ``-display sdl,grab-mod=3Drctrl`` instead.<br>
+<br>
<br>
=C2=A0QEMU Machine Protocol (QMP) commands<br>
=C2=A0------------------------------------<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 0bff756ded..4f46233527 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -1884,9 +1884,11 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the mouse grabbing in conjunction with th=
e &quot;g&quot; key. `&lt;mods&gt;` can be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0either `lshift-lctrl-lalt` or `rctrl`.<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``alt_grab=3Don|off`` : Use Control+Alt+Shift-=
g to toggle mouse grabbing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``alt_grab=3Don|off`` : Use Control+Alt+Shift-=
g to toggle mouse grabbing.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This parameter is deprecated - use ``grab-mod`=
` instead.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``ctrl_grab=3Don|off`` : Use Right-Control-g t=
o toggle mouse grabbing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ``ctrl_grab=3Don|off`` : Use Right-Control-g t=
o toggle mouse grabbing.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This parameter is deprecated - use ``grab-mod`=
` instead.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0``gl=3Don|off|core|es`` : Use OpenGL for =
displaying<br>
<br>
@@ -1971,7 +1973,8 @@ SRST<br>
=C2=A0``-alt-grab``<br>
=C2=A0 =C2=A0 =C2=A0Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt).=
 Note that<br>
=C2=A0 =C2=A0 =C2=A0this also affects the special keys (for fullscreen, mon=
itor-mode<br>
-=C2=A0 =C2=A0 switching, etc).<br>
+=C2=A0 =C2=A0 switching, etc). This option is deprecated - please use<br>
+=C2=A0 =C2=A0 ``-display sdl,grab-mod=3Dlshift-lctrl-lalt`` instead.<br>
=C2=A0ERST<br>
<br>
=C2=A0DEF(&quot;ctrl-grab&quot;, 0, QEMU_OPTION_ctrl_grab,<br>
@@ -1981,7 +1984,8 @@ SRST<br>
=C2=A0``-ctrl-grab``<br>
=C2=A0 =C2=A0 =C2=A0Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Not=
e that this<br>
=C2=A0 =C2=A0 =C2=A0also affects the special keys (for fullscreen, monitor-=
mode<br>
-=C2=A0 =C2=A0 switching, etc).<br>
+=C2=A0 =C2=A0 switching, etc). This option is deprecated - please use<br>
+=C2=A0 =C2=A0 ``-display sdl,grab-mod=3Drctrl`` instead.<br>
=C2=A0ERST<br>
<br>
=C2=A0DEF(&quot;no-quit&quot;, 0, QEMU_OPTION_no_quit,<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 294990debf..613948ab46 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -1043,6 +1043,7 @@ static void parse_display(const char *p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto invalid_sdl_args;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
alt_grab is deprecated, use grab-mod instead.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strstart(opts, &=
quot;,ctrl_grab=3D&quot;, &amp;nextopt)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opts =3D next=
opt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstart(=
opts, &quot;on&quot;, &amp;nextopt)) {<br>
@@ -1052,6 +1053,7 @@ static void parse_display(const char *p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto invalid_sdl_args;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
ctrl_grab is deprecated, use grab-mod instead.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strstart(opts, &=
quot;,window_close=3D&quot;, &amp;nextopt) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strstart(opts, &quot;,window-close=3D&quot;, &amp;nextopt)) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstart(=
opts, &quot;,window_close=3D&quot;, NULL)) {<br>
@@ -3253,9 +3255,13 @@ void qemu_init(int argc, char **argv, char **envp)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_alt_grab:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alt_grab =3D =
1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
-alt-grab is deprecated, please use &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-display sdl,grab-mod=3Dlshift-lctrl-lalt in=
stead.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_ctrl_grab:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_grab =3D=
 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
-ctrl-grab is deprecated, please use &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-display sdl,grab-mod=3Drctrl instead.&quot;=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_no_quit:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy.has_windo=
w_close =3D true;<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--000000000000affeb805cadb49d7--


