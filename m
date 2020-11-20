Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359782BAF5F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:56:51 +0100 (CET)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8mI-0008M7-1Y
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8cn-0008BC-7n
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8cl-0003D8-BO
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jI/OoZxwSbp208MPmzMJJ25UNMNqaKETEB52UpDi7I=;
 b=EaBsLVXgk4x8YwRcwMArqUQbNuJfrXEPbanNc1H3G5iQL5E22L1/Hr/2kvvkm2xjxMsO6e
 1ouOHZJuRT5PE8Qw+TFNDwPoskmtNbbBd5L9iuhTtzRE7m/yRGYhkxJONrcu4rPc+Gfc0L
 HMmyhzj+r/ztmVW3kkp3J026krk1Fw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-WXQpOqTKP0yjmNavHjt3gQ-1; Fri, 20 Nov 2020 10:46:56 -0500
X-MC-Unique: WXQpOqTKP0yjmNavHjt3gQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DEE6107AD25
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 15:46:55 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CCE860C05;
 Fri, 20 Nov 2020 15:46:54 +0000 (UTC)
Date: Fri, 20 Nov 2020 16:46:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/29] hmp: introduce cmd_available
Message-ID: <20201120164652.220b9cfe@redhat.com>
In-Reply-To: <20201027182144.3315885-27-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-27-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:41 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Combine the RUN_STATE_PRECONFIG and cmd_can_preconfig checks
> into a single function, to avoid repeating the same expression
> (or its negation after applying DeMorgan's rule) over and
> over again.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  monitor/hmp.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index c5cd9d372b..f13ef455e2 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -213,6 +213,11 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
>      return strchr(cmd->flags, 'p');
>  }
>  
> +static bool cmd_available(const HMPCommand *cmd)
> +{
> +    return !runstate_check(RUN_STATE_PRECONFIG) || cmd_can_preconfig(cmd);
> +}
> +
>  static void help_cmd_dump_one(Monitor *mon,
>                                const HMPCommand *cmd,
>                                char **prefix_args,
> @@ -220,7 +225,7 @@ static void help_cmd_dump_one(Monitor *mon,
>  {
>      int i;
>  
> -    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> +    if (!cmd_available(cmd)) {
>          return;
>      }
>  
> @@ -248,8 +253,7 @@ static void help_cmd_dump(Monitor *mon, const HMPCommand *cmds,
>      /* Find one entry to dump */
>      for (cmd = cmds; cmd->name != NULL; cmd++) {
>          if (hmp_compare_cmd(args[arg_index], cmd->name) &&
> -            ((!runstate_check(RUN_STATE_PRECONFIG) ||
> -                cmd_can_preconfig(cmd)))) {
> +            cmd_available(cmd)) {
>              if (cmd->sub_table) {
>                  /* continue with next arg */
>                  help_cmd_dump(mon, cmd->sub_table,
> @@ -653,7 +657,7 @@ static const HMPCommand *monitor_parse_command(MonitorHMP *hmp_mon,
>                         (int)(p - cmdp_start), cmdp_start);
>          return NULL;
>      }
> -    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> +    if (!cmd_available(cmd)) {
>          monitor_printf(mon, "Command '%.*s' not available with -preconfig "
>                              "until after exit_preconfig.\n",
>                         (int)(p - cmdp_start), cmdp_start);
> @@ -1225,8 +1229,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>          }
>          readline_set_completion_index(mon->rs, strlen(cmdname));
>          for (cmd = cmd_table; cmd->name != NULL; cmd++) {
> -            if (!runstate_check(RUN_STATE_PRECONFIG) ||
> -                 cmd_can_preconfig(cmd)) {
> +            if (cmd_available(cmd)) {
>                  cmd_completion(mon, cmdname, cmd->name);
>              }
>          }
> @@ -1234,8 +1237,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>          /* find the command */
>          for (cmd = cmd_table; cmd->name != NULL; cmd++) {
>              if (hmp_compare_cmd(args[0], cmd->name) &&
> -                (!runstate_check(RUN_STATE_PRECONFIG) ||
> -                 cmd_can_preconfig(cmd))) {
> +                cmd_available(cmd)) {
>                  break;
>              }
>          }


