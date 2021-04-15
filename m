Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B08360E04
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:10:12 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3dE-0008CZ-3Y
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lX3b7-0006oe-0V
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:08:01 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:40560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lX3b5-0001QW-0R
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:08:00 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id k12so1916868vkn.7
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0npHmN0TfYDiJUsL9STYqaKBKN9NkMLnpDlOX8b00wc=;
 b=N9F7q+vmD9wbLVD+KT/z3Yc/8TWuyj6Idp48WLNpDQ3Xu0KpfvWxaulGS8AEwKdWuF
 sThYnGcIyc4abkZpIqeqvMtkGctP2AdTnLCCEXz22H6ZmrBRslQQ/UYEsScapkBNHrXO
 Vrw1vSBuYvpONLECNzP/yhe8d7bbfDv4WABvDdSZva9L7CS8NaarHQYtP1lYTeYvnOah
 UzfZZUIaOTR3MqZk+uzB9M1YxWmzIzdXJMJLlllT4MJuB5TwxubSJvSjXhNpNWuKa57c
 FWe5ZZJ3bYRf7wiSCTrNVBSj++2A1u3YiT8wH32TYNLKavMTbcoLhJBiXMoPDPP7xPfK
 5Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0npHmN0TfYDiJUsL9STYqaKBKN9NkMLnpDlOX8b00wc=;
 b=UySxsSao8z20TQrVitwNiimHLTqwOsteINfLn12RQ9oO1z62C7CI8sUrls2N3/C8xw
 99NB1XIhloqNM6wOj1MnQyLIkWNjVhnpnlWbOsBnixHK+skwHtt14LbCrO/RlXh4pFsO
 q2GKxyMygjC9ooQH7hTWzox7PM9J8VvYGdBsk1xrWwFsaiZ8jd98+xUuOOssMu15v1gN
 X0FqM3vR8LwVUOk9Km/ZoTJM6CG+TJdeQ0kuWXBr+UcpP5TAxUiyHjAPBQXAQNDrZKrf
 x5L8hU10pnQTcNI87rcpOXMt6bx76Hx2P5pXX3Gl9ZDpGr9WgvkudnR+aWK5AEzGlT/k
 FfzQ==
X-Gm-Message-State: AOAM531+DfwtIDPy+B/C2cE5CzJFfaXGc7ZSb7YBkqM8OQSOe6mevtTf
 6I2I+4vtucOtIA5EC96PQEWWcMupEsx5jgBqnFY=
X-Google-Smtp-Source: ABdhPJz8rwK6lj0rL3pYTvQsXVWaMZoKrbqib+oun9/zmODww2tI/oAlAHUeyLCwbS6xXSQUZDh30o9vtqLfZdrxT7U=
X-Received: by 2002:a05:6122:54:: with SMTP id q20mr2393744vkn.3.1618499276816; 
 Thu, 15 Apr 2021 08:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
In-Reply-To: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Thu, 15 Apr 2021 17:07:35 +0200
Message-ID: <CAD8of+o43USAaRu7zJTynKvgT2FaJ7U69SMxZ50gUVBYMtQaSg@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=zhlcindy@gmail.com; helo=mail-vk1-xa2c.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Tue, Apr 13, 2021 at 11:37 PM Li Zhang <zhlcindy@gmail.com> wrote:
>
> For some scenarios, it needs to hot-add a monitor device.
> But QEMU doesn't support hotplug yet. It also works by adding
> a monitor with null backend by default and then change its
> backend to socket by QMP command "chardev-change".
>
> So this patch is to support monitor chardev hotswap with QMP.
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  v1 -> v2:
>   - Change mutex lock mon_lock section
>   - Fix indentation problems
>
>  monitor/monitor-internal.h |  3 +++
>  monitor/monitor.c          |  2 +-
>  monitor/qmp.c              | 43 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..1b80c74883 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);
>  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
>  int hmp_compare_cmd(const char *name, const char *list);
>
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +                           void *opaque);
> +
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 636bcc81c5..16a3620d02 100644
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
> index 2b0308f933..5fa65401ae 100644
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
> @@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
>
> -static void monitor_qmp_setup_handlers_bh(void *opaque)
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +
> +    mon->common.use_io_thread = qemu_chr_has_feature(mon->common.chr.chr,
> +                                QEMU_CHAR_FEATURE_GCONTEXT);
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
> +    qemu_mutex_lock(&mon->common.mon_lock);
> +    if (mon->common.out_watch) {
> +        g_source_remove(mon->common.out_watch);
> +        mon->common.out_watch = qemu_chr_fe_add_watch(&mon->common.chr,
> +                                G_IO_OUT | G_IO_HUP,
> +                                monitor_unblocked,
> +                                &mon->common);
> +    }
> +    qemu_mutex_unlock(&mon->common.mon_lock);
> +
> +    return 0;
> +}
> +
> +static void monitor_qmp_set_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon = opaque;
>      GMainContext *context;
> @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
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
> @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> +                                 monitor_qmp_change, &mon->common, NULL, true);
>          monitor_list_append(&mon->common);
>      }
>  }
> --
> 2.25.1
>


-- 

Best Regards
-Li

