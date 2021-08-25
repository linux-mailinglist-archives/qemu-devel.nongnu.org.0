Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AE3F73F3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:02:43 +0200 (CEST)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqg6-00089Z-LS
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIqcs-0004vR-RZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:59:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIqcq-0003tl-4l
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:59:22 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i21so9401283ejd.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGKEs0sHJJZCrdZ8Va2sK/n1NaaeFpGVfPjLNTc7pUc=;
 b=OgzLZCrEWTkXYHJqjp/KpJKAsKnW7bgIj8xDnYScfjrPjr01S8rfouv1Gc65NHkkla
 kAV0dqytIrppxe7vhq5OX6/LpMVo02ettvMoZMDiez+CcXMi8jCzaslwwWgc6hTE8nuh
 MJ3uxFUVTN6OGL5vfbtEDqXxsDFu9jrTHyzWotS5L4WBbEjzvwSREvp7FzJcxND4K8CQ
 Ko2BfoIbZP3PsdkAVHpkPu7uKuXb4xCMUESJRFMCd9sPKOpTU0fiviYEt8QzGvoeahkW
 tubRyk/oUR9WhjEMzMhAPowWFahgp7LZbBJn4TY20BqyZwqXUYn7gIrXOc63a7F1LNN+
 wFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGKEs0sHJJZCrdZ8Va2sK/n1NaaeFpGVfPjLNTc7pUc=;
 b=ENpOhBwP9IhasHgoXy++2u53wUHBkjB5Amg+5bLAalqsmvrPyQwFWGAY+w3tghDWU6
 1Kdn/+XVijjIWLtHbhqkck629klPV5umc9uyLCFzFfbkP1qj0Vz6UmKuA/O7e+KNcKo8
 XknLSeckOMAMVW9o+IugBacsOfHfPYEg0riT2zIDPkM443ln8FxHINa8nRGtoXnz5KRe
 aWdhVNO71BcgiAqHGZPgjarLbmenXWkvZehIgU/8lyxtO8CbJ8GxaCSW7zQ62f3Xojph
 tRRoMrhl2u6qwbgOU7KFhoyfRQCrvKofnpyCdDhtFlKIlm3A06EczTOadKgKQxBHKSz+
 qfoA==
X-Gm-Message-State: AOAM532qZOce+zxPHlw3VyZk9yPXAiN2mm7HFetKbB/2OWzy8/Dpu/gN
 hZVT2l+h1A1l4S6vLjA++9YskEfz9a9MJCzfoY4=
X-Google-Smtp-Source: ABdhPJx5tRARx04WcvcOgY91w9VXQTzy1HgtWl0Nx3N3ALObsI4xo1zhBuK2MZMErc58dsyTNPdTLDOYDzoaOB88S4U=
X-Received: by 2002:a17:906:3a58:: with SMTP id
 a24mr45364260ejf.109.1629889158564; 
 Wed, 25 Aug 2021 03:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210825093701.668122-1-s.reiter@proxmox.com>
 <20210825093701.668122-3-s.reiter@proxmox.com>
In-Reply-To: <20210825093701.668122-3-s.reiter@proxmox.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Aug 2021 14:59:06 +0400
Message-ID: <CAJ+F1CKf5icfpA4X_kHQQJGfiHj+dvct9OqEvtOQ2UD4WPCbtw@mail.gmail.com>
Subject: Re: [PATCH 2/2] monitor: allow VNC related QMP and HMP commands to
 take a display ID
To: Stefan Reiter <s.reiter@proxmox.com>
Content-Type: multipart/alternative; boundary="00000000000051d39905ca60241d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000051d39905ca60241d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 25, 2021 at 1:39 PM Stefan Reiter <s.reiter@proxmox.com> wrote:

