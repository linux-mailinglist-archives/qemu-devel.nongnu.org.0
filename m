Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0B5180A8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:08:03 +0200 (CEST)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloVl-0002by-UM
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloJ8-0004hQ-F1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloJ6-0005os-KG
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ynf200O3Ih5MndiHA1iT4GFgB8QjKekL1cYyVcI3uZ0=;
 b=IfMcWcK8FDwsLSA9f46XerJog3J8QYikKS+GLUpxd2xJ+KzKCa3OcL2LvL2hh+ODQtOI7y
 LYuDifgIVQk3fFyAFnpXcD8qqt2jdYbJgg5pVENWc8ip0I0fI5NYBziO/Suc7ldaIhdBwh
 hYRxZfxC8/Zsku00tzd7F+fztice8H4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-pSj1fzH3MYatxmb9HWXAAg-1; Tue, 03 May 2022 04:54:54 -0400
X-MC-Unique: pSj1fzH3MYatxmb9HWXAAg-1
Received: by mail-wm1-f70.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so2375962wma.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 01:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ynf200O3Ih5MndiHA1iT4GFgB8QjKekL1cYyVcI3uZ0=;
 b=2IqtNvjLkWpll0ZHClf3NdaTHJH2WAu5FfkLAZkWl0KAaw+kXVIOBE2VMAo9GxilCe
 dFf7QQVNqaiE8VLX1SfPjHp16nGVLIdxj5BOz28aiGPM0eCPNEHvnGmAQFg0QPO2HFhP
 rdfc9GxKU0/92q8eOQwZedrlPHegVplgcdmWK7N9toP/YcNq+HHd9lmUUS8QFROeAGF1
 H2TfNPhMc2aPtSDFl79G8iovtVnBapIVcK2oqFUqUbo8RfUYg2tJg7Ll0Ty8U9u0SAH9
 fXA/pwOE1Be5foSILc6df0P+FA1xbiY+VU1tU4yujLLVm4u0FCgq4ZMfLxtinNYVtrWr
 2N8g==
X-Gm-Message-State: AOAM532bAbKBFRlA65QiCztl5ZBZqt3kYUe8qeyw6KvaYKspOz84Xf9j
 BWZFwGG++awRBVQmpxkAw0lL2UsT2qNYCNygxpCs6qz8BOPW9U881fZZOoQk7H6ahkiczUZlrIq
 kKcj64fOYdBFo9sA=
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr2377637wmb.199.1651568093637; 
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzymVgt3xLEv/+E4xcMNcF8Y7lAOQQ7PYMx2UTwKZNf3Ua4l15CWsGmcRtezc7vd+3BYwUBFQ==
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr2377615wmb.199.1651568093407; 
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003942a244ed7sm1202325wmb.28.2022.05.03.01.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
Date: Tue, 3 May 2022 10:54:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 armbru@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
Subject: Re: [PATCH v8 1/5] qapi/machine.json: Add cluster-id
Message-ID: <20220503105451.40a00f2e@redhat.com>
In-Reply-To: <20220425032802.365061-2-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Apr 2022 11:27:58 +0800
Gavin Shan <gshan@redhat.com> wrote:

> This adds cluster-id in CPU instance properties, which will be used
> by arm/virt machine. Besides, the cluster-id is also verified or
> dumped in various spots:
> 
>   * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>     CPU with its NUMA node.
> 
>   * hw/core/machine.c::machine_numa_finish_cpu_init() to record
>     CPU slots with no NUMA mapping set.
> 
>   * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>     cluster-id.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine-hmp-cmds.c |  4 ++++
>  hw/core/machine.c          | 16 ++++++++++++++++
>  qapi/machine.json          |  6 ++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
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
> index cb9bbc844d..700c1e76b8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -682,6 +682,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
> @@ -701,6 +706,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
> @@ -995,6 +1005,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
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
> index d25a481ce4..4c417e32a5 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
>  # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
> +# @core-id: core number within cluster the CPU belongs to
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


