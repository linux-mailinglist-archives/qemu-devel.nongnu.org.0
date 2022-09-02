Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC45AAEAE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 14:27:50 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU5m0-0002sK-Pr
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 08:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU5j5-0008VE-F4
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 08:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU5iu-00076X-CC
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 08:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662121475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fagiu3S6Uxv6Yz7PML1jQ3HeI43WY5afgWElyarQ7gg=;
 b=cTVCLnN4GWzytdmmzkhZCxXz+92MWtF4/c3OZ0/xyUA6SWHNuRZSvBNrfPfu8AtRBR7f94
 KrpmDWVZ6p4E36F+UMZwnQEZs9YLg8zI5ZzzZA2CMOmWrP72ZwZ2vovyoQwzBXXeUE963f
 6mxR176x7hF1Efgmx7NE/zn7XgwATN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-LPe-5qJHNpuVRQ5g2FXfHw-1; Fri, 02 Sep 2022 08:24:32 -0400
X-MC-Unique: LPe-5qJHNpuVRQ5g2FXfHw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0443811E81;
 Fri,  2 Sep 2022 12:24:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9417B492CA2;
 Fri,  2 Sep 2022 12:24:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5097021E6900; Fri,  2 Sep 2022 14:24:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  dgilbert@redhat.com,
 armbru@redhat.com,  joe.jin@oracle.com
Subject: Re: [PATCH v3 1/1] monitor/hmp: print trace as option in help for
 log command
References: <20220831213943.8155-1-dongli.zhang@oracle.com>
Date: Fri, 02 Sep 2022 14:24:30 +0200
In-Reply-To: <20220831213943.8155-1-dongli.zhang@oracle.com> (Dongli Zhang's
 message of "Wed, 31 Aug 2022 14:39:43 -0700")
Message-ID: <87h71qrmkh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> ----------------------------
> $ qemu-system-x86_64 -d help
> ... ...
> trace:PATTERN   enable trace events
>
> Use "-d trace:help" to get a list of trace events.
> ----------------------------
>
> However, the options of "trace:PATTERN" are only printed by
> "qemu-system-x86_64 -d help", but missing in hmp "help log" command.
>
> Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
> - change format for "none" as well.
> Changed since v2:
> - use "log trace:help" in help message.
> - add more clarification in commit message.
> - add 'Fixes' tag.
> ---
>  monitor/hmp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 15ca04735c..a3375d0341 100644
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
> +            monitor_printf(mon, "\nUse \"log trace:help\" to get a list of "
> +                           "trace events.\n\n");
> +#endif
>              return;
>          }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Not this patch's fault:

1. "-d help" terminates with exit status 1, "-d trace:help" with 0.  The
   former is wrong.

2. HMP "log trace:help" prints to stdout instead of the current monitor.

3. Output of HMP "log trace:help" sometimes is truncated for me.

4. Output of "log trace:help" and "info trace-events" is unwieldy.
   Sorted output could be a bit less unwieldy.

5. Could "log trace:help" and "info trace-events" share code?