> It is possible to specify more than one VNC server on the command line,
> either with an explicit ID or the auto-generated ones =C3=A0 la "default"=
,
> "vnc2", "vnc3", ...
>
> It is not possible to change the password on one of these extra VNC
> displays though. Fix this by adding a "display" parameter to the
> 'set_password' and 'expire_password' QMP and HMP commands.
>
> For HMP, this is a bit trickier, since at least 'set_password' already
> has the 'connected' parameter following the mandatory 'password' one, so
> we need to prefix the display ID with "id=3D" to allow correct parsing.
>

It's not something done with other commands afaik, feels a bit awkward (the
"connected =3D display"...).

Is it really necessary to add support for HMP?

With this prefix, no existing command or workflow should be affected.
>
> While rewriting the descriptions, also remove the line "Use zero to make
> the password stay valid forever." from 'set_password', I believe this was
> intended for 'expire_password', but would even be wrong there.
>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>  hmp-commands.hx    | 28 +++++++++++++++-------------
>  monitor/hmp-cmds.c | 20 ++++++++++++++++++--
>  monitor/qmp-cmds.c |  9 +++++----
>  qapi/ui.json       | 12 ++++++++++--
>  4 files changed, 48 insertions(+), 21 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index e01ca13ca8..0b5abcfb8a 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1541,34 +1541,36 @@ ERST
>
>      {
>          .name       =3D "set_password",
> -        .args_type  =3D "protocol:s,password:s,connected:s?",
> -        .params     =3D "protocol password action-if-connected",
> +        .args_type  =3D "protocol:s,password:s,display:s?,connected:s?",
> +        .params     =3D "protocol password [id=3Ddisplay]
> [action-if-connected]",
>          .help       =3D "set spice/vnc password",
>          .cmd        =3D hmp_set_password,
>      },
>
>  SRST
> -``set_password [ vnc | spice ] password [ action-if-connected ]``
> -  Change spice/vnc password.  Use zero to make the password stay valid
> -  forever.  *action-if-connected* specifies what should happen in
> +``set_password [ vnc | spice ] password [ id=3Ddisplay ] [
> action-if-connected ]``
> +  Change spice/vnc password.  *display* (must be prefixed with
> +  'id=3D') can be used with 'vnc' to specify which display to set the
> +  password on.  *action-if-connected* specifies what should happen in
>    case a connection is established: *fail* makes the password change
> -  fail.  *disconnect* changes the password and disconnects the
> -  client.  *keep* changes the password and keeps the connection up.
> -  *keep* is the default.
> +  fail.  *disconnect* changes the password and disconnects the client.
> +  *keep* changes the password and keeps the connection up.  *keep* is
> +  the default.
>  ERST
>
>      {
>          .name       =3D "expire_password",
> -        .args_type  =3D "protocol:s,time:s",
> -        .params     =3D "protocol time",
> +        .args_type  =3D "protocol:s,time:s,display:s?",
> +        .params     =3D "protocol time [id=3Ddisplay]",
>          .help       =3D "set spice/vnc password expire-time",
>          .cmd        =3D hmp_expire_password,
>      },
>
>  SRST
> -``expire_password [ vnc | spice ]`` *expire-time*
> -  Specify when a password for spice/vnc becomes
> -  invalid. *expire-time* accepts:
> +``expire_password [ vnc | spice ] expire-time [ id=3Ddisplay ]``
> +  Specify when a password for spice/vnc becomes invalid.
> +  *display* behaves the same as in ``set_password``.
> +  *expire-time* accepts:
>
>    ``now``
>      Invalidate password instantly.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 31366e6331..30f5b2c3e3 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1546,10 +1546,20 @@ void hmp_set_password(Monitor *mon, const QDict
> *qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *password  =3D qdict_get_str(qdict, "password");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      const char *connected =3D qdict_get_try_str(qdict, "connected");
>      Error *err =3D NULL;
>
> -    qmp_set_password(protocol, password, !!connected, connected, &err);
> +    if (display && strncmp(display, "id=3D", 3)) {
> +        connected =3D display;
> +        display =3D NULL;
> +    } else if (display) {
> +        /* skip "id=3D" */
> +        display =3D display + 3;
> +    }
> +
> +    qmp_set_password(protocol, password, !!connected, connected,
> !!display,
> +                     display, &err);
>      hmp_handle_error(mon, err);
>  }
>
> @@ -1557,9 +1567,15 @@ void hmp_expire_password(Monitor *mon, const QDict
> *qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *whenstr =3D qdict_get_str(qdict, "time");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      Error *err =3D NULL;
>
> -    qmp_expire_password(protocol, whenstr, &err);
> +    if (display && !strncmp(display, "id=3D", 3)) {
> +        /* skip "id=3D" */
> +        display =3D display + 3;
> +    }
> +
> +    qmp_expire_password(protocol, whenstr, !!display, display, &err);
>      hmp_handle_error(mon, err);
>  }
>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index f7d64a6457..a9ded90a41 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -165,7 +165,8 @@ void qmp_system_wakeup(Error **errp)
>  }
>
>  void qmp_set_password(const char *protocol, const char *password,
> -                      bool has_connected, const char *connected, Error
> **errp)
> +                      bool has_connected, const char *connected,
> +                      bool has_display, const char *display, Error **err=
p)
>  {
>      int disconnect_if_connected =3D 0;
>      int fail_if_connected =3D 0;
> @@ -198,7 +199,7 @@ void qmp_set_password(const char *protocol, const cha=
r
> *password,
>          }
>          /* Note that setting an empty password will not disable login
> through
>           * this interface. */
> -        rc =3D vnc_display_password(NULL, password);
> +        rc =3D vnc_display_password(has_display ? display : NULL, passwo=
rd);
>      } else {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
>                     "'vnc' or 'spice'");
> @@ -211,7 +212,7 @@ void qmp_set_password(const char *protocol, const cha=
r
> *password,
>  }
>
>  void qmp_expire_password(const char *protocol, const char *whenstr,
> -                         Error **errp)
> +                         bool has_display, const char *display, Error
> **errp)
>  {
>      time_t when;
>      int rc;
> @@ -232,7 +233,7 @@ void qmp_expire_password(const char *protocol, const
> char *whenstr,
>          }
>          rc =3D qemu_spice.set_pw_expire(when);
>      } else if (strcmp(protocol, "vnc") =3D=3D 0) {
> -        rc =3D vnc_display_pw_expire(NULL, when);
> +        rc =3D vnc_display_pw_expire(has_display ? display : NULL, when)=
;
>      } else {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
>                     "'vnc' or 'spice'");
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 16bf03224f..24dca811f8 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -25,6 +25,9 @@
>  #             'disconnect' to disconnect existing clients
>  #             'keep' to maintain existing clients
>  #
> +# @display: In case of VNC, the id of the display where the password
> +#           should be changed. Defaults to the first.
> +#
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
>  #
> @@ -38,7 +41,8 @@
>  #
>  ##
>  { 'command': 'set_password',
> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
> +  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str',
> +           '*display': 'str'} }
>
>  ##
>  # @expire_password:
> @@ -54,6 +58,9 @@
>  #        - '+INT' where INT is the number of seconds from now (integer)
>  #        - 'INT' where INT is the absolute time in seconds
>  #
> +# @display: In case of VNC, the id of the display where the password
> +#           should be set to expire. Defaults to the first.
> +#
>  # Returns: - Nothing on success
>  #          - If @protocol is 'spice' and Spice is not active,
> DeviceNotFound
>  #
> @@ -71,7 +78,8 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time':
> 'str'} }
> +{ 'command': 'expire_password',
> +  'data': {'protocol': 'str', 'time': 'str', '*display': 'str'} }
>
>  ##
>  # @screendump:
> --
> 2.30.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000051d39905ca60241d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 1:39 PM Ste=
fan Reiter &lt;<a href=3D"mailto:s.reiter@proxmox.com">s.reiter@proxmox.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
It is possible to specify more than one VNC server on the command line,<br>
either with an explicit ID or the auto-generated ones =C3=A0 la &quot;defau=
lt&quot;,<br>
&quot;vnc2&quot;, &quot;vnc3&quot;, ...<br>
<br>
It is not possible to change the password on one of these extra VNC<br>
displays though. Fix this by adding a &quot;display&quot; parameter to the<=
br>
&#39;set_password&#39; and &#39;expire_password&#39; QMP and HMP commands.<=
br>
<br>
For HMP, this is a bit trickier, since at least &#39;set_password&#39; alre=
ady<br>
has the &#39;connected&#39; parameter following the mandatory &#39;password=
&#39; one, so<br>
we need to prefix the display ID with &quot;id=3D&quot; to allow correct pa=
rsing.<br></blockquote><div><br></div><div>It&#39;s not something done with=
 other commands afaik, feels a bit awkward (the &quot;connected =3D display=
&quot;...).</div><div><br></div><div>Is it really necessary to add support =
for HMP?<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
With this prefix, no existing command or workflow should be affected.<br>
<br>
While rewriting the descriptions, also remove the line &quot;Use zero to ma=
ke<br>
the password stay valid forever.&quot; from &#39;set_password&#39;, I belie=
ve this was<br>
intended for &#39;expire_password&#39;, but would even be wrong there.<br>
<br>
Signed-off-by: Stefan Reiter &lt;<a href=3D"mailto:s.reiter@proxmox.com" ta=
rget=3D"_blank">s.reiter@proxmox.com</a>&gt;<br>
---<br>
=C2=A0hmp-commands.hx=C2=A0 =C2=A0 | 28 +++++++++++++++-------------<br>
=C2=A0monitor/hmp-cmds.c | 20 ++++++++++++++++++--<br>
=C2=A0monitor/qmp-cmds.c |=C2=A0 9 +++++----<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++--<br>
=C2=A04 files changed, 48 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/hmp-commands.hx b/hmp-commands.hx<br>
index e01ca13ca8..0b5abcfb8a 100644<br>
--- a/hmp-commands.hx<br>
+++ b/hmp-commands.hx<br>
@@ -1541,34 +1541,36 @@ ERST<br>
<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;set_password&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;protocol:s,password=
:s,connected:s?&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;protocol =
password action-if-connected&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;protocol:s,password=
:s,display:s?,connected:s?&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;protocol =
password [id=3Ddisplay] [action-if-connected]&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.help=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;set spice/vnc password&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hmp_s=
et_password,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
<br>
=C2=A0SRST<br>
-``set_password [ vnc | spice ] password [ action-if-connected ]``<br>
-=C2=A0 Change spice/vnc password.=C2=A0 Use zero to make the password stay=
 valid<br>
