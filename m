Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D606F64AC05
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 01:15:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4svc-00088t-DR; Mon, 12 Dec 2022 19:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+16f8bca671676a5df7ce+7051+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p4svY-00088h-7S
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:13:44 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+16f8bca671676a5df7ce+7051+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p4svV-0003KS-8G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ItjN528iaJ6LpCraH7dULoAGsCnDLEiFDdg3YWGT6oY=; b=Hmb1GqdDgVLDRDgIbmJ4LA13ET
 zKKbjvVosZOQVC04qdLl2HDxojF1QXNbJ981ibXbAIDIhdVeOxWsTV8R1qJ/N+NbTnmOfyiw2rILo
 Sw7kwSWlrYAKGrzowH58Kyr9goh0HQhPnUz36fU7JNRsAK9XpMR6F99evkXL7+ubKpRwmYmp6sarL
 2qMLteKvCHYw9B58qwqatwVl9INNiRZxHEnopLsHRksI8ZGpiRE7QdnXODl2Z1umbNTm0Oyqfimau
 TMR7Z0Ys7z6aacc3mI0cYt8/ojpOaJohuD6q4Dxez1gapaHWE4O4Z8h1kmoCoLsbOFqBsrBMqcdud
 ZyueHp7w==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p4svZ-00Bdnq-O2; Tue, 13 Dec 2022 00:13:45 +0000
Message-ID: <bd22c1554ba135af9a9bf9be16b1a7c827795eb2.camel@infradead.org>
Subject: Re: [RFC PATCH v2 03/22] i386/xen: Add xen-version machine property
 and init KVM Xen support
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Claudio Fontana <cfontana@suse.de>
Date: Tue, 13 Dec 2022 00:13:36 +0000
In-Reply-To: <8495140d-3301-7693-b804-0554166802da@redhat.com>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-4-dwmw2@infradead.org>
 <8495140d-3301-7693-b804-0554166802da@redhat.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-R9jjLhTQRm7AqSSfDpPz"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+16f8bca671676a5df7ce+7051+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


--=-R9jjLhTQRm7AqSSfDpPz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-12-12 at 18:30 +0100, Paolo Bonzini wrote:
> On 12/9/22 10:55, David Woodhouse wrote:
> > -    m->default_machine_opts =3D "accel=3Dxen,suppress-vmdesc=3Don";
> > +    if (xen_enabled())
> > +            m->default_machine_opts =3D "accel=3Dxen,suppress-vmdesc=
=3Don";
> > +    else
> > +            m->default_machine_opts =3D "accel=3Dkvm,xen-version=3D0x3=
0001";
>=20
> Please do not modify pc_xen_hvm_init().
>=20
> "-M xenfv" should be the same as "-M pc-i440fx-...,suppress-vmdesc=3Don=
=20
> -accel xen -device xen-platform".  It must work *without* "-accel xen",=
=20
> while here you're basically requiring it.  For now, please make=20
> KVM-emulated Xen use "-M pc -device xen-platform".  We can figure out=20
> "-M xenfv" later.
>=20
> You can instead have:
>=20
> - a check in xen_init() that checks that xen_mode is XEN_ATTACH.  If=20
> not, fail.
>=20
> - an extra enum value for xen_mode, XEN_DISABLED, which is the default=
=20
> instead of XEN_EMULATE;
>=20
> - an accelerator property "-accel kvm,xen-version=3D...", added in=20
> kvm_accel_class_init() instead of the machine property.  The property,=
=20
> when set to a nonzero value, flips xen_mode from XEN_DISABLED to=20
> XEN_EMULATE.
>=20
> The Xen overlay device can be created using the mc->kvm_type function=20
> (which you can set in DEFINE_PC_MACHINE); at that point, xen_mode has=20
> switched from XEN_DISABLED to XEN_EMULATE.  Those xen_enabled() checks=
=20
> that apply to KVM then become xen_mode !=3D XEN_DISABLED, as long as they=
=20
> run during mc->kvm_type or afterwards.
>=20
> The platform device can be created either in mc->kvm_type or manually=20
> (not sure if it makes sense to have a "XenVMMXenVMM" CPUID + emulated=20
> hypercalls but no platform device---would it still use pvclock for=20
> example?).

