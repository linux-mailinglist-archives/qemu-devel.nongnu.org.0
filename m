Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A313A2D20A6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 03:18:08 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSZr-0002t1-MF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 21:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmSYZ-0002Re-BK
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:16:47 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmSYW-0008JN-OP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:16:47 -0500
Received: by mail-qt1-x843.google.com with SMTP id f14so2498742qto.12
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 18:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m1538VC+IV54wev5rx0d17T6140wq+iXlMgNYLExEIg=;
 b=o3R3iJFMLe3pSluICff+/sLQ3aj9P24Dv+tLnGUag+Dxs8eMoVmgTWhYG/EKxfVOCV
 rEB3OWo55CpSVHn8/xoZ4/ulOsPK2Ojw81hjBCeCAFiLZT9nQiB/CzcTA6bYptoIbL3E
 /Bf/hfMsV+8Oml4NiHI6inTF3LP2l15K9AHDR0so/0HPcL46Mwz0gBdsm3CC1/foS3NN
 HYRx5RcliZ8wPChaOtbv60bpuLOO38qcqVkHq7d/oPFHGhhKC3XYZpRWifH0banoUA7w
 C7Cu/ls+mPqROwlzFtPwc1fkMv/s8j2e8OwR1Vsr5heS+ftZLzABHdBit5+9swUOggQ2
 ASeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m1538VC+IV54wev5rx0d17T6140wq+iXlMgNYLExEIg=;
 b=KOk1UrBCmv+gFcYuPjyonhHQthZnYnmPHbAYiNqu4fsNu8Npu2+zQrgbTDz6LgPVBL
 wlz0NJkdGaq71D6ASd0iop7e4DkeBXo6uDMjTR0dKPFd16J+rrBbGvhm0cks76Ccgcqf
 1mJegWLBCfxbgvLCUnHpDxSelLBDw6V285Wz7bL11i/SYO1Y6s88Mb9b6sOkFAG9zNI5
 H77cXc4eCxsD5lQmFFA/3dyN9zunxqMLOwRKC9YxlgCjoHnJ7wAjrE6foWUSTTNcjq4z
 PqgO3RjAOPITJKvBRJkXKk0IP1aHD6JGTt2/3LYIcQu2FKCC4DeusGiG9d2dQmMGpELm
 hung==
X-Gm-Message-State: AOAM533/DZhKfcQNpjiO7ubIJWvTBLj2zUNWuMBIYA7ORldBsQ1mgBA1
 /gv9cW0j2DH5VZlBw0wY+cE=
X-Google-Smtp-Source: ABdhPJzSa1uHckahpVgSXfvIhS9LvRT9TPupT12Z9jtavbT8kl9FXYBfD2cSXxZ8voGVcn2rH33GWg==
X-Received: by 2002:ac8:877:: with SMTP id x52mr27904745qth.334.1607393802900; 
 Mon, 07 Dec 2020 18:16:42 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id c10sm12781701qkm.71.2020.12.07.18.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 18:16:42 -0800 (PST)
Subject: Re: [PATCH 10/15] vl: make qemu_get_machine_opts static
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-11-pbonzini@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d0ee4dd3-36c3-adae-13f7-2ea436a9a042@gmail.com>
Date: Mon, 7 Dec 2020 23:16:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202081854.4126071-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x843.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/20 5:18 AM, Paolo Bonzini wrote:
> Machine options can be retrieved as properties of the machine object.
> Encourage that by removing the "easy" accessor to machine options.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c     | 11 ++++-------
>   hw/arm/boot.c           |  2 +-
>   hw/microblaze/boot.c    |  9 ++++-----
>   hw/nios2/boot.c         |  9 ++++-----
>   hw/ppc/e500.c           |  5 ++---
>   hw/ppc/spapr_nvdimm.c   |  4 ++--
>   hw/ppc/virtex_ml507.c   |  2 +-
>   hw/riscv/sifive_u.c     |  6 ++----
>   hw/riscv/virt.c         |  6 ++----
>   hw/xtensa/xtfpga.c      |  9 ++++-----
>   include/sysemu/sysemu.h |  2 --
>   softmmu/device_tree.c   |  2 +-
>   softmmu/vl.c            |  2 +-
>   13 files changed, 28 insertions(+), 41 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index baaa54249d..666b9ab96c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2013,7 +2013,6 @@ static int kvm_init(MachineState *ms)
>       const KVMCapabilityInfo *missing_cap;
>       int ret;
>       int type = 0;
> -    const char *kvm_type;
>       uint64_t dirty_log_manual_caps;
>   
>       s = KVM_STATE(ms->accelerator);
> @@ -2069,13 +2068,11 @@ static int kvm_init(MachineState *ms)
>       }
>       s->as = g_new0(struct KVMAs, s->nr_as);
>   
> -    kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
> -    if (mc->kvm_type) {
> +    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
> +        g_autofree char *kvm_type = object_property_get_str(OBJECT(current_machine),
> +                                                            "kvm-type",
> +                                                            &error_abort);
>           type = mc->kvm_type(ms, kvm_type);



I'm afraid that this code has unintended consequences for pseries. When starting the VM
with '--enable-kvm' in a Power host I'm getting an error:


$ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
qemu-system-ppc64: Unknown kvm-type specified ''


The reason is that spapr_kvm_type() expects kvm-type to be either NULL (i.e. no option
set, in the previous semantic), "HV" or "PR". This was the case for the previous
qemu_opt_get(), but with object_property_get_str() the absence of the option is
returning kvm_type = ''.

This means that, as far as pseries goes, inserting "kvm-type=" (blank string)
has the same effect:


$ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries,accel=kvm,kvm-type=
qemu-system-ppc64: Unknown kvm-type specified ''


I investigated object_property_get_str() inner workings a bit and I wasn't able
to find a way for it to return NULL if kvm_type isn't specified.


I see three possible solutions for it:

1) interpret kvm_type='' as if kvm_type=NULL inside spapr_kvm_type():

