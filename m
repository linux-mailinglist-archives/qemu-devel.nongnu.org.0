Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDD533227
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:05:48 +0200 (CEST)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntamp-0007fK-UD
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntae6-00055t-3F
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:56:46 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntae4-0000EM-0U
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:56:45 -0400
Received: by mail-ej1-x635.google.com with SMTP id y13so36756518eje.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i+mH/Xd7bZe/zEblIr5ufOOWbAi2+ClX8GBlt05AAZA=;
 b=kSU2fO3OcFannowuAypLGeY2nYwOinIV+Sgh16tIb3kzSL2dcQG30DRSohYlMg+SIV
 aZ91w+rGwTkJhoEp1+2WkjORbDLSk9cWtp1xuPoJwTBemdJXr0R6OaACVmF4nQ70q+v2
 kuPkbLy72gPtpbC+dppQ7d6a2i/tUqbl2m7PbDhMn1M4h6JsU9d36U6bT6im4EAEgNqc
 uC9FKmx7cZVkZ+G9F2KYZh4xTr4uKtR2ssnl3/XV9V9yFZM8dwfNItnA+fQyUJ4ER/pf
 MqXZwIrQRXtO/uqAucZjiH/tf2TiCUHgDTiS8ON4x/yuOCzIXdTU2QAm/q/SskM1P94j
 TTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i+mH/Xd7bZe/zEblIr5ufOOWbAi2+ClX8GBlt05AAZA=;
 b=Lu2x7+xnnP5f/C8Vjag8pFNSt27bzxVC2oJXLORKtQ2/HUgG7Td0qh6jxu/sWL3oKC
 m1YdyxDvZYgO0PRrQI5lBIza2JK3e4ztQ/J9S6p6egXbKiyvPELnHF9TSJgt6LytQbaK
 HZZ5XV62bFx+zGURkPN6JloDEH1rmkSNbmcy98pU58umqKR893q5DdjNaRaEjD/8Lv1V
 dn5O3/kQr8h3vmrIRwiIV97ARLm6mZuEvyM57cn/poVcfy8REbVbk+1ivN0zbQbcAQrm
 czz/fXXySIQHAY7jtxGVpc7OjL9E3y5ZPbZOhY7kYJ3V3f5Lj+8VqfaOeC599gfimxpJ
 Q+OA==
X-Gm-Message-State: AOAM533s4miWwgrqDKFrHEBC+tLrbf+75OSkfRYobhg3Q3iyNt9pSYfZ
 OfiG3raKviDiYV7OjJ6Dj8mHe1mYo4Im9h8ch+H1tLJx1O3McA==
X-Google-Smtp-Source: ABdhPJxX/xMKwFKF8PtKis4Wy4178uXAWvmAEggRznon+AKq6qb3FzEFuCBUwuDgwjKwCcAblxEbezD9+4uYrugFwu4=
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr25888713ejc.762.1653422202693; Tue, 24
 May 2022 12:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
 <20220519153402.41540-3-damien.hedde@greensocs.com>
In-Reply-To: <20220519153402.41540-3-damien.hedde@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:56:30 +0800
Message-ID: <CALw707q_53YGsyEc=B66-f8xQLTS2FtWtrRDYcHY92r63JAQDw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] machine&vl: introduce phase_until() to handle
 phase transitions
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="0000000000000e4c0805dfc75b86"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x635.google.com
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

--0000000000000e4c0805dfc75b86
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jim Shu <jim.shu@sifive.com>

