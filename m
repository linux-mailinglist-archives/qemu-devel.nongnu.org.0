Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6ED349B08
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:33:45 +0100 (CET)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWfo-0004gX-B7
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWdG-0003oV-Ok
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:31:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWdD-000344-VO
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:31:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id bx7so3857933edb.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFY+Hq6FshLxgaDPnG6cxFXCjFy2KN+LBJXAWBWKOtk=;
 b=BXxkNAEcSpvfa/s/wZnCRp6EuNRdEc9tOI1JhFrM4fovq8Q5O4MncA27jPoTPdCbrT
 /qh77PvGcCq4A19GlPF9I2u4IbJbmsGxyQd/++y3KX1rorq+o9m1shWe7x82btyn+jCE
 rf88bWP/zv6Ba5+gBu4PcFi6FJl43oiKwrzkT7mqU3WNH/DuLxKXt/IXNqEHNHZhRF1v
 ft+lZ9lgZiCqhI8l6VXpFF1IRuMFBHYNcubrJwZxd0JBoB7/W+g3Udn/ZPMVPjXYHGGx
 ZWkCfzI4PapO/9nekwzjA1R8DQkzuj1CbHnkdFTw12ViQWDIySWn1iBrjEMdzDxel+so
 EE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFY+Hq6FshLxgaDPnG6cxFXCjFy2KN+LBJXAWBWKOtk=;
 b=bIyNosfnm1iFIuqPsko/FurXwm3GGGmnwkiq8IC5gmTTlOKEF8ZlYgrKApf9rSHZCM
 rurn3dBS71KVPQA/avndTdGNLlBk39WXBVhNFfXPHWGTIwnVjhLdchIZTrXgnMehTWZC
 0Gb80ekTCMz2JScxOftkW5xC/lYopi64KvCywQqlyk1Zuh4alHpTKTrNlU78YJ3qHO8Y
 TB3iQ6jmaMMoRpWd6zjhdn2R3cYyYPcc3e1S8OZjlmz6Ma4dm8EC05wAcxlsqPWyEGP7
 8G9X1nJF/P6EuskULqxfqM2a7DgZxSgDLeWa6v4eIvn7j/Nd6lR7mYWIRcLVrFDqbo3g
 Yyjg==
X-Gm-Message-State: AOAM532QjNTanFjHfm6AkAuVlBUarw28HoL8ol2c16iEczJaKduhup2n
 NfEkpnzdGqynkUtU+09JyrZ1qFL5VeyCyYUKqbc=
X-Google-Smtp-Source: ABdhPJzj8bVmaNapkC8afDBfP4IGpB/ziaV4141onZblKIhnc8A1+pI3oXJvYJR+DCD9VAsp7wxoa4uC77r8Q49faCA=
X-Received: by 2002:a05:6402:31b7:: with SMTP id
 dj23mr11368386edb.245.1616704261549; 
 Thu, 25 Mar 2021 13:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616521341.git.lukasstraub2@web.de>
 <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
In-Reply-To: <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Mar 2021 00:30:49 +0400
Message-ID: <CAJ+F1C+CkyJMMwzvou8YYCAv6jAEKGXqaG+oXfrBJmEyFkiRdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] yank: Always link full yank code
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000003771f105be624bff"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003771f105be624bff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 9:57 PM Lukas Straub <lukasstraub2@web.de> wrote:

