Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E54CFE3E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:24:43 +0100 (CET)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCPq-0007nR-3l
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRBug-0007Ql-9z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:52:30 -0500
Received: from [2a00:1450:4864:20::32e] (port=40713
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRBuX-0003oT-Hu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:52:28 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5412135wmb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YgKUGm+ItFZa5GXaCpMgRoJ5YASOFbrtmMciAOmIl+M=;
 b=jZ14MdQGm2pxUFkvuIJjs1SJPWYy5rqeijY1510Bzo8WgJHYTuOlPhQCdEFEBNMdKo
 QI/IzxUcXGNEjvvDqDAcwbhOHoBJhV0T7YZdVqcjYz7Y+2lozLLilyawtOFCd+dWQ5bt
 kAGnbMbcr1XZvbB5PXiNHWYBct77W/RURpBNu/ykm10EhSJy6n6CuL3crQEdjqwHkD8F
 x3SUJ1dDkvMzbjgqfU6u7khVkXpbZdhotgE6SsggJz4GWA9CAOyIps0BkY+h5tjN4cHb
 MXnHfQ0C8t0P5YxtkO2ui0PRFNPbHFiRPT1O9bDE4K6a1OounrZzOyzkIku6SNrkif/L
 Nm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YgKUGm+ItFZa5GXaCpMgRoJ5YASOFbrtmMciAOmIl+M=;
 b=0sNsJV5WSaSd2VhAMHUHibD1OMQY2mBF30BdktaEjWgKjapdv8Z7p7iRlNepZAVlqQ
 TqSxGCPfey9jTiu3b27uoR6rLTkTKDGesuGSnX4tAJvG4QNYXuKJj7DoZRjMhbDjJDhR
 J+CTrXhQCoyOu7JKKeIYjs0YKEOoXn8dzuxwTEgg3w1Q1J1jb8Iczoi8IsYqJnElTjOa
 1kdmL9IZAcaf2xnonLOdsLnkU6ab1QVPwaPJiceXqWISGazlf5zvVTpd/bWIUIG5crBF
 6vWwJ2pXxIy+7tYkeaiypA4Y18L2ZcwtxTZ12z8pA8xRIrv3XIbISRf08eHDr41H+nLy
 Mi0w==
X-Gm-Message-State: AOAM533+5DpOYnzBCSNW1APjaWNohwKiE56mxB/vM82n/7T9XU1L2L82
 EjuqoCCT2kkJsIrT2Y6ekxcCwIwAY4QHOG3T3l6eAXLWoQU=
X-Google-Smtp-Source: ABdhPJy4V52mVL59mcMnbMc5ZHPi+2B73z2+p7Ap4v6Sp79TW48a7/Yn9kMqL+o8yVdHrbuwhm8uPCkW4zIJbDl7irM=
X-Received: by 2002:a1c:ed14:0:b0:381:2165:6f05 with SMTP id
 l20-20020a1ced14000000b0038121656f05mr8765841wmh.80.1646653938588; Mon, 07
 Mar 2022 03:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20220301144611.1299277-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220301144611.1299277-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 15:52:06 +0400
Message-ID: <CAJ+F1CJfO+BQ5ZB+GRZJPxkLbkEWnQVrDc_m-R3EoMddkXv+Kg@mail.gmail.com>
Subject: Re: [PATCH] RFC: replace qemu_real_host_page variables with inlined
 functions
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000013dfff05d99f7f0b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013dfff05d99f7f0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 6:48 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace the global variables with inlined helper functions. getpagesize()
> is very
> likely annotated with a "const" function attribute (at least with glibc),
> and thus
> optimization should apply even better.
>
> This avoids the need for a constructor initialization too.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Any comments?

thanks


> ---
>  include/exec/cpu-common.h      |  2 +-
>  include/exec/ram_addr.h        |  2 +-
>  include/qemu/osdep.h           | 15 +++++++++++----
>  accel/hvf/hvf-accel-ops.c      |  2 +-
>  accel/kvm/kvm-all.c            | 20 ++++++++++----------
>  backends/hostmem.c             |  2 +-
>  block.c                        |  4 ++--
>  block/file-posix.c             |  6 +++---
>  block/io.c                     |  2 +-
>  block/nvme.c                   | 22 +++++++++++-----------
>  block/parallels.c              |  2 +-
>  block/qcow2-cache.c            |  2 +-
>  bsd-user/elfload.c             |  2 +-
>  bsd-user/mmap.c                |  2 +-
>  contrib/vhost-user-gpu/vugbm.c |  2 +-
>  cpu.c                          |  2 +-
>  hw/display/qxl.c               |  2 +-
>  hw/intc/s390_flic_kvm.c        |  2 +-
>  hw/nvram/fw_cfg.c              |  6 +++---
>  hw/ppc/mac_newworld.c          |  2 +-
>  hw/ppc/spapr_pci.c             |  2 +-
>  hw/rdma/vmw/pvrdma_main.c      |  2 +-
>  hw/scsi/scsi-generic.c         |  2 +-
>  hw/tpm/tpm_ppi.c               |  2 +-
>  hw/vfio/common.c               | 24 ++++++++++++------------
>  hw/vfio/pci.c                  | 10 +++++-----
>  hw/vfio/spapr.c                |  8 ++++----
>  hw/virtio/vhost-user.c         |  4 ++--
>  hw/virtio/vhost-vdpa.c         |  4 ++--
>  hw/virtio/virtio-mem.c         | 10 +++++-----
>  linux-user/elfload.c           |  4 ++--
>  linux-user/mmap.c              |  2 +-
>  migration/migration.c          |  2 +-
>  migration/postcopy-ram.c       |  4 ++--
>  monitor/misc.c                 |  2 +-
>  softmmu/physmem.c              |  6 +++---
>  target/i386/hax/hax-mem.c      | 10 +++++-----
>  target/i386/nvmm/nvmm-all.c    |  8 ++++----
>  target/i386/whpx/whpx-all.c    |  8 ++++----
>  target/ppc/kvm.c               |  2 +-
>  tcg/region.c                   |  8 ++++----
>  tests/vhost-user-bridge.c      |  8 ++++----
>  util/cutils.c                  |  4 ++--
>  util/mmap-alloc.c              | 10 +++++-----
>  util/osdep.c                   |  4 ++--
>  util/oslib-posix.c             |  8 ++++----
>  util/oslib-win32.c             |  2 +-
>  util/pagesize.c                | 18 ------------------
>  util/vfio-helpers.c            | 14 +++++++-------
>  scripts/checkpatch.pl          |  4 ++--
>  util/meson.build               |  1 -
>  51 files changed, 143 insertions(+), 155 deletions(-)
>  delete mode 100644 util/pagesize.c
>
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 3ea13d73a84d..64ac942416e3 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -14,7 +14,7 @@ extern uintptr_t qemu_host_page_size;
>  extern intptr_t qemu_host_page_mask;
>
>  #define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
> -#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr),
> qemu_real_host_page_size)
> +#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr),
> qemu_real_host_page_size())
>
>  /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
>  void qemu_init_cpu_list(void);
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 64fb936c7c74..f3e0c78161d1 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -343,7 +343,7 @@ static inline void
> cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
>      hwaddr addr;
>      ram_addr_t ram_addr;
>      unsigned long len =3D (pages + HOST_LONG_BITS - 1) / HOST_LONG_BITS;
> -    unsigned long hpratio =3D qemu_real_host_page_size / TARGET_PAGE_SIZ=
E;
> +    unsigned long hpratio =3D qemu_real_host_page_size() / TARGET_PAGE_S=
IZE;
>      unsigned long page =3D BIT_WORD(start >> TARGET_PAGE_BITS);
>
>      /* start address is aligned at the start of a word? */
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 24b8ec687bb4..054cbcff78e3 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -452,9 +452,9 @@ static inline void qemu_cleanup_generic_vfree(void *p=
)
>     /* Use 1 MiB (segment size) alignment so gmap can be used by KVM. */
>  #  define QEMU_VMALLOC_ALIGN (256 * 4096)
>  #elif defined(__linux__) && defined(__sparc__)
> -#  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size, SHMLBA)
> +#  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size(), SHMLBA)
>  #else
> -#  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size
> +#  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size()
>  #endif
>
>  #ifdef CONFIG_POSIX
> @@ -611,8 +611,15 @@ pid_t qemu_fork(Error **errp);
>  /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
>   * when intptr_t is 32-bit and we are aligning a long long.
>   */
> -extern uintptr_t qemu_real_host_page_size;
> -extern intptr_t qemu_real_host_page_mask;
> +static inline uintptr_t qemu_real_host_page_size(void)
> +{
> +    return getpagesize();
> +}
> +
> +static inline intptr_t qemu_real_host_page_mask(void)
> +{
> +    return -(intptr_t)qemu_real_host_page_size();
> +}
>
>  /*
>   * After using getopt or getopt_long, if you need to parse another set
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 54457c76c2f3..a70e2eb375dc 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -122,7 +122,7 @@ static void hvf_set_phys_mem(MemoryRegionSection
> *section, bool add)
>      MemoryRegion *area =3D section->mr;
>      bool writeable =3D !area->readonly && !area->rom_device;
>      hv_memory_flags_t flags;
> -    uint64_t page_size =3D qemu_real_host_page_size;
> +    uint64_t page_size =3D qemu_real_host_page_size();
>
>      if (!memory_region_is_ram(area)) {
>          if (writeable) {
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index fd39de984d7c..662df3206302 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -59,7 +59,7 @@
>  #ifdef PAGE_SIZE
>  #undef PAGE_SIZE
>  #endif
> -#define PAGE_SIZE qemu_real_host_page_size
> +#define PAGE_SIZE qemu_real_host_page_size()
>
>  #ifndef KVM_GUESTDBG_BLOCKIRQ
>  #define KVM_GUESTDBG_BLOCKIRQ 0
> @@ -324,14 +324,14 @@ static hwaddr kvm_align_section(MemoryRegionSection
> *section,
>         with sub-page size and unaligned start address. Pad the start
>         address to next and truncate size to previous page boundary. */
>      aligned =3D ROUND_UP(section->offset_within_address_space,
> -                       qemu_real_host_page_size);
> +                       qemu_real_host_page_size());
>      delta =3D aligned - section->offset_within_address_space;
>      *start =3D aligned;
>      if (delta > size) {
>          return 0;
>      }
>
> -    return (size - delta) & qemu_real_host_page_mask;
> +    return (size - delta) & qemu_real_host_page_mask();
>  }
>
>  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
> @@ -626,7 +626,7 @@ static void kvm_log_stop(MemoryListener *listener,
>  static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
>  {
>      ram_addr_t start =3D slot->ram_start_offset;
> -    ram_addr_t pages =3D slot->memory_size / qemu_real_host_page_size;
> +    ram_addr_t pages =3D slot->memory_size / qemu_real_host_page_size();
>
>      cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start,
> pages);
>  }
> @@ -662,7 +662,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
>       * And mem->memory_size is aligned to it (otherwise this mem can't
>       * be registered to KVM).
>       */
> -    hwaddr bitmap_size =3D ALIGN(mem->memory_size /
> qemu_real_host_page_size,
> +    hwaddr bitmap_size =3D ALIGN(mem->memory_size /
> qemu_real_host_page_size(),
>                                          /*HOST_LONG_BITS*/ 64) / 8;
>      mem->dirty_bmap =3D g_malloc0(bitmap_size);
>      mem->dirty_bmap_size =3D bitmap_size;
> @@ -707,7 +707,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s,
> uint32_t as_id,
>      mem =3D &kml->slots[slot_id];
>
>      if (!mem->memory_size || offset >=3D
> -        (mem->memory_size / qemu_real_host_page_size)) {
> +        (mem->memory_size / qemu_real_host_page_size())) {
>          return;
>      }
>
> @@ -895,7 +895,7 @@ static void
> kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
>
>  /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
>  #define KVM_CLEAR_LOG_SHIFT  6
> -#define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size <<
> KVM_CLEAR_LOG_SHIFT)
> +#define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size() <<
> KVM_CLEAR_LOG_SHIFT)
>  #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>
>  static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t star=
t,
> @@ -904,7 +904,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int
> as_id, uint64_t start,
>      KVMState *s =3D kvm_state;
>      uint64_t end, bmap_start, start_delta, bmap_npages;
>      struct kvm_clear_dirty_log d;
> -    unsigned long *bmap_clear =3D NULL, psize =3D qemu_real_host_page_si=
ze;
> +    unsigned long *bmap_clear =3D NULL, psize =3D qemu_real_host_page_si=
ze();
>      int ret;
>
>      /*
> @@ -1335,7 +1335,7 @@ kvm_check_extension_list(KVMState *s, const
> KVMCapabilityInfo *list)
>  void kvm_set_max_memslot_size(hwaddr max_slot_size)
>  {
>      g_assert(
> -        ROUND_UP(max_slot_size, qemu_real_host_page_size) =3D=3D max_slo=
t_size
> +        ROUND_UP(max_slot_size, qemu_real_host_page_size()) =3D=3D
> max_slot_size
>      );
>      kvm_max_slot_size =3D max_slot_size;
>  }
> @@ -2340,7 +2340,7 @@ static int kvm_init(MachineState *ms)
>       * even with KVM.  TARGET_PAGE_SIZE is assumed to be the minimum
>       * page size for the system though.
>       */
> -    assert(TARGET_PAGE_SIZE <=3D qemu_real_host_page_size);
> +    assert(TARGET_PAGE_SIZE <=3D qemu_real_host_page_size());
>
>      s->sigmask_len =3D 8;
>
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index b2a5e905e866..a7bae3d713c9 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -319,7 +319,7 @@ size_t host_memory_backend_pagesize(HostMemoryBackend
> *memdev)
>  #else
>  size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>  {
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  }
>  #endif
>
> diff --git a/block.c b/block.c
> index b54d59d1fa2a..6067bbfbf5f4 100644
> --- a/block.c
> +++ b/block.c
> @@ -132,7 +132,7 @@ size_t bdrv_opt_mem_align(BlockDriverState *bs)
>  {
>      if (!bs || !bs->drv) {
>          /* page size or 4k (hdd sector size) should be on the safe side =
*/
> -        return MAX(4096, qemu_real_host_page_size);
> +        return MAX(4096, qemu_real_host_page_size());
>      }
>
>      return bs->bl.opt_mem_alignment;
> @@ -142,7 +142,7 @@ size_t bdrv_min_mem_align(BlockDriverState *bs)
>  {
>      if (!bs || !bs->drv) {
>          /* page size or 4k (hdd sector size) should be on the safe side =
*/
> -        return MAX(4096, qemu_real_host_page_size);
> +        return MAX(4096, qemu_real_host_page_size());
>      }
>
>      return bs->bl.min_mem_alignment;
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1f1756e192a5..7afc73a877c4 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -385,7 +385,7 @@ static void raw_probe_alignment(BlockDriverState *bs,
> int fd, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
>      char *buf;
> -    size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_size);
> +    size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_size());
>      size_t alignments[] =3D {1, 512, 1024, 2048, 4096};
>
>      /* For SCSI generic devices the alignment is not really used.
> @@ -1260,7 +1260,7 @@ static void raw_refresh_limits(BlockDriverState *bs=
,
> Error **errp)
>      raw_probe_alignment(bs, s->fd, errp);
>
>      bs->bl.min_mem_alignment =3D s->buf_align;
> -    bs->bl.opt_mem_alignment =3D MAX(s->buf_align,
> qemu_real_host_page_size);
> +    bs->bl.opt_mem_alignment =3D MAX(s->buf_align,
> qemu_real_host_page_size());
>
>      /*
>       * Maximum transfers are best effort, so it is okay to ignore any
> @@ -1885,7 +1885,7 @@ static int allocate_first_block(int fd, size_t
> max_size)
>      size_t write_size =3D (max_size < MAX_BLOCKSIZE)
>          ? BDRV_SECTOR_SIZE
>          : MAX_BLOCKSIZE;
> -    size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_size);
> +    size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_size());
>      void *buf;
>      ssize_t n;
>      int ret;
> diff --git a/block/io.c b/block/io.c
> index 4e4cb556c586..be97040e121f 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -200,7 +200,7 @@ void bdrv_refresh_limits(BlockDriverState *bs,
> Transaction *tran, Error **errp)
>
>      if (!have_limits) {
>          bs->bl.min_mem_alignment =3D 512;
> -        bs->bl.opt_mem_alignment =3D qemu_real_host_page_size;
> +        bs->bl.opt_mem_alignment =3D qemu_real_host_page_size();
>
>          /* Safe default since most protocols use readv()/writev()/etc */
>          bs->bl.max_iov =3D IOV_MAX;
> diff --git a/block/nvme.c b/block/nvme.c
> index dd20de3865b3..ec5db6008afa 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -168,9 +168,9 @@ static bool nvme_init_queue(BDRVNVMeState *s,
> NVMeQueue *q,
>      size_t bytes;
>      int r;
>
> -    bytes =3D ROUND_UP(nentries * entry_bytes, qemu_real_host_page_size)=
;
> +    bytes =3D ROUND_UP(nentries * entry_bytes, qemu_real_host_page_size(=
));
>      q->head =3D q->tail =3D 0;
> -    q->queue =3D qemu_try_memalign(qemu_real_host_page_size, bytes);
> +    q->queue =3D qemu_try_memalign(qemu_real_host_page_size(), bytes);
>      if (!q->queue) {
>          error_setg(errp, "Cannot allocate queue");
>          return false;
> @@ -231,8 +231,8 @@ static NVMeQueuePair
> *nvme_create_queue_pair(BDRVNVMeState *s,
>      trace_nvme_create_queue_pair(idx, q, size, aio_context,
>                                   event_notifier_get_fd(s->irq_notifier))=
;
>      bytes =3D QEMU_ALIGN_UP(s->page_size * NVME_NUM_REQS,
> -                          qemu_real_host_page_size);
> -    q->prp_list_pages =3D qemu_try_memalign(qemu_real_host_page_size,
> bytes);
> +                          qemu_real_host_page_size());
> +    q->prp_list_pages =3D qemu_try_memalign(qemu_real_host_page_size(),
> bytes);
>      if (!q->prp_list_pages) {
>          error_setg(errp, "Cannot allocate PRP page list");
>          goto fail;
> @@ -532,9 +532,9 @@ static bool nvme_identify(BlockDriverState *bs, int
> namespace, Error **errp)
>          .opcode =3D NVME_ADM_CMD_IDENTIFY,
>          .cdw10 =3D cpu_to_le32(0x1),
>      };
> -    size_t id_size =3D QEMU_ALIGN_UP(sizeof(*id), qemu_real_host_page_si=
ze);
> +    size_t id_size =3D QEMU_ALIGN_UP(sizeof(*id),
> qemu_real_host_page_size());
>
> -    id =3D qemu_try_memalign(qemu_real_host_page_size, id_size);
> +    id =3D qemu_try_memalign(qemu_real_host_page_size(), id_size);
>      if (!id) {
>          error_setg(errp, "Cannot allocate buffer for identify response")=
;
>          goto out;
> @@ -1047,7 +1047,7 @@ static coroutine_fn int
> nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
>          bool retry =3D true;
>          uint64_t iova;
>          size_t len =3D QEMU_ALIGN_UP(qiov->iov[i].iov_len,
> -                                   qemu_real_host_page_size);
> +                                   qemu_real_host_page_size());
>  try_map:
>          r =3D qemu_vfio_dma_map(s->vfio,
>                                qiov->iov[i].iov_base,
> @@ -1223,8 +1223,8 @@ static inline bool
> nvme_qiov_aligned(BlockDriverState *bs,
>
>      for (i =3D 0; i < qiov->niov; ++i) {
>          if (!QEMU_PTR_IS_ALIGNED(qiov->iov[i].iov_base,
> -                                 qemu_real_host_page_size) ||
> -            !QEMU_IS_ALIGNED(qiov->iov[i].iov_len,
> qemu_real_host_page_size)) {
> +                                 qemu_real_host_page_size()) ||
> +            !QEMU_IS_ALIGNED(qiov->iov[i].iov_len,
> qemu_real_host_page_size())) {
>              trace_nvme_qiov_unaligned(qiov, i, qiov->iov[i].iov_base,
>                                        qiov->iov[i].iov_len, s->page_size=
);
>              return false;
> @@ -1240,7 +1240,7 @@ static int nvme_co_prw(BlockDriverState *bs,
> uint64_t offset, uint64_t bytes,
>      int r;
>      QEMU_AUTO_VFREE uint8_t *buf =3D NULL;
>      QEMUIOVector local_qiov;
> -    size_t len =3D QEMU_ALIGN_UP(bytes, qemu_real_host_page_size);
> +    size_t len =3D QEMU_ALIGN_UP(bytes, qemu_real_host_page_size());
>      assert(QEMU_IS_ALIGNED(offset, s->page_size));
>      assert(QEMU_IS_ALIGNED(bytes, s->page_size));
>      assert(bytes <=3D s->max_transfer);
> @@ -1250,7 +1250,7 @@ static int nvme_co_prw(BlockDriverState *bs,
> uint64_t offset, uint64_t bytes,
>      }
>      s->stats.unaligned_accesses++;
>      trace_nvme_prw_buffered(s, offset, bytes, qiov->niov, is_write);
> -    buf =3D qemu_try_memalign(qemu_real_host_page_size, len);
> +    buf =3D qemu_try_memalign(qemu_real_host_page_size(), len);
>
>      if (!buf) {
>          return -ENOMEM;
> diff --git a/block/parallels.c b/block/parallels.c
> index 6ebad2a2bbc9..94911bb0dec4 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -869,7 +869,7 @@ static int parallels_open(BlockDriverState *bs, QDict
> *options, int flags,
>          }
>      }
>
> -    s->bat_dirty_block =3D 4 * qemu_real_host_page_size;
> +    s->bat_dirty_block =3D 4 * qemu_real_host_page_size();
>      s->bat_dirty_bmap =3D
>          bitmap_new(DIV_ROUND_UP(s->header_size, s->bat_dirty_block));
>
> diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c
> index 7444b9c4ab03..f803e70f1811 100644
> --- a/block/qcow2-cache.c
> +++ b/block/qcow2-cache.c
> @@ -74,7 +74,7 @@ static void qcow2_cache_table_release(Qcow2Cache *c, in=
t
> i, int num_tables)
>  /* Using MADV_DONTNEED to discard memory is a Linux-specific feature */
>  #ifdef CONFIG_LINUX
>      void *t =3D qcow2_cache_get_table_addr(c, i);
> -    int align =3D qemu_real_host_page_size;
> +    int align =3D qemu_real_host_page_size();
>      size_t mem_size =3D (size_t) c->table_size * num_tables;
>      size_t offset =3D QEMU_ALIGN_UP((uintptr_t) t, align) - (uintptr_t) =
t;
>      size_t length =3D QEMU_ALIGN_DOWN(mem_size - offset, align);
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 142a5bfac260..f8edb22f2ab1 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -246,7 +246,7 @@ static void padzero(abi_ulong elf_bss, abi_ulong
> last_bss)
>       * patch target_mmap(), but it is more complicated as the file
>       * size must be known.
>       */
> -    if (qemu_real_host_page_size < qemu_host_page_size) {
> +    if (qemu_real_host_page_size() < qemu_host_page_size) {
>          abi_ulong end_addr, end_addr1;
>          end_addr1 =3D REAL_HOST_PAGE_ALIGN(elf_bss);
>          end_addr =3D HOST_PAGE_ALIGN(elf_bss);
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 13cb32dba13e..07aa0a634dff 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -515,7 +515,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int prot,
>       * up to the targets page boundary.
>       */
>
> -    if ((qemu_real_host_page_size < qemu_host_page_size) && fd !=3D -1) =
{
> +    if ((qemu_real_host_page_size() < qemu_host_page_size) && fd !=3D -1=
) {
>          struct stat sb;
>
>          if (fstat(fd, &sb) =3D=3D -1) {
> diff --git a/contrib/vhost-user-gpu/vugbm.c
> b/contrib/vhost-user-gpu/vugbm.c
> index fb15d0372c25..503d0a4566f8 100644
> --- a/contrib/vhost-user-gpu/vugbm.c
> +++ b/contrib/vhost-user-gpu/vugbm.c
> @@ -53,7 +53,7 @@ struct udmabuf_create {
>  static size_t
>  udmabuf_get_size(struct vugbm_buffer *buf)
>  {
> -    return ROUND_UP(buf->width * buf->height * 4,
> qemu_real_host_page_size);
> +    return ROUND_UP(buf->width * buf->height * 4,
> qemu_real_host_page_size());
>  }
>
>  static bool
> diff --git a/cpu.c b/cpu.c
> index 3ea38aea7077..c02bfded99d6 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -470,7 +470,7 @@ void page_size_init(void)
>      /* NOTE: we can always suppose that qemu_host_page_size >=3D
>         TARGET_PAGE_SIZE */
>      if (qemu_host_page_size =3D=3D 0) {
> -        qemu_host_page_size =3D qemu_real_host_page_size;
> +        qemu_host_page_size =3D qemu_real_host_page_size();
>      }
>      if (qemu_host_page_size < TARGET_PAGE_SIZE) {
>          qemu_host_page_size =3D TARGET_PAGE_SIZE;
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 1f9ad319438d..7cbdca47a38e 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -320,7 +320,7 @@ static ram_addr_t qxl_rom_size(void)
>  #define QXL_ROM_SZ 8192
>
>      QEMU_BUILD_BUG_ON(QXL_REQUIRED_SZ > QXL_ROM_SZ);
> -    return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_size);
> +    return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_size());
>  }
>
>  static void init_qxl_rom(PCIQXLDevice *d)
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index efe5054182c3..4e86d2d43670 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -24,7 +24,7 @@
>  #include "trace.h"
>  #include "qom/object.h"
>
> -#define FLIC_SAVE_INITIAL_SIZE qemu_real_host_page_size
> +#define FLIC_SAVE_INITIAL_SIZE qemu_real_host_page_size()
>  #define FLIC_FAILED (-1UL)
>  #define FLIC_SAVEVM_VERSION 1
>
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index e5f3c981841d..ea2d56f9f2af 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -622,9 +622,9 @@ static bool fw_cfg_acpi_mr_restore(void *opaque)
>      FWCfgState *s =3D opaque;
>      bool mr_aligned;
>
> -    mr_aligned =3D QEMU_IS_ALIGNED(s->table_mr_size,
> qemu_real_host_page_size) &&
> -                 QEMU_IS_ALIGNED(s->linker_mr_size,
> qemu_real_host_page_size) &&
> -                 QEMU_IS_ALIGNED(s->rsdp_mr_size,
> qemu_real_host_page_size);
> +    mr_aligned =3D QEMU_IS_ALIGNED(s->table_mr_size,
> qemu_real_host_page_size()) &&
> +                 QEMU_IS_ALIGNED(s->linker_mr_size,
> qemu_real_host_page_size()) &&
> +                 QEMU_IS_ALIGNED(s->rsdp_mr_size,
> qemu_real_host_page_size());
>      return s->acpi_mr_restore && !mr_aligned;
>  }
>
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 4bddb529c2a6..7b5a205309af 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -456,7 +456,7 @@ static void ppc_core99_init(MachineState *machine)
>      }
>
>      /* The NewWorld NVRAM is not located in the MacIO device */
> -    if (kvm_enabled() && qemu_real_host_page_size > 4096) {
> +    if (kvm_enabled() && qemu_real_host_page_size() > 4096) {
>          /* We can't combine read-write and read-only in a single page, s=
o
>             move the NVRAM out of ROM again for KVM */
>          nvram_addr =3D 0xFFE00000;
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 5bfd4aa9e5aa..b2f5fbef0c83 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1978,7 +1978,7 @@ static void spapr_phb_realize(DeviceState *dev,
> Error **errp)
>       * our memory slot is of page size granularity.
>       */
>      if (kvm_enabled()) {
> -        msi_window_size =3D qemu_real_host_page_size;
> +        msi_window_size =3D qemu_real_host_page_size();
>      }
>
>      memory_region_init_io(&sphb->msiwindow, OBJECT(sphb), &spapr_msi_ops=
,
> spapr,
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 91206dbb8eb0..27a76224320e 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -608,7 +608,7 @@ static void pvrdma_realize(PCIDevice *pdev, Error
> **errp)
>      rdma_info_report("Initializing device %s %x.%x", pdev->name,
>                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>
> -    if (TARGET_PAGE_SIZE !=3D qemu_real_host_page_size) {
> +    if (TARGET_PAGE_SIZE !=3D qemu_real_host_page_size()) {
>          error_setg(errp, "Target page size must be the same as host page
> size");
>          return;
>      }
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 0306ccc7b1e4..0ab00ef85c95 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -183,7 +183,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
> *r, SCSIDevice *s, int len)
>              uint32_t max_iov =3D blk_get_max_hw_iov(s->conf.blk);
>
>              assert(max_transfer);
> -            max_transfer =3D MIN_NON_ZERO(max_transfer, max_iov *
> qemu_real_host_page_size)
> +            max_transfer =3D MIN_NON_ZERO(max_transfer, max_iov *
> qemu_real_host_page_size())
>                  / s->blocksize;
>              stl_be_p(&r->buf[8], max_transfer);
>              /* Also take care of the opt xfer len. */
> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
> index 6dbb9f41e40b..285cacab112f 100644
> --- a/hw/tpm/tpm_ppi.c
> +++ b/hw/tpm/tpm_ppi.c
> @@ -47,7 +47,7 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>  void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
>                    hwaddr addr, Object *obj)
>  {
> -    tpmppi->buf =3D qemu_memalign(qemu_real_host_page_size,
> +    tpmppi->buf =3D qemu_memalign(qemu_real_host_page_size(),
>                                  HOST_PAGE_ALIGN(TPM_PPI_ADDR_SIZE));
>      memory_region_init_ram_device_ptr(&tpmppi->ram, obj, "tpm-ppi",
>                                        TPM_PPI_ADDR_SIZE, tpmppi->buf);
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f511..2b1f78fdfaeb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -397,7 +397,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer
> *container,
>  {
>      struct vfio_iommu_type1_dma_unmap *unmap;
>      struct vfio_bitmap *bitmap;
> -    uint64_t pages =3D REAL_HOST_PAGE_ALIGN(size) /
> qemu_real_host_page_size;
> +    uint64_t pages =3D REAL_HOST_PAGE_ALIGN(size) /
> qemu_real_host_page_size();
>      int ret;
>
>      unmap =3D g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> @@ -414,7 +414,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer
> *container,
>       * to qemu_real_host_page_size.
>       */
>
> -    bitmap->pgsize =3D qemu_real_host_page_size;
> +    bitmap->pgsize =3D qemu_real_host_page_size();
>      bitmap->size =3D ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>                     BITS_PER_BYTE;
>
> @@ -882,8 +882,8 @@ static void vfio_listener_region_add(MemoryListener
> *listener,
>      }
>
>      if (unlikely((section->offset_within_address_space &
> -                  ~qemu_real_host_page_mask) !=3D
> -                 (section->offset_within_region &
> ~qemu_real_host_page_mask))) {
> +                  ~qemu_real_host_page_mask()) !=3D
> +                 (section->offset_within_region &
> ~qemu_real_host_page_mask()))) {
>          error_report("%s received unaligned region", __func__);
>          return;
>      }
> @@ -891,7 +891,7 @@ static void vfio_listener_region_add(MemoryListener
> *listener,
>      iova =3D REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>      llend =3D int128_make64(section->offset_within_address_space);
>      llend =3D int128_add(llend, section->size);
> -    llend =3D int128_and(llend, int128_exts64(qemu_real_host_page_mask))=
;
> +    llend =3D int128_and(llend, int128_exts64(qemu_real_host_page_mask()=
));
>
>      if (int128_ge(int128_make64(iova), llend)) {
>          if (memory_region_is_ram_device(section->mr)) {
> @@ -899,7 +899,7 @@ static void vfio_listener_region_add(MemoryListener
> *listener,
>                  memory_region_name(section->mr),
>                  section->offset_within_address_space,
>                  int128_getlo(section->size),
> -                qemu_real_host_page_size);
> +                qemu_real_host_page_size());
>          }
>          return;
>      }
> @@ -1118,8 +1118,8 @@ static void vfio_listener_region_del(MemoryListener
> *listener,
>      }
>
>      if (unlikely((section->offset_within_address_space &
> -                  ~qemu_real_host_page_mask) !=3D
> -                 (section->offset_within_region &
> ~qemu_real_host_page_mask))) {
> +                  ~qemu_real_host_page_mask()) !=3D
> +                 (section->offset_within_region &
> ~qemu_real_host_page_mask()))) {
>          error_report("%s received unaligned region", __func__);
>          return;
>      }
> @@ -1150,7 +1150,7 @@ static void vfio_listener_region_del(MemoryListener
> *listener,
>      iova =3D REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>      llend =3D int128_make64(section->offset_within_address_space);
>      llend =3D int128_add(llend, section->size);
> -    llend =3D int128_and(llend, int128_exts64(qemu_real_host_page_mask))=
;
> +    llend =3D int128_and(llend, int128_exts64(qemu_real_host_page_mask()=
));
>
>      if (int128_ge(int128_make64(iova), llend)) {
>          return;
> @@ -1272,9 +1272,9 @@ static int vfio_get_dirty_bitmap(VFIOContainer
> *container, uint64_t iova,
>       * qemu_real_host_page_size to mark those dirty. Hence set bitmap's
> pgsize
>       * to qemu_real_host_page_size.
>       */
> -    range->bitmap.pgsize =3D qemu_real_host_page_size;
> +    range->bitmap.pgsize =3D qemu_real_host_page_size();
>
> -    pages =3D REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_si=
ze;
> +    pages =3D REAL_HOST_PAGE_ALIGN(range->size) /
> qemu_real_host_page_size();
>      range->bitmap.size =3D ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE=
) /
>                                           BITS_PER_BYTE;
>      range->bitmap.data =3D g_try_malloc0(range->bitmap.size);
> @@ -1970,7 +1970,7 @@ static void
> vfio_get_iommu_info_migration(VFIOContainer *container,
>       * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap
> of
>       * qemu_real_host_page_size to mark those dirty.
>       */
> -    if (cap_mig->pgsize_bitmap & qemu_real_host_page_size) {
> +    if (cap_mig->pgsize_bitmap & qemu_real_host_page_size()) {
>          container->dirty_pages_supported =3D true;
>          container->max_dirty_bitmap_size =3D cap_mig->max_dirty_bitmap_s=
ize;
>          container->dirty_pgsizes =3D cap_mig->pgsize_bitmap;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7b45353ce27f..c9b616c933ed 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1084,8 +1084,8 @@ static void
> vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>
>      /* If BAR is mapped and page aligned, update to fill PAGE_SIZE */
>      if (bar_addr !=3D PCI_BAR_UNMAPPED &&
> -        !(bar_addr & ~qemu_real_host_page_mask)) {
> -        size =3D qemu_real_host_page_size;
> +        !(bar_addr & ~qemu_real_host_page_mask())) {
> +        size =3D qemu_real_host_page_size();
>      }
>
>      memory_region_transaction_begin();
> @@ -1201,7 +1201,7 @@ void vfio_pci_write_config(PCIDevice *pdev,
>          for (bar =3D 0; bar < PCI_ROM_SLOT; bar++) {
>              if (old_addr[bar] !=3D pdev->io_regions[bar].addr &&
>                  vdev->bars[bar].region.size > 0 &&
> -                vdev->bars[bar].region.size < qemu_real_host_page_size) =
{
> +                vdev->bars[bar].region.size < qemu_real_host_page_size()=
)
> {
>                  vfio_sub_page_bar_update_mapping(pdev, bar);
>              }
>          }
> @@ -1289,7 +1289,7 @@ static void vfio_pci_fixup_msix_region(VFIOPCIDevic=
e
> *vdev)
>      }
>
>      /* MSI-X table start and end aligned to host page size */
> -    start =3D vdev->msix->table_offset & qemu_real_host_page_mask;
> +    start =3D vdev->msix->table_offset & qemu_real_host_page_mask();
>      end =3D REAL_HOST_PAGE_ALIGN((uint64_t)vdev->msix->table_offset +
>                                 (vdev->msix->entries *
> PCI_MSIX_ENTRY_SIZE));
>
> @@ -2475,7 +2475,7 @@ static int vfio_pci_load_config(VFIODevice
> *vbasedev, QEMUFile *f)
>           */
>          if (old_addr[bar] !=3D pdev->io_regions[bar].addr &&
>              vdev->bars[bar].region.size > 0 &&
> -            vdev->bars[bar].region.size < qemu_real_host_page_size) {
> +            vdev->bars[bar].region.size < qemu_real_host_page_size()) {
>              vfio_sub_page_bar_update_mapping(pdev, bar);
>          }
>      }
> diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
> index 04c6e67f8fba..9ec1e95f6da7 100644
> --- a/hw/vfio/spapr.c
> +++ b/hw/vfio/spapr.c
> @@ -44,7 +44,7 @@ static void
> vfio_prereg_listener_region_add(MemoryListener *listener,
>      const hwaddr gpa =3D section->offset_within_address_space;
>      hwaddr end;
>      int ret;
> -    hwaddr page_mask =3D qemu_real_host_page_mask;
> +    hwaddr page_mask =3D qemu_real_host_page_mask();
>      struct vfio_iommu_spapr_register_memory reg =3D {
>          .argsz =3D sizeof(reg),
>          .flags =3D 0,
> @@ -102,7 +102,7 @@ static void
> vfio_prereg_listener_region_del(MemoryListener *listener,
>      const hwaddr gpa =3D section->offset_within_address_space;
>      hwaddr end;
>      int ret;
> -    hwaddr page_mask =3D qemu_real_host_page_mask;
> +    hwaddr page_mask =3D qemu_real_host_page_mask();
>      struct vfio_iommu_spapr_register_memory reg =3D {
>          .argsz =3D sizeof(reg),
>          .flags =3D 0,
> @@ -199,12 +199,12 @@ int vfio_spapr_create_window(VFIOContainer
> *container,
>       * Below we look at qemu_real_host_page_size as TCEs are allocated
> from
>       * system pages.
>       */
> -    bits_per_level =3D ctz64(qemu_real_host_page_size) + 8;
> +    bits_per_level =3D ctz64(qemu_real_host_page_size()) + 8;
>      create.levels =3D bits_total / bits_per_level;
>      if (bits_total % bits_per_level) {
>          ++create.levels;
>      }
> -    max_levels =3D (64 - create.page_shift) /
> ctz64(qemu_real_host_page_size);
> +    max_levels =3D (64 - create.page_shift) /
> ctz64(qemu_real_host_page_size());
>      for ( ; create.levels <=3D max_levels; ++create.levels) {
>          ret =3D ioctl(container->fd, VFIO_IOMMU_SPAPR_TCE_CREATE, &creat=
e);
>          if (!ret) {
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 662853513ec3..4a1ddeef6177 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1506,7 +1506,7 @@ static int
> vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
>                                                         int fd)
>  {
>      int queue_idx =3D area->u64 & VHOST_USER_VRING_IDX_MASK;
> -    size_t page_size =3D qemu_real_host_page_size;
> +    size_t page_size =3D qemu_real_host_page_size();
>      struct vhost_user *u =3D dev->opaque;
>      VhostUserState *user =3D u->user;
>      VirtIODevice *vdev =3D dev->vdev;
> @@ -2530,7 +2530,7 @@ void vhost_user_cleanup(VhostUserState *user)
>      for (i =3D 0; i < VIRTIO_QUEUE_MAX; i++) {
>          if (user->notifier[i].addr) {
>              object_unparent(OBJECT(&user->notifier[i].mr));
> -            munmap(user->notifier[i].addr, qemu_real_host_page_size);
> +            munmap(user->notifier[i].addr, qemu_real_host_page_size());
>              user->notifier[i].addr =3D NULL;
>          }
>      }
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 04ea43704f5d..639222447c30 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -380,7 +380,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d
> *opaque, Error **errp)
>  static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>                                              int queue_index)
>  {
> -    size_t page_size =3D qemu_real_host_page_size;
> +    size_t page_size =3D qemu_real_host_page_size();
>      struct vhost_vdpa *v =3D dev->opaque;
>      VirtIODevice *vdev =3D dev->vdev;
>      VhostVDPAHostNotifier *n;
> @@ -406,7 +406,7 @@ static void vhost_vdpa_host_notifiers_uninit(struct
> vhost_dev *dev, int n)
>
>  static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int
> queue_index)
>  {
> -    size_t page_size =3D qemu_real_host_page_size;
> +    size_t page_size =3D qemu_real_host_page_size();
>      struct vhost_vdpa *v =3D dev->opaque;
>      VirtIODevice *vdev =3D dev->vdev;
>      VhostVDPAHostNotifier *n;
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index f55dcf61f203..35cbf1f21946 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -53,11 +53,11 @@ static uint32_t virtio_mem_default_thp_size(void)
>  #if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)
>      default_thp_size =3D 2 * MiB;
>  #elif defined(__aarch64__)
> -    if (qemu_real_host_page_size =3D=3D 4 * KiB) {
> +    if (qemu_real_host_page_size() =3D=3D 4 * KiB) {
>          default_thp_size =3D 2 * MiB;
> -    } else if (qemu_real_host_page_size =3D=3D 16 * KiB) {
> +    } else if (qemu_real_host_page_size() =3D=3D 16 * KiB) {
>          default_thp_size =3D 32 * MiB;
> -    } else if (qemu_real_host_page_size =3D=3D 64 * KiB) {
> +    } else if (qemu_real_host_page_size() =3D=3D 64 * KiB) {
>          default_thp_size =3D 512 * MiB;
>      }
>  #endif
> @@ -120,7 +120,7 @@ static uint64_t virtio_mem_default_block_size(RAMBloc=
k
> *rb)
>      const uint64_t page_size =3D qemu_ram_pagesize(rb);
>
>      /* We can have hugetlbfs with a page size smaller than the THP size.
> */
> -    if (page_size =3D=3D qemu_real_host_page_size) {
> +    if (page_size =3D=3D qemu_real_host_page_size()) {
>          return MAX(page_size, virtio_mem_thp_size());
>      }
>      return MAX(page_size, VIRTIO_MEM_MIN_BLOCK_SIZE);
> @@ -135,7 +135,7 @@ static bool virtio_mem_has_shared_zeropage(RAMBlock
> *rb)
>       * fresh page, consuming actual memory.
>       */
>      return !qemu_ram_is_shared(rb) && rb->fd < 0 &&
> -           qemu_ram_pagesize(rb) =3D=3D qemu_real_host_page_size;
> +           qemu_ram_pagesize(rb) =3D=3D qemu_real_host_page_size();
>  }
>  #endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 9628a38361cb..3a7b75aa42da 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1916,8 +1916,8 @@ static abi_ulong setup_arg_pages(struct linux_binpr=
m
> *bprm,
>          size =3D STACK_LOWER_LIMIT;
>      }
>      guard =3D TARGET_PAGE_SIZE;
> -    if (guard < qemu_real_host_page_size) {
> -        guard =3D qemu_real_host_page_size;
> +    if (guard < qemu_real_host_page_size()) {
> +        guard =3D qemu_real_host_page_size();
>      }
>
>      error =3D target_mmap(0, size + guard, PROT_READ | PROT_WRITE,
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index c125031b9046..a861f1e1d144 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -494,7 +494,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int target_prot,
>         may need to truncate file maps at EOF and add extra anonymous pag=
es
>         up to the targets page boundary.  */
>
> -    if ((qemu_real_host_page_size < qemu_host_page_size) &&
> +    if ((qemu_real_host_page_size() < qemu_host_page_size) &&
>          !(flags & MAP_ANONYMOUS)) {
>          struct stat sb;
>
> diff --git a/migration/migration.c b/migration/migration.c
> index bcc385b94b10..830c320dbaa8 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2646,7 +2646,7 @@ static struct rp_cmd_args {
>  static void migrate_handle_rp_req_pages(MigrationState *ms, const char*
> rbname,
>                                         ram_addr_t start, size_t len)
>  {
> -    long our_host_ps =3D qemu_real_host_page_size;
> +    long our_host_ps =3D qemu_real_host_page_size();
>
>      trace_migrate_handle_rp_req_pages(rbname, start, len);
>
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2a2cc5faf8ff..702eef0cd2cd 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -305,7 +305,7 @@ static bool ufd_check_and_apply(int ufd,
> MigrationIncomingState *mis)
>          return false;
>      }
>
> -    if (qemu_real_host_page_size !=3D ram_pagesize_summary()) {
> +    if (qemu_real_host_page_size() !=3D ram_pagesize_summary()) {
>          bool have_hp =3D false;
>          /* We've got a huge page */
>  #ifdef UFFD_FEATURE_MISSING_HUGETLBFS
> @@ -343,7 +343,7 @@ static int test_ramblock_postcopiable(RAMBlock *rb,
> void *opaque)
>   */
>  bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>  {
> -    long pagesize =3D qemu_real_host_page_size;
> +    long pagesize =3D qemu_real_host_page_size();
>      int ufd =3D -1;
>      bool ret =3D false; /* Error unless we change it */
>      void *testarea =3D NULL;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index b1839cb8ee5d..8cdb493044cc 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -720,7 +720,7 @@ static uint64_t vtop(void *ptr, Error **errp)
>      uint64_t pinfo;
>      uint64_t ret =3D -1;
>      uintptr_t addr =3D (uintptr_t) ptr;
> -    uintptr_t pagesize =3D qemu_real_host_page_size;
> +    uintptr_t pagesize =3D qemu_real_host_page_size();
>      off_t offset =3D addr / pagesize * sizeof(pinfo);
>      int fd;
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index a13289a594ae..ea97505547e4 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1382,11 +1382,11 @@ long qemu_maxrampagesize(void)
>  #else
>  long qemu_minrampagesize(void)
>  {
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  }
>  long qemu_maxrampagesize(void)
>  {
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  }
>  #endif
>
> @@ -2162,7 +2162,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size,
> ram_addr_t max_size,
>      new_block->max_length =3D max_size;
>      assert(max_size >=3D size);
>      new_block->fd =3D -1;
> -    new_block->page_size =3D qemu_real_host_page_size;
> +    new_block->page_size =3D qemu_real_host_page_size();
>      new_block->host =3D host;
>      new_block->flags =3D ram_flags;
>      ram_block_add(new_block, &local_err);
> diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
> index a226d174d8ef..05dbe8cce3ae 100644
> --- a/target/i386/hax/hax-mem.c
> +++ b/target/i386/hax/hax-mem.c
> @@ -188,15 +188,15 @@ static void hax_process_section(MemoryRegionSection
> *section, uint8_t flags)
>      /* Adjust start_pa and size so that they are page-aligned. (Cf
>       * kvm_set_phys_mem() in kvm-all.c).
>       */
> -    delta =3D qemu_real_host_page_size - (start_pa &
> ~qemu_real_host_page_mask);
> -    delta &=3D ~qemu_real_host_page_mask;
> +    delta =3D qemu_real_host_page_size() - (start_pa &
> ~qemu_real_host_page_mask());
> +    delta &=3D ~qemu_real_host_page_mask();
>      if (delta > size) {
>          return;
>      }
>      start_pa +=3D delta;
>      size -=3D delta;
> -    size &=3D qemu_real_host_page_mask;
> -    if (!size || (start_pa & ~qemu_real_host_page_mask)) {
> +    size &=3D qemu_real_host_page_mask();
> +    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
>          return;
>      }
>
> @@ -214,7 +214,7 @@ static void hax_process_section(MemoryRegionSection
> *section, uint8_t flags)
>       * call into the kernel. Instead, we split the mapping into smaller
> ones,
>       * and call hax_update_mapping() on each.
>       */
> -    max_mapping_size =3D UINT32_MAX & qemu_real_host_page_mask;
> +    max_mapping_size =3D UINT32_MAX & qemu_real_host_page_mask();
>      while (size > max_mapping_size) {
>          hax_update_mapping(start_pa, max_mapping_size, host_va, flags);
>          start_pa +=3D max_mapping_size;
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 9af261eea32d..ce9a283bb33e 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -1075,15 +1075,15 @@ nvmm_process_section(MemoryRegionSection *section=
,
> int add)
>      }
>
>      /* Adjust start_pa and size so that they are page-aligned. */
> -    delta =3D qemu_real_host_page_size - (start_pa &
> ~qemu_real_host_page_mask);
> -    delta &=3D ~qemu_real_host_page_mask;
> +    delta =3D qemu_real_host_page_size() - (start_pa &
> ~qemu_real_host_page_mask());
> +    delta &=3D ~qemu_real_host_page_mask();
>      if (delta > size) {
>          return;
>      }
>      start_pa +=3D delta;
>      size -=3D delta;
> -    size &=3D qemu_real_host_page_mask;
> -    if (!size || (start_pa & ~qemu_real_host_page_mask)) {
> +    size &=3D qemu_real_host_page_mask();
> +    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
>          return;
>      }
>
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index ef896da0a211..600afd000659 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1544,15 +1544,15 @@ static void
> whpx_process_section(MemoryRegionSection *section, int add)
>          return;
>      }
>
> -    delta =3D qemu_real_host_page_size - (start_pa &
> ~qemu_real_host_page_mask);
> -    delta &=3D ~qemu_real_host_page_mask;
> +    delta =3D qemu_real_host_page_size() - (start_pa &
> ~qemu_real_host_page_mask());
> +    delta &=3D ~qemu_real_host_page_mask();
>      if (delta > size) {
>          return;
>      }
>      start_pa +=3D delta;
>      size -=3D delta;
> -    size &=3D qemu_real_host_page_mask;
> -    if (!size || (start_pa & ~qemu_real_host_page_mask)) {
> +    size &=3D qemu_real_host_page_mask();
> +    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
>          return;
>      }
>
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index d1f07c4f41d4..8644b85de847 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -418,7 +418,7 @@ void kvm_check_mmu(PowerPCCPU *cpu, Error **errp)
>           * will be a normal mapping, not a special hugepage one used
>           * for RAM.
>           */
> -        if (qemu_real_host_page_size < 0x10000) {
> +        if (qemu_real_host_page_size() < 0x10000) {
>              error_setg(errp,
>                         "KVM can't supply 64kiB CI pages, which guest
> expects");
>          }
> diff --git a/tcg/region.c b/tcg/region.c
> index 72afb3573893..08ab971eaf08 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -487,14 +487,14 @@ static int alloc_code_gen_buffer(size_t tb_size, in=
t
> splitwx, Error **errp)
>      /* page-align the beginning and end of the buffer */
>      buf =3D static_code_gen_buffer;
>      end =3D static_code_gen_buffer + sizeof(static_code_gen_buffer);
> -    buf =3D QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);
> -    end =3D QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);
> +    buf =3D QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size());
> +    end =3D QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size());
>
>      size =3D end - buf;
>
>      /* Honor a command-line option limiting the size of the buffer.  */
>      if (size > tb_size) {
> -        size =3D QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
> +        size =3D QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size());
>      }
>
>      region.start_aligned =3D buf;
> @@ -728,7 +728,7 @@ static int alloc_code_gen_buffer(size_t size, int
> splitwx, Error **errp)
>   */
>  void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
>  {
> -    const size_t page_size =3D qemu_real_host_page_size;
> +    const size_t page_size =3D qemu_real_host_page_size();
>      size_t region_size;
>      int have_prot, need_prot;
>
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 35088dd67f78..9b1dab2f2883 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -468,8 +468,8 @@ vubr_queue_set_started(VuDev *dev, int qidx, bool
> started)
>
>      if (started && vubr->notifier.fd >=3D 0) {
>          vu_set_queue_host_notifier(dev, vq, vubr->notifier.fd,
> -                                   qemu_real_host_page_size,
> -                                   qidx * qemu_real_host_page_size);
> +                                   qemu_real_host_page_size(),
> +                                   qidx * qemu_real_host_page_size());
>      }
>
>      if (qidx % 2 =3D=3D 1) {
> @@ -601,7 +601,7 @@ static void *notifier_thread(void *arg)
>  {
>      VuDev *dev =3D (VuDev *)arg;
>      VubrDev *vubr =3D container_of(dev, VubrDev, vudev);
> -    int pagesize =3D qemu_real_host_page_size;
> +    int pagesize =3D qemu_real_host_page_size();
>      int qidx;
>
>      while (true) {
> @@ -637,7 +637,7 @@ vubr_host_notifier_setup(VubrDev *dev)
>      void *addr;
>      int fd;
>
> -    length =3D qemu_real_host_page_size * VHOST_USER_BRIDGE_MAX_QUEUES;
> +    length =3D qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES=
;
>
>      fd =3D mkstemp(template);
>      if (fd < 0) {
> diff --git a/util/cutils.c b/util/cutils.c
> index 0d475ec4cddd..1173ce3b88f3 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -175,7 +175,7 @@ int qemu_fdatasync(int fd)
>  int qemu_msync(void *addr, size_t length, int fd)
>  {
>  #ifdef CONFIG_POSIX
> -    size_t align_mask =3D ~(qemu_real_host_page_size - 1);
> +    size_t align_mask =3D ~(qemu_real_host_page_size() - 1);
>
>      /**
>       * There are no strict reqs as per the length of mapping
> @@ -183,7 +183,7 @@ int qemu_msync(void *addr, size_t length, int fd)
>       * alignment changes. Additionally - round the size to the multiple
>       * of PAGE_SIZE
>       */
> -    length +=3D ((uintptr_t)addr & (qemu_real_host_page_size - 1));
> +    length +=3D ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
>      length =3D (length + ~align_mask) & align_mask;
>
>      addr =3D (void *)((uintptr_t)addr & align_mask);
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 893d864354a1..5b90cb68ea7d 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -50,7 +50,7 @@ size_t qemu_fd_getpagesize(int fd)
>  #endif
>  #endif
>
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  }
>
>  size_t qemu_mempath_getpagesize(const char *mem_path)
> @@ -81,7 +81,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
>  #endif
>  #endif
>
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  }
>
>  #define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> @@ -101,7 +101,7 @@ static bool map_noreserve_effective(int fd, uint32_t
> qemu_map_flags)
>       *    MAP_NORESERVE.
>       * b) MAP_NORESERVE is not affected by /proc/sys/vm/overcommit_memor=
y.
>       */
> -    if (qemu_fd_getpagesize(fd) !=3D qemu_real_host_page_size) {
> +    if (qemu_fd_getpagesize(fd) !=3D qemu_real_host_page_size()) {
>          return true;
>      }
>
> @@ -166,7 +166,7 @@ static void *mmap_reserve(size_t size, int fd)
>       * We do this unless we are using the system page size, in which cas=
e
>       * anonymous memory is OK.
>       */
> -    if (fd =3D=3D -1 || qemu_fd_getpagesize(fd) =3D=3D qemu_real_host_pa=
ge_size) {
> +    if (fd =3D=3D -1 || qemu_fd_getpagesize(fd) =3D=3D
> qemu_real_host_page_size()) {
>          fd =3D -1;
>          flags |=3D MAP_ANONYMOUS;
>      } else {
> @@ -243,7 +243,7 @@ static inline size_t mmap_guard_pagesize(int fd)
>      /* Mappings in the same segment must share the same page size */
>      return qemu_fd_getpagesize(fd);
>  #else
> -    return qemu_real_host_page_size;
> +    return qemu_real_host_page_size();
>  #endif
>  }
>
> diff --git a/util/osdep.c b/util/osdep.c
> index f16846e17722..a421ef6482aa 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -80,8 +80,8 @@ int qemu_madvise(void *addr, size_t len, int advice)
>
>  static int qemu_mprotect__osdep(void *addr, size_t size, int prot)
>  {
> -    g_assert(!((uintptr_t)addr & ~qemu_real_host_page_mask));
> -    g_assert(!(size & ~qemu_real_host_page_mask));
> +    g_assert(!((uintptr_t)addr & ~qemu_real_host_page_mask()));
> +    g_assert(!(size & ~qemu_real_host_page_mask()));
>
>  #ifdef _WIN32
>      DWORD old_protect;
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index f2be7321c59f..38aae17d9d8b 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -813,7 +813,7 @@ void *qemu_alloc_stack(size_t *sz)
>  #ifdef CONFIG_DEBUG_STACK_USAGE
>      void *ptr2;
>  #endif
> -    size_t pagesz =3D qemu_real_host_page_size;
> +    size_t pagesz =3D qemu_real_host_page_size();
>  #ifdef _SC_THREAD_STACK_MIN
>      /* avoid stacks smaller than _SC_THREAD_STACK_MIN */
>      long min_stack_sz =3D sysconf(_SC_THREAD_STACK_MIN);
> @@ -875,7 +875,7 @@ void qemu_free_stack(void *stack, size_t sz)
>      unsigned int usage;
>      void *ptr;
>
> -    for (ptr =3D stack + qemu_real_host_page_size; ptr < stack + sz;
> +    for (ptr =3D stack + qemu_real_host_page_size(); ptr < stack + sz;
>           ptr +=3D sizeof(uint32_t)) {
>          if (*(uint32_t *)ptr !=3D 0xdeadbeaf) {
>              break;
> @@ -973,10 +973,10 @@ size_t qemu_get_host_physmem(void)
>  #ifdef _SC_PHYS_PAGES
>      long pages =3D sysconf(_SC_PHYS_PAGES);
>      if (pages > 0) {
> -        if (pages > SIZE_MAX / qemu_real_host_page_size) {
> +        if (pages > SIZE_MAX / qemu_real_host_page_size()) {
>              return SIZE_MAX;
>          } else {
> -            return pages * qemu_real_host_page_size;
> +            return pages * qemu_real_host_page_size();
>          }
>      }
>  #endif
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index af559ef3398d..c0f510eadcac 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -374,7 +374,7 @@ void os_mem_prealloc(int fd, char *area, size_t
> memory, int smp_cpus,
>                       Error **errp)
>  {
>      int i;
> -    size_t pagesize =3D qemu_real_host_page_size;
> +    size_t pagesize =3D qemu_real_host_page_size();
>
>      memory =3D (memory + pagesize - 1) & -pagesize;
>      for (i =3D 0; i < memory / pagesize; i++) {
> diff --git a/util/pagesize.c b/util/pagesize.c
> deleted file mode 100644
> index 998632cf6ee6..000000000000
> --- a/util/pagesize.c
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * pagesize.c - query the host about its page size
> - *
> - * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> - * License: GNU GPL, version 2 or later.
> - *   See the COPYING file in the top-level directory.
> - */
> -
> -#include "qemu/osdep.h"
> -
> -uintptr_t qemu_real_host_page_size;
> -intptr_t qemu_real_host_page_mask;
> -
> -static void __attribute__((constructor)) init_real_host_page_size(void)
> -{
> -    qemu_real_host_page_size =3D getpagesize();
> -    qemu_real_host_page_mask =3D -(intptr_t)qemu_real_host_page_size;
> -}
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 00a80431a090..250a746a2aab 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -163,7 +163,7 @@ void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int
> index,
>                              Error **errp)
>  {
>      void *p;
> -    assert(QEMU_IS_ALIGNED(offset, qemu_real_host_page_size));
> +    assert(QEMU_IS_ALIGNED(offset, qemu_real_host_page_size()));
>      assert_bar_index_valid(s, index);
>      p =3D mmap(NULL, MIN(size, s->bar_region_info[index].size - offset),
>               prot, MAP_SHARED,
> @@ -591,9 +591,9 @@ static IOVAMapping
> *qemu_vfio_add_mapping(QEMUVFIOState *s,
>      IOVAMapping m =3D {.host =3D host, .size =3D size, .iova =3D iova};
>      IOVAMapping *insert;
>
> -    assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
> -    assert(QEMU_IS_ALIGNED(s->low_water_mark, qemu_real_host_page_size))=
;
> -    assert(QEMU_IS_ALIGNED(s->high_water_mark, qemu_real_host_page_size)=
);
> +    assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size()));
> +    assert(QEMU_IS_ALIGNED(s->low_water_mark,
> qemu_real_host_page_size()));
> +    assert(QEMU_IS_ALIGNED(s->high_water_mark,
> qemu_real_host_page_size()));
>      trace_qemu_vfio_new_mapping(s, host, size, index, iova);
>
>      assert(index >=3D 0);
> @@ -644,7 +644,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s,
> IOVAMapping *mapping,
>
>      index =3D mapping - s->mappings;
>      assert(mapping->size > 0);
> -    assert(QEMU_IS_ALIGNED(mapping->size, qemu_real_host_page_size));
> +    assert(QEMU_IS_ALIGNED(mapping->size, qemu_real_host_page_size()));
>      assert(index >=3D 0 && index < s->nr_mappings);
>      if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>          error_setg_errno(errp, errno, "VFIO_UNMAP_DMA failed");
> @@ -752,8 +752,8 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host,
> size_t size,
>      IOVAMapping *mapping;
>      uint64_t iova0;
>
> -    assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size));
> -    assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
> +    assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size()));
> +    assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size()));
>      trace_qemu_vfio_dma_map(s, host, size, temporary, iova);
>      QEMU_LOCK_GUARD(&s->lock);
>      mapping =3D qemu_vfio_find_mapping(s, host, &index);
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 41f85699d030..4763d02ae78f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2974,10 +2974,10 @@ sub process {
>                         ERROR("use memset() instead of bzero()\n" .
> $herecurr);
>                 }
>                 if ($line =3D~ /\bgetpagesize\(\)/) {
> -                       ERROR("use qemu_real_host_page_size instead of
> getpagesize()\n" . $herecurr);
> +                       ERROR("use qemu_real_host_page_size() instead of
> getpagesize()\n" . $herecurr);
>                 }
>                 if ($line =3D~ /\bsysconf\(_SC_PAGESIZE\)/) {
> -                       ERROR("use qemu_real_host_page_size instead of
> sysconf(_SC_PAGESIZE)\n" . $herecurr);
> +                       ERROR("use qemu_real_host_page_size() instead of
> sysconf(_SC_PAGESIZE)\n" . $herecurr);
>                 }
>                 my $non_exit_glib_asserts =3D qr{g_assert_cmpstr|
>                                                 g_assert_cmpint|
> diff --git a/util/meson.build b/util/meson.build
> index 804014ea0216..afd1923baa2b 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -42,7 +42,6 @@ if have_membarrier
>    util_ss.add(files('sys_membarrier.c'))
>  endif
>  util_ss.add(files('log.c'))
> -util_ss.add(files('pagesize.c'))
>  util_ss.add(files('qdist.c'))
>  util_ss.add(files('qht.c'))
>  util_ss.add(files('qsp.c'))
> --
> 2.35.1.273.ge6ebfd0e8cbb
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000013dfff05d99f7f0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 6:48 PM &lt;<a=
 href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Replace the global variables with inlined helper functions. getpagesize() i=
s very<br>
likely annotated with a &quot;const&quot; function attribute (at least with=
 glibc), and thus<br>
optimization should apply even better.<br>
<br>
This avoids the need for a constructor initialization too.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Any comments?</div><div><br></div><div>thanks<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
=C2=A0include/exec/cpu-common.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/exec/ram_addr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++=
++++++++----<br>
=C2=A0accel/hvf/hvf-accel-ops.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0accel/kvm/kvm-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 +++=
+++++++----------<br>
=C2=A0backends/hostmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 +++---<br>
=C2=A0block/io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0block/nvme.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 22 +++++++++++-----------<br>
=C2=A0block/parallels.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0block/qcow2-cache.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
=C2=A0bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0bsd-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0contrib/vhost-user-gpu/vugbm.c |=C2=A0 2 +-<br>
=C2=A0cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/display/qxl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0hw/intc/s390_flic_kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/nvram/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++---<br>
=C2=A0hw/ppc/mac_newworld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0hw/ppc/spapr_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0hw/rdma/vmw/pvrdma_main.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/scsi/scsi-generic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0hw/tpm/tpm_ppi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0hw/vfio/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 24 ++++++++++++------------<br>
=C2=A0hw/vfio/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 10 +++++-----<br>
=C2=A0hw/vfio/spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 ++++----<br>
=C2=A0hw/virtio/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
=C2=A0hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
=C2=A0hw/virtio/virtio-mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++---=
--<br>
=C2=A0linux-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
=C2=A0linux-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0migration/migration.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0migration/postcopy-ram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0softmmu/physmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++---<br>
=C2=A0target/i386/hax/hax-mem.c=C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0target/i386/nvmm/nvmm-all.c=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0target/i386/whpx/whpx-all.c=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0target/ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0tcg/region.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0tests/vhost-user-bridge.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0util/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++--<br>
=C2=A0util/mmap-alloc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
0 +++++-----<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 ++++----<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0util/pagesize.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 ------------------<br>
=C2=A0util/vfio-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++=
++++-------<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--=
<br>
=C2=A0util/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A051 files changed, 143 insertions(+), 155 deletions(-)<br>
=C2=A0delete mode 100644 util/pagesize.c<br>
<br>
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h<br>
index 3ea13d73a84d..64ac942416e3 100644<br>
--- a/include/exec/cpu-common.h<br>
+++ b/include/exec/cpu-common.h<br>
@@ -14,7 +14,7 @@ extern uintptr_t qemu_host_page_size;<br>
=C2=A0extern intptr_t qemu_host_page_mask;<br>
<br>
=C2=A0#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)<b=
r>
-#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_si=
ze)<br>
+#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_si=
ze())<br>
<br>
=C2=A0/* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */<=
br>
=C2=A0void qemu_init_cpu_list(void);<br>
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h<br>
index 64fb936c7c74..f3e0c78161d1 100644<br>
--- a/include/exec/ram_addr.h<br>
+++ b/include/exec/ram_addr.h<br>
@@ -343,7 +343,7 @@ static inline void cpu_physical_memory_set_dirty_lebitm=
ap(unsigned long *bitmap,<br>
=C2=A0 =C2=A0 =C2=A0hwaddr addr;<br>
=C2=A0 =C2=A0 =C2=A0ram_addr_t ram_addr;<br>
=C2=A0 =C2=A0 =C2=A0unsigned long len =3D (pages + HOST_LONG_BITS - 1) / HO=
ST_LONG_BITS;<br>
-=C2=A0 =C2=A0 unsigned long hpratio =3D qemu_real_host_page_size / TARGET_=
PAGE_SIZE;<br>
+=C2=A0 =C2=A0 unsigned long hpratio =3D qemu_real_host_page_size() / TARGE=
T_PAGE_SIZE;<br>
=C2=A0 =C2=A0 =C2=A0unsigned long page =3D BIT_WORD(start &gt;&gt; TARGET_P=
AGE_BITS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* start address is aligned at the start of a word? */<=
br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index 24b8ec687bb4..054cbcff78e3 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -452,9 +452,9 @@ static inline void qemu_cleanup_generic_vfree(void *p)<=
br>
=C2=A0 =C2=A0 /* Use 1 MiB (segment size) alignment so gmap can be used by =
KVM. */<br>
=C2=A0#=C2=A0 define QEMU_VMALLOC_ALIGN (256 * 4096)<br>
=C2=A0#elif defined(__linux__) &amp;&amp; defined(__sparc__)<br>
-#=C2=A0 define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size, SHMLBA)<br=
>
+#=C2=A0 define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size(), SHMLBA)<=
br>
=C2=A0#else<br>
-#=C2=A0 define QEMU_VMALLOC_ALIGN qemu_real_host_page_size<br>
+#=C2=A0 define QEMU_VMALLOC_ALIGN qemu_real_host_page_size()<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef CONFIG_POSIX<br>
@@ -611,8 +611,15 @@ pid_t qemu_fork(Error **errp);<br>
=C2=A0/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even=
<br>
=C2=A0 * when intptr_t is 32-bit and we are aligning a long long.<br>
=C2=A0 */<br>
-extern uintptr_t qemu_real_host_page_size;<br>
-extern intptr_t qemu_real_host_page_mask;<br>
+static inline uintptr_t qemu_real_host_page_size(void)<br>
+{<br>
+=C2=A0 =C2=A0 return getpagesize();<br>
+}<br>
+<br>
+static inline intptr_t qemu_real_host_page_mask(void)<br>
+{<br>
+=C2=A0 =C2=A0 return -(intptr_t)qemu_real_host_page_size();<br>
+}<br>
<br>
=C2=A0/*<br>
=C2=A0 * After using getopt or getopt_long, if you need to parse another se=
t<br>
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c<br>
index 54457c76c2f3..a70e2eb375dc 100644<br>
--- a/accel/hvf/hvf-accel-ops.c<br>
+++ b/accel/hvf/hvf-accel-ops.c<br>
@@ -122,7 +122,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *secti=
on, bool add)<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *area =3D section-&gt;mr;<br>
=C2=A0 =C2=A0 =C2=A0bool writeable =3D !area-&gt;readonly &amp;&amp; !area-=
&gt;rom_device;<br>
=C2=A0 =C2=A0 =C2=A0hv_memory_flags_t flags;<br>
-=C2=A0 =C2=A0 uint64_t page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 uint64_t page_size =3D qemu_real_host_page_size();<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!memory_region_is_ram(area)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (writeable) {<br>
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
index fd39de984d7c..662df3206302 100644<br>
--- a/accel/kvm/kvm-all.c<br>
+++ b/accel/kvm/kvm-all.c<br>
@@ -59,7 +59,7 @@<br>
=C2=A0#ifdef PAGE_SIZE<br>
=C2=A0#undef PAGE_SIZE<br>
=C2=A0#endif<br>
-#define PAGE_SIZE qemu_real_host_page_size<br>
+#define PAGE_SIZE qemu_real_host_page_size()<br>
<br>
=C2=A0#ifndef KVM_GUESTDBG_BLOCKIRQ<br>
=C2=A0#define KVM_GUESTDBG_BLOCKIRQ 0<br>
@@ -324,14 +324,14 @@ static hwaddr kvm_align_section(MemoryRegionSection *=
section,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 with sub-page size and unaligned start address.=
 Pad the start<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 address to next and truncate size to previous p=
age boundary. */<br>
=C2=A0 =C2=A0 =C2=A0aligned =3D ROUND_UP(section-&gt;offset_within_address_=
space,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_real_host_page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_real_host_page_size());<br>
=C2=A0 =C2=A0 =C2=A0delta =3D aligned - section-&gt;offset_within_address_s=
pace;<br>
=C2=A0 =C2=A0 =C2=A0*start =3D aligned;<br>
=C2=A0 =C2=A0 =C2=A0if (delta &gt; size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return (size - delta) &amp; qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 return (size - delta) &amp; qemu_real_host_page_mask();<br>
=C2=A0}<br>
<br>
=C2=A0int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,<br>
@@ -626,7 +626,7 @@ static void kvm_log_stop(MemoryListener *listener,<br>
=C2=A0static void kvm_slot_sync_dirty_pages(KVMSlot *slot)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ram_addr_t start =3D slot-&gt;ram_start_offset;<br>
-=C2=A0 =C2=A0 ram_addr_t pages =3D slot-&gt;memory_size / qemu_real_host_p=
age_size;<br>
+=C2=A0 =C2=A0 ram_addr_t pages =3D slot-&gt;memory_size / qemu_real_host_p=
age_size();<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu_physical_memory_set_dirty_lebitmap(slot-&gt;dirty_b=
map, start, pages);<br>
=C2=A0}<br>
@@ -662,7 +662,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)<br=
>
=C2=A0 =C2=A0 =C2=A0 * And mem-&gt;memory_size is aligned to it (otherwise =
this mem can&#39;t<br>
=C2=A0 =C2=A0 =C2=A0 * be registered to KVM).<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 hwaddr bitmap_size =3D ALIGN(mem-&gt;memory_size / qemu_real=
_host_page_size,<br>
+=C2=A0 =C2=A0 hwaddr bitmap_size =3D ALIGN(mem-&gt;memory_size / qemu_real=
_host_page_size(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
HOST_LONG_BITS*/ 64) / 8;<br>
=C2=A0 =C2=A0 =C2=A0mem-&gt;dirty_bmap =3D g_malloc0(bitmap_size);<br>
=C2=A0 =C2=A0 =C2=A0mem-&gt;dirty_bmap_size =3D bitmap_size;<br>
@@ -707,7 +707,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint3=
2_t as_id,<br>
=C2=A0 =C2=A0 =C2=A0mem =3D &amp;kml-&gt;slots[slot_id];<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!mem-&gt;memory_size || offset &gt;=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (mem-&gt;memory_size / qemu_real_host_page_siz=
e)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (mem-&gt;memory_size / qemu_real_host_page_siz=
e())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -895,7 +895,7 @@ static void kvm_physical_sync_dirty_bitmap(KVMMemoryLis=
tener *kml,<br>
<br>
=C2=A0/* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */<br>
=C2=A0#define KVM_CLEAR_LOG_SHIFT=C2=A0 6<br>
-#define KVM_CLEAR_LOG_ALIGN=C2=A0 (qemu_real_host_page_size &lt;&lt; KVM_C=
LEAR_LOG_SHIFT)<br>
+#define KVM_CLEAR_LOG_ALIGN=C2=A0 (qemu_real_host_page_size() &lt;&lt; KVM=
_CLEAR_LOG_SHIFT)<br>
=C2=A0#define KVM_CLEAR_LOG_MASK=C2=A0 =C2=A0(-KVM_CLEAR_LOG_ALIGN)<br>
<br>
=C2=A0static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t s=
tart,<br>
@@ -904,7 +904,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_=
id, uint64_t start,<br>
=C2=A0 =C2=A0 =C2=A0KVMState *s =3D kvm_state;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t end, bmap_start, start_delta, bmap_npages;<br>
=C2=A0 =C2=A0 =C2=A0struct kvm_clear_dirty_log d;<br>
-=C2=A0 =C2=A0 unsigned long *bmap_clear =3D NULL, psize =3D qemu_real_host=
_page_size;<br>
+=C2=A0 =C2=A0 unsigned long *bmap_clear =3D NULL, psize =3D qemu_real_host=
_page_size();<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -1335,7 +1335,7 @@ kvm_check_extension_list(KVMState *s, const KVMCapabi=
lityInfo *list)<br>
=C2=A0void kvm_set_max_memslot_size(hwaddr max_slot_size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ROUND_UP(max_slot_size, qemu_real_host_page_si=
ze) =3D=3D max_slot_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ROUND_UP(max_slot_size, qemu_real_host_page_si=
ze()) =3D=3D max_slot_size<br>
=C2=A0 =C2=A0 =C2=A0);<br>
=C2=A0 =C2=A0 =C2=A0kvm_max_slot_size =3D max_slot_size;<br>
=C2=A0}<br>
@@ -2340,7 +2340,7 @@ static int kvm_init(MachineState *ms)<br>
=C2=A0 =C2=A0 =C2=A0 * even with KVM.=C2=A0 TARGET_PAGE_SIZE is assumed to =
be the minimum<br>
=C2=A0 =C2=A0 =C2=A0 * page size for the system though.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 assert(TARGET_PAGE_SIZE &lt;=3D qemu_real_host_page_size);<b=
r>
+=C2=A0 =C2=A0 assert(TARGET_PAGE_SIZE &lt;=3D qemu_real_host_page_size());=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;sigmask_len =3D 8;<br>
<br>
diff --git a/backends/hostmem.c b/backends/hostmem.c<br>
index b2a5e905e866..a7bae3d713c9 100644<br>
--- a/backends/hostmem.c<br>
+++ b/backends/hostmem.c<br>
@@ -319,7 +319,7 @@ size_t host_memory_backend_pagesize(HostMemoryBackend *=
memdev)<br>
=C2=A0#else<br>
=C2=A0size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/block.c b/block.c<br>
index b54d59d1fa2a..6067bbfbf5f4 100644<br>
--- a/block.c<br>
+++ b/block.c<br>
@@ -132,7 +132,7 @@ size_t bdrv_opt_mem_align(BlockDriverState *bs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!bs || !bs-&gt;drv) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* page size or 4k (hdd sector size) shou=
ld be on the safe side */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAX(4096, qemu_real_host_page_size);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAX(4096, qemu_real_host_page_size());<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return bs-&gt;bl.opt_mem_alignment;<br>
@@ -142,7 +142,7 @@ size_t bdrv_min_mem_align(BlockDriverState *bs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!bs || !bs-&gt;drv) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* page size or 4k (hdd sector size) shou=
ld be on the safe side */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAX(4096, qemu_real_host_page_size);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAX(4096, qemu_real_host_page_size());<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return bs-&gt;bl.min_mem_alignment;<br>
diff --git a/block/file-posix.c b/block/file-posix.c<br>
index 1f1756e192a5..7afc73a877c4 100644<br>
--- a/block/file-posix.c<br>
+++ b/block/file-posix.c<br>
@@ -385,7 +385,7 @@ static void raw_probe_alignment(BlockDriverState *bs, i=
nt fd, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BDRVRawState *s =3D bs-&gt;opaque;<br>
=C2=A0 =C2=A0 =C2=A0char *buf;<br>
-=C2=A0 =C2=A0 size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_=
size);<br>
+=C2=A0 =C2=A0 size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_=
size());<br>
=C2=A0 =C2=A0 =C2=A0size_t alignments[] =3D {1, 512, 1024, 2048, 4096};<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* For SCSI generic devices the alignment is not really=
 used.<br>
@@ -1260,7 +1260,7 @@ static void raw_refresh_limits(BlockDriverState *bs, =
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0raw_probe_alignment(bs, s-&gt;fd, errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0bs-&gt;bl.min_mem_alignment =3D s-&gt;buf_align;<br>
-=C2=A0 =C2=A0 bs-&gt;bl.opt_mem_alignment =3D MAX(s-&gt;buf_align, qemu_re=
al_host_page_size);<br>
+=C2=A0 =C2=A0 bs-&gt;bl.opt_mem_alignment =3D MAX(s-&gt;buf_align, qemu_re=
al_host_page_size());<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Maximum transfers are best effort, so it is okay to =
ignore any<br>
@@ -1885,7 +1885,7 @@ static int allocate_first_block(int fd, size_t max_si=
ze)<br>
=C2=A0 =C2=A0 =C2=A0size_t write_size =3D (max_size &lt; MAX_BLOCKSIZE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? BDRV_SECTOR_SIZE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: MAX_BLOCKSIZE;<br>
-=C2=A0 =C2=A0 size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_=
size);<br>
+=C2=A0 =C2=A0 size_t max_align =3D MAX(MAX_BLOCKSIZE, qemu_real_host_page_=
size());<br>
=C2=A0 =C2=A0 =C2=A0void *buf;<br>
=C2=A0 =C2=A0 =C2=A0ssize_t n;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
diff --git a/block/io.c b/block/io.c<br>
index 4e4cb556c586..be97040e121f 100644<br>
--- a/block/io.c<br>
+++ b/block/io.c<br>
@@ -200,7 +200,7 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transact=
ion *tran, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!have_limits) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bs-&gt;bl.min_mem_alignment =3D 512;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.opt_mem_alignment =3D qemu_real_host=
_page_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.opt_mem_alignment =3D qemu_real_host=
_page_size();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Safe default since most protocols use =
readv()/writev()/etc */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bs-&gt;bl.max_iov =3D IOV_MAX;<br>
diff --git a/block/nvme.c b/block/nvme.c<br>
index dd20de3865b3..ec5db6008afa 100644<br>
--- a/block/nvme.c<br>
+++ b/block/nvme.c<br>
@@ -168,9 +168,9 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue=
 *q,<br>
=C2=A0 =C2=A0 =C2=A0size_t bytes;<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
<br>
-=C2=A0 =C2=A0 bytes =3D ROUND_UP(nentries * entry_bytes, qemu_real_host_pa=
ge_size);<br>
+=C2=A0 =C2=A0 bytes =3D ROUND_UP(nentries * entry_bytes, qemu_real_host_pa=
ge_size());<br>
=C2=A0 =C2=A0 =C2=A0q-&gt;head =3D q-&gt;tail =3D 0;<br>
-=C2=A0 =C2=A0 q-&gt;queue =3D qemu_try_memalign(qemu_real_host_page_size, =
bytes);<br>
+=C2=A0 =C2=A0 q-&gt;queue =3D qemu_try_memalign(qemu_real_host_page_size()=
, bytes);<br>
=C2=A0 =C2=A0 =C2=A0if (!q-&gt;queue) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Cannot allocate qu=
eue&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -231,8 +231,8 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeSt=
ate *s,<br>
=C2=A0 =C2=A0 =C2=A0trace_nvme_create_queue_pair(idx, q, size, aio_context,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_get_fd(s-&gt;i=
rq_notifier));<br>
=C2=A0 =C2=A0 =C2=A0bytes =3D QEMU_ALIGN_UP(s-&gt;page_size * NVME_NUM_REQS=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qemu_real_host_page_size);<br>
-=C2=A0 =C2=A0 q-&gt;prp_list_pages =3D qemu_try_memalign(qemu_real_host_pa=
ge_size, bytes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qemu_real_host_page_size());<br>
+=C2=A0 =C2=A0 q-&gt;prp_list_pages =3D qemu_try_memalign(qemu_real_host_pa=
ge_size(), bytes);<br>
=C2=A0 =C2=A0 =C2=A0if (!q-&gt;prp_list_pages) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Cannot allocate PR=
P page list&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
@@ -532,9 +532,9 @@ static bool nvme_identify(BlockDriverState *bs, int nam=
espace, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.opcode =3D NVME_ADM_CMD_IDENTIFY,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cdw10 =3D cpu_to_le32(0x1),<br>
=C2=A0 =C2=A0 =C2=A0};<br>
-=C2=A0 =C2=A0 size_t id_size =3D QEMU_ALIGN_UP(sizeof(*id), qemu_real_host=
_page_size);<br>
+=C2=A0 =C2=A0 size_t id_size =3D QEMU_ALIGN_UP(sizeof(*id), qemu_real_host=
_page_size());<br>
<br>
-=C2=A0 =C2=A0 id =3D qemu_try_memalign(qemu_real_host_page_size, id_size);=
<br>
+=C2=A0 =C2=A0 id =3D qemu_try_memalign(qemu_real_host_page_size(), id_size=
);<br>
=C2=A0 =C2=A0 =C2=A0if (!id) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Cannot allocate bu=
ffer for identify response&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
@@ -1047,7 +1047,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriver=
State *bs, NvmeCmd *cmd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool retry =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t iova;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len =3D QEMU_ALIGN_UP(qiov-&gt;iov=
[i].iov_len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_siz=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_siz=
e());<br>
=C2=A0try_map:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D qemu_vfio_dma_map(s-&gt;vfio,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qiov-&gt;iov[i].iov_base,<br>
@@ -1223,8 +1223,8 @@ static inline bool nvme_qiov_aligned(BlockDriverState=
 *bs,<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; qiov-&gt;niov; ++i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!QEMU_PTR_IS_ALIGNED(qiov-&gt;iov[i].=
iov_base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_size) ||<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !QEMU_IS_ALIGNED(qiov-&gt;iov[i]=
.iov_len, qemu_real_host_page_size)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_size()) ||=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !QEMU_IS_ALIGNED(qiov-&gt;iov[i]=
.iov_len, qemu_real_host_page_size())) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_nvme_qiov_unaligned(q=
iov, i, qiov-&gt;iov[i].iov_base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qiov-&gt;=
iov[i].iov_len, s-&gt;page_size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -1240,7 +1240,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t=
 offset, uint64_t bytes,<br>
=C2=A0 =C2=A0 =C2=A0int r;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_AUTO_VFREE uint8_t *buf =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0QEMUIOVector local_qiov;<br>
-=C2=A0 =C2=A0 size_t len =3D QEMU_ALIGN_UP(bytes, qemu_real_host_page_size=
);<br>
+=C2=A0 =C2=A0 size_t len =3D QEMU_ALIGN_UP(bytes, qemu_real_host_page_size=
());<br>
=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(offset, s-&gt;page_size));<br>
=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(bytes, s-&gt;page_size));<br>
=C2=A0 =C2=A0 =C2=A0assert(bytes &lt;=3D s-&gt;max_transfer);<br>
@@ -1250,7 +1250,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t=
 offset, uint64_t bytes,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;stats.unaligned_accesses++;<br>
=C2=A0 =C2=A0 =C2=A0trace_nvme_prw_buffered(s, offset, bytes, qiov-&gt;niov=
, is_write);<br>
-=C2=A0 =C2=A0 buf =3D qemu_try_memalign(qemu_real_host_page_size, len);<br=
>
+=C2=A0 =C2=A0 buf =3D qemu_try_memalign(qemu_real_host_page_size(), len);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!buf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
diff --git a/block/parallels.c b/block/parallels.c<br>
index 6ebad2a2bbc9..94911bb0dec4 100644<br>
--- a/block/parallels.c<br>
+++ b/block/parallels.c<br>
@@ -869,7 +869,7 @@ static int parallels_open(BlockDriverState *bs, QDict *=
options, int flags,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 s-&gt;bat_dirty_block =3D 4 * qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 s-&gt;bat_dirty_block =3D 4 * qemu_real_host_page_size();<br=
>
=C2=A0 =C2=A0 =C2=A0s-&gt;bat_dirty_bmap =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_new(DIV_ROUND_UP(s-&gt;header_size=
, s-&gt;bat_dirty_block));<br>
<br>
diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c<br>
index 7444b9c4ab03..f803e70f1811 100644<br>
--- a/block/qcow2-cache.c<br>
+++ b/block/qcow2-cache.c<br>
@@ -74,7 +74,7 @@ static void qcow2_cache_table_release(Qcow2Cache *c, int =
i, int num_tables)<br>
=C2=A0/* Using MADV_DONTNEED to discard memory is a Linux-specific feature =
*/<br>
=C2=A0#ifdef CONFIG_LINUX<br>
=C2=A0 =C2=A0 =C2=A0void *t =3D qcow2_cache_get_table_addr(c, i);<br>
-=C2=A0 =C2=A0 int align =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 int align =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0size_t mem_size =3D (size_t) c-&gt;table_size * num_tab=
les;<br>
=C2=A0 =C2=A0 =C2=A0size_t offset =3D QEMU_ALIGN_UP((uintptr_t) t, align) -=
 (uintptr_t) t;<br>
=C2=A0 =C2=A0 =C2=A0size_t length =3D QEMU_ALIGN_DOWN(mem_size - offset, al=
ign);<br>
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
index 142a5bfac260..f8edb22f2ab1 100644<br>
--- a/bsd-user/elfload.c<br>
+++ b/bsd-user/elfload.c<br>
@@ -246,7 +246,7 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_b=
ss)<br>
=C2=A0 =C2=A0 =C2=A0 * patch target_mmap(), but it is more complicated as t=
he file<br>
=C2=A0 =C2=A0 =C2=A0 * size must be known.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (qemu_real_host_page_size &lt; qemu_host_page_size) {<br>
+=C2=A0 =C2=A0 if (qemu_real_host_page_size() &lt; qemu_host_page_size) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong end_addr, end_addr1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end_addr1 =3D REAL_HOST_PAGE_ALIGN(elf_bs=
s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end_addr =3D HOST_PAGE_ALIGN(elf_bss);<br=
>
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
index 13cb32dba13e..07aa0a634dff 100644<br>
--- a/bsd-user/mmap.c<br>
+++ b/bsd-user/mmap.c<br>
@@ -515,7 +515,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, in=
t prot,<br>
=C2=A0 =C2=A0 =C2=A0 * up to the targets page boundary.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
-=C2=A0 =C2=A0 if ((qemu_real_host_page_size &lt; qemu_host_page_size) &amp=
;&amp; fd !=3D -1) {<br>
+=C2=A0 =C2=A0 if ((qemu_real_host_page_size() &lt; qemu_host_page_size) &a=
mp;&amp; fd !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat sb;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fstat(fd, &amp;sb) =3D=3D -1) {<br>
diff --git a/contrib/vhost-user-gpu/vugbm.c b/contrib/vhost-user-gpu/vugbm.=
c<br>
index fb15d0372c25..503d0a4566f8 100644<br>
--- a/contrib/vhost-user-gpu/vugbm.c<br>
+++ b/contrib/vhost-user-gpu/vugbm.c<br>
@@ -53,7 +53,7 @@ struct udmabuf_create {<br>
=C2=A0static size_t<br>
=C2=A0udmabuf_get_size(struct vugbm_buffer *buf)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return ROUND_UP(buf-&gt;width * buf-&gt;height * 4, qemu_rea=
l_host_page_size);<br>
+=C2=A0 =C2=A0 return ROUND_UP(buf-&gt;width * buf-&gt;height * 4, qemu_rea=
l_host_page_size());<br>
=C2=A0}<br>
<br>
=C2=A0static bool<br>
diff --git a/cpu.c b/cpu.c<br>
index 3ea38aea7077..c02bfded99d6 100644<br>
--- a/cpu.c<br>
+++ b/cpu.c<br>
@@ -470,7 +470,7 @@ void page_size_init(void)<br>
=C2=A0 =C2=A0 =C2=A0/* NOTE: we can always suppose that qemu_host_page_size=
 &gt;=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_PAGE_SIZE */<br>
=C2=A0 =C2=A0 =C2=A0if (qemu_host_page_size =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_host_page_size =3D qemu_real_host_page_si=
ze;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_host_page_size =3D qemu_real_host_page_si=
ze();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (qemu_host_page_size &lt; TARGET_PAGE_SIZE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_host_page_size =3D TARGET_PAGE_SIZE;=
<br>
diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
index 1f9ad319438d..7cbdca47a38e 100644<br>
--- a/hw/display/qxl.c<br>
+++ b/hw/display/qxl.c<br>
@@ -320,7 +320,7 @@ static ram_addr_t qxl_rom_size(void)<br>
=C2=A0#define QXL_ROM_SZ 8192<br>
<br>
=C2=A0 =C2=A0 =C2=A0QEMU_BUILD_BUG_ON(QXL_REQUIRED_SZ &gt; QXL_ROM_SZ);<br>
-=C2=A0 =C2=A0 return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_si=
ze);<br>
+=C2=A0 =C2=A0 return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_si=
ze());<br>
=C2=A0}<br>
<br>
=C2=A0static void init_qxl_rom(PCIQXLDevice *d)<br>
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c<br>
index efe5054182c3..4e86d2d43670 100644<br>
--- a/hw/intc/s390_flic_kvm.c<br>
+++ b/hw/intc/s390_flic_kvm.c<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
<br>
-#define FLIC_SAVE_INITIAL_SIZE qemu_real_host_page_size<br>
+#define FLIC_SAVE_INITIAL_SIZE qemu_real_host_page_size()<br>
=C2=A0#define FLIC_FAILED (-1UL)<br>
=C2=A0#define FLIC_SAVEVM_VERSION 1<br>
<br>
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c<br>
index e5f3c981841d..ea2d56f9f2af 100644<br>
--- a/hw/nvram/fw_cfg.c<br>
+++ b/hw/nvram/fw_cfg.c<br>
@@ -622,9 +622,9 @@ static bool fw_cfg_acpi_mr_restore(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0FWCfgState *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0bool mr_aligned;<br>
<br>
-=C2=A0 =C2=A0 mr_aligned =3D QEMU_IS_ALIGNED(s-&gt;table_mr_size, qemu_rea=
l_host_page_size) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_IS_ALIG=
NED(s-&gt;linker_mr_size, qemu_real_host_page_size) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_IS_ALIG=
NED(s-&gt;rsdp_mr_size, qemu_real_host_page_size);<br>
+=C2=A0 =C2=A0 mr_aligned =3D QEMU_IS_ALIGNED(s-&gt;table_mr_size, qemu_rea=
l_host_page_size()) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_IS_ALIG=
NED(s-&gt;linker_mr_size, qemu_real_host_page_size()) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_IS_ALIG=
NED(s-&gt;rsdp_mr_size, qemu_real_host_page_size());<br>
=C2=A0 =C2=A0 =C2=A0return s-&gt;acpi_mr_restore &amp;&amp; !mr_aligned;<br=
>
=C2=A0}<br>
<br>
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c<br>
index 4bddb529c2a6..7b5a205309af 100644<br>
--- a/hw/ppc/mac_newworld.c<br>
+++ b/hw/ppc/mac_newworld.c<br>
@@ -456,7 +456,7 @@ static void ppc_core99_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* The NewWorld NVRAM is not located in the MacIO devic=
e */<br>
-=C2=A0 =C2=A0 if (kvm_enabled() &amp;&amp; qemu_real_host_page_size &gt; 4=
096) {<br>
+=C2=A0 =C2=A0 if (kvm_enabled() &amp;&amp; qemu_real_host_page_size() &gt;=
 4096) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We can&#39;t combine read-write and re=
ad-only in a single page, so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 move the NVRAM out of ROM again f=
or KVM */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvram_addr =3D 0xFFE00000;<br>
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c<br>
index 5bfd4aa9e5aa..b2f5fbef0c83 100644<br>
--- a/hw/ppc/spapr_pci.c<br>
+++ b/hw/ppc/spapr_pci.c<br>
@@ -1978,7 +1978,7 @@ static void spapr_phb_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0 * our memory slot is of page size granularity.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (kvm_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msi_window_size =3D qemu_real_host_page_size;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msi_window_size =3D qemu_real_host_page_size()=
;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;sphb-&gt;msiwindow, OBJECT(s=
phb), &amp;spapr_msi_ops, spapr,<br>
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c<br>
index 91206dbb8eb0..27a76224320e 100644<br>
--- a/hw/rdma/vmw/pvrdma_main.c<br>
+++ b/hw/rdma/vmw/pvrdma_main.c<br>
@@ -608,7 +608,7 @@ static void pvrdma_realize(PCIDevice *pdev, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0rdma_info_report(&quot;Initializing device %s %x.%x&quo=
t;, pdev-&gt;name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PCI_SLOT(pdev-&gt;devfn), PCI_FUNC(pdev-&gt;devfn));<br>
<br>
-=C2=A0 =C2=A0 if (TARGET_PAGE_SIZE !=3D qemu_real_host_page_size) {<br>
+=C2=A0 =C2=A0 if (TARGET_PAGE_SIZE !=3D qemu_real_host_page_size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Target page size m=
ust be the same as host page size&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c<br>
index 0306ccc7b1e4..0ab00ef85c95 100644<br>
--- a/hw/scsi/scsi-generic.c<br>
+++ b/hw/scsi/scsi-generic.c<br>
@@ -183,7 +183,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r,=
 SCSIDevice *s, int len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t max_iov =3D blk_ge=
t_max_hw_iov(s-&gt;conf.blk);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(max_transfer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_transfer =3D MIN_NON_ZERO(ma=
x_transfer, max_iov * qemu_real_host_page_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_transfer =3D MIN_NON_ZERO(ma=
x_transfer, max_iov * qemu_real_host_page_size())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ s-&gt;block=
size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(&amp;r-&gt;buf[8],=
 max_transfer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Also take care of the op=
t xfer len. */<br>
diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c<br>
index 6dbb9f41e40b..285cacab112f 100644<br>
--- a/hw/tpm/tpm_ppi.c<br>
+++ b/hw/tpm/tpm_ppi.c<br>
@@ -47,7 +47,7 @@ void tpm_ppi_reset(TPMPPI *tpmppi)<br>
=C2=A0void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr=
 addr, Object *obj)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 tpmppi-&gt;buf =3D qemu_memalign(qemu_real_host_page_size,<b=
r>
+=C2=A0 =C2=A0 tpmppi-&gt;buf =3D qemu_memalign(qemu_real_host_page_size(),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOST_PAGE_ALIGN(TPM_PPI_ADDR_S=
IZE));<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_ram_device_ptr(&amp;tpmppi-&gt;ram, =
obj, &quot;tpm-ppi&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPM_PPI_A=
DDR_SIZE, tpmppi-&gt;buf);<br>
diff --git a/hw/vfio/common.c b/hw/vfio/common.c<br>
index 080046e3f511..2b1f78fdfaeb 100644<br>
--- a/hw/vfio/common.c<br>
+++ b/hw/vfio/common.c<br>
@@ -397,7 +397,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *contain=
er,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct vfio_iommu_type1_dma_unmap *unmap;<br>
=C2=A0 =C2=A0 =C2=A0struct vfio_bitmap *bitmap;<br>
-=C2=A0 =C2=A0 uint64_t pages =3D REAL_HOST_PAGE_ALIGN(size) / qemu_real_ho=
st_page_size;<br>
+=C2=A0 =C2=A0 uint64_t pages =3D REAL_HOST_PAGE_ALIGN(size) / qemu_real_ho=
st_page_size();<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0unmap =3D g_malloc0(sizeof(*unmap) + sizeof(*bitmap));<=
br>
@@ -414,7 +414,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *contain=
er,<br>
=C2=A0 =C2=A0 =C2=A0 * to qemu_real_host_page_size.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
-=C2=A0 =C2=A0 bitmap-&gt;pgsize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 bitmap-&gt;pgsize =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0bitmap-&gt;size =3D ROUND_UP(pages, sizeof(__u64) * BIT=
S_PER_BYTE) /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BITS_=
PER_BYTE;<br>
<br>
@@ -882,8 +882,8 @@ static void vfio_listener_region_add(MemoryListener *li=
stener,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely((section-&gt;offset_within_address_space &=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~qemu_real_=
host_page_mask) !=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(section-&gt=
;offset_within_region &amp; ~qemu_real_host_page_mask))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~qemu_real_=
host_page_mask()) !=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(section-&gt=
;offset_within_region &amp; ~qemu_real_host_page_mask()))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;%s received unaligned =
region&quot;, __func__);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -891,7 +891,7 @@ static void vfio_listener_region_add(MemoryListener *li=
stener,<br>
=C2=A0 =C2=A0 =C2=A0iova =3D REAL_HOST_PAGE_ALIGN(section-&gt;offset_within=
_address_space);<br>
=C2=A0 =C2=A0 =C2=A0llend =3D int128_make64(section-&gt;offset_within_addre=
ss_space);<br>
=C2=A0 =C2=A0 =C2=A0llend =3D int128_add(llend, section-&gt;size);<br>
-=C2=A0 =C2=A0 llend =3D int128_and(llend, int128_exts64(qemu_real_host_pag=
e_mask));<br>
+=C2=A0 =C2=A0 llend =3D int128_and(llend, int128_exts64(qemu_real_host_pag=
e_mask()));<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (int128_ge(int128_make64(iova), llend)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memory_region_is_ram_device(section-&=
gt;mr)) {<br>
@@ -899,7 +899,7 @@ static void vfio_listener_region_add(MemoryListener *li=
stener,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region=
_name(section-&gt;mr),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section-&gt;o=
ffset_within_address_space,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int128_getlo(=
section-&gt;size),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_real_host_pag=
e_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_real_host_pag=
e_size());<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1118,8 +1118,8 @@ static void vfio_listener_region_del(MemoryListener *=
listener,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely((section-&gt;offset_within_address_space &=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~qemu_real_=
host_page_mask) !=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(section-&gt=
;offset_within_region &amp; ~qemu_real_host_page_mask))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~qemu_real_=
host_page_mask()) !=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(section-&gt=
;offset_within_region &amp; ~qemu_real_host_page_mask()))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;%s received unaligned =
region&quot;, __func__);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1150,7 +1150,7 @@ static void vfio_listener_region_del(MemoryListener *=
listener,<br>
=C2=A0 =C2=A0 =C2=A0iova =3D REAL_HOST_PAGE_ALIGN(section-&gt;offset_within=
_address_space);<br>
=C2=A0 =C2=A0 =C2=A0llend =3D int128_make64(section-&gt;offset_within_addre=
ss_space);<br>
=C2=A0 =C2=A0 =C2=A0llend =3D int128_add(llend, section-&gt;size);<br>
-=C2=A0 =C2=A0 llend =3D int128_and(llend, int128_exts64(qemu_real_host_pag=
e_mask));<br>
+=C2=A0 =C2=A0 llend =3D int128_and(llend, int128_exts64(qemu_real_host_pag=
e_mask()));<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (int128_ge(int128_make64(iova), llend)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1272,9 +1272,9 @@ static int vfio_get_dirty_bitmap(VFIOContainer *conta=
iner, uint64_t iova,<br>
=C2=A0 =C2=A0 =C2=A0 * qemu_real_host_page_size to mark those dirty. Hence =
set bitmap&#39;s pgsize<br>
=C2=A0 =C2=A0 =C2=A0 * to qemu_real_host_page_size.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 range-&gt;bitmap.pgsize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 range-&gt;bitmap.pgsize =3D qemu_real_host_page_size();<br>
<br>
-=C2=A0 =C2=A0 pages =3D REAL_HOST_PAGE_ALIGN(range-&gt;size) / qemu_real_h=
ost_page_size;<br>
+=C2=A0 =C2=A0 pages =3D REAL_HOST_PAGE_ALIGN(range-&gt;size) / qemu_real_h=
ost_page_size();<br>
=C2=A0 =C2=A0 =C2=A0range-&gt;bitmap.size =3D ROUND_UP(pages, sizeof(__u64)=
 * BITS_PER_BYTE) /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 B=
ITS_PER_BYTE;<br>
=C2=A0 =C2=A0 =C2=A0range-&gt;bitmap.data =3D g_try_malloc0(range-&gt;bitma=
p.size);<br>
@@ -1970,7 +1970,7 @@ static void vfio_get_iommu_info_migration(VFIOContain=
er *container,<br>
=C2=A0 =C2=A0 =C2=A0 * cpu_physical_memory_set_dirty_lebitmap() supports pa=
ges in bitmap of<br>
=C2=A0 =C2=A0 =C2=A0 * qemu_real_host_page_size to mark those dirty.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (cap_mig-&gt;pgsize_bitmap &amp; qemu_real_host_page_size=
) {<br>
+=C2=A0 =C2=A0 if (cap_mig-&gt;pgsize_bitmap &amp; qemu_real_host_page_size=
()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container-&gt;dirty_pages_supported =3D t=
rue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container-&gt;max_dirty_bitmap_size =3D c=
ap_mig-&gt;max_dirty_bitmap_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container-&gt;dirty_pgsizes =3D cap_mig-&=
gt;pgsize_bitmap;<br>
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c<br>
index 7b45353ce27f..c9b616c933ed 100644<br>
--- a/hw/vfio/pci.c<br>
+++ b/hw/vfio/pci.c<br>
@@ -1084,8 +1084,8 @@ static void vfio_sub_page_bar_update_mapping(PCIDevic=
e *pdev, int bar)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* If BAR is mapped and page aligned, update to fill PA=
GE_SIZE */<br>
=C2=A0 =C2=A0 =C2=A0if (bar_addr !=3D PCI_BAR_UNMAPPED &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(bar_addr &amp; ~qemu_real_host_page_mask)) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(bar_addr &amp; ~qemu_real_host_page_mask()))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_transaction_begin();<br>
@@ -1201,7 +1201,7 @@ void vfio_pci_write_config(PCIDevice *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (bar =3D 0; bar &lt; PCI_ROM_SLOT; ba=
r++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_addr[bar] !=3D pdev=
-&gt;io_regions[bar].addr &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;bars=
[bar].region.size &gt; 0 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev-&gt;bars[bar]=
.region.size &lt; qemu_real_host_page_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev-&gt;bars[bar]=
.region.size &lt; qemu_real_host_page_size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfio_sub_page=
_bar_update_mapping(pdev, bar);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1289,7 +1289,7 @@ static void vfio_pci_fixup_msix_region(VFIOPCIDevice =
*vdev)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* MSI-X table start and end aligned to host page size =
*/<br>
-=C2=A0 =C2=A0 start =3D vdev-&gt;msix-&gt;table_offset &amp; qemu_real_hos=
t_page_mask;<br>
+=C2=A0 =C2=A0 start =3D vdev-&gt;msix-&gt;table_offset &amp; qemu_real_hos=
t_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0end =3D REAL_HOST_PAGE_ALIGN((uint64_t)vdev-&gt;msix-&g=
t;table_offset +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (vdev-&gt;msix-&gt;entries * PCI_MSI=
X_ENTRY_SIZE));<br>
<br>
@@ -2475,7 +2475,7 @@ static int vfio_pci_load_config(VFIODevice *vbasedev,=
 QEMUFile *f)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_addr[bar] !=3D pdev-&gt;io_region=
s[bar].addr &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;bars[bar].region.s=
ize &gt; 0 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev-&gt;bars[bar].region.size &=
lt; qemu_real_host_page_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdev-&gt;bars[bar].region.size &=
lt; qemu_real_host_page_size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfio_sub_page_bar_update_ma=
pping(pdev, bar);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c<br>
index 04c6e67f8fba..9ec1e95f6da7 100644<br>
--- a/hw/vfio/spapr.c<br>
+++ b/hw/vfio/spapr.c<br>
@@ -44,7 +44,7 @@ static void vfio_prereg_listener_region_add(MemoryListene=
r *listener,<br>
=C2=A0 =C2=A0 =C2=A0const hwaddr gpa =3D section-&gt;offset_within_address_=
space;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr end;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 hwaddr page_mask =3D qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 hwaddr page_mask =3D qemu_real_host_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0struct vfio_iommu_spapr_register_memory reg =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argsz =3D sizeof(reg),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D 0,<br>
@@ -102,7 +102,7 @@ static void vfio_prereg_listener_region_del(MemoryListe=
ner *listener,<br>
=C2=A0 =C2=A0 =C2=A0const hwaddr gpa =3D section-&gt;offset_within_address_=
space;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr end;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 hwaddr page_mask =3D qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 hwaddr page_mask =3D qemu_real_host_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0struct vfio_iommu_spapr_register_memory reg =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argsz =3D sizeof(reg),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D 0,<br>
@@ -199,12 +199,12 @@ int vfio_spapr_create_window(VFIOContainer *container=
,<br>
=C2=A0 =C2=A0 =C2=A0 * Below we look at qemu_real_host_page_size as TCEs ar=
e allocated from<br>
=C2=A0 =C2=A0 =C2=A0 * system pages.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 bits_per_level =3D ctz64(qemu_real_host_page_size) + 8;<br>
+=C2=A0 =C2=A0 bits_per_level =3D ctz64(qemu_real_host_page_size()) + 8;<br=
>
=C2=A0 =C2=A0 =C2=A0create.levels =3D bits_total / bits_per_level;<br>
=C2=A0 =C2=A0 =C2=A0if (bits_total % bits_per_level) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++create.levels;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 max_levels =3D (64 - create.page_shift) / ctz64(qemu_real_ho=
st_page_size);<br>
+=C2=A0 =C2=A0 max_levels =3D (64 - create.page_shift) / ctz64(qemu_real_ho=
st_page_size());<br>
=C2=A0 =C2=A0 =C2=A0for ( ; create.levels &lt;=3D max_levels; ++create.leve=
ls) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(container-&gt;fd, VFIO_IOMM=
U_SPAPR_TCE_CREATE, &amp;create);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret) {<br>
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c<br>
index 662853513ec3..4a1ddeef6177 100644<br>
--- a/hw/virtio/vhost-user.c<br>
+++ b/hw/virtio/vhost-user.c<br>
@@ -1506,7 +1506,7 @@ static int vhost_user_slave_handle_vring_host_notifie=
r(struct vhost_dev *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int queue_idx =3D area-&gt;u64 &amp; VHOST_USER_VRING_I=
DX_MASK;<br>
-=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0struct vhost_user *u =3D dev-&gt;opaque;<br>
=C2=A0 =C2=A0 =C2=A0VhostUserState *user =3D u-&gt;user;<br>
=C2=A0 =C2=A0 =C2=A0VirtIODevice *vdev =3D dev-&gt;vdev;<br>
@@ -2530,7 +2530,7 @@ void vhost_user_cleanup(VhostUserState *user)<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; VIRTIO_QUEUE_MAX; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (user-&gt;notifier[i].addr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unparent(OBJECT(&amp=
;user-&gt;notifier[i].mr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(user-&gt;notifier[i].addr=
, qemu_real_host_page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(user-&gt;notifier[i].addr=
, qemu_real_host_page_size());<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user-&gt;notifier[i].addr =
=3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c<br>
index 04ea43704f5d..639222447c30 100644<br>
--- a/hw/virtio/vhost-vdpa.c<br>
+++ b/hw/virtio/vhost-vdpa.c<br>
@@ -380,7 +380,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void =
*opaque, Error **errp)<br>
=C2=A0static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int queue_index)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0struct vhost_vdpa *v =3D dev-&gt;opaque;<br>
=C2=A0 =C2=A0 =C2=A0VirtIODevice *vdev =3D dev-&gt;vdev;<br>
=C2=A0 =C2=A0 =C2=A0VhostVDPAHostNotifier *n;<br>
@@ -406,7 +406,7 @@ static void vhost_vdpa_host_notifiers_uninit(struct vho=
st_dev *dev, int n)<br>
<br>
=C2=A0static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int q=
ueue_index)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 size_t page_size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0struct vhost_vdpa *v =3D dev-&gt;opaque;<br>
=C2=A0 =C2=A0 =C2=A0VirtIODevice *vdev =3D dev-&gt;vdev;<br>
=C2=A0 =C2=A0 =C2=A0VhostVDPAHostNotifier *n;<br>
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c<br>
index f55dcf61f203..35cbf1f21946 100644<br>
--- a/hw/virtio/virtio-mem.c<br>
+++ b/hw/virtio/virtio-mem.c<br>
@@ -53,11 +53,11 @@ static uint32_t virtio_mem_default_thp_size(void)<br>
=C2=A0#if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)=
<br>
=C2=A0 =C2=A0 =C2=A0default_thp_size =3D 2 * MiB;<br>
=C2=A0#elif defined(__aarch64__)<br>
-=C2=A0 =C2=A0 if (qemu_real_host_page_size =3D=3D 4 * KiB) {<br>
+=C2=A0 =C2=A0 if (qemu_real_host_page_size() =3D=3D 4 * KiB) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_thp_size =3D 2 * MiB;<br>
-=C2=A0 =C2=A0 } else if (qemu_real_host_page_size =3D=3D 16 * KiB) {<br>
+=C2=A0 =C2=A0 } else if (qemu_real_host_page_size() =3D=3D 16 * KiB) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_thp_size =3D 32 * MiB;<br>
-=C2=A0 =C2=A0 } else if (qemu_real_host_page_size =3D=3D 64 * KiB) {<br>
+=C2=A0 =C2=A0 } else if (qemu_real_host_page_size() =3D=3D 64 * KiB) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_thp_size =3D 512 * MiB;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -120,7 +120,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock =
*rb)<br>
=C2=A0 =C2=A0 =C2=A0const uint64_t page_size =3D qemu_ram_pagesize(rb);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We can have hugetlbfs with a page size smaller than =
the THP size. */<br>
-=C2=A0 =C2=A0 if (page_size =3D=3D qemu_real_host_page_size) {<br>
+=C2=A0 =C2=A0 if (page_size =3D=3D qemu_real_host_page_size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MAX(page_size, virtio_mem_thp_size=
());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return MAX(page_size, VIRTIO_MEM_MIN_BLOCK_SIZE);<br>
@@ -135,7 +135,7 @@ static bool virtio_mem_has_shared_zeropage(RAMBlock *rb=
)<br>
=C2=A0 =C2=A0 =C2=A0 * fresh page, consuming actual memory.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0return !qemu_ram_is_shared(rb) &amp;&amp; rb-&gt;fd &lt=
; 0 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ram_pagesize(rb) =3D=3D qemu=
_real_host_page_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ram_pagesize(rb) =3D=3D qemu=
_real_host_page_size();<br>
=C2=A0}<br>
=C2=A0#endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */<br>
<br>
diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>
index 9628a38361cb..3a7b75aa42da 100644<br>
--- a/linux-user/elfload.c<br>
+++ b/linux-user/elfload.c<br>
@@ -1916,8 +1916,8 @@ static abi_ulong setup_arg_pages(struct linux_binprm =
*bprm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D STACK_LOWER_LIMIT;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0guard =3D TARGET_PAGE_SIZE;<br>
-=C2=A0 =C2=A0 if (guard &lt; qemu_real_host_page_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 guard =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 if (guard &lt; qemu_real_host_page_size()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 guard =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0error =3D target_mmap(0, size + guard, PROT_READ | PROT=
_WRITE,<br>
diff --git a/linux-user/mmap.c b/linux-user/mmap.c<br>
index c125031b9046..a861f1e1d144 100644<br>
--- a/linux-user/mmap.c<br>
+++ b/linux-user/mmap.c<br>
@@ -494,7 +494,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, in=
t target_prot,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 may need to truncate file maps at EOF and add e=
xtra anonymous pages<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 up to the targets page boundary.=C2=A0 */<br>
<br>
-=C2=A0 =C2=A0 if ((qemu_real_host_page_size &lt; qemu_host_page_size) &amp=
;&amp;<br>
+=C2=A0 =C2=A0 if ((qemu_real_host_page_size() &lt; qemu_host_page_size) &a=
mp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(flags &amp; MAP_ANONYMOUS)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat sb;<br>
<br>
diff --git a/migration/migration.c b/migration/migration.c<br>
index bcc385b94b10..830c320dbaa8 100644<br>
--- a/migration/migration.c<br>
+++ b/migration/migration.c<br>
@@ -2646,7 +2646,7 @@ static struct rp_cmd_args {<br>
=C2=A0static void migrate_handle_rp_req_pages(MigrationState *ms, const cha=
r* rbname,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr=
_t start, size_t len)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 long our_host_ps =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 long our_host_ps =3D qemu_real_host_page_size();<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_migrate_handle_rp_req_pages(rbname, start, len);<=
br>
<br>
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c<br>
index 2a2cc5faf8ff..702eef0cd2cd 100644<br>
--- a/migration/postcopy-ram.c<br>
+++ b/migration/postcopy-ram.c<br>
@@ -305,7 +305,7 @@ static bool ufd_check_and_apply(int ufd, MigrationIncom=
ingState *mis)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (qemu_real_host_page_size !=3D ram_pagesize_summary()) {<=
br>
+=C2=A0 =C2=A0 if (qemu_real_host_page_size() !=3D ram_pagesize_summary()) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool have_hp =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We&#39;ve got a huge page */<br>
=C2=A0#ifdef UFFD_FEATURE_MISSING_HUGETLBFS<br>
@@ -343,7 +343,7 @@ static int test_ramblock_postcopiable(RAMBlock *rb, voi=
d *opaque)<br>
=C2=A0 */<br>
=C2=A0bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 long pagesize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 long pagesize =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0int ufd =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0bool ret =3D false; /* Error unless we change it */<br>
=C2=A0 =C2=A0 =C2=A0void *testarea =3D NULL;<br>
diff --git a/monitor/misc.c b/monitor/misc.c<br>
index b1839cb8ee5d..8cdb493044cc 100644<br>
--- a/monitor/misc.c<br>
+++ b/monitor/misc.c<br>
@@ -720,7 +720,7 @@ static uint64_t vtop(void *ptr, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pinfo;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t ret =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0uintptr_t addr =3D (uintptr_t) ptr;<br>
-=C2=A0 =C2=A0 uintptr_t pagesize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 uintptr_t pagesize =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0off_t offset =3D addr / pagesize * sizeof(pinfo);<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
<br>
diff --git a/softmmu/physmem.c b/softmmu/physmem.c<br>
index a13289a594ae..ea97505547e4 100644<br>
--- a/softmmu/physmem.c<br>
+++ b/softmmu/physmem.c<br>
@@ -1382,11 +1382,11 @@ long qemu_maxrampagesize(void)<br>
=C2=A0#else<br>
=C2=A0long qemu_minrampagesize(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0}<br>
=C2=A0long qemu_maxrampagesize(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -2162,7 +2162,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ra=
m_addr_t max_size,<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;max_length =3D max_size;<br>
=C2=A0 =C2=A0 =C2=A0assert(max_size &gt;=3D size);<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;fd =3D -1;<br>
-=C2=A0 =C2=A0 new_block-&gt;page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 new_block-&gt;page_size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;host =3D host;<br>
=C2=A0 =C2=A0 =C2=A0new_block-&gt;flags =3D ram_flags;<br>
=C2=A0 =C2=A0 =C2=A0ram_block_add(new_block, &amp;local_err);<br>
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c<br>
index a226d174d8ef..05dbe8cce3ae 100644<br>
--- a/target/i386/hax/hax-mem.c<br>
+++ b/target/i386/hax/hax-mem.c<br>
@@ -188,15 +188,15 @@ static void hax_process_section(MemoryRegionSection *=
section, uint8_t flags)<br>
=C2=A0 =C2=A0 =C2=A0/* Adjust start_pa and size so that they are page-align=
ed. (Cf<br>
=C2=A0 =C2=A0 =C2=A0 * kvm_set_phys_mem() in kvm-all.c).<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size - (start_pa &amp; ~qemu_r=
eal_host_page_mask);<br>
-=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size() - (start_pa &amp; ~qemu=
_real_host_page_mask());<br>
+=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0if (delta &gt; size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0start_pa +=3D delta;<br>
=C2=A0 =C2=A0 =C2=A0size -=3D delta;<br>
-=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask;<br>
-=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask)) {<b=
r>
+=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask();<br>
+=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask())) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -214,7 +214,7 @@ static void hax_process_section(MemoryRegionSection *se=
ction, uint8_t flags)<br>
=C2=A0 =C2=A0 =C2=A0 * call into the kernel. Instead, we split the mapping =
into smaller ones,<br>
=C2=A0 =C2=A0 =C2=A0 * and call hax_update_mapping() on each.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 max_mapping_size =3D UINT32_MAX &amp; qemu_real_host_page_ma=
sk;<br>
+=C2=A0 =C2=A0 max_mapping_size =3D UINT32_MAX &amp; qemu_real_host_page_ma=
sk();<br>
=C2=A0 =C2=A0 =C2=A0while (size &gt; max_mapping_size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hax_update_mapping(start_pa, max_mapping_=
size, host_va, flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_pa +=3D max_mapping_size;<br>
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c<br>
index 9af261eea32d..ce9a283bb33e 100644<br>
--- a/target/i386/nvmm/nvmm-all.c<br>
+++ b/target/i386/nvmm/nvmm-all.c<br>
@@ -1075,15 +1075,15 @@ nvmm_process_section(MemoryRegionSection *section, =
int add)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Adjust start_pa and size so that they are page-align=
ed. */<br>
-=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size - (start_pa &amp; ~qemu_r=
eal_host_page_mask);<br>
-=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size() - (start_pa &amp; ~qemu=
_real_host_page_mask());<br>
+=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0if (delta &gt; size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0start_pa +=3D delta;<br>
=C2=A0 =C2=A0 =C2=A0size -=3D delta;<br>
-=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask;<br>
-=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask)) {<b=
r>
+=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask();<br>
+=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask())) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c<br>
index ef896da0a211..600afd000659 100644<br>
--- a/target/i386/whpx/whpx-all.c<br>
+++ b/target/i386/whpx/whpx-all.c<br>
@@ -1544,15 +1544,15 @@ static void whpx_process_section(MemoryRegionSectio=
n *section, int add)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size - (start_pa &amp; ~qemu_r=
eal_host_page_mask);<br>
-=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask;<br>
+=C2=A0 =C2=A0 delta =3D qemu_real_host_page_size() - (start_pa &amp; ~qemu=
_real_host_page_mask());<br>
+=C2=A0 =C2=A0 delta &amp;=3D ~qemu_real_host_page_mask();<br>
=C2=A0 =C2=A0 =C2=A0if (delta &gt; size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0start_pa +=3D delta;<br>
=C2=A0 =C2=A0 =C2=A0size -=3D delta;<br>
-=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask;<br>
-=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask)) {<b=
r>
+=C2=A0 =C2=A0 size &amp;=3D qemu_real_host_page_mask();<br>
+=C2=A0 =C2=A0 if (!size || (start_pa &amp; ~qemu_real_host_page_mask())) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c<br>
index d1f07c4f41d4..8644b85de847 100644<br>
--- a/target/ppc/kvm.c<br>
+++ b/target/ppc/kvm.c<br>
@@ -418,7 +418,7 @@ void kvm_check_mmu(PowerPCCPU *cpu, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * will be a normal mapping, not a specia=
l hugepage one used<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for RAM.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_real_host_page_size &lt; 0x10000) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_real_host_page_size() &lt; 0x10000) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;KVM can&#39;t supply 64kiB CI pages, which guest expects&q=
uot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/tcg/region.c b/tcg/region.c<br>
index 72afb3573893..08ab971eaf08 100644<br>
--- a/tcg/region.c<br>
+++ b/tcg/region.c<br>
@@ -487,14 +487,14 @@ static int alloc_code_gen_buffer(size_t tb_size, int =
splitwx, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0/* page-align the beginning and end of the buffer */<br=
>
=C2=A0 =C2=A0 =C2=A0buf =3D static_code_gen_buffer;<br>
=C2=A0 =C2=A0 =C2=A0end =3D static_code_gen_buffer + sizeof(static_code_gen=
_buffer);<br>
-=C2=A0 =C2=A0 buf =3D QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);<br=
>
-=C2=A0 =C2=A0 end =3D QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);<=
br>
+=C2=A0 =C2=A0 buf =3D QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size());<=
br>
+=C2=A0 =C2=A0 end =3D QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size())=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0size =3D end - buf;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Honor a command-line option limiting the size of the=
 buffer.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (size &gt; tb_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QEMU_ALIGN_DOWN(tb_size, qemu_real_ho=
st_page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QEMU_ALIGN_DOWN(tb_size, qemu_real_ho=
st_page_size());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0region.start_aligned =3D buf;<br>
@@ -728,7 +728,7 @@ static int alloc_code_gen_buffer(size_t size, int split=
wx, Error **errp)<br>
=C2=A0 */<br>
=C2=A0void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)<=
br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const size_t page_size =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 const size_t page_size =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0size_t region_size;<br>
=C2=A0 =C2=A0 =C2=A0int have_prot, need_prot;<br>
<br>
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
index 35088dd67f78..9b1dab2f2883 100644<br>
--- a/tests/vhost-user-bridge.c<br>
+++ b/tests/vhost-user-bridge.c<br>
@@ -468,8 +468,8 @@ vubr_queue_set_started(VuDev *dev, int qidx, bool start=
ed)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (started &amp;&amp; vubr-&gt;notifier.fd &gt;=3D 0) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vu_set_queue_host_notifier(dev, vq, vubr-=
&gt;notifier.fd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_siz=
e,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qidx * qemu_real_host_p=
age_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_real_host_page_siz=
e(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qidx * qemu_real_host_p=
age_size());<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (qidx % 2 =3D=3D 1) {<br>
@@ -601,7 +601,7 @@ static void *notifier_thread(void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VuDev *dev =3D (VuDev *)arg;<br>
=C2=A0 =C2=A0 =C2=A0VubrDev *vubr =3D container_of(dev, VubrDev, vudev);<br=
>
-=C2=A0 =C2=A0 int pagesize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 int pagesize =3D qemu_real_host_page_size();<br>
=C2=A0 =C2=A0 =C2=A0int qidx;<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (true) {<br>
@@ -637,7 +637,7 @@ vubr_host_notifier_setup(VubrDev *dev)<br>
=C2=A0 =C2=A0 =C2=A0void *addr;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
<br>
-=C2=A0 =C2=A0 length =3D qemu_real_host_page_size * VHOST_USER_BRIDGE_MAX_=
QUEUES;<br>
+=C2=A0 =C2=A0 length =3D qemu_real_host_page_size() * VHOST_USER_BRIDGE_MA=
X_QUEUES;<br>
<br>
=C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(template);<br>
=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
diff --git a/util/cutils.c b/util/cutils.c<br>
index 0d475ec4cddd..1173ce3b88f3 100644<br>
--- a/util/cutils.c<br>
+++ b/util/cutils.c<br>
@@ -175,7 +175,7 @@ int qemu_fdatasync(int fd)<br>
=C2=A0int qemu_msync(void *addr, size_t length, int fd)<br>
=C2=A0{<br>
=C2=A0#ifdef CONFIG_POSIX<br>
-=C2=A0 =C2=A0 size_t align_mask =3D ~(qemu_real_host_page_size - 1);<br>
+=C2=A0 =C2=A0 size_t align_mask =3D ~(qemu_real_host_page_size() - 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/**<br>
=C2=A0 =C2=A0 =C2=A0 * There are no strict reqs as per the length of mappin=
g<br>
@@ -183,7 +183,7 @@ int qemu_msync(void *addr, size_t length, int fd)<br>
=C2=A0 =C2=A0 =C2=A0 * alignment changes. Additionally - round the size to =
the multiple<br>
=C2=A0 =C2=A0 =C2=A0 * of PAGE_SIZE<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 length +=3D ((uintptr_t)addr &amp; (qemu_real_host_page_size=
 - 1));<br>
+=C2=A0 =C2=A0 length +=3D ((uintptr_t)addr &amp; (qemu_real_host_page_size=
() - 1));<br>
=C2=A0 =C2=A0 =C2=A0length =3D (length + ~align_mask) &amp; align_mask;<br>
<br>
=C2=A0 =C2=A0 =C2=A0addr =3D (void *)((uintptr_t)addr &amp; align_mask);<br=
>
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c<br>
index 893d864354a1..5b90cb68ea7d 100644<br>
--- a/util/mmap-alloc.c<br>
+++ b/util/mmap-alloc.c<br>
@@ -50,7 +50,7 @@ size_t qemu_fd_getpagesize(int fd)<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0}<br>
<br>
=C2=A0size_t qemu_mempath_getpagesize(const char *mem_path)<br>
@@ -81,7 +81,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path)<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0}<br>
<br>
=C2=A0#define OVERCOMMIT_MEMORY_PATH &quot;/proc/sys/vm/overcommit_memory&q=
uot;<br>
@@ -101,7 +101,7 @@ static bool map_noreserve_effective(int fd, uint32_t qe=
mu_map_flags)<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 MAP_NORESERVE.<br>
=C2=A0 =C2=A0 =C2=A0 * b) MAP_NORESERVE is not affected by /proc/sys/vm/ove=
rcommit_memory.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (qemu_fd_getpagesize(fd) !=3D qemu_real_host_page_size) {=
<br>
+=C2=A0 =C2=A0 if (qemu_fd_getpagesize(fd) !=3D qemu_real_host_page_size())=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -166,7 +166,7 @@ static void *mmap_reserve(size_t size, int fd)<br>
=C2=A0 =C2=A0 =C2=A0 * We do this unless we are using the system page size,=
 in which case<br>
=C2=A0 =C2=A0 =C2=A0 * anonymous memory is OK.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1 || qemu_fd_getpagesize(fd) =3D=3D qemu_real=
_host_page_size) {<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1 || qemu_fd_getpagesize(fd) =3D=3D qemu_real=
_host_page_size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D MAP_ANONYMOUS;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -243,7 +243,7 @@ static inline size_t mmap_guard_pagesize(int fd)<br>
=C2=A0 =C2=A0 =C2=A0/* Mappings in the same segment must share the same pag=
e size */<br>
=C2=A0 =C2=A0 =C2=A0return qemu_fd_getpagesize(fd);<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 return qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 return qemu_real_host_page_size();<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
diff --git a/util/osdep.c b/util/osdep.c<br>
index f16846e17722..a421ef6482aa 100644<br>
--- a/util/osdep.c<br>
+++ b/util/osdep.c<br>
@@ -80,8 +80,8 @@ int qemu_madvise(void *addr, size_t len, int advice)<br>
<br>
=C2=A0static int qemu_mprotect__osdep(void *addr, size_t size, int prot)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_assert(!((uintptr_t)addr &amp; ~qemu_real_host_page_mask))=
;<br>
-=C2=A0 =C2=A0 g_assert(!(size &amp; ~qemu_real_host_page_mask));<br>
+=C2=A0 =C2=A0 g_assert(!((uintptr_t)addr &amp; ~qemu_real_host_page_mask()=
));<br>
+=C2=A0 =C2=A0 g_assert(!(size &amp; ~qemu_real_host_page_mask()));<br>
<br>
=C2=A0#ifdef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0DWORD old_protect;<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index f2be7321c59f..38aae17d9d8b 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -813,7 +813,7 @@ void *qemu_alloc_stack(size_t *sz)<br>
=C2=A0#ifdef CONFIG_DEBUG_STACK_USAGE<br>
=C2=A0 =C2=A0 =C2=A0void *ptr2;<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 size_t pagesz =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 size_t pagesz =3D qemu_real_host_page_size();<br>
=C2=A0#ifdef _SC_THREAD_STACK_MIN<br>
=C2=A0 =C2=A0 =C2=A0/* avoid stacks smaller than _SC_THREAD_STACK_MIN */<br=
>
=C2=A0 =C2=A0 =C2=A0long min_stack_sz =3D sysconf(_SC_THREAD_STACK_MIN);<br=
>
@@ -875,7 +875,7 @@ void qemu_free_stack(void *stack, size_t sz)<br>
=C2=A0 =C2=A0 =C2=A0unsigned int usage;<br>
=C2=A0 =C2=A0 =C2=A0void *ptr;<br>
<br>
-=C2=A0 =C2=A0 for (ptr =3D stack + qemu_real_host_page_size; ptr &lt; stac=
k + sz;<br>
+=C2=A0 =C2=A0 for (ptr =3D stack + qemu_real_host_page_size(); ptr &lt; st=
ack + sz;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr +=3D sizeof(uint32_t)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*(uint32_t *)ptr !=3D 0xdeadbeaf) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -973,10 +973,10 @@ size_t qemu_get_host_physmem(void)<br>
=C2=A0#ifdef _SC_PHYS_PAGES<br>
=C2=A0 =C2=A0 =C2=A0long pages =3D sysconf(_SC_PHYS_PAGES);<br>
=C2=A0 =C2=A0 =C2=A0if (pages &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pages &gt; SIZE_MAX / qemu_real_host_page_=
size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pages &gt; SIZE_MAX / qemu_real_host_page_=
size()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SIZE_MAX;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pages * qemu_real_host_pa=
ge_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pages * qemu_real_host_pa=
ge_size();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
index af559ef3398d..c0f510eadcac 100644<br>
--- a/util/oslib-win32.c<br>
+++ b/util/oslib-win32.c<br>
@@ -374,7 +374,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory,=
 int smp_cpus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 size_t pagesize =3D qemu_real_host_page_size;<br>
+=C2=A0 =C2=A0 size_t pagesize =3D qemu_real_host_page_size();<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory =3D (memory + pagesize - 1) &amp; -pagesize;<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; memory / pagesize; i++) {<br>
diff --git a/util/pagesize.c b/util/pagesize.c<br>
deleted file mode 100644<br>
index 998632cf6ee6..000000000000<br>
--- a/util/pagesize.c<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * pagesize.c - query the host about its page size<br>
- *<br>
- * Copyright (C) 2017, Emilio G. Cota &lt;<a href=3D"mailto:cota@braap.org=
" target=3D"_blank">cota@braap.org</a>&gt;<br>
- * License: GNU GPL, version 2 or later.<br>
- *=C2=A0 =C2=A0See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#include &quot;qemu/osdep.h&quot;<br>
-<br>
-uintptr_t qemu_real_host_page_size;<br>
-intptr_t qemu_real_host_page_mask;<br>
-<br>
-static void __attribute__((constructor)) init_real_host_page_size(void)<br=
>
-{<br>
-=C2=A0 =C2=A0 qemu_real_host_page_size =3D getpagesize();<br>
-=C2=A0 =C2=A0 qemu_real_host_page_mask =3D -(intptr_t)qemu_real_host_page_=
size;<br>
-}<br>
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c<br>
index 00a80431a090..250a746a2aab 100644<br>
--- a/util/vfio-helpers.c<br>
+++ b/util/vfio-helpers.c<br>
@@ -163,7 +163,7 @@ void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *p;<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(offset, qemu_real_host_page_size));<b=
r>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(offset, qemu_real_host_page_size()));=
<br>
=C2=A0 =C2=A0 =C2=A0assert_bar_index_valid(s, index);<br>
=C2=A0 =C2=A0 =C2=A0p =3D mmap(NULL, MIN(size, s-&gt;bar_region_info[index]=
.size - offset),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot, MAP_SHARED,<br>
@@ -591,9 +591,9 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState=
 *s,<br>
=C2=A0 =C2=A0 =C2=A0IOVAMapping m =3D {.host =3D host, .size =3D size, .iov=
a =3D iova};<br>
=C2=A0 =C2=A0 =C2=A0IOVAMapping *insert;<br>
<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;low_water_mark, qemu_real_host_=
page_size));<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;high_water_mark, qemu_real_host=
_page_size));<br>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size()));<b=
r>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;low_water_mark, qemu_real_host_=
page_size()));<br>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;high_water_mark, qemu_real_host=
_page_size()));<br>
=C2=A0 =C2=A0 =C2=A0trace_qemu_vfio_new_mapping(s, host, size, index, iova)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(index &gt;=3D 0);<br>
@@ -644,7 +644,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IO=
VAMapping *mapping,<br>
<br>
=C2=A0 =C2=A0 =C2=A0index =3D mapping - s-&gt;mappings;<br>
=C2=A0 =C2=A0 =C2=A0assert(mapping-&gt;size &gt; 0);<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(mapping-&gt;size, qemu_real_host_page=
_size));<br>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(mapping-&gt;size, qemu_real_host_page=
_size()));<br>
=C2=A0 =C2=A0 =C2=A0assert(index &gt;=3D 0 &amp;&amp; index &lt; s-&gt;nr_m=
appings);<br>
=C2=A0 =C2=A0 =C2=A0if (ioctl(s-&gt;container, VFIO_IOMMU_UNMAP_DMA, &amp;u=
nmap)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;VFIO_=
UNMAP_DMA failed&quot;);<br>
@@ -752,8 +752,8 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, siz=
e_t size,<br>
=C2=A0 =C2=A0 =C2=A0IOVAMapping *mapping;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t iova0;<br>
<br>
-=C2=A0 =C2=A0 assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size));=
<br>
-=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));<br>
+=C2=A0 =C2=A0 assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size())=
);<br>
+=C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size()));<b=
r>
=C2=A0 =C2=A0 =C2=A0trace_qemu_vfio_dma_map(s, host, size, temporary, iova)=
;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_LOCK_GUARD(&amp;s-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0mapping =3D qemu_vfio_find_mapping(s, host, &amp;index)=
;<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 41f85699d030..4763d02ae78f 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2974,10 +2974,10 @@ sub process {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ERROR(&quot;use memset() instead of bzero()\n&quot; . $herecurr)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($line =3D~ /\bg=
etpagesize\(\)/) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;use qemu_real_host_page_size instead of getpagesize()=
\n&quot; . $herecurr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;use qemu_real_host_page_size() instead of getpagesize=
()\n&quot; . $herecurr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($line =3D~ /\bs=
ysconf\(_SC_PAGESIZE\)/) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;use qemu_real_host_page_size instead of sysconf(_SC_P=
AGESIZE)\n&quot; . $herecurr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;use qemu_real_host_page_size() instead of sysconf(_SC=
_PAGESIZE)\n&quot; . $herecurr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $non_exit_glib_a=
sserts =3D qr{g_assert_cmpstr|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint|<br>
diff --git a/util/meson.build b/util/meson.build<br>
index 804014ea0216..afd1923baa2b 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -42,7 +42,6 @@ if have_membarrier<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;sys_membarrier.c&#39;))<br>
=C2=A0endif<br>
=C2=A0util_ss.add(files(&#39;log.c&#39;))<br>
-util_ss.add(files(&#39;pagesize.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;qdist.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;qht.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;qsp.c&#39;))<br>
-- <br>
2.35.1.273.ge6ebfd0e8cbb<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000013dfff05d99f7f0b--