On Thu, May 19, 2022 at 11:41 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> phase_until() is implemented in vl.c and is meant to be used
> to make startup progress up to a specified phase being reached().
> At this point, no behavior change is introduced: phase_until()
> only supports a single double transition corresponding
> to the functionality of qmp_exit_preconfig():
> + accel-created -> machine-initialized -> machine-ready
>
> As a result qmp_exit_preconfig() now uses phase_until().
>
> This commit is a preparation to support cold plugging a device
> using qapi command (which will be introduced in a following commit).
> For this we need fine grain control of the phase.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> v5:
>   + refactor to avoid indentation change
> ---
>  include/hw/qdev-core.h | 14 +++++++++++++
>  softmmu/vl.c           | 46 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index e29c705b74..5f73d06408 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -909,4 +909,18 @@ extern bool phase_check(MachineInitPhase phase);
>   */
>  extern void phase_advance(MachineInitPhase phase);
>
> +/**
> + * @phase_until:
> + * @phase: the target phase
> + * @errp: error report
> + *
> + * Make the machine init progress until the target phase is reached.
> + *
> + * Its is a no-op is the target phase is the current or an earlier
> + * phase.
> + *
> + * Returns true in case of success.
> + */
> +extern bool phase_until(MachineInitPhase phase, Error **errp);
> +
>  #endif
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 84a31eba76..7f8d15b5b8 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2702,11 +2702,17 @@ void qmp_x_exit_preconfig(Error **errp)
>          error_setg(errp, "The command is permitted only before machine
> initialization");
>          return;
>      }
> +    phase_until(PHASE_MACHINE_READY, errp);
> +}
>
> +static void qemu_phase_ready(Error **errp)
> +{
>      qemu_init_board();
> +    /* phase is now PHASE_MACHINE_INITIALIZED. */
>      qemu_create_cli_devices();
>      cxl_fixed_memory_window_link_targets(errp);
>      qemu_machine_creation_done();
> +    /* Phase is now PHASE_MACHINE_READY. */
>
>      if (loadvm) {
>          load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
> @@ -2729,6 +2735,46 @@ void qmp_x_exit_preconfig(Error **errp)
>      }
>  }
>
> +bool phase_until(MachineInitPhase phase, Error **errp)
> +{
> +    ERRP_GUARD();
> +    if (!phase_check(PHASE_ACCEL_CREATED)) {
> +        error_setg(errp, "Phase transition is not supported until
> accelerator"
> +                   " is created");
> +        return false;
> +    }
> +
> +    while (!phase_check(phase)) {
> +        MachineInitPhase cur_phase = phase_get();
> +
> +        switch (cur_phase) {
> +        case PHASE_ACCEL_CREATED:
> +            qemu_phase_ready(errp);
> +            break;
> +
> +        default:
> +            /*
> +             * If we end up here, it is because we miss a case above.
> +             */
> +            error_setg(&error_abort, "Requested phase transition is not"
> +                       " implemented");
> +            return false;
> +        }
> +
> +        if (*errp) {
> +            return false;
> +        }
> +
> +        /*
> +         * Ensure we made some progress.
> +         * With the default case above, it should be enough to prevent
> +         * any infinite loop.
> +         */
> +        assert(cur_phase < phase_get());
> +    }
> +    return true;
> +}
> +
>  void qemu_init(int argc, char **argv, char **envp)
>  {
>      QemuOpts *opts;
> --
> 2.36.1
>
>
>

--0000000000000e4c0805dfc75b86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at =
11:41 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com">dam=
ien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">phase_until() is implemented in vl.c and is meant to=
 be used<br>
to make startup progress up to a specified phase being reached().<br>
At this point, no behavior change is introduced: phase_until()<br>
only supports a single double transition corresponding<br>
to the functionality of qmp_exit_preconfig():<br>
+ accel-created -&gt; machine-initialized -&gt; machine-ready<br>
<br>
As a result qmp_exit_preconfig() now uses phase_until().<br>
<br>
This commit is a preparation to support cold plugging a device<br>
using qapi command (which will be introduced in a following commit).<br>
For this we need fine grain control of the phase.<br>
<br>
Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.co=
m" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
---<br>
<br>
v5:<br>
=C2=A0 + refactor to avoid indentation change<br>
---<br>
=C2=A0include/hw/qdev-core.h | 14 +++++++++++++<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 46 +++++++++++=
+++++++++++++++++++++++++++++++<br>
=C2=A02 files changed, 60 insertions(+)<br>
<br>
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
index e29c705b74..5f73d06408 100644<br>
--- a/include/hw/qdev-core.h<br>
+++ b/include/hw/qdev-core.h<br>
@@ -909,4 +909,18 @@ extern bool phase_check(MachineInitPhase phase);<br>
=C2=A0 */<br>
=C2=A0extern void phase_advance(MachineInitPhase phase);<br>
<br>
+/**<br>
+ * @phase_until:<br>
+ * @phase: the target phase<br>
+ * @errp: error report<br>
+ *<br>
+ * Make the machine init progress until the target phase is reached.<br>
+ *<br>
+ * Its is a no-op is the target phase is the current or an earlier<br>
+ * phase.<br>
+ *<br>
+ * Returns true in case of success.<br>
+ */<br>
+extern bool phase_until(MachineInitPhase phase, Error **errp);<br>
+<br>
=C2=A0#endif<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 84a31eba76..7f8d15b5b8 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2702,11 +2702,17 @@ void qmp_x_exit_preconfig(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;The command is per=
mitted only before machine initialization&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 phase_until(PHASE_MACHINE_READY, errp);<br>
+}<br>
<br>
+static void qemu_phase_ready(Error **errp)<br>
+{<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_board();<br>
+=C2=A0 =C2=A0 /* phase is now PHASE_MACHINE_INITIALIZED. */<br>
=C2=A0 =C2=A0 =C2=A0qemu_create_cli_devices();<br>
=C2=A0 =C2=A0 =C2=A0cxl_fixed_memory_window_link_targets(errp);<br>
=C2=A0 =C2=A0 =C2=A0qemu_machine_creation_done();<br>
+=C2=A0 =C2=A0 /* Phase is now PHASE_MACHINE_READY. */<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (loadvm) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load_snapshot(loadvm, NULL, false, NULL, =
&amp;error_fatal);<br>
@@ -2729,6 +2735,46 @@ void qmp_x_exit_preconfig(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+bool phase_until(MachineInitPhase phase, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
+=C2=A0 =C2=A0 if (!phase_check(PHASE_ACCEL_CREATED)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Phase transition is not=
 supported until accelerator&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
; is created&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (!phase_check(phase)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MachineInitPhase cur_phase =3D phase_get();<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (cur_phase) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PHASE_ACCEL_CREATED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_phase_ready(errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we end up here, it is=
 because we miss a case above.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;error_abort, &qu=
ot;Requested phase transition is not&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; implemented&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Ensure we made some progress.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* With the default case above, it should=
 be enough to prevent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any infinite loop.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(cur_phase &lt; phase_get());<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
=C2=A0void qemu_init(int argc, char **argv, char **envp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuOpts *opts;<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div>

--0000000000000e4c0805dfc75b86--

