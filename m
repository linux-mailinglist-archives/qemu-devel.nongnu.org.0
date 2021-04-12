Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2735C9FB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:32:59 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyYc-0001sO-MK
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1lVxPx-0003vQ-Et
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:19:57 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1lVxPv-0007Ne-99
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:19:56 -0400
Received: by mail-lf1-x12f.google.com with SMTP id x13so11549615lfr.2
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKx7Dd45haKe+xZjS03X+MXyheWTXQj9O7Yt+DUv1Dc=;
 b=P0dCvuZc0gLR6XDHwNUqLZyQLaP1dKUHrNy1YGF+FI6q4V9LqxvLiMyMF/mfQXYupH
 HH2B8n2fuFpoopFG8CQeaXZJy61RNAXx7ZIsXsNLkHzT7+HsEGzHrwCirLFgtIA2R1Id
 c5FhWl+6hrxxCY7Puffy6zWgzdyx6nBOS+HuYuS1xKpVH0HydknVCJmeBXgy5UcaH2rG
 Y1ZyHocEZwCxg88wAlCSdG5LOspZYrnh5YnCL+tgX6DJPWUGqL4lY4orDc+IDHJIJGfC
 TNnN8L9Wr1HhOsPNGgNTTNZRiRGnYmGZ4E1UiofqGJ0RHv6ib+dYBrsEIqU7DWtVpntJ
 XKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKx7Dd45haKe+xZjS03X+MXyheWTXQj9O7Yt+DUv1Dc=;
 b=FfnImljNqhFwfUSRFjDEoO/U1ajNwkj1GgfP+eKg/86maIwTorZ0w0ZD8MLegLmg9c
 tixdzkV2jda01C3RAQzZLCGBp4rWMghO0hfV3F3NmzS95udER7px4lQt3ufUeZ3VxXII
 ZMDD3jMUoiVIm/LpZKr1zo6N5LeEvjePCuHJXTSRFCW1N1AZgxjkXbVOOc0TlOywT4Dy
 UYXm2tvx0Rrg0I9RUZzIxAuQMImbany5p2KeIpXtdZM1uHVSSiqyQKe1lsYLQNRaqbvs
 x164vgEKyP8793cNjU77wvQyjy0gbzWnqMTQ9WiOM+A/BaQWv0A5P5ZQH7sCiCl3nD/t
 NRbA==
X-Gm-Message-State: AOAM531BA+qfkz7e+V3MxpWKUoRwcSNtAqHM10N/6B2GHnM3wTe4QXmt
 d2qgMTKGne/Y0UpBbaVN7KJ8zPfLjv3Cl44GkTK+fw==
X-Google-Smtp-Source: ABdhPJyVnV7NKc6buh063MEHFWiVLBYW3MmR/xUMrFmy32jiczb8LIybXWyGtGg2hxNaIPx9N/aA3HsNEs1vfqvYH9s=
X-Received: by 2002:ac2:5591:: with SMTP id v17mr19599081lfg.82.1618237191425; 
 Mon, 12 Apr 2021 07:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
In-Reply-To: <20210315170636.704201-2-zhlcindy@gmail.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Mon, 12 Apr 2021 16:19:40 +0200
Message-ID: <CALzYo33tjVZriv1pr+Uhf0-hNOmK-=d2r4gvyjpPPwznQgHZSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Li Zhang <zhlcindy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::12f;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Apr 2021 11:30:49 -0400
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
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com, armbru@redhat.com,
 Qemu Developers <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Li,

> For some scenarios, it needs to hot-add a monitor device.
> But QEMU doesn't support hotplug yet. It also works by adding
> a monitor with null backend by default and then change its
> backend to socket by QMP command "chardev-change".
>
> So this patch is to support monitor chardev hotswap with QMP.
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> ---
>  monitor/monitor-internal.h |  3 +++
>  monitor/monitor.c          |  2 +-
>  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 40903d6386..2df6dd21de 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *list);
>  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
>                                   Error **errp);
>
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +                               void *opaque);
> +
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index e94f532cf5..2d255bab18 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
>
>  static void monitor_flush_locked(Monitor *mon);
>
> -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>                                    void *opaque)
>  {
>      Monitor *mon = opaque;
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 2326bd7f9b..55cfb230d9 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -44,6 +44,7 @@ struct QMPRequest {
>      Error *err;
>  };
>  typedef struct QMPRequest QMPRequest;
> +static void monitor_qmp_set_handlers_bh(void *opaque);
>
>  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
>
> @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
>
> -static void monitor_qmp_setup_handlers_bh(void *opaque)
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +
> +    mon->common.use_io_thread =
> +        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_GCONTEXT);
> +
> +    if (mon->common.use_io_thread) {
> +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
> +                                monitor_qmp_set_handlers_bh, mon);
> +    } else {
> +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> +                                 monitor_qmp_read, monitor_qmp_event,
> +                                 monitor_qmp_change, &mon->common, NULL, true);
> +    }
> +
> +    if (mon->common.out_watch) {
> +        g_source_remove(mon->common.out_watch);
> +        qemu_mutex_lock(&mon->common.mon_lock);

Not very sure if mutex is must here, but still its protecting "out_watch"
for simultaneous updating.

> +        mon->common.out_watch =
> +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> +                               monitor_unblocked, &mon->common);
> +        qemu_mutex_unlock(&mon->common.mon_lock);
> +    }
> +
> +    return 0;
> +}
> +
> +static void monitor_qmp_set_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon = opaque;
>      GMainContext *context;
> @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
>      assert(context);
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                               monitor_qmp_read, monitor_qmp_event,
> -                             NULL, &mon->common, context, true);
> +                             monitor_qmp_change, &mon->common, context, true);
> +
> +}
> +
> +static void monitor_qmp_setup_handlers_bh(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +    monitor_qmp_set_handlers_bh(mon);
>      monitor_list_append(&mon->common);
>  }
>
> @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> +                                 monitor_qmp_change, &mon->common, NULL, true);
>          monitor_list_append(&mon->common);
>      }
>  }

Overall patch looks good to me.
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

