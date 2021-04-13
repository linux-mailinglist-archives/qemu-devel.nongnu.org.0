Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23635DA60
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:52:48 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEmt-0005LT-Gv
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWElb-0004cq-Ji
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:51:27 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:45714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWElZ-0007Ka-Ij
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:51:27 -0400
Received: by mail-vk1-xa32.google.com with SMTP id g5so3460123vkg.12
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dxKQk0z2nlwwGzQe5Q4nOv5DbI3qJ258QOdeIQjkLt0=;
 b=RbhdFFTFrkTgnWBhHL2zucHRJmxx7q/D1Jghh31Z5v/UumWsvOJEpr2rPmGr4pueCU
 7Ve7eOrF4wCVB0XF0kRBYaD6RD8glFWJsKtcphTYEY1NGlwYdb9yXVfiX/7bUwdoTdhW
 Hh74hcy6c1XV+JH4FpanXzoLHesNGI8l/PVjNsLir3gsqPvSNBHsTA4SDuVQD2KHqSh4
 g75yvmlX+QP8X4lbClEOYC19he/Um771nx/sgzEJivF4gEj1dfKO+Ya/df3Sjv4PMVHM
 ElZ7Y1AfQqWHolajneXd0sHkMW8emVQvqWqGEKwUgX6sXXYDYTg1S3S97rqh1S59Sz53
 tbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dxKQk0z2nlwwGzQe5Q4nOv5DbI3qJ258QOdeIQjkLt0=;
 b=lR97qUmCcrzSFogOjgRF+jGX4j+ezIW6GNVkIwR6PA3dZNW58+XO6tjNL0tIyFrje7
 vNJ6LvBPZwTmrMXNi5tTieJNQczZkct4wnU0dAP2YFhHpNMfYD/CkO4WjARSc+pxDsmL
 AEkIP0Vuz2mNmu03hn31xTAzsC+wRf+nAo8SEwqUTXMY3JGjDLKwj7+Za5uK2rK/QTZe
 TdSBBq9UK/36gysQZUtl7TsxCNqiBtrrIFHeri8ezoCDuLztZi76gayvarIDDPUfK8eD
 BcdEt8gn5TDvhUwM3GdjLyMaR5NXjMld9yiN65LPX/R+Vap2BlLTZxPx50Q0ay5cX1d+
 x53Q==
X-Gm-Message-State: AOAM532J1F9oDFmoPFu0mCdd2Jl0Z4WfuF4RWZ3bKWHGAvn4nDKcwIX0
 6+gkLKdCwUlFZ25jM+LD0AcLE8EubbsrkRWkX1o=
X-Google-Smtp-Source: ABdhPJwjYgynrESh6+Rcy/sX9WGZ8yVDrid8Uubdd8yNBpUl4u4gRblh825v9PyKQ3PDkoiNT5W5lpdIs5/geyLPs8M=
X-Received: by 2002:a1f:5184:: with SMTP id f126mr21776091vkb.6.1618303883413; 
 Tue, 13 Apr 2021 01:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <8735vu1ybo.fsf@dusky.pond.sub.org>
In-Reply-To: <8735vu1ybo.fsf@dusky.pond.sub.org>
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 13 Apr 2021 10:51:12 +0200
Message-ID: <CAD8of+oJM6+5Q05WRrbj=dd0fmcR2C80YvWK4F=T1A_HK4nKBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=zhlcindy@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com,
 qemu-devel@nongnu.org, Li Zhang <li.zhang@cloud.ionos.com>,
 pankaj.gupta@cloud.ionos.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 8:41 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Li Zhang <zhlcindy@gmail.com> writes:
>
> > From: Li Zhang <li.zhang@cloud.ionos.com>
> >
> > For some scenarios, it needs to hot-add a monitor device.
> > But QEMU doesn't support hotplug yet. It also works by adding
> > a monitor with null backend by default and then change its
> > backend to socket by QMP command "chardev-change".
> >
> > So this patch is to support monitor chardev hotswap with QMP.
> >
> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>
> I think what what you're trying to say is that chardev-change does not
> work when the character device changes is used by a QMP monitor.
> Correct?
>
I mean that when the character device is a monitor device, it doesn't
work with a QMP monitor.
For example, I add 2 QMP monitors and change one of the monitor's
backends from socket to a null device.
It doesn't work because it needs the monitor device to support chardev-chan=
ge.

