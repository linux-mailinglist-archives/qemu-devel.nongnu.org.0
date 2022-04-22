Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086750B0A6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 08:32:57 +0200 (CEST)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhmqe-0007e7-0u
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 02:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nhmkQ-0005PS-SX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 02:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nhmkN-00034V-34
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 02:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650608786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/dbNVme+8aQdsxYtcyYan8RP116EZcchWswTSCN0D4=;
 b=f7T8WH5oLc9UG2L7XyJw3nhFGYIloW7qI1///9+LCNBmeavXtEC53mw2RWPcj5Toy01eXW
 D7EVWZ4if5WWJjN+CChVdlY4Zd8TDrChLDS/TwiNgBtf0VRZbYevY2nhVMGgl19F2ZdrbA
 58AnIVmIlVDmSpLVeSoS6vVEsGpqDfA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-cHFLqWfEPoqXKaihk4N-QQ-1; Fri, 22 Apr 2022 02:26:24 -0400
X-MC-Unique: cHFLqWfEPoqXKaihk4N-QQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 y22-20020a2e3216000000b0024dba34425fso2061598ljy.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 23:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/dbNVme+8aQdsxYtcyYan8RP116EZcchWswTSCN0D4=;
 b=b/MBFzUVstLPVnletOSW92rlxlbzmMvbz0matEhTB+A7tqxi+AJdfwVKuUv7sAwR93
 5+kaVwlhhZWTXhgl5hMo4BSXTVp53loESYVYvZ1JTQ56Mk2qNgvMCT9PN+JvKXefuKie
 q6LOVnQzx+RSfAHOoa7hu9nh5eBQ8v8O7vOkGwkmRWGs2zg+O8DUFNYz1R6mpNtu8dYW
 MJ+xKAJXO4FDdWFbvYrED6cm9uCX+pB53yHzQ7Ohcqy5+FQeY28Cs8eKqkY7JD8RUsqR
 mseG3/csgOZxMIwvEzDuZ02ko8QJlq/BX6kbkOZwHykHfyACjgXTc6XavKg3cT75c8Ba
 Gohg==
X-Gm-Message-State: AOAM531xbCmIXbFu9Qb20KHLfWNT4dsqx1njLYzZPiOlcB6lRgF6ZQOk
 YUpZkHCkIRgqFgAkk4Ss7c3M/IYDLARthhFiNBOLjh9anAg0gDVWnzQA5B9rkprjdQFgnR1ROTW
 gKDmBZLwJlhGTCGrW9H1GxwODztlphf0=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr2085870lfv.257.1650608782728; 
 Thu, 21 Apr 2022 23:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0S12rGZH/AJfWgcM3Qt+yF2OJ8zWh8oHPl2E8BQngCqeyTylpxA9uammXtPygfIpsYBbveojS62sgnVk8W9E=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr2085855lfv.257.1650608782322; Thu, 21
 Apr 2022 23:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-3-jasowang@redhat.com>
 <YmICD1fT7QYTiKYY@xz-m1.local>
In-Reply-To: <YmICD1fT7QYTiKYY@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Apr 2022 14:26:11 +0800
Message-ID: <CACGkMEtgDscMWQ3ddVCnL1z1btFhgbxV0g96Q84ZuRAcgjaAKw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] intel-iommu: drop VTDBus
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 9:17 AM Peter Xu <peterx@redhat.com> wrote:
>
> Hi, Jason,
>
> Mostly good to me, just a few nitpicks below.
>
> On Mon, Mar 21, 2022 at 01:54:27PM +0800, Jason Wang wrote:
> > We introduce VTDBus structure as an intermediate step for searching
> > the address space. This works well with SID based matching/lookup. But
> > when we want to support SID plus PASID based address space lookup,
> > this intermediate steps turns out to be a burden. So the patch simply
> > drops the VTDBus structure and use the PCIBus and devfn as the key for
> > the g_hash_table(). This simplifies the codes and the future PASID
> > extension.
> >
> > To prevent being slower for past vtd_find_as_from_bus_num() callers, a
> > vtd_as cache indexed by the bus number is introduced to store the last
> > recent search result of a vtd_as belongs to a specific bus.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c         | 238 +++++++++++++++++-----------------
> >  include/hw/i386/intel_iommu.h |  11 +-
> >  2 files changed, 123 insertions(+), 126 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 90964b201c..5851a17d0e 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -61,6 +61,16 @@
> >      }                                                                         \
> >  }
> >
> > +/*
> > + * PCI bus number (or SID) is not reliable since the device is usaully
> > + * initalized before guest can configure the PCI bridge
> > + * (SECONDARY_BUS_NUMBER).
> > + */
> > +struct vtd_as_key {
> > +    PCIBus *bus;
> > +    uint8_t devfn;
> > +};
> > +
> >  static void vtd_address_space_refresh_all(IntelIOMMUState *s);
> >  static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n);
> >
> > @@ -210,6 +220,31 @@ static guint vtd_uint64_hash(gconstpointer v)
> >      return (guint)*(const uint64_t *)v;
> >  }
> >
> > +static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
> > +{
> > +    const struct vtd_as_key *key1 = v1;
> > +    const struct vtd_as_key *key2 = v2;
> > +
> > +    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
> > +}
> > +
> > +static inline uint16_t vtd_make_source_id(uint8_t bus_num, uint8_t devfn)
> > +{
> > +    return ((bus_num & 0xffUL) << 8) | (devfn & 0xffUL);
> > +}
>
> Nit: we could directly drop this one and use PCI_BUILD_BDF().

