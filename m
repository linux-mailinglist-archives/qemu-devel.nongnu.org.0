Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C2460CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 03:30:28 +0100 (CET)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrWR0-0005uq-PR
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 21:30:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrWPc-0004RV-3G
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 21:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrWPZ-0002ar-Ma
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 21:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638152936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkni+43XYd8sAGdeAc3zuBN5W/FxB8ORubPQwNVfUSQ=;
 b=VSKcfqO7AvfDrRJu0a94OywqiPyXZfdTW7C89r353LlmW/Mjvw8IuC/XUlQ0tw40AUB/65
 t7YqtqjZHcvZFJBrx0Hiz6EAQEF216JRWqYUGA52p9qqimWLVJfTCQ8njCFNjECkIgLEna
 32tMJUR99Nmw07eaPsH+Bvna37UEeYo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-mO4KQuAvOeKirno23a3QIA-1; Sun, 28 Nov 2021 21:28:55 -0500
X-MC-Unique: mO4KQuAvOeKirno23a3QIA-1
Received: by mail-lf1-f69.google.com with SMTP id
 24-20020ac25f58000000b0041799ebf529so5013397lfz.1
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 18:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vkni+43XYd8sAGdeAc3zuBN5W/FxB8ORubPQwNVfUSQ=;
 b=rxByOvEE1AuQ9JwNzwojsYCk97//dJ0yZqKg7lSpZrrgm2W5a8lvX7sZqcIdxs0T/L
 XsPNjbgkeCWU8dsgQ702A0mdVrI8Rk3Fezh/jPQG31ycmFqimpfghbTxdY8GD7iLGKkk
 OPAOyz0+1MIiB0RbliRNRbKgZJjXK0PlIssHh8/e6PxjO56vQl0KZLaU6q2sW8xweC0D
 0v2mNwXqdao1RDhDv6+P961Z2njCzZgo7F5mIgrZKiE3N+yUerZabdvDpkMtTFRLx623
 spJC3NVoZ7HHSDBLPIwa/uoidmTu5pck5HkP8Iz/gzBOJFR7LpMhyM17DNDLntc7iEbb
 5Avw==
X-Gm-Message-State: AOAM530m78zfhuqo4sxMcrpcNnTch8PvEDtt/4ZpQT+4EhNUah/oy2+H
 go/vkAr6UkLQyyDMalfPE/W5v5KvXsOSRHzEfeDdlDHJwy5pKbwQY40lnQVt4MFExj7InmzVwzI
 Y6I8KkMQqeGdxrtdVJetlnn6JyFcr7/s=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr45052887lfr.348.1638152933727; 
 Sun, 28 Nov 2021 18:28:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMLIAMnfa/MX/EMjbvxGYw/aoD8nkWH9Lg6D1CfPQ5iAOwjUmgPFIJro5t0TzbQ5Xxpgo21qIgCrepFrjwTpE=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr45052862lfr.348.1638152933416; 
 Sun, 28 Nov 2021 18:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
 <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YaQqjEwDVUGurPD7@xz-m1.local>
