Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07F4F1118
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:39:59 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIFi-0005e3-Li
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:39:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbIDL-0003zm-IJ
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbIDH-0008W2-1c
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649061446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Xx2Wy6O0aYPQc7DLC8PHO3NTb6/z7sfgmtqvOWkqdQ8=;
 b=BHcrG50wSEZ9nhtMSwjB+m0Nigm8ADAd1qnv/8AYqgiqQ6z88WG/XlAt1BvF1a2Xiannro
 ammC9bIbS7ZtzqqcDE14uGDFjcheeg5fdWSMNxtX1Pfrncpu6hbms3pfm+HthrbuSqu9Iu
 ecvTN/IpFqvgjsnc03PchfNxtJQVOKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-jngQAXLDO72Qx4HxsQtbyw-1; Mon, 04 Apr 2022 04:37:23 -0400
X-MC-Unique: jngQAXLDO72Qx4HxsQtbyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378E8833961;
 Mon,  4 Apr 2022 08:37:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1F4B5361C3;
 Mon,  4 Apr 2022 08:37:15 +0000 (UTC)
Date: Mon, 4 Apr 2022 09:37:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
Message-ID: <YkquNlUvAHC+sLh7@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220403145953.10522-2-gshan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 03, 2022 at 10:59:50PM +0800, Gavin Shan wrote:
> This adds cluster-id in CPU instance properties, which will be used
> by arm/virt machine. Besides, the cluster-id is also verified or
> dumped in various spots:
> 
>   * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>     CPU with its NUMA node.
> 
>   * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>     CPU with NUMA node when no default association isn't provided.
> 
>   * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>     cluster-id.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/machine-hmp-cmds.c |  4 ++++
>  hw/core/machine.c          | 16 ++++++++++++++++
>  qapi/machine.json          |  6 ++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)

Missing changes to hw/core/machine-smp.c similar to 'dies' in that
file.

When 'dies' was added we added a 'dies_supported' flag, so we could
reject use of 'dies' when it was not supported - which is everywhere
except i386 target.

We need the same for 'clusters_supported' machine property since
AFAICT only the arm 'virt' machine is getting supported in this
series.

> 
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 4e2f319aeb..5cb5eecbfc 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>          if (c->has_die_id) {
>              monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>          }
> +        if (c->has_cluster_id) {
> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
> +                           c->cluster_id);
> +        }
>          if (c->has_core_id) {
>              monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>          }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..8748b64657 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>              return;
>          }
>  
> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
> +            error_setg(errp, "cluster-id is not supported");
> +            return;
> +        }
> +
>          if (props->has_socket_id && !slot->props.has_socket_id) {
>              error_setg(errp, "socket-id is not supported");
>              return;
> @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                  continue;
>          }
>  
> +        if (props->has_cluster_id &&
> +            props->cluster_id != slot->props.cluster_id) {
> +                continue;
> +        }
> +
>          if (props->has_die_id && props->die_id != slot->props.die_id) {
>                  continue;
>          }
> @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>          }
>          g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>      }
> +    if (cpu->props.has_cluster_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
> +    }
>      if (cpu->props.has_core_id) {
>          if (s->len) {
>              g_string_append_printf(s, ", ");
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 9c460ec450..ea22b574b0 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
>  # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to
> +# @core-id: core number within cluster/die the CPU belongs to
>  # @thread-id: thread number within core the CPU belongs to
>  #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>  #       but management should be prepared to pass through other
>  #       properties with device_add command to allow for future
>  #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>    'data': { '*node-id': 'int',
>              '*socket-id': 'int',
>              '*die-id': 'int',
> +            '*cluster-id': 'int',
>              '*core-id': 'int',
>              '*thread-id': 'int'
>    }
> -- 
> 2.23.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


