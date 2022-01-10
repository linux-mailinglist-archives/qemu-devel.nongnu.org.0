Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335C489E27
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:16:06 +0100 (CET)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6yH7-0003X9-5C
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:16:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6yFF-0001k8-W9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6yFE-0000QL-ER
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641834847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OwkNEmN55JU96/ASO65aR43EkpF+6fG5Yz1cY2wG7A=;
 b=gU40bLJ52rUovQUFNLHpDtbqYtPGqJGMAUR4AveKt3mr9vrkVqj75YoobLVxvAEcxar7k6
 Pfa64xDzMhjuzd4HWs5AWwuHZe/Q1kFR0WwMMcs4LJN/cxaVuBZH0Sd5kXqgPr08rTgQdT
 D3n9S/3eBhkFhAe5LxTU17oPTxG0Bbg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-CTpsU4xUPXCb11_cgwyFiw-1; Mon, 10 Jan 2022 12:14:06 -0500
X-MC-Unique: CTpsU4xUPXCb11_cgwyFiw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s17-20020a7bc0d1000000b00348737ba2a2so260909wmh.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=/OwkNEmN55JU96/ASO65aR43EkpF+6fG5Yz1cY2wG7A=;
 b=rDNrJxiuzHPtPxOybUh1lH7ajamXzVyWU/NDMseWHFFo7mnWIRpksDN2j1lowsOugc
 oKaBOhn6S9MG96uKqF6jhCO0qvZeGZY8t6gRUhd447IBO3UQgnZSHz2yCYDESSr/pKrP
 +IJIDIaOBNfgTde2kLsp5ti/arQyfJdpom3orW0sxIsD/wh2gUVBlfq0X1P6NDROH6LE
 lM5VVxtUzhIul31Hy6EJN2Vy8yNktZ6fuIYWIn3LG1RqY0BCBa4lSFWGmB6e7R0qzLF9
 4Q3/ajJxCWTOy0tC8xDU1cHaBnkYV/ytOWaRp7bV2LwBV0UogckfqpMKKd75yJg0gJ/f
 YvXg==
X-Gm-Message-State: AOAM530rWWpwA+EQPDD87AxxOw4DjoyVU7cWt9A+/+y8epT4RvUat80K
 NIjPeEJuE6hZdVfQ/HIHQL/En7UKcy+FS5fih0K95F2MsYCaTP0Q0LEYeKDY8Sms1+bo8R4u4bn
 WV5YyKBeP6EpTcr0=
X-Received: by 2002:a1c:1b8f:: with SMTP id
 b137mr13975740wmb.115.1641834845365; 
 Mon, 10 Jan 2022 09:14:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX/AVDnmSq9VH+zfYVCj+he8c52vstnXhZ8DJLq9SVI9o4IHfyMCkkhoDPHbGcjU2e6D7Ycg==
X-Received: by 2002:a1c:1b8f:: with SMTP id
 b137mr13975716wmb.115.1641834845157; 
 Mon, 10 Jan 2022 09:14:05 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id w7sm1646476wrv.96.2022.01.10.09.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 09:14:04 -0800 (PST)
Subject: Re: [PATCH v4 6/6] hw/arm/virt: Drop superfluous checks against
 highmem
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-7-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ddb29c44-bcbb-b3fd-c226-889b352b1dc8@redhat.com>
Date: Mon, 10 Jan 2022 18:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220107163324.2491209-7-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/7/22 5:33 PM, Marc Zyngier wrote:
> Now that the devices present in the extended memory map are checked
> against the available PA space and disabled when they don't fit,
> there is no need to keep the same checks against highmem, as
> highmem really is a shortcut for the PA space being 32bit.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt-acpi-build.c | 2 --
>  hw/arm/virt.c            | 5 +----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 505c61e88e..cdac009419 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -946,8 +946,6 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> -    vms->highmem_redists &= vms->highmem;
> -
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 70b4773b3e..641c6a9c31 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2170,9 +2170,6 @@ static void machvirt_init(MachineState *machine)
>  
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>  
> -    vms->highmem_mmio &= vms->highmem;
> -    vms->highmem_redists &= vms->highmem;
> -
>      create_gic(vms, sysmem);
>  
>      virt_cpu_post_init(vms, sysmem);
> @@ -2191,7 +2188,7 @@ static void machvirt_init(MachineState *machine)
>                         machine->ram_size, "mach-virt.tag");
>      }
>  
> -    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
> +    vms->highmem_ecam &= (!firmware_loaded || aarch64);
>  
>      create_rtc(vms);
>  


