Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDC66E14B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnHG-0000rA-HV; Tue, 17 Jan 2023 09:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHnHB-0000qI-8D; Tue, 17 Jan 2023 09:49:28 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHnH7-0006dw-MQ; Tue, 17 Jan 2023 09:49:24 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id v81so14884465vkv.5;
 Tue, 17 Jan 2023 06:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9a/OGCFOsJsMLxNNuTTiotX1akGAwg3r9QeX0II9l2E=;
 b=VH2uo2tDNmysim2w89TUsQPBeNyOZcIqiiHvdJxHSrvk0ZS0l0c54lX1Bk8K/P9W47
 WdsBZ91AGONUTj3v2LocjP+ujINfz0ILEPY7zn/XEsivQ/7Db0c8/tWOtW9V0Lf9BJSL
 zew1X4d6FdxQIxnB/V4e3s525ScwlWZygH9p3HZ4jRbu6hOjJXOW67fY6BzHvMsZplBw
 w3pwOPqaJ+hi+yfRvwDHbumA693p85s2Mbdj9rHcYhS0QSuedXGey9IXVQmW0xuHLHcJ
 bUyZ4/PWXdLDfbRWSfxl5HxIp810vHHqMbhx81SheZKRHtvR/0uiDCMh43Jwluq3QEvx
 g6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9a/OGCFOsJsMLxNNuTTiotX1akGAwg3r9QeX0II9l2E=;
 b=PIYdBtqSh+xzHBpD9w+/gHZJc3J+DC9pNgOUuofZzh+5Kj4Pvnx/1HPP8hPLWBCyUa
 jYGl/dkEFG1dsRcIF4MMiGkbZNXyf8M67AsjQM4p/jj4xm0kvtVB4+SHFnDkjgxkktMd
 agm+NmWNvpdfOo/BuVx5CTGG15wmGg2tmMPkI3vfa/rGw+NbYIRozqESkUeS1fzbA1Sf
 aI3Q2/VKb7afcrBuJ/PoFfRDsBOW4HgOh9tLpr3lclKE4yftWaEJh3JZ+JdtC52WERrz
 pZE+G4y+iGBpso+D2c1QV6idWrNv4UHuqQn0G58fFEQRVZyugqVz+xwd08fBhqC4o9kE
 4v9Q==
X-Gm-Message-State: AFqh2kpVOS8frD6c0JnBMrFQ2HZC+n/QKwr15KhoImrOmEjgQABUB+qX
 Vf4NiyxpInhNQlaG8hqjJ3NVVZnUUeqbAfQrSxw=
X-Google-Smtp-Source: AMrXdXvdd5OBoGSe4z2ibBp2uVnBtGxgd0NAgAna68rR/u0TnxkhyyzwfHEsoJhtWaJ9RVAbmZN7u96Vp7Q00aCJHGM=
X-Received: by 2002:a1f:1e4c:0:b0:3e1:a9de:8ba4 with SMTP id
 e73-20020a1f1e4c000000b003e1a9de8ba4mr230269vke.9.1673966959735; Tue, 17 Jan
 2023 06:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-3-shentey@gmail.com>
 <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
 <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
In-Reply-To: <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 17 Jan 2023 15:49:05 +0100
Message-ID: <CAG4p6K4WPJMzR=gPnCJ9Aa-YdxDLU2f_2GZOYSoNTcxNPg0AyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] hw/acpi/acpi_dev_interface: Resolve
 AcpiDeviceIfClass::madt_cpu
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="000000000000003a2805f276ce35"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000003a2805f276ce35
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 1:30 AM Bernhard Beschow <shentey@gmail.com> wrote:

