Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE4362341
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:02:09 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPyy-0001bd-BO
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lXPwP-0000vN-Ob
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:59:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lXPwJ-0001DN-QV
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:59:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so42543876ejc.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1M8AqbrE0rmOQuAlFV0hp4uriKSOI8QpkYfZ2DBfm2Y=;
 b=lHMh0W886jpOUO1La7jbMJeonjIszSf6G/bkP2b4mEj8yocPGf3uaqcocOFoSNb0Eh
 EQdxMIdFEnMcd4vQw2U0n0VCIPmAVnJfxYWPFGgGfGbakGyIO62IBP7y24JoE9GtM0JQ
 2Dus4AYOMbxrbNepMfJzhcODPJtkOXXfWkxAvfTA75fuaqKak5sMDvrl5vcLQ0LaSTW9
 AprecCI+OWuQLywubKwwg1c7kArC5ribvpzdJGfJNCFvjIJ7NTGn5XeqQmXyTm5mtLAt
 Uofvwsjh9PyCTU034Om9/Bssx9Xe8dO1eiMkkFOW7N7ZLASjSE+EpwCoGpclkOtJ0D2A
 smyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1M8AqbrE0rmOQuAlFV0hp4uriKSOI8QpkYfZ2DBfm2Y=;
 b=suj05kNkLGSHuxf63t9XiSYXbU4fDmKj3a1TnFvwTXHBIDtEiOYNvGZQaMh3b3PTxY
 hdMpDO8Eu31OtS7TO7DI8TRLpqa+lWCBV/hlmap3o+g5lw8aRZfNVwFVb2a7VQHsTHUV
 ZjgvspYXFZIf6T5qQyMfZwfCRsT2ZwHJkkprjnVg0Gpaz5WQHI9wLkAp+YDZtDJ2iyRP
 ZW2EguwvVmUOJ1PKlYke6wngfk8dteSTMOAAo+SqyxU8X14SpnPaJ/tFIuJXx4Fa41TL
 0Nn6kBbYuhe7qG7m7ZDJqeis1k5KKf2NA6ELJ8oo5RI8MOT+QFN9xEJRtfDJXnW4Jvfl
 WsRA==
X-Gm-Message-State: AOAM530jvO5T4fjJ5WZ42eYzmNE+7Dn8ArznZUqIP8IF6uuZfz98xT7P
 JLxW+agYb6jdv/DdWZHCq6PHxwXwhCpwaabqAuA=
X-Google-Smtp-Source: ABdhPJwz2MFaPWLFU7dd9w+vR2z1J0Nyo3oMfIYcyJNLkR/Di475tGU1ZwQNp76pxBsy4yH687sygXT5dYLLWnnt44Q=
X-Received: by 2002:a17:906:4153:: with SMTP id
 l19mr6001599ejk.109.1618585161535; 
 Fri, 16 Apr 2021 07:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
In-Reply-To: <875z0m4733.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 16 Apr 2021 18:59:09 +0400
Message-ID: <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097937e05c01839e3"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000097937e05c01839e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 16, 2021 at 6:51 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9, I'd like your opinion for this one, in particular the us=
e of
> g_source_remove().
>

My opinion isn't really worth much, my review would have a bit more value.

GSource has indeed some peculiar lifetime management, that I got wrong in
the past. So I would be extra careful.

But before spending time on review, I would also clarify the motivation and
ask for testing.

Markus, hot-adding/removing monitors isn't supported?


