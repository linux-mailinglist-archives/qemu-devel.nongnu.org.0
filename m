Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14566D3A0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 01:32:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZsD-00052P-PK; Mon, 16 Jan 2023 19:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHZs4-00051r-9i; Mon, 16 Jan 2023 19:30:36 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHZs1-0000iB-OC; Mon, 16 Jan 2023 19:30:36 -0500
Received: by mail-ej1-x62c.google.com with SMTP id cf18so65280804ejb.5;
 Mon, 16 Jan 2023 16:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwx0mxQxcabbmENoZbgrdbqdGxJQDWur6HX2sIJGB8E=;
 b=jWRelBP0uzHD6HWUSBgehQFa3QqMTLlyp6nYkR/EsdF4I+LN0LU8+LKM7toLzfinvr
 3gp6fnk4vIZCFTnlv9pi4sgk1WfNsBc1Kkko3SwYVdVYJ0GccgLBBN/Zbx3cZL9QDkst
 O9+jy+WBevZoDJs9UHQIhStgpIYM7NVmx9TRZ1NdTfn1n23CpXBmC6ta2QiUUftsX+kF
 402EZq6LaF1BORhRpwdiBMQP73uuYUXKOskdZCuVlajgp7C6WbOV3KjdvVJJ15d4WGan
 pLd5T9zy6IbwJsNkizrjiDuYf5a2puXC2Lxf151YyVXWLErLesea5kZlEKyH3EUSm0Pp
 lznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwx0mxQxcabbmENoZbgrdbqdGxJQDWur6HX2sIJGB8E=;
 b=KowRxORYJ23uJdckXT5v0gQfF43MHHJ9VlsDxDIkTtGlRHmJpiXLM7KVJ4wACQJEoQ
 1vtsWgo5IYR/hIbxnnPgC6PspdZtWSxX3b9qyqdmRvZ6mS2Yg3GBsSNwoaYx7/n1ruDF
 E48Etcvca1QwdfAjfWihnen640bAJ3F5mSf7NkRfSbiWEEHvT5uethXJ/tPEVQdf0gRn
 4BvCE/SDtcPHF+mPHY2XUhp3inedezHpTQIuHasJyi0x0QyT+EkiGwoyAaHbu7OxnHpl
 rMGLF6HklNuhVXeTfEni6Sa4DPv0RpuBj1bvUtm4LloLEMShgVsQI2gnrrg8gKYsUFpY
 S/kQ==
X-Gm-Message-State: AFqh2kqOr+XF1FyHlHQtuFXR6Fp5gBuBh1h6q+rUogT7Isa8uJntIGEU
 FFVHW92Ala14vDyRPsXvtL0=
X-Google-Smtp-Source: AMrXdXt7GVN0j7cHwekv9a6glMEQcnuhATLz65dBhZ2lUsJtitdUTTb+kEktXPGvpJeFyw+K2fPB9A==
X-Received: by 2002:a17:906:c1c6:b0:819:2756:e090 with SMTP id
 bw6-20020a170906c1c600b008192756e090mr840544ejb.50.1673915431546; 
 Mon, 16 Jan 2023 16:30:31 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-002-230.89.12.pool.telefonica.de.
 [89.12.2.230]) by smtp.gmail.com with ESMTPSA id
 ia2-20020a170907a06200b00868c5005e13sm5152671ejc.98.2023.01.16.16.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 16:30:31 -0800 (PST)
Date: Tue, 17 Jan 2023 00:30:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/7=5D_hw/acpi/acpi=5Fdev=5Finter?=
 =?US-ASCII?Q?face=3A_Resolve_AcpiDeviceIfClass=3A=3Amadt=5Fcpu?=
In-Reply-To: <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-3-shentey@gmail.com>
 <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
