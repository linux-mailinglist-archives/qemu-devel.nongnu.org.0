Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4826587B7F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:22:38 +0200 (CEST)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpyt-0003Xm-IB
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIpwd-0000UY-5P; Tue, 02 Aug 2022 07:20:15 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIpwa-0004l0-A2; Tue, 02 Aug 2022 07:20:14 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bq11so16358656lfb.5;
 Tue, 02 Aug 2022 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nh0QZgQGn6s69x7spQSSyPhTMDyQjzk3nDrDEUPZC1A=;
 b=k6jqJW1lcbat5eodIb4u8jI2IT+UXaUMBuJs94FKEb5YmTO2lEMf6CcdFB5rcrzoVj
 8LZumkjY3TYQIzhw4QlcjeItb64cPQks9ApaS6+HzTRNCYF1ONQaMdZJNMdvNTosokj/
 PGRyEuO+fnO9805iB/kGVFJ/3xCbJN9AZQszEp/xDyZpSwDXiu2UivKkTghuW7fAQSSF
 hfIenP3pqaN0BgolqXAjHGPK1D7fDUpYS5HRl0RJeXDOOKB9n1yEjMvvCqXe1yRZ8n1T
 cYjR5XFY4EtNHwGNB2X7Tqx9tUyAqqGZYDY225INbkWELcXu5CTfZyM9YzZNK/zhexQn
 cnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nh0QZgQGn6s69x7spQSSyPhTMDyQjzk3nDrDEUPZC1A=;
 b=6t5h3wnS0d5asYNjMV9o8bILhVUTMew1VTg9rUQdth8ZNX9oRSUUgbDfmYSPUpw9Py
 IM7pr2n3AHiJZ6HfR3lOeJPBRgSZO3OYWAcKdz+ZkSM56/UqFsaMPlHVE1iJ6ZjnZdIp
 lMO3EPNgttJ6HlhmfyvwQDzP91kXqxi1k5CcU3SnxU8sF51C/11m8/OisM4iec/e/rd6
 QuVOPkvr6tCJxB07qw+77FS7Ql6Rj/x9OmTUIrxfBEpf+g0I6nHOjWLqz3tzM9QYuvu1
 XR4tM7onsgCes1fNMFOarQEe94PRYjZTt8ITvKNCUTkz3AiOxEAVqYw25hZUEMW8C0jt
 zbwA==
X-Gm-Message-State: ACgBeo2IiNBGeqSSstpt2qXJM7DDJ2n1xTelj31Cn7EVwujNDBgjqIXt
 Ru6GP67ZGHy079e8X2biVtizXpjFsybGHpc7LHQ=
X-Google-Smtp-Source: AA6agR5Vq35NfWqLWbsooNsRz6xf/RJf+ymGUwtwXuUTXdK/jbaML1ESnOLRUDCa4ExoJao+80S9wrvceUe96/DLKV0=
X-Received: by 2002:a05:6512:c0d:b0:48a:f796:cbd7 with SMTP id
 z13-20020a0565120c0d00b0048af796cbd7mr3258566lfu.654.1659439209491; Tue, 02
 Aug 2022 04:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-7-marcandre.lureau@redhat.com>
 <87les6ud1p.fsf@pond.sub.org>
In-Reply-To: <87les6ud1p.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Aug 2022 15:19:57 +0400
Message-ID: <CAJ+F1C+hqN0SpG6cLxGEi9xcpW+vha6NzZZDJXb1fEbn-UianA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] qapi: move QEMU-specific dispatch code in monitor
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Warner Losh <imp@bsdimp.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009bb29205e5404c2d"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--0000000000009bb29205e5404c2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 2, 2022 at 3:04 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Make QMP-dispatch code free from QEMU-specific OOB dispatch/async
> > coroutine handling. This will allow to move the base code to
> > qemu-common, and clear other users from potential mis-ususe (QGA doesn'=
t
>

misuse :)