> Li Zhang <zhlcindy@gmail.com> writes:
>
> > For some scenarios, it needs to hot-add a monitor device.
> > But QEMU doesn't support hotplug yet. It also works by adding
> > a monitor with null backend by default and then change its
> > backend to socket by QMP command "chardev-change".
> >
> > So this patch is to support monitor chardev hotswap with QMP.
> >
> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> > Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>
> Your commit message starts with a brief description of the problem.
> Appreciated!  But I think it could be a bit clearer.  What about this:
>
>     qmp: Support chardev-change
>
>     For some scenarios, we'd like to hot-add a monitor device.  But QEMU
>     doesn't support that, yet.  It does support hot-swapping character
>     backends with QMP command chardev-change.  This lets us pre-add a
>     monitor with a null character backend, then chardev-change to a
>     socket backend.  Except the chardev-change fails with "Chardev user
>     does not support chardev hotswap" because monitors don't provide the
>     required callback.  Implement it for QMP monitors.
>
> > ---
> >  v1 -> v2:
> >   - Change mutex lock mon_lock section
> >   - Fix indentation problems
> >
> >  monitor/monitor-internal.h |  3 +++
> >  monitor/monitor.c          |  2 +-
> >  monitor/qmp.c              | 43 +++++++++++++++++++++++++++++++++++---
> >  3 files changed, 44 insertions(+), 4 deletions(-)
> >
> > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> > index 9c3a09cb01..1b80c74883 100644
> > --- a/monitor/monitor-internal.h
> > +++ b/monitor/monitor-internal.h
> > @@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);
> >  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
> >  int hmp_compare_cmd(const char *name, const char *list);
> >
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +                           void *opaque);
> > +
> >  #endif
> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > index 636bcc81c5..16a3620d02 100644
> > --- a/monitor/monitor.c
> > +++ b/monitor/monitor.c
> > @@ -157,7 +157,7 @@ static inline bool
> monitor_is_hmp_non_interactive(const Monitor *mon)
> >
> >  static void monitor_flush_locked(Monitor *mon);
> >
> > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> >                                    void *opaque)
> >  {
> >      Monitor *mon =3D opaque;
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 2b0308f933..5fa65401ae 100644
> > --- a/monitor/qmp.c
> > +++ b/monitor/qmp.c
> > @@ -44,6 +44,7 @@ struct QMPRequest {
> >      Error *err;
> >  };
> >  typedef struct QMPRequest QMPRequest;
> > +static void monitor_qmp_set_handlers_bh(void *opaque);
> >
> >  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> >
> > @@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
> >      g_queue_free(mon->qmp_requests);
> >  }
> >
> > -static void monitor_qmp_setup_handlers_bh(void *opaque)
> > +static int monitor_qmp_change                  (void *opaque)
> > +{
> > +    MonitorQMP *mon =3D opaque;
> > +
> > +    mon->common.use_io_thread =3D
> qemu_chr_has_feature(mon->common.chr.chr,
> > +                                QEMU_CHAR_FEATURE_GCONTEXT);
> > +
> > +    if (mon->common.use_io_thread) {
> > +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread)=
,
> > +                                monitor_qmp_set_handlers_bh, mon);
> > +    } else {
> > +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > +                                 monitor_qmp_read, monitor_qmp_event,
> > +                                 monitor_qmp_change, &mon->common,
> NULL, true);
> > +    }
> > +
> > +    qemu_mutex_lock(&mon->common.mon_lock);
> > +    if (mon->common.out_watch) {
> > +        g_source_remove(mon->common.out_watch);
> > +        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.c=
hr,
> > +                                G_IO_OUT | G_IO_HUP,
> > +                                monitor_unblocked,
> > +                                &mon->common);
>
> Visually align the arguments:
>
>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
>                                                       G_IO_OUT | G_IO_HUP=
,
>                                                       monitor_unblocked,
>                                                       &mon->common);
>
> You may reduce argument indentation some to gain extra space, but keep
> the arguments more indented than the function:
>
>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
>                                         G_IO_OUT | G_IO_HUP,
>                                         monitor_unblocked, &mon->common);
>
> Do this only when you actually use the extra space for readability.
>
> > +    }
> > +    qemu_mutex_unlock(&mon->common.mon_lock);
> > +
> > +    return 0;
> > +}
>
> As I wrote in my review of v1, this function copies from
> monitor_data_init(), monitor_init_qmp(), and monitor_flush_locked().
> Feels like a refactoring would be in order.  Doing it on top might be
> easier.
>
> > +
> > +static void monitor_qmp_set_handlers_bh(void *opaque)
> >  {
> >      MonitorQMP *mon =3D opaque;
> >      GMainContext *context;
> > @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void
> *opaque)
> >      assert(context);
> >      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                               monitor_qmp_read, monitor_qmp_event,
> > -                             NULL, &mon->common, context, true);
> > +                             monitor_qmp_change, &mon->common, context=
,
> true);
> > +
> > +}
> > +
> > +static void monitor_qmp_setup_handlers_bh(void *opaque)
> > +{
> > +    MonitorQMP *mon =3D opaque;
> > +    monitor_qmp_set_handlers_bh(mon);
> >      monitor_list_append(&mon->common);
> >  }
> >
> > @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty,
> Error **errp)
> >      } else {
> >          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                                   monitor_qmp_read, monitor_qmp_event,
> > -                                 NULL, &mon->common, NULL, true);
> > +                                 monitor_qmp_change, &mon->common,
> NULL, true);
> >          monitor_list_append(&mon->common);
> >      }
> >  }
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000097937e05c01839e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Apr 16, 2021 at 6:51 PM Markus Armbru=
ster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-Andr=C3=
=A9, I&#39;d like your opinion for this one, in particular the use of<br>
g_source_remove().<br></blockquote><div><br></div><div>My opinion isn&#39;t=
 really worth much, my review would have a bit more value.=C2=A0</div><div>=
