Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2C53321F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:03:49 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntaku-0005cN-9H
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntagM-0000aK-SM
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:59:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntagK-0000OA-V7
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:59:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id jx22so24059046ejb.12
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcmGoVeCwMq16X+e2i/CqaMP15k0DqIDqmrdyS90K8w=;
 b=fkcOMHmHUdNZAjzPsm3co+FDt7gECnArZYPGLa6QNNJO78hcR2pGF3ErKRhpCBTXo9
 qNbTEIhRqNANpSNMkVgqR8a+6DVkgRMM2tZ6z6TIz+0RCeWPC8MGHKTN3PkW+9sqtxXn
 dtCSO+0EUt9PLJoAEBBguZmj+DrmW9Vzs2ua45VGnljwZZqsz9Jw4KFI3jm1Wst9jIxQ
 UeHUWedXOIwURSOn0EDRl2chn0m7/iSlRTUIWTQrKsv3NqCOzdeEDkUKIYybh0kcV4d/
 JJfJwiCUJGunbfGaCAB4jQEOc8Jg6VefT42WfUt8GYNIUkuKR1AWX8KQqdiKGNs1r1rS
 bTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcmGoVeCwMq16X+e2i/CqaMP15k0DqIDqmrdyS90K8w=;
 b=CKrQdasjqVQ3rJtJUWLlrEOh93ebe2ndLXW9jBjnio8G7mFXuGwceepYU/CKnjmCbb
 PjPtoDif85p2jsB1p9seHJDx09uVEa6O3Md3esjMo1AdoDYks6/gjCH82ID43lgcUtnY
 jmdmSz1AsSHi8fz7xHruXHkjk2tWHp7qWzliOz83wUbEihjXrWFVHdSBxRJ0tARugybI
 Jo4rXjEuqsL8Ice9Q/fUyJK8Aug4eqMCwNRNUn24OFX5UV2T4uEt5cj36bGhxioNMEqy
 9JXwArosK2LKk0YrV9NU0D1iM71Hwp8y0ZSXGMfIASYmAO/41CmD+50K9v5A2KDLKvE+
 omzA==
X-Gm-Message-State: AOAM531tEkBtCHkVUnNYC2zWaJL3T5uz8QYY9imfn1+QAq+F2Wm6RAOj
 Kyd8aIi3wgjlWPqRoYvoJLKkJgqiAq1YT8IuluRIlw==
X-Google-Smtp-Source: ABdhPJyW6W8bSW0OdvALdr/6uQd7QcOSiqN0gUi7LWpxeah0IPbkuB5/Uq43O26uzhPucHVJ8gqFe/afNl93jwGx5mA=
X-Received: by 2002:a17:907:9602:b0:6df:e82c:f84 with SMTP id
 gb2-20020a170907960200b006dfe82c0f84mr25673615ejc.590.1653422343461; Tue, 24
 May 2022 12:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
 <20220519153402.41540-7-damien.hedde@greensocs.com>
In-Reply-To: <20220519153402.41540-7-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:58:51 +0800
Message-ID: <CALw707rknU=HTUMNk6Q4Bsa=sM+04VncE=zKspvhFtx6zJyyOg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] qapi/device_add: Allow execution in machine
 initialized phase
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Mirela Grujic <mirela.grujic@greensocs.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="0000000000007239e205dfc763d7"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000007239e205dfc763d7
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, May 19, 2022 at 11:37 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> This commit allows to use the QMP command to add a cold-plugged
> device like we can do with the CLI option -device.
>
> Note: for device_add command in qdev.json adding the 'allow-preconfig'
> option has no effect because the command appears to bypass QAPI (see
> TODO at qapi/qdev.json:61). The option is added there solely to
> document the intent.
> For the same reason, the flags have to be explicitly set in
> monitor_init_qmp_commands() when the device_add command is registered.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> v4:
>  + use phase_until()
>  + add missing flag in hmp-commands.hx
> ---
>  qapi/qdev.json         | 3 ++-
>  monitor/misc.c         | 2 +-
>  softmmu/qdev-monitor.c | 4 ++++
>  hmp-commands.hx        | 1 +
>  4 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 26cd10106b..2e2de41499 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -77,7 +77,8 @@
>  { 'command': 'device_add',
>    'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
>    'gen': false, # so we can get the additional arguments
> -  'features': ['json-cli', 'json-cli-hotplug'] }
> +  'features': ['json-cli', 'json-cli-hotplug'],
> +  'allow-preconfig': true }
>
>  ##
>  # @device_del:
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c5bb82d3b..d3d413d70c 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -233,7 +233,7 @@ static void monitor_init_qmp_commands(void)
>      qmp_init_marshal(&qmp_commands);
>
>      qmp_register_command(&qmp_commands, "device_add",
> -                         qmp_device_add, 0, 0);
> +                         qmp_device_add, QCO_ALLOW_PRECONFIG, 0);
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands,
> "qmp_capabilities",
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 7cbee2b0d8..c53f62be51 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -855,6 +855,10 @@ void qmp_device_add(QDict *qdict, QObject **ret_data,
> Error **errp)
>      QemuOpts *opts;
>      DeviceState *dev;
>
> +    if (!phase_until(PHASE_MACHINE_INITIALIZED, errp)) {
> +        return;
> +    }
> +
>      opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
>      if (!opts) {
>          return;
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 03e6a73d1f..0091b8e2dd 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -672,6 +672,7 @@ ERST
>          .help       = "add device, like -device on the command line",
>          .cmd        = hmp_device_add,
>          .command_completion = device_add_completion,
> +        .flags      = "p",
>      },
>
>  SRST
> --
> 2.36.1
>
>
>