static int spapr_kvm_type(MachineState *machine, const char *vm_type)
{
     if (!vm_type || strcmp(vm_type, "")) {
         return 0;
     }
(...)


This is kind of ugly because we're validating a "kvm_type=" scenario with it, but
it works.


2) find a way to make object_property_get_str() to return kvm_type = NULL if the
'kvm_type' option is absent  and keep spapr code untouched. I don't have the
knowledge to assess how hard this would be.


3) I can change the pseries logic to add an explicit default value for kvm_type=NULL
or kvm_type='' (i.e. no user input is given). We're already doing that in a sense, but
it's not exposed to the user. I would call it 'auto' and expose it to the user
as default value if no kvm_type is explictly set. This would enhance user experience
a bit and avoid having to deal with a scenario where kvm_type=(blank) is
a valid input.


David, if you think (3) is tolerable let me know and I can send a patch. IMO
this change adds a bit of value regardless of Paolo's change.


Thanks,



DHB



> -    } else if (kvm_type) {
> -        ret = -EINVAL;
> -        fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
> -        goto err;
>       }
>   
>       do {
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 4d9d47ba1c..e56c42ac22 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1299,7 +1299,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>       info->kernel_filename = ms->kernel_filename;
>       info->kernel_cmdline = ms->kernel_cmdline;
>       info->initrd_filename = ms->initrd_filename;
> -    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +    info->dtb_filename = ms->dtb;
>       info->dtb_limit = 0;
>   
>       /* Load the kernel.  */
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 6715ba2ff9..caaba1aa4c 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -34,6 +34,7 @@
>   #include "sysemu/device_tree.h"
>   #include "sysemu/reset.h"
>   #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
>   #include "hw/loader.h"
>   #include "elf.h"
>   #include "qemu/cutils.h"
> @@ -116,16 +117,14 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>                               const char *dtb_filename,
>                               void (*machine_cpu_reset)(MicroBlazeCPU *))
>   {
> -    QemuOpts *machine_opts;
>       const char *kernel_filename;
>       const char *kernel_cmdline;
>       const char *dtb_arg;
>       char *filename = NULL;
>   
> -    machine_opts = qemu_get_machine_opts();
> -    kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -    kernel_cmdline = qemu_opt_get(machine_opts, "append");
> -    dtb_arg = qemu_opt_get(machine_opts, "dtb");
> +    kernel_filename = current_machine->kernel_filename;
> +    kernel_cmdline = current_machine->kernel_cmdline;
> +    dtb_arg = current_machine->dtb;
>       /* default to pcbios dtb as passed by machine_init */
>       if (!dtb_arg && dtb_filename) {
>           filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 95a8697906..d9969ac148 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -39,6 +39,7 @@
>   #include "sysemu/device_tree.h"
>   #include "sysemu/reset.h"
>   #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
>   #include "hw/loader.h"
>   #include "elf.h"
>   
> @@ -120,16 +121,14 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
>                               const char *dtb_filename,
>                               void (*machine_cpu_reset)(Nios2CPU *))
>   {
> -    QemuOpts *machine_opts;
>       const char *kernel_filename;
>       const char *kernel_cmdline;
>       const char *dtb_arg;
>       char *filename = NULL;
>   
> -    machine_opts = qemu_get_machine_opts();
> -    kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -    kernel_cmdline = qemu_opt_get(machine_opts, "append");
> -    dtb_arg = qemu_opt_get(machine_opts, "dtb");
> +    kernel_filename = current_machine->kernel_filename;
> +    kernel_cmdline = current_machine->kernel_cmdline;
> +    dtb_arg = current_machine->dtb;
>       /* default to pcbios dtb as passed by machine_init */
>       if (!dtb_arg) {
>           filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 6a64eb31ab..41dad2e583 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -343,9 +343,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>               pmc->pci_pio_base >> 32, pmc->pci_pio_base,
>               0x0, 0x10000,
>           };
> -    QemuOpts *machine_opts = qemu_get_machine_opts();
> -    const char *dtb_file = qemu_opt_get(machine_opts, "dtb");
> -    const char *toplevel_compat = qemu_opt_get(machine_opts, "dt_compatible");
> +    const char *dtb_file = machine->dtb;
> +    const char *toplevel_compat = machine->dt_compatible;
>   
>       if (dtb_file) {
>           char *filename;
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index a833a63b5e..84715a4d78 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -38,7 +38,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>   {
>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>       const MachineState *ms = MACHINE(hotplug_dev);
> -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
>       g_autofree char *uuidstr = NULL;
>       QemuUUID uuid;
>       int ret;
> @@ -57,10 +56,11 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>        * ensure that, if the user sets nvdimm=off, we error out
>        * regardless of being 5.1 or newer.
>        */
> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> +    if (!ms->nvdimms_state->is_enabled && ms->nvdimms_state->has_is_enabled) {
>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>           return false;
>       }
> +    ms->nvdimms_state->is_enabled = true;
>   
>       if (object_property_get_int(OBJECT(nvdimm), NVDIMM_LABEL_SIZE_PROP,
>                                   &error_abort) == 0) {
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 7f1bca928c..07fe49da0d 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -152,7 +152,7 @@ static int xilinx_load_device_tree(hwaddr addr,
>       int r;
>       const char *dtb_filename;
>   
> -    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +    dtb_filename = current_machine->dtb;
>       if (dtb_filename) {
>           fdt = load_device_tree(dtb_filename, &fdt_size);
>           if (!fdt) {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2f19a9cda2..e7f6dc5fb3 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -100,14 +100,12 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>       int cpu;
>       uint32_t *cells;
>       char *nodename;
> -    const char *dtb_filename;
>       char ethclk_names[] = "pclk\0hclk";
>       uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>       uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>   
> -    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> -    if (dtb_filename) {
> -        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
> +    if (ms->dtb) {
> +        fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
>           if (!fdt) {
>               error_report("load_device_tree() failed");
>               exit(1);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 25cea7aa67..3cc18a76e7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -181,7 +181,6 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>   {
>       void *fdt;
>       int i, cpu, socket;
> -    const char *dtb_filename;
>       MachineState *mc = MACHINE(s);
>       uint64_t addr, size;
>       uint32_t *clint_cells, *plic_cells;
> @@ -195,9 +194,8 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>       hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
>       hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
>   
> -    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> -    if (dtb_filename) {
> -        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
> +    if (mc->dtb) {
> +        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
>           if (!fdt) {
>               error_report("load_device_tree() failed");
>               exit(1);
> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index b1470b88e6..7be53f1895 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c
> @@ -233,11 +233,10 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
>       qemu_irq *extints;
>       DriveInfo *dinfo;
>       PFlashCFI01 *flash = NULL;
> -    QemuOpts *machine_opts = qemu_get_machine_opts();
> -    const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -    const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
> -    const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
> -    const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
> +    const char *kernel_filename = machine->kernel_filename;
> +    const char *kernel_cmdline = machine->kernel_cmdline;
> +    const char *dtb_filename = machine->dtb;
> +    const char *initrd_filename = machine->initrd_filename;
>       const unsigned system_io_size = 224 * MiB;
>       uint32_t freq = 10000000;
>       int n;
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 9b47cdca55..e8f463ff30 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -104,8 +104,6 @@ typedef void QEMUBootSetHandler(void *opaque, const char *boot_order,
>   void qemu_register_boot_set(QEMUBootSetHandler *func, void *opaque);
>   void qemu_boot_set(const char *boot_order, Error **errp);
>   
> -QemuOpts *qemu_get_machine_opts(void);
> -
>   bool defaults_enabled(void);
>   
>   void qemu_init(int argc, char **argv, char **envp);
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b335dae707..b9a3ddc518 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -526,7 +526,7 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>   
>   void qemu_fdt_dumpdtb(void *fdt, int size)
>   {
> -    const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
> +    const char *dumpdtb = current_machine->dumpdtb;
>   
>       if (dumpdtb) {
>           /* Dump the dtb to a file and quit */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4fece1b9db..0f7222af31 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -481,7 +481,7 @@ static QemuOptsList qemu_fw_cfg_opts = {
>    *
>    * Returns: machine options (never null).
>    */
> -QemuOpts *qemu_get_machine_opts(void)
> +static QemuOpts *qemu_get_machine_opts(void)
>   {
>       return qemu_find_opts_singleton("machine");
>   }
> 

