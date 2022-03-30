Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DAA4EC63B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:12:27 +0200 (CEST)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZ3i-0003Ev-9Z
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:12:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZZ2V-0002Kl-H8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZZ2R-0002o1-7u
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648649465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGha0LN4yIpz+2QmjNP4jXhpkJkaIAoDwpKa+sKvHG4=;
 b=c5qfOUt8RIAvGRV7aC1WM60GpLm8Qfb6Pc2kFuiXIXdGu2/IUhbBNOwfbHuwnS8OZURMkV
 ng9D0936Y7DIbFC8NC49JOCOnMa75d5NQv0LxPe6lQhXkZhCDS1WlqLgbvuhGvSoHLZAWG
 xSvEGH6VPDpU5SFMKzp451OElPA1joA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-8vALOYeYNHy5qAcsf9d5Sw-1; Wed, 30 Mar 2022 10:11:04 -0400
X-MC-Unique: 8vALOYeYNHy5qAcsf9d5Sw-1
Received: by mail-ej1-f70.google.com with SMTP id
 nd34-20020a17090762a200b006e0ef16745cso4497139ejc.20
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 07:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGha0LN4yIpz+2QmjNP4jXhpkJkaIAoDwpKa+sKvHG4=;
 b=4BCvITboH8uYdWmeJQYsz0Z0j5SFYsf2oPo2s3Ur6DDOOwRTSwcJWdVXfvS47T1YWe
 LujwSfk7Uj9Df8XSyuv91UNa57JPmi+RuqlIbmGAmsTkIj+TfwY8n3elNhm3K9C2fgnt
 XdLUeKfKL1+s8D9fzNo12BArKYAM4mPZN7VsHiKBUISiCNyDJVw1Th9nfWU4hZjbPJjE
 fNSXqCEIFPqjPpGu0ZxQ0F5Eg8nyJUcRit2eZhgwMwwgn9BaXPqFhcfpu5nKIcTho+Tp
 0ATfqcZrKpP8kI9LptDVM5zKiggRK4j4t03+zFKfWAUwYs8a5tEi4K/DCgNa1rI+OwDe
 AyzA==
X-Gm-Message-State: AOAM531/aYJFvua1rLUp+lNQd128/LaWySmYRgXsGmNPqnXCc3x4OVx0
 B4NTQM6223LW1pcXSbTvh9UfrHig4+gqEoGnZSe6V5hM7aJPzgN7FD7y6Aj0t1Lza1uPsZjmu3r
 C2atjdrO21Kgo/Ig=
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr39157730ejs.40.1648649463226; 
 Wed, 30 Mar 2022 07:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9nZAlSFTK0t5e0U7ql0kfT4CvdAlmEUP23DfElOEs+ROGlZBjN8d3D+7tWY9s7B01pUfbmg==
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr39157675ejs.40.1648649462806; 
 Wed, 30 Mar 2022 07:11:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090674cd00b006df78d85eabsm8349859ejl.111.2022.03.30.07.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 07:11:02 -0700 (PDT)
Date: Wed, 30 Mar 2022 16:10:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 3/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220330161059.14e3a990@redhat.com>
In-Reply-To: <20220323072438.71815-4-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 15:24:37 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
> 
> This avoids to re-calculate the CPU topology by reusing the existing
> one in ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/aml-build.c | 96 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 72 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..10a2d63b96 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    GQueue *socket_list = g_queue_new();
> +    GQueue *cluster_list = g_queue_new();
> +    GQueue *core_list = g_queue_new();
>      GQueue *list = g_queue_new();
>      guint pptt_start = table_data->len;
>      guint parent_offset;
>      guint length, i;
> -    int uid = 0;
> -    int socket;
> +    int n, socket_id, cluster_id, core_id, thread_id;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
>  
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +    for (n = 0; n < cpus->len; n++) {
> +        socket_id = cpus->cpus[n].props.socket_id;
> +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
> +            continue;
> +        }

maybe instead of scanning cpus[n] every time for each topology level
and trying to keep code flattened (which mimics PPTT fattened tree
table for not much of the reason, spec doesn't require entries
from the same level to e described contiguously),
try to rebuild hierarchy tree from flat cpus[n] in 1 pass first
and then use nested loops or recursion to build PPTT table,
something like:

 sockets = cpus_to_topo(possible) 
 build_pptt_level(items = sockets, parent_ref = 0)
  for item in items
     level_ref = table_data->len - pptt_start
     build_processor_hierarchy_node(item {id, flags, ...}, parent_ref)
     if not leaf:
        build_pptt_level(item, level_ref)

which is much more compact and easier to read compared to
unrolled impl. it's now with all push/pop stack emulation.


> +
> +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
>          g_queue_push_tail(list,
>              GUINT_TO_POINTER(table_data->len - pptt_start));
>          build_processor_hierarchy_node(
> @@ -2023,65 +2032,104 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               * of a physical package
>               */
>              (1 << 0),
> -            0, socket, NULL, 0);
> +            0, socket_id, NULL, 0);
>      }
>  
>      if (mc->smp_props.clusters_supported) {
>          length = g_queue_get_length(list);
>          for (i = 0; i < length; i++) {
> -            int cluster;
> -
>              parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +
> +            for (n = 0; n < cpus->len; n++) {
> +                if (cpus->cpus[n].props.socket_id != socket_id) {
> +                    continue;
> +                }
> +
> +                cluster_id = cpus->cpus[n].props.cluster_id;
> +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
> +                    continue;
> +                }
> +
> +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
>                  g_queue_push_tail(list,
>                      GUINT_TO_POINTER(table_data->len - pptt_start));
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> +                    parent_offset, cluster_id, NULL, 0);
>              }
>          }
>      }
>  
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
> -        int core;
> -
>          parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> +        if (!mc->smp_props.clusters_supported) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +        } else {
> +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
> +        }
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (!mc->smp_props.clusters_supported &&
> +                cpus->cpus[n].props.socket_id != socket_id) {
> +                continue;
> +            }
> +
> +            if (mc->smp_props.clusters_supported &&
> +                cpus->cpus[n].props.cluster_id != cluster_id) {
> +                continue;
> +            }
> +
> +            core_id = cpus->cpus[n].props.core_id;
> +            if (ms->smp.threads <= 1) {
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (1 << 1) | /* ACPI Processor ID valid */
>                      (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    parent_offset, core_id, NULL, 0);
> +                continue;
> +            }
> +
> +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
> +                continue;
>              }
> +
> +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
> +            g_queue_push_tail(list,
> +                GUINT_TO_POINTER(table_data->len - pptt_start));
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (0 << 0), /* not a physical package */
> +                parent_offset, core_id, NULL, 0);
>          }
>      }
>  
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
> -        int thread;
> -
>          parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                continue;
> +            }
> +
> +            thread_id = cpus->cpus[n].props.thread_id;
>              build_processor_hierarchy_node(
>                  table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 2) | /* Processor is a Thread */
>                  (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                parent_offset, thread_id, NULL, 0);
>          }
>      }
>  
>      g_queue_free(list);
> +    g_queue_free(core_list);
> +    g_queue_free(cluster_list);
> +    g_queue_free(socket_list);
>      acpi_table_end(linker, &table);
>  }
>  


