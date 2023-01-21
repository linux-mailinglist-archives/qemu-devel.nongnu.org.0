Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3A67673D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:39:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFwC-0002LV-9X; Sat, 21 Jan 2023 10:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFw9-0002Ky-VX; Sat, 21 Jan 2023 10:37:45 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFw5-0005M1-N6; Sat, 21 Jan 2023 10:37:45 -0500
Received: by mail-vk1-xa31.google.com with SMTP id 22so3194636vkn.2;
 Sat, 21 Jan 2023 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+r2zU+rQeeUHa8N6xW+ru9bns9oe4Hp7zRPs3imhs2Q=;
 b=dHAzl8YtiCn1j7p1me0edkmfl9VHBJrGq1L4oxcFTFcDlk7+I6TAhXCltqEJjus8+p
 EdmEaRlj/x3NXlODUEO8AtV8HQYgIx9uNUkwv0BOYlreGcHyI5nPDa5x4QE7hep/F9hd
 bQ1QAXN2LiQ1yvtVwJc7fySIpdbG2caaXTvJHC84KAVQfU4tGNQvftcZRayOXUxmnD3F
 VMGzT/dhiFlG0je0Xa/OWZfPu6LtQJiw7nK13pOZ5eOi0Jeg8HPiP61ajK8fPAUWDKq2
 iHOCbF6QhPIsfGwNwygduEAo5z8IDtMkCMGVTGtzRDDm+rqlbUWufH2JiakSzVUDZbdD
 o7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+r2zU+rQeeUHa8N6xW+ru9bns9oe4Hp7zRPs3imhs2Q=;
 b=LFJIzOSw4BbbkYzJnkCDFw1XHZ/5pryuw+YKFhwK5TbHZrUI+iGGzRpDKPHMmvHApd
 xtm1mXvEYWlSqbDvStFjcJ8x7p+2AsLjeTMnatSAHJy+2sFc8MgNfoJOEsDWcKaSuoxB
 TKG/z+MdtjAZUL6yh/uhPcEGcy375OcqU3d+CJFp0zgRVACxmSfT2Jf3MSvOfzybOx+Y
 8bzpZ9Nl9lu7npxn1XaS0ojgTS8XWkdlGUdZBt/MOTV8UnuPWSANBFk6RguhxOkQlc1T
 EfkXG2jzCgXrnBGwAC2syJweXnajgDFHfk96qo4dOAnHQArg6z81u8/wcUM1JVqompnn
 OPeQ==
X-Gm-Message-State: AFqh2kr5R9/qYB1lPUQwVZ0ZQD/c1K7SEZgH2bTTNKxiTgytGnIp2Mc8
 iJgdiVkdQ8+AMg+GhCIb2CCfexL+Jqs6kaFCvO5zxL1Jhhialg==
X-Google-Smtp-Source: AMrXdXvJ8S/30QZXl2vm7KS5m+gf3ZqY5GgDe0wElb7X6b83Geh69eBvjZ7lUMJRbYT9+cXcdcZT79zhXpCx4QE/y7g=
X-Received: by 2002:a05:6122:11b2:b0:3e2:c1e:a32b with SMTP id
 y18-20020a05612211b200b003e20c1ea32bmr629221vkn.9.1674315460351; Sat, 21 Jan
 2023 07:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-3-shentey@gmail.com>
 <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
 <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
 <20230118155905.0e1c4b21@imammedo.users.ipa.redhat.com>
 <A1470B22-AE20-44CE-98DA-742F529107D8@gmail.com>
 <20230120173444.2865e389@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230120173444.2865e389@imammedo.users.ipa.redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 21 Jan 2023 16:37:26 +0100
Message-ID: <CAG4p6K48U3RhwD7Nf3+fYT5yV1YCOTxFo_KS2vvMR9FEbcQMyw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000419a4d05f2c7f244"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa31.google.com
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