Message-ID: <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 16=2E Januar 2023 16:29:30 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Mon, 16 Jan 2023 16:29:03 +0100
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> This class attribute was always set to pc_madt_cpu_entry()=2E
>> pc_madt_cpu_entry() is architecture dependent and was assigned to the
>> attribute even in architecture agnostic code such as in hw/acpi/piix4=
=2Ec
>> and hw/isa/lpc_ich9=2E Not having to set madt_cpu there resolves the
>> assumption that these device models are only ever used with ACPI on x86
>> targets=2E
>>=20
>> The only target independent location where madt_cpu was called was hw/
>> acpi/cpu=2Ec=2E Here a function pointer can be passed via an argument
>> instead=2E The other locations where it was called was in x86-specific =
code
>> where pc_madt_cpu_entry() can be used directly=2E
>>
>> While at it, move pc_madt_cpu_entry() from the public include/hw/i386/
>> pc=2Eh to the private hw/i386/acpi-common where it is also implemented=
=2E
>
>I'm not sure about this approach,
>the callback is intend to be used not only by x86 but also in
>the end by ARM (it's just that arm/virt CPU hotplug patches are
>still work in progress and haven't been merged)=2E

IIUC one would call the target-independent build_cpus_aml() from the ARM-s=
pecific build_madt()=2E There, one could pass a function pointer to an ARM-=
specific madt_cpu_fn=2E Shouldn't that get us covered?

>
>So I'd prefer to keep AcpiDeviceIfClass::madt_cpu=2E
>
>What's the end goal you are trying to achieve by getting
>rid of this callback?

ACPI controllers are in principle not x86-specific, yet our PIIX4 and ICH9=
 device models always assign an x86-specific function to AcpiDeviceIfClass:=
:madt_cpu=2E That doesn't seem right because the device models make assumpt=
ions about their usage contexts which they ideally shouldn't=2E

In addition, it seems to me that ACPI controllers and AML generation shoul=
d not be mixed: An ACPI controller deals with (hardware) events while AML g=
eneration is usually a BIOS task to inject code into an OS=2E Therefore, AC=
PI controllers don't seem to be the right place to assign AML-generating fu=
nctions because that doesn't match how reality works=2E

To solve both issues, one could factor out e=2Eg=2E an AmlDeviceIf from Ac=
piDeviceIf, so one would't force the device models to provide an madt_cpu=
=2E Then one could assign a target-specific AmlDeviceIfClass::madt_cpu e=2E=
g=2E in board code=2E At the moment I don't see a need for a new interface,=
 however, since the function pointer works just fine: It frees the device m=
odels from having to provide it and it is used in code which already deals =
with AML generation=2E

My end goal is to make the VT82xx south bridges compatible with x86 and to=
 bring them to feature parity with PIIX=2E For this, I need to implement th=
e VIA ACPI controller proper, and since these south bridges are currently o=
nly used in MIPS and PowerPC contexts I'm feeling a bit uncomfortable havin=
g to drag in x86 assumptions into these devices=2E

Best regards,
Bernhard

>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/i386/acpi-common=2Eh                |  7 +++++--
>>  include/hw/acpi/acpi_dev_interface=2Eh |  2 --
>>  include/hw/acpi/cpu=2Eh                |  6 +++++-
>>  include/hw/i386/pc=2Eh                 |  4 ----
>>  hw/acpi/acpi-x86-stub=2Ec              |  6 ------
>>  hw/acpi/cpu=2Ec                        | 10 ++++------
>>  hw/acpi/piix4=2Ec                      |  2 --
>>  hw/i386/acpi-build=2Ec                 |  5 ++---
>>  hw/i386/acpi-common=2Ec                |  5 ++---
>>  hw/i386/acpi-microvm=2Ec               |  3 +--
>>  hw/i386/generic_event_device_x86=2Ec   |  9 ---------
>>  hw/isa/lpc_ich9=2Ec                    |  1 -
>>  12 files changed, 19 insertions(+), 41 deletions(-)
>>=20
>> diff --git a/hw/i386/acpi-common=2Eh b/hw/i386/acpi-common=2Eh
>> index a68825acf5=2E=2E968d625d88 100644
>> --- a/hw/i386/acpi-common=2Eh
>> +++ b/hw/i386/acpi-common=2Eh
>> @@ -1,15 +1,18 @@
>>  #ifndef HW_I386_ACPI_COMMON_H
>>  #define HW_I386_ACPI_COMMON_H
>> =20
>> -#include "hw/acpi/acpi_dev_interface=2Eh"
>>  #include "hw/acpi/bios-linker-loader=2Eh"
>>  #include "hw/i386/x86=2Eh"
>> +#include "hw/boards=2Eh"
>> =20
>>  /* Default IOAPIC ID */
>>  #define ACPI_BUILD_IOAPIC_ID 0x0
>> =20
>> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GArray =
*entry,
>> +                       bool force_enabled);
>> +
>>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
>> +                     X86MachineState *x86ms,
>>                       const char *oem_id, const char *oem_table_id);
>> =20
>>  #endif
>> diff --git a/include/hw/acpi/acpi_dev_interface=2Eh b/include/hw/acpi/a=
cpi_dev_interface=2Eh
>> index a1648220ff=2E=2Eca92928124 100644
>> --- a/include/hw/acpi/acpi_dev_interface=2Eh
>> +++ b/include/hw/acpi/acpi_dev_interface=2Eh
>> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
>>      /* <public> */
>>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
>>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
>> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *e=
ntry,
>> -                     bool force_enabled);
>>  };
>>  #endif
>> diff --git a/include/hw/acpi/cpu=2Eh b/include/hw/acpi/cpu=2Eh
>> index 999caaf510=2E=2E25b25bb594 100644
>> --- a/include/hw/acpi/cpu=2Eh
>> +++ b/include/hw/acpi/cpu=2Eh
>> @@ -15,6 +15,7 @@
>>  #include "hw/qdev-core=2Eh"
>>  #include "hw/acpi/acpi=2Eh"
>>  #include "hw/acpi/aml-build=2Eh"
>> +#include "hw/boards=2Eh"
>>  #include "hw/hotplug=2Eh"
>> =20
>>  typedef struct AcpiCpuStatus {
>> @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
>>      const char *smi_path;
>>  } CPUHotplugFeatures;
>> =20
>> +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
>> +                            GArray *entry, bool force_enabled);
>> +
>>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatu=
res opts,
>> -                    hwaddr io_base,
>> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
>>                      const char *res_root,
>>                      const char *event_handler_method);
>> =20
>> diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>> index a0647165d1=2E=2Ea5cce88653 100644
>> --- a/include/hw/i386/pc=2Eh
>> +++ b/include/hw/i386/pc=2Eh
>> @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entry, =
uint8_t **data,
>>                                 int *data_len);
>>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)=
;
>> =20
>> -/* hw/i386/acpi-common=2Ec */
>> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>> -                       GArray *entry, bool force_enabled);
>> -
>>  /* sgx=2Ec */
>>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>> =20
>> diff --git a/hw/acpi/acpi-x86-stub=2Ec b/hw/acpi/acpi-x86-stub=2Ec
>> index d0d399d26b=2E=2E9662a594ad 100644
>> --- a/hw/acpi/acpi-x86-stub=2Ec
>> +++ b/hw/acpi/acpi-x86-stub=2Ec
>> @@ -1,12 +1,6 @@
>>  #include "qemu/osdep=2Eh"
>> -#include "hw/i386/pc=2Eh"
>>  #include "hw/i386/acpi-build=2Eh"
>> =20
>> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>> -                       GArray *entry, bool force_enabled)
>> -{
>> -}
>> -
>>  Object *acpi_get_i386_pci_host(void)
>>  {
>>         return NULL;
>> diff --git a/hw/acpi/cpu=2Ec b/hw/acpi/cpu=2Ec
>> index 19c154d78f=2E=2Edb15f9278d 100644
>> --- a/hw/acpi/cpu=2Ec
>> +++ b/hw/acpi/cpu=2Ec
>> @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug =3D {
>>  #define CPU_FW_EJECT_EVENT "CEJF"
>> =20
>>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatu=
res opts,
>> -                    hwaddr io_base,
>> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
>>                      const char *res_root,
>>                      const char *event_handler_method)
>>  {
>> @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState *machi=
ne, CPUHotplugFeatures opts,
>>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(machin=
e);
>>      char *cphp_res_path =3D g_strdup_printf("%s=2E" CPUHP_RES_DEVICE, =
res_root);
>> -    Object *obj =3D object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, =
NULL);
>> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(obj);
>> +
>> +    assert(madt_cpu);
>> =20
>>      cpu_ctrl_dev =3D aml_device("%s", cphp_res_path);
>>      {
>> @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState *machi=
ne, CPUHotplugFeatures opts,
>>              aml_append(dev, method);
>> =20
>>              /* build _MAT object */
>> -            assert(adevc && adevc->madt_cpu);
>> -            adevc->madt_cpu(i, arch_ids, madt_buf,
>> -                            true); /* set enabled flag */
>> +            madt_cpu(i, arch_ids, madt_buf, true /* set enabled flag *=
/);
>>              aml_append(dev, aml_name_decl("_MAT",
>>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)))=
;
>>              g_array_free(madt_buf, true);
>> diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>> index 0a81f1ad93=2E=2E4d0d4fdeeb 100644
>> --- a/hw/acpi/piix4=2Ec
>> +++ b/hw/acpi/piix4=2Ec
>> @@ -20,7 +20,6 @@
>>   */
>> =20
>>  #include "qemu/osdep=2Eh"
>> -#include "hw/i386/pc=2Eh"
>>  #include "hw/southbridge/piix=2Eh"
>>  #include "hw/irq=2Eh"
>>  #include "hw/isa/apm=2Eh"
>> @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *klass,=
 void *data)
>>      hc->unplug =3D piix4_device_unplug_cb;
>>      adevc->ospm_status =3D piix4_ospm_status;
>>      adevc->send_event =3D piix4_send_gpe;
>> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>>  }
>> =20
>>  static const TypeInfo piix4_pm_info =3D {
>> diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>> index 127c4e2d50=2E=2E0be3960a37 100644
>> --- a/hw/i386/acpi-build=2Ec
>> +++ b/hw/i386/acpi-build=2Ec
>> @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>>              =2Efw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
>>          };
>>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>> -                       "\\_SB=2EPCI0", "\\_GPE=2E_E02");
>> +                       pc_madt_cpu_entry, "\\_SB=2EPCI0", "\\_GPE=2E_E=
02");
>>      }
>> =20
>>      if (pcms->memhp_io_base && nr_mem) {
>> @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables, MachineS=
tate *machine)
>> =20
>>      acpi_add_table(table_offsets, tables_blob);
>>      acpi_build_madt(tables_blob, tables->linker, x86ms,
>> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>> -                    x86ms->oem_table_id);
>> +                    x86ms->oem_id, x86ms->oem_table_id);
>> =20
>>  #ifdef CONFIG_ACPI_ERST
>>      {
>> diff --git a/hw/i386/acpi-common=2Ec b/hw/i386/acpi-common=2Ec
>> index 52e5c1439a=2E=2Eaabf78092e 100644
>> --- a/hw/i386/acpi-common=2Ec
>> +++ b/hw/i386/acpi-common=2Ec
>> @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t src, ui=
nt32_t gsi, uint16_t flags)
>>   * 5=2E2=2E8 Multiple APIC Description Table
>>   */
>>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
>> +                     X86MachineState *x86ms,
>>                       const char *oem_id, const char *oem_table_id)
>>  {
>>      int i;
>>      bool x2apic_mode =3D false;
>>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHIN=
E(x86ms));
>> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
>>      AcpiTable table =3D { =2Esig =3D "APIC", =2Erev =3D 1, =2Eoem_id =
=3D oem_id,
>>                          =2Eoem_table_id =3D oem_table_id };
>> =20
>> @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker=
 *linker,