> Yank now only depends on util and can be always linked in. Also remove
> the stubs as they are not needed anymore.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  MAINTAINERS       |  1 -
>  stubs/meson.build |  1 -
>  stubs/yank.c      | 23 -----------------------
>  util/meson.build  |  2 +-
>  4 files changed, 1 insertion(+), 26 deletions(-)
>  delete mode 100644 stubs/yank.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 455775c4a3..77259c031d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2820,7 +2820,6 @@ Yank feature
>  M: Lukas Straub <lukasstraub2@web.de>
>  S: Odd fixes
>  F: util/yank.c
> -F: stubs/yank.c
>  F: migration/yank_functions*
>  F: include/qemu/yank.h
>  F: qapi/yank.json
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 8a3e804cf0..be6f6d609e 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -46,7 +46,6 @@ stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
>  stub_ss.add(files('cpu-synchronize-state.c'))
>  if have_block
> -  stub_ss.add(files('yank.c'))
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> diff --git a/stubs/yank.c b/stubs/yank.c
> deleted file mode 100644
> index 11b24fc057..0000000000
> --- a/stubs/yank.c
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#include "qemu/osdep.h"
> -#include "qemu/yank.h"
> -
> -bool yank_register_instance(const YankInstance *instance, Error **errp)
> -{
> -    return true;
> -}
> -
> -void yank_unregister_instance(const YankInstance *instance)
> -{
> -}
> -
> -void yank_register_function(const YankInstance *instance,
> -                            YankFn *func,
> -                            void *opaque)
> -{
> -}
> -
> -void yank_unregister_function(const YankInstance *instance,
> -                              YankFn *func,
> -                              void *opaque)
> -{
> -}
> diff --git a/util/meson.build b/util/meson.build
> index 984fba965f..510765cde4 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -43,6 +43,7 @@ util_ss.add(files('stats64.c'))
>  util_ss.add(files('systemd.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
>  util_ss.add(files('guest-random.c'))
> +util_ss.add(files('yank.c'))
>
>  if have_user
>    util_ss.add(files('selfmap.c'))
> @@ -51,7 +52,6 @@ endif
>  if have_system
>    util_ss.add(files('crc-ccitt.c'))
>    util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> -  util_ss.add(files('yank.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
>
> --
> 2.30.2
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000003771f105be624bff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 9:57 PM Lukas=
 Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Yank =
now only depends on util and can be always linked in. Also remove<br>
the stubs as they are not needed anymore.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br></blockquote><div><br></div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0stubs/meson.build |=C2=A0 1 -<br>
=C2=A0stubs/yank.c=C2=A0 =C2=A0 =C2=A0 | 23 -----------------------<br>
=C2=A0util/meson.build=C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 1 insertion(+), 26 deletions(-)<br>
=C2=A0delete mode 100644 stubs/yank.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 455775c4a3..77259c031d 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2820,7 +2820,6 @@ Yank feature<br>
=C2=A0M: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" target=3D"=
_blank">lukasstraub2@web.de</a>&gt;<br>
=C2=A0S: Odd fixes<br>
=C2=A0F: util/yank.c<br>
-F: stubs/yank.c<br>
=C2=A0F: migration/yank_functions*<br>
=C2=A0F: include/qemu/yank.h<br>
=C2=A0F: qapi/yank.json<br>
diff --git a/stubs/meson.build b/stubs/meson.build<br>
index 8a3e804cf0..be6f6d609e 100644<br>
--- a/stubs/meson.build<br>
+++ b/stubs/meson.build<br>
@@ -46,7 +46,6 @@ stub_ss.add(files(&#39;vm-stop.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;win32-kbd-hook.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;cpu-synchronize-state.c&#39;))<br>
=C2=A0if have_block<br>
-=C2=A0 stub_ss.add(files(&#39;yank.c&#39;))<br>
=C2=A0 =C2=A0stub_ss.add(files(&#39;replay-tools.c&#39;))<br>
=C2=A0endif<br>
=C2=A0if have_system<br>
diff --git a/stubs/yank.c b/stubs/yank.c<br>
deleted file mode 100644<br>
index 11b24fc057..0000000000<br>
--- a/stubs/yank.c<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu/yank.h&quot;<br>
-<br>
-bool yank_register_instance(const YankInstance *instance, Error **errp)<br=
>
-{<br>
-=C2=A0 =C2=A0 return true;<br>
-}<br>
-<br>
-void yank_unregister_instance(const YankInstance *instance)<br>
-{<br>
-}<br>
-<br>
-void yank_register_function(const YankInstance *instance,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
-{<br>
-}<br>
-<br>
-void yank_unregister_function(const YankInstance *instance,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YankFn *func,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
-{<br>
-}<br>
diff --git a/util/meson.build b/util/meson.build<br>
index 984fba965f..510765cde4 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -43,6 +43,7 @@ util_ss.add(files(&#39;stats64.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;systemd.c&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;drm.c&#=
39;))<br>
=C2=A0util_ss.add(files(&#39;guest-random.c&#39;))<br>
+util_ss.add(files(&#39;yank.c&#39;))<br>
<br>
=C2=A0if have_user<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;selfmap.c&#39;))<br>
@@ -51,7 +52,6 @@ endif<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;crc-ccitt.c&#39;))<br>
=C2=A0 =C2=A0util_ss.add(when: &#39;CONFIG_GIO&#39;, if_true: [files(&#39;d=
bus.c&#39;), gio])<br>
-=C2=A0 util_ss.add(files(&#39;yank.c&#39;))<br>
=C2=A0 =C2=A0util_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;=
userfaultfd.c&#39;))<br>
=C2=A0endif<br>
<br>
--<br>
2.30.2<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003771f105be624bff--