--000000000000419a4d05f2c7f244
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 20, 2023 at 5:34 PM Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 19 Jan 2023 14:47:41 +0000
> Bernhard Beschow <shentey@gmail.com> wrote:
>
> > Am 18. Januar 2023 14:59:05 UTC schrieb Igor Mammedov <
> imammedo@redhat.com>:
> > >On Tue, 17 Jan 2023 00:30:23 +0000
> > >Bernhard Beschow <shentey@gmail.com> wrote:
> > >
> > >> Am 16. Januar 2023 16:29:30 UTC schrieb Igor Mammedov <
> imammedo@redhat.com>:
> > >> >On Mon, 16 Jan 2023 16:29:03 +0100
> > >> >Bernhard Beschow <shentey@gmail.com> wrote:
> > >> >
> > >> >> This class attribute was always set to pc_madt_cpu_entry().
> > >> >> pc_madt_cpu_entry() is architecture dependent and was assigned to
> the
> > >> >> attribute even in architecture agnostic code such as in
> hw/acpi/piix4.c
> > >> >> and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the
> > >> >> assumption that these device models are only ever used with ACPI
> on x86
> > >> >> targets.
> > >> >>
> > >> >> The only target independent location where madt_cpu was called was
> hw/
> > >> >> acpi/cpu.c. Here a function pointer can be passed via an argument
> > >> >> instead. The other locations where it was called was in
> x86-specific code
> > >> >> where pc_madt_cpu_entry() can be used directly.
> > >> >>
> > >> >> While at it, move pc_madt_cpu_entry() from the public
> include/hw/i386/
> > >> >> pc.h to the private hw/i386/acpi-common where it is also
> implemented.
> > >> >
> > >> >I'm not sure about this approach,
> > >> >the callback is intend to be used not only by x86 but also in
> > >> >the end by ARM (it's just that arm/virt CPU hotplug patches are
> > >> >still work in progress and haven't been merged).
> > >>
> > >> IIUC one would call the target-independent build_cpus_aml() from the
> ARM-specific build_madt(). There, one could pass a function pointer to an
> ARM-specific madt_cpu_fn. Shouldn't that get us covered?
> > >
> > >it will work in this case, but I don't like going back to random
> > >function pointer argument approach instead of using QOM and
> > >interfaces which is much better in describing expectations/contract
> > >for interfaces adn objects it's attached to.
> > >
> > >Howver that is not the reason why I'm against this approach, see bellow.
> > >
> > >> >So I'd prefer to keep AcpiDeviceIfClass::madt_cpu.
> > >> >
> > >> >What's the end goal you are trying to achieve by getting
> > >> >rid of this callback?
> > >>
> > >> ACPI controllers are in principle not x86-specific, yet our PIIX4 and
> ICH9 device models always assign an x86-specific function to
> AcpiDeviceIfClass::madt_cpu. That doesn't seem right because the device
> models make assumptions about their usage contexts which they ideally
> shouldn't.
> > >>
> > >> In addition, it seems to me that ACPI controllers and AML generation
> should not be mixed: An ACPI controller deals with (hardware) events while
> AML generation is usually a BIOS task to inject code into an OS. Therefore,
> ACPI controllers don't seem to be the right place to assign AML-generating
> functions because that doesn't match how reality works.
> > >
> > >It would be nice to have pristine hardware-only device models
> > >and firmware composing ACPI tables like baremetal systems do
> > >(they have a luxury of fixed hardware which makes it way simpler),
> > >however it was not practical nor sustainable in mainstream virt case.
> > >That's the reason why ACPI tables (firmware) were moved into QEMU
> (hardware).
> > >
> > >> To solve both issues, one could factor out e.g. an AmlDeviceIf from
> AcpiDeviceIf, so one would't force the device models to provide an
> madt_cpu.
> > >> Then one could assign a target-specific AmlDeviceIfClass::madt_cpu
> e.g. in board code.
> > >ACPI tables in QEMU started this way, It stopped being maintainable
> > >at certain point, see below for more.
> > >
> > >>At the moment I don't see a need for a new interface, however, since
> the function pointer works just fine: It frees the device models from
> having to provide it and it is used in code which already deals with AML
> generation.
> > >When the move happened, the bulk of ACPI code was as you suggest made
> > >as machine specific and it's still the case for the most of it.
> > >Then, with ease of adding new related features, it exploded into
> > >I would say hard to maintain mess. Hence before adding more and
> > >making it worse, I introduced  call_dev_aml_func()/AcpiDevAmlIf
> > >and started refactoring PCI AML code. That simplified main PCI bus
> > >enumeration quite a bit.
> > >
> > >The new interface however does exactly opposite of what you are doing,
> > >i.e. it pushes device specific AML generation into corresponding device
> > >model. It's not ideal as we have to provide stubs for targets where it's
> > >not needed. But stubs for target independent code is typical and proven
> > >approach we use in QEMU for such cases and is relatively easy to
> maintain.
> > >So I'd call it a reasonable compromise.
> > >
> > >Recently posted series (that untangles generic PCI slots AML from
> > >ACPI PCI hotplug frankenstein) continues with AcpiDevAmlIf approach
> > >and pushes more AML into target in-depended device models.
> >
> > I fully agree with the introduction of AcpiDevAmlIf. In fact I was
> following your work closely since it helped me making the VT82xx south
> bridges work with the PC machine. In order to make your approach even more
> elegant and efficient I'm following up with qbus_build_aml().
>
> Reviewed/acked it, thanks for nice cleanuup.
>
> > This patch doesn't actually question the AcpiDevAmlIf. It rather
> questions the mixing of CPU-related AML concerns into the ACPI controllers
> which are a priori CPU-agnostic. The only reason for dragging x86 concerns
> into these device models is that the AcpiDeviceIfClass requires madt_cpu to
> be assigned. Here we can apply the "interface segregation principle" which
> is why I proposed factoring out a dedicated interface from the
> AcpiDeviceIfClass (and possibly have CPUs implement it). I think that this
> would match your approach with AcpiDevAmlIf.
>
> There was and still is a reason for madt_cpu being part of
> AcpiDeviceIfClass and x86-ed piix impl.
>
> (It might have been a poor choice to use acpi controller as hotplug
> controller as well
> but that boat has sailed and can't be fixed without breaking
> ABI/migration.)
>

Could you please elaborate a bit on how the ABI is affected?  Migration
seems clear to me.

>
> But as it is now, hotplug controller is an owner of CPU hotplug data
> on which ::madt_cpu relies.
>

Could you please also elaborate a bit here on how hotplug and ::madt_cpu
are coupled? When generating the AML, one could check if both
AcpiDeviceIfClass and ::madt_cpu are available. There is code instantiating
TYPE_ACPI_GED in ARM and Loongarch which does not set ::madt_cpu. In order
to see what I mean, I've prepared v4 of this series:
https://lore.kernel.org/qemu-devel/20230121151941.24120-1-shentey@gmail.com

I'd say the same about ::send_event hook which is only used in hotplug case
> (GPE events do not have predefined meaning)
> That only leaves AcpiDeviceIfClass::ospm_status, which in turn implicitly
> depends on hotplug controller to provide status data.
> So question is why do you need AcpiDeviceIfClass for VIA, how much of it
> and how current impl. gets in the way of your goal?
>

I would just like to get feature parity with PIIX. Do you suggest taking a
different approach which avoids the hotplug state in the ACPI controller?

Thanks,
Bernhard

>
> > >And there is more coming on top of it (with the goal to make most
> > >of what we accumulated in PC/Q35 PCI ACPI code become generic enough
> > >to replace most of PCI related AML elsewhere (microvm, arm/virt,
> > >whatever else that is interested in ACPI tables support).
> > >My ambition with this refactoring stops at making qdev device tree
> > >self-describable at PCI boundary but AcpiDevAmlIf can be applied
> > >to other devices described in DSDT, that hang off the board.
> >
> > Sounds good!
> >
> > >> My end goal is to make the VT82xx south bridges compatible with x86
> and to bring them to feature parity with PIIX. For this, I need to
> implement the VIA ACPI controller proper, and since these south bridges are
> currently only used in MIPS and PowerPC contexts I'm feeling a bit
> uncomfortable having to drag in x86 assumptions into these devices.
> > >
> > >basic ACPI hardware (GPE/PM registers) code is relatively isolated,
> > >so you probably can implement that without touching piix much.
> > >(with little to no stubs).
> > >
> > >If you want to cleanup piix and free other targets from
> > >unfortunate ACPI/x86 specific dependencies, it would probably
> > >need another approach than presented here.
> > >
> > >ex:
> > >Isolating core(pristine) piix code in piix-basic class
> > >for PPC/MIPS use, and then branching/inheriting of it
> > >current piix class with all extra x86 'features' might
> > >work without breaking migration. (/me assuming cross
> > >version migration should work in this arrangement,
> > >though I won't bet on it)
> >
> > It seems to me that extending the PIIX4 PM class hierarchy with
> piix-basic is just a workaround for the root problem I mentioned above,
> which is the mixing of unrelated concerns into one interface. So let my try
> to factor out an AcpiCpuAmlIf from AcpiDeviceIfClass and see how it goes.
> See above, lets discuss it there.
>
> > Best regards,
> > Bernhard
> >
> > >
> > >> Best regards,
> > >> Bernhard
> > >>
> > >> >
> > >> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > >> >> ---
> > >> >>  hw/i386/acpi-common.h                |  7 +++++--
> > >> >>  include/hw/acpi/acpi_dev_interface.h |  2 --
> > >> >>  include/hw/acpi/cpu.h                |  6 +++++-
> > >> >>  include/hw/i386/pc.h                 |  4 ----
> > >> >>  hw/acpi/acpi-x86-stub.c              |  6 ------
> > >> >>  hw/acpi/cpu.c                        | 10 ++++------
> > >> >>  hw/acpi/piix4.c                      |  2 --
> > >> >>  hw/i386/acpi-build.c                 |  5 ++---
> > >> >>  hw/i386/acpi-common.c                |  5 ++---
> > >> >>  hw/i386/acpi-microvm.c               |  3 +--
> > >> >>  hw/i386/generic_event_device_x86.c   |  9 ---------
> > >> >>  hw/isa/lpc_ich9.c                    |  1 -
> > >> >>  12 files changed, 19 insertions(+), 41 deletions(-)
> > >> >>
> > >> >> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> > >> >> index a68825acf5..968d625d88 100644
> > >> >> --- a/hw/i386/acpi-common.h
> > >> >> +++ b/hw/i386/acpi-common.h
> > >> >> @@ -1,15 +1,18 @@
> > >> >>  #ifndef HW_I386_ACPI_COMMON_H
> > >> >>  #define HW_I386_ACPI_COMMON_H
> > >> >>
> > >> >> -#include "hw/acpi/acpi_dev_interface.h"
> > >> >>  #include "hw/acpi/bios-linker-loader.h"
> > >> >>  #include "hw/i386/x86.h"
> > >> >> +#include "hw/boards.h"
> > >> >>
> > >> >>  /* Default IOAPIC ID */
> > >> >>  #define ACPI_BUILD_IOAPIC_ID 0x0
> > >> >>
> > >> >> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> GArray *entry,
> > >> >> +                       bool force_enabled);
> > >> >> +
> > >> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > >> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> > >> >> +                     X86MachineState *x86ms,
> > >> >>                       const char *oem_id, const char
> *oem_table_id);
> > >> >>
> > >> >>  #endif
> > >> >> diff --git a/include/hw/acpi/acpi_dev_interface.h
> b/include/hw/acpi/acpi_dev_interface.h
> > >> >> index a1648220ff..ca92928124 100644
> > >> >> --- a/include/hw/acpi/acpi_dev_interface.h
> > >> >> +++ b/include/hw/acpi/acpi_dev_interface.h
> > >> >> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
> > >> >>      /* <public> */
> > >> >>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList
> ***list);
> > >> >>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits
> ev);
> > >> >> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids,
> GArray *entry,
> > >> >> -                     bool force_enabled);
> > >> >>  };
> > >> >>  #endif
> > >> >> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> > >> >> index 999caaf510..25b25bb594 100644
> > >> >> --- a/include/hw/acpi/cpu.h
> > >> >> +++ b/include/hw/acpi/cpu.h
> > >> >> @@ -15,6 +15,7 @@
> > >> >>  #include "hw/qdev-core.h"
> > >> >>  #include "hw/acpi/acpi.h"
> > >> >>  #include "hw/acpi/aml-build.h"
> > >> >> +#include "hw/boards.h"
> > >> >>  #include "hw/hotplug.h"
> > >> >>
> > >> >>  typedef struct AcpiCpuStatus {
> > >> >> @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
> > >> >>      const char *smi_path;
> > >> >>  } CPUHotplugFeatures;
> > >> >>
> > >> >> +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList
> *apic_ids,
> > >> >> +                            GArray *entry, bool force_enabled);
> > >> >> +
> > >> >>  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > >> >> -                    hwaddr io_base,
> > >> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> > >> >>                      const char *res_root,
> > >> >>                      const char *event_handler_method);
> > >> >>
> > >> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > >> >> index a0647165d1..a5cce88653 100644
> > >> >> --- a/include/hw/i386/pc.h
> > >> >> +++ b/include/hw/i386/pc.h
> > >> >> @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char
> *entry, uint8_t **data,
> > >> >>                                 int *data_len);
> > >> >>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t
> flash_size);
> > >> >>
> > >> >> -/* hw/i386/acpi-common.c */
> > >> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> > >> >> -                       GArray *entry, bool force_enabled);
> > >> >> -
> > >> >>  /* sgx.c */
> > >> >>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
> > >> >>
> > >> >> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> > >> >> index d0d399d26b..9662a594ad 100644
> > >> >> --- a/hw/acpi/acpi-x86-stub.c
> > >> >> +++ b/hw/acpi/acpi-x86-stub.c
> > >> >> @@ -1,12 +1,6 @@
> > >> >>  #include "qemu/osdep.h"
> > >> >> -#include "hw/i386/pc.h"
> > >> >>  #include "hw/i386/acpi-build.h"
> > >> >>
> > >> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> > >> >> -                       GArray *entry, bool force_enabled)
> > >> >> -{
> > >> >> -}
> > >> >> -
> > >> >>  Object *acpi_get_i386_pci_host(void)
> > >> >>  {
> > >> >>         return NULL;
> > >> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> > >> >> index 19c154d78f..db15f9278d 100644
> > >> >> --- a/hw/acpi/cpu.c
> > >> >> +++ b/hw/acpi/cpu.c
> > >> >> @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug =
> {
> > >> >>  #define CPU_FW_EJECT_EVENT "CEJF"
> > >> >>
> > >> >>  void build_cpus_aml(Aml *table, MachineState *machine,
> CPUHotplugFeatures opts,
> > >> >> -                    hwaddr io_base,
> > >> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> > >> >>                      const char *res_root,
> > >> >>                      const char *event_handler_method)
> > >> >>  {
> > >> >> @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> > >> >>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> > >> >>      const CPUArchIdList *arch_ids =
> mc->possible_cpu_arch_ids(machine);
> > >> >>      char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE,
> res_root);
> > >> >> -    Object *obj = object_resolve_path_type("",
> TYPE_ACPI_DEVICE_IF, NULL);
> > >> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
> > >> >> +
> > >> >> +    assert(madt_cpu);
> > >> >>
> > >> >>      cpu_ctrl_dev = aml_device("%s", cphp_res_path);
> > >> >>      {
> > >> >> @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState
> *machine, CPUHotplugFeatures opts,
> > >> >>              aml_append(dev, method);
> > >> >>
> > >> >>              /* build _MAT object */
> > >> >> -            assert(adevc && adevc->madt_cpu);
> > >> >> -            adevc->madt_cpu(i, arch_ids, madt_buf,
> > >> >> -                            true); /* set enabled flag */
> > >> >> +            madt_cpu(i, arch_ids, madt_buf, true /* set enabled
> flag */);
> > >> >>              aml_append(dev, aml_name_decl("_MAT",
> > >> >>                  aml_buffer(madt_buf->len, (uint8_t
> *)madt_buf->data)));
> > >> >>              g_array_free(madt_buf, true);
> > >> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > >> >> index 0a81f1ad93..4d0d4fdeeb 100644
> > >> >> --- a/hw/acpi/piix4.c
> > >> >> +++ b/hw/acpi/piix4.c
> > >> >> @@ -20,7 +20,6 @@
> > >> >>   */
> > >> >>
> > >> >>  #include "qemu/osdep.h"
> > >> >> -#include "hw/i386/pc.h"
> > >> >>  #include "hw/southbridge/piix.h"
> > >> >>  #include "hw/irq.h"
> > >> >>  #include "hw/isa/apm.h"
> > >> >> @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass
> *klass, void *data)
> > >> >>      hc->unplug = piix4_device_unplug_cb;
> > >> >>      adevc->ospm_status = piix4_ospm_status;
> > >> >>      adevc->send_event = piix4_send_gpe;
> > >> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> > >> >>  }
> > >> >>
> > >> >>  static const TypeInfo piix4_pm_info = {
> > >> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > >> >> index 127c4e2d50..0be3960a37 100644
> > >> >> --- a/hw/i386/acpi-build.c
> > >> >> +++ b/hw/i386/acpi-build.c
> > >> >> @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker
> *linker,
> > >> >>              .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
> > >> >>          };
> > >> >>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> > >> >> -                       "\\_SB.PCI0", "\\_GPE._E02");
> > >> >> +                       pc_madt_cpu_entry, "\\_SB.PCI0",
> "\\_GPE._E02");
> > >> >>      }
> > >> >>
> > >> >>      if (pcms->memhp_io_base && nr_mem) {
> > >> >> @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables,
> MachineState *machine)
> > >> >>
> > >> >>      acpi_add_table(table_offsets, tables_blob);
> > >> >>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> > >> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev),
> x86ms->oem_id,
> > >> >> -                    x86ms->oem_table_id);
> > >> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> > >> >>
> > >> >>  #ifdef CONFIG_ACPI_ERST
> > >> >>      {
> > >> >> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > >> >> index 52e5c1439a..aabf78092e 100644
> > >> >> --- a/hw/i386/acpi-common.c
> > >> >> +++ b/hw/i386/acpi-common.c
> > >> >> @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t
> src, uint32_t gsi, uint16_t flags)
> > >> >>   * 5.2.8 Multiple APIC Description Table
> > >> >>   */
> > >> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > >> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> > >> >> +                     X86MachineState *x86ms,
> > >> >>                       const char *oem_id, const char *oem_table_id)
> > >> >>  {
> > >> >>      int i;
> > >> >>      bool x2apic_mode = false;
> > >> >>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> > >> >>      const CPUArchIdList *apic_ids =
> mc->possible_cpu_arch_ids(MACHINE(x86ms));
> > >> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> > >> >>      AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> > >> >>                          .oem_table_id = oem_table_id };
> > >> >>
> > >> >> @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data,
> BIOSLinker *linker,
> > >> >>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */,
> 4); /* Flags */
> > >> >>
> > >> >>      for (i = 0; i < apic_ids->len; i++) {
> > >> >> -        adevc->madt_cpu(i, apic_ids, table_data, false);
> > >> >> +        pc_madt_cpu_entry(i, apic_ids, table_data, false);
> > >> >>          if (apic_ids->cpus[i].arch_id > 254) {
> > >> >>              x2apic_mode = true;
> > >> >>          }
> > >> >> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > >> >> index fb09185cbd..d8a444d06c 100644
> > >> >> --- a/hw/i386/acpi-microvm.c
> > >> >> +++ b/hw/i386/acpi-microvm.c
> > >> >> @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables
> *tables,
> > >> >>
> > >> >>      acpi_add_table(table_offsets, tables_blob);
> > >> >>      acpi_build_madt(tables_blob, tables->linker,
> X86_MACHINE(machine),
> > >> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev),
> x86ms->oem_id,
> > >> >> -                    x86ms->oem_table_id);
> > >> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> > >> >>
> > >> >>  #ifdef CONFIG_ACPI_ERST
> > >> >>      {
> > >> >> diff --git a/hw/i386/generic_event_device_x86.c
> b/hw/i386/generic_event_device_x86.c
> > >> >> index e26fb02a2e..8fc233e1f1 100644
> > >> >> --- a/hw/i386/generic_event_device_x86.c
> > >> >> +++ b/hw/i386/generic_event_device_x86.c
> > >> >> @@ -8,19 +8,10 @@
> > >> >>
> > >> >>  #include "qemu/osdep.h"
> > >> >>  #include "hw/acpi/generic_event_device.h"
> > >> >> -#include "hw/i386/pc.h"
> > >> >> -
> > >> >> -static void acpi_ged_x86_class_init(ObjectClass *class, void
> *data)
> > >> >> -{
> > >> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> > >> >> -
> > >> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> > >> >> -}
> > >> >>
> > >> >>  static const TypeInfo acpi_ged_x86_info = {
> > >> >>      .name          = TYPE_ACPI_GED_X86,
> > >> >>      .parent        = TYPE_ACPI_GED,
> > >> >> -    .class_init    = acpi_ged_x86_class_init,
> > >> >>      .interfaces = (InterfaceInfo[]) {
> > >> >>          { TYPE_HOTPLUG_HANDLER },
> > >> >>          { TYPE_ACPI_DEVICE_IF },
> > >> >> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> > >> >> index 8d541e2b54..0ab0a341be 100644
> > >> >> --- a/hw/isa/lpc_ich9.c
> > >> >> +++ b/hw/isa/lpc_ich9.c
> > >> >> @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass
> *klass, void *data)
> > >> >>      hc->unplug = ich9_pm_device_unplug_cb;
> > >> >>      adevc->ospm_status = ich9_pm_ospm_status;
> > >> >>      adevc->send_event = ich9_send_gpe;
> > >> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> > >> >>      amldevc->build_dev_aml = build_ich9_isa_aml;
> > >> >>  }
> > >> >>
> > >> >
> > >>
> > >
> >
>
>

--000000000000419a4d05f2c7f244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 20, 2023 at 5:34 PM Igor =
Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, 19 Jan 2023 14:47:41 +0000<br>
Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_blank"=
>shentey@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Am 18. Januar 2023 14:59:05 UTC schrieb Igor Mammedov &lt;<a href=3D"m=
ailto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;:<b=
r>
&gt; &gt;On Tue, 17 Jan 2023 00:30:23 +0000<br>
&gt; &gt;Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=
=3D"_blank">shentey@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; Am 16. Januar 2023 16:29:30 UTC schrieb Igor Mammedov &lt;<a =
href=3D"mailto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</=
a>&gt;:=C2=A0 <br>
&gt; &gt;&gt; &gt;On Mon, 16 Jan 2023 16:29:03 +0100<br>
&gt; &gt;&gt; &gt;Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com"=
 target=3D"_blank">shentey@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; This class attribute was always set to pc_madt_cpu_e=
ntry().<br>
&gt; &gt;&gt; &gt;&gt; pc_madt_cpu_entry() is architecture dependent and wa=
s assigned to the<br>
&gt; &gt;&gt; &gt;&gt; attribute even in architecture agnostic code such as=
 in hw/acpi/piix4.c<br>
&gt; &gt;&gt; &gt;&gt; and hw/isa/lpc_ich9. Not having to set madt_cpu ther=
e resolves the<br>
&gt; &gt;&gt; &gt;&gt; assumption that these device models are only ever us=
ed with ACPI on x86<br>
&gt; &gt;&gt; &gt;&gt; targets.<br>
&gt; &gt;&gt; &gt;&gt; <br>
&gt; &gt;&gt; &gt;&gt; The only target independent location where madt_cpu =
was called was hw/<br>
&gt; &gt;&gt; &gt;&gt; acpi/cpu.c. Here a function pointer can be passed vi=
a an argument<br>
&gt; &gt;&gt; &gt;&gt; instead. The other locations where it was called was=
 in x86-specific code<br>
&gt; &gt;&gt; &gt;&gt; where pc_madt_cpu_entry() can be used directly.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; While at it, move pc_madt_cpu_entry() from the publi=
c include/hw/i386/<br>
&gt; &gt;&gt; &gt;&gt; pc.h to the private hw/i386/acpi-common where it is =
also implemented.=C2=A0 =C2=A0 <br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;I&#39;m not sure about this approach,<br>
&gt; &gt;&gt; &gt;the callback is intend to be used not only by x86 but als=
o in<br>
&gt; &gt;&gt; &gt;the end by ARM (it&#39;s just that arm/virt CPU hotplug p=
atches are<br>
&gt; &gt;&gt; &gt;still work in progress and haven&#39;t been merged).=C2=
=A0 =C2=A0 <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; IIUC one would call the target-independent build_cpus_aml() f=
rom the ARM-specific build_madt(). There, one could pass a function pointer=
 to an ARM-specific madt_cpu_fn. Shouldn&#39;t that get us covered?=C2=A0 <=
br>
&gt; &gt;<br>
&gt; &gt;it will work in this case, but I don&#39;t like going back to rand=
om<br>
&gt; &gt;function pointer argument approach instead of using QOM and<br>
&gt; &gt;interfaces which is much better in describing expectations/contrac=
t <br>
&gt; &gt;for interfaces adn objects it&#39;s attached to.<br>
&gt; &gt;<br>
&gt; &gt;Howver that is not the reason why I&#39;m against this approach, s=
ee bellow.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;So I&#39;d prefer to keep AcpiDeviceIfClass::madt_cpu.<br=
>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;What&#39;s the end goal you are trying to achieve by gett=
ing<br>
&gt; &gt;&gt; &gt;rid of this callback?=C2=A0 =C2=A0 <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; ACPI controllers are in principle not x86-specific, yet our P=
IIX4 and ICH9 device models always assign an x86-specific function to AcpiD=
eviceIfClass::madt_cpu. That doesn&#39;t seem right because the device mode=
ls make assumptions about their usage contexts which they ideally shouldn&#=
39;t.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; In addition, it seems to me that ACPI controllers and AML gen=
eration should not be mixed: An ACPI controller deals with (hardware) event=
s while AML generation is usually a BIOS task to inject code into an OS. Th=
erefore, ACPI controllers don&#39;t seem to be the right place to assign AM=
L-generating functions because that doesn&#39;t match how reality works.=C2=
=A0 <br>
&gt; &gt;<br>
&gt; &gt;It would be nice to have pristine hardware-only device models<br>
&gt; &gt;and firmware composing ACPI tables like baremetal systems do<br>
&gt; &gt;(they have a luxury of fixed hardware which makes it way simpler),=
<br>
&gt; &gt;however it was not practical nor sustainable in mainstream virt ca=
se.<br>
&gt; &gt;That&#39;s the reason why ACPI tables (firmware) were moved into Q=
EMU (hardware).<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; To solve both issues, one could factor out e.g. an AmlDeviceI=
f from AcpiDeviceIf, so one would&#39;t force the device models to provide =
an madt_cpu. <br>
&gt; &gt;&gt; Then one could assign a target-specific AmlDeviceIfClass::mad=
t_cpu e.g. in board code.=C2=A0 <br>
&gt; &gt;ACPI tables in QEMU started this way, It stopped being maintainabl=
e<br>
&gt; &gt;at certain point, see below for more.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt;At the moment I don&#39;t see a need for a new interface, howe=
ver, since the function pointer works just fine: It frees the device models=
 from having to provide it and it is used in code which already deals with =
AML generation.=C2=A0 <br>
&gt; &gt;When the move happened, the bulk of ACPI code was as you suggest m=
ade<br>
&gt; &gt;as machine specific and it&#39;s still the case for the most of it=
.<br>
&gt; &gt;Then, with ease of adding new related features, it exploded into<b=
r>
&gt; &gt;I would say hard to maintain mess. Hence before adding more and<br=
>
&gt; &gt;making it worse, I introduced=C2=A0 call_dev_aml_func()/AcpiDevAml=
If<br>
&gt; &gt;and started refactoring PCI AML code. That simplified main PCI bus=
<br>
&gt; &gt;enumeration quite a bit.<br>
&gt; &gt;<br>
&gt; &gt;The new interface however does exactly opposite of what you are do=
ing,<br>
&gt; &gt;i.e. it pushes device specific AML generation into corresponding d=
evice<br>
&gt; &gt;model. It&#39;s not ideal as we have to provide stubs for targets =
where it&#39;s<br>
&gt; &gt;not needed. But stubs for target independent code is typical and p=
roven<br>
&gt; &gt;approach we use in QEMU for such cases and is relatively easy to m=
aintain.<br>
&gt; &gt;So I&#39;d call it a reasonable compromise.<br>
&gt; &gt;<br>
&gt; &gt;Recently posted series (that untangles generic PCI slots AML from<=
br>
&gt; &gt;ACPI PCI hotplug frankenstein) continues with AcpiDevAmlIf approac=
h <br>
&gt; &gt;and pushes more AML into target in-depended device models.=C2=A0 <=
br>
&gt; <br>
&gt; I fully agree with the introduction of AcpiDevAmlIf. In fact I was fol=
lowing your work closely since it helped me making the VT82xx south bridges=
 work with the PC machine. In order to make your approach even more elegant=
 and efficient I&#39;m following up with qbus_build_aml().<br>
<br>
Reviewed/acked it, thanks for nice cleanuup.<br>
<br>
&gt; This patch doesn&#39;t actually question the AcpiDevAmlIf. It rather q=
uestions the mixing of CPU-related AML concerns into the ACPI controllers w=
hich are a priori CPU-agnostic. The only reason for dragging x86 concerns i=
nto these device models is that the AcpiDeviceIfClass requires madt_cpu to =
be assigned. Here we can apply the &quot;interface segregation principle&qu=
ot; which is why I proposed factoring out a dedicated interface from the Ac=
piDeviceIfClass (and possibly have CPUs implement it). I think that this wo=
uld match your approach with AcpiDevAmlIf.<br>
<br>
There was and still is a reason for madt_cpu being part of AcpiDeviceIfClas=
s and x86-ed piix impl.<br>
<br>
(It might have been a poor choice to use acpi controller as hotplug control=
ler as well<br>
but that boat has sailed and can&#39;t be fixed without breaking ABI/migrat=
ion.)<br></blockquote><div><br></div><div>Could you please elaborate a bit =
on how the ABI is affected?=C2=A0 Migration seems clear to me.<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But as it is now, hotplug controller is an owner of CPU hotplug data<br>
on which ::madt_cpu relies.<br></blockquote><div><br></div><div>Could you p=
lease also elaborate a bit here on how hotplug and ::madt_cpu are coupled? =
When generating the AML, one could check if both AcpiDeviceIfClass and ::ma=
dt_cpu are available. There is code instantiating TYPE_ACPI_GED in ARM and =
Loongarch which does not set ::madt_cpu. In order to see what I mean, I&#39=
;ve prepared v4 of this series: <a href=3D"https://lore.kernel.org/qemu-dev=
el/20230121151941.24120-1-shentey@gmail.com">https://lore.kernel.org/qemu-d=
evel/20230121151941.24120-1-shentey@gmail.com</a></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
I&#39;d say the same about ::send_event hook which is only used in hotplug =
case<br>
(GPE events do not have predefined meaning)<br>
That only leaves AcpiDeviceIfClass::ospm_status, which in turn implicitly<b=
r>
depends on hotplug controller to provide status data.<br>
So question is why do you need AcpiDeviceIfClass for VIA, how much of it<br=
>
and how current impl. gets in the way of your goal?<br></blockquote><div><b=
r></div><div>I  would just like to get feature parity with PIIX. Do you sug=
gest taking a different approach which avoids the hotplug state in the ACPI=
 controller?</div><div><br></div><div>Thanks,</div><div>Bernhard<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt;And there is more coming on top of it (with the goal to make most<=
br>
&gt; &gt;of what we accumulated in PC/Q35 PCI ACPI code become generic enou=
gh<br>
&gt; &gt;to replace most of PCI related AML elsewhere (microvm, arm/virt,<b=
r>
&gt; &gt;whatever else that is interested in ACPI tables support).<br>
&gt; &gt;My ambition with this refactoring stops at making qdev device tree=
<br>
&gt; &gt;self-describable at PCI boundary but AcpiDevAmlIf can be applied<b=
r>
&gt; &gt;to other devices described in DSDT, that hang off the board.=C2=A0=
 <br>
&gt; <br>
&gt; Sounds good!<br>
&gt; <br>
&gt; &gt;&gt; My end goal is to make the VT82xx south bridges compatible wi=
th x86 and to bring them to feature parity with PIIX. For this, I need to i=
mplement the VIA ACPI controller proper, and since these south bridges are =
currently only used in MIPS and PowerPC contexts I&#39;m feeling a bit unco=
mfortable having to drag in x86 assumptions into these devices.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt;basic ACPI hardware (GPE/PM registers) code is relatively isolated=
,<br>
&gt; &gt;so you probably can implement that without touching piix much.<br>
&gt; &gt;(with little to no stubs).<br>
&gt; &gt;<br>
&gt; &gt;If you want to cleanup piix and free other targets from<br>
&gt; &gt;unfortunate ACPI/x86 specific dependencies, it would probably<br>
&gt; &gt;need another approach than presented here.<br>
&gt; &gt;<br>
&gt; &gt;ex:<br>
&gt; &gt;Isolating core(pristine) piix code in piix-basic class<br>
&gt; &gt;for PPC/MIPS use, and then branching/inheriting of it<br>
&gt; &gt;current piix class with all extra x86 &#39;features&#39; might<br>
&gt; &gt;work without breaking migration. (/me assuming cross<br>
&gt; &gt;version migration should work in this arrangement, <br>
&gt; &gt;though I won&#39;t bet on it)=C2=A0 <br>
&gt; <br>
&gt; It seems to me that extending the PIIX4 PM class hierarchy with piix-b=
asic is just a workaround for the root problem I mentioned above, which is =
the mixing of unrelated concerns into one interface. So let my try to facto=
r out an AcpiCpuAmlIf from AcpiDeviceIfClass and see how it goes.<br>
See above, lets discuss it there. <br>
<br>
&gt; Best regards,<br>
&gt; Bernhard<br>
&gt; <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; Best regards,<br>
&gt; &gt;&gt; Bernhard<br>
&gt; &gt;&gt;=C2=A0 =C2=A0<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailt=
o:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/i386/acpi-common.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++--<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 include/hw/acpi/acpi_dev_interface.h |=C2=A0 2=
 --<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 include/hw/acpi/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/acpi/acpi-x86-stub.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ------<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/acpi/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++------<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++---<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/i386/acpi-common.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++---<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/i386/acpi-microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/i386/generic_event_device_x86.c=C2=A0 =C2=
=A0|=C2=A0 9 ---------<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 hw/isa/lpc_ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 12 files changed, 19 insertions(+), 41 deletio=
ns(-)<br>
&gt; &gt;&gt; &gt;&gt; <br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-co=
mmon.h<br>
&gt; &gt;&gt; &gt;&gt; index a68825acf5..968d625d88 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/i386/acpi-common.h<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/i386/acpi-common.h<br>
&gt; &gt;&gt; &gt;&gt; @@ -1,15 +1,18 @@<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #ifndef HW_I386_ACPI_COMMON_H<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #define HW_I386_ACPI_COMMON_H<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; -#include &quot;hw/acpi/acpi_dev_interface.h&quot;<b=
r>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/acpi/bios-linker-loader.h&qu=
ot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/i386/x86.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; +#include &quot;hw/boards.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 /* Default IOAPIC ID */<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #define ACPI_BUILD_IOAPIC_ID 0x0<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; +void pc_madt_cpu_entry(int uid, const CPUArchIdList=
 *apic_ids, GArray *entry,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool force_enabled);<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void acpi_build_madt(GArray *table_data, BIOSL=
inker *linker,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0X86MachineState *x86ms, AcpiDeviceIf *adev,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0X86MachineState *x86ms,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *oem_id, const char *oem_table_id=
);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/include/hw/acpi/acpi_dev_interface.h b/=
include/hw/acpi/acpi_dev_interface.h<br>
&gt; &gt;&gt; &gt;&gt; index a1648220ff..ca92928124 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/include/hw/acpi/acpi_dev_interface.h<br>
&gt; &gt;&gt; &gt;&gt; +++ b/include/hw/acpi/acpi_dev_interface.h<br>
&gt; &gt;&gt; &gt;&gt; @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* &lt;public&gt; */<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 void (*ospm_status)(AcpiDeviceIf=
 *adev, ACPIOSTInfoList ***list);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 void (*send_event)(AcpiDeviceIf =
*adev, AcpiEventStatusBits ev);<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 void (*madt_cpu)(int uid, const CPUAr=
chIdList *apic_ids, GArray *entry,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool force_enabled);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 };<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi=
/cpu.h<br>
&gt; &gt;&gt; &gt;&gt; index 999caaf510..25b25bb594 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/include/hw/acpi/cpu.h<br>
&gt; &gt;&gt; &gt;&gt; +++ b/include/hw/acpi/cpu.h<br>
&gt; &gt;&gt; &gt;&gt; @@ -15,6 +15,7 @@<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/qdev-core.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/acpi/acpi.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/acpi/aml-build.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; +#include &quot;hw/boards.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/hotplug.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 typedef struct AcpiCpuStatus {<br>
&gt; &gt;&gt; &gt;&gt; @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures=
 {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *smi_path;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 } CPUHotplugFeatures;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; +typedef void (*madt_cpu_fn)(int uid, const CPUArchI=
dList *apic_ids,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GArray *entry, bool force_=
enabled);<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void build_cpus_aml(Aml *table, MachineState *=
machine, CPUHotplugFeatures opts,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hwaddr io_base,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hwaddr io_base, madt_cpu_fn madt_cpu,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *res_root,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *event_handler_method);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; diff --git a/include/hw/i386/pc.h b/include/hw/i386/=
pc.h<br>
&gt; &gt;&gt; &gt;&gt; index a0647165d1..a5cce88653 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/include/hw/i386/pc.h<br>
&gt; &gt;&gt; &gt;&gt; +++ b/include/hw/i386/pc.h<br>
&gt; &gt;&gt; &gt;&gt; @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(=
const char *entry, uint8_t **data,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *data=
_len);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void pc_system_parse_ovmf_flash(uint8_t *flash=
_ptr, size_t flash_size);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; -/* hw/i386/acpi-common.c */<br>
&gt; &gt;&gt; &gt;&gt; -void pc_madt_cpu_entry(int uid, const CPUArchIdList=
 *apic_ids,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GArray *entry, bool force_enabled);<br>
&gt; &gt;&gt; &gt;&gt; -<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 /* sgx.c */<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void pc_machine_init_sgx_epc(PCMachineState *p=
cms);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-=
x86-stub.c<br>
&gt; &gt;&gt; &gt;&gt; index d0d399d26b..9662a594ad 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/acpi/acpi-x86-stub.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/acpi/acpi-x86-stub.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -1,12 +1,6 @@<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/i386/acpi-build.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; -void pc_madt_cpu_entry(int uid, const CPUArchIdList=
 *apic_ids,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GArray *entry, bool force_enabled)<br>
&gt; &gt;&gt; &gt;&gt; -{<br>
&gt; &gt;&gt; &gt;&gt; -}<br>
&gt; &gt;&gt; &gt;&gt; -<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 Object *acpi_get_i386_pci_host(void)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c<br>
&gt; &gt;&gt; &gt;&gt; index 19c154d78f..db15f9278d 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/acpi/cpu.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/acpi/cpu.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -338,7 +338,7 @@ const VMStateDescription vmstate=
_cpu_hotplug =3D {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #define CPU_FW_EJECT_EVENT &quot;CEJF&quot;<br=
>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void build_cpus_aml(Aml *table, MachineState *=
machine, CPUHotplugFeatures opts,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hwaddr io_base,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hwaddr io_base, madt_cpu_fn madt_cpu,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *res_root,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *event_handler_method)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt; @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, =
MachineState *machine, CPUHotplugFeatures opts,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET=
_CLASS(machine);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const CPUArchIdList *arch_ids =
=3D mc-&gt;possible_cpu_arch_ids(machine);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 char *cphp_res_path =3D g_strdup=
_printf(&quot;%s.&quot; CPUHP_RES_DEVICE, res_root);<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 Object *obj =3D object_resolve_path_t=
ype(&quot;&quot;, TYPE_ACPI_DEVICE_IF, NULL);<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEV=
ICE_IF_GET_CLASS(obj);<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(madt_cpu);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu_ctrl_dev =3D aml_device(&quo=
t;%s&quot;, cphp_res_path);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt; @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, =
MachineState *machine, CPUHotplugFeatures opts,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_=
append(dev, method);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* b=
uild _MAT object */<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ad=
evc &amp;&amp; adevc-&gt;madt_cpu);<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adevc-&gt=
;madt_cpu(i, arch_ids, madt_buf,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 true); /* set enabled flag=
 */<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 madt_cpu(=
i, arch_ids, madt_buf, true /* set enabled flag */);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_=
append(dev, aml_name_decl(&quot;_MAT&quot;,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 aml_buffer(madt_buf-&gt;len, (uint8_t *)madt_buf-&gt;data)));<br=
>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_ar=
ray_free(madt_buf, true);<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c<br>
&gt; &gt;&gt; &gt;&gt; index 0a81f1ad93..4d0d4fdeeb 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/acpi/piix4.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/acpi/piix4.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -20,7 +20,6 @@<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/southbridge/piix.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/irq.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/isa/apm.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; @@ -643,7 +642,6 @@ static void piix4_pm_class_init(=
ObjectClass *klass, void *data)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 hc-&gt;unplug =3D piix4_device_u=
nplug_cb;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;ospm_status =3D piix4_=
ospm_status;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;send_event =3D piix4_s=
end_gpe;<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_en=
try;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 static const TypeInfo piix4_pm_info =3D {<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-bui=
ld.c<br>
&gt; &gt;&gt; &gt;&gt; index 127c4e2d50..0be3960a37 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/i386/acpi-build.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/i386/acpi-build.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data,=
 BIOSLinker *linker,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fw_=
unplugs_cpu =3D pm-&gt;smi_on_cpu_unplug,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_cpus_aml(dsd=
t, machine, opts, pm-&gt;cpu_hp_io_base,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\\_SB.PCI0&quot;, &quot;\\_GPE._E02=
&quot;);<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc_madt_cpu_entry, &quot;\\_SB.PCI0&quot;=
, &quot;\\_GPE._E02&quot;);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (pcms-&gt;memhp_io_base &amp;=
&amp; nr_mem) {<br>
&gt; &gt;&gt; &gt;&gt; @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTable=
s *tables, MachineState *machine)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_add_table(table_offsets, ta=
bles_blob);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_build_madt(tables_blob, tab=
les-&gt;linker, x86ms,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ACPI_DEVICE_IF(x86ms-&gt;acpi_dev), x86ms-&gt;oem_id,<=
br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_table_id);<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_id, x86ms-&gt;oem_table_id);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #ifdef CONFIG_ACPI_ERST<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-co=
mmon.c<br>
&gt; &gt;&gt; &gt;&gt; index 52e5c1439a..aabf78092e 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/i386/acpi-common.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/i386/acpi-common.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -94,14 +94,13 @@ build_xrupt_override(GArray *ent=
ry, uint8_t src, uint32_t gsi, uint16_t flags)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0* 5.2.8 Multiple APIC Description Table<=
br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 void acpi_build_madt(GArray *table_data, BIOSL=
inker *linker,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0X86MachineState *x86ms, AcpiDeviceIf *adev,<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0X86MachineState *x86ms,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *oem_id, const char *oem_table_id=
)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool x2apic_mode =3D false;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET=
_CLASS(x86ms);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const CPUArchIdList *apic_ids =
=3D mc-&gt;possible_cpu_arch_ids(MACHINE(x86ms));<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEV=
ICE_IF_GET_CLASS(adev);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 AcpiTable table =3D { .sig =3D &=
quot;APIC&quot;, .rev =3D 1, .oem_id =3D oem_id,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .oem_table_id =3D oem_table_id };<br=
>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt; @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *tab=
le_data, BIOSLinker *linker,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 build_append_int_noprefix(table_=
data, 1 /* PCAT_COMPAT */, 4); /* Flags */<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; apic_ids-&g=
t;len; i++) {<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 adevc-&gt;madt_cpu(i, a=
pic_ids, table_data, false);<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc_madt_cpu_entry(i, ap=
ic_ids, table_data, false);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (apic_ids-&gt;c=
pus[i].arch_id &gt; 254) {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x2ap=
ic_mode =3D true;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-m=
icrovm.c<br>
&gt; &gt;&gt; &gt;&gt; index fb09185cbd..d8a444d06c 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/i386/acpi-microvm.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/i386/acpi-microvm.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -213,8 +213,7 @@ static void acpi_build_microvm(A=
cpiBuildTables *tables,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_add_table(table_offsets, ta=
bles_blob);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 acpi_build_madt(tables_blob, tab=
les-&gt;linker, X86_MACHINE(machine),<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ACPI_DEVICE_IF(x86ms-&gt;acpi_dev), x86ms-&gt;oem_id,<=
br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_table_id);<br>
&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 x86ms-&gt;oem_id, x86ms-&gt;oem_table_id);<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #ifdef CONFIG_ACPI_ERST<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/i386/generic_event_device_x86.c b/hw=
/i386/generic_event_device_x86.c<br>
&gt; &gt;&gt; &gt;&gt; index e26fb02a2e..8fc233e1f1 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/i386/generic_event_device_x86.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/i386/generic_event_device_x86.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -8,19 +8,10 @@<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 #include &quot;hw/acpi/generic_event_device.h&=
quot;<br>
&gt; &gt;&gt; &gt;&gt; -#include &quot;hw/i386/pc.h&quot;<br>
&gt; &gt;&gt; &gt;&gt; -<br>
&gt; &gt;&gt; &gt;&gt; -static void acpi_ged_x86_class_init(ObjectClass *cl=
ass, void *data)<br>
&gt; &gt;&gt; &gt;&gt; -{<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 AcpiDeviceIfClass *adevc =3D ACPI_DEV=
ICE_IF_CLASS(class);<br>
&gt; &gt;&gt; &gt;&gt; -<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_en=
try;<br>
&gt; &gt;&gt; &gt;&gt; -}<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 static const TypeInfo acpi_ged_x86_info =3D {<=
br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D TYPE_ACPI_GED_X86,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D TYPE_ACPI_GED,<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D acpi_ged=
_x86_class_init,<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]=
) {<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_HOTPLUG_HAN=
DLER },<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ACPI_DEVICE=
_IF },<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c<b=
r>
&gt; &gt;&gt; &gt;&gt; index 8d541e2b54..0ab0a341be 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/hw/isa/lpc_ich9.c<br>
&gt; &gt;&gt; &gt;&gt; +++ b/hw/isa/lpc_ich9.c<br>
&gt; &gt;&gt; &gt;&gt; @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(=
ObjectClass *klass, void *data)<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 hc-&gt;unplug =3D ich9_pm_device=
_unplug_cb;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;ospm_status =3D ich9_p=
m_ospm_status;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;send_event =3D ich9_se=
nd_gpe;<br>
&gt; &gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 adevc-&gt;madt_cpu =3D pc_madt_cpu_en=
try;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 amldevc-&gt;build_dev_aml =3D bu=
ild_ich9_isa_aml;<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt;&gt;=C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000419a4d05f2c7f244--