<br></div><div>GSource has indeed some peculiar lifetime management, that I=
 got wrong in the past. So I would be extra careful.</div><div><br></div><d=
iv>But before spending time on review, I would also clarify the motivation =
and ask for testing.</div><div><br></div><div>Markus, hot-adding/removing m=
onitors isn&#39;t supported?<br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Li Zhang &lt;<a href=3D"mailto:zhlcindy@gmail.com" target=3D"_blank">zhlcin=
dy@gmail.com</a>&gt; writes:<br>
<br>
&gt; For some scenarios, it needs to hot-add a monitor device.<br>
&gt; But QEMU doesn&#39;t support hotplug yet. It also works by adding<br>
&gt; a monitor with null backend by default and then change its<br>
&gt; backend to socket by QMP command &quot;chardev-change&quot;.<br>
&gt;<br>
&gt; So this patch is to support monitor chardev hotswap with QMP.<br>
&gt;<br>
&gt; Signed-off-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com=
" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
&gt; Reviewed-by: Pankaj Gupta &lt;<a href=3D"mailto:pankaj.gupta@ionos.com=
" target=3D"_blank">pankaj.gupta@ionos.com</a>&gt;<br>
<br>
Your commit message starts with a brief description of the problem.<br>
Appreciated!=C2=A0 But I think it could be a bit clearer.=C2=A0 What about =
this:<br>
<br>
=C2=A0 =C2=A0 qmp: Support chardev-change<br>
<br>
=C2=A0 =C2=A0 For some scenarios, we&#39;d like to hot-add a monitor device=
.=C2=A0 But QEMU<br>
=C2=A0 =C2=A0 doesn&#39;t support that, yet.=C2=A0 It does support hot-swap=
ping character<br>
=C2=A0 =C2=A0 backends with QMP command chardev-change.=C2=A0 This lets us =
pre-add a<br>
=C2=A0 =C2=A0 monitor with a null character backend, then chardev-change to=
 a<br>
