Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3102533235
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:11:02 +0200 (CEST)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntart-0005ca-L3
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaeM-0005ju-6E
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:57:02 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaeK-0000F6-9g
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:57:01 -0400
Received: by mail-ej1-x62a.google.com with SMTP id q21so17301987ejm.1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLKmYJXvdLzYjrkthFQ9bNuXdYRo5TlxyUr6SzxaTBo=;
 b=aswS1Baag6CYpP6EEjBIqA9+8GeQrU4o+4Mnull42EPEtRxjCwVuf6fp7DHoYof1VJ
 yD5f00wWE5OAMP2WeJCInaEJQdSpckGnOlTSUKeoWJUkGN+9hFcPSo0eSgmdOXkkrEV0
 nguKSTeeGodGHUsNstBRM4ItxpKULgmIoeeOmfP+huUkDlaJtX4qFMSEcBK4ypi+s7eV
 NVQrmY/znRgNHsrYi4cPaMj6i1Gr8bjQQeAiB8BG1X2WSwfP+4w/qB12/76yCO0oHgo2
 hjgTf8CL3jHYxIpgh2C48Bv2g6lZ06jcTylZMnDlbmAfUFzOzAKQANz6f1c2E8V2Pvmp
 FhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLKmYJXvdLzYjrkthFQ9bNuXdYRo5TlxyUr6SzxaTBo=;
 b=vswd9hhUCT51RJT7rYU84LjsoItseVWH265uWAnM8pFvnrp/vT4BI/8aTXfDj+IsPt
 Zc/Qrao8jdstLWfu53sphEs/dI3vYMCITyb/bVCSB82PuGncpV8PF9+ipUv0it9RDBv9
 da3yZlswZkzF65+hJ6T8GLwBOE+q7jGiFRxh8JlgPEuHKC27ojug7NxnTMBGDfvRSJjP
 OcaxxtIUSRnwqS0r8Srpfc9L5wk3jW7wbTGK3FO9w8ArK5rr4JGnsBNquQvZucaLXx/1
 Voh5/bMJ5DJttlIvb4cnXP9OIVabdvNyP3og35/6Y03J5Eysf/Ae6EhJC4VaL08e6MuF
 8OpA==
X-Gm-Message-State: AOAM533qIY7kEliKMtfNxAuyV5aZO5kJgci1E+HdVUnUkHt3csS5PMkZ
 2VTr2FshQPcrW65g5whvmJdRBoAywj17C9/qU4Jy8Q==
X-Google-Smtp-Source: ABdhPJzO8Titd5GGTJVbXDGl4ABDF+5STvR88z4gT6wg5JNOVppwNK6EF30WO5BaczdUCtCEZkPt/iuQzml7wF6+VhI=
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr25448007ejc.600.1653422219043; Tue, 24
 May 2022 12:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
 <20220519153402.41540-4-damien.hedde@greensocs.com>
In-Reply-To: <20220519153402.41540-4-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:56:46 +0800
Message-ID: <CALw707oTgZ-pJHjFq6wX4+EeeTiQQEuBsjebQJ4jvD_kcWvW+g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] vl: support machine-initialized target in
 phase_until()
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000007bcce05dfc75cb5"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62a.google.com
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

