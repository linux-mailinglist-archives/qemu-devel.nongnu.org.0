Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8321D28A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:10:47 +0200 (CEST)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuU2-0005wO-Rp
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1juuRu-0003i2-Vn
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:08:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27310
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1juuRs-0003x8-TF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594631311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYd7gkyBlftQQfSNJ0DvfIiKGdSPpyUk/tUFNcbBo1A=;
 b=VGXRasXw95P2W/A9WOJt2b22jQBSYB4yCFrv8xRABQutfd1ZXUx/OH2ponFDyeUNpUK109
 mz785H1wimLPBkVHPaG6FNedfKuRakKkmwk5HIf6bf2OU2RoMDc8n8KidiRwnPQFVn3/Zi
 U3dATk2cr+FSjnWIWrnvDHfnfh6lnqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-yLCahpPxOfG4MA2--APg7Q-1; Mon, 13 Jul 2020 05:08:28 -0400
X-MC-Unique: yLCahpPxOfG4MA2--APg7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2121107ACCA;
 Mon, 13 Jul 2020 09:08:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BCD74F75;
 Mon, 13 Jul 2020 09:08:26 +0000 (UTC)
Date: Mon, 13 Jul 2020 11:08:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
 CpuInstanceProperties
Message-ID: <20200713110822.5495e1c6@redhat.com>
In-Reply-To: <159362466108.36204.3751851750959980962.stgit@naples-babu.amd.com>
References: <159362436285.36204.986406297373871949.stgit@naples-babu.amd.com>
 <159362466108.36204.3751851750959980962.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 01 Jul 2020 12:31:01 -0500
Babu Moger <babu.moger@amd.com> wrote:

> This is in preparation to build the apic_id from user
> provided topology information.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
>  include/hw/i386/topology.h |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index 07239f95f4..7cb21e9c82 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -40,6 +40,7 @@
>  
>  
>  #include "qemu/bitops.h"
> +#include "qapi/qapi-types-machine.h"
>  
>  /* APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
>   */
> @@ -196,6 +197,24 @@ static inline void x86_topo_ids_from_apicid_epyc(apic_id_t apicid,
>      topo_ids->pkg_id = apicid >> apicid_pkg_offset_epyc(topo_info);
>  }
>  
> +
> +/*
> + * Initialize topo_ids from CpuInstanceProperties
> + * node_id in CpuInstanceProperties(or in CPU device) is a sequential
> + * number, but while building the topology 

>we need to separate it for
> + * each socket(mod nodes_per_pkg).
could you clarify a bit more on why this is necessary?


> + */
> +static inline void x86_init_topo_ids(X86CPUTopoInfo *topo_info,
> +                                     CpuInstanceProperties props,
> +                                     X86CPUTopoIDs *topo_ids)
> +{
> +    topo_ids->smt_id = props.has_thread_id ? props.thread_id : 0;
> +    topo_ids->core_id = props.has_core_id ? props.core_id : 0;
> +    topo_ids->die_id = props.has_die_id ? props.die_id : 0;
> +    topo_ids->node_id = props.has_node_id ?
> +                        props.node_id % MAX(topo_info->nodes_per_pkg, 1) : 0;
> +    topo_ids->pkg_id = props.has_socket_id ? props.socket_id : 0;
> +}
>  /*
>   * Make APIC ID for the CPU 'cpu_index'
>   *
> 