> If yes, how exactly does it misbehave?
This command chardev-change needs specific device's change callback functio=
n.

>
> Does it work with an HMP monitor?
No, it doesn't work.

>
> > ---
> >  monitor/monitor-internal.h |  3 +++
> >  monitor/monitor.c          |  2 +-
> >  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
> >  3 files changed, 43 insertions(+), 4 deletions(-)
> >
> > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> > index 40903d6386..2df6dd21de 100644
> > --- a/monitor/monitor-internal.h
> > +++ b/monitor/monitor-internal.h
> > @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *l=
ist);
> >  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
> >                                   Error **errp);
> >
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +                               void *opaque);
> > +
> >  #endif
> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > index e94f532cf5..2d255bab18 100644
> > --- a/monitor/monitor.c
> > +++ b/monitor/monitor.c
> > @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(c=
onst Monitor *mon)
> >
> >  static void monitor_flush_locked(Monitor *mon);
> >
> > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> >                                    void *opaque)
> >  {
> >      Monitor *mon =3D opaque;
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 2326bd7f9b..55cfb230d9 100644
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
> > @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
> >      g_queue_free(mon->qmp_requests);
> >  }
> >
> > -static void monitor_qmp_setup_handlers_bh(void *opaque)
> > +static int monitor_qmp_change(void *opaque)
> > +{
> > +    MonitorQMP *mon =3D opaque;
> > +
> > +    mon->common.use_io_thread =3D
> > +        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_GC=
ONTEXT);
> > +
> > +    if (mon->common.use_io_thread) {
> > +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread)=
,
> > +                                monitor_qmp_set_handlers_bh, mon);
> > +    } else {
> > +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > +                                 monitor_qmp_read, monitor_qmp_event,
> > +                                 monitor_qmp_change, &mon->common, NUL=
L, true);
> > +    }
> > +
> > +    if (mon->common.out_watch) {
> > +        g_source_remove(mon->common.out_watch);
>
> All other updates of @out_watch are under @mon_lock.  Why not this one?

Sorry, I missed it. I will correct it.

>
> I have no idea whether g_source_remove() is the right function to call.
> Its documentation says "You must use g_source_destroy() for sources
> added to a non-default main context."  The qemu_chr_fe_set_handlers()
> contract is of no help.
>
> Documentation of g_source_destroy() confuses some more: "This does not
> unref the GSource: if you still hold a reference, use g_source_unref()
> to drop it.
>
> Marc-Andr=C3=A9, can you help?
>
> > +        qemu_mutex_lock(&mon->common.mon_lock);
> > +        mon->common.out_watch =3D
> > +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> > +                               monitor_unblocked, &mon->common);
>
> Bad indentation.  Better:
>
>         mon->common.out_watch =3D
>             qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
>                                    monitor_unblocked, &mon->common);
>
> or
>
>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
>                                                       G_IO_OUT | G_IO_HUP=
,
>                                                       monitor_unblocked,
>                                                       &mon->common);
>
> or
>
>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
>                                         G_IO_OUT | G_IO_HUP,
>                                         monitor_unblocked, &mon->common);
>
> > +        qemu_mutex_unlock(&mon->common.mon_lock);
> > +    }
> > +
> > +    return 0;
> > +}
>

I will correct it. Thanks.

> This function copies from monitor_data_init(), monitor_init_qmp(), and
> monitor_flush_locked().  Feels like a refactoring would be in order.
> Possibly on top.
>
OK, I am considering it to avoid duplicated code.

> > +
> > +static void monitor_qmp_set_handlers_bh(void *opaque)
> >  {
> >      MonitorQMP *mon =3D opaque;
> >      GMainContext *context;
> > @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *op=
aque)
> >      assert(context);
> >      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                               monitor_qmp_read, monitor_qmp_event,
> > -                             NULL, &mon->common, context, true);
> > +                             monitor_qmp_change, &mon->common, context=
, true);
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
> > @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Er=
ror **errp)
> >      } else {
> >          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                                   monitor_qmp_read, monitor_qmp_event,
> > -                                 NULL, &mon->common, NULL, true);
> > +                                 monitor_qmp_change, &mon->common, NUL=
L, true);
> >          monitor_list_append(&mon->common);
> >      }
> >  }
>


--

Best Regards
-Li