-=C2=A0 forever.=C2=A0 *action-if-connected* specifies what should happen i=
n<br>
+``set_password [ vnc | spice ] password [ id=3Ddisplay ] [ action-if-conne=
cted ]``<br>
+=C2=A0 Change spice/vnc password.=C2=A0 *display* (must be prefixed with<b=
r>
+=C2=A0 &#39;id=3D&#39;) can be used with &#39;vnc&#39; to specify which di=
splay to set the<br>
+=C2=A0 password on.=C2=A0 *action-if-connected* specifies what should happ=
en in<br>
=C2=A0 =C2=A0case a connection is established: *fail* makes the password ch=
ange<br>
-=C2=A0 fail.=C2=A0 *disconnect* changes the password and disconnects the<b=
r>
-=C2=A0 client.=C2=A0 *keep* changes the password and keeps the connection =
up.<br>
-=C2=A0 *keep* is the default.<br>
+=C2=A0 fail.=C2=A0 *disconnect* changes the password and disconnects the c=
lient.<br>
+=C2=A0 *keep* changes the password and keeps the connection up.=C2=A0 *kee=
p* is<br>
+=C2=A0 the default.<br>
=C2=A0ERST<br>
<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;expire_password&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;protocol:s,time:s&q=
uot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;protocol =
time&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type=C2=A0 =3D &quot;protocol:s,time:s,d=
isplay:s?&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params=C2=A0 =C2=A0 =C2=A0=3D &quot;protocol =
time [id=3Ddisplay]&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.help=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;set spice/vnc password expire-time&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hmp_e=
xpire_password,<br>
=C2=A0 =C2=A0 =C2=A0},<br>
<br>
=C2=A0SRST<br>
-``expire_password [ vnc | spice ]`` *expire-time*<br>
-=C2=A0 Specify when a password for spice/vnc becomes<br>
-=C2=A0 invalid. *expire-time* accepts:<br>
+``expire_password [ vnc | spice ] expire-time [ id=3Ddisplay ]``<br>
+=C2=A0 Specify when a password for spice/vnc becomes invalid.<br>
+=C2=A0 *display* behaves the same as in ``set_password``.<br>
+=C2=A0 *expire-time* accepts:<br>
<br>
=C2=A0 =C2=A0``now``<br>
=C2=A0 =C2=A0 =C2=A0Invalidate password instantly.<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index 31366e6331..30f5b2c3e3 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -1546,10 +1546,20 @@ void hmp_set_password(Monitor *mon, const QDict *qd=
ict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *protocol=C2=A0 =3D qdict_get_str(qdict, &qu=
ot;protocol&quot;);<br>
=C2=A0 =C2=A0 =C2=A0const char *password=C2=A0 =3D qdict_get_str(qdict, &qu=
ot;password&quot;);<br>
+=C2=A0 =C2=A0 const char *display =3D qdict_get_try_str(qdict, &quot;displ=
ay&quot;);<br>
=C2=A0 =C2=A0 =C2=A0const char *connected =3D qdict_get_try_str(qdict, &quo=
t;connected&quot;);<br>
=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 qmp_set_password(protocol, password, !!connected, connected,=
 &amp;err);<br>
+=C2=A0 =C2=A0 if (display &amp;&amp; strncmp(display, &quot;id=3D&quot;, 3=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 connected =3D display;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 display =3D NULL;<br>
+=C2=A0 =C2=A0 } else if (display) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* skip &quot;id=3D&quot; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 display =3D display + 3;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qmp_set_password(protocol, password, !!connected, connected,=
 !!display,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0display, &amp;err);<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
=C2=A0}<br>
<br>
@@ -1557,9 +1567,15 @@ void hmp_expire_password(Monitor *mon, const QDict *=
qdict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *protocol=C2=A0 =3D qdict_get_str(qdict, &qu=
ot;protocol&quot;);<br>
=C2=A0 =C2=A0 =C2=A0const char *whenstr =3D qdict_get_str(qdict, &quot;time=
&quot;);<br>
+=C2=A0 =C2=A0 const char *display =3D qdict_get_try_str(qdict, &quot;displ=
ay&quot;);<br>
=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 qmp_expire_password(protocol, whenstr, &amp;err);<br>
+=C2=A0 =C2=A0 if (display &amp;&amp; !strncmp(display, &quot;id=3D&quot;, =
3)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* skip &quot;id=3D&quot; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 display =3D display + 3;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qmp_expire_password(protocol, whenstr, !!display, display, &=
amp;err);<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
=C2=A0}<br>
<br>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
index f7d64a6457..a9ded90a41 100644<br>
--- a/monitor/qmp-cmds.c<br>
+++ b/monitor/qmp-cmds.c<br>
@@ -165,7 +165,8 @@ void qmp_system_wakeup(Error **errp)<br>
=C2=A0}<br>
<br>
=C2=A0void qmp_set_password(const char *protocol, const char *password,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool has_connected, const char *connected, Error **errp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool has_connected, const char *connected,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool has_display, const char *display, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int disconnect_if_connected =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int fail_if_connected =3D 0;<br>
@@ -198,7 +199,7 @@ void qmp_set_password(const char *protocol, const char =
*password,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Note that setting an empty password wi=
ll not disable login through<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this interface. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D vnc_display_password(NULL, password);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D vnc_display_password(has_display ? disp=
lay : NULL, password);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_INVALID_PARAMETER_V=
ALUE, &quot;protocol&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;&#39;vnc&#39; or &#39;spice&#39;&quot;);<br>
@@ -211,7 +212,7 @@ void qmp_set_password(const char *protocol, const char =
*password,<br>
=C2=A0}<br>
<br>
=C2=A0void qmp_expire_password(const char *protocol, const char *whenstr,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Error **errp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool has_display, const char *display, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0time_t when;<br>
=C2=A0 =C2=A0 =C2=A0int rc;<br>
@@ -232,7 +233,7 @@ void qmp_expire_password(const char *protocol, const ch=
ar *whenstr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D qemu_spice.set_pw_expire(when);<br=
>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(protocol, &quot;vnc&quot;) =3D=3D 0) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D vnc_display_pw_expire(NULL, when);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D vnc_display_pw_expire(has_display ? dis=
play : NULL, when);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_INVALID_PARAMETER_V=
ALUE, &quot;protocol&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;&#39;vnc&#39; or &#39;spice&#39;&quot;);<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index 16bf03224f..24dca811f8 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -25,6 +25,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;disconnect&#39;=
 to disconnect existing clients<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;keep&#39; to ma=
intain existing clients<br>
=C2=A0#<br>
+# @display: In case of VNC, the id of the display where the password<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0should be changed. Defaults to t=
he first.<br>
+#<br>
=C2=A0# Returns: - Nothing on success<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - If Spice is not enabled, Device=
NotFound<br>
=C2=A0#<br>
@@ -38,7 +41,8 @@<br>
=C2=A0#<br>
=C2=A0##<br>
=C2=A0{ &#39;command&#39;: &#39;set_password&#39;,<br>
-=C2=A0 &#39;data&#39;: {&#39;protocol&#39;: &#39;str&#39;, &#39;password&#=
39;: &#39;str&#39;, &#39;*connected&#39;: &#39;str&#39;} }<br>
+=C2=A0 &#39;data&#39;: {&#39;protocol&#39;: &#39;str&#39;, &#39;password&#=
39;: &#39;str&#39;, &#39;*connected&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*display&#39;: &#39;str&#39;=
} }<br>
<br>
=C2=A0##<br>
=C2=A0# @expire_password:<br>
@@ -54,6 +58,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 - &#39;+INT&#39; where INT is the number=
 of seconds from now (integer)<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 - &#39;INT&#39; where INT is the absolut=
e time in seconds<br>
=C2=A0#<br>
+# @display: In case of VNC, the id of the display where the password<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0should be set to expire. Default=
s to the first.<br>
+#<br>
=C2=A0# Returns: - Nothing on success<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - If @protocol is &#39;spice&#39;=
 and Spice is not active, DeviceNotFound<br>
=C2=A0#<br>
@@ -71,7 +78,8 @@<br>
=C2=A0# &lt;- { &quot;return&quot;: {} }<br>
=C2=A0#<br>
=C2=A0##<br>
-{ &#39;command&#39;: &#39;expire_password&#39;, &#39;data&#39;: {&#39;prot=
ocol&#39;: &#39;str&#39;, &#39;time&#39;: &#39;str&#39;} }<br>
+{ &#39;command&#39;: &#39;expire_password&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;protocol&#39;: &#39;str&#39;, &#39;time&#39;:=
 &#39;str&#39;, &#39;*display&#39;: &#39;str&#39;} }<br>
<br>
=C2=A0##<br>
=C2=A0# @screendump:<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000051d39905ca60241d--

