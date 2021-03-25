Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE963499EF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:04:04 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVH1-0000lm-1g
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPVER-000842-GE
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPVEP-0001oK-PQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616698880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKl8nJ5J9CZil6FwRBiCOL4YnFK5PgtrcK+Cy1WfVUM=;
 b=Rzk0Rjuluo0k7q69/+yiHzFi4bpjbltAoRtmLcKsbPtN2z65FdDs0b1ZR+U4myM1Fk19o0
 ZFEzYgE6VlIT8fVnXJbFkFJiSGoRcWVPOAp8bBDDwiZgQezS/haeQ8gVSLHqEc+CdVz+h+
 l4nRUIfjB6o7cuKrxikUUj01GiQ4cak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-yOVbxSPuMsqF7s82SwmdDw-1; Thu, 25 Mar 2021 15:01:16 -0400
X-MC-Unique: yOVbxSPuMsqF7s82SwmdDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796491005D46;
 Thu, 25 Mar 2021 19:01:15 +0000 (UTC)
Received: from work-vm (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1CD60939;
 Thu, 25 Mar 2021 19:00:59 +0000 (UTC)
Date: Thu, 25 Mar 2021 19:00:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 14/14] hmp: Print "reserve" property of memory
 backends with "info memdev"
Message-ID: <YFzd6ZE3+bD+C7jE@work-vm>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-15-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319101230.21531-15-david@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Let's print the new property.
> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/core/machine-hmp-cmds.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 58248cffa3..fb717f69b9 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -110,6 +110,8 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
>                         m->value->dump ? "true" : "false");
>          monitor_printf(mon, "  prealloc: %s\n",
>                         m->value->prealloc ? "true" : "false");
> +        monitor_printf(mon, "  reserve: %s\n",
> +                       m->value->reserve ? "true" : "false");
>          monitor_printf(mon, "  policy: %s\n",
>                         HostMemPolicy_str(m->value->policy));
>          visit_complete(v, &str);
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


