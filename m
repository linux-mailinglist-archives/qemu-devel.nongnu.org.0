Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969AD3D74C4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:10:30 +0200 (CEST)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Lun-0005FK-5Z
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m8Lsn-0003OX-Em
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:08:25 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m8Lsj-0006ri-Ga
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:08:25 -0400
Received: by mail-yb1-xb31.google.com with SMTP id a93so20341147ybi.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3xTK25MJ2T5Zzp+3ma0WkUXW8DeVfP8C/iP5itC/gbQ=;
 b=nOKRT5B/LbuCNS4wvBtJBwmHkwLTqP2YVlfPkgXRCvuTeQaklwggYQr+g3dYVoUSov
 R//idHuo2dBS+e/wdKf71BTcJ0apJv+hRnD4TQGYltDPXzw5nl59ICaz0jpnr3H8ZJP1
 yt4IiJQVdbrt1ztmy/hcRUc9W4fZjX9ZLfNCioVXbxJolEIyPAZsvTR8x8PEQTHdoHzV
 7NAErIf1n10j1Kfd6yd6dge15cLJCwsWxrwd31uBZ9YGdw/3LsD4CDgdjqRfVE55MxIn
 Sri9sC4Mnb8/AJhlNebev71bLjaNOdGe48VS4Ukf1T0bYa3KDBj6Buxod+pFvKbVVfj9
 b2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3xTK25MJ2T5Zzp+3ma0WkUXW8DeVfP8C/iP5itC/gbQ=;
 b=BO8uPPEnwua/ra3ukEmE7H6SWYhbpm9aay/4UafUY4hj/bd3TH+627KWxoYf1C23Sk
 t1VXmrTcPFBWPsCXgcHqjmJl97a8h4SF+FymdHnbpKOiav9quAT9K84h3EHscYt3azX+
 woql1GNLt7Eg0uA9IOCzmB200HqpeiO8bOyWe6FHJfSVyIiBJu0q+ZJ64IKkM+bHmTwc
 Odegn3kBr4q5dL3U2WdVpO2EiN9aMczGrpCh+uU/94PxG3k4AamR5YivzEbmzQRIcUs5
 CeTjByUuSQ1T4Ws/uk+ESOhmBlq/Runa+DZLXnW5kK/wYZaxWAnEcEIFXjikHIM0UQ7J
 avow==
X-Gm-Message-State: AOAM532rR5rtEq1MW3qAsUBqiABCextt1O8kZWvR8LivGuKZQaknEhai
 vdW8cKGKd2c4TqQLTIUkM2Wf/tXW5S5HsMDdU5U=
X-Google-Smtp-Source: ABdhPJwVK7x4S0fYiFr0d5oohjuZNLMLHpybDgQF0vq9Hyfa4ZAJ12Rt2V0Ar8n0/Fm01P9P2Ko+rwPBxwg9E+l/lNg=
X-Received: by 2002:a25:9249:: with SMTP id e9mr16405024ybo.129.1627387699357; 
 Tue, 27 Jul 2021 05:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210709160843.339796-1-li.zhang@ionos.com>
In-Reply-To: <20210709160843.339796-1-li.zhang@ionos.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 27 Jul 2021 14:08:08 +0200
Message-ID: <CAD8of+ouuVVbi8tDGX6KFHA_nLMvZXFmZSLKuODVprN=A0Xdyw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/2] qmp: Support chardev-change
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Pankaj Gupta <pankaj.gupta@ionos.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Any comments for this patch?

