Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AB2D446
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 05:32:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVpK3-00082m-7y
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 23:32:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpIQ-0007Go-AV
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpIO-0006B1-OF
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:34 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVpIL-0005ik-Uw
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:30 -0400
Received: by mail-qk1-f195.google.com with SMTP id c70so524061qkg.7
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 20:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KZJ17QHEHD9j7pz8pF2IW2nzXk6cjxLnIqD5cdlyR/I=;
	b=cJgA4RXKeNAkRfPfFdk46Q3UrhZb//NXDw08JCYZ2J5TpZROnF6Gc/d+S+RsScBjkW
	PvZIDm84sRfmF/o9rtXik8dVDeEiMbN2xRn+XfPyXxiws6Qt3b0S1+yLFppJvFPPG6uM
	kO9HkZRZTXMMObPoNpVkBC1kPf/aBZOAERSZYicYWGthEdIggt4CTfQxsbSIODPcMH32
	5+P3MyX2CD3qzjrssJlSW+AgNFMBGtR5GSmgv9wGcBJf5n/91HtsVQEbojVNvaqaLRTM
	uU8kSYXDVXiNnZPnQxuJuxSf+P6WmcVMzRmQ2VGNzm1h+7GlCMKJZCt9qv7cuZGpkyf5
	lUbQ==
X-Gm-Message-State: APjAAAUYOMOh2kwJTxwrRgOko9/KrGs2sQrK5R2EgBEboZJbpoDeY1Ep
	ozAejBelsY/QBwckYE8b9Lg2Lw==
X-Google-Smtp-Source: APXvYqxvYgv+SxglD+mkY7+S0APn7qxKiGsbWotcAlgAR6VTBewrTg7BNw18eAqCQr8tBHUOJOm0QQ==
X-Received: by 2002:a05:620a:16cf:: with SMTP id
	a15mr79789507qkn.332.1559100623513; 
	Tue, 28 May 2019 20:30:23 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	z26sm2054041qti.74.2019.05.28.20.30.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 20:30:22 -0700 (PDT)
Date: Tue, 28 May 2019 23:30:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20190528232626-mutt-send-email-mst@kernel.org>
References: <155786484688.13873.6037015630912983760.stgit@gimli.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155786484688.13873.6037015630912983760.stgit@gimli.home>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.195
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2] q35: Revert to kernel irqchip
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
	peterx@redhat.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 14, 2019 at 02:14:41PM -0600, Alex Williamson wrote:
> Commit b2fc91db8447 ("q35: set split kernel irqchip as default") changed
> the default for the pc-q35-4.0 machine type to use split irqchip, which
> turned out to have disasterous effects on vfio-pci INTx support.  KVM
> resampling irqfds are registered for handling these interrupts, but
> these are non-functional in split irqchip mode.  We can't simply test
> for split irqchip in QEMU as userspace handling of this interrupt is a
> significant performance regression versus KVM handling (GeForce GPUs
> assigned to Windows VMs are non-functional without forcing MSI mode or
> re-enabling kernel irqchip).
> 
> The resolution is to revert the change in default irqchip mode in the
> pc-q35-4.1 machine and create a pc-q35-4.0.1 machine for the 4.0-stable
> branch.  The qemu-q35-4.0 machine type should not be used in vfio-pci
> configurations for devices requiring legacy INTx support without
> explicitly modifying the VM configuration to use kernel irqchip.
> 
> Link: https://bugs.launchpad.net/qemu/+bug/1826422
> Fixes: b2fc91db8447 ("q35: set split kernel irqchip as default")
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

OK I guess but it's really a kvm patch.
So I'd like Paolo to review and merge if appropriate.

Can't say this makes me too happy. split irqchip
has a bunch of advantages.

> ---
>  hw/core/machine.c    |    3 +++
>  hw/i386/pc.c         |    3 +++
>  hw/i386/pc_q35.c     |   16 ++++++++++++++--
>  include/hw/boards.h  |    3 +++
>  include/hw/i386/pc.h |    3 +++
>  5 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5d046a43e3d2..e41e6698ac9f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -24,6 +24,9 @@
>  #include "hw/pci/pci.h"
>  #include "hw/mem/nvdimm.h"
>  
> +GlobalProperty hw_compat_4_0_1[] = {};
> +const size_t hw_compat_4_0_1_len = G_N_ELEMENTS(hw_compat_4_0_1);
> +
>  GlobalProperty hw_compat_4_0[] = {};
>  const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d98b737b8f3b..b5311e7e2bd5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -115,6 +115,9 @@ struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
>  static size_t pvh_start_addr;
>  
> +GlobalProperty pc_compat_4_0_1[] = {};
> +const size_t pc_compat_4_0_1_len = G_N_ELEMENTS(pc_compat_4_0_1);
> +
>  GlobalProperty pc_compat_4_0[] = {};
>  const size_t pc_compat_4_0_len = G_N_ELEMENTS(pc_compat_4_0);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 37dd350511a9..dcddc6466200 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->units_per_default_bus = 1;
>      m->default_machine_opts = "firmware=bios-256k.bin";
>      m->default_display = "std";
> -    m->default_kernel_irqchip_split = true;
> +    m->default_kernel_irqchip_split = false;
>      m->no_floppy = 1;
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> @@ -374,10 +374,22 @@ static void pc_q35_4_1_machine_options(MachineClass *m)
>  DEFINE_Q35_MACHINE(v4_1, "pc-q35-4.1", NULL,
>                     pc_q35_4_1_machine_options);
>  
> -static void pc_q35_4_0_machine_options(MachineClass *m)
> +static void pc_q35_4_0_1_machine_options(MachineClass *m)
>  {
>      pc_q35_4_1_machine_options(m);
>      m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_4_0_1, hw_compat_4_0_1_len);
> +    compat_props_add(m->compat_props, pc_compat_4_0_1, pc_compat_4_0_1_len);
> +}
> +
> +DEFINE_Q35_MACHINE(v4_0_1, "pc-q35-4.0.1", NULL,
> +                   pc_q35_4_0_1_machine_options);
> +
> +static void pc_q35_4_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_4_0_1_machine_options(m);
> +    m->default_kernel_irqchip_split = true;
> +    m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
>      compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
>  }
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6f7916f88f02..6ff02bf3e472 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -292,6 +292,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_4_0_1[];
> +extern const size_t hw_compat_4_0_1_len;
> +
>  extern GlobalProperty hw_compat_4_0[];
>  extern const size_t hw_compat_4_0_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 43df7230a22b..5d5636241e34 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -293,6 +293,9 @@ int e820_add_entry(uint64_t, uint64_t, uint32_t);
>  int e820_get_num_entries(void);
>  bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
>  
> +extern GlobalProperty pc_compat_4_0_1[];
> +extern const size_t pc_compat_4_0_1_len;
> +
>  extern GlobalProperty pc_compat_4_0[];
>  extern const size_t pc_compat_4_0_len;
>  

