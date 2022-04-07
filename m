Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C74F8030
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:10:11 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRtq-0005av-FR
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRrT-0004AR-F7
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:07:43 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRrO-0004bK-Ui
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:07:43 -0400
Received: by mail-lj1-x230.google.com with SMTP id o16so1495909ljp.3
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ukJrDFr42muXxiVDvVbFDLgNU+4XG2DnORxVVx1wG/8=;
 b=mJibISD4qMS7M/njjoeIhZ0CciAR8zQxgV2LOSR6hKMBIaU+y6cRAwY9fuVeOIamO9
 pcJGodOvfu/RZYPZyDZBV7DSRdJV+SS0zeYT7D2IZEzx15aEsoxz5muD8JvxhIJepxb+
 KZuOkZB9jScXbyDqnwzPxtFr/A4/NqrLh57obO4ljwOacQAez2O+5YKK1b2hkRRjgwo/
 CeqW+RXecLojef5xJxEzw/Q2KCFj/LANUnWO3YD9+fh1nWlUDfPAX6knwlAqpvOabdLL
 CB1UQrXmzEF56nQ43L9iEzOqjlTf4lvsoagjxnNj3q5vkj9jSRF5mtjNh8WsOS61nI0+
 P8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ukJrDFr42muXxiVDvVbFDLgNU+4XG2DnORxVVx1wG/8=;
 b=gMk5Q/d8FcSewAH//llIAC6SO8HxnaI8yBfuFz/iN/J3Ur9ELm75J7dVRfJd3LkIRs
 3lt3nwavXrzxOC33q1KiZiAO2BFkdRLEypJkXpEL3YJEsRjIm8I5jPms/EgitIHMjT3W
 fYEEAbd03U5hP67ex14wtEc6bDDXHHz7I2AsY4A739cGuC+pUd3i9OT7lh3ULgXXl87k
 RbsA0BhPEwDR/qw6UwPzecsRAoVFIaPsH/qufIhiL3qY6xPhu373+hUPlt6fh1ZwAeM5
 t3BFrVFGjpHalbaLw8iHMPWAavLYC3hv1XvBT3HjoXmu8EtJT+oQTQqVgQlrkr82haCF
 jTTQ==
X-Gm-Message-State: AOAM530a+MjqN7j1VmRAy8XgtL7UCYOirFbPEGRogVt7B6KC4j/t9bR/
 0j0qKNOeX0K5YXfILr0E9st1IUWROJwL4w==
X-Google-Smtp-Source: ABdhPJyT/0ilanvX/3ztc20SnbdQXWI77nI4XbVx+kprGgHmtHIK9kNDOjdICqMusJmX88izL5xyFg==
X-Received: by 2002:a2e:9d19:0:b0:24b:4bd:3f68 with SMTP id
 t25-20020a2e9d19000000b0024b04bd3f68mr8388531lji.418.1649336857238; 
 Thu, 07 Apr 2022 06:07:37 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 z17-20020ac24191000000b004483a4d9a3esm2163136lfh.152.2022.04.07.06.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:07:36 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:07:35 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 4/5] rename machine_class_allow_dynamic_sysbus_dev
Message-ID: <20220407130735.GE3143488@toto>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-5-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331115312.30018-5-damien.hedde@greensocs.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 01:53:11PM +0200, Damien Hedde wrote:
> All callsite are updated to the new function name
> "machine_class_allow_dynamic_device"
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
>  hw/arm/virt.c               | 10 +++++-----
>  hw/i386/microvm.c           |  2 +-
>  hw/i386/pc_piix.c           |  4 ++--
>  hw/i386/pc_q35.c            |  8 ++++----
>  hw/ppc/e500plat.c           |  2 +-
>  hw/ppc/spapr.c              |  2 +-
>  hw/riscv/virt.c             |  2 +-
>  hw/xen/xen-legacy-backend.c |  2 +-
>  8 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..1442b8840b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2829,12 +2829,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       * configuration of the particular instance.
>       */
>      mc->max_cpus = 512;
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> +    machine_class_allow_dynamic_device(mc, TYPE_VFIO_CALXEDA_XGMAC);
> +    machine_class_allow_dynamic_device(mc, TYPE_VFIO_AMD_XGBE);
> +    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_device(mc, TYPE_VFIO_PLATFORM);
>  #ifdef CONFIG_TPM
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_device(mc, TYPE_TPM_TIS_SYSBUS);
>  #endif
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 4b3b1dd262..4f8f423d31 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -756,7 +756,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>          MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
>          "Set off to disable adding virtio-mmio devices to the kernel cmdline");
>  
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
>  }
>  
>  static const TypeInfo microvm_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b72c03d0a6..27373cb16a 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -411,8 +411,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      m->desc = "Standard PC (i440FX + PIIX, 1996)";
>      m->default_machine_opts = "firmware=bios-256k.bin";
>      m->default_display = "std";
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> +    machine_class_allow_dynamic_device(m, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_device(m, TYPE_VMBUS_BRIDGE);
>  }
>  
>  static void pc_i440fx_7_0_machine_options(MachineClass *m)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 1780f79bc1..8221615fa4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -353,10 +353,10 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->default_display = "std";
>      m->default_kernel_irqchip_split = false;
>      m->no_floppy = 1;
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> -    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> +    machine_class_allow_dynamic_device(m, TYPE_AMD_IOMMU_DEVICE);
> +    machine_class_allow_dynamic_device(m, TYPE_INTEL_IOMMU_DEVICE);
> +    machine_class_allow_dynamic_device(m, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_device(m, TYPE_VMBUS_BRIDGE);
>      m->max_cpus = 288;
>  }
>  
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index fc911bbb7b..273cde9d06 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -102,7 +102,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 32;
>      mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
>      mc->default_ram_id = "mpc8544ds.ram";
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
> +    machine_class_allow_dynamic_device(mc, TYPE_ETSEC_COMMON);
>   }
>  
>  static const TypeInfo e500plat_info = {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a4372ba189..70e12d9037 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4586,7 +4586,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_id = "ppc_spapr.ram";
>      mc->default_display = "std";
>      mc->kvm_type = spapr_kvm_type;
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
> +    machine_class_allow_dynamic_device(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
>      mc->pci_allow_0_address = true;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = spapr_get_hotplug_handler;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..b6e2b0051b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1513,7 +1513,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->numa_mem_supported = true;
>      mc->default_ram_id = "riscv_virt_board.ram";
>  
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_device(mc, TYPE_RAMFB_DEVICE);
>  
>      object_class_property_add_bool(oc, "aclint", virt_get_aclint,
>                                     virt_set_aclint);
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 085fd31ef7..7c81c4846a 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -722,7 +722,7 @@ static void xen_set_dynamic_sysbus(void)
>      ObjectClass *oc = object_get_class(machine);
>      MachineClass *mc = MACHINE_CLASS(oc);
>  
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
> +    machine_class_allow_dynamic_device(mc, TYPE_XENSYSDEV);
>  }
>  
>  int xen_be_register(const char *type, struct XenDevOps *ops)
> -- 
> 2.35.1
> 
> 

