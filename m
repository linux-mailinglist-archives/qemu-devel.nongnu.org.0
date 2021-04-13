Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BB35DB5A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:35:51 +0200 (CEST)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFSY-0008FO-IV
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWFQY-0007h9-7I
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:33:46 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:36504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lWFQV-0007Y5-Tl
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:33:45 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id u200so903797vku.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nSSJkN+16YSA/a2G/IaG/y6L3oBxWtuibXuG/NoseCo=;
 b=FKlJPqUzVeTeVdguGfUsW1yKH6YqNUyHvGOSEWjSGYB5lEuBZ+3OzWLxx7R+cz/H4l
 X48MR/BqiUGA5pMRI36Ne8Z/F4o2HM7q1dFj0rmpjAT6lbHrXrT4ArJx3x/IolWZjdb8
 r7Q7A8MqPmvB9hZuagmy94FwVDCjCgn1C53PErRcJVOpdcSrroiiEiiTIypKyDqmtPnY
 TDAeotHRZNGWUzUDZFBTxlbZh5azEQW9f9W4hntf0d0EGnwUV8993GoC5qCPQchntmAc
 mfzxsp4Rw/nmzDYF+gWvfrxIC+iZOrGmlRasTLWAaacACKu+dOEwx/mt18o04XZmeLZC
 qtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nSSJkN+16YSA/a2G/IaG/y6L3oBxWtuibXuG/NoseCo=;
 b=BhV6wFofHJJBC14LaP5Smiu/os7vSlIUJz1eSLkSRwJr+5EasbTd++pgEF7ooszKLF
 YLgOrYsDXzG0V/n3g/K3Rd6kox1yhhD2aJF2OABCfiUB7Ihwqew8KOdwbkD/hXv6C1E5
 sLOCUbCyk/3YOcrOyngtB9FMom08ZnIw1HKrSXDlZjIhxhs7ucyj8OxQKZGkzf5p+Exi
 7mxbTV3O+6rQ7pJS00cSH67bOaDxGzTH9fx5UHYIBEzdc/kNsV9e26p5VYxNnddf3uCO
 63eZY1pNfy1SACnGu0jVoEHMHlXZ3yDWZTsB/6XGrgFlRrZp/xLXVkLihNiIBv8rp7+i
 cUXw==
X-Gm-Message-State: AOAM530G7RVOrnxzt8YkdtS0KlIoj7ha/n88v3jR8fx4WhYAMWh7PUbE
 DumGYofr1Mk2ZoyIhiOwaTKQUodTwx2liVpyxTQ=
X-Google-Smtp-Source: ABdhPJzEcYFyFR4DCoxTc8r6vwx9Nl14tJR4dBpM3Ut2EnRZ+gyazu0cbzk9mp0VlR5PCjYBMgzSNncXkIoqFpKRwSc=
X-Received: by 2002:a05:6122:4c5:: with SMTP id
 s5mr21140605vkn.24.1618306422711; 
 Tue, 13 Apr 2021 02:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <8735vu1ybo.fsf@dusky.pond.sub.org> <YHVdFndkaj0bltcE@redhat.com>
In-Reply-To: <YHVdFndkaj0bltcE@redhat.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 13 Apr 2021 11:33:31 +0200
Message-ID: <CAD8of+pJU1Qdg256LKfTOQDL=hNy6Z=gQQdPWY53WbkQPJRAtQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=zhlcindy@gmail.com; helo=mail-vk1-xa2a.google.com
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
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 10:58 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Apr 13, 2021 at 08:40:59AM +0200, Markus Armbruster wrote:
> > Li Zhang <zhlcindy@gmail.com> writes:
> >
> > > From: Li Zhang <li.zhang@cloud.ionos.com>
> > >
> > > For some scenarios, it needs to hot-add a monitor device.
> > > But QEMU doesn't support hotplug yet. It also works by adding
> > > a monitor with null backend by default and then change its
> > > backend to socket by QMP command "chardev-change".
>
> If you need ability to hot-add monitor instances, why not just
> implement that feature directly, instead of pre-creating monitors
> with null backends and then later changing the backend ?
>

Hi Daniel,

I would like to use this solution first because we'd like to use it as
soon as possible.
It's the best solution to implement the hot-add feature and it may
need more effort to do it.
I will consider it.

