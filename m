Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0172AF145
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:53:46 +0100 (CET)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpdB-0002Gh-Ky
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpVn-0001Ly-VI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpVl-0001q1-NF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1muYFOqDRZRMsR4FJKe6HOzX3kjdoi0i85VN+dECzfU=;
 b=QKGKCBOUngi7dijwIBLjWP1zMKtmgD7Pge2c2kVmY+8wGKhxaNqQhZGiMrF/cDLP0wgUhZ
 sOGJR5+Bq2g58qyOZiiOQ38aqAVp/BxA4+eau7rfp5OI3gv9gM4P4EEIm1AJR5MBEcW0/A
 6k59ze86Eayg2dfflsCmiWcRSSdgcnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-FTXD5_avPIyrDIn4NUF_Dw-1; Wed, 11 Nov 2020 07:46:02 -0500
X-MC-Unique: FTXD5_avPIyrDIn4NUF_Dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2B096D591;
 Wed, 11 Nov 2020 12:46:01 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2654E2C31E;
 Wed, 11 Nov 2020 12:45:48 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:45:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 07/12] microvm: add second ioapic
Message-ID: <20201111134546.5e26f2a0@redhat.com>
In-Reply-To: <20201105133923.23821-8-kraxel@redhat.com>
References: <20201105133923.23821-1-kraxel@redhat.com>
 <20201105133923.23821-8-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Nov 2020 14:39:18 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Create second ioapic, route virtio-mmio IRQs to it,
