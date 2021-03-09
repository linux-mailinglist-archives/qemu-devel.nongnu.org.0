Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC283330A5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:11:03 +0100 (CET)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjd8-0004M1-DO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjOc-0003Xx-Ao; Tue, 09 Mar 2021 15:56:02 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:39455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjOY-00049A-A0; Tue, 09 Mar 2021 15:56:02 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mnqfc-1m7dL81vac-00pJv7; Tue, 09 Mar 2021 21:55:52 +0100
Subject: Re: [PATCH] exec/memory: Use struct Object typedef
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210225182003.3629342-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8ec8b5b2-f970-1d3e-7771-a8e687346a15@vivier.eu>
Date: Tue, 9 Mar 2021 21:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210225182003.3629342-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:om4n1XYnf2sSNMzNEMaM1lW04cS9n0zM7IINSqImQYL8bg/9CFL
 /b1k7jTUh68Fx8QigzL87bynnR9a2vjj4DwieB8CtcL4NgmGlnVthYcojsn7O20TZgXGbcx
 Dpx/0Dk8lKxB4ZMWaV5ElE63VdlSOlxU2uSD6av7LHXIn50ld1YgaR3DsOa98Xy25FRzj/I
 MLrgIrowriKqbT/lPp9kA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K3lH4MOoPB4=:qn63ywOhcmMlUjYhEU9DQC
 eT4u3Y22p531i9E3QkZKgXvru/Y/S/K5/6qte0RozpAVa28EW6Re4I1wkaCaMbSco/7zG8V5P
 KU5aeSYmvb/T+bb7xu9Uz+/bb7Yyh8j9b+/te6HbWK9d+RwoSQhfGnMl9E/Veima3zDSmscjT
 XMYaRAbcoH6PH4QSVgDy1ldYrEF/rxXL1a76+lDn3rMrB0/Wk+8ZD4XXAWbkpzEGdSEiVGSL8
 KHI3pjYQiBiXjaMuQbxOCIZQVhEWPEIOvP5HIBsyGIh8Vlrk/XHiFa76tKcFQBpey4xcBPz5l
 FRpM6woGi8aIXbEWpOQ2vcbp4W5r2gQOmV3KdQoUBpAsAqWdZ50qyMBc+kH0I3tN4HIBGtxkt
 PYKFVDeu602dfY2G75Kg1Lrr0fkvVjQNEZgFvwDjQ6JaLLjgSDVAHOPub87/5FeTpJw1l0Fv8
 Z0JmfU8GuA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/02/2021 à 19:20, Philippe Mathieu-Daudé a écrit :
