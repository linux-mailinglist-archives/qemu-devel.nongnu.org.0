Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0863623D0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:22:39 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQIn-00017i-Fl
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXQHC-0000EV-Nw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:20:58 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXQHA-0003c2-QR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:20:58 -0400
Received: by mail-ua1-x933.google.com with SMTP id z15so3208393uao.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6kSuJ58nd3z+PSJqR5Trl6Mrt0oWu4b6BIZdj5o7/cw=;
 b=Be9h1BYxCJAExr4OskyVPsXz/cqsJg5b50/s3U1voKNuPOCLOUD4WxufV/Qx2gUiF/
 RKq82AsFDsYXikSQTIc4x3iBtK+wGFQZdbaSorq/DeDqppmQvIlEvs3gIxiypui7bXFB
 Y+/UyDG9XycvqzBv/XeSUqL/sSZg/9RYhqPETN5ndHhCCnmczopixV792qAJ4+hNYrSF
 zHLRD3DAVuSUCK6OnursnxwCLS/qNmQNAyeHEZ/i8LOTaBE7Rc0ddBD+0M5WBJ8vyhKT
 jtXvcyYF/6H6XHpO2HA1ove3/sK2TTRceymctq1AzceSXnlpBPtE27TV4aLHsg0CbfE/
 s6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6kSuJ58nd3z+PSJqR5Trl6Mrt0oWu4b6BIZdj5o7/cw=;
 b=JmMimjyk2j0gOBdqFB/TnPm3Q+U5ouom1jlHX8WyMUyesin+DB0S7R7aAdB6fNyWEj
 C9V0hBc0muXHoVDj+lFfrvi4Xyu713RVvnCaEV0ar+jeOqXP9z64+8Mvj0PNyEiDEA/v
 0HOpfXCbNkI4Gc0uzrEnHDY1Ea1gaVLl8bVXmq7ho+8j/SmuDIhgB1pknd2EaMxhwlTT
 TitCuTPadmlmLc2qQGTXiLHIBPu3rpSKRKdbWosqlsxv3XNEhNu53HFc4ZmLBj6wDsZi
 DAROVDWgeve+9vhi3PWtMw29Q5plDjExA3y4ptd1W+SLs8jlSdSGYyUN6MKKcmowIiIn
 w68w==
X-Gm-Message-State: AOAM531B7q4EbMmDEoSouC8XmRirNy30pI92EmZTqSiZi4wBcv2tMR87
 Kd0vBzJhYTJcSQgxQgAv8zkIHWYOqCKc7hq58gI=
X-Google-Smtp-Source: ABdhPJyhBHOo2dHR9tExOmJJXWiGQ7SK0njZaEh+9PPhrBN06leFLXEDaEm+KVqfgEk8moAXoqSRtiHsl/0VfShmnog=
X-Received: by 2002:ab0:494e:: with SMTP id a14mr6980777uad.99.1618586455146; 
 Fri, 16 Apr 2021 08:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
In-Reply-To: <875z0m4733.fsf@dusky.pond.sub.org>
From: Li Zhang <zhlcindy@gmail.com>
Date: Fri, 16 Apr 2021 17:20:44 +0200
Message-ID: <CAD8of+ouCK6gd5ur6Eq23EJy_y3a_OV9wkBDBivp+tOkbzagTQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=zhlcindy@gmail.com; helo=mail-ua1-x933.google.com
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 4:50 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Marc-Andr=C3=A9, I'd like your opinion for this one, in particular the us=
e of
> g_source_remove().
>
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

It looks good to me.

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
> > +    mon->common.use_io_thread =3D qemu_chr_has_feature(mon->common.chr=
.chr,
> > +                                QEMU_CHAR_FEATURE_GCONTEXT);
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

I double check my patch, it is like the above style. But it looks
different in email. It's really strange.
I will correct it.

> You may reduce argument indentation some to gain extra space, but keep
> the arguments more indented than the function:
>
>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
>                                         G_IO_OUT | G_IO_HUP,
>                                         monitor_unblocked, &mon->common);
>
> Do this only when you actually use the extra space for readability.
>
OK, thanks for explanation.

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

 I may misunderstand what you mean. What's the meaning of "doing it on
top" exactly?

>
> > +
> > +static void monitor_qmp_set_handlers_bh(void *opaque)
> >  {
> >      MonitorQMP *mon =3D opaque;
> >      GMainContext *context;
> > @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *op=
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
> > @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Er=
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