> allow more virtio-mmio devices (24 instead of 8).
> 
> Needs ACPI, enabled by default, can be turned off
> using -machine ioapic2=off
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/microvm.h      |  2 ++
>  hw/i386/microvm.c              | 51 ++++++++++++++++++++++++++++++++--
>  tests/qtest/bios-tables-test.c |  8 +++---
>  3 files changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index f1e9db059b85..f25f8374413f 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -72,6 +72,7 @@
>  #define MICROVM_MACHINE_PIC                 "pic"
>  #define MICROVM_MACHINE_RTC                 "rtc"
>  #define MICROVM_MACHINE_PCIE                "pcie"
> +#define MICROVM_MACHINE_IOAPIC2             "ioapic2"
>  #define MICROVM_MACHINE_ISA_SERIAL          "isa-serial"
>  #define MICROVM_MACHINE_OPTION_ROMS         "x-option-roms"
>  #define MICROVM_MACHINE_AUTO_KERNEL_CMDLINE "auto-kernel-cmdline"
> @@ -90,6 +91,7 @@ struct MicrovmMachineState {
>      OnOffAuto pit;
>      OnOffAuto rtc;
>      OnOffAuto pcie;
> +    OnOffAuto ioapic2;
>      bool isa_serial;
>      bool option_roms;
>      bool auto_kernel_cmdline;
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 829b376a1278..cae0d8fc8692 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -145,30 +145,50 @@ static void create_gpex(MicrovmMachineState *mms)
>      }
>  }
>  
> +static int microvm_ioapics(MicrovmMachineState *mms)
> +{
> +    if (!x86_machine_is_acpi_enabled(X86_MACHINE(mms))) {
> +        return 1;
> +    }
> +    if (mms->ioapic2 == ON_OFF_AUTO_OFF) {
> +        return 1;
> +    }
> +    return 2;
> +}
> +
>  static void microvm_devices_init(MicrovmMachineState *mms)
>  {
>      X86MachineState *x86ms = X86_MACHINE(mms);
>      ISABus *isa_bus;
>      ISADevice *rtc_state;
>      GSIState *gsi_state;
> +    int ioapics;
>      int i;
>  
>      /* Core components */
> -
> +    ioapics = microvm_ioapics(mms);
maby nr_ioapics would be better.

>      gsi_state = g_malloc0(sizeof(*gsi_state));
> -    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
> +    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state,
> +                                    IOAPIC_NUM_PINS * ioapics);
>  
>      isa_bus = isa_bus_new(NULL, get_system_memory(), get_system_io(),
>                            &error_abort);
>      isa_bus_irqs(isa_bus, x86ms->gsi);
>  
>      ioapic_init_gsi(gsi_state, "machine");
> +    if (ioapics > 1) {
> +        x86ms->ioapic2 = ioapic_init_secondary(gsi_state);
> +    }
>  
>      kvmclock_create(true);
>  
>      mms->virtio_irq_base = 5;
>      mms->virtio_num_transports = 8;
> -    if (x86_machine_is_acpi_enabled(x86ms)) {
> +    if (x86ms->ioapic2) {
> +        mms->pcie_irq_base = 16;
> +        mms->virtio_irq_base = 24;
now I see where magic 24 comes from in 3/12
it should be a shared macro or a property that APIC code gets dynamically 

> +        mms->virtio_num_transports = 24;
> +    } else if (x86_machine_is_acpi_enabled(x86ms)) {
>          mms->pcie_irq_base = 12;
>          mms->virtio_irq_base = 16;
>      }
> @@ -544,6 +564,23 @@ static void microvm_machine_set_pcie(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &mms->pcie, errp);
>  }
>  
> +static void microvm_machine_get_ioapic2(Object *obj, Visitor *v, const char *name,
> +                                        void *opaque, Error **errp)
> +{
> +    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> +    OnOffAuto ioapic2 = mms->ioapic2;
> +
> +    visit_type_OnOffAuto(v, name, &ioapic2, errp);
> +}
> +
> +static void microvm_machine_set_ioapic2(Object *obj, Visitor *v, const char *name,
> +                                        void *opaque, Error **errp)
> +{
> +    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> +
> +    visit_type_OnOffAuto(v, name, &mms->ioapic2, errp);
> +}
> +
>  static bool microvm_machine_get_isa_serial(Object *obj, Error **errp)
>  {
>      MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> @@ -620,6 +657,7 @@ static void microvm_machine_initfn(Object *obj)
>      mms->pit = ON_OFF_AUTO_AUTO;
>      mms->rtc = ON_OFF_AUTO_AUTO;
>      mms->pcie = ON_OFF_AUTO_AUTO;
> +    mms->ioapic2 = ON_OFF_AUTO_AUTO;
>      mms->isa_serial = true;
>      mms->option_roms = true;
>      mms->auto_kernel_cmdline = true;
> @@ -693,6 +731,13 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, MICROVM_MACHINE_PCIE,
>          "Enable PCIe");
>  
> +    object_class_property_add(oc, MICROVM_MACHINE_IOAPIC2, "OnOffAuto",
> +                              microvm_machine_get_ioapic2,
> +                              microvm_machine_set_ioapic2,
> +                              NULL, NULL);
> +    object_class_property_set_description(oc, MICROVM_MACHINE_IOAPIC2,
> +        "Enable second IO-APIC");
> +
>      object_class_property_add_bool(oc, MICROVM_MACHINE_ISA_SERIAL,
>                                     microvm_machine_get_isa_serial,
>                                     microvm_machine_set_isa_serial);
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f23a5335a875..0a0ce76ffcf9 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1115,7 +1115,7 @@ static void test_acpi_microvm_tcg(void)
>      test_data data;
>  
>      test_acpi_microvm_prepare(&data);
> -    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
>                    &data);
>      free_test_data(&data);
>  }
> @@ -1126,7 +1126,7 @@ static void test_acpi_microvm_usb_tcg(void)
>  
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".usb";
> -    test_acpi_one(" -machine microvm,acpi=on,usb=on,rtc=off",
> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
>                    &data);
>      free_test_data(&data);
>  }
> @@ -1137,7 +1137,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>  
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".rtc";
> -    test_acpi_one(" -machine microvm,acpi=on,rtc=on",
> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
>                    &data);
>      free_test_data(&data);
>  }
> @@ -1149,7 +1149,7 @@ static void test_acpi_microvm_pcie_tcg(void)
>      test_acpi_microvm_prepare(&data);
>      data.variant = ".pcie";
>      data.tcg_only = true; /* need constant host-phys-bits */
> -    test_acpi_one(" -machine microvm,acpi=on,rtc=off,pcie=on",
> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off,pcie=on",
>                    &data);
>      free_test_data(&data);
>  }