> > >
> > > So this patch is to support monitor chardev hotswap with QMP.
> > >
> > > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> >
> > I think what what you're trying to say is that chardev-change does not
> > work when the character device changes is used by a QMP monitor.
> > Correct?
> >
> > If yes, how exactly does it misbehave?
> >
> > Does it work with an HMP monitor?
> >
> > > ---
> > >  monitor/monitor-internal.h |  3 +++
> > >  monitor/monitor.c          |  2 +-
> > >  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++-=
--
> > >  3 files changed, 43 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> > > index 40903d6386..2df6dd21de 100644
> > > --- a/monitor/monitor-internal.h
> > > +++ b/monitor/monitor-internal.h
> > > @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char =
*list);
> > >  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
> > >                                   Error **errp);
> > >
> > > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > > +                               void *opaque);
> > > +
> > >  #endif
> > > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > > index e94f532cf5..2d255bab18 100644
> > > --- a/monitor/monitor.c
> > > +++ b/monitor/monitor.c
> > > @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive=
(const Monitor *mon)
> > >
> > >  static void monitor_flush_locked(Monitor *mon);
> > >
> > > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition con=
d,
> > > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > >                                    void *opaque)
> > >  {
> > >      Monitor *mon =3D opaque;
> > > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > > index 2326bd7f9b..55cfb230d9 100644
> > > --- a/monitor/qmp.c
> > > +++ b/monitor/qmp.c
> > > @@ -44,6 +44,7 @@ struct QMPRequest {
> > >      Error *err;
> > >  };
> > >  typedef struct QMPRequest QMPRequest;
> > > +static void monitor_qmp_set_handlers_bh(void *opaque);
> > >
> > >  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> > >
> > > @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
> > >      g_queue_free(mon->qmp_requests);
> > >  }
> > >
> > > -static void monitor_qmp_setup_handlers_bh(void *opaque)
> > > +static int monitor_qmp_change(void *opaque)
> > > +{
> > > +    MonitorQMP *mon =3D opaque;
> > > +
> > > +    mon->common.use_io_thread =3D
> > > +        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_=
GCONTEXT);
> > > +
> > > +    if (mon->common.use_io_thread) {
> > > +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothrea=
d),
> > > +                                monitor_qmp_set_handlers_bh, mon);
> > > +    } else {
> > > +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > > +                                 monitor_qmp_read, monitor_qmp_event=
,
> > > +                                 monitor_qmp_change, &mon->common, N=
ULL, true);
> > > +    }
> > > +
> > > +    if (mon->common.out_watch) {
> > > +        g_source_remove(mon->common.out_watch);
> >
> > All other updates of @out_watch are under @mon_lock.  Why not this one?
> >
> > I have no idea whether g_source_remove() is the right function to call.
> > Its documentation says "You must use g_source_destroy() for sources
> > added to a non-default main context."  The qemu_chr_fe_set_handlers()
> > contract is of no help.
> >
> > Documentation of g_source_destroy() confuses some more: "This does not
> > unref the GSource: if you still hold a reference, use g_source_unref()
> > to drop it.
> >
> > Marc-Andr=C3=A9, can you help?
> >
> > > +        qemu_mutex_lock(&mon->common.mon_lock);
> > > +        mon->common.out_watch =3D
> > > +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> > > +                               monitor_unblocked, &mon->common);
> >
> > Bad indentation.  Better:
> >
> >         mon->common.out_watch =3D
> >             qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP=
,
> >                                    monitor_unblocked, &mon->common);
> >
> > or
> >
> >         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.ch=
r,
> >                                                       G_IO_OUT | G_IO_H=
UP,
> >                                                       monitor_unblocked=
,
> >                                                       &mon->common);
> >
> > or
> >
> >         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.ch=
r,
> >                                         G_IO_OUT | G_IO_HUP,
> >                                         monitor_unblocked, &mon->common=
);
> >
> > > +        qemu_mutex_unlock(&mon->common.mon_lock);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> >
> > This function copies from monitor_data_init(), monitor_init_qmp(), and
> > monitor_flush_locked().  Feels like a refactoring would be in order.
> > Possibly on top.
> >
> > > +
> > > +static void monitor_qmp_set_handlers_bh(void *opaque)
> > >  {
> > >      MonitorQMP *mon =3D opaque;
> > >      GMainContext *context;
> > > @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *=
opaque)
> > >      assert(context);
> > >      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > >                               monitor_qmp_read, monitor_qmp_event,
> > > -                             NULL, &mon->common, context, true);
> > > +                             monitor_qmp_change, &mon->common, conte=
xt, true);
> > > +
> > > +}
> > > +
> > > +static void monitor_qmp_setup_handlers_bh(void *opaque)
> > > +{
> > > +    MonitorQMP *mon =3D opaque;
> > > +    monitor_qmp_set_handlers_bh(mon);
> > >      monitor_list_append(&mon->common);
> > >  }
> > >
> > > @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, =
Error **errp)
> > >      } else {
> > >          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > >                                   monitor_qmp_read, monitor_qmp_event=
,
> > > -                                 NULL, &mon->common, NULL, true);
> > > +                                 monitor_qmp_change, &mon->common, N=
ULL, true);
> > >          monitor_list_append(&mon->common);
> > >      }
> > >  }
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20

Best Regards
-Li

