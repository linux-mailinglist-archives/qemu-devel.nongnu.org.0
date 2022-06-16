Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F554E675
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 17:57:37 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1rsF-0001e5-Mf
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 11:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1rqx-0000xw-Oj
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:56:15 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1rqu-0004qJ-7E
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:56:15 -0400
Received: by mail-lf1-x133.google.com with SMTP id p18so2897036lfr.1
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nqmsU0FtAwxIjM6v5F+17p4V1U0pVkSPTzfuopH1vBs=;
 b=Qo+YPtfZhSVVkNJo5cM/05coBSyrZX0F6VigGdi6Nrx7OmmfYfIGk32GVGyGl9U3/L
 6jVYjImR3BSR2d02mHDHeWWnqpBDsvyvMTDcjhibAio4fvVLyMoNya/1TRVZW9SpTRR7
 PJ5AqX2B2iAlwOeZUvHmgKh9hXS+ZGzDwthL36QJLPTO49/KphNdsCXQHJAumNFFLtDp
 kwU47MSyVwWz617UJwaRF7fYOjmst0PDRZEswDyzCvdbHpvynBKHUL77BIMDH9f6xuFf
 z5JEV9JVOPzYn/MGlgXWGZfNquJCspi8RJy5rRTo8NXs+B/UavXImONUzuZPILWqv3rh
 kj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nqmsU0FtAwxIjM6v5F+17p4V1U0pVkSPTzfuopH1vBs=;
 b=bwaePtPf/yUPv0SYWhodD3sVE63u0H4CJgAghD3FiCYrZ9cuzvYdIBNVnD4ffYOFBg
 tbXCCU/pfjvDG6lhl9AEzwka4uFNMoNiC991/v6xjJOphi19GZ7jMEIyRr44Ee9RqMzm
 BGBypeWKM82HyB0tv5p8oI4hyTRkbKvlvM4gMHNyP3TBQluUjUDrPjjQaXLiS81p4pWG
 n1OstcoiG3c6CvY6Z5GCeBdfNxbx2WWZnfXq9AZuLk+qEm5+WB/0+YvcvW2A12DpgoBt
 My9j70TwIlH4J6u4v6z4Ulu6fJDuLeDDOUro+w/65rkUXSM7Gcoy8saqI84HaKCCx2mN
 UjGQ==
X-Gm-Message-State: AJIora+v/veO6gJUpS1U3LGFRgDTEplLWRhcl+hFGDmcXpLBQ3izvPlv
 gqPSYXs7AivPHhjt7Qe7I1LuhRg9Gk/o57dUA3o=
X-Google-Smtp-Source: AGRyM1vGKKLaUYVV8SNnn8FW0RWl3slTZWnR36yFaV4OTQNS2yYRGJ5DWtj2N8vckYUuL+ZqIhDUZokWz9p+9e/NVSk=
X-Received: by 2002:a05:6512:3e03:b0:479:2e0c:3d2c with SMTP id
 i3-20020a0565123e0300b004792e0c3d2cmr3059727lfv.654.1655394969844; Thu, 16
 Jun 2022 08:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-6-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-6-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 19:55:58 +0400
Message-ID: <CAJ+F1CLZrnj=AXb=-C+MOU5xB7h_4YUqrn4W+rV6yoUax2ur7g@mail.gmail.com>
Subject: Re: [PATCH V8 05/39] vl: start on wakeup request
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000023ff7f05e192adaf"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000023ff7f05e192adaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jun 15, 2022 at 7:27 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> If qemu starts and loads a VM in the suspended state, then a later wakeup
> request will set the state to running, which is not sufficient to
> initialize
> the vm, as vm_start was never called during this invocation of qemu.  See
> qemu_system_wakeup_request().
>
> Define the start_on_wakeup_requested() hook to cause vm_start() to be
> called
> when processing the wakeup request.
>

Nothing calls qemu_system_start_on_wakeup_request() yet, so it would be
useful to say where this is going to be used next.

