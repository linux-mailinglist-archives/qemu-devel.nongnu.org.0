Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A0845B797
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:37:44 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoil-0008FJ-K9
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:37:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpoh5-00067o-HE
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpogi-0007yW-Lv
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637746535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BvDQBbTfdnYub1PeJ7/YkczjB0QtZQjIB59JQQAluo8=;
 b=Mp49LAMMV2vV6XC9nJo3mH+HTBcHFvPZ8fAevHWcy2z+u3cq4rZVxX5/xzIeXyWfvf/t16
 W7dLMi86pk/5tcyfuEnrQafvqT6NatnYMHyo9D8TMXMRNSKPB9MZgWF9Bla8Qknybx+qZK
 PGadbXmSFkuFEhHufqKcUXlWXlibxP4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-VZe3Xgu1P563DG8GKI38aw-1; Wed, 24 Nov 2021 04:35:31 -0500
X-MC-Unique: VZe3Xgu1P563DG8GKI38aw-1
Received: by mail-lj1-f198.google.com with SMTP id
 p1-20020a2e7401000000b00218d0d11e91so610781ljc.15
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BvDQBbTfdnYub1PeJ7/YkczjB0QtZQjIB59JQQAluo8=;
 b=7yAK2Fn19vrMGtPuBv82LlJYnfGqwUEIX7y6sNvKtVjnkPFI2akME1Mvh3hP/dQ15z
 NxqKN/S/Gq695AGOIhEjQQBgfnGRo2wpQxKevFHN4hVyaI1vryjFokxNHjaX6PQ6lBgl
 by0dUT5dPU9Gx5dorGZLbmK7zA51GEg6yL5+MmNFNz/vG2zJ1rY6L33P/kaRF/sjiGHu
 pfv0zvUWVFL+49hvfdJqWFjr1YNntAVKtdlKUfpOsmi63XDFqZtwg3gif1jLuFpn3Bs+
 sBY0lvhxUtNX8q+kRq/Fi+l+lHlIS0Kf35Uelb7JT2h08HE5rqzNdxp0blGpmAYUX9kd
 pyAw==
X-Gm-Message-State: AOAM533yebDxAC+M4WjtSDFFPMn83dfrG8UoHezQWQ7IyNMDaZwBHxaZ
 i0jzoctaHtBOZe9Z/bTe8VJRdaq9CQiiytzV8KFoMSy+DWbuZ3xjr12FeoLXDdLJqF4myuI+6wl
 dUzfWJZ/G8s2urSlnvonSo8TYEDvGXn0=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr12567136lfu.199.1637746530410; 
 Wed, 24 Nov 2021 01:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX7woejrlj7MK14TWQFPhbhCl2ciBhFrdefIHfC+do+oesjt4WZkkmu57wb3bQGzpXty45bC5LO6cafgmoOSI=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr12567111lfu.199.1637746530150; 
 Wed, 24 Nov 2021 01:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
 <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
 <YZ4EioUDRAygL61n@xz-m1.local>
In-Reply-To: <YZ4EioUDRAygL61n@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Nov 2021 17:35:18 +0800
Message-ID: <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Nov 24, 2021 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:01:42PM +0800, Jason Wang wrote:
> > > > > > -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > > +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> > > > > > +                                   uint64_t slpte, uint32_t level)
> > > > > >  {
> > > > > >      uint64_t rsvd_mask = vtd_spte_rsvd[level];
> > > > > >
> > > > > > @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > >          rsvd_mask = vtd_spte_rsvd_large[level];
> > > > > >      }
> > > > > >
> > > > > > +    if (s->scalable_mode) {
> > > > > > +        rsvd_mask &= ~VTD_SPTE_SNP;
> > > > > > +    }
> > > > >
> > > > > IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
> > > > > we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
> > > > > entries?
> >
> > Maybe, but it's probably a question that can only be answered by
> > Intel. I can change it for the next version if you stick.
>
> I'm reading vtd spec v3.1 (June 2019) here, and chap 9.8 told me they're
> reserved bits for pgdir entries, as no SNP bit defined on pgdir entries.

Yes, you're right.

>
> >
> > > > >
> > > > > To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
> > > > > I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:
> > > > >
> > > > >   - vtd_spte_rsvd[1] (4K)
> > > > >   - vtd_spte_rsvd_large[2] (2M)
> > > > >   - vtd_spte_rsvd_large[3] (1G)
> > > > >
> > > > > What do you think?  Then we avoid passing IntelIOMMUState* all over too.
> >
> > I started a version like that:), it should work, I will change that if
> > it was agreed by everyone.
> >
> > The reason that I changed to pass IntelIOMMUState is that it results
> > in a smaller changeset. The reason is that I tend to introduce new
> > rsvd bits for SM mode since after checking vtd 3.3 it looks have
> > different reserved bit requirement than before (at least 1.2)
>
> Oh I thought changing vtd_spte_rsvd* should have smaller changeset instead,
> hmm? :)
>
> IMHO it'll be:
>
>   if (s->scalable_mode) {
>         vtd_spte_rsvd[1] &= ~BIT(11);
>         vtd_spte_rsvd_large[2] &= ~BIT(11);
>         vtd_spte_rsvd_large[3] &= ~BIT(11);
>   }
>
> Would that work?  Thanks,

Works for sure, if we just want to fix the SNP bit.

(I actually have a version like this as well). I can go this way

The reason why I had another big changset is to align the reserved
bits to vtd 3.3. E.g it equires e.g bit 62 to be reserved 63 to be
ignored which seems not as strict as VTD_SL_IGN_COM. But it can be
addressed in the future.

Thanks

>
> --
> Peter Xu
>


