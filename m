Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D3583EEA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:34:07 +0200 (CEST)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2iM-0002zB-2H
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2cX-0008Gz-N5
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:28:09 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2cV-0002js-OO
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:28:05 -0400
Received: by mail-lf1-x12b.google.com with SMTP id m12so2615720lfj.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N8Wn4KgTQx3ASPr2xWCczDqKLYEgso7K0g4P0gT8t4c=;
 b=p+Qh5AXUDbE/JGymXpGJyq4u3SIE8WQMXpUQORTYThmMlIl3FYk5/+VkFiIv/1/5lm
 4UVja68j858kZltlRPwMcCz69oJj5/sKidC8PUNuvfQdp8zYes2gfT6/V0BmeO95pu7b
 v1ieMh9i0tXA7AwSfO0sFhcAHENS47B8cqXKcp/06kajieUStsxy3yaJ9SdQ1lhrxW6b
 eeEmjtp8ITx3XvoECnHIbJc73+L1/rKleW72vwkiEs0my/iHUxN+BeUSg1nLjlT/iyj2
 ELV+T8gTwE82yjnlicKaQ0SeGTKN4iNYnM2f4a8WTE/cTUn3vuG8ZEJtRjGxfItWo+36
 mcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N8Wn4KgTQx3ASPr2xWCczDqKLYEgso7K0g4P0gT8t4c=;
 b=jIHUHswN2uVQrjHBPx/eG1sxSLfWaxtw9f3hleGBcrq4or4LuX8tCHqvqZEhvhFkR8
 u4T1bUADleoxOv7HgMZMSJA+7xrgpCjMPg0D5y+rxeUPwAkvFcyqR3ttrgLTRxX4C/G9
 q1iZ6GHR6ACJr59pAgxHHnMmt/t58UYmktrgColySphPR5WgR8p9myl3rReLgKGbkZ/9
 M+PwVRm4nLnxAH3YE7umr69zVlBY3oTivo3ZkfSCFf9c05tCkoh2AOw5GkaeQwGmg5Th
 NpYKlAKpgnrE8IuBqMSyzXRFUPhNRf0Rz6mv8h+YSfeQygnNYraDHOINTYBBdxBys+A9
 W34g==
X-Gm-Message-State: AJIora+mpSkRpw4GoPMJgbC1tRz5CndPHbMHFkIFxUILaY6WPFjVOEP+
 iTmZ/V/vH5f7lJElbpvUgen1VPsN/k3yKoCdhU1J/dNnuNw=
X-Google-Smtp-Source: AGRyM1uJ0HeRTaFdJmeaYnY6DiXF1IUOenS7y7WDsrl3oaU2GdBXpzSERFaMOxLSoKRAP/h4r6Abk9TqM5QcDKM3M+Q=
X-Received: by 2002:a05:6512:10c9:b0:48a:beea:122f with SMTP id
 k9-20020a05651210c900b0048abeea122fmr2028533lfg.94.1659011281640; Thu, 28 Jul
 2022 05:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220727140110.2698-1-hogan.wang@huawei.com>
 <20220727140110.2698-2-hogan.wang@huawei.com>
In-Reply-To: <20220727140110.2698-2-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 16:27:49 +0400
Message-ID: <CAJ+F1C+chVZeZwNWE4fxDHvLV8pR0=3MDYmCOGF_xTS83Us8Fw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dump: use jobs framework for dump guest memory
To: Hogan Wang <hogan.wang@huawei.com>
Cc: berrange@redhat.com, qemu-devel@nongnu.org, wangxinxin.wang@huawei.com
Content-Type: multipart/alternative; boundary="0000000000001ee1d005e4dcaaba"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
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

