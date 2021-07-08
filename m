Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996783C1538
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:33:47 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1V61-00033s-LB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1V4J-0002LM-ON
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:31:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1V4D-0000y7-W6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:31:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bu12so10067872ejb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6TvhYmn/ixIqo3ZE3vx90RfHTqgU/+n3X4l/Vapw30s=;
 b=vSbpD2TeD8RP60CeSQmNX+5djWbuzjIbymiELBkxh1A3yDTkm3kCGErCOj3M6NbgNF
 9CcLToQAI+oHBaE+Mj12S1NDDeUy/P/SqBe3BQYM1q8/JaSP4nvke+afkTh81o1qWKwJ
 t3hj2oE2eYQgM8Gwo55NtEAEj8sm9gF+ETbY2ZUvMLW+8r8t3+Mdsz87A8b5eGywPw9X
 qclJvAa03d9g2Lg/1PNXAmMQWNuAO1D/BQzJRAMn5cswckdkd1v1eSgMbZi3X/tvvsw9
 uLkEVglZ8wKgX4yAd+bh3ttlxJTc3nSgBNtaUcc8R5PcrGWJMOiBqv2Klfmp9lc+kZUS
 WSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TvhYmn/ixIqo3ZE3vx90RfHTqgU/+n3X4l/Vapw30s=;
 b=iYoRctM43VzDS2SenX1NdCGYwOqu0Mqj3t9Rdgc6a1Qdscw/L21a94ty7OJ/lm2PsW
 8eZBdlpAGbk0kIPjlFMkw3KtpP6srxrm4T5ka6lIkW9fID2qfFpPR05JOTN8rMqNvhP+
 /Z32oDoK1KmU9cF0nTyR7htYDVpng39/XXtwj1Ek/AKcXGedXs0RYKEw9fIV/pM6Psv9
 uFH44mcNvZepRnlSkLWXqQYP09G3P90Db4lUnB9zGBeZSIvFXXVr7KvtXHGSLw/zidx0
 OIB8Qq0hBQS1EWYN8KXdgX3P6RIZ/FAGYHYtJE9hnnPh5Wk7g7nvf/sOESZ6/Ct/y2wA
 maQA==
X-Gm-Message-State: AOAM531S6FKzMgB1iF0Rc0y+bdUJBB3HC3Qm0BxdiegAGVGxjpin9mRC
 WBRZK+1mTyxWScS9rTXBAinNSb5wYU/AmpW5ykQ=
X-Google-Smtp-Source: ABdhPJxQJccIRhrnXfib/YFnZIjldF932YIcnsbR+QNr5rdDw1kUAWwwzM1zrQvsx6qaNUbpBiaD74Bg9m0VM/tkAg0=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr31242264ejc.109.1625754712476; 
 Thu, 08 Jul 2021 07:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-9-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-9-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 18:31:41 +0400
Message-ID: <CAJ+F1C+3cKu6r+RSw5E1_OkAXA03Z1cHfnkFjMtzOvrU_6mZcw@mail.gmail.com>
Subject: Re: [PATCH V5 08/25] vl: add helper to request re-exec
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000210e2005c69d84cb"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000210e2005c69d84cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:46 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add a qemu_system_exec_request() hook that causes the main loop to exit a=
nd
> re-exec qemu using the specified arguments.
>

I assume it works ok with -sandbox on,spawn=3Dallow ?


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/sysemu/runstate.h |  1 +
>  softmmu/runstate.c        | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index ed4b735..e1ae7e5 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, boo=
l
> enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
>  void qemu_register_wakeup_support(void);
>  void qemu_system_shutdown_request(ShutdownCause reason);
> +void qemu_system_exec_request(strList *args);
>  void qemu_system_powerdown_request(void);
>  void qemu_register_powerdown_notifier(Notifier *notifier);
>  void qemu_register_shutdown_notifier(Notifier *notifier);
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 7fe4967..8474a01 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -355,6 +355,7 @@ static NotifierList wakeup_notifiers =3D
>  static NotifierList shutdown_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
>  static uint32_t wakeup_reason_mask =3D ~(1 << QEMU_WAKEUP_REASON_NONE);
> +static char **exec_argv;
>
>  ShutdownCause qemu_shutdown_requested_get(void)
>  {
> @@ -371,6 +372,11 @@ static int qemu_shutdown_requested(void)
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
> @@ -645,6 +651,32 @@ void qemu_system_shutdown_request(ShutdownCause
> reason)
>      qemu_notify_event();
>  }
>
> +static char **make_argv(strList *args)
>

I'd suggest making it a generic strv_from_strList() function. Take const as
argument too.


> +{
> +    strList *arg;
> +    char **argv;
> +    int n =3D 1, i =3D 0;
> +
> +    for (arg =3D args; arg !=3D NULL; arg =3D arg->next) {
> +        n++;
> +    }
>

We could use a QAPI_LIST_LENGTH() in qapi/util.h

+
> +    argv =3D g_malloc(n * sizeof(char *));
> +    for (arg =3D args; arg !=3D NULL; arg =3D arg->next) {
> +        argv[i++] =3D g_strdup(arg->value);
> +    }
> +    argv[i] =3D NULL;
> +
> +    return argv;
> +}
> +
> +void qemu_system_exec_request(strList *args)
>