=C2=A0 =C2=A0 socket backend.=C2=A0 Except the chardev-change fails with &q=
uot;Chardev user<br>
=C2=A0 =C2=A0 does not support chardev hotswap&quot; because monitors don&#=
39;t provide the<br>
=C2=A0 =C2=A0 required callback.=C2=A0 Implement it for QMP monitors.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 v1 -&gt; v2: <br>
&gt;=C2=A0 =C2=A0- Change mutex lock mon_lock section<br>
&gt;=C2=A0 =C2=A0- Fix indentation problems<br>
&gt;<br>
&gt;=C2=A0 monitor/monitor-internal.h |=C2=A0 3 +++<br>
&gt;=C2=A0 monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-=
<br>
&gt;=C2=A0 monitor/qmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
43 +++++++++++++++++++++++++++++++++++---<br>
&gt;=C2=A0 3 files changed, 44 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h<b=
r>
&gt; index 9c3a09cb01..1b80c74883 100644<br>
&gt; --- a/monitor/monitor-internal.h<br>
&gt; +++ b/monitor/monitor-internal.h<br>
&gt; @@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);<br>
&gt;=C2=A0 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);<b=
r>
&gt;=C2=A0 int hmp_compare_cmd(const char *name, const char *list);<br>
&gt;=C2=A0 <br>
&gt; +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque);<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
&gt; index 636bcc81c5..16a3620d02 100644<br>
&gt; --- a/monitor/monitor.c<br>
&gt; +++ b/monitor/monitor.c<br>
&gt; @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(=
const Monitor *mon)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void monitor_flush_locked(Monitor *mon);<br>
&gt;=C2=A0 <br>
&gt; -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond=
,<br>
&gt; +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Monitor *mon =3D opaque;<br>
&gt; diff --git a/monitor/qmp.c b/monitor/qmp.c<br>
&gt; index 2b0308f933..5fa65401ae 100644<br>
&gt; --- a/monitor/qmp.c<br>
&gt; +++ b/monitor/qmp.c<br>
&gt; @@ -44,6 +44,7 @@ struct QMPRequest {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 typedef struct QMPRequest QMPRequest;<br>
&gt; +static void monitor_qmp_set_handlers_bh(void *opaque);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QmpCommandList qmp_commands, qmp_cap_negotiation_commands;<br>
&gt;=C2=A0 <br>
&gt; @@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 g_queue_free(mon-&gt;qmp_requests);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void monitor_qmp_setup_handlers_bh(void *opaque)<br>
&gt; +static int monitor_qmp_change=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MonitorQMP *mon =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mon-&gt;common.use_io_thread =3D qemu_chr_has_feature(m=
on-&gt;common.chr.chr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_CHAR_FEATURE_GCONTEXT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (mon-&gt;common.use_io_thread) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(iothread_get_aio_=
context(mon_iothread),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_qmp_set_handlers_bh, mon=
);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;mon-&gt;com=
mon.chr, monitor_can_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_read, monitor_=
qmp_event,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;m=
on-&gt;common, NULL, true);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_lock(&amp;mon-&gt;common.mon_lock);<br>
&gt; +=C2=A0 =C2=A0 if (mon-&gt;common.out_watch) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_remove(mon-&gt;common.out_watch)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mon-&gt;common.out_watch =3D qemu_chr_fe_=
add_watch(&amp;mon-&gt;common.chr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_IO_OUT | G_IO_HUP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_unblocked,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mon-&gt;common);<br>
<br>
Visually align the arguments:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mon-&gt;common.out_watch =3D qemu_chr_fe_add_wa=
tch(&amp;mon-&gt;common.chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_IO_OUT | G_IO_HUP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_unblocked,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mon-&gt;common);<br>
<br>
You may reduce argument indentation some to gain extra space, but keep<br>
the arguments more indented than the function:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mon-&gt;common.out_watch =3D qemu_chr_fe_add_wa=
tch(&amp;mon-&gt;common.chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_IO_OUT=
 | G_IO_HUP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_=
unblocked, &amp;mon-&gt;common);<br>
<br>
Do this only when you actually use the extra space for readability.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;mon-&gt;common.mon_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
<br>
As I wrote in my review of v1, this function copies from<br>
monitor_data_init(), monitor_init_qmp(), and monitor_flush_locked().<br>
Feels like a refactoring would be in order.=C2=A0 Doing it on top might be<=
br>
easier.<br>
<br>
&gt; +<br>
&gt; +static void monitor_qmp_set_handlers_bh(void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MonitorQMP *mon =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GMainContext *context;<br>
&gt; @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *o=
paque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;mon-&gt;common.chr, =
monitor_can_read,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_read, monitor_qmp_even=
t,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;mon-&gt;common, context, true=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;mon-&gt;common,=
 context, true);<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void monitor_qmp_setup_handlers_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MonitorQMP *mon =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 monitor_qmp_set_handlers_bh(mon);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 monitor_list_append(&amp;mon-&gt;common);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;mon-&g=
t;common.chr, monitor_can_read,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_read, mo=
nitor_qmp_event,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;mon-&gt;common,=
 NULL, true);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;m=
on-&gt;common, NULL, true);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_list_append(&amp;mon-&gt;com=
mon);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000097937e05c01839e3--