--0000000000001ee1d005e4dcaaba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 27, 2022 at 6:04 PM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> There's no way to cancel the current executing dump process, lead to the
> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> job after daemon restart.
>
> Use default job id 'dump-guest-memory' to create a job object for dump
> process.
>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  dump/dump.c | 68 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 58 insertions(+), 10 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 6aa946b9ac..51dc933c7c 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1528,6 +1528,14 @@ static void get_max_mapnr(DumpState *s)
>
>  static DumpState dump_state_global =3D { .status =3D DUMP_STATUS_NONE };
>
> +typedef struct DumpJob {
> +    Job common;
> +    DumpState *state;
> +    Coroutine *co;
> +    Error **errp;
> +} DumpJob;
> +
> +
>  static void dump_state_prepare(DumpState *s)
>  {
>      /* zero the struct, setting status to active */
> @@ -1854,8 +1862,11 @@ static void dump_process(DumpState *s, Error **err=
p)
>
>  static void *dump_thread(void *data)
>  {
> -    DumpState *s =3D (DumpState *)data;
> -    dump_process(s, NULL);
> +    DumpJob *job =3D (DumpJob *)data;
> +    job_progress_set_remaining(&job->common, 1);
> +    dump_process(job->state, job->errp);
> +    job_progress_update(&job->common, 1);
> +    aio_co_wake(job->co);
>      return NULL;
>  }
>
> @@ -1871,6 +1882,37 @@ DumpQueryResult *qmp_query_dump(Error **errp)
>      return result;
>  }
>
> +static void dump_sync_job_bh(void *opaque)
> +{
> +    dump_thread(opaque);
> +}
> +
> +static int coroutine_fn dump_guest_memory_job_run(Job *job, Error **errp=
)
> +{
> +    DumpJob *s =3D container_of(job, DumpJob, common);
> +    DumpState *state =3D &dump_state_global;
> +
> +    s->errp =3D errp;
> +    s->co =3D qemu_coroutine_self();
> +
> +    if (state->detached) {
> +        /* detached dump */
> +        qemu_thread_create(&s->state->dump_thread, "dump_thread",
> dump_thread,
> +                           s, QEMU_THREAD_DETACHED);
> +    } else {
> +        aio_bh_schedule_oneshot(qemu_get_aio_context(),
> +                                dump_sync_job_bh, job);
> +    }
> +    qemu_coroutine_yield();
> +    return qatomic_read(&state->status) =3D=3D DUMP_STATUS_COMPLETED ? 0=
 : -1;
> +}
> +
> +static const JobDriver dump_guest_memory_job_driver =3D {
> +    .instance_size =3D sizeof(DumpJob),
> +    .job_type      =3D JOB_TYPE_DUMP_GUEST_MEMORY,
> +    .run           =3D dump_guest_memory_job_run,
> +};
> +
>  void qmp_dump_guest_memory(bool paging, const char *file,
>                             bool has_job_id, const char *job_id,
>                             bool has_detach, bool detach,
> @@ -1882,6 +1924,7 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>      const char *p;
>      int fd =3D -1;
>      DumpState *s;
> +    DumpJob *job;
>      bool detach_p =3D false;
>
>      if (runstate_check(RUN_STATE_INMIGRATE)) {
> @@ -1977,6 +2020,10 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>          return;
>      }
>
> +    if (!has_job_id) {
> +        job_id =3D "dump-guest-memory";
> +    }
> +
>      s =3D &dump_state_global;
>      dump_state_prepare(s);
>
> @@ -1987,15 +2034,16 @@ void qmp_dump_guest_memory(bool paging, const cha=
r
> *file,
>          return;
>      }
>
> -    if (detach_p) {
> -        /* detached dump */
> -        s->detached =3D true;
> -        qemu_thread_create(&s->dump_thread, "dump_thread", dump_thread,
> -                           s, QEMU_THREAD_DETACHED);
> -    } else {
> -        /* sync dump */
> -        dump_process(s, errp);
> +    s->detached =3D detach_p;
> +    job =3D job_create(job_id, &dump_guest_memory_job_driver, NULL,
> +                    qemu_get_aio_context(), JOB_DEFAULT,
> +                    NULL, NULL, errp);
> +    if (!job) {
> +        qatomic_set(&s->status, DUMP_STATUS_FAILED);
> +        return;
>      }
> +    job->state =3D s;
> +    job_start(&job->common);
>

This is a change of behaviour, the command is no longer "sync" after this
change, as it returns immediately (even though further IO will be blocked
until the dump is completed). Maybe only create a job for commands with a
job-id and detached?

 }
>
>  DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error
> **errp)
> --
> 2.33.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001ee1d005e4dcaaba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 6:04 PM Hog=
an Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">There&#39;s no way to cancel the current executing dump process, lead to=
 the<br>