> have OOB or coroutine).
>
> I trust the utilty of such a move will become clear later in this
> series.
>
> >
> > To do that, introduce an optional callback QmpDispatchRun called when a
> > QMP command should be run, to allow QEMU to override the default
> > behaviour.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qapi/qmp/dispatch.h |  7 ++--
> >  monitor/qmp.c               | 68 ++++++++++++++++++++++++++++++++++++-
> >  qapi/qmp-dispatch.c         | 64 +++-------------------------------
> >  qga/main.c                  |  2 +-
> >  tests/unit/test-qmp-cmds.c  |  6 ++--
> >  5 files changed, 81 insertions(+), 66 deletions(-)
> >
> > diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> > index 1e4240fd0dbc..b659da613f2e 100644
> > --- a/include/qapi/qmp/dispatch.h
> > +++ b/include/qapi/qmp/dispatch.h
> > @@ -14,7 +14,6 @@
> >  #ifndef QAPI_QMP_DISPATCH_H
> >  #define QAPI_QMP_DISPATCH_H
> >
> > -#include "monitor/monitor.h"
> >  #include "qemu/queue.h"
> >
> >  typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
> > @@ -41,6 +40,10 @@ typedef struct QmpCommand
> >
> >  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
> >
> > +typedef void (QmpDispatchRun)(bool oob, const QmpCommand *cmd,
> > +                              QDict *args, QObject **ret, Error **errp=
,
> > +                              void *run_data);
> > +
> >  void qmp_register_command(QmpCommandList *cmds, const char *name,
> >                            QmpCommandFunc *fn, QmpCommandOptions option=
s,
> >                            unsigned special_features);
> > @@ -56,7 +59,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
> >  bool qmp_has_success_response(const QmpCommand *cmd);
> >  QDict *qmp_error_response(Error *err);
> >  QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
> > -                    bool allow_oob, Monitor *cur_mon);
> > +                    bool allow_oob, QmpDispatchRun run_cb, void
> *run_data);
> >  bool qmp_is_oob(const QDict *dict);
> >
> >  typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void
> *opaque);
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 092c527b6fc9..f8dec97c96bb 100644
> > --- a/monitor/qmp.c
> > +++ b/monitor/qmp.c
> > @@ -132,6 +132,72 @@ static void monitor_qmp_respond(MonitorQMP *mon,
> QDict *rsp)
> >      }
> >  }
> >
> > +typedef struct QmpDispatchBH {
> > +    const QmpCommand *cmd;
> > +    Monitor *cur_mon;
> > +    QDict *args;
> > +    QObject **ret;
> > +    Error **errp;
> > +    Coroutine *co;
> > +} QmpDispatchBH;
> > +
> > +static void do_qmp_dispatch_bh(void *opaque)
> > +{
> > +    QmpDispatchBH *data =3D opaque;
> > +
> > +    assert(monitor_cur() =3D=3D NULL);
> > +    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> > +    data->cmd->fn(data->args, data->ret, data->errp);
> > +    monitor_set_cur(qemu_coroutine_self(), NULL);
> > +    aio_co_wake(data->co);
> > +}
> > +
> > +/*
> > + * Runs outside of coroutine context for OOB commands, but in coroutin=
e
> > + * context for everything else.
> > + */
> > +static void qmp_dispatch_run(bool oob, const QmpCommand *cmd,
> > +                             QDict *args, QObject **ret, Error **errp,
> > +                             void *run_data)
> > +{
> > +    Monitor *cur_mon =3D run_data;
> > +
> > +    assert(!(oob && qemu_in_coroutine()));
> > +    assert(monitor_cur() =3D=3D NULL);
> > +
> > +    if (!!(cmd->options & QCO_COROUTINE) =3D=3D qemu_in_coroutine()) {
> > +        monitor_set_cur(qemu_coroutine_self(), cur_mon);
> > +        cmd->fn(args, ret, errp);
> > +        monitor_set_cur(qemu_coroutine_self(), NULL);
> > +    } else {
> > +       /*
> > +        * Actual context doesn't match the one the command needs.
> > +        *
> > +        * Case 1: we are in coroutine context, but command does not
> > +        * have QCO_COROUTINE.  We need to drop out of coroutine
> > +        * context for executing it.
> > +        *
> > +        * Case 2: we are outside coroutine context, but command has
> > +        * QCO_COROUTINE.  Can't actually happen, because we get here
> > +        * outside coroutine context only when executing a command
> > +        * out of band, and OOB commands never have QCO_COROUTINE.
> > +        */
> > +        assert(!oob && qemu_in_coroutine() && !(cmd->options &
> QCO_COROUTINE));
> > +
> > +        QmpDispatchBH data =3D {
> > +            .cur_mon    =3D cur_mon,
> > +            .cmd        =3D cmd,
> > +            .args       =3D args,
> > +            .ret        =3D ret,
> > +            .errp       =3D errp,
> > +            .co         =3D qemu_coroutine_self(),
> > +        };
> > +        aio_bh_schedule_oneshot(qemu_get_aio_context(),
> do_qmp_dispatch_bh,
> > +                                &data);
> > +        qemu_coroutine_yield();
> > +    }
> > +}
> > +
> >  /*
> >   * Runs outside of coroutine context for OOB commands, but in
> >   * coroutine context for everything else.
> > @@ -142,7 +208,7 @@ static void monitor_qmp_dispatch(MonitorQMP *mon,
> QObject *req)
> >      QDict *error;
> >
> >      rsp =3D qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
> > -                       &mon->common);
> > +                       qmp_dispatch_run, &mon->common);
> >
> >      if (mon->commands =3D=3D &qmp_cap_negotiation_commands) {
> >          error =3D qdict_get_qdict(rsp, "error");
> > diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> > index 0990873ec8ec..342b13d7ebbd 100644
> > --- a/qapi/qmp-dispatch.c
> > +++ b/qapi/qmp-dispatch.c
> > @@ -13,7 +13,6 @@
> >
> >  #include "qemu/osdep.h"
> >
> > -#include "block/aio.h"
> >  #include "qapi/compat-policy.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qmp/dispatch.h"
> > @@ -22,8 +21,6 @@
> >  #include "qapi/qobject-input-visitor.h"
> >  #include "qapi/qobject-output-visitor.h"
> >  #include "qapi/qmp/qbool.h"
> > -#include "qemu/coroutine.h"
> > -#include "qemu/main-loop.h"
> >
> >  Visitor *qobject_input_visitor_new_qmp(QObject *obj)
> >  {
> > @@ -110,32 +107,8 @@ bool qmp_is_oob(const QDict *dict)
> >          && !qdict_haskey(dict, "execute");
> >  }
> >
> > -typedef struct QmpDispatchBH {
> > -    const QmpCommand *cmd;
> > -    Monitor *cur_mon;
> > -    QDict *args;
> > -    QObject **ret;
> > -    Error **errp;
> > -    Coroutine *co;
> > -} QmpDispatchBH;
> > -
> > -static void do_qmp_dispatch_bh(void *opaque)
> > -{
> > -    QmpDispatchBH *data =3D opaque;
> > -
> > -    assert(monitor_cur() =3D=3D NULL);
> > -    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> > -    data->cmd->fn(data->args, data->ret, data->errp);
> > -    monitor_set_cur(qemu_coroutine_self(), NULL);
> > -    aio_co_wake(data->co);
> > -}
> > -
> > -/*
> > - * Runs outside of coroutine context for OOB commands, but in coroutin=
e
> > - * context for everything else.
> > - */
> >  QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
> > -                    bool allow_oob, Monitor *cur_mon)
> > +                    bool allow_oob, QmpDispatchRun run_cb, void
> *run_data)
> >  {
> >      Error *err =3D NULL;
> >      bool oob;
> > @@ -203,39 +176,12 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
> >          qobject_ref(args);
> >      }
> >
> > -    assert(!(oob && qemu_in_coroutine()));
> > -    assert(monitor_cur() =3D=3D NULL);
> > -    if (!!(cmd->options & QCO_COROUTINE) =3D=3D qemu_in_coroutine()) {
> > -        monitor_set_cur(qemu_coroutine_self(), cur_mon);
> > -        cmd->fn(args, &ret, &err);
> > -        monitor_set_cur(qemu_coroutine_self(), NULL);
> > +    if (run_cb) {
> > +        run_cb(oob, cmd, args, &ret, &err, run_data);
> >      } else {
> > -       /*
> > -        * Actual context doesn't match the one the command needs.
> > -        *
> > -        * Case 1: we are in coroutine context, but command does not
> > -        * have QCO_COROUTINE.  We need to drop out of coroutine
> > -        * context for executing it.
> > -        *
> > -        * Case 2: we are outside coroutine context, but command has
> > -        * QCO_COROUTINE.  Can't actually happen, because we get here
> > -        * outside coroutine context only when executing a command
> > -        * out of band, and OOB commands never have QCO_COROUTINE.
> > -        */
> > -        assert(!oob && qemu_in_coroutine() && !(cmd->options &
> QCO_COROUTINE));
> > -
> > -        QmpDispatchBH data =3D {
> > -            .cur_mon    =3D cur_mon,
> > -            .cmd        =3D cmd,
> > -            .args       =3D args,
> > -            .ret        =3D &ret,
> > -            .errp       =3D &err,
> > -            .co         =3D qemu_coroutine_self(),
> > -        };
> > -        aio_bh_schedule_oneshot(qemu_get_aio_context(),
> do_qmp_dispatch_bh,
> > -                                &data);
> > -        qemu_coroutine_yield();
> > +        cmd->fn(args, &ret, &err);
> >      }
> > +
> >      qobject_unref(args);
> >      if (err) {
> >          /* or assert(!ret) after reviewing all handlers: */
>
> A callback works, but note that each program's function is fixed (the
> simple and common function is inlined, but that's just for convenience).
>
> We could use the linker instead.  We already do for
> qmp_command_available(), and the patch doesn't change that.
>

Tbh, using the linker override trick makes me a bit uncomfortable when
trying to make a "common" qemu library.

The "trick" is not well documented (I couldn't find a good reference for
the expected behaviour, and my experience with it isn't great when I
struggled with linking issues earlier). It also makes the library usage a
bit hidden. And it limits the full potential of the library to static
linking.

Callbacks are not always meant to be dynamically changeable.


> Perhaps a layering argument could be made for callbacks.  Before the
> series, monitor/qmp.c's monitor_qmp_dispatch() calls
> qapi/qmp-dispatch.c's qmp_dispatch(), which calls a few functions from
> monitor/.  However, consistency seems desirable.
>
> What do you think?
>

No strong opinion, as long as the qemu-common project is internal to qemu
projects. If we imagine the code can be made into a shared library, it will
need callbacks.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009bb29205e5404c2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 3:04 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Make QMP-dispatch code free from QEMU-specific OOB dispatch/async<br>
&gt; coroutine handling. This will allow to move the base code to<br>
&gt; qemu-common, and clear other users from potential mis-ususe (QGA doesn=
&#39;t<br></blockquote><div><br></div><div><span><span>misuse :)</span></sp=
an></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; have OOB or coroutine).<br>
<br>
I trust the utilty of such a move will become clear later in this<br>
series.<br>
<br>
&gt;<br>
&gt; To do that, introduce an optional callback QmpDispatchRun called when =
a<br>
&gt; QMP command should be run, to allow QEMU to override the default<br>
&gt; behaviour.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qapi/qmp/dispatch.h |=C2=A0 7 ++--<br>
&gt;=C2=A0 monitor/qmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 68 ++++++++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 64 +++---=
----------------------------<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/unit/test-qmp-cmds.c=C2=A0 |=C2=A0 6 ++--<br>
&gt;=C2=A0 5 files changed, 81 insertions(+), 66 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h=
<br>
&gt; index 1e4240fd0dbc..b659da613f2e 100644<br>
&gt; --- a/include/qapi/qmp/dispatch.h<br>
&gt; +++ b/include/qapi/qmp/dispatch.h<br>
&gt; @@ -14,7 +14,6 @@<br>
&gt;=C2=A0 #ifndef QAPI_QMP_DISPATCH_H<br>
&gt;=C2=A0 #define QAPI_QMP_DISPATCH_H<br>
&gt;=C2=A0 <br>
&gt; -#include &quot;monitor/monitor.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/queue.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);<br=
>
&gt; @@ -41,6 +40,10 @@ typedef struct QmpCommand<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;<=
br>
&gt;=C2=A0 <br>
&gt; +typedef void (QmpDispatchRun)(bool oob, const QmpCommand *cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QDict *args, QObject **ret, Error **err=
p,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *run_data);<br>
&gt; +<br>
&gt;=C2=A0 void qmp_register_command(QmpCommandList *cmds, const char *name=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned special_features);<br>
&gt; @@ -56,7 +59,7 @@ const char *qmp_command_name(const QmpCommand *cmd);=
<br>
&gt;=C2=A0 bool qmp_has_success_response(const QmpCommand *cmd);<br>
&gt;=C2=A0 QDict *qmp_error_response(Error *err);<br>
&gt;=C2=A0 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool allow_oob, Monitor *cur_mon);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool allow_oob, QmpDispatchRun run_cb, void *run_data);<br>
&gt;=C2=A0 bool qmp_is_oob(const QDict *dict);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void =
*opaque);<br>
&gt; diff --git a/monitor/qmp.c b/monitor/qmp.c<br>
&gt; index 092c527b6fc9..f8dec97c96bb 100644<br>
&gt; --- a/monitor/qmp.c<br>
&gt; +++ b/monitor/qmp.c<br>
&gt; @@ -132,6 +132,72 @@ static void monitor_qmp_respond(MonitorQMP *mon, =
QDict *rsp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +typedef struct QmpDispatchBH {<br>
&gt; +=C2=A0 =C2=A0 const QmpCommand *cmd;<br>
&gt; +=C2=A0 =C2=A0 Monitor *cur_mon;<br>
&gt; +=C2=A0 =C2=A0 QDict *args;<br>
&gt; +=C2=A0 =C2=A0 QObject **ret;<br>
&gt; +=C2=A0 =C2=A0 Error **errp;<br>
&gt; +=C2=A0 =C2=A0 Coroutine *co;<br>
&gt; +} QmpDispatchBH;<br>
&gt; +<br>
&gt; +static void do_qmp_dispatch_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QmpDispatchBH *data =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(monitor_cur() =3D=3D NULL);<br>
&gt; +=C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), data-&gt;cur_mon=
);<br>
&gt; +=C2=A0 =C2=A0 data-&gt;cmd-&gt;fn(data-&gt;args, data-&gt;ret, data-&=
gt;errp);<br>
&gt; +=C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), NULL);<br>
&gt; +=C2=A0 =C2=A0 aio_co_wake(data-&gt;co);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Runs outside of coroutine context for OOB commands, but in corouti=
ne<br>
&gt; + * context for everything else.<br>
&gt; + */<br>
&gt; +static void qmp_dispatch_run(bool oob, const QmpCommand *cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QDict *args, QObject **ret, Error **errp=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *run_data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 Monitor *cur_mon =3D run_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(!(oob &amp;&amp; qemu_in_coroutine()));<br>
&gt; +=C2=A0 =C2=A0 assert(monitor_cur() =3D=3D NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!!(cmd-&gt;options &amp; QCO_COROUTINE) =3D=3D qemu=
_in_coroutine()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), cu=
r_mon);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;fn(args, ret, errp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), NU=
LL);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Actual context doesn&#39;t match the on=
e the command needs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Case 1: we are in coroutine context, bu=
t command does not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * have QCO_COROUTINE.=C2=A0 We need to dr=
op out of coroutine<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * context for executing it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Case 2: we are outside coroutine contex=
t, but command has<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * QCO_COROUTINE.=C2=A0 Can&#39;t actually=
 happen, because we get here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * outside coroutine context only when exe=
