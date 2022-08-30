Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE325A6156
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 13:08:29 +0200 (CEST)
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSz6a-0007XZ-Dr
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 07:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSz32-0005OS-Tp
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSz2z-0002KD-L9
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661857484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBAYIK2eRvFa6M051YT8D9eY9GjloJuIA0ppfGTmuKc=;
 b=DuuVDK5cQ1S/t7alE0si7MFN9hYgTQwhj3EcK9GcC5Qmpwb/cdS+6h3/oK0w42DLrPpj6B
 GZ+s4cwQPtzCyshcnqv9/AwfHmd2/07r+YkTvstn4U4tIVXvDggyRNGPXn7S08I5V1yn2Q
 7vUSHsjOLgNWrcoQTrGYfWcu5uoVO3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-4vDn-WsjNISwY04_e4XMcw-1; Tue, 30 Aug 2022 07:04:41 -0400
X-MC-Unique: 4vDn-WsjNISwY04_e4XMcw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5645811E76;
 Tue, 30 Aug 2022 11:04:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA76492C3B;
 Tue, 30 Aug 2022 11:04:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 663F321E6900; Tue, 30 Aug 2022 13:04:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  dgilbert@redhat.com,
 joe.jin@oracle.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] monitor/hmp: print trace as option in help for
 log command
References: <20220829170316.3053-1-dongli.zhang@oracle.com>
Date: Tue, 30 Aug 2022 13:04:39 +0200
In-Reply-To: <20220829170316.3053-1-dongli.zhang@oracle.com> (Dongli Zhang's
 message of "Mon, 29 Aug 2022 10:03:16 -0700")
Message-ID: <87mtbmhu0o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Dongli Zhang <dongli.zhang@oracle.com> writes:

> The below is printed when printing help information in qemu-system-x86_64
> command line, and when CONFIG_TRACE_LOG is enabled:
>
> $ qemu-system-x86_64 -d help
> ... ...
> trace:PATTERN   enable trace events
>
> Use "-d trace:help" to get a list of trace events.
>
> However, they are not printed in hmp "help log" command.

This leaves me guessing what exactly the patch tries to do.

> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
> - change format for "none" as well.
>
>  monitor/hmp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 15ca047..467fc84 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
>          if (!strcmp(name, "log")) {
>              const QEMULogItem *item;
>              monitor_printf(mon, "Log items (comma separated):\n");
> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
> +            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
>              for (item = qemu_log_items; item->mask != 0; item++) {
> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>              }
> +#ifdef CONFIG_TRACE_LOG
> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
> +            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
> +                                "trace events.\n\n");

Aha: it fixes help to show "log trace:PATTERN".  Was that forgotten in
Paolo's commit c84ea00dc2 'log: add "-d trace:PATTERN"'?

"info trace-events", hmmm... it shows trace events and their state.
"log trace:help" also lists them, less their state, and in opposite
order.  Why do we need both?

What about showing them in alphabetical order?

> +#endif
>              return;
>          }