> We forward-declare Object typedef in "qemu/typedefs.h" since commit
> ca27b5eb7cd ("qom/object: Move Object typedef to 'qemu/typedefs.h'").
> Use it everywhere to make the code simpler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/exec/memory.h      | 32 ++++++++++++++++----------------
>  include/hw/ppc/pnv_xscom.h |  2 +-
>  hw/ppc/pnv_xscom.c         |  2 +-
>  softmmu/memory.c           | 12 ++++++------
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c6fb714e499..54ccf1a5f09 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -828,7 +828,7 @@ static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
>   * @size: size of the region; any subregions beyond this size will be clipped
>   */
>  void memory_region_init(MemoryRegion *mr,
> -                        struct Object *owner,
> +                        Object *owner,
>                          const char *name,
>                          uint64_t size);
>  
> @@ -876,7 +876,7 @@ void memory_region_unref(MemoryRegion *mr);
>   * @size: size of the region.
>   */
>  void memory_region_init_io(MemoryRegion *mr,
> -                           struct Object *owner,
> +                           Object *owner,
>                             const MemoryRegionOps *ops,
>                             void *opaque,
>                             const char *name,
> @@ -898,7 +898,7 @@ void memory_region_init_io(MemoryRegion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the caller.
>   */
>  void memory_region_init_ram_nomigrate(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        Error **errp);
> @@ -920,7 +920,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
>   * The only difference is part of the RAM region can be remapped.
>   */
>  void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
> -                                             struct Object *owner,
> +                                             Object *owner,
>                                               const char *name,
>                                               uint64_t size,
>                                               bool share,
> @@ -946,7 +946,7 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the caller.
>   */
>  void memory_region_init_resizeable_ram(MemoryRegion *mr,
> -                                       struct Object *owner,
> +                                       Object *owner,
>                                         const char *name,
>                                         uint64_t size,
>                                         uint64_t max_size,
> @@ -979,7 +979,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the caller.
>   */
>  void memory_region_init_ram_from_file(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        uint64_t align,
> @@ -1005,7 +1005,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the caller.
>   */
>  void memory_region_init_ram_from_fd(MemoryRegion *mr,
> -                                    struct Object *owner,
> +                                    Object *owner,
>                                      const char *name,
>                                      uint64_t size,
>                                      bool share,
> @@ -1030,7 +1030,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the caller.
>   */
>  void memory_region_init_ram_ptr(MemoryRegion *mr,
> -                                struct Object *owner,
> +                                Object *owner,
>                                  const char *name,
>                                  uint64_t size,
>                                  void *ptr);
> @@ -1058,7 +1058,7 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
>   * (For RAM device memory regions, migrating the contents rarely makes sense.)
>   */
>  void memory_region_init_ram_device_ptr(MemoryRegion *mr,
> -                                       struct Object *owner,
> +                                       Object *owner,
>                                         const char *name,
>                                         uint64_t size,
>                                         void *ptr);
> @@ -1076,7 +1076,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion *mr,
>   * @size: size of the region.
>   */
>  void memory_region_init_alias(MemoryRegion *mr,
> -                              struct Object *owner,
> +                              Object *owner,
>                                const char *name,
>                                MemoryRegion *orig,
>                                hwaddr offset,
> @@ -1101,7 +1101,7 @@ void memory_region_init_alias(MemoryRegion *mr,
>   * @errp: pointer to Error*, to store an error if it happens.
>   */
>  void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        Error **errp);
> @@ -1124,7 +1124,7 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>   * @errp: pointer to Error*, to store an error if it happens.
>   */
>  void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
> -                                             struct Object *owner,
> +                                             Object *owner,
>                                               const MemoryRegionOps *ops,
>                                               void *opaque,
>                                               const char *name,
> @@ -1183,7 +1183,7 @@ void memory_region_init_iommu(void *_iommu_mr,
>   * If you pass a non-NULL non-device @owner then we will assert.
>   */
>  void memory_region_init_ram(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp);
> @@ -1210,7 +1210,7 @@ void memory_region_init_ram(MemoryRegion *mr,
>   * @errp: pointer to Error*, to store an error if it happens.
>   */
>  void memory_region_init_rom(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp);
> @@ -1241,7 +1241,7 @@ void memory_region_init_rom(MemoryRegion *mr,
>   * @errp: pointer to Error*, to store an error if it happens.
>   */
>  void memory_region_init_rom_device(MemoryRegion *mr,
> -                                   struct Object *owner,
> +                                   Object *owner,
>                                     const MemoryRegionOps *ops,
>                                     void *opaque,
>                                     const char *name,
> @@ -1254,7 +1254,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
>   *
>   * @mr: the memory region being queried.
>   */
> -struct Object *memory_region_owner(MemoryRegion *mr);
> +Object *memory_region_owner(MemoryRegion *mr);
>  
>  /**
>   * memory_region_size: get a memory region's size.
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 8578f5a207d..2ff9f7a8d6f 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -139,7 +139,7 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
>  void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
>                               MemoryRegion *mr);
>  void pnv_xscom_region_init(MemoryRegion *mr,
> -                           struct Object *owner,
> +                           Object *owner,
>                             const MemoryRegionOps *ops,
>                             void *opaque,
>                             const char *name,
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index e9ae1569ffc..be7018e8ac5 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -308,7 +308,7 @@ void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset, MemoryRegion *mr)
>  }
>  
>  void pnv_xscom_region_init(MemoryRegion *mr,
> -                           struct Object *owner,
> +                           Object *owner,
>                             const MemoryRegionOps *ops,
>                             void *opaque,
>                             const char *name,
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..91f1bf47c30 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1581,7 +1581,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
>  
>  #ifdef CONFIG_POSIX
>  void memory_region_init_ram_from_file(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        uint64_t align,
> @@ -1607,7 +1607,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>  }
>  
>  void memory_region_init_ram_from_fd(MemoryRegion *mr,
> -                                    struct Object *owner,
> +                                    Object *owner,
>                                      const char *name,
>                                      uint64_t size,
>                                      bool share,
> @@ -1679,7 +1679,7 @@ void memory_region_init_alias(MemoryRegion *mr,
>  }
>  
>  void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        Error **errp)
> @@ -3205,7 +3205,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>  }
>  
>  void memory_region_init_ram(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp)
> @@ -3229,7 +3229,7 @@ void memory_region_init_ram(MemoryRegion *mr,
>  }
>  
>  void memory_region_init_rom(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp)
> @@ -3253,7 +3253,7 @@ void memory_region_init_rom(MemoryRegion *mr,
>  }
>  
>  void memory_region_init_rom_device(MemoryRegion *mr,
> -                                   struct Object *owner,
> +                                   Object *owner,
>                                     const MemoryRegionOps *ops,
>                                     void *opaque,
>                                     const char *name,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