--0000000000007239e205dfc763d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at =
11:37 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com">dam=
ien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Mirela Grujic &lt;<a href=3D"mailto:mirela.gru=
jic@greensocs.com" target=3D"_blank">mirela.grujic@greensocs.com</a>&gt;<br=
>
<br>
This commit allows to use the QMP command to add a cold-plugged<br>
device like we can do with the CLI option -device.<br>
<br>
Note: for device_add command in qdev.json adding the &#39;allow-preconfig&#=
39;<br>
option has no effect because the command appears to bypass QAPI (see<br>
TODO at qapi/qdev.json:61). The option is added there solely to<br>
document the intent.<br>
For the same reason, the flags have to be explicitly set in<br>
monitor_init_qmp_commands() when the device_add command is registered.<br>
<br>
Signed-off-by: Mirela Grujic &lt;<a href=3D"mailto:mirela.grujic@greensocs.=
com" target=3D"_blank">mirela.grujic@greensocs.com</a>&gt;<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
<br>
v4:<br>
=C2=A0+ use phase_until()<br>
=C2=A0+ add missing flag in hmp-commands.hx<br>
---<br>
=C2=A0qapi/qdev.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0softmmu/qdev-monitor.c | 4 ++++<br>
=C2=A0hmp-commands.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A04 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qapi/qdev.json b/qapi/qdev.json<br>
index 26cd10106b..2e2de41499 100644<br>
--- a/qapi/qdev.json<br>
+++ b/qapi/qdev.json<br>
@@ -77,7 +77,8 @@<br>
=C2=A0{ &#39;command&#39;: &#39;device_add&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: {&#39;driver&#39;: &#39;str&#39;, &#39;*bus&#3=
9;: &#39;str&#39;, &#39;*id&#39;: &#39;str&#39;},<br>
=C2=A0 =C2=A0&#39;gen&#39;: false, # so we can get the additional arguments=
<br>
-=C2=A0 &#39;features&#39;: [&#39;json-cli&#39;, &#39;json-cli-hotplug&#39;=
] }<br>
+=C2=A0 &#39;features&#39;: [&#39;json-cli&#39;, &#39;json-cli-hotplug&#39;=
],<br>
+=C2=A0 &#39;allow-preconfig&#39;: true }<br>
<br>
=C2=A0##<br>
=C2=A0# @device_del:<br>
diff --git a/monitor/misc.c b/monitor/misc.c<br>
index 6c5bb82d3b..d3d413d70c 100644<br>
--- a/monitor/misc.c<br>
+++ b/monitor/misc.c<br>
@@ -233,7 +233,7 @@ static void monitor_init_qmp_commands(void)<br>
=C2=A0 =C2=A0 =C2=A0qmp_init_marshal(&amp;qmp_commands);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(&amp;qmp_commands, &quot;device_ad=
d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_device_add, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qmp_device_add, QCO_ALLOW_PRECONFIG, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;qmp_cap_negotiation_commands);<br>
=C2=A0 =C2=A0 =C2=A0qmp_register_command(&amp;qmp_cap_negotiation_commands,=
 &quot;qmp_capabilities&quot;,<br>
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
index 7cbee2b0d8..c53f62be51 100644<br>
--- a/softmmu/qdev-monitor.c<br>
+++ b/softmmu/qdev-monitor.c<br>
@@ -855,6 +855,10 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, =
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0QemuOpts *opts;<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *dev;<br>
<br>
+=C2=A0 =C2=A0 if (!phase_until(PHASE_MACHINE_INITIALIZED, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0opts =3D qemu_opts_from_qdict(qemu_find_opts(&quot;devi=
ce&quot;), qdict, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!opts) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
diff --git a/hmp-commands.hx b/hmp-commands.hx<br>
index 03e6a73d1f..0091b8e2dd 100644<br>
--- a/hmp-commands.hx<br>
+++ b/hmp-commands.hx<br>
@@ -672,6 +672,7 @@ ERST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.help=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;add device, like -device on the command line&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hmp_d=
evice_add,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.command_completion =3D device_add_comple=
tion,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags=C2=A0 =C2=A0 =C2=A0 =3D &quot;p&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0},<br>
<br>
=C2=A0SRST<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div>

--0000000000007239e205dfc763d7--

