Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE14D30E4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:18:05 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRx8e-0005PW-4F
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx76-0004jJ-VW
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:16:29 -0500
Received: from [2a00:1450:4864:20::436] (port=44798
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx72-0004ZH-H8
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:16:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id u1so3249230wrg.11
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 06:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eu5q+IF72Dc8i/IzKe8uegFtihYgdmrQT0qWkEpH/b0=;
 b=VEWhh1vGOU4x6V1UACVsU18z/ifU4DuXU/nlRJEzeSmBrqKIpfGN1bhyTBeBxjVumt
 /58wayZvjX+rb/drPYb3qH7U3oGtXhttiCbJRRflCup/+eqocQHIhCn4s3ITa7MtQ4QE
 OcXIjf07GM1C3IPiQJccsFTUMtkh+Dn0049A7C+gKF3Hv4DTvYW5D4J8qWW3VlVPxPBw
 UogTPRQUnMk78wZwxtDf4ibb4sLUqAsoIL+kgx/4JLh466sIOSPyToK9WOuPZgF5ioC2
 eU1vmfP7Wc+XuqAEkUgmHSVi8XOj4eyB+NchEbhTDvYpzP40ggMmcbGwl6UOuGt0eeZh
 1SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eu5q+IF72Dc8i/IzKe8uegFtihYgdmrQT0qWkEpH/b0=;
 b=Y1gLzKFYpYe8wYX572ALLDOhne2lr2GrmY8dDx9PRt9ylsKhr8XwUYyBgwDsmjTjph
 fwtlTOgkV1u3yriER6GA68/CpNxk/BF9BiqsMK0a+AFm4WO850Xzh6XTY1TH+2VoA5Tk
 wCkDv1Yk1rWoQ4FBDHIDdWuULtjs0zjuiw1cHJOPY3FB4Xzlysn60FF8aafd6f9vVoq3
 3LSE6DGP9bP5/uFRzLsAWSqShiJJLQdphszqdcOeIo7Bf2bh99B5JEZNjJYganj2Y7CJ
 hTfDV1sXTxyD1ecxW7Q3PgCidJDDiybqYLlROnhJ/rjKLyPk8Kb/e1a/udCT21mafcG8
 zcHg==
X-Gm-Message-State: AOAM532Hfdn5y/Ei4XOtNDfK5AwEv0fDp3Lk807iUAfDpMiyDIvjJqnL
 Km0/kRm7VOmbs3ZBql7jW6oRqlJ9HmtJ/vGvBkk=
X-Google-Smtp-Source: ABdhPJyEchgLpyYCOqfPvLs3Xpa+y4DgyGDTsgprDiCKBH94TnawvY+MUtGJfbQdEn50T4VJlkEXir+UmhQwwaHY4ME=
X-Received: by 2002:a5d:4cd1:0:b0:1f0:24d5:7c37 with SMTP id
 c17-20020a5d4cd1000000b001f024d57c37mr16302355wrt.421.1646835383073; Wed, 09
 Mar 2022 06:16:23 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-13-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1640199934-455149-13-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 18:16:10 +0400
Message-ID: <CAJ+F1C+kKZS5N2W+T_TLszooj7_eiiPqiE+2zJdjBW21JqDzbg@mail.gmail.com>
Subject: Re: [PATCH V7 12/29] vl: helper to request re-exec
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000003016e05d9c9bee1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003016e05d9c9bee1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 11:52 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add a qemu_system_exec_request() hook that causes the main loop to exit a=
nd
> re-exec qemu using the specified arguments.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/sysemu/runstate.h |  1 +
>  softmmu/runstate.c        | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index b655c7b..198211b 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, boo=
l
> enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
>  void qemu_register_wakeup_support(void);
>  void qemu_system_shutdown_request(ShutdownCause reason);
> +void qemu_system_exec_request(const strList *args);
>  void qemu_system_powerdown_request(void);
>  void qemu_register_powerdown_notifier(Notifier *notifier);
>  void qemu_register_shutdown_notifier(Notifier *notifier);
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 3d344c9..309a4bf 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -38,6 +38,7 @@
>  #include "monitor/monitor.h"
>  #include "net/net.h"
>  #include "net/vhost_net.h"
> +#include "qapi/util.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-events-run-state.h"
> @@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =3D
>  static NotifierList shutdown_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
>  static uint32_t wakeup_reason_mask =3D ~(1 << QEMU_WAKEUP_REASON_NONE);
> +static char **exec_argv;
>
>  ShutdownCause qemu_shutdown_requested_get(void)
>  {
> @@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)
>      return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
>  }
>
> +static int qemu_exec_requested(void)
> +{
> +    return exec_argv !=3D NULL;
> +}
> +
>  static void qemu_kill_report(void)
>  {
>      if (!qtest_driver() && shutdown_signal) {
> @@ -641,6 +648,13 @@ void qemu_system_shutdown_request(ShutdownCause
> reason)
>      qemu_notify_event();
>  }
>
> +void qemu_system_exec_request(const strList *args)
> +{
> +    exec_argv =3D strv_from_strList(args);
>

I would rather make it take a GStrv, since that's what it actually uses.

I would also check if argv[0] is set (or document the expected behaviour).


> +    shutdown_requested =3D 1;
> +    qemu_notify_event();
> +}
> +
>  static void qemu_system_powerdown(void)
>  {
>      qapi_event_send_powerdown();
> @@ -689,6 +703,13 @@ static bool main_loop_should_exit(void)
>      }
>      request =3D qemu_shutdown_requested();
>      if (request) {
> +
> +        if (qemu_exec_requested()) {
> +            execvp(exec_argv[0], exec_argv);
> +            error_report("execvp %s failed: %s", exec_argv[0],
> strerror(errno));
> +            g_strfreev(exec_argv);
> +            exec_argv =3D NULL;
> +        }
>          qemu_kill_report();
>          qemu_system_shutdown(request);
>          if (shutdown_action =3D=3D SHUTDOWN_ACTION_PAUSE) {
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000003016e05d9c9bee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 11:52 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add a qemu_system_exec_request() hook that causes the main loop =
to exit and<br>
re-exec qemu using the specified arguments.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/sysemu/runstate.h |=C2=A0 1 +<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 ++++++++++++++++++=
+++<br>
=C2=A02 files changed, 22 insertions(+)<br>
<br>
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h<br>
index b655c7b..198211b 100644<br>
--- a/include/sysemu/runstate.h<br>
+++ b/include/sysemu/runstate.h<br>
@@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool =
enabled);<br>
=C2=A0void qemu_register_wakeup_notifier(Notifier *notifier);<br>
=C2=A0void qemu_register_wakeup_support(void);<br>
=C2=A0void qemu_system_shutdown_request(ShutdownCause reason);<br>
+void qemu_system_exec_request(const strList *args);<br>
=C2=A0void qemu_system_powerdown_request(void);<br>
=C2=A0void qemu_register_powerdown_notifier(Notifier *notifier);<br>
=C2=A0void qemu_register_shutdown_notifier(Notifier *notifier);<br>
diff --git a/softmmu/runstate.c b/softmmu/runstate.c<br>
index 3d344c9..309a4bf 100644<br>
--- a/softmmu/runstate.c<br>
+++ b/softmmu/runstate.c<br>
@@ -38,6 +38,7 @@<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;net/vhost_net.h&quot;<br>
+#include &quot;qapi/util.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-run-state.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-events-run-state.h&quot;<br>
@@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =3D<br>
=C2=A0static NotifierList shutdown_notifiers =3D<br>
=C2=A0 =C2=A0 =C2=A0NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);<br>
=C2=A0static uint32_t wakeup_reason_mask =3D ~(1 &lt;&lt; QEMU_WAKEUP_REASO=
N_NONE);<br>
+static char **exec_argv;<br>
<br>
=C2=A0ShutdownCause qemu_shutdown_requested_get(void)<br>
=C2=A0{<br>
@@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)<br>
=C2=A0 =C2=A0 =C2=A0return qatomic_xchg(&amp;shutdown_requested, SHUTDOWN_C=
AUSE_NONE);<br>
=C2=A0}<br>
<br>
+static int qemu_exec_requested(void)<br>
+{<br>
+=C2=A0 =C2=A0 return exec_argv !=3D NULL;<br>
+}<br>
+<br>
=C2=A0static void qemu_kill_report(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!qtest_driver() &amp;&amp; shutdown_signal) {<br>
@@ -641,6 +648,13 @@ void qemu_system_shutdown_request(ShutdownCause reason=
)<br>
=C2=A0 =C2=A0 =C2=A0qemu_notify_event();<br>
=C2=A0}<br>
<br>
+void qemu_system_exec_request(const strList *args)<br>
+{<br>
+=C2=A0 =C2=A0 exec_argv =3D strv_from_strList(args);<br></blockquote><div>=
<br></div><div>I would rather make it take a GStrv, since that&#39;s what i=
t actually uses.</div><div><br></div><div>I would also check if argv[0] is =
set (or document the expected behaviour).<br></div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 shutdown_requested =3D 1;<br>
+=C2=A0 =C2=A0 qemu_notify_event();<br>
+}<br>
+<br>
=C2=A0static void qemu_system_powerdown(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qapi_event_send_powerdown();<br>
@@ -689,6 +703,13 @@ static bool main_loop_should_exit(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0request =3D qemu_shutdown_requested();<br>
=C2=A0 =C2=A0 =C2=A0if (request) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_exec_requested()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execvp(exec_argv[0], exec_argv);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;execvp %s fai=
led: %s&quot;, exec_argv[0], strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_strfreev(exec_argv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_argv =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_kill_report();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_shutdown(request);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (shutdown_action =3D=3D SHUTDOWN_ACTIO=
N_PAUSE) {<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000003016e05d9c9bee1--