virtual machine manager daemon((e.g. libvirtd) cannot restore the dump<br>
job after daemon restart.<br>
<br>
Use default job id &#39;dump-guest-memory&#39; to create a job object for d=
ump<br>
process.<br>
<br>
Signed-off-by: Hogan Wang &lt;<a href=3D"mailto:hogan.wang@huawei.com" targ=
et=3D"_blank">hogan.wang@huawei.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c | 68 +++++++++++++++++++++++++++++++++++++++++++++-------=
-<br>
=C2=A01 file changed, 58 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 6aa946b9ac..51dc933c7c 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -1528,6 +1528,14 @@ static void get_max_mapnr(DumpState *s)<br>
<br>
=C2=A0static DumpState dump_state_global =3D { .status =3D DUMP_STATUS_NONE=
 };<br>
<br>
+typedef struct DumpJob {<br>
+=C2=A0 =C2=A0 Job common;<br>
+=C2=A0 =C2=A0 DumpState *state;<br>
+=C2=A0 =C2=A0 Coroutine *co;<br>
+=C2=A0 =C2=A0 Error **errp;<br>
+} DumpJob;<br>
+<br>
+<br>
=C2=A0static void dump_state_prepare(DumpState *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* zero the struct, setting status to active */<br>
@@ -1854,8 +1862,11 @@ static void dump_process(DumpState *s, Error **errp)=
<br>
<br>
=C2=A0static void *dump_thread(void *data)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 DumpState *s =3D (DumpState *)data;<br>
-=C2=A0 =C2=A0 dump_process(s, NULL);<br>
+=C2=A0 =C2=A0 DumpJob *job =3D (DumpJob *)data;<br>
+=C2=A0 =C2=A0 job_progress_set_remaining(&amp;job-&gt;common, 1);<br>
+=C2=A0 =C2=A0 dump_process(job-&gt;state, job-&gt;errp);<br>
+=C2=A0 =C2=A0 job_progress_update(&amp;job-&gt;common, 1);<br>
+=C2=A0 =C2=A0 aio_co_wake(job-&gt;co);<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
@@ -1871,6 +1882,37 @@ DumpQueryResult *qmp_query_dump(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return result;<br>
=C2=A0}<br>
<br>
+static void dump_sync_job_bh(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 dump_thread(opaque);<br>
+}<br>
+<br>
+static int coroutine_fn dump_guest_memory_job_run(Job *job, Error **errp)<=
br>
+{<br>
+=C2=A0 =C2=A0 DumpJob *s =3D container_of(job, DumpJob, common);<br>
+=C2=A0 =C2=A0 DumpState *state =3D &amp;dump_state_global;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;errp =3D errp;<br>
+=C2=A0 =C2=A0 s-&gt;co =3D qemu_coroutine_self();<br>
+<br>
+=C2=A0 =C2=A0 if (state-&gt;detached) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* detached dump */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_thread_create(&amp;s-&gt;state-&gt;dump_t=
hread, &quot;dump_thread&quot;, dump_thread,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s, QEMU_THREAD_DETACHED);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(qemu_get_aio_context()=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dump_sync_job_bh, job);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_coroutine_yield();<br>
+=C2=A0 =C2=A0 return qatomic_read(&amp;state-&gt;status) =3D=3D DUMP_STATU=
S_COMPLETED ? 0 : -1;<br>
+}<br>
+<br>
+static const JobDriver dump_guest_memory_job_driver =3D {<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(DumpJob),<br>
+=C2=A0 =C2=A0 .job_type=C2=A0 =C2=A0 =C2=A0 =3D JOB_TYPE_DUMP_GUEST_MEMORY=
,<br>
+=C2=A0 =C2=A0 .run=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dump_guest_=
memory_job_run,<br>
+};<br>
+<br>
=C2=A0void qmp_dump_guest_memory(bool paging, const char *file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool has_job_id, const char *job_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool has_detach, bool detach,<br>
@@ -1882,6 +1924,7 @@ void qmp_dump_guest_memory(bool paging, const char *f=
ile,<br>
=C2=A0 =C2=A0 =C2=A0const char *p;<br>
=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0DumpState *s;<br>
+=C2=A0 =C2=A0 DumpJob *job;<br>
=C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (runstate_check(RUN_STATE_INMIGRATE)) {<br>
@@ -1977,6 +2020,10 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!has_job_id) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 job_id =3D &quot;dump-guest-memory&quot;;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0s =3D &amp;dump_state_global;<br>
=C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
<br>
@@ -1987,15 +2034,16 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (detach_p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* detached dump */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;detached =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_thread_create(&amp;s-&gt;dump_thread, &qu=
ot;dump_thread&quot;, dump_thread,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s, QEMU_THREAD_DETACHED);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sync dump */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dump_process(s, errp);<br>
+=C2=A0 =C2=A0 s-&gt;detached =3D detach_p;<br>
+=C2=A0 =C2=A0 job =3D job_create(job_id, &amp;dump_guest_memory_job_driver=
, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu=
_get_aio_context(), JOB_DEFAULT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL=
, NULL, errp);<br>
+=C2=A0 =C2=A0 if (!job) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;status, DUMP_STATUS_FAI=
LED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 job-&gt;state =3D s;<br>
+=C2=A0 =C2=A0 job_start(&amp;job-&gt;common);<br></blockquote><div><br></d=
iv><div>This is a change of behaviour, the command is no longer &quot;sync&=
quot; after this change, as it returns immediately (even though further IO =
will be blocked until the dump is completed). Maybe only create a job for c=
ommands with a job-id and detached?<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Err=
or **errp)<br>
-- <br>
2.33.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001ee1d005e4dcaaba--

