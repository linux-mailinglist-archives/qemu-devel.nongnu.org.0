Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6645FAE95
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 10:41:32 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiApP-00059q-Qz
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 04:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oiAWy-0008PO-6h
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 04:22:28 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oiAWu-0004Do-Vl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 04:22:27 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCska-1oqvxC2fhY-008tGK; Tue, 11 Oct 2022 10:22:18 +0200
Message-ID: <ebeb90c7-8f46-4af0-073d-6f1710d3eeb2@vivier.eu>
Date: Tue, 11 Oct 2022 10:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] m68k: write bootinfo as rom section and re-randomize
 on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221002103707.909560-1-Jason@zx2c4.com>
 <20221003110221.971024-1-Jason@zx2c4.com>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221003110221.971024-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xSQp8PMCgwK6LXiPc7T8v4QS3y5cHvLK3PQQ74tH45Av2KY4gnj
 9YF6YVd5Crm0Th4mkKCF5b7CEP1P7v8VDfv08fkr0ju6YlKoN9FQZkF20ukSYamuKQswfqY
 hx0ZL3nKuCvTmIRZP1lETsK5RgzZnRhY8pMHTtekvOUbYnPsS2BQoVee9ke/O9G9vQjrVQr
 pWU1pJ2SZmBOUmEZ14xhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BSHGN//V3hM=:90DIaQhGKgiOPTHWXT9i+1
 WtCX30Eb9deqp8Efqvpk6sK8Iv0U8RGNCx0GKnXftvFuVvfL6ujuDVfnq5FWuzrmgfZLEHu6k
 cqy0zVWgEHo7kQvWFbHG2A1qmYmbzETtfFlfKaNHgx4Vcd4bhcfjhJjDNWTcXksH7SHqicnnt
 07KeD8eX5XRjUePKfLIyjPIjstDCVUIJccQ3D/jQAkw0o9fum22k/8qi5to2Pltch6SZrhfKl
 4WLZwDa+xYTCA9VZxtjsPAJ7iUC/6b+3n0kIQapfRRcWLpAR0dAOwHW5hvViT65kcNUgKAw/b
 MzL2rU2HckSNCfiJQSkt6XQF8W6mMIj5WS9/kUiyXEXESM8ARe1S7kPXI+H+nFKw+xSfofP/i
 /d/ESDAN50P2Z6KsV+CqBJfi9sYww+MlGAbb43DNJhtmNF/lo5QeWZvYPMupTlpgkpGjjL71U
 T9FzQnyMJOuATzRnRHUUEYCyv96kONcfLbp+3WusAolGGm4+JkUcCTdEAg2pCVJUG9fvIqwAT
 1CZacIb8++32l1EN/uBlyo9EVle7Z5fjCzpA+z7p0WwMlGSB/eWNC8pbepfe2ilIqxiCRoeZ/
 vjxCpYdkwNlvUbnXWkDJFGn9mz0ncWLkiFwmdnc/9xcn7sIBsxG1RlFtj5EUqpILJuo1c8gAB
 uICPqNKkqRGPbNwJpXu3qbZfQR+Tb0BESZo6RSDjAnaRTxbxLm4EST7WeWJwslZeVb1ILd/vZ
 oixTLRxTbXJEuCaBOE98cL7joojqaq54A+o5o4lD4OOMrjXd4T+haqVKo4uFdtIDotn+tbWdY
 Ta/H/TM
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/10/2022 à 13:02, Jason A. Donenfeld a écrit :
> Rather than poking directly into RAM, add the bootinfo block as a proper
> ROM, so that it's restored when rebooting the system. This way, if the
> guest corrupts any of the bootinfo items, but then tries to reboot,
> it'll still be restored back to normal as expected.
> 
> Then, since the RNG seed needs to be fresh on each boot, regenerate the
> RNG seed in the ROM when reseting the CPU.

As it's needed to be refreshed, I think it would better not to use a ROM and to regenerate all the 
bootinfo data on the reset. This will also avoid the conditional g_malloc().

Thanks,
Laurent

> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/m68k/bootinfo.h | 48 +++++++++++++++----------------
>   hw/m68k/q800.c     | 71 +++++++++++++++++++++++++++++++++-------------
>   hw/m68k/virt.c     | 51 +++++++++++++++++++++++----------
>   3 files changed, 111 insertions(+), 59 deletions(-)
> 
> diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
> index 897162b818..eb92937cf6 100644
> --- a/hw/m68k/bootinfo.h
> +++ b/hw/m68k/bootinfo.h
> @@ -12,66 +12,66 @@
>   #ifndef HW_M68K_BOOTINFO_H
>   #define HW_M68K_BOOTINFO_H
>   
> -#define BOOTINFO0(as, base, id) \
> +#define BOOTINFO0(base, id) \
>       do { \
> -        stw_phys(as, base, id); \
> +        stw_p(base, id); \
>           base += 2; \
> -        stw_phys(as, base, sizeof(struct bi_record)); \
> +        stw_p(base, sizeof(struct bi_record)); \
>           base += 2; \
>       } while (0)
>   
> -#define BOOTINFO1(as, base, id, value) \
> +#define BOOTINFO1(base, id, value) \
>       do { \
> -        stw_phys(as, base, id); \
> +        stw_p(base, id); \
>           base += 2; \
> -        stw_phys(as, base, sizeof(struct bi_record) + 4); \
> +        stw_p(base, sizeof(struct bi_record) + 4); \
>           base += 2; \
> -        stl_phys(as, base, value); \
> +        stl_p(base, value); \
>           base += 4; \
>       } while (0)
>   
> -#define BOOTINFO2(as, base, id, value1, value2) \
> +#define BOOTINFO2(base, id, value1, value2) \
>       do { \
> -        stw_phys(as, base, id); \
> +        stw_p(base, id); \
>           base += 2; \
> -        stw_phys(as, base, sizeof(struct bi_record) + 8); \
> +        stw_p(base, sizeof(struct bi_record) + 8); \
>           base += 2; \
> -        stl_phys(as, base, value1); \
> +        stl_p(base, value1); \
>           base += 4; \
> -        stl_phys(as, base, value2); \
> +        stl_p(base, value2); \
>           base += 4; \
>       } while (0)
>   
> -#define BOOTINFOSTR(as, base, id, string) \
> +#define BOOTINFOSTR(base, id, string) \
>       do { \
>           int i; \
> -        stw_phys(as, base, id); \
> +        stw_p(base, id); \
>           base += 2; \
> -        stw_phys(as, base, \
> +        stw_p(base, \
>                    (sizeof(struct bi_record) + strlen(string) + \
>                     1 /* null termination */ + 3 /* padding */) & ~3); \
>           base += 2; \
>           for (i = 0; string[i]; i++) { \
> -            stb_phys(as, base++, string[i]); \
> +            stb_p(base++, string[i]); \
>           } \
> -        stb_phys(as, base++, 0); \
> -        base = (base + 3) & ~3; \
> +        stb_p(base++, 0); \
> +        base = (void *)(((unsigned long)base + 3) & ~3); \
>       } while (0)
>   
> -#define BOOTINFODATA(as, base, id, data, len) \
> +#define BOOTINFODATA(base, id, data, len) \
>       do { \
>           int i; \
> -        stw_phys(as, base, id); \
> +        stw_p(base, id); \
>           base += 2; \
> -        stw_phys(as, base, \
> +        stw_p(base, \
>                    (sizeof(struct bi_record) + len + \
>                     2 /* length field */ + 3 /* padding */) & ~3); \
>           base += 2; \
> -        stw_phys(as, base, len); \
> +        stw_p(base, len); \
>           base += 2; \
>           for (i = 0; i < len; ++i) { \
> -            stb_phys(as, base++, data[i]); \
> +            stb_p(base++, data[i]); \
>           } \
> -        base = (base + 3) & ~3; \
> +        base = (void *)(((unsigned long)base + 3) & ~3); \
>       } while (0)
>   #endif
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index a4590c2cb0..e09e244ddc 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -321,11 +321,22 @@ static const TypeInfo glue_info = {
>       },
>   };
>   
> +typedef struct {
> +    M68kCPU *cpu;
> +    struct bi_record *rng_seed;
> +} ResetInfo;
> +
>   static void main_cpu_reset(void *opaque)
>   {
> -    M68kCPU *cpu = opaque;
> +    ResetInfo *reset_info = opaque;
> +    M68kCPU *cpu = reset_info->cpu;
>       CPUState *cs = CPU(cpu);
>   
> +    if (reset_info->rng_seed) {
> +        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
> +            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
> +    }
> +
>       cpu_reset(cs);
>       cpu->env.aregs[7] = ldl_phys(cs->as, 0);
>       cpu->env.pc = ldl_phys(cs->as, 4);
> @@ -386,6 +397,7 @@ static void q800_init(MachineState *machine)
>       NubusBus *nubus;
>       DeviceState *glue;
>       DriveInfo *dinfo;
> +    ResetInfo *reset_info;
>       uint8_t rng_seed[32];
>   
>       linux_boot = (kernel_filename != NULL);
> @@ -396,9 +408,12 @@ static void q800_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    reset_info = g_new0(ResetInfo, 1);
> +
>       /* init CPUs */
>       cpu = M68K_CPU(cpu_create(machine->cpu_type));
> -    qemu_register_reset(main_cpu_reset, cpu);
> +    reset_info->cpu = cpu;
> +    qemu_register_reset(main_cpu_reset, reset_info);
>   
>       /* RAM */
>       memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> @@ -598,6 +613,14 @@ static void q800_init(MachineState *machine)
>       cs = CPU(cpu);
>       if (linux_boot) {
>           uint64_t high;
> +        void *param_blob, *param_ptr, *param_rng_seed;
> +
> +        if (kernel_cmdline) {
> +            param_blob = g_malloc(strlen(kernel_cmdline) + 1024);
> +        } else {
> +            param_blob = g_malloc(1024);
> +        }
> +
>           kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
>                                  &elf_entry, NULL, &high, NULL, 1,
>                                  EM_68K, 0, 0);
> @@ -607,23 +630,24 @@ static void q800_init(MachineState *machine)
>           }
>           stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
>           parameters_base = (high + 1) & ~1;
> -
> -        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_MAC);
> -        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_CPUID, CPUB_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_MODEL, MAC_MODEL_Q800);
> -        BOOTINFO1(cs->as, parameters_base,
> +        param_ptr = param_blob;
> +
> +        BOOTINFO1(param_ptr, BI_MACHTYPE, MACH_MAC);
> +        BOOTINFO1(param_ptr, BI_FPUTYPE, FPU_68040);
> +        BOOTINFO1(param_ptr, BI_MMUTYPE, MMU_68040);
> +        BOOTINFO1(param_ptr, BI_CPUTYPE, CPU_68040);
> +        BOOTINFO1(param_ptr, BI_MAC_CPUID, CPUB_68040);
> +        BOOTINFO1(param_ptr, BI_MAC_MODEL, MAC_MODEL_Q800);
> +        BOOTINFO1(param_ptr,
>                     BI_MAC_MEMSIZE, ram_size >> 20); /* in MB */
> -        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_VADDR,
> +        BOOTINFO2(param_ptr, BI_MEMCHUNK, 0, ram_size);
> +        BOOTINFO1(param_ptr, BI_MAC_VADDR,
>                     VIDEO_BASE + macfb_mode->offset);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDEPTH, graphic_depth);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDIM,
> +        BOOTINFO1(param_ptr, BI_MAC_VDEPTH, graphic_depth);
> +        BOOTINFO1(param_ptr, BI_MAC_VDIM,
>                     (graphic_height << 16) | graphic_width);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW, macfb_mode->stride);
> -        BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
> +        BOOTINFO1(param_ptr, BI_MAC_VROW, macfb_mode->stride);
> +        BOOTINFO1(param_ptr, BI_MAC_SCCBASE, SCC_BASE);
>   
>           rom = g_malloc(sizeof(*rom));
>           memory_region_init_ram_ptr(rom, NULL, "m68k_fake_mac.rom",
> @@ -632,13 +656,14 @@ static void q800_init(MachineState *machine)
>           memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
>   
>           if (kernel_cmdline) {
> -            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
> +            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
>                           kernel_cmdline);
>           }
>   
>           /* Pass seed to RNG. */
> +        param_rng_seed = param_ptr;
>           qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> -        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
> +        BOOTINFODATA(param_ptr, BI_RNG_SEED,
>                        rng_seed, sizeof(rng_seed));
>   
>           /* load initrd */
> @@ -653,13 +678,19 @@ static void q800_init(MachineState *machine)
>               initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
>               load_image_targphys(initrd_filename, initrd_base,
>                                   ram_size - initrd_base);
> -            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
> +            BOOTINFO2(param_ptr, BI_RAMDISK, initrd_base,
>                         initrd_size);
>           } else {
>               initrd_base = 0;
>               initrd_size = 0;
>           }
> -        BOOTINFO0(cs->as, parameters_base, BI_LAST);
> +        BOOTINFO0(param_ptr, BI_LAST);
> +        rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
> +                              parameters_base, cs->as);
> +        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
> +                                              param_ptr - param_blob) +
> +                               (param_rng_seed - param_blob);
> +        g_free(param_blob);
>       } else {
>           uint8_t *ptr;
>           /* allocate and load BIOS */
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index f7b903ea1b..89c4108eb5 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -89,6 +89,7 @@ typedef struct {
>       M68kCPU *cpu;
>       hwaddr initial_pc;
>       hwaddr initial_stack;
> +    struct bi_record *rng_seed;
>   } ResetInfo;
>   
>   static void main_cpu_reset(void *opaque)
> @@ -97,6 +98,11 @@ static void main_cpu_reset(void *opaque)
>       M68kCPU *cpu = reset_info->cpu;
>       CPUState *cs = CPU(cpu);
>   
> +    if (reset_info->rng_seed) {
> +        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
> +            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
> +    }
> +
>       cpu_reset(cs);
>       cpu->env.aregs[7] = reset_info->initial_stack;
>       cpu->env.pc = reset_info->initial_pc;
> @@ -212,6 +218,13 @@ static void virt_init(MachineState *machine)
>       if (kernel_filename) {
>           CPUState *cs = CPU(cpu);
>           uint64_t high;
> +        void *param_blob, *param_ptr, *param_rng_seed;
> +
> +        if (kernel_cmdline) {
> +            param_blob = g_malloc(strlen(kernel_cmdline) + 1024);
> +        } else {
> +            param_blob = g_malloc(1024);
> +        }
>   
>           kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
>                                  &elf_entry, NULL, &high, NULL, 1,
> @@ -222,35 +235,37 @@ static void virt_init(MachineState *machine)
>           }
>           reset_info->initial_pc = elf_entry;
>           parameters_base = (high + 1) & ~1;
> +        param_ptr = param_blob;
>   
> -        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
> -        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
> -        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
> -        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
> +        BOOTINFO1(param_ptr, BI_MACHTYPE, MACH_VIRT);
> +        BOOTINFO1(param_ptr, BI_FPUTYPE, FPU_68040);
> +        BOOTINFO1(param_ptr, BI_MMUTYPE, MMU_68040);
> +        BOOTINFO1(param_ptr, BI_CPUTYPE, CPU_68040);
> +        BOOTINFO2(param_ptr, BI_MEMCHUNK, 0, ram_size);
>   
> -        BOOTINFO1(cs->as, parameters_base, BI_VIRT_QEMU_VERSION,
> +        BOOTINFO1(param_ptr, BI_VIRT_QEMU_VERSION,
>                     ((QEMU_VERSION_MAJOR << 24) | (QEMU_VERSION_MINOR << 16) |
>                      (QEMU_VERSION_MICRO << 8)));
> -        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_PIC_BASE,
> +        BOOTINFO2(param_ptr, BI_VIRT_GF_PIC_BASE,
>                     VIRT_GF_PIC_MMIO_BASE, VIRT_GF_PIC_IRQ_BASE);
> -        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_RTC_BASE,
> +        BOOTINFO2(param_ptr, BI_VIRT_GF_RTC_BASE,
>                     VIRT_GF_RTC_MMIO_BASE, VIRT_GF_RTC_IRQ_BASE);
> -        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_TTY_BASE,
> +        BOOTINFO2(param_ptr, BI_VIRT_GF_TTY_BASE,
>                     VIRT_GF_TTY_MMIO_BASE, VIRT_GF_TTY_IRQ_BASE);
> -        BOOTINFO2(cs->as, parameters_base, BI_VIRT_CTRL_BASE,
> +        BOOTINFO2(param_ptr, BI_VIRT_CTRL_BASE,
>                     VIRT_CTRL_MMIO_BASE, VIRT_CTRL_IRQ_BASE);
> -        BOOTINFO2(cs->as, parameters_base, BI_VIRT_VIRTIO_BASE,
> +        BOOTINFO2(param_ptr, BI_VIRT_VIRTIO_BASE,
>                     VIRT_VIRTIO_MMIO_BASE, VIRT_VIRTIO_IRQ_BASE);
>   
>           if (kernel_cmdline) {
> -            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
> +            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
>                           kernel_cmdline);
>           }
>   
>           /* Pass seed to RNG. */
> +        param_rng_seed = param_ptr;
>           qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> -        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
> +        BOOTINFODATA(param_ptr, BI_RNG_SEED,
>                        rng_seed, sizeof(rng_seed));
>   
>           /* load initrd */
> @@ -265,13 +280,19 @@ static void virt_init(MachineState *machine)
>               initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
>               load_image_targphys(initrd_filename, initrd_base,
>                                   ram_size - initrd_base);
> -            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
> +            BOOTINFO2(param_ptr, BI_RAMDISK, initrd_base,
>                         initrd_size);
>           } else {
>               initrd_base = 0;
>               initrd_size = 0;
>           }
> -        BOOTINFO0(cs->as, parameters_base, BI_LAST);
> +        BOOTINFO0(param_ptr, BI_LAST);
> +        rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
> +                              parameters_base, cs->as);
> +        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
> +                                              param_ptr - param_blob) +
> +                               (param_rng_seed - param_blob);
> +        g_free(param_blob);
>       }
>   }
>   