That works; thanks. I won't spam the list with another round just yet,
but have pushed it to
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv

The guest now correctly panics because I haven't implemented event
channel hypercalls yet (got to fix up a bit more of the 32-bit compat
first, and some other parts of Paul's feedback I haven't yet got to).

$ ./build/qemu-system-x86_64 -serial mon:stdio -M pc -accel kvm,xen-version=
=3D0x4000a  -cpu host  -display none -kernel vmlinuz-5.17.8-200.fc35.x86_64=
 -append "console=3DttyS0 earlyprintk=3DttyS0 panic=3D10000" --trace "kvm_x=
en*" -d unimp -m 1G -smp 4 -device xen-platform
Probing EDD (edd=3Doff to disable)... ok
[    0.000000] Linux version 5.17.8-200.fc35.x86_64 (mockbuild@bkernel02.ia=
d2.fedoraproject.org) (gcc (GCC) 11.3.1 20220421 (Red Hat 11.3.1-2), GNU ld=
 version 2.37-17.fc35) #1 SMP PREEMPT Mon May 16 01:01:02 UTC 2022
[    0.000000] Command line: console=3DttyS0 earlyprintk=3DttyS0 panic=3D10=
000
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 b=
ytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 2032
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003ffdffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000003ffe0000-0x000000003fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reser=
ved
[    0.000000] printk: bootconsole [earlyser0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009fb=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009fc00-0x000000000009ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000000f0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000000bf98=
ef] usable
[    0.000000] reserve setup_data: [mem 0x0000000000bf98f0-0x0000000000bf99=
1f] usable
[    0.000000] reserve setup_data: [mem 0x0000000000bf9920-0x000000003ffdff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000003ffe0000-0x000000003fffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feffc000-0x00000000feffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fffc0000-0x00000000ffffff=
ff] reserved
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.1=
-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.10.
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 17 a0 0x6 a1 0xffffffffb=
8e03e70 a2 0x0 ret 0x0
kvm_xen_set_shared_info shared info at gfn 0x10
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 12 a0 0x7 a1 0xffffffffb=
8e03e60 a2 0x8000000000000163 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 0 gpa 0x10040
kvm_xen_set_vcpu_attr vcpu attr cpu 2 type 0 gpa 0x10080
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 0 gpa 0x10000
kvm_xen_set_vcpu_attr vcpu attr cpu 3 type 0 gpa 0x100c0
[    0.000000] platform_pci_unplug: Netfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated NICs.
[    0.000000] platform_pci_unplug: Blkfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated disks.
[    0.000000] You might have to change the root device
[    0.000000] from /dev/hd[a-d] to /dev/xvd[a-d]
[    0.000000] in your root=3D kernel command line option
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x9 a1 0xffffffffb=
8e03e68 a2 0x2 ret 0xffffffffffffffda
[    0.021222] tsc: Fast TSC calibration using PIT
[    0.022715] tsc: Detected 2112.208 MHz processor
[    0.024194] tsc: Detected 2112.000 MHz TSC
[    0.027112] last_pfn =3D 0x3ffe0 max_arch_pfn =3D 0x400000000
[    0.028983] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
Memory KASLR using RDRAND RDTSC...
[    0.040593] found SMP MP-table at [mem 0x000f5bf0-0x000f5bff]
[    0.042372] Using GB pages for direct mapping
[    0.044274] ACPI: Early table checksum verification disabled
[    0.045818] ACPI: RSDP 0x00000000000F5A10 000014 (v00 BOCHS )
[    0.047436] ACPI: RSDT 0x000000003FFE1BDD 000034 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.049981] ACPI: FACP 0x000000003FFE1A79 000074 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.052664] ACPI: DSDT 0x000000003FFE0040 001A39 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.055603] ACPI: FACS 0x000000003FFE0000 000040
[    0.057391] ACPI: APIC 0x000000003FFE1AED 000090 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.060233] ACPI: HPET 0x000000003FFE1B7D 000038 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.063058] ACPI: WAET 0x000000003FFE1BB5 000028 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.065812] ACPI: Reserving FACP table memory at [mem 0x3ffe1a79-0x3ffe1=
aec]
[    0.068290] ACPI: Reserving DSDT table memory at [mem 0x3ffe0040-0x3ffe1=
a78]
[    0.070623] ACPI: Reserving FACS table memory at [mem 0x3ffe0000-0x3ffe0=
03f]
[    0.072976] ACPI: Reserving APIC table memory at [mem 0x3ffe1aed-0x3ffe1=
b7c]
[    0.075241] ACPI: Reserving HPET table memory at [mem 0x3ffe1b7d-0x3ffe1=
bb4]
[    0.077313] ACPI: Reserving WAET table memory at [mem 0x3ffe1bb5-0x3ffe1=
bdc]
[    0.080178] No NUMA configuration found
[    0.081189] Faking a node at [mem 0x0000000000000000-0x000000003ffdffff]
[    0.083037] NODE_DATA(0) allocated [mem 0x3ffb5000-0x3ffdffff]
[    0.158885] Zone ranges:
[    0.159679]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.161442]   DMA32    [mem 0x0000000001000000-0x000000003ffdffff]
[    0.163104]   Normal   empty
[    0.163924]   Device   empty
[    0.164732] Movable zone start for each node
[    0.165899] Early memory node ranges
[    0.166843]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.168562]   node   0: [mem 0x0000000000100000-0x000000003ffdffff]
[    0.170032] Initmem setup node 0 [mem 0x0000000000001000-0x000000003ffdf=
fff]
[    0.171611] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.171668] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.175214] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.177220] ACPI: PM-Timer IO Port: 0x608
[    0.179928] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.181520] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-=
23
[    0.183448] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.185083] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.186633] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.188303] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level=
)
[    0.190365] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level=
)
[    0.192528] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.194438] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.196053] TSC deadline timer available
[    0.197268] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.198877] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.201200] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x0009ffff]
[    0.203531] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000effff]
[    0.205839] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0=
x000fffff]
[    0.208122] PM: hibernation: Registered nosave memory: [mem 0x00bf9000-0=
x00bf9fff]
[    0.210303] PM: hibernation: Registered nosave memory: [mem 0x00bf9000-0=
x00bf9fff]
[    0.212595] [mem 0x40000000-0xfeffbfff] available for PCI devices
[    0.214447] Booting paravirtualized kernel on Xen HVM
[    0.216050] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.226546] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr=
_node_ids:1
[    0.232545] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u524288
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0xa a1 0x0 a2 0xff=
ffffffb8e03ed0 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 0 gpa 0x3ec1e0e0
[    0.234134] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, =
linear)
[    0.235651] Fallback order for Node 0: 0=20
[    0.236618] Built 1 zonelists, mobility grouping on.  Total pages: 25775=
9
[    0.238432] Policy zone: DMA32
[    0.239373] Kernel command line: console=3DttyS0 earlyprintk=3DttyS0 pan=
ic=3D10000
[    0.242530] Dentry cache hash table entries: 131072 (order: 8, 1048576 b=
ytes, linear)
[    0.245280] Inode-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    0.247676] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.253165] Memory: 978800K/1048056K available (16393K kernel code, 3607=
K rwdata, 10784K rodata, 2704K init, 6288K bss, 68996K reserved, 0K cma-res=
erved)
[    0.256519] random: get_random_u64 called from __kmem_cache_create+0x2a/=
0x530 with crng_init=3D0
[    0.256838] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.260445] Kernel/User page tables isolation: enabled
[    0.261691] ftrace: allocating 48342 entries in 189 pages
[    0.278046] ftrace: allocated 189 pages with 6 groups
[    0.280372] Dynamic Preempt: voluntary
[    0.281783] rcu: Preemptible hierarchical RCU implementation.
[    0.282905] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D4.
[    0.284217] 	Trampoline variant of Tasks RCU enabled.
[    0.285323] 	Rude variant of Tasks RCU enabled.
[    0.286304] 	Tracing variant of Tasks RCU enabled.
[    0.287385] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.289049] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.297553] NR_IRQS: 524544, nr_irqs: 456, preallocated irqs: 16
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 32 a0 0xb a1 0xffffffffb=
8e03e98 a2 0xffff9316bec00000 ret 0xffffffffffffffda
[    0.298817] xen:events: Using 2-level ABI
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x0 a1 0xffffffffb=
8e03ec8 a2 0x100 ret 0x0
[    0.299811] xen:events: Xen HVM callback vector for event delivery is en=
abled
[    0.301653] random: crng init done (trusting CPU's manufacturer)
[    0.318080] Console: colour VGA+ 80x25
Unimplemented Xen hypercall 34 (0x1 0xffffffffb8e03eb8 0xffffffffb8e03eb8)
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x1 a1 0xffffffffb=
8e03eb8 a2 0x7ff0 ret 0xffffffffffffffda
[    0.319300] Cannot get hvm parameter CONSOLE_EVTCHN (18): -38!
[    0.321118] printk: console [ttyS0] enabled
[    0.321118] printk: console [ttyS0] enabled
[    0.323780] printk: bootconsole [earlyser0] disabled
[    0.323780] printk: bootconsole [earlyser0] disabled
[    0.326482] ACPI: Core revision 20211217
[    0.328222] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 19112604467 ns
[    0.330092] APIC: Switch to symmetric I/O mode setup
[    0.331324] x2apic enabled
[    0.332145] Switched APIC routing to physical x2apic.
[    0.334323] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.340113] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x1e71785e5dd, max_idle_ns: 440795244814 ns
[    0.341973] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4224.00 BogoMIPS (lpj=3D2112000)
[    0.342962] pid_max: default: 32768 minimum: 301
[    0.344027] LSM: Security Framework initializing
[    0.344995] Yama: becoming mindful.
[    0.345971] SELinux:  Initializing.
[    0.347003] LSM support for eBPF active
[    0.347710] landlock: Up and running.
[    0.348070] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes,=
 linear)
