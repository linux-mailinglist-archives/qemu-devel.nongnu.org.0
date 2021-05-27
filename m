Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6339293B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 10:09:30 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmB58-0004NU-2B
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 04:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmB4A-0003Y3-PU
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmB47-0006NS-Hv
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622102905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kOjSd1CxEAwXcg+pqxGONg32aK/cUz/UWRikCIvKjJU=;
 b=S8Q1UC3y0QjAR0bM28rURu1F8tGAGr29y6oeV2Gxk1D66/XcJOfJcWIHsylZ6yEGOGyYzh
 Y7Ybt3WUA7/aVBzWDkYj36IhXKMfnWbG/ZX3KIugWrdJpH7KmWaIYIPhBivf9oUDROJSIL
 ntFZ6KP7AhMgz6uG2TQ9ZTouJf9AdpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-2cPwnsyHN0CnutJafFOXEQ-1; Thu, 27 May 2021 04:08:21 -0400
X-MC-Unique: 2cPwnsyHN0CnutJafFOXEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EBD1501E5;
 Thu, 27 May 2021 08:08:20 +0000 (UTC)
Received: from work-vm (ovpn-114-249.ams2.redhat.com [10.36.114.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78D65E71E;
 Thu, 27 May 2021 08:08:17 +0000 (UTC)
Date: Thu, 27 May 2021 09:08:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
Message-ID: <YK9TbsnX9/QVjGpH@work-vm>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
In-Reply-To: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bruno Larsen (billionai) (bruno.larsen@eldorado.org.br) wrote:
> Since ppc was the last architecture to collect these statistics and
> it is currently phasing this collection out, the command that would query
> this information is being removed.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hmp-commands-info.hx | 13 -------------
>  monitor/misc.c       | 11 -----------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5ee..b2347a6aea 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -500,19 +500,6 @@ SRST
>      Show the current VM UUID.
>  ERST
>  
> -    {
> -        .name       = "cpustats",
> -        .args_type  = "",
> -        .params     = "",
> -        .help       = "show CPU statistics",
> -        .cmd        = hmp_info_cpustats,
> -    },
> -
> -SRST
> -  ``info cpustats``
> -    Show CPU statistics.
> -ERST
> -
>  #if defined(CONFIG_SLIRP)
>      {
>          .name       = "usernet",
> diff --git a/monitor/misc.c b/monitor/misc.c
> index f3a393ea59..1539e18557 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
>      }
>  }
>  
> -static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
> -{
> -    CPUState *cs = mon_get_cpu(mon);
> -
> -    if (!cs) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -    cpu_dump_statistics(cs, 0);
> -}
> -
>  static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>  {
>      const char *name = qdict_get_try_str(qdict, "name");
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