Will fix.

>
> > +
> > +/*
> > + * Note that we use pointer to PCIBus as the key, so hashing/shifting
> > + * based on the pointer value is intended.
>
> Thanks for the comment; that helps.
>
> Should we also mention that this hash is not the only interface to identify
> two vtd_as*, say, even if on a 32bit system we got last 24 bits collapsed
> on two vtd_as* pointers, we can still have vtd_as_equal() to guard us?

Ok. let me add that in the next version.

>
> > + */
> > +static guint vtd_as_hash(gconstpointer v)
> > +{
> > +    const struct vtd_as_key *key = v;
> > +    guint value = (guint)(uintptr_t)key->bus;
> > +
> > +    return (guint)(value << 8 | key->devfn);
> > +}
> > +
> >  static gboolean vtd_hash_remove_by_domain(gpointer key, gpointer value,
> >                                            gpointer user_data)
> >  {
> > @@ -248,22 +283,14 @@ static gboolean vtd_hash_remove_by_page(gpointer key, gpointer value,
> >  static void vtd_reset_context_cache_locked(IntelIOMMUState *s)
> >  {
> >      VTDAddressSpace *vtd_as;
> > -    VTDBus *vtd_bus;
> > -    GHashTableIter bus_it;
> > -    uint32_t devfn_it;
> > +    GHashTableIter as_it;
> >
> >      trace_vtd_context_cache_reset();
> >
> > -    g_hash_table_iter_init(&bus_it, s->vtd_as_by_busptr);
> > +    g_hash_table_iter_init(&as_it, s->vtd_as);
> >
> > -    while (g_hash_table_iter_next (&bus_it, NULL, (void**)&vtd_bus)) {
> > -        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
> > -            vtd_as = vtd_bus->dev_as[devfn_it];
> > -            if (!vtd_as) {
> > -                continue;
> > -            }
> > -            vtd_as->context_cache_entry.context_cache_gen = 0;
> > -        }
> > +    while (g_hash_table_iter_next (&as_it, NULL, (void**)&vtd_as)) {
> > +        vtd_as->context_cache_entry.context_cache_gen = 0;
> >      }
> >      s->context_cache_gen = 1;
> >  }
> > @@ -993,32 +1020,6 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> >      return slpte & rsvd_mask;
> >  }
> >
> > -/* Find the VTD address space associated with a given bus number */
> > -static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_num)
> > -{
> > -    VTDBus *vtd_bus = s->vtd_as_by_bus_num[bus_num];
> > -    GHashTableIter iter;
> > -
> > -    if (vtd_bus) {
> > -        return vtd_bus;
> > -    }
> > -
> > -    /*
> > -     * Iterate over the registered buses to find the one which
> > -     * currently holds this bus number and update the bus_num
> > -     * lookup table.
> > -     */
> > -    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> > -    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> > -        if (pci_bus_num(vtd_bus->bus) == bus_num) {
> > -            s->vtd_as_by_bus_num[bus_num] = vtd_bus;
> > -            return vtd_bus;
> > -        }
> > -    }
> > -
> > -    return NULL;
> > -}
> > -
> >  /* Given the @iova, get relevant @slptep. @slpte_level will be the last level
> >   * of the translation, can be used for deciding the size of large page.
> >   */
> > @@ -1634,24 +1635,13 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
> >
> >  static void vtd_switch_address_space_all(IntelIOMMUState *s)
> >  {
> > +    VTDAddressSpace *vtd_as;
> >      GHashTableIter iter;
> > -    VTDBus *vtd_bus;
> > -    int i;
> > -
> > -    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> > -    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> > -        for (i = 0; i < PCI_DEVFN_MAX; i++) {
> > -            if (!vtd_bus->dev_as[i]) {
> > -                continue;
> > -            }
> > -            vtd_switch_address_space(vtd_bus->dev_as[i]);
> > -        }
> > -    }
> > -}
> >
> > -static inline uint16_t vtd_make_source_id(uint8_t bus_num, uint8_t devfn)
> > -{
> > -    return ((bus_num & 0xffUL) << 8) | (devfn & 0xffUL);
> > +    g_hash_table_iter_init(&iter, s->vtd_as);
> > +    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_as)) {
> > +        vtd_switch_address_space(vtd_as);
> > +    }
> >  }
> >
> >  static const bool vtd_qualified_faults[] = {
> > @@ -1688,18 +1678,39 @@ static inline bool vtd_is_interrupt_addr(hwaddr addr)
> >      return VTD_INTERRUPT_ADDR_FIRST <= addr && addr <= VTD_INTERRUPT_ADDR_LAST;
> >  }
> >
> > +static gboolean vtd_find_as_by_sid(gpointer key, gpointer value,
> > +                                   gpointer user_data)
> > +{
> > +    struct vtd_as_key *as_key = (struct vtd_as_key *)key;
> > +    uint16_t target_sid = *(uint16_t *)user_data;
> > +    uint16_t sid = vtd_make_source_id(pci_bus_num(as_key->bus),
> > +                                      as_key->devfn);
> > +    return sid == target_sid;
> > +}
> > +
> > +static VTDAddressSpace *vtd_get_as_by_sid(IntelIOMMUState *s, uint16_t sid)
> > +{
> > +    uint8_t bus_num = sid >> 8;
>
> PCI_BUS_NUM(sid)?

Will do.

>
> > +    VTDAddressSpace *vtd_as = s->vtd_as_cache[bus_num];
> > +
> > +    if (vtd_as &&
> > +        (sid == vtd_make_source_id(pci_bus_num(vtd_as->bus),
> > +                                   vtd_as->devfn))) {
> > +        return vtd_as;
> > +    }
> > +
> > +    vtd_as = g_hash_table_find(s->vtd_as, vtd_find_as_by_sid, &sid);
> > +    s->vtd_as_cache[bus_num] = vtd_as;
> > +
> > +    return vtd_as;
> > +}
> > +
> >  static void vtd_pt_enable_fast_path(IntelIOMMUState *s, uint16_t source_id)
> >  {
> > -    VTDBus *vtd_bus;
> >      VTDAddressSpace *vtd_as;
> >      bool success = false;
> >
> > -    vtd_bus = vtd_find_as_from_bus_num(s, VTD_SID_TO_BUS(source_id));
> > -    if (!vtd_bus) {
> > -        goto out;
> > -    }
> > -
> > -    vtd_as = vtd_bus->dev_as[VTD_SID_TO_DEVFN(source_id)];
> > +    vtd_as = vtd_get_as_by_sid(s, source_id);
> >      if (!vtd_as) {
> >          goto out;
> >      }
> > @@ -1907,11 +1918,10 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
> >                                            uint16_t source_id,
> >                                            uint16_t func_mask)
> >  {
> > +    GHashTableIter as_it;
> >      uint16_t mask;
> > -    VTDBus *vtd_bus;
> >      VTDAddressSpace *vtd_as;
> >      uint8_t bus_n, devfn;
> > -    uint16_t devfn_it;
> >
> >      trace_vtd_inv_desc_cc_devices(source_id, func_mask);
> >
> > @@ -1934,32 +1944,31 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
> >      mask = ~mask;
> >
> >      bus_n = VTD_SID_TO_BUS(source_id);
> > -    vtd_bus = vtd_find_as_from_bus_num(s, bus_n);
> > -    if (vtd_bus) {
> > -        devfn = VTD_SID_TO_DEVFN(source_id);
> > -        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
> > -            vtd_as = vtd_bus->dev_as[devfn_it];
> > -            if (vtd_as && ((devfn_it & mask) == (devfn & mask))) {
> > -                trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(devfn_it),
> > -                                             VTD_PCI_FUNC(devfn_it));
> > -                vtd_iommu_lock(s);
> > -                vtd_as->context_cache_entry.context_cache_gen = 0;
> > -                vtd_iommu_unlock(s);
> > -                /*
> > -                 * Do switch address space when needed, in case if the
> > -                 * device passthrough bit is switched.
> > -                 */
> > -                vtd_switch_address_space(vtd_as);
> > -                /*
> > -                 * So a device is moving out of (or moving into) a
> > -                 * domain, resync the shadow page table.
> > -                 * This won't bring bad even if we have no such
> > -                 * notifier registered - the IOMMU notification
> > -                 * framework will skip MAP notifications if that
> > -                 * happened.
> > -                 */
> > -                vtd_sync_shadow_page_table(vtd_as);
> > -            }
> > +    devfn = VTD_SID_TO_DEVFN(source_id);
> > +
> > +    g_hash_table_iter_init(&as_it, s->vtd_as);
> > +    while (g_hash_table_iter_next(&as_it, NULL, (void**)&vtd_as)) {
> > +        if ((pci_bus_num(vtd_as->bus) == bus_n) &&
> > +            (vtd_as->devfn & mask) == (devfn & mask)) {
> > +            trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(vtd_as->devfn),
> > +                                         VTD_PCI_FUNC(vtd_as->devfn));
> > +            vtd_iommu_lock(s);
> > +            vtd_as->context_cache_entry.context_cache_gen = 0;
> > +            vtd_iommu_unlock(s);
> > +            /*
> > +             * Do switch address space when needed, in case if the
> > +             * device passthrough bit is switched.
> > +             */
> > +            vtd_switch_address_space(vtd_as);
> > +            /*
> > +             * So a device is moving out of (or moving into) a
> > +             * domain, resync the shadow page table.
> > +             * This won't bring bad even if we have no such
> > +             * notifier registered - the IOMMU notification
> > +             * framework will skip MAP notifications if that
> > +             * happened.
> > +             */
> > +            vtd_sync_shadow_page_table(vtd_as);
> >          }
> >      }
> >  }
> > @@ -2473,18 +2482,13 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
> >  {
> >      VTDAddressSpace *vtd_dev_as;
> >      IOMMUTLBEvent event;
> > -    struct VTDBus *vtd_bus;
> >      hwaddr addr;
> >      uint64_t sz;
> >      uint16_t sid;
> > -    uint8_t devfn;
> >      bool size;
> > -    uint8_t bus_num;
> >
> >      addr = VTD_INV_DESC_DEVICE_IOTLB_ADDR(inv_desc->hi);
> >      sid = VTD_INV_DESC_DEVICE_IOTLB_SID(inv_desc->lo);
> > -    devfn = sid & 0xff;
> > -    bus_num = sid >> 8;
> >      size = VTD_INV_DESC_DEVICE_IOTLB_SIZE(inv_desc->hi);
> >
> >      if ((inv_desc->lo & VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO) ||
> > @@ -2495,12 +2499,11 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
> >          return false;
> >      }
> >
> > -    vtd_bus = vtd_find_as_from_bus_num(s, bus_num);
> > -    if (!vtd_bus) {
> > -        goto done;
> > -    }
> > -
> > -    vtd_dev_as = vtd_bus->dev_as[devfn];
> > +    /*
> > +     * Using sid is OK since the guest should have finished the
> > +     * initialization of both the bus and device.
> > +     */
> > +    vtd_dev_as = vtd_get_as_by_sid(s, sid);
> >      if (!vtd_dev_as) {
> >          goto done;
> >      }
> > @@ -3426,27 +3429,27 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
> >
> >  VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
> >  {
> > -    uintptr_t key = (uintptr_t)bus;
> > -    VTDBus *vtd_bus = g_hash_table_lookup(s->vtd_as_by_busptr, &key);
> > +    /*
> > +     * We can't simply use sid here since the bus number might not be
> > +     * initialized by the guest.
> > +     */
> > +    struct vtd_as_key key = {
> > +        .bus = bus,
> > +        .devfn = devfn,
> > +    };
> >      VTDAddressSpace *vtd_dev_as;
> >      char name[128];
> >
> > -    if (!vtd_bus) {
> > -        uintptr_t *new_key = g_malloc(sizeof(*new_key));
> > -        *new_key = (uintptr_t)bus;
> > -        /* No corresponding free() */
> > -        vtd_bus = g_malloc0(sizeof(VTDBus) + sizeof(VTDAddressSpace *) * \
> > -                            PCI_DEVFN_MAX);
> > -        vtd_bus->bus = bus;
> > -        g_hash_table_insert(s->vtd_as_by_busptr, new_key, vtd_bus);
> > -    }
> > +    vtd_dev_as = g_hash_table_lookup(s->vtd_as, &key);
> > +    if (!vtd_dev_as) {
> > +        struct vtd_as_key *new_key = g_malloc(sizeof(*new_key));
> >
> > -    vtd_dev_as = vtd_bus->dev_as[devfn];
> > +        new_key->bus = bus;
> > +        new_key->devfn = devfn;
> >
> > -    if (!vtd_dev_as) {
> >          snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
> >                   PCI_FUNC(devfn));
> > -        vtd_bus->dev_as[devfn] = vtd_dev_as = g_malloc0(sizeof(VTDAddressSpace));
> > +        vtd_dev_as = g_malloc0(sizeof(VTDAddressSpace));
> >
> >          vtd_dev_as->bus = bus;
> >          vtd_dev_as->devfn = (uint8_t)devfn;
> > @@ -3502,6 +3505,8 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
> >                                              &vtd_dev_as->nodmar, 0);
> >
> >          vtd_switch_address_space(vtd_dev_as);
> > +
> > +        g_hash_table_insert(s->vtd_as, new_key, vtd_dev_as);
> >      }
> >      return vtd_dev_as;
> >  }
> > @@ -3875,7 +3880,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
> >
> >      QLIST_INIT(&s->vtd_as_with_notifiers);
> >      qemu_mutex_init(&s->iommu_lock);
> > -    memset(s->vtd_as_by_bus_num, 0, sizeof(s->vtd_as_by_bus_num));
> >      memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
> >                            "intel_iommu", DMAR_REG_SIZE);
> >
> > @@ -3897,8 +3901,8 @@ static void vtd_realize(DeviceState *dev, Error **errp)
> >      /* No corresponding destroy */
> >      s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
> >                                       g_free, g_free);
> > -    s->vtd_as_by_busptr = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
> > -                                              g_free, g_free);
> > +    s->vtd_as = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
> > +                                      g_free, g_free);
> >      vtd_init(s);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
> >      pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
> > diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> > index 3b5ac869db..fa1bed353c 100644
> > --- a/include/hw/i386/intel_iommu.h
> > +++ b/include/hw/i386/intel_iommu.h
> > @@ -58,7 +58,6 @@ typedef struct VTDContextEntry VTDContextEntry;
> >  typedef struct VTDContextCacheEntry VTDContextCacheEntry;
> >  typedef struct VTDAddressSpace VTDAddressSpace;
> >  typedef struct VTDIOTLBEntry VTDIOTLBEntry;
> > -typedef struct VTDBus VTDBus;
> >  typedef union VTD_IR_TableEntry VTD_IR_TableEntry;
> >  typedef union VTD_IR_MSIAddress VTD_IR_MSIAddress;
> >  typedef struct VTDPASIDDirEntry VTDPASIDDirEntry;
> > @@ -111,12 +110,6 @@ struct VTDAddressSpace {
> >      IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> >  };
> >
> > -struct VTDBus {
> > -    PCIBus* bus;             /* A reference to the bus to provide translation for */
> > -    /* A table of VTDAddressSpace objects indexed by devfn */
> > -    VTDAddressSpace *dev_as[];
> > -};
> > -
> >  struct VTDIOTLBEntry {
> >      uint64_t gfn;
> >      uint16_t domain_id;
> > @@ -253,8 +246,8 @@ struct IntelIOMMUState {
> >      uint32_t context_cache_gen;     /* Should be in [1,MAX] */
> >      GHashTable *iotlb;              /* IOTLB */
> >
> > -    GHashTable *vtd_as_by_busptr;   /* VTDBus objects indexed by PCIBus* reference */
> > -    VTDBus *vtd_as_by_bus_num[VTD_PCI_BUS_MAX]; /* VTDBus objects indexed by bus number */
> > +    GHashTable *vtd_as;             /* VTD address space indexed by source id*/
>
> It's not indexed by source ID but vtd_as_key?

Right, let me fix that.

>
> Meanwhile how about renaming it to vtd_address_spaces?  Since we use vtd_as
> as the name for VTDAddressSpace* in most code paths, so imho it'll be
> easier to identify the two.

Ok.

Thanks

>
> > +    VTDAddressSpace *vtd_as_cache[VTD_PCI_BUS_MAX]; /* VTD address space cache */
> >      /* list of registered notifiers */
> >      QLIST_HEAD(, VTDAddressSpace) vtd_as_with_notifiers;
> >
> > --
> > 2.25.1
> >
>
> --
> Peter Xu
>