[    0.348982] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 b=
ytes, linear)
Poking KASLR using RDRAND RDTSC...
[    0.352097] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.353243] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.353963] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.355022] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.355969] Spectre V2 : Mitigation: Retpolines
[    0.356962] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.357965] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.358972] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.359962] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.360984] SRBDS: Unknown: Dependent on hypervisor status
[    0.361966] MDS: Mitigation: Clear CPU buffers
[    0.370697] Freeing SMP alternatives memory: 44K
[    0.371365] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
Unimplemented Xen hypercall 24 (0x7 0x0 0x0)
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0x7 a1 0x0 a2 0x0 =
ret 0xffffffffffffffda
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0xd a1 0x0 a2 0xff=
ffa734c0013e58 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 1 gpa 0x123e000
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0x5 a1 0x0 a2 0xff=
ffa734c0013e48 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 2 gpa 0x3ec2ec40
[    0.373086] installing Xen timer for CPU 0
Unimplemented Xen hypercall 32 (0x1 0xffffa734c0013da4 0xffffa734c0013da4)
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 32 a0 0x1 a1 0xffffa734c=
0013da4 a2 0x1 ret 0xffffffffffffffda
[    0.374108] ------------[ cut here ]------------
[    0.374962] kernel BUG at drivers/xen/events/events_base.c:1397!
[    0.375979] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[    0.376960] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.8-200.fc35.x8=
6_64 #1
[    0.376960] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[    0.376960] RIP: 0010:bind_virq_to_irq+0x1b7/0x2d0
[    0.376960] Code: c7 c2 e0 f1 15 b7 48 c7 c6 20 05 18 b9 44 89 ff e8 ee =
5a 98 ff e9 50 ff ff ff 45 31 db 83 f8 ef 74 41 85 d2 0f 89 77 ff ff ff <0f=
> 0b 44 89 ff 44 89 5c 24 08 e8 fa 4a 98 ff 44 8b 5c 24 08 48 85
[    0.376960] RSP: 0000:ffffa734c0013d80 EFLAGS: 00010282
[    0.376960] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000000=
1e120
[    0.376960] RDX: 00000000ffffffda RSI: ffffa734c0013da4 RDI: 00000000000=
00001
[    0.376960] RBP: 0000000000000000 R08: ffff9316811e4200 R09: 00000000000=
00000
[    0.376960] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
2ed20
[    0.376960] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00018
[    0.376960] FS:  0000000000000000(0000) GS:ffff9316bec00000(0000) knlGS:=
0000000000000000
[    0.376960] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.376960] CR2: ffff93168f001000 CR3: 000000000de10001 CR4: 00000000003=
70ef0
[    0.376960] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[    0.376960] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[    0.376960] Call Trace:
[    0.376960]  <TASK>
[    0.376960]  ? xen_timerop_shutdown+0x10/0x10
[    0.376960]  bind_virq_to_irqhandler+0x28/0x90
[    0.376960]  xen_setup_timer.cold+0x47/0xc5
[    0.376960]  xen_time_init+0x173/0x1a4
[    0.376960]  native_smp_prepare_cpus+0xdd/0x17e
[    0.376960]  xen_hvm_smp_prepare_cpus+0xc/0x67
[    0.376960]  kernel_init_freeable+0xe8/0x251
[    0.376960]  ? rest_init+0xd0/0xd0
[    0.376960]  kernel_init+0x16/0x130
[    0.376960]  ret_from_fork+0x22/0x30
[    0.376960]  </TASK>
[    0.376960] Modules linked in:
[    0.376965] ---[ end trace 0000000000000000 ]---
[    0.377964] RIP: 0010:bind_virq_to_irq+0x1b7/0x2d0
[    0.378874] Code: c7 c2 e0 f1 15 b7 48 c7 c6 20 05 18 b9 44 89 ff e8 ee =
5a 98 ff e9 50 ff ff ff 45 31 db 83 f8 ef 74 41 85 d2 0f 89 77 ff ff ff <0f=
> 0b 44 89 ff 44 89 5c 24 08 e8 fa 4a 98 ff 44 8b 5c 24 08 48 85
[    0.378965] RSP: 0000:ffffa734c0013d80 EFLAGS: 00010282
[    0.379962] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000000=
1e120
[    0.380965] RDX: 00000000ffffffda RSI: ffffa734c0013da4 RDI: 00000000000=
00001
[    0.381962] RBP: 0000000000000000 R08: ffff9316811e4200 R09: 00000000000=
00000
[    0.382964] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
2ed20
[    0.383963] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00018
[    0.384964] FS:  0000000000000000(0000) GS:ffff9316bec00000(0000) knlGS:=
0000000000000000
[    0.385963] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.386962] CR2: ffff93168f001000 CR3: 000000000de10001 CR4: 00000000003=
70ef0
[    0.387964] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[    0.388962] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[    0.389975] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
[    0.390960] Rebooting in 10000 seconds..