>
>
> Am 16. Januar 2023 16:29:30 UTC schrieb Igor Mammedov <imammedo@redhat.com
> >:
> >On Mon, 16 Jan 2023 16:29:03 +0100
> >Bernhard Beschow <shentey@gmail.com> wrote:
> >
> >> This class attribute was always set to pc_madt_cpu_entry().
> >> pc_madt_cpu_entry() is architecture dependent and was assigned to the
> >> attribute even in architecture agnostic code such as in hw/acpi/piix4.c
> >> and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the
> >> assumption that these device models are only ever used with ACPI on x86
> >> targets.
> >>
> >> The only target independent location where madt_cpu was called was hw/
> >> acpi/cpu.c. Here a function pointer can be passed via an argument
> >> instead. The other locations where it was called was in x86-specific
> code
> >> where pc_madt_cpu_entry() can be used directly.
> >>
> >> While at it, move pc_madt_cpu_entry() from the public include/hw/i386/
> >> pc.h to the private hw/i386/acpi-common where it is also implemented.
> >
> >I'm not sure about this approach,
> >the callback is intend to be used not only by x86 but also in
> >the end by ARM (it's just that arm/virt CPU hotplug patches are
> >still work in progress and haven't been merged).
>
> IIUC one would call the target-independent build_cpus_aml() from the
> ARM-specific build_madt(). There, one could pass a function pointer to an
> ARM-specific madt_cpu_fn. Shouldn't that get us covered?
>
> >
> >So I'd prefer to keep AcpiDeviceIfClass::madt_cpu.
> >
> >What's the end goal you are trying to achieve by getting
> >rid of this callback?
>
> ACPI controllers are in principle not x86-specific, yet our PIIX4 and ICH9
> device models always assign an x86-specific function to
> AcpiDeviceIfClass::madt_cpu. That doesn't seem right because the device
> models make assumptions about their usage contexts which they ideally
> shouldn't.
>
> In addition, it seems to me that ACPI controllers and AML generation
> should not be mixed: An ACPI controller deals with (hardware) events while
> AML generation is usually a BIOS task to inject code into an OS. Therefore,
> ACPI controllers don't seem to be the right place to assign AML-generating
> functions because that doesn't match how reality works.
>
> To solve both issues, one could factor out e.g. an AmlDeviceIf from
> AcpiDeviceIf, so one would't force the device models to provide an
> madt_cpu. Then one could assign a target-specific
> AmlDeviceIfClass::madt_cpu e.g. in board code. At the moment I don't see a
> need for a new interface, however, since the function pointer works just
> fine: It frees the device models from having to provide it and it is used
> in code which already deals with AML generation.
>

Well, yeah, this interface already exists as AcpiDevAmlIf which I even
touched in the last part of this series... CPUs could possibly implement it
though this needs a lot more thought. But, as mentioned above, I don't see
a big urge to do this at the moment.

Best regards,
Bernhard

>
> My end goal is to make the VT82xx south bridges compatible with x86 and to
> bring them to feature parity with PIIX. For this, I need to implement the
> VIA ACPI controller proper, and since these south bridges are currently
> only used in MIPS and PowerPC contexts I'm feeling a bit uncomfortable
> having to drag in x86 assumptions into these devices.
>
> Best regards,
> Bernhard
>
> >
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  hw/i386/acpi-common.h                |  7 +++++--
> >>  include/hw/acpi/acpi_dev_interface.h |  2 --
> >>  include/hw/acpi/cpu.h                |  6 +++++-
> >>  include/hw/i386/pc.h                 |  4 ----
> >>  hw/acpi/acpi-x86-stub.c              |  6 ------
> >>  hw/acpi/cpu.c                        | 10 ++++------
> >>  hw/acpi/piix4.c                      |  2 --
> >>  hw/i386/acpi-build.c                 |  5 ++---
> >>  hw/i386/acpi-common.c                |  5 ++---
> >>  hw/i386/acpi-microvm.c               |  3 +--
> >>  hw/i386/generic_event_device_x86.c   |  9 ---------
> >>  hw/isa/lpc_ich9.c                    |  1 -
> >>  12 files changed, 19 insertions(+), 41 deletions(-)
> >>
> >> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> >> index a68825acf5..968d625d88 100644
> >> --- a/hw/i386/acpi-common.h
> >> +++ b/hw/i386/acpi-common.h
> >> @@ -1,15 +1,18 @@
> >>  #ifndef HW_I386_ACPI_COMMON_H
> >>  #define HW_I386_ACPI_COMMON_H
> >>
> >> -#include "hw/acpi/acpi_dev_interface.h"
> >>  #include "hw/acpi/bios-linker-loader.h"
> >>  #include "hw/i386/x86.h"
> >> +#include "hw/boards.h"
> >>
> >>  /* Default IOAPIC ID */
> >>  #define ACPI_BUILD_IOAPIC_ID 0x0
> >>
> >> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GArray
> *entry,
> >> +                       bool force_enabled);
> >> +
> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> >> +                     X86MachineState *x86ms,
> >>                       const char *oem_id, const char *oem_table_id);
> >>
> >>  #endif
> >> diff --git a/include/hw/acpi/acpi_dev_interface.h
> b/include/hw/acpi/acpi_dev_interface.h
> >> index a1648220ff..ca92928124 100644
> >> --- a/include/hw/acpi/acpi_dev_interface.h
> >> +++ b/include/hw/acpi/acpi_dev_interface.h
> >> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
> >>      /* <public> */
> >>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
> >>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
> >> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray
> *entry,
> >> -                     bool force_enabled);
> >>  };
> >>  #endif
> >> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> >> index 999caaf510..25b25bb594 100644
> >> --- a/include/hw/acpi/cpu.h
> >> +++ b/include/hw/acpi/cpu.h
> >> @@ -15,6 +15,7 @@
> >>  #include "hw/qdev-core.h"
> >>  #include "hw/acpi/acpi.h"
> >>  #include "hw/acpi/aml-build.h"
> >> +#include "hw/boards.h"
> >>  #include "hw/hotplug.h"
> >>
> >>  typedef struct AcpiCpuStatus {
> >> @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
> >>      const char *smi_path;
> >>  } CPUHotplugFeatures;
> >>
> >> +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
> >> +                            GArray *entry, bool force_enabled);
> >> +
> >>  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> >> -                    hwaddr io_base,
> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> >>                      const char *res_root,
> >>                      const char *event_handler_method);
> >>
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index a0647165d1..a5cce88653 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entry,
> uint8_t **data,
> >>                                 int *data_len);
> >>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
> >>
> >> -/* hw/i386/acpi-common.c */
> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> >> -                       GArray *entry, bool force_enabled);
> >> -
> >>  /* sgx.c */
> >>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
> >>
> >> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> >> index d0d399d26b..9662a594ad 100644
> >> --- a/hw/acpi/acpi-x86-stub.c
> >> +++ b/hw/acpi/acpi-x86-stub.c
> >> @@ -1,12 +1,6 @@
> >>  #include "qemu/osdep.h"
> >> -#include "hw/i386/pc.h"
> >>  #include "hw/i386/acpi-build.h"
> >>
> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> >> -                       GArray *entry, bool force_enabled)
> >> -{
> >> -}
> >> -
> >>  Object *acpi_get_i386_pci_host(void)
> >>  {
> >>         return NULL;
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index 19c154d78f..db15f9278d 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
> >>  #define CPU_FW_EJECT_EVENT "CEJF"
> >>
> >>  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> >> -                    hwaddr io_base,
> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> >>                      const char *res_root,
> >>                      const char *event_handler_method)
> >>  {
> >> @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> >>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >>      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(machine);
> >>      char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE,
> res_root);
> >> -    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF,
> NULL);
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
> >> +
> >> +    assert(madt_cpu);
> >>
> >>      cpu_ctrl_dev = aml_device("%s", cphp_res_path);
> >>      {
> >> @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> >>              aml_append(dev, method);
> >>
> >>              /* build _MAT object */
> >> -            assert(adevc && adevc->madt_cpu);
> >> -            adevc->madt_cpu(i, arch_ids, madt_buf,
> >> -                            true); /* set enabled flag */
> >> +            madt_cpu(i, arch_ids, madt_buf, true /* set enabled flag
> */);
> >>              aml_append(dev, aml_name_decl("_MAT",
> >>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> >>              g_array_free(madt_buf, true);
> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >> index 0a81f1ad93..4d0d4fdeeb 100644
> >> --- a/hw/acpi/piix4.c
> >> +++ b/hw/acpi/piix4.c
> >> @@ -20,7 +20,6 @@
> >>   */
> >>
> >>  #include "qemu/osdep.h"
> >> -#include "hw/i386/pc.h"
> >>  #include "hw/southbridge/piix.h"
> >>  #include "hw/irq.h"
> >>  #include "hw/isa/apm.h"
> >> @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *klass,
> void *data)
> >>      hc->unplug = piix4_device_unplug_cb;
> >>      adevc->ospm_status = piix4_ospm_status;
> >>      adevc->send_event = piix4_send_gpe;
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >>  }
> >>
> >>  static const TypeInfo piix4_pm_info = {
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 127c4e2d50..0be3960a37 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>              .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
> >>          };
> >>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >> -                       "\\_SB.PCI0", "\\_GPE._E02");
> >> +                       pc_madt_cpu_entry, "\\_SB.PCI0", "\\_GPE._E02");
> >>      }
> >>
> >>      if (pcms->memhp_io_base && nr_mem) {
> >> @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables,
> MachineState *machine)
> >>
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >> -                    x86ms->oem_table_id);
> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> >>
> >>  #ifdef CONFIG_ACPI_ERST
> >>      {
> >> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> >> index 52e5c1439a..aabf78092e 100644
> >> --- a/hw/i386/acpi-common.c
> >> +++ b/hw/i386/acpi-common.c
> >> @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t src,
> uint32_t gsi, uint16_t flags)
> >>   * 5.2.8 Multiple APIC Description Table
> >>   */
> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> >> +                     X86MachineState *x86ms,
> >>                       const char *oem_id, const char *oem_table_id)
> >>  {
> >>      int i;
> >>      bool x2apic_mode = false;
> >>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> >>      const CPUArchIdList *apic_ids =
> mc->possible_cpu_arch_ids(MACHINE(x86ms));
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> >>      AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> >>                          .oem_table_id = oem_table_id };
> >>
> >> @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker
> *linker,
> >>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /*
> Flags */
> >>
> >>      for (i = 0; i < apic_ids->len; i++) {
> >> -        adevc->madt_cpu(i, apic_ids, table_data, false);
> >> +        pc_madt_cpu_entry(i, apic_ids, table_data, false);
> >>          if (apic_ids->cpus[i].arch_id > 254) {
> >>              x2apic_mode = true;
> >>          }
> >> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> >> index fb09185cbd..d8a444d06c 100644
> >> --- a/hw/i386/acpi-microvm.c
> >> +++ b/hw/i386/acpi-microvm.c
> >> @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables
> *tables,
> >>
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >> -                    x86ms->oem_table_id);
> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> >>
> >>  #ifdef CONFIG_ACPI_ERST
> >>      {
> >> diff --git a/hw/i386/generic_event_device_x86.c
> b/hw/i386/generic_event_device_x86.c
> >> index e26fb02a2e..8fc233e1f1 100644
> >> --- a/hw/i386/generic_event_device_x86.c
> >> +++ b/hw/i386/generic_event_device_x86.c
> >> @@ -8,19 +8,10 @@
> >>
> >>  #include "qemu/osdep.h"
> >>  #include "hw/acpi/generic_event_device.h"
> >> -#include "hw/i386/pc.h"
> >> -
> >> -static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
> >> -{
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> >> -
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >> -}
> >>
> >>  static const TypeInfo acpi_ged_x86_info = {
> >>      .name          = TYPE_ACPI_GED_X86,
> >>      .parent        = TYPE_ACPI_GED,
> >> -    .class_init    = acpi_ged_x86_class_init,
> >>      .interfaces = (InterfaceInfo[]) {
> >>          { TYPE_HOTPLUG_HANDLER },
> >>          { TYPE_ACPI_DEVICE_IF },
> >> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> >> index 8d541e2b54..0ab0a341be 100644
> >> --- a/hw/isa/lpc_ich9.c
> >> +++ b/hw/isa/lpc_ich9.c
> >> @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *klass,
> void *data)
> >>      hc->unplug = ich9_pm_device_unplug_cb;
> >>      adevc->ospm_status = ich9_pm_ospm_status;
> >>      adevc->send_event = ich9_send_gpe;
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >>      amldevc->build_dev_aml = build_ich9_isa_aml;
> >>  }
> >>
> >
>

--000000000000003a2805f276ce35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 17, 2023 at 1:30 AM Bernhard =
Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt; =
wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
<br>
Am 16. Januar 2023 16:29:30 UTC schrieb Igor Mammedov &lt;<a href=3D"mailto=
:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;:<br>
&gt;On Mon, 16 Jan 2023 16:29:03 +0100<br>
&gt;Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_bl=
ank">shentey@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; This class attribute was always set to pc_madt_cpu_entry().<br>
&gt;&gt; pc_madt_cpu_entry() is architecture dependent and was assigned to =
the<br>
&gt;&gt; attribute even in architecture agnostic code such as in hw/acpi/pi=
ix4.c<br>
&gt;&gt; and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the=
<br>
&gt;&gt; assumption that these device models are only ever used with ACPI o=
n x86<br>
&gt;&gt; targets.<br>
&gt;&gt; <br>
&gt;&gt; The only target independent location where madt_cpu was called was=
 hw/<br>
&gt;&gt; acpi/cpu.c. Here a function pointer can be passed via an argument<=
br>
&gt;&gt; instead. The other locations where it was called was in x86-specif=
ic code<br>
&gt;&gt; where pc_madt_cpu_entry() can be used directly.<br>
&gt;&gt;<br>
&gt;&gt; While at it, move pc_madt_cpu_entry() from the public include/hw/i=
386/<br>
&gt;&gt; pc.h to the private hw/i386/acpi-common where it is also implement=
ed.<br>
&gt;<br>
&gt;I&#39;m not sure about this approach,<br>
&gt;the callback is intend to be used not only by x86 but also in<br>
&gt;the end by ARM (it&#39;s just that arm/virt CPU hotplug patches are<br>
&gt;still work in progress and haven&#39;t been merged).<br>
<br>
IIUC one would call the target-independent build_cpus_aml() from the ARM-sp=
ecific build_madt(). There, one could pass a function pointer to an ARM-spe=
cific madt_cpu_fn. Shouldn&#39;t that get us covered?<br>
<br>
&gt;<br>
&gt;So I&#39;d prefer to keep AcpiDeviceIfClass::madt_cpu.<br>
&gt;<br>
&gt;What&#39;s the end goal you are trying to achieve by getting<br>
&gt;rid of this callback?<br>
<br>
ACPI controllers are in principle not x86-specific, yet our PIIX4 and ICH9 =
device models always assign an x86-specific function to AcpiDeviceIfClass::=
madt_cpu. That doesn&#39;t seem right because the device models make assump=
tions about their usage contexts which they ideally shouldn&#39;t.<br>
<br>
In addition, it seems to me that ACPI controllers and AML generation should=
 not be mixed: An ACPI controller deals with (hardware) events while AML ge=
neration is usually a BIOS task to inject code into an OS. Therefore, ACPI =
controllers don&#39;t seem to be the right place to assign AML-generating f=
unctions because that doesn&#39;t match how reality works.<br>
<br>
To solve both issues, one could factor out e.g. an AmlDeviceIf from AcpiDev=
iceIf, so one would&#39;t force the device models to provide an madt_cpu. T=
hen one could assign a target-specific AmlDeviceIfClass::madt_cpu e.g. in b=
oard code. At the moment I don&#39;t see a need for a new interface, howeve=
r, since the function pointer works just fine: It frees the device models f=
rom having to provide it and it is used in code which already deals with AM=
L generation.<br></blockquote><div><br></div><div>Well, yeah, this interfac=
e already exists as AcpiDevAmlIf which I even touched in the last part of t=
his series... CPUs could possibly implement it though this needs a lot more=
 thought. But, as mentioned above, I don&#39;t see a big urge to do this at=
 the moment.</div><div><br></div><div>Best regards,</div><div>Bernhard<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
My end goal is to make the VT82xx south bridges compatible with x86 and to =
bring them to feature parity with PIIX. For this, I need to implement the V=
IA ACPI controller proper, and since these south bridges are currently only=
 used in MIPS and PowerPC contexts I&#39;m feeling a bit uncomfortable havi=
ng to drag in x86 assumptions into these devices.<br>
<br>
Best regards,<br>
Bernhard<br>
<br>
&gt;<br>
&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmai=
l.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/i386/acpi-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++--<br>
&gt;&gt;=C2=A0 include/hw/acpi/acpi_dev_interface.h |=C2=A0 2 --<br>
&gt;&gt;=C2=A0 include/hw/acpi/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
&gt;&gt;=C2=A0 include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt;&gt;=C2=A0 hw/acpi/acpi-x86-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 ------<br>
&gt;&gt;=C2=A0 hw/acpi/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt;&gt;=C2=A0 hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
&gt;&gt;=C2=A0 hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++---<br>
&gt;&gt;=C2=A0 hw/i386/acpi-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++---<br>
&gt;&gt;=C2=A0 hw/i386/acpi-microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
&gt;&gt;=C2=A0 hw/i386/generic_event_device_x86.c=C2=A0 =C2=A0|=C2=A0 9 ---=
------<br>
&gt;&gt;=C2=A0 hw/isa/lpc_ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;&gt;=C2=A0 12 files changed, 19 insertions(+), 41 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h<br>
&gt;&gt; index a68825acf5..968d625d88 100644<br>
&gt;&gt; --- a/hw/i386/acpi-common.h<br>
&gt;&gt; +++ b/hw/i386/acpi-common.h<br>
&gt;&gt; @@ -1,15 +1,18 @@<br>
&gt;&gt;=C2=A0 #ifndef HW_I386_ACPI_COMMON_H<br>
&gt;&gt;=C2=A0 #define HW_I386_ACPI_COMMON_H<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/acpi/bios-linker-loader.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/i386/x86.h&quot;<br>
&gt;&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 /* Default IOAPIC ID */<br>
&gt;&gt;=C2=A0 #define ACPI_BUILD_IOAPIC_ID 0x0<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GA=
rray *entry,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bool force_enabled);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X86MachineState *x86ms, AcpiDeviceIf *adev,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X86MachineState *x86ms,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *oem_id, const char *oem_table_id);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acp=
i/acpi_dev_interface.h<br>
&gt;&gt; index a1648220ff..ca92928124 100644<br>
&gt;&gt; --- a/include/hw/acpi/acpi_dev_interface.h<br>
&gt;&gt; +++ b/include/hw/acpi/acpi_dev_interface.h<br>
&gt;&gt; @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* &lt;public&gt; */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 void (*ospm_status)(AcpiDeviceIf *adev, ACPIOS=
TInfoList ***list);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 void (*send_event)(AcpiDeviceIf *adev, AcpiEve=
ntStatusBits ev);<br>
&gt;&gt; -=C2=A0 =C2=A0 void (*madt_cpu)(int uid, const CPUArchIdList *apic=
_ids, GArray *entry,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0bool force_enabled);<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h<br>
&gt;&gt; index 999caaf510..25b25bb594 100644<br>
&gt;&gt; --- a/include/hw/acpi/cpu.h<br>
&gt;&gt; +++ b/include/hw/acpi/cpu.h<br>
&gt;&gt; @@ -15,6 +15,7 @@<br>
&gt;&gt;=C2=A0 #include &quot;hw/qdev-core.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/acpi/acpi.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/acpi/aml-build.h&quot;<br>
&gt;&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/hotplug.h&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 typedef struct AcpiCpuStatus {<br>
&gt;&gt; @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *smi_path;<br>
&gt;&gt;=C2=A0 } CPUHotplugFeatures;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_id=
s,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GArray *entry, bool force_enabled);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 void build_cpus_aml(Aml *table, MachineState *machine, CPUHo=
tplugFeatures opts,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hwaddr io_base,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hwaddr io_base, madt_cpu_fn madt_cpu,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *res_root,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *event_handler_method);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
&gt;&gt; index a0647165d1..a5cce88653 100644<br>
&gt;&gt; --- a/include/hw/i386/pc.h<br>
&gt;&gt; +++ b/include/hw/i386/pc.h<br>
&gt;&gt; @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *en=
try, uint8_t **data,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *data_len);<br>
&gt;&gt;=C2=A0 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t f=
lash_size);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -/* hw/i386/acpi-common.c */<br>
&gt;&gt; -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GArray *entry, bool force_enabled);<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 /* sgx.c */<br>
&gt;&gt;=C2=A0 void pc_machine_init_sgx_epc(PCMachineState *pcms);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c<br>
&gt;&gt; index d0d399d26b..9662a594ad 100644<br>
&gt;&gt; --- a/hw/acpi/acpi-x86-stub.c<br>
&gt;&gt; +++ b/hw/acpi/acpi-x86-stub.c<br>
&gt;&gt; @@ -1,12 +1,6 @@<br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/i386/acpi-build.h&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GArray *entry, bool force_enabled)<br>
&gt;&gt; -{<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 Object *acpi_get_i386_pci_host(void)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c<br>
&gt;&gt; index 19c154d78f..db15f9278d 100644<br>
&gt;&gt; --- a/hw/acpi/cpu.c<br>
&gt;&gt; +++ b/hw/acpi/cpu.c<br>
&gt;&gt; @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug =
=3D {<br>
&gt;&gt;=C2=A0 #define CPU_FW_EJECT_EVENT &quot;CEJF&quot;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 void build_cpus_aml(Aml *table, MachineState *machine, CPUHo=
tplugFeatures opts,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hwaddr io_base,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hwaddr io_base, madt_cpu_fn madt_cpu,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *res_root,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *event_handler_method)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState *=
machine, CPUHotplugFeatures opts,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(machine=
);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const CPUArchIdList *arch_ids =3D mc-&gt;possi=
ble_cpu_arch_ids(machine);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 char *cphp_res_path =3D g_strdup_printf(&quot;=
%s.&quot; CPUHP_RES_DEVICE, res_root);<br>
&gt;&gt; -=C2=A0 =C2=A0 Object *obj =3D object_resolve_path_type(&quot;&quo=
t;, TYPE_ACPI_DEVICE_IF, NULL);<br>
&gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLA=
SS(obj);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 assert(madt_cpu);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu_ctrl_dev =3D aml_device(&quot;%s&quot;, cp=
hp_res_path);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState *=
machine, CPUHotplugFeatures opts,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, me=
thod);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* build _MAT obje=
ct */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(adevc &amp;&amp;=
 adevc-&gt;madt_cpu);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adevc-&gt;madt_cpu(i, a=
rch_ids, madt_buf,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 true); /* set enabled flag */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 madt_cpu(i, arch_ids, m=
adt_buf, true /* set enabled flag */);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(dev, am=
l_name_decl(&quot;_MAT&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_=
buffer(madt_buf-&gt;len, (uint8_t *)madt_buf-&gt;data)));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_free(madt_=
buf, true);<br>
&gt;&gt; diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c<br>
&gt;&gt; index 0a81f1ad93..4d0d4fdeeb 100644<br>
&gt;&gt; --- a/hw/acpi/piix4.c<br>
&gt;&gt; +++ b/hw/acpi/piix4.c<br>
&gt;&gt; @@ -20,7 +20,6 @@<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/southbridge/piix.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/irq.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/isa/apm.h&quot;<br>
&gt;&gt; @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *k=
lass, void *data)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hc-&gt;unplug =3D piix4_device_unplug_cb;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;ospm_status =3D piix4_ospm_status;<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;send_event =3D piix4_send_gpe;<br>
&gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_entry;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 static const TypeInfo piix4_pm_info =3D {<br>
&gt;&gt; diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
&gt;&gt; index 127c4e2d50..0be3960a37 100644<br>
&gt;&gt; --- a/hw/i386/acpi-build.c<br>
&gt;&gt; +++ b/hw/i386/acpi-build.c<br>
&gt;&gt; @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *l=
inker,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fw_unplugs_cpu =
=3D pm-&gt;smi_on_cpu_unplug,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_cpus_aml(dsdt, machine, op=
ts, pm-&gt;cpu_hp_io_base,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;\\_SB.PCI0&quot;, &quot;\\_GPE._E02&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pc_madt_cpu_entry, &quot;\\_SB.PCI0&quot;, &quot;\\_GPE=
._E02&quot;);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (pcms-&gt;memhp_io_base &amp;&amp; nr_mem) =
{<br>
&gt;&gt; @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables, Mac=
hineState *machine)<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_add_table(table_offsets, tables_blob);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_build_madt(tables_blob, tables-&gt;linker=
, x86ms,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ACPI_DEVICE_IF(x86ms-&gt;acpi_dev), x86ms-&gt;oem_id,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 x86ms-&gt;oem_table_id);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 x86ms-&gt;oem_id, x86ms-&gt;oem_table_id);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #ifdef CONFIG_ACPI_ERST<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c<br>
&gt;&gt; index 52e5c1439a..aabf78092e 100644<br>
&gt;&gt; --- a/hw/i386/acpi-common.c<br>
&gt;&gt; +++ b/hw/i386/acpi-common.c<br>
&gt;&gt; @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t sr=
c, uint32_t gsi, uint16_t flags)<br>
&gt;&gt;=C2=A0 =C2=A0* 5.2.8 Multiple APIC Description Table<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X86MachineState *x86ms, AcpiDeviceIf *adev,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0X86MachineState *x86ms,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *oem_id, const char *oem_table_id)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool x2apic_mode =3D false;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const CPUArchIdList *apic_ids =3D mc-&gt;possi=
ble_cpu_arch_ids(MACHINE(x86ms));<br>
&gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLA=
SS(adev);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 AcpiTable table =3D { .sig =3D &quot;APIC&quot=
;, .rev =3D 1, .oem_id =3D oem_id,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .oem_table_id =3D oem_table_id };<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSL=
inker *linker,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_data, 1 /* PCA=
T_COMPAT */, 4); /* Flags */<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; apic_ids-&gt;len; i++) {<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 adevc-&gt;madt_cpu(i, apic_ids, table=
_data, false);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc_madt_cpu_entry(i, apic_ids, table_=
data, false);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (apic_ids-&gt;cpus[i].arch_id=
 &gt; 254) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x2apic_mode =3D tr=
ue;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c<br>
&gt;&gt; index fb09185cbd..d8a444d06c 100644<br>
&gt;&gt; --- a/hw/i386/acpi-microvm.c<br>
&gt;&gt; +++ b/hw/i386/acpi-microvm.c<br>
&gt;&gt; @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables=
 *tables,<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_add_table(table_offsets, tables_blob);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_build_madt(tables_blob, tables-&gt;linker=
, X86_MACHINE(machine),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ACPI_DEVICE_IF(x86ms-&gt;acpi_dev), x86ms-&gt;oem_id,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 x86ms-&gt;oem_table_id);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 x86ms-&gt;oem_id, x86ms-&gt;oem_table_id);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #ifdef CONFIG_ACPI_ERST<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_=
event_device_x86.c<br>
&gt;&gt; index e26fb02a2e..8fc233e1f1 100644<br>
&gt;&gt; --- a/hw/i386/generic_event_device_x86.c<br>
&gt;&gt; +++ b/hw/i386/generic_event_device_x86.c<br>
&gt;&gt; @@ -8,19 +8,10 @@<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/acpi/generic_event_device.h&quot;<br>
&gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -static void acpi_ged_x86_class_init(ObjectClass *class, void *dat=
a)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(c=
lass);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_entry;<br>
&gt;&gt; -}<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 static const TypeInfo acpi_ged_x86_info =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_ACPI_GED_X86,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AC=
PI_GED,<br>
&gt;&gt; -=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D acpi_ged_x86_class_ini=
t,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_HOTPLUG_HANDLER },<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ACPI_DEVICE_IF },<br>
&gt;&gt; diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c<br>
&gt;&gt; index 8d541e2b54..0ab0a341be 100644<br>
&gt;&gt; --- a/hw/isa/lpc_ich9.c<br>
&gt;&gt; +++ b/hw/isa/lpc_ich9.c<br>
&gt;&gt; @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *k=
lass, void *data)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hc-&gt;unplug =3D ich9_pm_device_unplug_cb;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;ospm_status =3D ich9_pm_ospm_status;=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;send_event =3D ich9_send_gpe;<br>
&gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_entry;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 amldevc-&gt;build_dev_aml =3D build_ich9_isa_a=
ml;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;<br>
</blockquote></div></div>

--000000000000003a2805f276ce35--

