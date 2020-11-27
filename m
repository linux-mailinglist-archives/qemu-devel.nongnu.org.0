Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDE2C6356
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:44:07 +0100 (CET)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibEU-000280-5E
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kibA1-0000UY-FU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kib9y-0006BW-DP
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606473565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9+JMW+ttd3mJrscwB69shaL9GgAnfa/MwvoY8iR04w=;
 b=PnsSfn5bkojwGtbHId66asDo2v6qlY6dfinlg6hE/Um1NmMSoAD1LJeaXezLezzoe7H6s2
 n26JYtSpZLKD6XE7Yo8UiY17FNrmOK2tnIqHEqqtv9qIPmfPWepyn8g0bjBxe9IfpM8VME
 /By62fNBw9440gHE+NAFmBnENOyAtKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-Si-M7SkEOAGtALlQz0eYFQ-1; Fri, 27 Nov 2020 05:39:21 -0500
X-MC-Unique: Si-M7SkEOAGtALlQz0eYFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48CD81E7EB;
 Fri, 27 Nov 2020 10:39:20 +0000 (UTC)
Received: from work-vm (ovpn-114-206.ams2.redhat.com [10.36.114.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 826ED60C05;
 Fri, 27 Nov 2020 10:39:19 +0000 (UTC)
Date: Fri, 27 Nov 2020 10:39:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0 5/6] hmp: Add 'info accel' command
Message-ID: <20201127103916.GC2969@work-vm>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-6-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-6-r.bolshakov@yadro.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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

* Roman Bolshakov (r.bolshakov@yadro.com) wrote:
> The command is made after 'info kvm' and aims to replace it as more
> generic one.
> 
> If used without parameters, the command can used to get current
> accelerator. Otherwise, it may be used to determine if an accelerator is
> available. Here's an example if a VM with hvf accel is started:
> 
>   (qemu) info accel
>   hvf support: enabled
>   (qemu) info accel kvm
>   kvm support: not compiled
>   (qemu) info accel tcg
>   tcg support: disabled
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  hmp-commands-info.hx  | 13 +++++++++++++
>  include/monitor/hmp.h |  1 +
>  monitor/hmp-cmds.c    | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 117ba25f91..e9da6b52e4 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -337,6 +337,19 @@ SRST
>      Show KVM information.
>  ERST
>  
> +    {
> +        .name       = "accel",
> +        .args_type  = "name:s?",
> +        .params     = "[name]",
> +        .help       = "show accelerator information",
> +        .cmd        = hmp_info_accel,
> +    },
> +
> +SRST
> +  ``info accel``` [*name*]
> +    Show accelerator information.
> +ERST
> +
>      {
>          .name       = "numa",
>          .args_type  = "",
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index ed2913fd18..03f22957d9 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -21,6 +21,7 @@ void hmp_handle_error(Monitor *mon, Error *err);
>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>  void hmp_info_version(Monitor *mon, const QDict *qdict);
>  void hmp_info_kvm(Monitor *mon, const QDict *qdict);
> +void hmp_info_accel(Monitor *mon, const QDict *qdict);
>  void hmp_info_status(Monitor *mon, const QDict *qdict);
>  void hmp_info_uuid(Monitor *mon, const QDict *qdict);
>  void hmp_info_chardev(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ea86289fe8..00db791aa3 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -20,6 +20,7 @@
>  #include "chardev/char.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/accel.h"
>  #include "qemu/config-file.h"
>  #include "qemu/option.h"
>  #include "qemu/timer.h"
> @@ -133,6 +134,37 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
>      qapi_free_AccelInfo(info);
>  }
>  
> +void hmp_info_accel(Monitor *mon, const QDict *qdict)
> +{
> +    AccelInfo *info;
> +    AccelClass *acc;
> +    const char *name, *typename;
> +    char *current_name;
> +    int len;
> +
> +    /* Figure out current accelerator */
> +    acc = ACCEL_GET_CLASS(current_accel());

Is that always guaranteed non-null?

> +    typename = object_class_get_name(OBJECT_CLASS(acc));
> +    len = strlen(typename) - strlen(ACCEL_CLASS_SUFFIX);
> +    current_name = g_strndup(typename, len);
> +
> +    name = qdict_get_try_str(qdict, "name");
> +    if (!name) {
> +        name = current_name;
> +    }
> +
> +    info = qmp_query_accel(name, NULL);
> +    monitor_printf(mon, "%s support: ", name);
> +    if (info->present) {
> +        monitor_printf(mon, "%s\n", info->enabled ? "enabled" : "disabled");
> +    } else {
> +        monitor_printf(mon, "not compiled\n");
> +    }
> +
> +    qapi_free_AccelInfo(info);
> +    g_free(current_name);
> +}

I think that's fine, since HMP is not guaranteed stable, I'd say it's
fine to kill off 'info kvm' and replace it with this.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Dave

> +
>  void hmp_info_status(Monitor *mon, const QDict *qdict)
>  {
>      StatusInfo *info;
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


