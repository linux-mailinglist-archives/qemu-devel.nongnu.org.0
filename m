Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16115782D2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:55:03 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQH8-0000bZ-S7
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQEt-0005l1-3e
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQEp-0008EV-Ri
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658148757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeojfgY3eUvuLrY6DM0NakAHmHR0cLJWssoBqjzJn+s=;
 b=gQvjowLAM4836O75TPGJCTgVuRMZr0iuw2nD9LbBpg8PJ7iM0A76oWMLotW5TsiYGbym1D
 Xr7cZ35ajwIZ3J3Rx0f6Q9+iIJR8RMrPN1KNrWZ059dRU7cEPSfQCZqy361gfVHRPQevQB
 OOCBG+Qafr46F3Xn7s+MbfrIEQmj0bo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-ZKolTGb3M3mlBVJKbeg8jg-1; Mon, 18 Jul 2022 08:52:36 -0400
X-MC-Unique: ZKolTGb3M3mlBVJKbeg8jg-1
Received: by mail-ej1-f72.google.com with SMTP id
 ne36-20020a1709077ba400b0072b64ce28aaso2242465ejc.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeojfgY3eUvuLrY6DM0NakAHmHR0cLJWssoBqjzJn+s=;
 b=GmzyAI18fC3tQxKNJ4ROVtP2VC7P5mioLBtN+GML+SOTKsBsDu/lM6nkCn6qDSIR+9
 n6hSi+M8aWbggE/lXjtAnDkuOherluuPrYpW/SYtJ1G7rDquabDBCtBzJOVfeyf4F8JH
 hUnQdhUS+iOUtzdk2SxJfoRCzR9L/9K8lxhf0dY56k6DAl/rmKC+M2hBsy2laRkpHSsf
 N4YEJau9JSmix1k8LRGmn5nWj1mZ/MNw8LutjAc0sxa8Hvi9Rz12n0vdM4fF25WiQ6C6
 GrNofNchJQ5XKCHIhE98WTJB7DA/ZgfWrcmXCxzPaA9zBaU4a1Wt0HWjdzWUtEDOsj3U
 SxXA==
X-Gm-Message-State: AJIora/KDXiLVVjdiKjpMcAbXIl5FVb+KLpZMRlFf+Bum3z8sbZ44Qw5
 maYrn65rq7kwEI8Z+kn0qondeWKO+7Bj9ert1hHkr3NQrGFf7hFglKKaklI7dwWwJgin+lftwSh
 hBYepF1wfz3/OByg=
X-Received: by 2002:a17:907:a05b:b0:72b:33f9:f927 with SMTP id
 gz27-20020a170907a05b00b0072b33f9f927mr25703424ejc.707.1658148755355; 
 Mon, 18 Jul 2022 05:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tR5ywEvODV9Nr+YOlFYls8YySaxNyY64iPbGiTs05BylPxn7rWFNAQomNUxP7QuxFMmi8smg==
X-Received: by 2002:a17:907:a05b:b0:72b:33f9:f927 with SMTP id
 gz27-20020a170907a05b00b0072b33f9f927mr25703402ejc.707.1658148755123; 
 Mon, 18 Jul 2022 05:52:35 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709061e5700b00722e771007fsm5388383ejj.37.2022.07.18.05.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 05:52:34 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:52:33 +0200
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
Subject: Re: [PATCH v8 06/11] i386/pc: factor out cxl range start to helper
Message-ID: <20220718145233.0b2bdeb8@redhat.com>
In-Reply-To: <20220715171628.21437-7-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-7-joao.m.martins@oracle.com>
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

On Fri, 15 Jul 2022 18:16:23 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Factor out the calculation of the base address of the memory region.
> It will be used later on for the cxl range end counterpart calculation
> and as well in pc_memory_init() CXL memory region initialization, thus
> avoiding duplication.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

PS:
see note below in case series respin

> ---
>  hw/i386/pc.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 1f42f194d7b7..3fdcab4bb4f3 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,6 +825,22 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    hwaddr cxl_base;
> +
> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
> +        cxl_base = machine->device_memory->base
> +            + memory_region_size(&machine->device_memory->mr);
> +    } else {
> +        cxl_base = pc_above_4g_end(pcms);
> +    }
> +
> +    return cxl_base;
> +}
> +
>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>  {
>      uint64_t start = 0;
> @@ -946,15 +962,7 @@ void pc_memory_init(PCMachineState *pcms,
>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
>          hwaddr cxl_size = MiB;
>  
> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
> -            cxl_base = machine->device_memory->base
> -                + memory_region_size(&machine->device_memory->mr);

> -        } else if (pcms->sgx_epc.size != 0) {
> -            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
> -        } else {
shouldn't be this hunk be a part of 4/11?
(otherwise it looks like it's been dropped by mistake)
end result is fine as pc_above_4g_end() already has this hunk (hence Ack)

> -            cxl_base = pc_above_4g_end(pcms);
> -        }
> -
> +        cxl_base = pc_get_cxl_range_start(pcms);
>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>          memory_region_add_subregion(system_memory, cxl_base, mr);


