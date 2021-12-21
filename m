Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B047BB94
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:16:48 +0100 (CET)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaKF-0003S8-9Y
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzaHi-0000oD-B5
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:14:10 -0500
Received: from [2a00:1450:4864:20::332] (port=37414
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzaHg-0001ka-Hk
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:14:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso1074992wmd.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdqcNU5g7w6vQqw9mtgYGUyphlRO0CwRuPjh3zvKjJY=;
 b=auVyWrZPVCEnBH1wZbPSSeu4kiFYzP6IG4Sl9rJrhDLPWGCqHCOG2WgfCaDOnrQYMd
 XpC0VIQVPMtMj7CLhQTMDM+jjxe9RQIP6CW/L6jMG0HKW+2Hk32KubYBxOu4I22Zu0/N
 na+2hpTawbtPOp7QS0aQWcjy2jH7aqQOxYdEPgYK705ZXQjnem+9m11kQSSQfA/bOr+X
 NXKSeBbxf/MLxo+PDGba+eeEGY4hFmAbWqdZE+vEDsT4WJ8KTuFEICNuHva2TG8xZcfN
 /srlQMXrHZlK6r91AHV7IdqKtgznpFH0biJWTe14AYXKf0EMcMzGJ2nuvjLv/a5j/E0x
 GymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdqcNU5g7w6vQqw9mtgYGUyphlRO0CwRuPjh3zvKjJY=;
 b=0q8HmbARXKPRdDoM71Ik6ISb5MIzsy9TRCfiO7IsjJ/wcqcMIILSikFeZuhqB7KDO0
 FoOmLUz5nl2H4mfLyQBEWb6cZ5GrjiMxnLF34lXkLcPd/QLb8J62tJSXRhu/+iZnL5SB
 HqVcp+156/s75iPWF77rJSg9Uvk7blyeYwk3W4Dbk4kUF8/Mz7dutlOad1ujuZ4N2E6x
 ucO6v1GBSPlXVBO3+z4MqCO4HFQJ2lxV8ogpQPI/2O62plleSkly7qIeVa5SFXpMDOS4
 gHxGkFm5v11voJT80jETyAoDDzW8chOJCYdnumUamI7s3R7APrni/4zC6LmsEV0qxLmA
 eShw==
X-Gm-Message-State: AOAM531+B4OXA7ZD/Y3pM9t4CNSsnH6sWl9fgZ0GiV9UMVolrnd/poWI
 smlVivAAk3xJ4Pda4/Amw/IfZmoOUplfUuKg2zc=
X-Google-Smtp-Source: ABdhPJyVNQ4rQv9HGrHVeRl3MiICfxPlqorlcDaNDe8soTulf52QFTNgVyrGFCfUptUASWC0OnqVONaSah/lLTcWUXc=
X-Received: by 2002:a1c:740c:: with SMTP id p12mr1587864wmc.140.1640074446912; 
 Tue, 21 Dec 2021 00:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
In-Reply-To: <20211220154418.1554279-3-vsementsov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Dec 2021 12:13:54 +0400
Message-ID: <CAJ+F1C+v1d49KT9+4n3RiDXfjj+82k7wz3rO_5=LVJ_T5Kn3vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: multipart/alternative; boundary="000000000000d042ca05d3a39604"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d042ca05d3a39604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Dec 20, 2021 at 10:24 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Add command that can change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>

Looks good to me,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Could you write an avocado test for it? (tests/avocado/vnc.py)

---
>  docs/about/removed-features.rst |  3 ++-
>  qapi/ui.json                    | 12 ++++++++++++
>  ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/removed-features.rst
> b/docs/about/removed-features.rst
> index d42c3341de..20e6901a82 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for
> additional details.
>  ``change`` (removed in 6.0)
>  '''''''''''''''''''''''''''
>
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
> +``change-vnc-listen`` instead.
>
>  ``query-events`` (removed in 6.0)
>  '''''''''''''''''''''''''''''''''
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..14e6fe0b4c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1304,3 +1304,15 @@
>  { 'command': 'display-reload',
>    'data': 'DisplayReloadOptions',
>    'boxed' : true }
> +
> +##
> +# @change-vnc-listen:
> +#
> +# Change set of addresses to listen for connections.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'command': 'change-vnc-listen',
> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
> +            '*websockets': ['SocketAddress'] } }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index c9e26c70df..69bbf3b6f6 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -4212,6 +4212,32 @@ fail:
>      vnc_display_close(vd);
>  }
>
> +void qmp_change_vnc_listen(const char *id, SocketAddressList *addresses,
> +                           bool has_websockets, SocketAddressList
> *websockets,
> +                           Error **errp)
> +{
> +    VncDisplay *vd =3D vnc_display_find(id);
> +
> +    if (!vd) {
> +        error_setg(errp, "VNC display '%s' not active", id);
> +        return;
> +    }
> +
> +    if (vd->listener) {
> +        qio_net_listener_disconnect(vd->listener);
> +        object_unref(OBJECT(vd->listener));
> +    }
> +    vd->listener =3D NULL;
> +
> +    if (vd->wslistener) {
> +        qio_net_listener_disconnect(vd->wslistener);
> +        object_unref(OBJECT(vd->wslistener));
> +    }
> +    vd->wslistener =3D NULL;
> +
> +    vnc_display_listen(vd, addresses, websockets, errp);
> +}
> +
>  void vnc_display_add_client(const char *id, int csock, bool skipauth)
>  {
>      VncDisplay *vd =3D vnc_display_find(id);
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d042ca05d3a39604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 20, 2021 at 10:24 PM Vladimir Sem=
entsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsementsov=
@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Add command that can change addresses where VNC server listen=
s for new<br>
connections. Prior to 6.0 this functionality was available through<br>
&#39;change&#39; qmp command which was deleted.<br>
<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Looks good to me,</div><div>Reviewed-by: Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt;</div><div><br></div><div>Could you write an a=
vocado test for it? (tests/avocado/vnc.py)</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/about/removed-features.rst |=C2=A0 3 ++-<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 12 ++++++++++++<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++++++++++++<br>
=C2=A03 files changed, 40 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.=
rst<br>
index d42c3341de..20e6901a82 100644<br>
--- a/docs/about/removed-features.rst<br>
+++ b/docs/about/removed-features.rst<br>
@@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for additi=
onal details.<br>
=C2=A0``change`` (removed in 6.0)<br>
=C2=A0&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
<br>
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.<br>
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or<br>
+``change-vnc-listen`` instead.<br>
<br>
=C2=A0``query-events`` (removed in 6.0)<br>
=C2=A0&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index d7567ac866..14e6fe0b4c 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -1304,3 +1304,15 @@<br>
=C2=A0{ &#39;command&#39;: &#39;display-reload&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: &#39;DisplayReloadOptions&#39;,<br>
=C2=A0 =C2=A0&#39;boxed&#39; : true }<br>
+<br>
+##<br>
+# @change-vnc-listen:<br>
+#<br>
+# Change set of addresses to listen for connections.<br>
+#<br>
+# Since: 7.0<br>
+#<br>
+##<br>
+{ &#39;command&#39;: &#39;change-vnc-listen&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;addresses&#39;:=
 [&#39;SocketAddress&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*websockets&#39;: [&#39;Soc=
ketAddress&#39;] } }<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index c9e26c70df..69bbf3b6f6 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -4212,6 +4212,32 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0vnc_display_close(vd);<br>
=C2=A0}<br>
<br>
+void qmp_change_vnc_listen(const char *id, SocketAddressList *addresses,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool has_websockets, SocketAddressList *websockets,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 VncDisplay *vd =3D vnc_display_find(id);<br>
+<br>
+=C2=A0 =C2=A0 if (!vd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;VNC display &#39;%s&#39=
; not active&quot;, id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;listener) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_net_listener_disconnect(vd-&gt;listener);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(vd-&gt;listener));<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 vd-&gt;listener =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if (vd-&gt;wslistener) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_net_listener_disconnect(vd-&gt;wslistener)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(OBJECT(vd-&gt;wslistener));<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 vd-&gt;wslistener =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 vnc_display_listen(vd, addresses, websockets, errp);<br>
+}<br>
+<br>
=C2=A0void vnc_display_add_client(const char *id, int csock, bool skipauth)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VncDisplay *vd =3D vnc_display_find(id);<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d042ca05d3a39604--

