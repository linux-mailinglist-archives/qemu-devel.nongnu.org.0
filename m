Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7945B716
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:03:36 +0100 (CET)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoBj-0002kg-CD
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:03:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpoAI-00024c-0i
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpoAD-0003Pc-IU
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637744519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ec26QHFpnTs+3p3bsz4geO2DcD3bL6f1idbZbMUKmA=;
 b=FGxWyHXk3Um/ua+CWo1gYQ02bLUERzEW8jPpk/01me8jpZhPqF1wcO5vzAndolwHQfkq61
 6pSipeyZo5ic7tzpisMFR8wTULZOGGDa7wk6c4F7XspnI3fL4oz73zHdBLanyOqQJP9dO/
 n28Pl4+ffbL5Ogsn/YtKqAH4ccRjnNQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-Opj41NiENs-ZOOMs0dca6Q-1; Wed, 24 Nov 2021 04:01:56 -0500
X-MC-Unique: Opj41NiENs-ZOOMs0dca6Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 y21-20020a056512045500b004162526955fso1088584lfk.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ec26QHFpnTs+3p3bsz4geO2DcD3bL6f1idbZbMUKmA=;
 b=RMVdxQbA+iAX8O3IjCkcRWKLA6VEkFT5djr0OJyxE3gLH2x2z13de+zG1w0Mlw7x9z
 6Vw1WBlkv1MlCNqGnOeMYN1ZvJlFgueKb+RIKIW5vtS6+TCiskfUd26kosPLnE6uI8bR
 FpyZXkcr2A/gPudBrQbDnDMQdBWgv1/Slcs7nmZZ8TrLHl+eTWn/AwIbf6tBJfT35GSY
 eiBj4D2fSLQupou6TL9KRxeiDckolikrD0+J42WtYc2dwZD1GGszBe2cx0CyuRZJKRCL
 7bj8qWa4C9izqwB3TGw72KoF2Q4U18OZAOERFLF0qro4cHRVSVI8zopyP5o/jseGmJnu
 qhWw==
X-Gm-Message-State: AOAM530Ow0aRq4UcuHi5zbh4/ngwUE8yMGusa9igaPuZqDZAbn/miLaJ
 y4l7VKHoKt8GAo4sAf//jluuLOwv1WPBLr90yORL9ctXdW5E7hBfA+JGKR2IOeJ4d3brV6o9qwU
 ZmZp/3sM3oXZW8DSVC0ctUxe2z7UAMtM=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr13277951lfv.481.1637744514431; 
 Wed, 24 Nov 2021 01:01:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6QAfNl4pswvINP66SUFmLjwjvzJwp3WxZpgZ/4gghLaj6uDbxLsVa4H4Yx+pQC2K0+kDFGnFsXKfXPSzb+80=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr13277889lfv.481.1637744513993; 
 Wed, 24 Nov 2021 01:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
