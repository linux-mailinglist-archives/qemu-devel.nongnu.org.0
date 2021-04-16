Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CB3362481
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:53:48 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQmx-0005w3-7u
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXQgU-00013Y-14
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:47:06 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXQgR-0007V7-GR
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:47:05 -0400
Received: by mail-vs1-xe36.google.com with SMTP id k19so1091176vsg.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lB74xf8dbtnHtF7tJNGXiF8Jn4w4r1rNrxE9fZUX5oc=;
 b=PkTSvYjGyPyLW1HEAd1PmaaI04rU/mDtVZUjYHTD7bB+AEbGIHVh7WlrMJRoFpwTgz
 uc1Ko+os6MbGsEIWNHjwPf1nvrb6zQ1MJ/xoun+sQ5w7qTWg3WFtyU6FZXnExPCbKC3O
 0r/uwWq0lZD493OlLjyDeTCoFEdsx7hdUB6iALyknXR+p8AbsbEii5s+KYSaUsZpR/lz
 b3ykkoUcmOyxArXEEv2x9Ga1JXFdgyQ89Ju/XcZIHTlXMSAzm9fkLnceGOqcx7WpiPCB
 laLAfGfQrhne0NhjwAXSu+bBNzWnXIFR8lDuSTpZwC957ZKoG4BTUBOFe4FNWuWbFc5v
 vgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lB74xf8dbtnHtF7tJNGXiF8Jn4w4r1rNrxE9fZUX5oc=;
 b=IG8NrwwHYq7tX822FqxEnGq07FkiEUqRBpUeNk+yQMsfhBVQExzL3TP6mD/cdVd/Hn
 99mFUbMGo4543RO8wBcF/izcmmSHdOkfceNpQKFOy595N1U38qjSyBz2QsrDqV34vAeR
 Jd+5ZnM1moEPMERAhP1fAIKs4CH9TFI+ivDQs9VjazhOrb8BiMPL1zwBNEfNoRxED+CR
 XDLWcj+nErzOmLnUbZBL6Mf8MX51xZUDbkUsCdmO03qMzu+TPzHjc3FA2mwejXGw/HQ5
 6iYvjw2pLjDVbmGWD01vTRboQ179eooDSfAlh3tkRMeEVgPB/24yUHjmnO+tOuKQDN3L
 uNrg==
X-Gm-Message-State: AOAM531QKk1NSnggpJi5oBe/ypSRv8N7KKxYwz7JO6ernkbKWQEHRy8V
 3lXH9xIy50fV4uGKwGbsKHrKSnX6FujHhkIA+jk=
X-Google-Smtp-Source: ABdhPJzpBvfvH7Frq8CW5I7akKlad5PQXkKm4+5Hxzfod2WBG0GawdKubx5pLGUKq6e5TkBjxEV1KciPtjpFdYhxoS4=
X-Received: by 2002:a05:6102:ed0:: with SMTP id
 m16mr7497850vst.4.1618588022454; 
 Fri, 16 Apr 2021 08:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
 <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
In-Reply-To: <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Fri, 16 Apr 2021 17:46:51 +0200
Message-ID: <CAD8of+oyjd6mSvbOUBAB1+o50CK2Syw7Rn1pV7M9cPRf3xYkPQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=zhlcindy@gmail.com; helo=mail-vs1-xe36.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, Markus Armbruster <armbru@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-Andr=C3=A9,

On Fri, Apr 16, 2021 at 5:28 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Apr 16, 2021 at 6:59 PM Marc-Andr=C3=A9 Lureau <marcandre.lureau@=
gmail.com> wrote:
>>
>> Hi
>>
>> On Fri, Apr 16, 2021 at 6:51 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
>>>
>>> Marc-Andr=C3=A9, I'd like your opinion for this one, in particular the =
use of
>>> g_source_remove().
>>
>>
>> My opinion isn't really worth much, my review would have a bit more valu=
e.
>>
>> GSource has indeed some peculiar lifetime management, that I got wrong i=
n the past. So I would be extra careful.
>>
>> But before spending time on review, I would also clarify the motivation =
and ask for testing.
>>
>> Markus, hot-adding/removing monitors isn't supported?
>>
>
> I realize you answered my question below. That's surprising me. Wouldn't =
it make more sense to support it rather than having a pre-opened null-based=
 monitor that can have its chardev swapped?

It's the best way to support hot-add/remove monitor devices. But we
would like to use it as soon as possible, so I use hotswap currently.
If possible, we can consider implementing hot-add/remove in the future.


