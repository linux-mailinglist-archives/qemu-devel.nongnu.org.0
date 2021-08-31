Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7D3FC8F7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:56:40 +0200 (CEST)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4Fj-0004qS-Vy
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL4Cw-00021P-3d
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL4Cs-0006uc-9w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630418021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3A6yWP4GSf3lmqSROmJMpxAIHeRt1SNOAPM8oGQprw=;
 b=f7BTXv1JYyoZLjsGkE1kWyN8OPcG8VXVIu1bNeVg7+jZ8On0+SZfF69i56v257wCdphJHi
 MT4zpp1zlrDbBNjTj42UZGSNcXwemLp+MOsT/aLkYAiaL+1/IqWWmXMXud0h5hm7aecd8B
 q6NcQvnEj9CWzLGGrNdGQYEbexBcpbg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-5iG94fC5OFiwcj_OqppNxg-1; Tue, 31 Aug 2021 09:53:38 -0400
X-MC-Unique: 5iG94fC5OFiwcj_OqppNxg-1
Received: by mail-pg1-f200.google.com with SMTP id
 u5-20020a63d3450000b029023a5f6e6f9bso4351010pgi.21
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 06:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3A6yWP4GSf3lmqSROmJMpxAIHeRt1SNOAPM8oGQprw=;
 b=lj+MuKyjxysY0ne6U74jH1z+eeLGI5uqow6KmS3WC5EZP+1XFMwV8/QDaCrUAExoAx
 E4yHTSDWkOP8npIjZ7TRmNXbRALBDgkQcVmP/vnpnT1a5Itfm2adyNJHijPmdOkBqxdW
 K9PBTIN9QEyAAH7v9T+fjOhfLYqf+GjidGaLVVXa+hbj4QBSD+aGuHgXObUauW0iiath
 qQwfb2q/B/VSmblxqy2vdE5el6OdqDfTa0wwM3e6K18KvrBvnLH7L1E9TBKXQ7QdJYkm
 BCScaTuuZ+h50fot9AsvDSKJVESOqwJC3rC4nwi5oVk5lZBvAOLtGpdvF4FKitqaFWO8
 PyIw==
X-Gm-Message-State: AOAM53216WK9ZoACjVl1viSBNAN9RZ5FBixhgjOR4e+LinL1ZOxQJppb
 G3Bdmfghsv+KVkxC5g8jPBHhmZCed03R/Eat+k7byTPqR9o3/wFzKV336GcBCxvj3cUHQGFRLTs
 qBPU5FguI5S5ZutqI8GUavs95ca//uOU=
X-Received: by 2002:a63:25c5:: with SMTP id l188mr3057707pgl.281.1630418016782; 
 Tue, 31 Aug 2021 06:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/h0JbA76jlf3Ez77/t2sZmFmDnZEPaRKcz1CD00sYhYcflmZemclaA7e0L+vFEGfxuYTyI9vEokIMrKcIYP0=
X-Received: by 2002:a63:25c5:: with SMTP id l188mr3057692pgl.281.1630418016421; 
 Tue, 31 Aug 2021 06:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
In-Reply-To: <20210825092023.81396-4-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Aug 2021 15:53:22 +0200
Message-ID: <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b458c405cadb4626"
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

--000000000000b458c405cadb4626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As an alternative, you may want to turn it into "-display sdl" rather than
poke at dpy. This isn't much more code, but it keeps the shortcut isolated
within a single "case". This follows a lot of recently cleaned up command
line parsing code such as -no-hpet, -enable-kvm, -smp etc.

In the end (spoiler alert for my upcoming KVM Forum presentation=E2=80=94sl=
ides are
already on sched.com :)) what really produces complexity is the lack of
isolation/modularity. As long as UI code doesn't care about command line
parsing, and command line parsing doesn't care about global variables from
all over the place, the cost of shortcuts is so small that it may tilt in
favor of keeping them.

Paolo

Il mer 25 ago 2021, 11:20 Thomas Huth <thuth@redhat.com> ha scritto:

