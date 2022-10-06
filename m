Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BD5F63C4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:41:35 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNNl-0003xC-8S
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ogMkL-0006N4-1G
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:00:49 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ogMkI-0001WW-E5
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:00:48 -0400
Received: by mail-lj1-x22c.google.com with SMTP id t16so1475395ljh.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=J5BZq2YLqqWPaOwmpxGseKERUoTY6n8Kp5tCLgez/yI=;
 b=itoU76FiafC02BwoiMB9QEOPZi0Nyu3AK9aqnfv4zII8heDVgraCd+to4XdDfyhjKV
 U/s0qrPsW77zIrVcAZssOW1Fvt2NRo4YeV4UeA88CroHEn6Uqmo0WMQcrxJjd/pHsj07
 9WL798C9R91o77J3bN88odxkrssvl7vtn7l71x0H+7KjooKsuoECLqCqwVhxAnvmsuWt
 6At/iWIVgNCkZwP1geIdErmrTZKC2RFmaTmOfTeGuG+n7FttTCcjDIGyOjCWZyLOzFqV
 OjvlK2Uak30N4So4ZfqkvHzNXUSRmZ/WJmhx19I3RSMNbDY3LxYUXv62D+XeXfd3KpSw
 S81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=J5BZq2YLqqWPaOwmpxGseKERUoTY6n8Kp5tCLgez/yI=;
 b=8FN/AZ/3+zD7H49kpkFF5uqdHNgXLWQLyptufaITTykO3RXmRFs3Mgw3ym1KUjNJOE
 T2vzkkpAwmhO+ZgFB1UO+hFUKIp5Y1Jf1HFstGkXsep6zVG2bhal06o5cpArgkfxPX4b
 ybUP6LaqoTKUAtNAVMAmpTz9ki+XjWIG1kfaTavSXTYznbfv9VDwG+k1eDNOfxa4jaDZ
 gjQKrLlt0THZr9Og0o2zNYmu2N39N4J/86mFWMuOpEkRmk7qkY/56eyGRjAgJ4c+rgH8
 qF2XfoMgGImjtg2SN4cq2HL5dRc3E4gH4buSqQUn/AbV7lQJ8vBUkIryHltIe5idOL6v
 sraw==
X-Gm-Message-State: ACrzQf3MkM2A5+eC/tWHLugOR0q5TsJwZA0aVaUZKPUXwF2G2TEmG0Rf
 v0l3EmT/6NOcXQ4Bh4OjP5z+N4puMLOFz99gqoPjjA==
X-Google-Smtp-Source: AMsMyM5v65CTMk0Ps8dQNibHgFGHWmHcOE331YOfVRWrJyexxUALITXHFhqZI9Dp9EWkCucUj/qn6tYhiJYMGvkkc50=
X-Received: by 2002:a05:651c:1508:b0:26c:622e:abe1 with SMTP id
 e8-20020a05651c150800b0026c622eabe1mr1316030ljf.228.1665046844451; Thu, 06
 Oct 2022 02:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
In-Reply-To: <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Oct 2022 10:00:08 +0100
Message-ID: <CA+EHjTyvDXUCv7m4_h9+vZ+ctt1NioOub7aPiNt3wM-iqkPQ-Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] KVM: Extend the memslot to support fd-based
 private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=tabba@google.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi,

I'm not sure if this patch or the last one might be the best place for
it, but I think it would be useful to have a KVM_CAP associated with
this. I am working on getting kvmtool to work with this, and I haven't
found a clean way of getting it to discover whether mem_private is
supported.

Thanks.,
/fuad

