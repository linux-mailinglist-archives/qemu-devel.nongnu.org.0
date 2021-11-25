Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DD45D333
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 03:36:19 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq4cU-00024d-5a
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 21:36:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4bH-0001Ob-Jo
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:35:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4bF-0003FH-0O
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637807700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GUKRIXHszaeVwpbnnWHe1jcHGMiyEXW5NpTD1pICm7Y=;
 b=Tb4mCIaY2f9qefReMVFH2V8QCJchLtg0t8Al50eCnPIpM/5BQGEnmUALa+2kSeS0Ymh8uw
 3kj+n0DGzLnAdmv3SJuPZ8xARu+heQllUKJK2wEVYv/ghe6uDAWTlbs0txVeOE3LrT7RLs
 XuMY+OhqHBJlZC8uLJHXZIgrZC4rGlI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-254-Fm8mGNiMMpWo91PF4VVyZQ-1; Wed, 24 Nov 2021 21:34:59 -0500
X-MC-Unique: Fm8mGNiMMpWo91PF4VVyZQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso2384740lfb.17
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 18:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUKRIXHszaeVwpbnnWHe1jcHGMiyEXW5NpTD1pICm7Y=;
 b=Sr7CXHWiFTlNQWhJCDWIF8fVB5TdARrwEP3nmempcjjlWR7k9XXNqzWzWuesHnCGLu
 0DMgHO4abuWDEb7LWxAaeqJ7CrizRNAqSfX4LM/LIaBlVoZLX0/XQIG2KOJKrn1jt9DR
 NPNIFDDjc3ko0X6rYafB3rNGvl7YVKFxPdWXdWF/ohm2gVCwNxsF47gtPTnpJ1wKpC+D
 h7sahZtKyBTRFqXdiALqxvpTMxR5ZK9O/km7wiCwi0i7UU8jdz5taKfRcUuFupX9OOZ7
 GkwaOF1aIG3aK/lOdApeIJKOCwSBDAJ66RJE4nDKtC6BmflJvaCjXj8Afy5M7T3sUv4s
 n1Fw==
X-Gm-Message-State: AOAM5332T+zNVPKozAxUUhrDmlkKL6DZ92hWkTLAmHXHqAv6oHt3S5Kf
 qIB4Wk1N/gJoMHzzvR8XUTiMTGuAlC0j7mnStXch6vi2uobTErFnkp8e2aiMMOjn/EiEJLpCyCV
 DJifA3Nf5BDmMoYnEcmSPGITPQlslwjI=
X-Received: by 2002:a2e:2ac1:: with SMTP id
 q184mr21475503ljq.420.1637807697522; 
 Wed, 24 Nov 2021 18:34:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbSDwPFo6sIO8LYclWw9xQ6biLFqcCT7bw8x7kdKSi59zKF5bl1ndFNJd26LMTK0iwjSsTzLi6MwdqF3Tuavg=
X-Received: by 2002:a2e:2ac1:: with SMTP id
 q184mr21475469ljq.420.1637807697215; 
 Wed, 24 Nov 2021 18:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
 <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
 <YZ4EioUDRAygL61n@xz-m1.local>
 <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
 <YZ4Pmf/dKkGirW95@xz-m1.local>
In-Reply-To: <YZ4Pmf/dKkGirW95@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Nov 2021 10:34:46 +0800
Message-ID: <CACGkMEt7KncnYMnhM19-zH-sDfrJYchvRnfHT6G6Jbsk9Kvq1Q@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 6:10 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:35:18PM +0800, Jason Wang wrote:
> > On Wed, Nov 24, 2021 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Wed, Nov 24, 2021 at 05:01:42PM +0800, Jason Wang wrote:
> > > > > > > > -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > > > > +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> > > > > > > > +                                   uint64_t slpte, uint32_t level)
> > > > > > > >  {
> > > > > > > >      uint64_t rsvd_mask = vtd_spte_rsvd[level];
> > > > > > > >
> > > > > > > > @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> > > > > > > >          rsvd_mask = vtd_spte_rsvd_large[level];
> > > > > > > >      }
> > > > > > > >
> > > > > > > > +    if (s->scalable_mode) {
> > > > > > > > +        rsvd_mask &= ~VTD_SPTE_SNP;
> > > > > > > > +    }
> > > > > > >
> > > > > > > IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
> > > > > > > we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
> > > > > > > entries?
> > > >
> > > > Maybe, but it's probably a question that can only be answered by
> > > > Intel. I can change it for the next version if you stick.
> > >
> > > I'm reading vtd spec v3.1 (June 2019) here, and chap 9.8 told me they're
> > > reserved bits for pgdir entries, as no SNP bit defined on pgdir entries.
> >
> > Yes, you're right.
> >
> > >
> > > >
> > > > > > >
> > > > > > > To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
> > > > > > > I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:
> > > > > > >
> > > > > > >   - vtd_spte_rsvd[1] (4K)
> > > > > > >   - vtd_spte_rsvd_large[2] (2M)
> > > > > > >   - vtd_spte_rsvd_large[3] (1G)
> > > > > > >
> > > > > > > What do you think?  Then we avoid passing IntelIOMMUState* all over too.
> > > >
> > > > I started a version like that:), it should work, I will change that if
> > > > it was agreed by everyone.
> > > >
> > > > The reason that I changed to pass IntelIOMMUState is that it results
> > > > in a smaller changeset. The reason is that I tend to introduce new
> > > > rsvd bits for SM mode since after checking vtd 3.3 it looks have
> > > > different reserved bit requirement than before (at least 1.2)
> > >
> > > Oh I thought changing vtd_spte_rsvd* should have smaller changeset instead,
> > > hmm? :)
> > >
> > > IMHO it'll be:
> > >
> > >   if (s->scalable_mode) {
> > >         vtd_spte_rsvd[1] &= ~BIT(11);
> > >         vtd_spte_rsvd_large[2] &= ~BIT(11);
> > >         vtd_spte_rsvd_large[3] &= ~BIT(11);
> > >   }
> > >
> > > Would that work?  Thanks,
> >
> > Works for sure, if we just want to fix the SNP bit.
> >
> > (I actually have a version like this as well). I can go this way
>
> Sounds good at least to me.  Thanks!
>
> >
> > The reason why I had another big changset is to align the reserved
> > bits to vtd 3.3. E.g it equires e.g bit 62 to be reserved 63 to be
> > ignored which seems not as strict as VTD_SL_IGN_COM. But it can be
> > addressed in the future.
>
> Ah I see.  We can do that later, or if the patch is ready anway IMHO we can
> have them fixed altogether too.
>
> It's weird that VT-d spec seems to be very prone to changes.. that's rare as a
> spec, and it even happened multiple times.

A side-effect is to bring troubles for the migration compatibility :(

>
> Another trivial thing: for that SNP bit code change, shall we also reference
> the Linux commit 6c00612d0cba ("iommu/vt-d: Report right snoop capability when
> using FL for IOVA", 2021-04-07) directly in the code as comment?  Just want to
> make sure we'll never forget why we added it as no one will be able to find a
> clue in the spec, meanwhile that explicit hint let us remember when we added SC
> support we can drop it.

Adding BaoLu.

As discussed, according to my test with vIOMMU, there are side effect
of that commit which uses SNP even for the second level page table for
domains that is not IOMMU_DOMAIN_UNMANAGED. If I was wrong, we can
refer to that in the code.

Thanks

>
> --
> Peter Xu
>