>
>>>
>>>
>>> Li Zhang <zhlcindy@gmail.com> writes:
>>>
>>> > For some scenarios, it needs to hot-add a monitor device.
>>> > But QEMU doesn't support hotplug yet. It also works by adding
>>> > a monitor with null backend by default and then change its
>>> > backend to socket by QMP command "chardev-change".
>>> >
>>> > So this patch is to support monitor chardev hotswap with QMP.
>>> >
>>> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>>> > Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>>>
>>> Your commit message starts with a brief description of the problem.
>>> Appreciated!  But I think it could be a bit clearer.  What about this:
>>>
>>>     qmp: Support chardev-change
>>>
>>>     For some scenarios, we'd like to hot-add a monitor device.  But QEM=
U
>>>     doesn't support that, yet.  It does support hot-swapping character
>>>     backends with QMP command chardev-change.  This lets us pre-add a
>>>     monitor with a null character backend, then chardev-change to a
>>>     socket backend.  Except the chardev-change fails with "Chardev user
>>>     does not support chardev hotswap" because monitors don't provide th=
e
>>>     required callback.  Implement it for QMP monitors.
>>>
>>> > ---
>>> >  v1 -> v2:
>>> >   - Change mutex lock mon_lock section
>>> >   - Fix indentation problems
>>> >
>>> >  monitor/monitor-internal.h |  3 +++
>>> >  monitor/monitor.c          |  2 +-
>>> >  monitor/qmp.c              | 43 +++++++++++++++++++++++++++++++++++-=
--
>>> >  3 files changed, 44 insertions(+), 4 deletions(-)
>>> >
>>> > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
>>> > index 9c3a09cb01..1b80c74883 100644
>>> > --- a/monitor/monitor-internal.h
>>> > +++ b/monitor/monitor-internal.h
>>> > @@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);
>>> >  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
>>> >  int hmp_compare_cmd(const char *name, const char *list);
>>> >
>>> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>>> > +                           void *opaque);
>>> > +
>>> >  #endif
>>> > diff --git a/monitor/monitor.c b/monitor/monitor.c
>>> > index 636bcc81c5..16a3620d02 100644
>>> > --- a/monitor/monitor.c
>>> > +++ b/monitor/monitor.c
>>> > @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive=
(const Monitor *mon)
>>> >
>>> >  static void monitor_flush_locked(Monitor *mon);
>>> >
>>> > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition con=
d,
>>> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>>> >                                    void *opaque)
>>> >  {
>>> >      Monitor *mon =3D opaque;
>>> > diff --git a/monitor/qmp.c b/monitor/qmp.c
>>> > index 2b0308f933..5fa65401ae 100644
>>> > --- a/monitor/qmp.c
>>> > +++ b/monitor/qmp.c
>>> > @@ -44,6 +44,7 @@ struct QMPRequest {
>>> >      Error *err;
>>> >  };
>>> >  typedef struct QMPRequest QMPRequest;
>>> > +static void monitor_qmp_set_handlers_bh(void *opaque);
>>> >
>>> >  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
>>> >
>>> > @@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>>> >      g_queue_free(mon->qmp_requests);
>>> >  }
>>> >
>>> > -static void monitor_qmp_setup_handlers_bh(void *opaque)
>>> > +static int monitor_qmp_change                  (void *opaque)
>>> > +{
>>> > +    MonitorQMP *mon =3D opaque;
>>> > +
>>> > +    mon->common.use_io_thread =3D qemu_chr_has_feature(mon->common.c=
hr.chr,
>>> > +                                QEMU_CHAR_FEATURE_GCONTEXT);
>>> > +
>>> > +    if (mon->common.use_io_thread) {
>>> > +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothrea=
d),
>>> > +                                monitor_qmp_set_handlers_bh, mon);
>>> > +    } else {
>>> > +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>>> > +                                 monitor_qmp_read, monitor_qmp_event=
,
>>> > +                                 monitor_qmp_change, &mon->common, N=
ULL, true);
>>> > +    }
>>> > +
>>> > +    qemu_mutex_lock(&mon->common.mon_lock);
>>> > +    if (mon->common.out_watch) {
>>> > +        g_source_remove(mon->common.out_watch);
>>> > +        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common=
.chr,
>>> > +                                G_IO_OUT | G_IO_HUP,
>>> > +                                monitor_unblocked,
>>> > +                                &mon->common);
>>>
>>> Visually align the arguments:
>>>
>>>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.ch=
r,
>>>                                                       G_IO_OUT | G_IO_H=
UP,
>>>                                                       monitor_unblocked=
,
>>>                                                       &mon->common);
>>>
>>> You may reduce argument indentation some to gain extra space, but keep
>>> the arguments more indented than the function:
>>>
>>>         mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.ch=
r,
>>>                                         G_IO_OUT | G_IO_HUP,
>>>                                         monitor_unblocked, &mon->common=
);
>>>
>>> Do this only when you actually use the extra space for readability.
>>>
>>> > +    }
>>> > +    qemu_mutex_unlock(&mon->common.mon_lock);
>>> > +
>>> > +    return 0;
>>> > +}
>>>
>>> As I wrote in my review of v1, this function copies from
>>> monitor_data_init(), monitor_init_qmp(), and monitor_flush_locked().
>>> Feels like a refactoring would be in order.  Doing it on top might be
>>> easier.
>>>
>>> > +
>>> > +static void monitor_qmp_set_handlers_bh(void *opaque)
>>> >  {
>>> >      MonitorQMP *mon =3D opaque;
>>> >      GMainContext *context;
>>> > @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *=
opaque)
>>> >      assert(context);
>>> >      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>>> >                               monitor_qmp_read, monitor_qmp_event,
>>> > -                             NULL, &mon->common, context, true);
>>> > +                             monitor_qmp_change, &mon->common, conte=
xt, true);
>>> > +
>>> > +}
>>> > +
>>> > +static void monitor_qmp_setup_handlers_bh(void *opaque)
>>> > +{
>>> > +    MonitorQMP *mon =3D opaque;
>>> > +    monitor_qmp_set_handlers_bh(mon);
>>> >      monitor_list_append(&mon->common);
>>> >  }
>>> >
>>> > @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, =
Error **errp)
>>> >      } else {
>>> >          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>>> >                                   monitor_qmp_read, monitor_qmp_event=
,
>>> > -                                 NULL, &mon->common, NULL, true);
>>> > +                                 monitor_qmp_change, &mon->common, N=
ULL, true);
>>> >          monitor_list_append(&mon->common);
>>> >      }
>>> >  }
>>>
>>>
>>
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>
>
>
> --
> Marc-Andr=C3=A9 Lureau



--=20

Best Regards
-Li

