Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E43435D41
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:46:30 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTiX-0007qz-Ug
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTfk-0005RM-KC
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdTfg-0007hZ-TF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634805811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZ/cLSxXUy5ASLlwDP4Oa7v+l4TaS01RBtMb8ltbBtY=;
 b=hZKgVOQGNkei2onKncdXKMMb32WlOsjdNi97Tl/vvM1LOhv0cH7T1d8TbytieKjoXY7Ksy
 dkyUE8AM5cxgLLxtF0pO0DGOmtjmW6504Tuu708Wzxt1DizfhupInPFSCqVeq3p+5/rLYQ
 u06312U4WHZv2/wk7r4Gbiel2DcL7XY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-W_fAhQ_qMO61_HNQJB5B7w-1; Thu, 21 Oct 2021 04:43:27 -0400
X-MC-Unique: W_fAhQ_qMO61_HNQJB5B7w-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso5922332edj.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 01:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZ/cLSxXUy5ASLlwDP4Oa7v+l4TaS01RBtMb8ltbBtY=;
 b=FZ1QVnGXQCfiUffU+6IpwlpHsuYO+hqpZ4BH2+khXkUye04wQCs9umTwlJkiV5P7fJ
 nYpr1gficys3uGuCDJ/pjgx32ab102sv+HQs8z6O1GKAgZbFKiftiH6J5C05IjdjJlNY
 O51uXRjAF45D/zgaQHLx0nHSuykSBA3vabF2fmScE+353a3wdFLsWeoDjrC53zbHpH48
 6vSgJHaDVKzZR9UKqvFYxW/1YQ78O2tjSB3zBlmnqBZ8w3/S2YAFb2rtvHq/8ij49+da
 Y1WGMx8/wgRNrLh/fukZm3vEwgccLkZT6HITDFSUqDqXhRKGchk6hi5NiTtUyVManK2A
 Jd0A==
X-Gm-Message-State: AOAM531itqK+vX2CTqWuGiR6RYeP6OmQSyT7Y/iKUoTfI1os1zPNx5WD
 Batw7Ms9+WwBgCWjqtzhMQUVBD9A5leelrH7v5W2py6NYlCa3cRUWsWikEZwbU+gg9BZzaIKK+K
 +YSxavtQj236cS0Y=
X-Received: by 2002:a17:906:e287:: with SMTP id
 gg7mr5612932ejb.387.1634805806179; 
 Thu, 21 Oct 2021 01:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztmagWMxraXkzxV2TBhLtdvTpD/2hS4jW83ZYIhvvKGtbOTiiDOtGGRBWpY3XeOeSDAWirbQ==
X-Received: by 2002:a17:906:e287:: with SMTP id
 gg7mr5612897ejb.387.1634805805900; 
 Thu, 21 Oct 2021 01:43:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q9sm2186461ejf.70.2021.10.21.01.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:43:25 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:43:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211021104324.384470d6@redhat.com>
In-Reply-To: <20211020014112.7336-5-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-5-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 09:41:10 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/sifive_e.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6e95ea5896..9b206407a6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> @@ -71,22 +72,27 @@ static const MemMapEntry sifive_e_memmap[] = {
>  
>  static void sifive_e_machine_init(MachineState *machine)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap = sifive_e_memmap;
>  
>      SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
>  
> +    if (machine->ram_size != mc->default_ram_size) {
> +        char *sz = size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_E_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* Data Tightly Integrated Memory */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
> -        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
> +        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
>  
>      /* Mask ROM reset vector */
>      uint32_t reset_vec[4];
> @@ -142,6 +148,8 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_e_machine_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = SIFIVE_E_CPU;
> +    mc->default_ram_id = "riscv.sifive.e.ram";
> +    mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
>  
>      object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
>                                     sifive_e_machine_set_revb);