cuting a command<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * out of band, and OOB commands never hav=
e QCO_COROUTINE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!oob &amp;&amp; qemu_in_coroutine(=
) &amp;&amp; !(cmd-&gt;options &amp; QCO_COROUTINE));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QmpDispatchBH data =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cur_mon=C2=A0 =C2=A0 =3D c=
ur_mon,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .args=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D args,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D ret,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .errp=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .co=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D qemu_coroutine_self(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(qemu_get_aio_cont=
ext(), do_qmp_dispatch_bh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_coroutine_yield();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Runs outside of coroutine context for OOB commands, but =
in<br>
&gt;=C2=A0 =C2=A0* coroutine context for everything else.<br>
&gt; @@ -142,7 +208,7 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, =
QObject *req)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QDict *error;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 rsp =3D qmp_dispatch(mon-&gt;commands, req, qmp_oo=
b_enabled(mon),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;mon-&gt;common);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0qmp_dispatch_run, &amp;mon-&gt;common);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (mon-&gt;commands =3D=3D &amp;qmp_cap_negotiati=
on_commands) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D qdict_get_qdict(rsp, &quot=
;error&quot;);<br>
&gt; diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
&gt; index 0990873ec8ec..342b13d7ebbd 100644<br>
&gt; --- a/qapi/qmp-dispatch.c<br>
&gt; +++ b/qapi/qmp-dispatch.c<br>
&gt; @@ -13,7 +13,6 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 <br>
&gt; -#include &quot;block/aio.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/compat-policy.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/dispatch.h&quot;<br>
&gt; @@ -22,8 +21,6 @@<br>
&gt;=C2=A0 #include &quot;qapi/qobject-input-visitor.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qobject-output-visitor.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/qbool.h&quot;<br>
&gt; -#include &quot;qemu/coroutine.h&quot;<br>
&gt; -#include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Visitor *qobject_input_visitor_new_qmp(QObject *obj)<br>
&gt;=C2=A0 {<br>
&gt; @@ -110,32 +107,8 @@ bool qmp_is_oob(const QDict *dict)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !qdict_haskey(dict, &quot=
;execute&quot;);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -typedef struct QmpDispatchBH {<br>
&gt; -=C2=A0 =C2=A0 const QmpCommand *cmd;<br>
&gt; -=C2=A0 =C2=A0 Monitor *cur_mon;<br>
&gt; -=C2=A0 =C2=A0 QDict *args;<br>
&gt; -=C2=A0 =C2=A0 QObject **ret;<br>
&gt; -=C2=A0 =C2=A0 Error **errp;<br>
&gt; -=C2=A0 =C2=A0 Coroutine *co;<br>
&gt; -} QmpDispatchBH;<br>
&gt; -<br>
&gt; -static void do_qmp_dispatch_bh(void *opaque)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 QmpDispatchBH *data =3D opaque;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 assert(monitor_cur() =3D=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), data-&gt;cur_mon=
);<br>
&gt; -=C2=A0 =C2=A0 data-&gt;cmd-&gt;fn(data-&gt;args, data-&gt;ret, data-&=
gt;errp);<br>
&gt; -=C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), NULL);<br>
&gt; -=C2=A0 =C2=A0 aio_co_wake(data-&gt;co);<br>
&gt; -}<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Runs outside of coroutine context for OOB commands, but in corouti=
ne<br>
&gt; - * context for everything else.<br>
&gt; - */<br>
&gt;=C2=A0 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool allow_oob, Monitor *cur_mon)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bool allow_oob, QmpDispatchRun run_cb, void *run_data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool oob;<br>
&gt; @@ -203,39 +176,12 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, =
QObject *request,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qobject_ref(args);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 assert(!(oob &amp;&amp; qemu_in_coroutine()));<br>
&gt; -=C2=A0 =C2=A0 assert(monitor_cur() =3D=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 if (!!(cmd-&gt;options &amp; QCO_COROUTINE) =3D=3D qemu=
_in_coroutine()) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), cu=
r_mon);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;fn(args, &amp;ret, &amp;err);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_set_cur(qemu_coroutine_self(), NU=
LL);<br>
&gt; +=C2=A0 =C2=A0 if (run_cb) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_cb(oob, cmd, args, &amp;ret, &amp;err=
, run_data);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Actual context doesn&#39;t match the on=
e the command needs.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Case 1: we are in coroutine context, bu=
t command does not<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * have QCO_COROUTINE.=C2=A0 We need to dr=
op out of coroutine<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * context for executing it.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Case 2: we are outside coroutine contex=
t, but command has<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * QCO_COROUTINE.=C2=A0 Can&#39;t actually=
 happen, because we get here<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * outside coroutine context only when exe=
