Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E556A24B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:50:03 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QxG-0005rv-P7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9Qpe-000747-JK
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9Qpb-0002s7-RR
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657197726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hzOmKGAT9iJmUSb5iQjz/hLcjUcf6NlAOJcQfngPSI=;
 b=iDGD4J3AHzkag2RcV5AvEVNWIv5jhz+xZsTSZNc8KXdIhh9cjqTMwGWof47Aq6J5KxPl7R
 L+1usWoriO3KzvVYdlcTMIh19MLu1TQHb9TrP4g59ENKMTqK5CMPZe2/K8I3JUlhcG8bc1
 WvhdQAOk1t/Gbu/FxWiEKLdvbgxsPXU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-Z-brWi1nOfq7ubIEqQDfoQ-1; Thu, 07 Jul 2022 08:42:05 -0400
X-MC-Unique: Z-brWi1nOfq7ubIEqQDfoQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq41-20020a1709073f2900b00722e5ad076cso4782083ejc.20
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hzOmKGAT9iJmUSb5iQjz/hLcjUcf6NlAOJcQfngPSI=;
 b=FM7SVLhBtcTh8Js7nVm4CbPFV47TIsSvx2fCfe0BelAdm+alGVpVXBEgOwvFBvu572
 rsKnJMtoVYII8uKyayZtwnKqMeGKxhJgjzmbk55Q5v8dmLlD/tR/y2kTK/bg/iqaajH6
 vWU7blJ2mxpHXV8+3aSo/26f7LMdEiSbRGwF3kuPt80TZ9gYYekI9RRVgVrqqAfOkug7
 a86YjoPwM8C23Lk6PDUo1faTfwfOELdxc/lXuWduWwoGoYl15ncbxz9a0/YAMU+0L2Wm
 JL6qw2nSkGF94Ji/mxrgqXtSbpOvfrz0KkV29yetiGLKQ/B9BtNVYiQ3eCTMXtmzfVRf
 xc9A==
X-Gm-Message-State: AJIora/smXrjwr/AM0lrtZy1Vkn0kvvUZkKA8HjYAqFRYJDjBCRYFmHO
 sZrKnZzLvWos1xYrxwRAUISavy5rkepBGEfNknsvqZp4o8rIuY9dMo0WSYs7exAivIZLkJGMX12
 zB4ymGAqu6vzAFNM=
X-Received: by 2002:a05:6402:5214:b0:437:5b1d:9966 with SMTP id
 s20-20020a056402521400b004375b1d9966mr62145889edd.16.1657197724528; 
 Thu, 07 Jul 2022 05:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sx6KtC+I1WmcWVmRpLFvh+xs+cgT/OdnYs8A+Pe7UVEzISr9iwBuDHaUHpmrWnSK1TmK18pg==
X-Received: by 2002:a05:6402:5214:b0:437:5b1d:9966 with SMTP id
 s20-20020a056402521400b004375b1d9966mr62145859edd.16.1657197724287; 
 Thu, 07 Jul 2022 05:42:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170906314c00b0072aa009aa68sm8153979eje.36.2022.07.07.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:42:03 -0700 (PDT)
Date: Thu, 7 Jul 2022 14:42:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 04/10] i386/pc: factor out above-4g end to an helper
Message-ID: <20220707144202.6a7c3f9c@redhat.com>
In-Reply-To: <20220701161014.3850-5-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-5-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri,  1 Jul 2022 17:10:08 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> There's a couple of places that seem to duplicate this calculation
> of RAM size above the 4G boundary. Move all those to a helper function.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 1bb89a9c17ec..6c7c49ca5a32 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -814,6 +814,17 @@ void xen_load_linux(PCMachineState *pcms)
>  #define PC_ROM_ALIGN       0x800
>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>  
> +static hwaddr pc_above_4g_end(PCMachineState *pcms)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +
> +    if (pcms->sgx_epc.size != 0) {
> +        return sgx_epc_above_4g_end(&pcms->sgx_epc);
> +    }
> +
> +    return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -891,15 +902,8 @@ void pc_memory_init(PCMachineState *pcms,
>              exit(EXIT_FAILURE);
>          }
>  
> -        if (pcms->sgx_epc.size != 0) {
> -            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
> -        } else {
> -            machine->device_memory->base =
> -                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> -        }
> -
>          machine->device_memory->base =
> -            ROUND_UP(machine->device_memory->base, 1 * GiB);
> +            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
>  
>          if (pcmc->enforce_aligned_dimm) {
>              /* size device region assuming 1G page max alignment per slot */
> @@ -928,10 +932,8 @@ void pc_memory_init(PCMachineState *pcms,
>              if (!pcmc->broken_reserved_end) {
>                  cxl_base += memory_region_size(&machine->device_memory->mr);
>              }
> -        } else if (pcms->sgx_epc.size != 0) {
> -            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>          } else {
> -            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> +            cxl_base = pc_above_4g_end(pcms);
>          }
>  
>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
> @@ -1018,7 +1020,6 @@ uint64_t pc_pci_hole64_start(void)
>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *ms = MACHINE(pcms);
> -    X86MachineState *x86ms = X86_MACHINE(pcms);
>      uint64_t hole64_start = 0;
>  
>      if (pcms->cxl_devices_state.host_mr.addr) {
> @@ -1036,10 +1037,8 @@ uint64_t pc_pci_hole64_start(void)
>          if (!pcmc->broken_reserved_end) {
>              hole64_start += memory_region_size(&ms->device_memory->mr);
>          }
> -    } else if (pcms->sgx_epc.size != 0) {
> -            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
>      } else {
> -        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> +        hole64_start = pc_above_4g_end(pcms);
>      }
>  
>      return ROUND_UP(hole64_start, 1 * GiB);


