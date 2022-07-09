Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48A56CB74
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 22:52:31 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAHRF-0003AK-8L
	for lists+qemu-devel@lfdr.de; Sat, 09 Jul 2022 16:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oAHQI-0002W8-53
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 16:51:30 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oAHQG-0002fV-5F
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 16:51:29 -0400
Received: by mail-ed1-x536.google.com with SMTP id fd6so2190255edb.5
 for <qemu-devel@nongnu.org>; Sat, 09 Jul 2022 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=SZy6A5MBI5f5cteAyZukbJrVeHUXG9I7g1jO/N11ET0=;
 b=kqloik9JZhm4BtjwvzDlQOxrbBbCaQt1BYh0LIKUtZrYIy3MT6fLjsnPlB5SysVa/F
 vovHz8nvLleoZTpp/U4RjYLQx/k3cDo7wDvrfsZcGCAo4k/tqq8FeaaXkDq5S7/DVq4P
 xG1i6iJ5ltorRMJE20a+gcV03+YaSq8nyED2KpLq4m10Ejh947A3+o5T2+C4L2QPdzK8
 g9m3EfcofJ+aIaqnzEq2/QFr6OwVEPlv52Kea40KeF/3zJQoybQZMwlIGUgGDn/cUFvp
 PJCkeoI4q77t4ykhgBqUwQ84Qp4dojvzv5ORQahkPvAozj0NGKX/i99MMocrFIUmLj+s
 bR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=SZy6A5MBI5f5cteAyZukbJrVeHUXG9I7g1jO/N11ET0=;
 b=0rEdED8xbTQiBmXo7NXVFBfz5R5r+wLFlSTeWbd3jPhmLZt/vJLyCtpIriC2DcCyI0
 6MCWYLuZX6GPfDgIEPcTsN7URNPBdLa8js/CqOub6VNMqAc92HOwh2dRFqRMl43jRTDc
 XwyCu8/bA3ZbP8EGxKRt9+peT7v8FFrSUMGntdUE+rLLk9ENSHxaRGTaNH9gA6R8xvxq
 8N71S8JElz/74+OQskrYXbwqeN799VlMbSMP2GdCxCv2Tzap4Yan1m8ZsR6Cb4X7kSN6
 vRRDAms5flA/5fEYZAVLmTa3ZUxbphzPbpSU3IyA+h0aN1o2E1mdYGYPa4dsbMwAxt5o
 F7KA==
X-Gm-Message-State: AJIora+QXxf1+4Nveo+03kAwT8tlz4SLSMb9N5jlfk2YeC+Sn/L6OTDo
 ijpmyFZn3tQDowHN5+OmoovgY34+olA=
X-Google-Smtp-Source: AGRyM1sdA6YCHJwF1raTRXLdLKSyXA/ism+r/xJNTp1xYs0IPf7N5hJmFoQJLRzjkyqMDOCLCoRA2g==
X-Received: by 2002:a05:6402:358d:b0:43a:c600:a678 with SMTP id
 y13-20020a056402358d00b0043ac600a678mr2995041edc.219.1657399885941; 
 Sat, 09 Jul 2022 13:51:25 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-174-006.77.11.pool.telefonica.de.
 [77.11.174.6]) by smtp.gmail.com with ESMTPSA id
 o24-20020a170906769800b00726abf9a32bsm930212ejm.138.2022.07.09.13.51.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 Jul 2022 13:51:25 -0700 (PDT)
Date: Sat, 09 Jul 2022 20:51:22 +0000
From: B <shentey@gmail.com>
To: qemu-devel@nongnu.org, Joao Martins <joao.m.martins@oracle.com>
CC: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_03/10=5D_i386/pc=3A_pass_?=
 =?US-ASCII?Q?pci=5Fhole64=5Fsize_to_pc=5Fmemory=5Finit=28=29?=
In-Reply-To: <20220701161014.3850-4-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-4-joao.m.martins@oracle.com>
Message-ID: <FA725D44-6D1C-4A6A-9D83-FF9482DB4593@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 1=2E Juli 2022 16:10:07 UTC schrieb Joao Martins <joao=2Em=2Emartins@or=
acle=2Ecom>:
>Use the pre-initialized pci-host qdev and fetch the
>pci-hole64-size into pc_memory_init() newly added argument=2E
>piix needs a bit of care given all the !pci_enabled()
>and that the pci_hole64_size is private to i440fx=2E

It exposes this value as the property PCI_HOST_PROP_PCI_HOLE64_SIZE=2E Reu=
sing it allows for not touching i440fx in this patch at all=2E

For code symmetry reasons the analogue property could be used for Q35 as w=
ell=2E

Best regards,
Bernhard