In-Reply-To: <YZ39USAfW7i1oAOO@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Nov 2021 17:01:42 +0800
Message-ID: <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 24, 2021 at 4:52 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 04:28:52PM +0800, Jason Wang wrote:
> > On Wed, Nov 24, 2021 at 3:57 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Wed, Nov 24, 2021 at 02:03:09PM +0800, Jason Wang wrote:
> > > > When booting with scalable mode, I hit this error:
> > > >
> > > > qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve non-zero iova=0xfffff002, level=0x1slpte=0x102681803)
> > > > qemu-system-x86_64: vtd_iommu_translate: detected translation failure (dev=01:00:00, iova=0xfffff002)
> > > > qemu-system-x86_64: New fault is not recorded due to compression of faults
> > > >
> > > > This is because the SNP bit is set since Linux kernel commit
> > > > 6c00612d0cba1 ("iommu/vt-d: Report right snoop capability when using
> > > > FL for IOVA") where SNP bit is set if scalable mode is on though this
> > > > seems to be an violation on the spec which said the SNP bit is
> > > > considered to be reserved if SC is not supported.
> > >
> > > When I was reading that commit, I was actually confused by this change:
> > >
> > > ---8<---
> > > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > > index 956a02eb40b4..0ee5f1bd8af2 100644
> > > --- a/drivers/iommu/intel/iommu.c
> > > +++ b/drivers/iommu/intel/iommu.c
> > > @@ -658,7 +658,14 @@ static int domain_update_iommu_snooping(struct intel_iommu *skip)
> > >         rcu_read_lock();
> > >         for_each_active_iommu(iommu, drhd) {
> > >                 if (iommu != skip) {
> > > -                       if (!ecap_sc_support(iommu->ecap)) {
> > > +                       /*
> > > +                        * If the hardware is operating in the scalable mode,
> > > +                        * the snooping control is always supported since we
> > > +                        * always set PASID-table-entry.PGSNP bit if the domain
> > > +                        * is managed outside (UNMANAGED).
> > > +                        */
> > > +                       if (!sm_supported(iommu) &&
> > > +                           !ecap_sc_support(iommu->ecap)) {
> > >                                 ret = 0;
> > >                                 break;
> > >                         }
> > > ---8<---
> > >
> > > Does it mean that for some hardwares that has sm_supported()==true, it'll have
> > > SC bit cleared in ecap register?
> >
> > I guess not, so it's probably only the problem of vIOMMU.
>
> But then what does the code mean above?
>
> If SC is required for scalable mode,

I guess the code was tested on hardware with both SC and SM.

> ecap_sc_support()==false already implies
> sm_supported()==false too.  Then that check seems redundant.

To tell the truth, I'm not sure. And according to the spec SNP is
reserved if SC==false.

>
> >
> > > That sounds odd, and not sure why.  Maybe Yi
> > > Liu or Yi Sun may know?
> >
> > Another interesting point is that, it looks to me after that commit
> > SNP is used for the domain that is not UNMANAGED even if PGSNP is not
> > set.
> >
> >
> > >
> > > >
> > > > To unbreak the guest, ignore the SNP bit for scalable mode first. In
> > > > the future we may consider to add SC support.
> > >
> > > Oh yes, I remembered the last time we discussed this.  Could you remind me
> > > what's missing for us to support SC?
> >
> > Exactly what you described below.
> >
> > >
> > > IIUC, for common device emulations we can just declare SC==1, right?
> >
> > Strictly speaking, only safe for the datapath that is running in the
> > Qemu. For things like vhost-user, I'm not sure it can check CC when
> > using VFIO.
>
> Hmm yeah.. though I'll just call those vhost-user backends to fall into below
> "device assignment" category too.  Great to know we're on the same page here.

I see.

>
> >
> > >  As all
> > > the DMAs (including kernel accels like vhost) will be from host processors so
> > > there're no coherent issues with guest vcpu threads.
> > >
> > > If that's correct, the only challenge is device assignment in any form (I am
> > > not familiar with vdpa; so perhaps that includes vfio, vpda and any other kind
> > > of assigning host devices to guest?), then we'll try to detect IOMMU_CACHE
> > > capability from the host iommu groups that covers the assigned devices, and we
> > > only set SC==1 if we have cache coherency on all the devices?
> >
> > For VFIO yes, and we should prevent VFIO without CC to be plugged if
> > SC is advertised.
> >
> > For vDPA, we don't need to worry about it at all, kernel vDPA forces
> > IOMMU_CACHE now.
> >
> > vhost_vdpa_alloc_domain():
> >
> >         if (!iommu_capable(bus, IOMMU_CAP_CACHE_COHERENCY))
> >                 return -ENOTSUPP;
> >
> > (For device with on-chip IOMMU, it's the parent and device that
> > guarantees the CC)
>
> Ah right, yes you mentioned it and I forgot..  Though I'm not sure we'd simply
> double-check again here (if we'll support vfio anyway, then we'll need to be
> able to read those out from IOMMU groups), because we shouldn't rely on that
> fact which is an implementation detail of vdpa, imho (say, when vdpa starts to
> support !SC someday).

Good point, but at that time we need to expose the !SC via uAPI which
is currently not supported.

>
> PS: I have other comments below in previous reply - please have a look too! :-D

Sorry for missing that part :(

>
> >
> > Thanks
> >
> >
> > >
> > > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  hw/i386/intel_iommu.c          | 18 ++++++++++++------
> > > >  hw/i386/intel_iommu_internal.h |  2 ++
> > > >  2 files changed, 14 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > index 294499ee20..3bcac56c3e 100644
> > > > --- a/hw/i386/intel_iommu.c
> > > > +++ b/hw/i386/intel_iommu.c
> > > > @@ -969,7 +969,8 @@ static dma_addr_t vtd_get_iova_pgtbl_base(IntelIOMMUState *s,
> > > >  static uint64_t vtd_spte_rsvd[5];
> > > >  static uint64_t vtd_spte_rsvd_large[5];
> > > >
> > > > -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> > > > +                                   uint64_t slpte, uint32_t level)
> > > >  {
> > > >      uint64_t rsvd_mask = vtd_spte_rsvd[level];
> > > >
> > > > @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > >          rsvd_mask = vtd_spte_rsvd_large[level];
> > > >      }
> > > >
> > > > +    if (s->scalable_mode) {
> > > > +        rsvd_mask &= ~VTD_SPTE_SNP;
> > > > +    }
> > >
> > > IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
> > > we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
> > > entries?

Maybe, but it's probably a question that can only be answered by
Intel. I can change it for the next version if you stick.

> > >
> > > To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
> > > I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:
> > >
> > >   - vtd_spte_rsvd[1] (4K)
> > >   - vtd_spte_rsvd_large[2] (2M)
> > >   - vtd_spte_rsvd_large[3] (1G)
> > >
> > > What do you think?  Then we avoid passing IntelIOMMUState* all over too.

I started a version like that:), it should work, I will change that if
it was agreed by everyone.

The reason that I changed to pass IntelIOMMUState is that it results
in a smaller changeset. The reason is that I tend to introduce new
rsvd bits for SM mode since after checking vtd 3.3 it looks have
different reserved bit requirement than before (at least 1.2)

Thanks

>
> [Here]
>
> > >
> > > > +
> > > >      return slpte & rsvd_mask;
> > > >  }
> > > >
> > > > @@ -1054,7 +1059,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
> > > >                                iova, level, slpte, is_write);
> > > >              return is_write ? -VTD_FR_WRITE : -VTD_FR_READ;
> > > >          }
> > > > -        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
> > > > +        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
> > > >              error_report_once("%s: detected splte reserve non-zero "
> > > >                                "iova=0x%" PRIx64 ", level=0x%" PRIx32
> > > >                                "slpte=0x%" PRIx64 ")", __func__, iova,
> > > > @@ -1185,7 +1190,8 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
> > > >   * @write: whether parent level has write permission
> > > >   * @info: constant information for the page walk
> > > >   */
> > > > -static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
> > > > +static int vtd_page_walk_level(IntelIOMMUState *s,
> > > > +                               dma_addr_t addr, uint64_t start,
> > > >                                 uint64_t end, uint32_t level, bool read,
> > > >                                 bool write, vtd_page_walk_info *info)
> > > >  {
> > > > @@ -1214,7 +1220,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
> > > >              goto next;
> > > >          }
> > > >
> > > > -        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
> > > > +        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
> > > >              trace_vtd_page_walk_skip_reserve(iova, iova_next);
> > > >              goto next;
> > > >          }
> > > > @@ -1235,7 +1241,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
> > > >               * This is a valid PDE (or even bigger than PDE).  We need
> > > >               * to walk one further level.
> > > >               */
> > > > -            ret = vtd_page_walk_level(vtd_get_slpte_addr(slpte, info->aw),
> > > > +            ret = vtd_page_walk_level(s, vtd_get_slpte_addr(slpte, info->aw),
> > > >                                        iova, MIN(iova_next, end), level - 1,
> > > >                                        read_cur, write_cur, info);
> > > >          } else {
> > > > @@ -1294,7 +1300,7 @@ static int vtd_page_walk(IntelIOMMUState *s, VTDContextEntry *ce,
> > > >          end = vtd_iova_limit(s, ce, info->aw);
> > > >      }
> > > >
> > > > -    return vtd_page_walk_level(addr, start, end, level, true, true, info);
> > > > +    return vtd_page_walk_level(s, addr, start, end, level, true, true, info);
> > > >  }
> > > >
> > > >  static int vtd_root_entry_rsvd_bits_check(IntelIOMMUState *s,
> > > > diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> > > > index 3d5487fe2c..a6c788049b 100644
> > > > --- a/hw/i386/intel_iommu_internal.h
> > > > +++ b/hw/i386/intel_iommu_internal.h
> > > > @@ -388,6 +388,8 @@ typedef union VTDInvDesc VTDInvDesc;
> > > >  #define VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO 0xffff0000ffe0fff8
> > > >
> > > >  /* Rsvd field masks for spte */
> > > > +#define VTD_SPTE_SNP 0x800ULL
> > > > +
> > > >  #define VTD_SPTE_PAGE_L1_RSVD_MASK(aw, dt_supported) \
> > > >          dt_supported ? \
> > > >          (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Peter Xu
> > >
> >
>
> --
> Peter Xu
>