On Fri, Jul 9, 2021 at 6:11 PM Li Zhang <zhlcindy@gmail.com> wrote:
>
> For some scenarios, we'd like to hot-add a monitor device.  But QEMU
> doesn't support that, yet.  It does support hot-swapping character
> backends with QMP command chardev-change.  This lets us pre-add a
> monitor with a null character backend, then chardev-change to a
> socket backend.  Except the chardev-change fails with "Chardev user
> does not support chardev hotswap" because monitors don't provide the
> required callback.  Implement it for QMP monitors.
>
> Signed-off-by: Li Zhang <li.zhang@ionos.com>
> ---
> v3 -> v2:
>   * Rework the patch which is to add hotswap for QMP device
>     https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg03167.html
>   * Refactor the functions qmp_chardev_add and qmp_chardev_change
>
>  monitor/monitor-internal.h |  1 +
>  monitor/monitor.c          |  4 +-
>  monitor/qmp.c              | 84 +++++++++++++++++++++++++++-----------
>  3 files changed, 63 insertions(+), 26 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..162f73119b 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -182,5 +182,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
>  void help_cmd(Monitor *mon, const char *name);
>  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
>  int hmp_compare_cmd(const char *name, const char *list);
> +void monitor_flush_locked(Monitor *mon);
>
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index b90c0f4051..1b05ef3bdb 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -154,8 +154,6 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
>      return !monitor_uses_readline(container_of(mon, MonitorHMP, common));
>  }
>
> -static void monitor_flush_locked(Monitor *mon);
> -
>  static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>                                    void *opaque)
>  {
> @@ -169,7 +167,7 @@ static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>  }
>
>  /* Caller must hold mon->mon_lock */
> -static void monitor_flush_locked(Monitor *mon)
> +void monitor_flush_locked(Monitor *mon)
>  {
>      int rc;
>      size_t len;
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527b6f..29b49ee041 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -46,6 +46,8 @@ struct QMPRequest {
>  typedef struct QMPRequest QMPRequest;
>
>  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> +static void monitor_qmp_setup_handlers_bh(void *opaque);
> +static void monitor_backend_init(MonitorQMP *mon, Chardev *chr);
>
>  static bool qmp_oob_enabled(MonitorQMP *mon)
>  {
> @@ -481,6 +483,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
>
> +static bool monitor_in_list(Monitor *mon)
> +{
> +    Monitor *mon_tmp;
> +    QTAILQ_FOREACH(mon_tmp, &mon_list, entry) {
> +        if (mon_tmp == mon) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +
> +    monitor_data_init(&mon->common, true, false,
> +            qemu_chr_has_feature(mon->common.chr.chr,
> +                                 QEMU_CHAR_FEATURE_GCONTEXT));
> +    monitor_backend_init(mon, mon->common.chr.chr);
> +    qemu_mutex_lock(&mon->common.mon_lock);
> +    if (mon->common.out_watch) {
> +        mon->common.out_watch = 0;
> +        monitor_flush_locked(&mon->common);
> +    }
> +    qemu_mutex_unlock(&mon->common.mon_lock);
> +
> +    return 0;
> +}
> +
>  static void monitor_qmp_setup_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon = opaque;
> @@ -491,30 +522,15 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
>      assert(context);
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                               monitor_qmp_read, monitor_qmp_event,
> -                             NULL, &mon->common, context, true);
> -    monitor_list_append(&mon->common);
> -}
> +                             monitor_qmp_change, &mon->common, context, true);
>
> -void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
> -{
> -    MonitorQMP *mon = g_new0(MonitorQMP, 1);
> -
> -    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
> -        g_free(mon);
> -        return;
> +    if (!monitor_in_list(&mon->common)) {
> +        monitor_list_append(&mon->common);
>      }
> -    qemu_chr_fe_set_echo(&mon->common.chr, true);
> -
> -    /* Note: we run QMP monitor in I/O thread when @chr supports that */
> -    monitor_data_init(&mon->common, true, false,
> -                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
> -
> -    mon->pretty = pretty;
> -
> -    qemu_mutex_init(&mon->qmp_queue_lock);
> -    mon->qmp_requests = g_queue_new();
> +}
>
> -    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
> +static void monitor_backend_init(MonitorQMP *mon, Chardev *chr)
> +{
>      if (mon->common.use_io_thread) {
>          /*
>           * Make sure the old iowatch is gone.  It's possible when
> @@ -532,7 +548,29 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> -        monitor_list_append(&mon->common);
> +                                 monitor_qmp_change, &mon->common, NULL, true);
> +        if (!monitor_in_list(&mon->common)) {
> +            monitor_list_append(&mon->common);
> +        }
>      }
>  }
> +
> +void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
> +{
> +    MonitorQMP *mon = g_new0(MonitorQMP, 1);
> +
> +    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
> +        g_free(mon);
> +        return;
> +    }
> +    qemu_chr_fe_set_echo(&mon->common.chr, true);
> +     /* Note: we run QMP monitor in I/O thread when @chr supports that */
> +    monitor_data_init(&mon->common, true, false,
> +                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
> +
> +    mon->pretty = pretty;
> +    qemu_mutex_init(&mon->qmp_queue_lock);
> +    mon->qmp_requests = g_queue_new();
> +    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
> +    monitor_backend_init(mon, chr);
> +}
> --
> 2.25.1
>


-- 

Best Regards
-Li

