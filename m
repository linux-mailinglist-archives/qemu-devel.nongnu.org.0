Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D6325BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:31:49 +0100 (CET)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSuy-0008Bn-2K
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lFStI-0007SP-3S; Thu, 25 Feb 2021 21:30:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55141 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lFStF-0003Od-4k; Thu, 25 Feb 2021 21:30:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DmtsV56TKz9sVS; Fri, 26 Feb 2021 13:29:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614306590;
 bh=lEEY7Qx2tQrnWIuW0AxqJQXv3TTN+I4hKqPT79xT7T4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/+2B2qNGPg8hT6RSTkLtdJKDwzOS1F2n7P0VQZ+0klyEAf7UVRItEoX09PfP6bKz
 Dh8PoUb/wUPZsAwNadRhiTVVKZ4V7q5FULaVYgQ7Ba+3o7vwPjWNOUD6G1Z8rCOrA8
 uwNXs6szKP6LVrkTsaYu56lwQtCJbLq6v+Z8EtP0=
Date: Fri, 26 Feb 2021 10:55:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] exec/memory: Use struct Object typedef
Message-ID: <YDg44Ovow7HPhqHR@yekko.fritz.box>
References: <20210225182003.3629342-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d7juCJ1Nj7RBeRsB"
Content-Disposition: inline
In-Reply-To: <20210225182003.3629342-1-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--d7juCJ1Nj7RBeRsB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 07:20:03PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We forward-declare Object typedef in "qemu/typedefs.h" since commit
> ca27b5eb7cd ("qom/object: Move Object typedef to 'qemu/typedefs.h'").
> Use it everywhere to make the code simpler.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/exec/memory.h      | 32 ++++++++++++++++----------------
>  include/hw/ppc/pnv_xscom.h |  2 +-
>  hw/ppc/pnv_xscom.c         |  2 +-
>  softmmu/memory.c           | 12 ++++++------
>  4 files changed, 24 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c6fb714e499..54ccf1a5f09 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -828,7 +828,7 @@ static inline bool MemoryRegionSection_eq(MemoryRegio=
nSection *a,
>   * @size: size of the region; any subregions beyond this size will be cl=
ipped
>   */
>  void memory_region_init(MemoryRegion *mr,
> -                        struct Object *owner,
> +                        Object *owner,
>                          const char *name,
>                          uint64_t size);
> =20
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
>   * RAM memory region to be migrated; that is the responsibility of the c=
aller.
>   */
>  void memory_region_init_ram_nomigrate(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        Error **errp);
> @@ -920,7 +920,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *m=
r,
>   * The only difference is part of the RAM region can be remapped.
>   */
>  void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
> -                                             struct Object *owner,
> +                                             Object *owner,
>                                               const char *name,
>                                               uint64_t size,
>                                               bool share,
> @@ -946,7 +946,7 @@ void memory_region_init_ram_shared_nomigrate(MemoryRe=
gion *mr,
>   * RAM memory region to be migrated; that is the responsibility of the c=
aller.
>   */
>  void memory_region_init_resizeable_ram(MemoryRegion *mr,
> -                                       struct Object *owner,
> +                                       Object *owner,
>                                         const char *name,
>                                         uint64_t size,
>                                         uint64_t max_size,
> @@ -979,7 +979,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *=
mr,
>   * RAM memory region to be migrated; that is the responsibility of the c=
aller.
>   */
>  void memory_region_init_ram_from_file(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        uint64_t align,
> @@ -1005,7 +1005,7 @@ void memory_region_init_ram_from_file(MemoryRegion =
*mr,
>   * RAM memory region to be migrated; that is the responsibility of the c=
aller.
>   */
>  void memory_region_init_ram_from_fd(MemoryRegion *mr,
> -                                    struct Object *owner,
> +                                    Object *owner,
>                                      const char *name,
>                                      uint64_t size,
>                                      bool share,
> @@ -1030,7 +1030,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *m=
r,
>   * RAM memory region to be migrated; that is the responsibility of the c=
aller.
>   */
>  void memory_region_init_ram_ptr(MemoryRegion *mr,
> -                                struct Object *owner,
> +                                Object *owner,
>                                  const char *name,
>                                  uint64_t size,
>                                  void *ptr);
> @@ -1058,7 +1058,7 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
>   * (For RAM device memory regions, migrating the contents rarely makes s=
ense.)
>   */
>  void memory_region_init_ram_device_ptr(MemoryRegion *mr,
> -                                       struct Object *owner,
> +                                       Object *owner,
>                                         const char *name,
>                                         uint64_t size,
>                                         void *ptr);
> @@ -1076,7 +1076,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion=
 *mr,
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
> @@ -1124,7 +1124,7 @@ void memory_region_init_rom_nomigrate(MemoryRegion =
*mr,
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
> =20
>  /**
>   * memory_region_size: get a memory region's size.
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 8578f5a207d..2ff9f7a8d6f 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -139,7 +139,7 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_o=
ffset,
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
> @@ -308,7 +308,7 @@ void pnv_xscom_add_subregion(PnvChip *chip, hwaddr of=
fset, MemoryRegion *mr)
>  }
> =20
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
> @@ -1581,7 +1581,7 @@ void memory_region_init_resizeable_ram(MemoryRegion=
 *mr,
> =20
>  #ifdef CONFIG_POSIX
>  void memory_region_init_ram_from_file(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        uint64_t align,
> @@ -1607,7 +1607,7 @@ void memory_region_init_ram_from_file(MemoryRegion =
*mr,
>  }
> =20
>  void memory_region_init_ram_from_fd(MemoryRegion *mr,
> -                                    struct Object *owner,
> +                                    Object *owner,
>                                      const char *name,
>                                      uint64_t size,
>                                      bool share,
> @@ -1679,7 +1679,7 @@ void memory_region_init_alias(MemoryRegion *mr,
>  }
> =20
>  void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> -                                      struct Object *owner,
> +                                      Object *owner,
>                                        const char *name,
>                                        uint64_t size,
>                                        Error **errp)
> @@ -3205,7 +3205,7 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner, bool disabled)
>  }
> =20
>  void memory_region_init_ram(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp)
> @@ -3229,7 +3229,7 @@ void memory_region_init_ram(MemoryRegion *mr,
>  }
> =20
>  void memory_region_init_rom(MemoryRegion *mr,
> -                            struct Object *owner,
> +                            Object *owner,
>                              const char *name,
>                              uint64_t size,
>                              Error **errp)
> @@ -3253,7 +3253,7 @@ void memory_region_init_rom(MemoryRegion *mr,
>  }
> =20
>  void memory_region_init_rom_device(MemoryRegion *mr,
> -                                   struct Object *owner,
> +                                   Object *owner,
>                                     const MemoryRegionOps *ops,
>                                     void *opaque,
>                                     const char *name,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d7juCJ1Nj7RBeRsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA4ON4ACgkQbDjKyiDZ
s5Iw8xAAvPTwA0LfEeYwyK9kxLYZvFRoP0ywRmnMHCf67jFxviJZUQ3I+IDqL8Z9
fEku7QnwpnWXvhJFXa3PDxVxshqGhLxlTRokpNEoliFDTTqcYgSZgrzr4w7OtEcj
L2j1tkjMbv3ft3if3G67wiLU2fBPzPG8ShMNlA8suXhc+hZL2BLWhSpdf0WpPZjL
qx36bYOBxXlRe09tkNm0BiAx1vCrNLoak8aqHt2egSgcdRo/DkTVXJRhzEpITO+M
R4PETsOQ9dDT/MRy1rc/79p5h3rlKDekRwL0MBgZSQP3CWU/KZAln6oTYQ9qj4fQ
cfkg7hYL45CFFK0d5ki6InYHDm+R3ZMRCgPnvtGsXvYFPWQc/PC3KQfVVG5TZAcV
m2SGzf8iyO95NzrK1ZIfBljwCLbskqHDMBRKyliipMvFOGGoAY3w6vlNmSUQOs9Y
Q7WPxP+bFC/iF332jwqqgE4kMdFt8DOYWcxzeqvN2IXhWlc9WCyEcJjitjw+2TCe
XO/E4uTVEF3x0V53vdkdDVnvmFz+4X7tGapxRbMCRYdNXH7JkKFqsMH1uYO7Uwz9
bV+iJy6YMj2gAe++HMocQfQiNjLtBUNCc8HajKx7jIpcEgndF0NKiPJ2Fpb9Rf4A
3S/kpip0pkjgyvHatSlNoR/rFcl3o8GkF1mas9z9irGhr8ffuKs=
=QlfV
-----END PGP SIGNATURE-----

--d7juCJ1Nj7RBeRsB--