> It's not that much complicated to type "-display sdl" or "-display curses=
",
> so we should not clutter our main option name space with such simple
> wrapper options and rather present the users with a concise interface
> instead. Thus let's deprecate the "-sdl" and "-curses" wrapper options no=
w.
>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  softmmu/vl.c              |  3 +++
>  2 files changed, 13 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 868eca0dd4..d5bec67a78 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -148,6 +148,16 @@ Use ``-display sdl,grab-mod=3Dlshift-lctrl-lalt``
> instead.
>
>  Use ``-display sdl,grab-mod=3Drctrl`` instead.
>
> +``-sdl`` (since 6.2)
> +''''''''''''''''''''
> +
> +Use ``-display sdl`` instead.
> +
> +``-curses`` (since 6.2)
> +'''''''''''''''''''''''
> +
> +Use ``-display curses`` instead.
> +
>
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 613948ab46..bb59dbf0de 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2897,6 +2897,8 @@ void qemu_init(int argc, char **argv, char **envp)
>                  dpy.type =3D DISPLAY_TYPE_NONE;
>                  break;
>              case QEMU_OPTION_curses:
> +                warn_report("-curses is deprecated, "
> +                            "use -display curses instead.");
>  #ifdef CONFIG_CURSES
>                  dpy.type =3D DISPLAY_TYPE_CURSES;
>  #else
> @@ -3270,6 +3272,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                              "-display ...,window-close=3Doff instead.");
>                  break;
>              case QEMU_OPTION_sdl:
> +                warn_report("-sdl is deprecated, use -display sdl
> instead.");
>  #ifdef CONFIG_SDL
>                  dpy.type =3D DISPLAY_TYPE_SDL;
>                  break;
> --
> 2.27.0
>
>

--000000000000b458c405cadb4626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">As an alternative, you may want to turn it into &quot;-di=
splay sdl&quot; rather than poke at dpy. This isn&#39;t much more code, but=
 it keeps the shortcut isolated within a single &quot;case&quot;. This foll=
ows a lot of recently cleaned up command line parsing code such as -no-hpet=
, -enable-kvm, -smp etc.<div dir=3D"auto"><br></div><div dir=3D"auto">In th=
e end (spoiler alert for my upcoming KVM Forum presentation=E2=80=94slides =
are already on <a href=3D"http://sched.com">sched.com</a> :)) what really p=
roduces complexity is the lack of isolation/modularity. As long as UI code =
doesn&#39;t care about command line parsing, and command line parsing doesn=
&#39;t care about global variables from all over the place, the cost of sho=
rtcuts is so small that it may tilt in favor of keeping them.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 25 ago 2021, 11:20 =
Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt=
; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">It&#39;s not that muc=
h complicated to type &quot;-display sdl&quot; or &quot;-display curses&quo=
t;,<br>
so we should not clutter our main option name space with such simple<br>
wrapper options and rather present the users with a concise interface<br>
instead. Thus let&#39;s deprecate the &quot;-sdl&quot; and &quot;-curses&qu=
ot; wrapper options now.<br>
<br>
Acked-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">pkrempa@redhat.com</a>&gt;<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/about/deprecated.rst | 10 ++++++++++<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 +++<br>
=C2=A02 files changed, 13 insertions(+)<br>
<br>
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst<br>
index 868eca0dd4..d5bec67a78 100644<br>
--- a/docs/about/deprecated.rst<br>
+++ b/docs/about/deprecated.rst<br>
@@ -148,6 +148,16 @@ Use ``-display sdl,grab-mod=3Dlshift-lctrl-lalt`` inst=
ead.<br>
<br>
=C2=A0Use ``-display sdl,grab-mod=3Drctrl`` instead.<br>
<br>
+``-sdl`` (since 6.2)<br>
+&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;<br>
+<br>
+Use ``-display sdl`` instead.<br>
+<br>
+``-curses`` (since 6.2)<br>
+&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
+<br>
+Use ``-display curses`` instead.<br>
+<br>
<br>
=C2=A0QEMU Machine Protocol (QMP) commands<br>
=C2=A0------------------------------------<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 613948ab46..bb59dbf0de 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2897,6 +2897,8 @@ void qemu_init(int argc, char **argv, char **envp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy.type =3D =
DISPLAY_TYPE_NONE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_curses:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
-curses is deprecated, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;use -display curses instead.&quot;);<br>
=C2=A0#ifdef CONFIG_CURSES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy.type =3D =
DISPLAY_TYPE_CURSES;<br>
=C2=A0#else<br>
@@ -3270,6 +3272,7 @@ void qemu_init(int argc, char **argv, char **envp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-display ...,window-close=3Doff instea=
d.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_sdl:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
-sdl is deprecated, use -display sdl instead.&quot;);<br>
=C2=A0#ifdef CONFIG_SDL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy.type =3D =
DISPLAY_TYPE_SDL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--000000000000b458c405cadb4626--


