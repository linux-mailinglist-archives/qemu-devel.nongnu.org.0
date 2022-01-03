Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C648307E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:28:43 +0100 (CET)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4LW6-00084G-89
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LRo-0003tE-7l
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:24:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LRl-0001gg-D7
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y8543RBcbTiihZAEfg+TpAZCXc3IeQ2oAodPtdz2D7Y=;
 b=AsSdG2Mdv2X8WFbcA2V7ODJzsc66+/hsXdYNwvjQxIbKkhMTPudsZKqfTlsPXPhiHe5LgQ
 absuyBYcOSLtik/NvJ/Jsq48Ci4HyGII6bqnSBAOLLVWZIdxNEjn70caVq1fqAnh8dwD+X
 E0ZQKVvUk/2ze9C0Db6uRgvR8yuokmQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-DianKqamOum-REPEHfZ7Zg-1; Mon, 03 Jan 2022 06:24:11 -0500
X-MC-Unique: DianKqamOum-REPEHfZ7Zg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so22649715edc.6
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y8543RBcbTiihZAEfg+TpAZCXc3IeQ2oAodPtdz2D7Y=;
 b=isOJ8iorCc7mZyBjxfNL5gJrFLWuH4eixwgBHvDTLue3bW82EhFZlCzPddVI37/Oqy
 eS9dqyB+XoSbFF+PoieCJfhldaBPg3ogHV+RKrxXsraMU/I70/cxkL/lxKd/pfoLSTEf
 1qvUej7HGwm/sB84OqzFG5kR99W6FP6aeJiZJJY6O0uhB+La27N0Xoqh/rdG4Yb2JN2R
 DWluUvWkg39Fbr2l/1JfALIhMitTfuLrh+ZUS1STZRQ4HwcYqVzDuB6Gxm3tdfUW2i3Z
 FLANKD4hu0yK4bflsQExk7aMMQtVH4vdyCQBdif65OWKxQPz/iPlyQRjOt2UO0bd4xqp
 PCaA==
X-Gm-Message-State: AOAM533h6cc2JjkZORJP0oQ6xdc74CFhdu6TM30jlH4AIJJfEmzuSZMJ
 o2Wwv1ULlqU13RUd5zx2EMasXZ5KWSaB1dr9FQlI50plLcyMZMkf14xz1ryRzkqRGRviKx8NS+z
 cTTGNUcGVgOXN+Eg=
X-Received: by 2002:a17:907:7f29:: with SMTP id
 qf41mr35422743ejc.715.1641209050429; 
 Mon, 03 Jan 2022 03:24:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvL+PnA2Y+kEQc1JNmob1Gix7ddMZoAxw3Xd9PwgkggulaH+eW8VWN7uC0007ns06r9DZcEg==
X-Received: by 2002:a17:907:7f29:: with SMTP id
 qf41mr35422716ejc.715.1641209050123; 
 Mon, 03 Jan 2022 03:24:10 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id gs17sm10467012ejc.116.2022.01.03.03.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:24:09 -0800 (PST)
Date: Mon, 3 Jan 2022 12:24:07 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 3/7] hw/acpi/aml-build: Improve scalability of PPTT
 generation
Message-ID: <20220103112407.p7aep3yqnlhevylc@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 04:46:32PM +0800, Yanan Wang wrote:
> Currently we generate a PPTT table of n-level processor hierarchy
> with n-level loops in build_pptt(). It works fine as now there are
> only three CPU topology parameters. But the code may become less
> scalable with the processor hierarchy levels increasing.
> 
> This patch only improves the scalability of build_pptt by reducing
> the loops, and intends to make no functional change.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b3b3310df3..be3851be36 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>  void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
> -    int pptt_start = table_data->len;
> +    GQueue *list = g_queue_new();
> +    guint pptt_start = table_data->len;
> +    guint father_offset;

"parent_offset" would be more conventional.

> +    guint length, i;
>      int uid = 0;
>      int socket;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
> @@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      acpi_table_begin(&table, table_data);
>  
>      for (socket = 0; socket < ms->smp.sockets; socket++) {
> -        uint32_t socket_offset = table_data->len - pptt_start;
> -        int core;
> -
> +        g_queue_push_tail(list,
> +            GUINT_TO_POINTER(table_data->len - pptt_start));
>          build_processor_hierarchy_node(
>              table_data,
>              /*
> @@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               */
>              (1 << 0),
>              0, socket, NULL, 0);
> +    }
>  
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            uint32_t core_offset = table_data->len - pptt_start;
> -            int thread;
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int core;
>  
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (core = 0; core < ms->smp.cores; core++) {
>              if (ms->smp.threads > 1) {
> +                g_queue_push_tail(list,
> +                    GUINT_TO_POINTER(table_data->len - pptt_start));
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (0 << 0), /* not a physical package */
> -                    socket_offset, core, NULL, 0);
> -
> -                for (thread = 0; thread < ms->smp.threads; thread++) {
> -                    build_processor_hierarchy_node(
> -                        table_data,
> -                        (1 << 1) | /* ACPI Processor ID valid */
> -                        (1 << 2) | /* Processor is a Thread */
> -                        (1 << 3),  /* Node is a Leaf */
> -                        core_offset, uid++, NULL, 0);
> -                }
> +                    father_offset, core, NULL, 0);
>              } else {
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (1 << 1) | /* ACPI Processor ID valid */
>                      (1 << 3),  /* Node is a Leaf */
> -                    socket_offset, uid++, NULL, 0);
> +                    father_offset, uid++, NULL, 0);
>              }
>          }
>      }
>  
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int thread;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (thread = 0; thread < ms->smp.threads; thread++) {
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 2) | /* Processor is a Thread */
> +                (1 << 3),  /* Node is a Leaf */
> +                father_offset, uid++, NULL, 0);
> +        }
> +    }
> +
> +    g_queue_free(list);
>      acpi_table_end(linker, &table);
>  }

This patch actually increases the number of loops, since we need to visit
higher hierarchical nodes twice (once to enqueue and once to dequeue). We
do reduce code indentation and it looks like we could more easily skip
hierarchy levels we don't want, though. While my impulse is to say we
should just keep this simple and add another nested loop for clusters, I
guess I'm OK with this too.

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