const args, and documentation could help.

+{
> +    exec_argv =3D make_argv(args);
> +    shutdown_requested =3D 1;
> +    qemu_notify_event();
> +}
> +
>  static void qemu_system_powerdown(void)
>  {
>      qapi_event_send_powerdown();
> @@ -693,6 +725,11 @@ static bool main_loop_should_exit(void)
>      }
>      request =3D qemu_shutdown_requested();
>      if (request) {
> +
> +        if (qemu_exec_requested()) {
> +            execvp(exec_argv[0], exec_argv);
> +            error_setg_errno(&error_fatal, errno, "execvp failed");
>

Can this be handled more gracefully instead?

g_strfreev the argv and report an error?


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

--000000000000210e2005c69d84cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:46 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add a qemu_system_exec_request() hook that causes the main loop =
to exit and<br>
re-exec qemu using the specified arguments.<br></blockquote><div><br></div>=
<div>I assume it works ok with -sandbox on,spawn=3Dallow ?</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/sysemu/runstate.h |=C2=A0 1 +<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++++++++++++=
+++++++++++++++++++<br>
=C2=A02 files changed, 38 insertions(+)<br>
<br>
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h<br>
index ed4b735..e1ae7e5 100644<br>
--- a/include/sysemu/runstate.h<br>
+++ b/include/sysemu/runstate.h<br>
@@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool =
enabled);<br>
=C2=A0void qemu_register_wakeup_notifier(Notifier *notifier);<br>
=C2=A0void qemu_register_wakeup_support(void);<br>
=C2=A0void qemu_system_shutdown_request(ShutdownCause reason);<br>
+void qemu_system_exec_request(strList *args);<br>
=C2=A0void qemu_system_powerdown_request(void);<br>
=C2=A0void qemu_register_powerdown_notifier(Notifier *notifier);<br>
=C2=A0void qemu_register_shutdown_notifier(Notifier *notifier);<br>
diff --git a/softmmu/runstate.c b/softmmu/runstate.c<br>
index 7fe4967..8474a01 100644<br>
--- a/softmmu/runstate.c<br>
+++ b/softmmu/runstate.c<br>
@@ -355,6 +355,7 @@ static NotifierList wakeup_notifiers =3D<br>
=C2=A0static NotifierList shutdown_notifiers =3D<br>
=C2=A0 =C2=A0 =C2=A0NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);<br>
=C2=A0static uint32_t wakeup_reason_mask =3D ~(1 &lt;&lt; QEMU_WAKEUP_REASO=
N_NONE);<br>
+static char **exec_argv;<br>
<br>
=C2=A0ShutdownCause qemu_shutdown_requested_get(void)<br>
=C2=A0{<br>
@@ -371,6 +372,11 @@ static int qemu_shutdown_requested(void)<br>
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
@@ -645,6 +651,32 @@ void qemu_system_shutdown_request(ShutdownCause reason=
)<br>
=C2=A0 =C2=A0 =C2=A0qemu_notify_event();<br>
=C2=A0}<br>
<br>
+static char **make_argv(strList *args)<br>
</blockquote><div><br></div><div>I&#39;d suggest making it a generic strv_f=
rom_strList() function. Take const as argument too.<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">+{<br>
+=C2=A0 =C2=A0 strList *arg;<br>
+=C2=A0 =C2=A0 char **argv;<br>
+=C2=A0 =C2=A0 int n =3D 1, i =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 for (arg =3D args; arg !=3D NULL; arg =3D arg-&gt;next) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 n++;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>We could use a QAPI_LI=
ST_LENGTH() in qapi/util.h<br></div><div> <br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 argv =3D g_malloc(n * sizeof(char *));<br>
+=C2=A0 =C2=A0 for (arg =3D args; arg !=3D NULL; arg =3D arg-&gt;next) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[i++] =3D g_strdup(arg-&gt;value);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 argv[i] =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 return argv;<br>
+}<br>
+<br>
+void qemu_system_exec_request(strList *args)<br></blockquote><div><br></di=
v><div>const args, and documentation could help. <br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 exec_argv =3D make_argv(args);<br>
+=C2=A0 =C2=A0 shutdown_requested =3D 1;<br>
+=C2=A0 =C2=A0 qemu_notify_event();<br>
+}<br>
+<br>
=C2=A0static void qemu_system_powerdown(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qapi_event_send_powerdown();<br>
@@ -693,6 +725,11 @@ static bool main_loop_should_exit(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0request =3D qemu_shutdown_requested();<br>
=C2=A0 =C2=A0 =C2=A0if (request) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_exec_requested()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execvp(exec_argv[0], exec_argv);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(&amp;error_fata=
l, errno, &quot;execvp failed&quot;);<br></blockquote><div><br></div>Can th=
is be handled more gracefully instead?</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">g_strfreev the argv and report an error?<b=
r></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
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

--000000000000210e2005c69d84cb--