--00000000000007bcce05dfc75cb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, May 19, 2022 at 11:36 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> phase_until() now supports the following transitions:
> + accel-created -> machine-initialized
> + machine-initialized -> machine-ready
>
> As a consequence we can now support the use of qmp_exit_preconfig()
> from phases _accel-created_ and _machine-initialized_.
>
> This commit is a preparation to support cold plugging a device
> using qapi (which will be introduced in a following commit). For this
> we need fine grain control of the phase.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>
> v5: update due to refactor of previous commit
> ---
>  softmmu/vl.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7f8d15b5b8..ea15e37973 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2698,8 +2698,9 @@ static void qemu_machine_creation_done(void)
>
>  void qmp_x_exit_preconfig(Error **errp)
>  {
> -    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> -        error_setg(errp, "The command is permitted only before machine
> initialization");
> +    if (phase_check(PHASE_MACHINE_READY)) {
> +        error_setg(errp, "The command is permitted only before"
> +                         " machine is ready");
>          return;
>      }
>      phase_until(PHASE_MACHINE_READY, errp);
> @@ -2707,9 +2708,6 @@ void qmp_x_exit_preconfig(Error **errp)
>
>  static void qemu_phase_ready(Error **errp)
>  {
> -    qemu_init_board();
> -    /* phase is now PHASE_MACHINE_INITIALIZED. */
> -    qemu_create_cli_devices();
>      cxl_fixed_memory_window_link_targets(errp);
>      qemu_machine_creation_done();
>      /* Phase is now PHASE_MACHINE_READY. */
> @@ -2749,6 +2747,24 @@ bool phase_until(MachineInitPhase phase, Error
> **errp)
>
>          switch (cur_phase) {
>          case PHASE_ACCEL_CREATED:
> +            qemu_init_board();
> +            /* Phase is now PHASE_MACHINE_INITIALIZED. */
> +            /*
> +             * Handle CLI devices now in order leave this case in a stat=
e
> +             * where we can cold plug devices with QMP. The following ca=
ll
> +             * handles the CLI options:
> +             * + -fw_cfg (has side effects on device cold plug)
> +             * + -device
> +             */
> +            qemu_create_cli_devices();
> +            /*
> +             * At this point all CLI options are handled apart:
> +             * + -S (autostart)
> +             * + -incoming
> +             */
> +            break;
> +
> +        case PHASE_MACHINE_INITIALIZED:
>              qemu_phase_ready(errp);
>              break;
>
> --
> 2.36.1
>
>
>

--00000000000007bcce05dfc75cb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at =
11:36 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com">dam=
ien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">phase_until() now supports the following transitions=
:<br>
+ accel-created -&gt; machine-initialized<br>
+ machine-initialized -&gt; machine-ready<br>
<br>
As a consequence we can now support the use of qmp_exit_preconfig()<br>
from phases _accel-created_ and _machine-initialized_.<br>
<br>
This commit is a preparation to support cold plugging a device<br>
using qapi (which will be introduced in a following commit). For this<br>
we need fine grain control of the phase.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
<br>
v5: update due to refactor of previous commit<br>
---<br>
=C2=A0softmmu/vl.c | 26 +++++++++++++++++++++-----<br>
=C2=A01 file changed, 21 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 7f8d15b5b8..ea15e37973 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2698,8 +2698,9 @@ static void qemu_machine_creation_done(void)<br>
<br>
=C2=A0void qmp_x_exit_preconfig(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (phase_check(PHASE_MACHINE_INITIALIZED)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is permitte=
d only before machine initialization&quot;);<br>
+=C2=A0 =C2=A0 if (phase_check(PHASE_MACHINE_READY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is permitte=
d only before&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot; machine is ready&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0phase_until(PHASE_MACHINE_READY, errp);<br>
@@ -2707,9 +2708,6 @@ void qmp_x_exit_preconfig(Error **errp)<br>
<br>
=C2=A0static void qemu_phase_ready(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qemu_init_board();<br>
-=C2=A0 =C2=A0 /* phase is now PHASE_MACHINE_INITIALIZED. */<br>
-=C2=A0 =C2=A0 qemu_create_cli_devices();<br>
=C2=A0 =C2=A0 =C2=A0cxl_fixed_memory_window_link_targets(errp);<br>
=C2=A0 =C2=A0 =C2=A0qemu_machine_creation_done();<br>
=C2=A0 =C2=A0 =C2=A0/* Phase is now PHASE_MACHINE_READY. */<br>
@@ -2749,6 +2747,24 @@ bool phase_until(MachineInitPhase phase, Error **err=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cur_phase) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PHASE_ACCEL_CREATED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_init_board();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Phase is now PHASE_MACHINE_IN=
ITIALIZED. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Handle CLI devices now i=
n order leave this case in a state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* where we can cold plug d=
evices with QMP. The following call<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* handles the CLI options:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* + -fw_cfg (has side effe=
cts on device cold plug)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* + -device<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_create_cli_devices();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* At this point all CLI op=
tions are handled apart:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* + -S (autostart)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* + -incoming<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PHASE_MACHINE_INITIALIZED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_phase_ready(errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div>

--00000000000007bcce05dfc75cb5--