>>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* =
Flags */
>> =20
>>      for (i =3D 0; i < apic_ids->len; i++) {
>> -        adevc->madt_cpu(i, apic_ids, table_data, false);
>> +        pc_madt_cpu_entry(i, apic_ids, table_data, false);
>>          if (apic_ids->cpus[i]=2Earch_id > 254) {
>>              x2apic_mode =3D true;
>>          }
>> diff --git a/hw/i386/acpi-microvm=2Ec b/hw/i386/acpi-microvm=2Ec
>> index fb09185cbd=2E=2Ed8a444d06c 100644
>> --- a/hw/i386/acpi-microvm=2Ec
>> +++ b/hw/i386/acpi-microvm=2Ec
>> @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables *tab=
les,
>> =20
>>      acpi_add_table(table_offsets, tables_blob);
>>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
>> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>> -                    x86ms->oem_table_id);
>> +                    x86ms->oem_id, x86ms->oem_table_id);
>> =20
>>  #ifdef CONFIG_ACPI_ERST
>>      {
>> diff --git a/hw/i386/generic_event_device_x86=2Ec b/hw/i386/generic_eve=
nt_device_x86=2Ec
>> index e26fb02a2e=2E=2E8fc233e1f1 100644
>> --- a/hw/i386/generic_event_device_x86=2Ec
>> +++ b/hw/i386/generic_event_device_x86=2Ec
>> @@ -8,19 +8,10 @@
>> =20
>>  #include "qemu/osdep=2Eh"
>>  #include "hw/acpi/generic_event_device=2Eh"
>> -#include "hw/i386/pc=2Eh"
>> -
>> -static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
>> -{
>> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(class);
>> -
>> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>> -}
>> =20
>>  static const TypeInfo acpi_ged_x86_info =3D {
>>      =2Ename          =3D TYPE_ACPI_GED_X86,
>>      =2Eparent        =3D TYPE_ACPI_GED,
>> -    =2Eclass_init    =3D acpi_ged_x86_class_init,
>>      =2Einterfaces =3D (InterfaceInfo[]) {
>>          { TYPE_HOTPLUG_HANDLER },
>>          { TYPE_ACPI_DEVICE_IF },
>> diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>> index 8d541e2b54=2E=2E0ab0a341be 100644
>> --- a/hw/isa/lpc_ich9=2Ec
>> +++ b/hw/isa/lpc_ich9=2Ec
>> @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *klass,=
 void *data)
>>      hc->unplug =3D ich9_pm_device_unplug_cb;
>>      adevc->ospm_status =3D ich9_pm_ospm_status;
>>      adevc->send_event =3D ich9_send_gpe;
>> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>>      amldevc->build_dev_aml =3D build_ich9_isa_aml;
>>  }
>> =20
>

