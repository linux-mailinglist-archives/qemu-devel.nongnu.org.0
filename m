Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6003F599206
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 02:58:01 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOqKl-0001tt-Su
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 20:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oOqIX-0007Fn-7A
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 20:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oOqIT-0007zd-CC
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 20:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660870534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=svEZUb0W6ofFXmxHBz1/6O4cvTPqTFhg8WCC5CoH9PI=;
 b=eW5NIPD0lc9GGF70GTgsisHUdqU+GPeyhNvtO5r07n/0o9XN9bokh1GqgDYXf2J4wA1lzC
 U0EW32KZMMeQAvnHUo6mAJJ10q7YgVzBV16SInuD5UcBuRcsEnPkuvtDpxLvi51O+C6k1N
 I4Bv+McgHUh9v5JgZ4P/GLbo7gOVz1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-eBxKN6AfNc67KhSSEnCwvg-1; Thu, 18 Aug 2022 20:55:33 -0400
X-MC-Unique: eBxKN6AfNc67KhSSEnCwvg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h8-20020a05640250c800b0044642d29d35so59263edb.18
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 17:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=svEZUb0W6ofFXmxHBz1/6O4cvTPqTFhg8WCC5CoH9PI=;
 b=tQXwr850KQPAw+fmQGAMHwJZyC0El1xMMVdsZc4YqdJBZ5hHsqVMRqPLn+0m9nwRlW
 WH4nFxYUA5W+VRV5UkPMT6ayVoy0JdOTlgPMe04fCzDvbd8ki2j2WbSjoj69w3k2yFAO
 Jxqwcg7QQe3Hh8OYMbM2Ds+u8n+GQz6rRwU/yDN3/cTCLYZUQISsb76dngCxTUcuvzv3
 b5EegYPrK5/EzlPlniuWhLZbSzW78YM83uioiIflarXWsqzCkRXAXrDlEV23pOtebk/K
 ygiNj1i/mSCnAPt0jN6rS2en+CPeHCpEm8YhqO5Bd28r2+9Uew4WohjTeVSRfC+vDFAX
 bQlg==
X-Gm-Message-State: ACgBeo1mXGgePeMt3EzhTQeylvPhefj5dZQDE2U+rF31XVwT2vaD/OYo
 nqV49IJFZJ0Wau8QwgnNHOsuKcuX1wOs5zhJF/0MrYA8lQe/LyMAeyzWMPwFGvzohE33HkqiRvo
 s0fIAKYksZJqyy7k8VaL4ENrajRg7ckw=
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr1974338ejc.331.1660870531855; 
 Thu, 18 Aug 2022 17:55:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bGNcudIZG6qdpNfy9F3eBbsF7v0MBkJmARGJGFmolh9yscbbXTAfJ8eIFawe6ywJDIAfr95Tm6QiDFUmbjJc=
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr1974323ejc.331.1660870531595; Thu, 18
 Aug 2022 17:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <Yv6baJoNikyuZ38R@xz-m1.local>
In-Reply-To: <Yv6baJoNikyuZ38R@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Thu, 18 Aug 2022 21:55:20 -0300
Message-ID: <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
To: Peter Xu <peterx@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 18, 2022 at 5:05 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Aug 16, 2022 at 06:12:50AM -0400, Emanuele Giuseppe Esposito wrote:
> > +static void kvm_memory_region_node_add(KVMMemoryListener *kml,
> > +                                       struct kvm_userspace_memory_region *mem)
> > +{
> > +    MemoryRegionNode *node;
> > +
> > +    node = g_malloc(sizeof(MemoryRegionNode));
> > +    *node = (MemoryRegionNode) {
> > +        .mem = mem,
> > +    };
>
> Nit: direct assignment of struct looks okay, but maybe pointer assignment
> is clearer (with g_malloc0?  Or iirc we're suggested to always use g_new0):
>
>   node = g_new0(MemoryRegionNode, 1);
>   node->mem = mem;
>
> [...]
>
> > +/* for KVM_SET_USER_MEMORY_REGION_LIST */
> > +struct kvm_userspace_memory_region_list {
> > +     __u32 nent;
> > +     __u32 flags;
> > +     struct kvm_userspace_memory_region entries[0];
> > +};
> > +
> >  /*
> >   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
> >   * other bits are reserved for kvm internal use which are defined in
> > @@ -1426,6 +1433,8 @@ struct kvm_vfio_spapr_tce {
> >                                       struct kvm_userspace_memory_region)
> >  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
> >  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> > +#define KVM_SET_USER_MEMORY_REGION_LIST _IOW(KVMIO, 0x49, \
> > +                                     struct kvm_userspace_memory_region_list)
>
> I think this is probably good enough, but just to provide the other small
> (but may not be important) piece of puzzle here.  I wanted to think through
> to understand better but I never did..
>
> For a quick look, please read the comment in kvm_set_phys_mem().
>
>                 /*
>                  * NOTE: We should be aware of the fact that here we're only
>                  * doing a best effort to sync dirty bits.  No matter whether
>                  * we're using dirty log or dirty ring, we ignored two facts:
>                  *
>                  * (1) dirty bits can reside in hardware buffers (PML)
>                  *
>                  * (2) after we collected dirty bits here, pages can be dirtied
>                  * again before we do the final KVM_SET_USER_MEMORY_REGION to
>                  * remove the slot.
>                  *
>                  * Not easy.  Let's cross the fingers until it's fixed.
>                  */
>
> One example is if we have 16G mem, we enable dirty tracking and we punch a
> hole of 1G at offset 1G, it'll change from this:
>
>                      (a)
>   |----------------- 16G -------------------|
>
> To this:
>
>      (b)    (c)              (d)
>   |--1G--|XXXXXX|------------14G------------|
>
> Here (c) will be a 1G hole.
>
> With current code, the hole punching will del region (a) and add back
> region (b) and (d).  After the new _LIST ioctl it'll be atomic and nicer.
>
> Here the question is if we're with dirty tracking it means for each region
> we have a dirty bitmap.  Currently we do the best effort of doing below
> sequence:
>
>   (1) fetching dirty bmap of (a)
>   (2) delete region (a)
>   (3) add region (b) (d)
>
> Here (a)'s dirty bmap is mostly kept as best effort, but still we'll lose
> dirty pages written between step (1) and (2) (and actually if the write
> comes within (2) and (3) I think it'll crash qemu, and iiuc that's what
> we're going to fix..).
>
> So ideally the atomic op can be:
>
>   "atomically fetch dirty bmap for removed regions, remove regions, and add
>    new regions"
>
> Rather than only:
>
>   "atomically remove regions, and add new regions"
>
> as what the new _LIST ioctl do.
>
> But... maybe that's not a real problem, at least I didn't know any report
> showing issue with current code yet caused by losing of dirty bits during
> step (1) and (2).  Neither do I know how to trigger an issue with it.
>
> I'm just trying to still provide this information so that you should be
> aware of this problem too, at the meantime when proposing the new ioctl
> change for qemu we should also keep in mind that we won't easily lose the
> dirty bmap of (a) here, which I think this patch does the right thing.
>

Thanks for bringing these details Peter!

What do you think of adding?
(4) Copy the corresponding part of (a)'s dirty bitmap to (b) and (d)'s
dirty bitmaps.


Best regards,
Leo

> Thanks!
>
> --
> Peter Xu
>