--=-R9jjLhTQRm7AqSSfDpPz
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIxMjEzMDAxMzM2WjAvBgkqhkiG9w0BCQQxIgQgI437kLCh
3DWFfEPTMUpQi8Vlk7sKleBnky1YhCG3bVkwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCPm2rEKRN732aFO1Zvk3l3LBXnxdqn4toY
EUdt6kG787LkxVsia8WINYeDGmK7P+BtryQt+muAamyWwQ4A+Rs68+li11KnVTHIMBM8+98hZtKh
VJqh5kqb11OMS6JpCWSeKSYR072A8o4mvDpo237mgcyIlz+y7cHaW1iApuBXSX4hMPMGNqgYSWHM
F4sh50fU+kvW20e4s8Q9f4FxMQMJw/7NpRGpjmNyfR+1TB28lLxEf4beOxr+VUooi4/ZP/4ciLtr
RTFDHPekg+0Wp9Wpm30OpWoO/fPMFgmNI9nqUlZEpyr6SNwhnMWSHk+iA/dr3n/U8WP7GHB6HzoU
LUNtyf9VkuAOfwtsTFvq5CzQlwqFvJLNC7R0JrpipXiw1ZPmeWXJVEVcHW1mCKoiQIDd78dxZ9XI
3HdF0AlmomBqjAlN2qBMcWooeGLjQOv+EB/3ZBrwpKENB2sXxwEj9l1lhUSGEgQFXEiUP9HASVvg
lTSwyuSXot1CAN54djPtiSJZJ0Uxe/RqInDlmv9Cg8pqxWjmlJHhJERUX2rETQvfBdvIa6wyZ38Q
P5pjOpiYAKV7G0b68LYYwXj2b0DuLv6EfV3I8KO+fbKsIQ/4Qp8eKlhsGnhvNa9t1JapXjtDzuY8
/BqMHrOwISCbawfFpWErtzXMAXhuPE2mJYCTJS3XowAAAAAAAA==


--=-R9jjLhTQRm7AqSSfDpPz--