>
>This is in preparation to determine that host-phys-bits are
>enough and for pci-hole64-size to be considered to relocate
>ram-above-4g to be at 1T (on AMD platforms)=2E
>
>Signed-off-by: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>Reviewed-by: Igor Mammedov <imammedo@redhat=2Ecom>
>---
> hw/i386/pc=2Ec                 | 3 ++-
> hw/i386/pc_piix=2Ec            | 5 ++++-
> hw/i386/pc_q35=2Ec             | 8 +++++++-
> hw/pci-host/i440fx=2Ec         | 7 +++++++
> include/hw/i386/pc=2Eh         | 3 ++-
> include/hw/pci-host/i440fx=2Eh | 1 +
> 6 files changed, 23 insertions(+), 4 deletions(-)
>
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index a9d1bf95649a=2E=2E1bb89a9c17ec 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -817,7 +817,8 @@ void xen_load_linux(PCMachineState *pcms)
> void pc_memory_init(PCMachineState *pcms,
>                     MemoryRegion *system_memory,
>                     MemoryRegion *rom_memory,
>-                    MemoryRegion **ram_memory)
>+                    MemoryRegion **ram_memory,
>+                    uint64_t pci_hole64_size)
> {
>     int linux_boot, i;
>     MemoryRegion *option_rom_mr;
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 6186a1473755=2E=2Ef3c726e42400 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>     MemoryRegion *pci_memory;
>     MemoryRegion *rom_memory;
>     ram_addr_t lowmem;
>+    uint64_t hole64_size;
>     DeviceState *i440fx_host;
>=20
>     /*
>@@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
>         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>         rom_memory =3D pci_memory;
>         i440fx_host =3D qdev_new(host_type);
>+        hole64_size =3D i440fx_pci_hole64_size(i440fx_host);
>     } else {
>         pci_memory =3D NULL;
>         rom_memory =3D system_memory;
>         i440fx_host =3D NULL;
>+        hole64_size =3D 0;
>     }
>=20
>     pc_guest_info_init(pcms);
>@@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
>     /* allocate ram and load rom/bios */
>     if (!xen_enabled()) {
>         pc_memory_init(pcms, system_memory,
>-                       rom_memory, &ram_memory);
>+                       rom_memory, &ram_memory, hole64_size);
>     } else {
>         pc_system_flash_cleanup_unused(pcms);
>         if (machine->kernel_filename !=3D NULL) {
>diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>index 46ea89e564de=2E=2E5a4a737fe203 100644
>--- a/hw/i386/pc_q35=2Ec
>+++ b/hw/i386/pc_q35=2Ec
>@@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
>     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>     bool acpi_pcihp;
>     bool keep_pci_slot_hpc;
>+    uint64_t pci_hole64_size =3D 0;
>=20
>     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapp=
ing
>@@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
>     /* create pci host bus */
>     q35_host =3D Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>=20
>+    if (pcmc->pci_enabled) {
>+        pci_hole64_size =3D q35_host->mch=2Epci_hole64_size;
>+    }
>+
>     /* allocate ram and load rom/bios */
>-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>+                   pci_hole64_size);
>=20
>     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host=
));
>     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>index d5426ef4a53c=2E=2E15680da7d709 100644
>--- a/hw/pci-host/i440fx=2Ec
>+++ b/hw/pci-host/i440fx=2Ec
>@@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **e=
rrp)
>     }
> }
>=20
>+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
>+{
>+        I440FXState *i440fx =3D I440FX_PCI_HOST_BRIDGE(i440fx_dev);
>+
>+        return i440fx->pci_hole64_size;
>+}
>+
> PCIBus *i440fx_init(const char *pci_type,
>                     DeviceState *dev,
>                     MemoryRegion *address_space_mem,
>diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>index b7735dccfc81=2E=2E568c226d3034 100644
>--- a/include/hw/i386/pc=2Eh
>+++ b/include/hw/i386/pc=2Eh
>@@ -159,7 +159,8 @@ void xen_load_linux(PCMachineState *pcms);
> void pc_memory_init(PCMachineState *pcms,
>                     MemoryRegion *system_memory,
>                     MemoryRegion *rom_memory,
>-                    MemoryRegion **ram_memory);
>+                    MemoryRegion **ram_memory,
>+                    uint64_t pci_hole64_size);
> uint64_t pc_pci_hole64_start(void);
> DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> void pc_basic_device_init(struct PCMachineState *pcms,
>diff --git a/include/hw/pci-host/i440fx=2Eh b/include/hw/pci-host/i440fx=
=2Eh
>index d02bf1ed6b93=2E=2E2234dd5a2a6a 100644
>--- a/include/hw/pci-host/i440fx=2Eh
>+++ b/include/hw/pci-host/i440fx=2Eh
>@@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *pci_type,
>                     MemoryRegion *pci_memory,
>                     MemoryRegion *ram_memory);
>=20
>+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
>=20
> #endif