In-Reply-To: <YaQqjEwDVUGurPD7@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 29 Nov 2021 10:28:42 +0800
Message-ID: <CACGkMEuz1qyp88igffJM+jQv5DUEnsu2yVmPwW45c8Qxo9hvGg@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "mst@redhat.com" <mst@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 9:19 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Sun, Nov 28, 2021 at 07:06:18AM +0000, Liu, Yi L wrote:
> > > From: Peter Xu <peterx@redhat.com>
> > > Sent: Thursday, November 25, 2021 2:14 PM
> > >
> > > On Thu, Nov 25, 2021 at 05:49:38AM +0000, Liu, Yi L wrote:
> > > > > From: Peter Xu <peterx@redhat.com>
> > > > > Sent: Thursday, November 25, 2021 12:31 PM
> > > > >
> > > > > On Thu, Nov 25, 2021 at 04:03:34AM +0000, Liu, Yi L wrote:
> > > > > > > From: Peter Xu <peterx@redhat.com>
> > > > > > > Sent: Wednesday, November 24, 2021 3:57 PM
> > > > > > >
> > > > > > > On Wed, Nov 24, 2021 at 02:03:09PM +0800, Jason Wang wrote:
> > > > > > > > When booting with scalable mode, I hit this error:
> > > > > > > >
> > > > > > > > qemu-system-x86_64: vtd_iova_to_slpte: detected splte reser=
ve
> > > non-
> > > > > > > zero iova=3D0xfffff002, level=3D0x1slpte=3D0x102681803)
> > > > > > > > qemu-system-x86_64: vtd_iommu_translate: detected translati=
on
> > > > > failure
> > > > > > > (dev=3D01:00:00, iova=3D0xfffff002)
> > > > > > > > qemu-system-x86_64: New fault is not recorded due to
> > > compression
> > > > > of
> > > > > > > faults
> > > > > > > >
> > > > > > > > This is because the SNP bit is set since Linux kernel commi=
t
> > > > > > > > 6c00612d0cba1 ("iommu/vt-d: Report right snoop capability w=
hen
> > > > > using
> > > > > > > > FL for IOVA") where SNP bit is set if scalable mode is on t=
hough this
> > > > > > > > seems to be an violation on the spec which said the SNP bit=
 is
> > > > > > > > considered to be reserved if SC is not supported.
> > > > > > >
> > > > > > > When I was reading that commit, I was actually confused by th=
is
> > > change:
> > > > > > >
> > > > > > > ---8<---
> > > > > > > diff --git a/drivers/iommu/intel/iommu.c
> > > > > b/drivers/iommu/intel/iommu.c
> > > > > > > index 956a02eb40b4..0ee5f1bd8af2 100644
> > > > > > > --- a/drivers/iommu/intel/iommu.c
> > > > > > > +++ b/drivers/iommu/intel/iommu.c
> > > > > > > @@ -658,7 +658,14 @@ static int
> > > > > domain_update_iommu_snooping(struct
> > > > > > > intel_iommu *skip)
> > > > > > >         rcu_read_lock();
> > > > > > >         for_each_active_iommu(iommu, drhd) {
> > > > > > >                 if (iommu !=3D skip) {
> > > > > > > -                       if (!ecap_sc_support(iommu->ecap)) {
> > > > > > > +                       /*
> > > > > > > +                        * If the hardware is operating in th=
e scalable mode,
> > > > > > > +                        * the snooping control is always sup=
ported since we
> > > > > > > +                        * always set PASID-table-entry.PGSNP=
 bit if the domain
> > > > > > > +                        * is managed outside (UNMANAGED).
> > > > > > > +                        */
> > > > > > > +                       if (!sm_supported(iommu) &&
> > > > > > > +                           !ecap_sc_support(iommu->ecap)) {
> > > > > > >                                 ret =3D 0;
> > > > > > >                                 break;
> > > > > > >                         }
> > > > > > > ---8<---
> > > > > > >
> > > > > > > Does it mean that for some hardwares that has
> > > sm_supported()=3D=3Dtrue,
> > > > > it'll
> > > > > > > have  SC bit cleared in ecap register?  That sounds odd, and =
not sure
> > > why.
> > > > > Maybe
> > > > > > > Yi Liu or Yi Sun may know?
> > > > > >
> > > > > > scalable mode has no dependency on SC, so it's possible.
> > > > >
> > > > > I see; thanks, Yi.
> > > > >
> > > > > However then OTOH I don't understand above comment
> > > > >
> > > > >   "If the hardware is operating in the scalable mode, the snoopin=
g control
> > > is
> > > > >    always supported since... "
> > > > >
> > > > > Because the current qemu vt-d emulation should fall into the case=
 that Yi
> > > > > mentioned - we support initial scalable mode but no SC yet..
> > > >
> > > > chapter 3.9 of 3.2 spec says below.
> > > >
> > > > =E2=80=9CIf the remapping hardware is setup in scalable-mode
> > > (RTADDR_REG.TTM=3D01b)
> > > > and the Page Snoop (PGSNP) field in PASID-table entry is Set, acces=
s to
> > > the
> > > > final page is snooped.=E2=80=9D
> > > >
> > > > It means the PGSNP field is available under scalable mode. And spec=
 also
> > > > says below in chapter 96. of 3.2 spec.
> > > >
> > > > "Requests snoop processor caches irrespective of, other attributes =
in the
> > > > request or other fields in paging structure entries used to transla=
te the
> > > > request."
> > > >
> > > > It means the PGSNP field of PASID table entry is the first class co=
ntrol
> > > > of the snoop behaviour. Also it means the scalable mode has the sno=
op
> > > > control by default. ^_^. So the comment in the above commit is corr=
ect
> > > > since the policy of intel iommu driver is always setting the PGSNP =
bit.
> > >
> > > I see.  Setting PGSNP bit in the pasid entry looks fine to me.
> > >
> > > However IIUC what's triggering the crash (that Jason is fixing) is th=
e guest
> > > iommu driver "thinks" SC is supported since scalable is enabled (even=
 if
> > > qemu vIOMMU has declared ECAP.SC=3D=3D0 there), then it'll update
> > > iommu_snooping bit, then it'll try to attach the SNP bit in the 2nd l=
evel
> > > pgtable (intel_iommu_map):
> > >
> > >     if ((iommu_prot & IOMMU_CACHE) && dmar_domain->iommu_snooping)
> > >             prot |=3D DMA_PTE_SNP;
> > >
> >
> > Above is the fact today.
> >
> > > So what I'm wondering is: whether the kernel should _not_ set SNP bit=
 in
> > > the 2nd level pgtable, even if we set PGSNP in the pasid entry.. beca=
use
> > > as you mentioned, the hardware (here the emulated vIOMMU) is allowed =
to have
> > > both scalable=3D=3D1 but sc=3D=3D0 so it may recognize PGSNP in pasid=
 entry but not
> > > the SNP bit in pgtables.
> >
> > This is a weird configuration. :( let's fix it in spec. e.g. PGSNP bit =
is
> > supported only when scalable=3D=3D1 and sc=3D=3D1. this makes more sens=
e. right?
> > Then SNP bit will always depend on sc bit, it won't have any relationsh=
ip
> > with scalable bit.
>
> Sounds reasonable.
>
> >
> > >
> > > If we'll skip pgtable SNP bit anyway for scalable mode, it looks weir=
d to
> > > explicitly set it too.
> > >
> > > I think it's fine for Jason's solution to just skip checking SNP bit =
so we
> > > ignore it in qemu, however just to double check we're on the same pag=
e.
> >
> > If we have above fix in spec, the iommu driver would also update its
> > behavior on the SNP bit. then the problem encountered by Jason will
> > go away. right?
>
> Looks right to me.
>
> I think we can still have Jason's patch continued because the kernel comm=
it to
> apply SNP bit is merged in v5.13, so we may need the qemu change to let i=
t
> still work with v5.13-v5.15+ guest kernels.  We'll loose the resv bit che=
ck a
> bit, but looks worthwhile.  Jason?

Yes, I agree. The only thing that may worry me is the migration
compatibility. If we migrate from new to old we may break the guests,
we probably need compatibility props for that.

And in the future, it could be even more troublesome,e.g there's one
day we found another bit that needs not to be checked. Maybe we should
even remove all the rsvd bits checks?

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


