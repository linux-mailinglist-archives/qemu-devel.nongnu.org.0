Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37D3B31DF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:04 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQmt-0003zt-7t
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQlr-00032w-Ag
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQlo-00078Q-BG
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624546555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nSoA0OAMHBSbNfGdbr8CHT/BCNkjHZFPytF1MJBEP9U=;
 b=K65Eg8zOywKzZTmAkGMVmosAOFmDsUfC2ya9GkEJAGLSHXq2+JHNXBcM1tcgFB7vlw8TqT
 sQWUSfE4Wf3nj7NZuFPJTmu3dx/4Pks9EW2h9ew8krgOm0+xIDMy7YXVymTdGdpsIUkjTl
 gFD38lM2NnSmfoa3WdDSSL6TgdQS0EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-SnLR2jgjNAuGJzs3x4FGqg-1; Thu, 24 Jun 2021 10:55:53 -0400
X-MC-Unique: SnLR2jgjNAuGJzs3x4FGqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FE2100CA88;
 Thu, 24 Jun 2021 14:55:51 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9090E2C8;
 Thu, 24 Jun 2021 14:55:31 +0000 (UTC)
Date: Thu, 24 Jun 2021 15:55:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 30/34] monitor: allow register hmp commands
Message-ID: <YNSc4TGa1EIb61H/@work-vm>
References: <20210624103836.2382472-1-kraxel@redhat.com>
 <20210624103836.2382472-31-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210624103836.2382472-31-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> Allow commands having a NULL cmd pointer, add a function to set the
> pointer later.  Use case: allow modules implement hmp commands.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

So this is OK, so

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

however, I can imagine:
  a) Auto load as you suggest
  b) Making the error better 'Command ... needs module ....'
  c) Don't actually define the command in the tables at all; make
     the module actually add the command to the table.

Dave

> ---
>  include/monitor/monitor.h |  3 +++
>  monitor/hmp.c             |  7 +++++++
>  monitor/misc.c            | 16 ++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 1211d6e6d69f..1a8a369b50b2 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -51,4 +51,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
>  void monitor_fdset_dup_fd_remove(int dup_fd);
>  int64_t monitor_fdset_dup_fd_find(int dup_fd);
>  
> +void monitor_register_hmp(const char *name, bool info,
> +                          void (*cmd)(Monitor *mon, const QDict *qdict));
> +
>  #endif /* MONITOR_H */
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 6c0b33a0b19d..d50c3124e1e1 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1089,6 +1089,13 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
>          return;
>      }
>  
> +    if (!cmd->cmd) {
> +        /* FIXME: is it useful to try autoload modules here ??? */
> +        monitor_printf(&mon->common, "Command \"%.*s\" is not available.\n",
> +                       (int)(cmdline - cmd_start), cmd_start);
> +        return;
> +    }
> +
>      qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
>      if (!qdict) {
>          while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 1539e18557f0..ad476c6e51ea 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1974,6 +1974,22 @@ static void sortcmdlist(void)
>            compare_mon_cmd);
>  }
>  
> +void monitor_register_hmp(const char *name, bool info,
> +                          void (*cmd)(Monitor *mon, const QDict *qdict))
> +{
> +    HMPCommand *table = info ? hmp_info_cmds : hmp_cmds;
> +
> +    while (table->name != NULL) {
> +        if (strcmp(table->name, name) == 0) {
> +            g_assert(table->cmd == NULL);
> +            table->cmd = cmd;
> +            return;
> +        }
> +        table++;
> +    }
> +    g_assert_not_reached();
> +}
> +
>  void monitor_init_globals(void)
>  {
>      monitor_init_globals_core();
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