On Thu, Sep 15, 2022 at 3:35 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> In memory encryption usage, guest memory may be encrypted with special
> key and can be accessed only by the VM itself. We call such memory
> private memory. It's valueless and sometimes can cause problem to allow
> userspace to access guest private memory. This patch extends the KVM
> memslot definition so that guest private memory can be provided though
> an inaccessible_notifier enlightened file descriptor (fd), without being
> mmaped into userspace.
>
> This new extension, indicated by the new flag KVM_MEM_PRIVATE, adds two
> additional KVM memslot fields private_fd/private_offset to allow
> userspace to specify that guest private memory provided from the
> private_fd and guest_phys_addr mapped at the private_offset of the
> private_fd, spanning a range of memory_size.
>
> The extended memslot can still have the userspace_addr(hva). When use, a
> single memslot can maintain both private memory through private
> fd(private_fd/private_offset) and shared memory through
> hva(userspace_addr). Whether the private or shared part is visible to
> guest is maintained by other KVM code.
>
> Since there is no userspace mapping for private fd so we cannot
> get_user_pages() to get the pfn in KVM, instead we add a new
> inaccessible_notifier in the internal memslot structure and rely on it
> to get pfn by interacting with the memory file systems.
>
> Together with the change, a new config HAVE_KVM_PRIVATE_MEM is added and
> right now it is selected on X86_64 for Intel TDX usage.
>
> To make code maintenance easy, internally we use a binary compatible
> alias struct kvm_user_mem_region to handle both the normal and the
> '_ext' variants.
>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  Documentation/virt/kvm/api.rst | 38 +++++++++++++++++++++-----
>  arch/x86/kvm/Kconfig           |  1 +
>  arch/x86/kvm/x86.c             |  2 +-
>  include/linux/kvm_host.h       | 13 +++++++--
>  include/uapi/linux/kvm.h       | 28 +++++++++++++++++++
>  virt/kvm/Kconfig               |  3 +++
>  virt/kvm/kvm_main.c            | 49 ++++++++++++++++++++++++++++------
>  7 files changed, 116 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index abd7c32126ce..c1fac1e9f820 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1319,7 +1319,7 @@ yet and must be cleared on entry.
>  :Capability: KVM_CAP_USER_MEMORY
>  :Architectures: all
>  :Type: vm ioctl
> -:Parameters: struct kvm_userspace_memory_region (in)
> +:Parameters: struct kvm_userspace_memory_region(_ext) (in)
>  :Returns: 0 on success, -1 on error
>
>  ::
> @@ -1332,9 +1332,18 @@ yet and must be cleared on entry.
>         __u64 userspace_addr; /* start of the userspace allocated memory */
>    };
>
> +  struct kvm_userspace_memory_region_ext {
> +       struct kvm_userspace_memory_region region;
> +       __u64 private_offset;
> +       __u32 private_fd;
> +       __u32 pad1;
> +       __u64 pad2[14];
> +  };
> +
>    /* for kvm_memory_region::flags */
>    #define KVM_MEM_LOG_DIRTY_PAGES      (1UL << 0)
>    #define KVM_MEM_READONLY     (1UL << 1)
> +  #define KVM_MEM_PRIVATE              (1UL << 2)
>
>  This ioctl allows the user to create, modify or delete a guest physical
>  memory slot.  Bits 0-15 of "slot" specify the slot id and this value
> @@ -1365,12 +1374,27 @@ It is recommended that the lower 21 bits of guest_phys_addr and userspace_addr
>  be identical.  This allows large pages in the guest to be backed by large
>  pages in the host.
>
> -The flags field supports two flags: KVM_MEM_LOG_DIRTY_PAGES and
> -KVM_MEM_READONLY.  The former can be set to instruct KVM to keep track of
> -writes to memory within the slot.  See KVM_GET_DIRTY_LOG ioctl to know how to
> -use it.  The latter can be set, if KVM_CAP_READONLY_MEM capability allows it,
> -to make a new slot read-only.  In this case, writes to this memory will be
> -posted to userspace as KVM_EXIT_MMIO exits.
> +kvm_userspace_memory_region_ext includes all the kvm_userspace_memory_region
> +fields. It also includes additional fields for some specific features. See
> +below description of flags field for more information. It's recommended to use
> +kvm_userspace_memory_region_ext in new userspace code.
> +
> +The flags field supports below flags:
> +
> +- KVM_MEM_LOG_DIRTY_PAGES can be set to instruct KVM to keep track of writes to
> +  memory within the slot.  See KVM_GET_DIRTY_LOG ioctl to know how to use it.
> +
> +- KVM_MEM_READONLY can be set, if KVM_CAP_READONLY_MEM capability allows it, to
> +  make a new slot read-only.  In this case, writes to this memory will be posted
> +  to userspace as KVM_EXIT_MMIO exits.
> +
> +- KVM_MEM_PRIVATE can be set to indicate a new slot has private memory backed by
> +  a file descirptor(fd) and the content of the private memory is invisible to
> +  userspace. In this case, userspace should use private_fd/private_offset in
> +  kvm_userspace_memory_region_ext to instruct KVM to provide private memory to
> +  guest. Userspace should guarantee not to map the same pfn indicated by
> +  private_fd/private_offset to different gfns with multiple memslots. Failed to
> +  do this may result undefined behavior.
>
>  When the KVM_CAP_SYNC_MMU capability is available, changes in the backing of
>  the memory region are automatically reflected into the guest.  For example, an
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index e3cbd7706136..31db64ec0b33 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -48,6 +48,7 @@ config KVM
>         select SRCU
>         select INTERVAL_TREE
>         select HAVE_KVM_PM_NOTIFIER if PM
> +       select HAVE_KVM_PRIVATE_MEM if X86_64
>         help
>           Support hosting fully virtualized guest machines using hardware
>           virtualization extensions.  You will need a fairly recent
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index d7374d768296..081f62ccc9a1 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12183,7 +12183,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
>         }
>
>         for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> -               struct kvm_userspace_memory_region m;
> +               struct kvm_user_mem_region m;
>
>                 m.slot = id | (i << 16);
>                 m.flags = 0;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f4519d3689e1..eac1787b899b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -44,6 +44,7 @@
>
>  #include <asm/kvm_host.h>
>  #include <linux/kvm_dirty_ring.h>
> +#include <linux/memfd.h>
>
>  #ifndef KVM_MAX_VCPU_IDS
>  #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
> @@ -576,8 +577,16 @@ struct kvm_memory_slot {
>         u32 flags;
>         short id;
>         u16 as_id;
> +       struct file *private_file;
> +       loff_t private_offset;
> +       struct inaccessible_notifier notifier;
>  };
>
> +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
> +{
> +       return slot && (slot->flags & KVM_MEM_PRIVATE);
> +}
> +
>  static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
>  {
>         return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
> @@ -1104,9 +1113,9 @@ enum kvm_mr_change {
>  };
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -                         const struct kvm_userspace_memory_region *mem);
> +                         const struct kvm_user_mem_region *mem);
>  int __kvm_set_memory_region(struct kvm *kvm,
> -                           const struct kvm_userspace_memory_region *mem);
> +                           const struct kvm_user_mem_region *mem);
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
>  void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
>  int kvm_arch_prepare_memory_region(struct kvm *kvm,
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index eed0315a77a6..3ef462fb3b2a 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -103,6 +103,33 @@ struct kvm_userspace_memory_region {
>         __u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>
> +struct kvm_userspace_memory_region_ext {
> +       struct kvm_userspace_memory_region region;
> +       __u64 private_offset;
> +       __u32 private_fd;
> +       __u32 pad1;
> +       __u64 pad2[14];
> +};
> +
> +#ifdef __KERNEL__
> +/*
> + * kvm_user_mem_region is a kernel-only alias of kvm_userspace_memory_region_ext
> + * that "unpacks" kvm_userspace_memory_region so that KVM can directly access
> + * all fields from the top-level "extended" region.
> + */
> +struct kvm_user_mem_region {
> +       __u32 slot;
> +       __u32 flags;
> +       __u64 guest_phys_addr;
> +       __u64 memory_size;
> +       __u64 userspace_addr;
> +       __u64 private_offset;
> +       __u32 private_fd;
> +       __u32 pad1;
> +       __u64 pad2[14];
> +};
> +#endif
> +
>  /*
>   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
>   * other bits are reserved for kvm internal use which are defined in
> @@ -110,6 +137,7 @@ struct kvm_userspace_memory_region {
>   */
>  #define KVM_MEM_LOG_DIRTY_PAGES        (1UL << 0)
>  #define KVM_MEM_READONLY       (1UL << 1)
> +#define KVM_MEM_PRIVATE                (1UL << 2)
>
>  /* for KVM_IRQ_LINE */
>  struct kvm_irq_level {
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index a8c5c9f06b3c..ccaff13cc5b8 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -72,3 +72,6 @@ config KVM_XFER_TO_GUEST_WORK
>
>  config HAVE_KVM_PM_NOTIFIER
>         bool
> +
> +config HAVE_KVM_PRIVATE_MEM
> +       bool
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 584a5bab3af3..12dc0dc57b06 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1526,7 +1526,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
>         }
>  }
>
> -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> +static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
>  {
>         u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>
> @@ -1920,7 +1920,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>   * Must be called holding kvm->slots_lock for write.
>   */
>  int __kvm_set_memory_region(struct kvm *kvm,
> -                           const struct kvm_userspace_memory_region *mem)
> +                           const struct kvm_user_mem_region *mem)
>  {
>         struct kvm_memory_slot *old, *new;
>         struct kvm_memslots *slots;
> @@ -2024,7 +2024,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
>
>  int kvm_set_memory_region(struct kvm *kvm,
> -                         const struct kvm_userspace_memory_region *mem)
> +                         const struct kvm_user_mem_region *mem)
>  {
>         int r;
>
> @@ -2036,7 +2036,7 @@ int kvm_set_memory_region(struct kvm *kvm,
>  EXPORT_SYMBOL_GPL(kvm_set_memory_region);
>
>  static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
> -                                         struct kvm_userspace_memory_region *mem)
> +                                         struct kvm_user_mem_region *mem)
>  {
>         if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
>                 return -EINVAL;
> @@ -4622,6 +4622,33 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>         return fd;
>  }
>
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)                                   \
> +do {                                                                           \
> +       BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=             \
> +                    offsetof(struct kvm_userspace_memory_region, field));      \
> +       BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=         \
> +                    sizeof_field(struct kvm_userspace_memory_region, field));  \
> +} while (0)
> +
> +#define SANITY_CHECK_MEM_REGION_EXT_FIELD(field)                                       \
> +do {                                                                                   \
> +       BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=                     \
> +                    offsetof(struct kvm_userspace_memory_region_ext, field));          \
> +       BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=                 \
> +                    sizeof_field(struct kvm_userspace_memory_region_ext, field));      \
> +} while (0)
> +
> +static void kvm_sanity_check_user_mem_region_alias(void)
> +{
> +       SANITY_CHECK_MEM_REGION_FIELD(slot);
> +       SANITY_CHECK_MEM_REGION_FIELD(flags);
> +       SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +       SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +       SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
> +       SANITY_CHECK_MEM_REGION_EXT_FIELD(private_offset);
> +       SANITY_CHECK_MEM_REGION_EXT_FIELD(private_fd);
> +}
> +
>  static long kvm_vm_ioctl(struct file *filp,
>                            unsigned int ioctl, unsigned long arg)
>  {
> @@ -4645,14 +4672,20 @@ static long kvm_vm_ioctl(struct file *filp,
>                 break;
>         }
>         case KVM_SET_USER_MEMORY_REGION: {
> -               struct kvm_userspace_memory_region kvm_userspace_mem;
> +               struct kvm_user_mem_region mem;
> +               unsigned long size = sizeof(struct kvm_userspace_memory_region);
> +
> +               kvm_sanity_check_user_mem_region_alias();
>
>                 r = -EFAULT;
> -               if (copy_from_user(&kvm_userspace_mem, argp,
> -                                               sizeof(kvm_userspace_mem)))
> +               if (copy_from_user(&mem, argp, size);
> +                       goto out;
> +
> +               r = -EINVAL;
> +               if (mem.flags & KVM_MEM_PRIVATE)
>                         goto out;
>
> -               r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> +               r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>                 break;
>         }
>         case KVM_GET_DIRTY_LOG: {
> --
> 2.25.1
>