(otherwise, it seems ok to me)


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/sysemu/runstate.h |  1 +
>  softmmu/runstate.c        | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index f3ed525..16c1c41 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -57,6 +57,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>  void qemu_system_suspend_request(void);
>  void qemu_register_suspend_notifier(Notifier *notifier);
>  bool qemu_wakeup_suspend_enabled(void);
> +void qemu_system_start_on_wakeup_request(void);
>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>  void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index fac7b63..9b27d74 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -115,6 +115,7 @@ static const RunStateTransition
> runstate_transitions_def[] =3D {
>      { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
>
>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
> @@ -335,6 +336,7 @@ void vm_state_notify(bool running, RunState state)
>      }
>  }
>
> +static bool start_on_wakeup_requested;
>  static ShutdownCause reset_requested;
>  static ShutdownCause shutdown_requested;
>  static int shutdown_signal;
> @@ -562,6 +564,11 @@ void qemu_register_suspend_notifier(Notifier
> *notifier)
>      notifier_list_add(&suspend_notifiers, notifier);
>  }
>
> +void qemu_system_start_on_wakeup_request(void)
> +{
> +    start_on_wakeup_requested =3D true;
> +}
> +
>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>  {
>      trace_system_wakeup_request(reason);
> @@ -574,7 +581,14 @@ void qemu_system_wakeup_request(WakeupReason reason,
> Error **errp)
>      if (!(wakeup_reason_mask & (1 << reason))) {
>          return;
>      }
> -    runstate_set(RUN_STATE_RUNNING);
> +
> +    if (start_on_wakeup_requested) {
> +        start_on_wakeup_requested =3D false;
> +        vm_start();
> +    } else {
> +        runstate_set(RUN_STATE_RUNNING);
> +    }
> +
>      wakeup_reason =3D reason;
>      qemu_notify_event();
>  }
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000023ff7f05e192adaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:27 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If qemu starts and loads a VM in the suspended state, then a lat=
er wakeup<br>
request will set the state to running, which is not sufficient to initializ=
e<br>
the vm, as vm_start was never called during this invocation of qemu.=C2=A0 =
See<br>
qemu_system_wakeup_request().<br>
<br>
Define the start_on_wakeup_requested() hook to cause vm_start() to be calle=
d<br>
when processing the wakeup request.<br></blockquote><div><br></div><div>Not=
hing calls qemu_system_start_on_wakeup_request() yet, so it would be useful=
 to say where this is going to be used next.</div><div><br></div><div>(othe=
rwise, it seems ok to me)</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/sysemu/runstate.h |=C2=A0 1 +<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++++++++++++++-<b=
r>
=C2=A02 files changed, 16 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h<br>
index f3ed525..16c1c41 100644<br>
--- a/include/sysemu/runstate.h<br>
+++ b/include/sysemu/runstate.h<br>
@@ -57,6 +57,7 @@ void qemu_system_reset_request(ShutdownCause reason);<br>
=C2=A0void qemu_system_suspend_request(void);<br>
=C2=A0void qemu_register_suspend_notifier(Notifier *notifier);<br>
=C2=A0bool qemu_wakeup_suspend_enabled(void);<br>
+void qemu_system_start_on_wakeup_request(void);<br>
=C2=A0void qemu_system_wakeup_request(WakeupReason reason, Error **errp);<b=
r>
=C2=A0void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);<br=
>
=C2=A0void qemu_register_wakeup_notifier(Notifier *notifier);<br>
diff --git a/softmmu/runstate.c b/softmmu/runstate.c<br>
index fac7b63..9b27d74 100644<br>
--- a/softmmu/runstate.c<br>
+++ b/softmmu/runstate.c<br>
@@ -115,6 +115,7 @@ static const RunStateTransition runstate_transitions_de=
f[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },<br>
+=C2=A0 =C2=A0 { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },<br>
<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },<br>
=C2=A0 =C2=A0 =C2=A0{ RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },<br>
@@ -335,6 +336,7 @@ void vm_state_notify(bool running, RunState state)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static bool start_on_wakeup_requested;<br>
=C2=A0static ShutdownCause reset_requested;<br>
=C2=A0static ShutdownCause shutdown_requested;<br>
=C2=A0static int shutdown_signal;<br>
@@ -562,6 +564,11 @@ void qemu_register_suspend_notifier(Notifier *notifier=
)<br>
=C2=A0 =C2=A0 =C2=A0notifier_list_add(&amp;suspend_notifiers, notifier);<br=
>
=C2=A0}<br>
<br>
+void qemu_system_start_on_wakeup_request(void)<br>
+{<br>
+=C2=A0 =C2=A0 start_on_wakeup_requested =3D true;<br>
+}<br>
+<br>
=C2=A0void qemu_system_wakeup_request(WakeupReason reason, Error **errp)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0trace_system_wakeup_request(reason);<br>
@@ -574,7 +581,14 @@ void qemu_system_wakeup_request(WakeupReason reason, E=
rror **errp)<br>
=C2=A0 =C2=A0 =C2=A0if (!(wakeup_reason_mask &amp; (1 &lt;&lt; reason))) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 runstate_set(RUN_STATE_RUNNING);<br>
+<br>
+=C2=A0 =C2=A0 if (start_on_wakeup_requested) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_on_wakeup_requested =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_start();<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runstate_set(RUN_STATE_RUNNING);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0wakeup_reason =3D reason;<br>
=C2=A0 =C2=A0 =C2=A0qemu_notify_event();<br>
=C2=A0}<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000023ff7f05e192adaf--

