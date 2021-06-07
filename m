Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39639DC63
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:29:49 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqEO3-0006AI-UM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEN9-0005LQ-TQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEN6-0006XR-2n
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623068926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkOEdg+MIhVOOVclrOvd/xYJyZah5SZEWaxdZk0paOI=;
 b=b3msEzP9Yh2uXAaDk3DBKnOEsVNOEFETd1JHnO9zWzKmIWQmVEpgsF4LsB0y43wRAAOuoY
 YlkJCWDy/JXSN4s3q8yhVFn5hOphFtcoYIl3VO17Jbi0MD3sET8evDyQ7j+KB8X62ZaKNq
 J4Q2ywFeK9vYxwTgINay0Ye4jsNwobE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-YsOBD23nNa6qLAH5lMRtYw-1; Mon, 07 Jun 2021 08:28:30 -0400
X-MC-Unique: YsOBD23nNa6qLAH5lMRtYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28E10803F50;
 Mon,  7 Jun 2021 12:28:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2235B19D9D;
 Mon,  7 Jun 2021 12:28:23 +0000 (UTC)
Date: Mon, 7 Jun 2021 14:28:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v3 5/7] ACPI ERST: create ERST device for pc/x86 machines.
Message-ID: <20210607142823.51a5ab46@redhat.com>
In-Reply-To: <1622225659-16847-6-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
 <1622225659-16847-6-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 14:14:17 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change enables ERST support for x86 guests.
> 
> ERST can be disabled at run-time, for example, with:
> 
>  -machine q35,erst=off

1st: not everyone needs this feature so I'd turn it off by default
2nd: it looks to me that patch breaks cross version migration
     (one more reason to disable ERST by default for simplicity sake),
     or it needs to be disabled on old machine types at least.
3rd: patch should not be necessary at all, if PCI device is used as
     a template for your device (see comments on 3/7)
4th: try to avoid using "ifdefs"
     (if you follow trhough #3 as suggested this patch including
      ifdefs can be dropped), on top of that in 3/7 I'd split out
     ACPI table related code into a separate object file so  that
     the device itself could be easily compiled out or made dynamically
     loadable as a module.

> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-build.c |  7 +++++++
>  hw/i386/pc.c         | 31 +++++++++++++++++++++++++++++++
>  include/hw/i386/pc.h |  1 +
>  3 files changed, 39 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index de98750..6ba79db 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/boards.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
> @@ -2388,6 +2389,12 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>  
> +    if (pcms->erst_enabled) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_erst(tables_blob, tables->linker,
> +                   x86ms->oem_id, x86ms->oem_table_id);
> +    }
> +
>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25..b7b4cc4 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -74,6 +74,7 @@
>  #include "qemu/cutils.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu_hotplug.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/boards.h"
>  #include "acpi-build.h"
>  #include "hw/mem/pc-dimm.h"
> @@ -1111,6 +1112,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>      ISADevice *pit = NULL;
>      MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
>      MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
> +    const X86MachineState *x86ms = X86_MACHINE(pcms);
>  
>      memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
>      memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
> @@ -1153,6 +1155,11 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>      }
>      *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>  
> +    if (pcms->erst_enabled && x86_machine_is_acpi_enabled(x86ms)) {
> +        hwaddr base = HPET_BASE + 0x10000UL;
> +        setup_erst_dev(base, error_fatal);
> +    }
> +
>      qemu_register_boot_set(pc_boot_set, *rtc_state);
>  
>      if (!xen_enabled() && pcms->pit_enabled) {
> @@ -1529,6 +1536,22 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>      pcms->hpet_enabled = value;
>  }
>  
> +#ifdef CONFIG_ACPI
> +static bool pc_machine_get_erst(Object *obj, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    return pcms->erst_enabled;
> +}
> +
> +static void pc_machine_set_erst(Object *obj, bool value, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    pcms->erst_enabled = value;
> +}
> +#endif
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
> @@ -1628,6 +1651,9 @@ static void pc_machine_initfn(Object *obj)
>  #ifdef CONFIG_HPET
>      pcms->hpet_enabled = true;
>  #endif
> +#ifdef CONFIG_ACPI
> +    pcms->erst_enabled = true;
> +#endif
>  
>      pc_system_flash_create(pcms);
>      pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
> @@ -1752,6 +1778,11 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> +#ifdef CONFIG_ACPI
> +    object_class_property_add_bool(oc, "erst",
> +        pc_machine_get_erst, pc_machine_set_erst);
> +#endif
> +
>      object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
>          pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
>          NULL, NULL);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index dcf060b..4458c8f 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,6 +45,7 @@ typedef struct PCMachineState {
>      bool sata_enabled;
>      bool pit_enabled;
>      bool hpet_enabled;
> +    bool erst_enabled;
>      uint64_t max_fw_size;
>  
>      /* NUMA information: */


