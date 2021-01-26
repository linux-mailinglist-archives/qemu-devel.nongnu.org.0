Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F848303BFE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:48:07 +0100 (CET)
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MpK-0006EW-Aj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4MY5-0008Gq-R1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4MY3-0004D0-4v
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611660614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AfdP3sAaStJ9lO9lzz5W2YdJt+dw3GMAfKZO10X6Jjs=;
 b=glWvr9mU7O+SwQBjU+8iBEU8LcnNy2HlEqg7WjxIj5JjTlphI2PMz6yrsqDLLhbe3ODYiR
 Bj6RU8JFFp1zIxkjti5iTnbJ78otxVOq7+e2t/iFsyyT5GGYN5o1H4LtXLoGy1FlOXcdhd
 rxEOc5a9/KHZ+8oKuT07VA/5++iOz4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-U-o7GoSlND-1DxLrI1Q6Uw-1; Tue, 26 Jan 2021 06:30:10 -0500
X-MC-Unique: U-o7GoSlND-1DxLrI1Q6Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88FCBBBEE3;
 Tue, 26 Jan 2021 11:30:08 +0000 (UTC)
Received: from work-vm (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8735D60C5F;
 Tue, 26 Jan 2021 11:29:46 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:29:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 3/6] sev/i386: Allow AP booting under SEV-ES
Message-ID: <20210126112943.GD2978@work-vm>
References: <cover.1610665956.git.thomas.lendacky@amd.com>
 <d3c455185bffe37da738746015db553cf903c53b.1610665956.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3c455185bffe37da738746015db553cf903c53b.1610665956.git.thomas.lendacky@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> When SEV-ES is enabled, it is not possible modify the guests register