cuting a command<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * out of band, and OOB commands never hav=
e QCO_COROUTINE.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!oob &amp;&amp; qemu_in_coroutine(=
) &amp;&amp; !(cmd-&gt;options &amp; QCO_COROUTINE));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 QmpDispatchBH data =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cur_mon=C2=A0 =C2=A0 =3D c=
ur_mon,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D cmd,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .args=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D args,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &amp;ret,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .errp=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &amp;err,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .co=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D qemu_coroutine_self(),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(qemu_get_aio_cont=
ext(), do_qmp_dispatch_bh,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_coroutine_yield();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;fn(args, &amp;ret, &amp;err);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qobject_unref(args);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* or assert(!ret) after reviewing a=
ll handlers: */<br>
<br>
A callback works, but note that each program&#39;s function is fixed (the<b=
r>
simple and common function is inlined, but that&#39;s just for convenience)=
.<br>
<br>
We could use the linker instead.=C2=A0 We already do for<br>
qmp_command_available(), and the patch doesn&#39;t change that.<br></blockq=
uote><div><br></div><div>Tbh, using the linker override trick makes me a bi=
t uncomfortable when trying to make a &quot;common&quot; qemu library.</div=
><div><br></div><div>The &quot;trick&quot; is not well documented (I couldn=
&#39;t find a good reference for the expected behaviour, and my experience =
with it isn&#39;t great when I struggled with linking issues earlier). It a=
lso makes the library usage a bit hidden. And it limits the full potential =
of the library to static linking.</div><div><br></div><div>Callbacks are no=
t always meant to be dynamically changeable.<br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Perhaps a layering argument could be made for callbacks.=C2=A0 Before the<b=
r>
series, monitor/qmp.c&#39;s monitor_qmp_dispatch() calls<br>
qapi/qmp-dispatch.c&#39;s qmp_dispatch(), which calls a few functions from<=
br>
monitor/.=C2=A0 However, consistency seems desirable.<br>
<br>
What do you think?<br></blockquote><div><br></div><div>No strong opinion, a=
s long as the qemu-common project is internal to qemu projects. If we imagi=
ne the code can be made into a shared library, it will need callbacks.<br><=
/div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009bb29205e5404c2d--

