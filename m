Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC345A8EC9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 08:53:29 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTe4s-0006Oe-Sf
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 02:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTdyw-0003r2-10
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTdyt-0002Ws-6y
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662014834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrEzREL90shy6AawylVcm82jSUz9UMrvvIXZZ5UbWPo=;
 b=OtVxG7aK56cL6GKgOVcha9Odc4IpAgxffq5d8W9JLcLDeWwZnhJnPGq1fBpUQzP3EpsUVu
 77YIScKvirV6OctOu+VYbXtH03/AJ2kebjx8vUfTfEZJPkMU4cQSuWCVU9X1glDmI171DO
 TQv4eY7I9FljoCfXePIFMX1Rr06DLtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-ZL_c75_AOmaQ-UWpElcr7g-1; Thu, 01 Sep 2022 02:47:09 -0400
X-MC-Unique: ZL_c75_AOmaQ-UWpElcr7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E648811E80;
 Thu,  1 Sep 2022 06:47:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 438692166B26;
 Thu,  1 Sep 2022 06:47:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DDD121E6900; Thu,  1 Sep 2022 08:47:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org,  dgilbert@redhat.com,  joe.jin@oracle.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] monitor/hmp: print trace as option in help for
 log command
References: <20220829170316.3053-1-dongli.zhang@oracle.com>
 <87mtbmhu0o.fsf@pond.sub.org>
 <774cddc6-d2d6-a936-0beb-249d3e5877c2@oracle.com>
Date: Thu, 01 Sep 2022 08:47:08 +0200
In-Reply-To: <774cddc6-d2d6-a936-0beb-249d3e5877c2@oracle.com> (Dongli Zhang's
 message of "Wed, 31 Aug 2022 13:05:34 -0700")
Message-ID: <87pmgf4mmr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

> Hi Markus,
>
> On 8/30/22 4:04 AM, Markus Armbruster wrote:
>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>> 
>>> The below is printed when printing help information in qemu-system-x86_64
>>> command line, and when CONFIG_TRACE_LOG is enabled:
>>>
>>> $ qemu-system-x86_64 -d help
>>> ... ...
>>> trace:PATTERN   enable trace events
>>>
>>> Use "-d trace:help" to get a list of trace events.
>>>
>>> However, they are not printed in hmp "help log" command.
>> 
>> This leaves me guessing what exactly the patch tries to do.
>
> I will clarify in the commit message.
>
>> 
>>> Cc: Joe Jin <joe.jin@oracle.com>
>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>> ---
>>> Changed since v1:
>>> - change format for "none" as well.
>>>
>>>  monitor/hmp.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/monitor/hmp.c b/monitor/hmp.c
>>> index 15ca047..467fc84 100644
>>> --- a/monitor/hmp.c
>>> +++ b/monitor/hmp.c
>>> @@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
>>>          if (!strcmp(name, "log")) {
>>>              const QEMULogItem *item;
>>>              monitor_printf(mon, "Log items (comma separated):\n");
>>> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
>>> +            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
>>>              for (item = qemu_log_items; item->mask != 0; item++) {
>>> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
>>> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>>>              }
>>> +#ifdef CONFIG_TRACE_LOG
>>> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
>>> +            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
>>> +                                "trace events.\n\n");
>> 
>> Aha: it fixes help to show "log trace:PATTERN".  Was that forgotten in
>> Paolo's commit c84ea00dc2 'log: add "-d trace:PATTERN"'?
>
> I will add the Fixes tag.
>
>> 
>> "info trace-events", hmmm... it shows trace events and their state.
>> "log trace:help" also lists them, less their state, and in opposite
>> order.  Why do we need both?

I guess we have both because we want an HMP command to show the state of
trace events ("info trace-events"), and we want "-d trace" to provide
help.

The latter also lets HMP command "log trace" help, which feels less
important to me, since "info trace-events" exists and is easier to find
and significantly more usable than "log trace:help": it can filter its
output, and unfiltered output is too long to be useful without something
like grep.

Could the two share more code?

Hmm, there seems to be something wrong with "log trace:help": I see
truncated output.  Moreover, output goes to stdout instead of the
monitor.  That's wrong.  Any help you can also emit from the monitor
should be printed with qemu_printf().

> I will print "log trace:help" in the help output.
>
>> What about showing them in alphabetical order?
>
> The order is following how they are defined in the qemu_log_items[] array. To
> re-order them in the array may introduce more conflicts when backporting a
> util/log patch to QEMU old version.
>
> Please let me know if you prefer to re-order. Otherwise, I prefer to avoid that.

I'm talking about the output of "log trace:help", not the output of "log
help".

> Thank you very much for the suggestions!
>
> Dongli Zhang
>
>> 
>>> +#endif
>>>              return;
>>>          }
>> 