> state after it has been initially created, encrypted and measured.
> 
> Normally, an INIT-SIPI-SIPI request is used to boot the AP. However, the
> hypervisor cannot emulate this because it cannot update the AP register
> state. For the very first boot by an AP, the reset vector CS segment
> value and the EIP value must be programmed before the register has been
> encrypted and measured. Search the guest firmware for the guest for a
> specific GUID that tells Qemu the value of the reset vector to use.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++++++
>  accel/stubs/kvm-stub.c |  5 +++
>  hw/i386/pc_sysfw.c     | 10 +++++-
>  include/sysemu/kvm.h   | 16 +++++++++
>  include/sysemu/sev.h   |  3 ++
>  target/i386/kvm/kvm.c  |  2 ++
>  target/i386/sev.c      | 74 ++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 173 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 389eaace72..9db74b465e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -39,6 +39,7 @@
>  #include "qemu/main-loop.h"
>  #include "trace.h"
>  #include "hw/irq.h"
> +#include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
>  #include "qapi/visitor.h"
>  #include "qapi/qapi-types-common.h"
> @@ -123,6 +124,12 @@ struct KVMState
>      /* memory encryption */
>      void *memcrypt_handle;
>      int (*memcrypt_encrypt_data)(void *handle, uint8_t *ptr, uint64_t len);
> +    int (*memcrypt_save_reset_vector)(void *handle, void *flash_ptr,
> +                                      uint64_t flash_size, uint32_t *addr);
> +
> +    uint32_t reset_cs;
> +    uint32_t reset_ip;
> +    bool reset_data_valid;
>  
>      /* For "info mtree -f" to tell if an MR is registered in KVM */
>      int nr_as;
> @@ -242,6 +249,62 @@ int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
>      return 1;
>  }
>  
> +void kvm_memcrypt_set_reset_vector(CPUState *cpu)
> +{
> +    X86CPU *x86;
> +    CPUX86State *env;
> +
> +    /* Only update if we have valid reset information */
> +    if (!kvm_state->reset_data_valid) {
> +        return;
> +    }
> +
> +    /* Do not update the BSP reset state */
> +    if (cpu->cpu_index == 0) {
> +        return;
> +    }
> +
> +    x86 = X86_CPU(cpu);
> +    env = &x86->env;
> +
> +    cpu_x86_load_seg_cache(env, R_CS, 0xf000, kvm_state->reset_cs, 0xffff,
> +                           DESC_P_MASK | DESC_S_MASK | DESC_CS_MASK |
> +                           DESC_R_MASK | DESC_A_MASK);
> +
> +    env->eip = kvm_state->reset_ip;
> +}
> +
> +int kvm_memcrypt_save_reset_vector(void *flash_ptr, uint64_t flash_size)
> +{
> +    CPUState *cpu;
> +    uint32_t addr;
> +    int ret;
> +
> +    if (kvm_memcrypt_enabled() &&
> +        kvm_state->memcrypt_save_reset_vector) {
> +
> +        addr = 0;
> +        ret = kvm_state->memcrypt_save_reset_vector(kvm_state->memcrypt_handle,
> +                                                    flash_ptr, flash_size,
> +                                                    &addr);
> +        if (ret) {
> +            return ret;
> +        }
> +
> +        if (addr) {
> +            kvm_state->reset_cs = addr & 0xffff0000;
> +            kvm_state->reset_ip = addr & 0x0000ffff;
> +            kvm_state->reset_data_valid = true;
> +
> +            CPU_FOREACH(cpu) {
> +                kvm_memcrypt_set_reset_vector(cpu);
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /* Called with KVMMemoryListener.slots_lock held */
>  static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
>  {
> @@ -2213,6 +2276,7 @@ static int kvm_init(MachineState *ms)
>          }
>  
>          kvm_state->memcrypt_encrypt_data = sev_encrypt_data;
> +        kvm_state->memcrypt_save_reset_vector = sev_es_save_reset_vector;
>      }
>  
>      ret = kvm_arch_init(ms, s);
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 680e099463..162c28429e 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -91,6 +91,11 @@ int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
>    return 1;
>  }
>  
> +int kvm_memcrypt_save_reset_vector(void *flash_ptr, uint64_t flash_size)
> +{
> +    return -ENOSYS;
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>  {
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 436b78c587..edec28842d 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -248,7 +248,8 @@ static void pc_system_flash_map(PCMachineState *pcms,
>      PFlashCFI01 *system_flash;
>      MemoryRegion *flash_mem;
>      void *flash_ptr;
> -    int ret, flash_size;
> +    uint64_t flash_size;
> +    int ret;
>  
>      assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
>  
> @@ -301,6 +302,13 @@ static void pc_system_flash_map(PCMachineState *pcms,
>                   * search for them
>                   */
>                  pc_system_parse_ovmf_flash(flash_ptr, flash_size);
> +
> +                ret = kvm_memcrypt_save_reset_vector(flash_ptr, flash_size);
> +                if (ret) {
> +                    error_report("failed to locate and/or save reset vector");
> +                    exit(1);
> +                }
> +
>                  ret = kvm_memcrypt_encrypt_data(flash_ptr, flash_size);
>                  if (ret) {
>                      error_report("failed to encrypt pflash rom");
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index bb5d5cf497..875ca101e3 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -249,6 +249,22 @@ bool kvm_memcrypt_enabled(void);
>   */
>  int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len);
>  
> +/**
> + * kvm_memcrypt_set_reset_vector - sets the CS/IP value for the AP if SEV-ES
> + *                                 is active.
> + */
> +void kvm_memcrypt_set_reset_vector(CPUState *cpu);
> +
> +/**
> + * kvm_memcrypt_save_reset_vector - locates and saves the reset vector to be
> + *                                  used as the initial CS/IP value for APs
> + *                                  if SEV-ES is active.
> + *
> + * Return: 1 SEV-ES is active and failed to locate a valid reset vector
> + *         0 SEV-ES is not active or successfully located and saved the
> + *           reset vector address
> + */
> +int kvm_memcrypt_save_reset_vector(void *flash_prt, uint64_t flash_size);
>  
>  #ifdef NEED_CPU_H
>  #include "cpu.h"
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 7ab6e3e31d..6f5ad3fd03 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -20,4 +20,7 @@ void *sev_guest_init(const char *id);
>  int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>                               uint64_t gpa, Error **errp);
> +int sev_es_save_reset_vector(void *handle, void *flash_ptr,
> +                             uint64_t flash_size, uint32_t *addr);
> +
>  #endif
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 6dc1ee052d..aaae79557d 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1920,6 +1920,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
>      }
>      /* enabled by default */
>      env->poll_control_msr = 1;
> +
> +    kvm_memcrypt_set_reset_vector(CPU(cpu));
>  }
>  
>  void kvm_arch_do_init_vcpu(X86CPU *cpu)
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index ddec7ebaa7..badc141554 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -22,6 +22,7 @@
>  #include "qom/object_interfaces.h"
>  #include "qemu/base64.h"
>  #include "qemu/module.h"
> +#include "qemu/uuid.h"
>  #include "sysemu/kvm.h"
>  #include "sev_i386.h"
>  #include "sysemu/sysemu.h"
> @@ -31,6 +32,7 @@
>  #include "qom/object.h"
>  #include "exec/address-spaces.h"
>  #include "monitor/monitor.h"
> +#include "hw/i386/pc.h"
>  
>  #define TYPE_SEV_GUEST "sev-guest"
>  OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
> @@ -71,6 +73,12 @@ struct SevGuestState {
>  #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
>  #define DEFAULT_SEV_DEVICE      "/dev/sev"
>  
> +#define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
> +typedef struct __attribute__((__packed__)) SevInfoBlock {
> +    /* SEV-ES Reset Vector Address */
> +    uint32_t reset_addr;
> +} SevInfoBlock;
> +
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
>  
> @@ -896,6 +904,72 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
>      return 0;
>  }
>  
> +static int
> +sev_es_parse_reset_block(SevInfoBlock *info, uint32_t *addr)
> +{
> +    if (!info->reset_addr) {
> +        error_report("SEV-ES reset address is zero");
> +        return 1;
> +    }
> +
> +    *addr = info->reset_addr;
> +
> +    return 0;
> +}
> +
> +int
> +sev_es_save_reset_vector(void *handle, void *flash_ptr, uint64_t flash_size,
> +                         uint32_t *addr)
> +{
> +    QemuUUID info_guid, *guid;
> +    SevInfoBlock *info;
> +    uint8_t *data;
> +    uint16_t *len;
> +
> +    assert(handle);
> +
> +    /*
> +     * Initialize the address to zero. An address of zero with a successful
> +     * return code indicates that SEV-ES is not active.
> +     */
> +    *addr = 0;
> +    if (!sev_es_enabled()) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Extract the AP reset vector for SEV-ES guests by locating the SEV GUID.
> +     * The SEV GUID is located on its own (original implementation) or within
> +     * the Firmware GUID Table (new implementation), either of which are
> +     * located 32 bytes from the end of the flash.
> +     *
> +     * Check the Firmware GUID Table first.
> +     */
> +    if (pc_system_ovmf_table_find(SEV_INFO_BLOCK_GUID, &data, NULL)) {

OK, so that's the bit that requires James's series before we can merge
this one.
(That GUID seems to match what I see in ovmf)

Dave

> +        return sev_es_parse_reset_block((SevInfoBlock *)data, addr);
> +    }
> +
> +    /*
> +     * SEV info block not found in the Firmware GUID Table (or there isn't
> +     * a Firmware GUID Table), fall back to the original implementation.
> +     */
> +    data = flash_ptr + flash_size - 0x20;
> +
> +    qemu_uuid_parse(SEV_INFO_BLOCK_GUID, &info_guid);
> +    info_guid = qemu_uuid_bswap(info_guid); /* GUIDs are LE */
> +
> +    guid = (QemuUUID *)(data - sizeof(info_guid));
> +    if (!qemu_uuid_is_equal(guid, &info_guid)) {
> +        error_report("SEV information block/Firmware GUID Table block not found in pflash rom");
> +        return 1;
> +    }
> +
> +    len = (uint16_t *)((uint8_t *)guid - sizeof(*len));
> +    info = (SevInfoBlock *)(data - le16_to_cpu(*len));
> +
> +    return sev_es_parse_reset_block(info, addr);
> +}
> +
>  static void
>  sev_register_types(void)
>  {
> -- 
> 2.30.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


