Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519D57831E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:05:55 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQRe-0001Cx-3m
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQPj-0007Pq-BM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQPb-0001iE-1A
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658149421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjoRPVE+9EpKrzsGZm1TqgMh928mvbYHC9cqh+8ucww=;
 b=UWS0do7CfykSrrt+VUnyH3eOyl4BDMnQ8t8V9ps4DFyi59HZf2OUhs+2JwF+1uWc4uhsvX
 E+GSNBanBfH3mYASgMWB5xrypks6dpRZNdoeqfujfS/XZOH5p1MSfwMXTREhlS4OgvqNev
 KoDhl33e51o2UBlQzGAKqvqsMc7+yQc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-cUqZdFZoNpSuBreSMl_4AQ-1; Mon, 18 Jul 2022 09:03:40 -0400
X-MC-Unique: cUqZdFZoNpSuBreSMl_4AQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so7909905edd.17
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZjoRPVE+9EpKrzsGZm1TqgMh928mvbYHC9cqh+8ucww=;
 b=1JfHiwSpCnGtDvTz8E8rA/0+EhfxWidTQr2BjWgru1cZdATFPosBcpAwWuSGgKeuRR
 eaLbcuRG6fxjYXLz/xu5FvPUAdciAyRK5UYPgF5oIZ1+fnWIWqu3xyKgkmMI6Yiky/Gj
 55xdVt9r8ecjfS0bI02NXvoOJhCZEK0GbCbLzcrMJNjZHSTj/TmULUAHSjmJduVy+j4Y
 kiRjVOBJc+TdZmj0TZHzX3Qow4ZEjoGOUEvFpGNjpMIEAj7zenPly1k/ZJ+9Aepq67RP
 6UbbS30m4xZgt+h1GebjsaHlbjDz44eeEsDiRNS3MoHZ+DO280wukKycAgbm3gboZL9v
 ZqoA==
X-Gm-Message-State: AJIora/aABo97VNx0xyPHJvmG0FtEGpkXYrBd0xBamWsVPZYb2NtV/68
 d0l9G2UAkyQnrEDgHsXtnf30ZEgMJG9yZbRxvpfTJCxzY1Vrw3dNkMy4o3fSb9ERLthcEcNbdti
 Mol1FJRHD/IwWatE=
X-Received: by 2002:a17:907:d9e:b0:72b:394b:ad34 with SMTP id
 go30-20020a1709070d9e00b0072b394bad34mr26139143ejc.109.1658149418996; 
 Mon, 18 Jul 2022 06:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vtxEyQ73DdNBVIY2X9p/55s3dUBAZt+DdpdpIN/D6dMHVdu0V6sD15DW+B8jko4DbJ2nJ0Jg==
X-Received: by 2002:a17:907:d9e:b0:72b:394b:ad34 with SMTP id
 go30-20020a1709070d9e00b0072b394bad34mr26139111ejc.109.1658149418732; 
 Mon, 18 Jul 2022 06:03:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906124b00b0072af7566927sm5591565eja.13.2022.07.18.06.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:03:38 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:03:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v8 08/11] i386/pc: factor out device_memory base/size to
 helper
Message-ID: <20220718150336.5a59af64@redhat.com>
In-Reply-To: <20220715171628.21437-9-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-9-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Fri, 15 Jul 2022 18:16:25 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Move obtaining hole64_start from device_memory memory region base/size
> into an helper alongside correspondent getters in pc_memory_init() when
> the hotplug range is unitialized. While doing that remove the memory
> region based logic from this newly added helper.
> 
> This is the final step that allows pc_pci_hole64_start() to be callable
> at the beginning of pc_memory_init() before any memory regions are
> initialized.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 47 ++++++++++++++++++++++++++++++++---------------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c654be6cf0bd..cda435e3baeb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,15 +825,37 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> -static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
> +static void pc_get_device_memory_range(PCMachineState *pcms,
> +                                       hwaddr *base,
> +                                       ram_addr_t *device_mem_size)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *machine = MACHINE(pcms);
> +    ram_addr_t size;
> +    hwaddr addr;
> +
> +    size = machine->maxram_size - machine->ram_size;
> +    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
> +
> +    if (pcmc->enforce_aligned_dimm) {
> +        /* size device region assuming 1G page max alignment per slot */
> +        size += (1 * GiB) * machine->ram_slots;
> +    }
> +
> +    *base = addr;
> +    *device_mem_size = size;
> +}
> +
> +

stray newline

> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      hwaddr cxl_base;
> +    ram_addr_t size;
>  
> -    if (pcmc->has_reserved_memory && machine->device_memory->base) {
> -        cxl_base = machine->device_memory->base
> -            + memory_region_size(&machine->device_memory->mr);
> +    if (pcmc->has_reserved_memory) {
> +        pc_get_device_memory_range(pcms, &cxl_base, &size);
> +        cxl_base += size;
>      } else {
>          cxl_base = pc_above_4g_end(pcms);
>      }
> @@ -920,7 +942,7 @@ void pc_memory_init(PCMachineState *pcms,
>      /* initialize device memory address space */
>      if (pcmc->has_reserved_memory &&
>          (machine->ram_size < machine->maxram_size)) {
> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
> +        ram_addr_t device_mem_size;
>  
>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>              error_report("unsupported amount of memory slots: %"PRIu64,
> @@ -935,13 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
>              exit(EXIT_FAILURE);
>          }
>  
> -        machine->device_memory->base =
> -            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
> -
> -        if (pcmc->enforce_aligned_dimm) {
> -            /* size device region assuming 1G page max alignment per slot */
> -            device_mem_size += (1 * GiB) * machine->ram_slots;
> -        }
> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
>  
>          if ((machine->device_memory->base + device_mem_size) <
>              device_mem_size) {
> @@ -1046,13 +1062,14 @@ uint64_t pc_pci_hole64_start(void)
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *ms = MACHINE(pcms);
>      uint64_t hole64_start = 0;
> +    ram_addr_t size = 0;
>  
>      if (pcms->cxl_devices_state.is_enabled) {
>          hole64_start = pc_get_cxl_range_end(pcms);
> -    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
> -        hole64_start = ms->device_memory->base;
> +    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>          if (!pcmc->broken_reserved_end) {
> -            hole64_start += memory_region_size(&ms->device_memory->mr);
> +            hole64_start += size;
>          }
>      } else {
>          hole64_start = pc_above_4g_end(pcms);


