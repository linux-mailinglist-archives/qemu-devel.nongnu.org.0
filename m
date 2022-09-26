Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F35EAC66
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:24:46 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocquT-0008Ex-BK
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ocqPB-0007AH-RX
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:52:25 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ocqP9-0000aF-Bi
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:52:25 -0400
Received: by mail-lj1-x236.google.com with SMTP id x29so7974238ljq.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=x4NTypTBJW4b7REu+E6eGP25pHpiqubalYhFPom5anA=;
 b=nyBYl3et3D/Hwg0PXcmhDbdFVdgPs3wT1T5m4FWqxqT5warTXHeLblDbQ/PO42CWGY
 jbpOwM8f7b+hUVCjTVqEffZDcvNQvdlgXth8PswhOzbaHGeI6lrVsgAHqFlK93PKl3Ai
 29wu0qn3ZcEfauxpueUyETsbUfSS3n0CXd8kORVyU3Uk9W+0ddF1wH325LwJztuinsWa
 lNrIfEakQ6yL4BBqZDrJojilF7V7sSd37sQ8L03NWeQ320JAVL8LJpzI5X3t8KB5QrvI
 KVgePx51bdk4JXI/uNiFSoF+7/stF86Grk0vLeOtU1pn4URzIXpZfxGdKpM0y4tu7MVO
 9wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=x4NTypTBJW4b7REu+E6eGP25pHpiqubalYhFPom5anA=;
 b=k0wbOWShoorCY4ErSJjFFlo0lFvHH/98FUcZV9QjvwLw/62/znS33z9RN+sS3b3yM9
 +mOMbZLdtDXFd2Zlil4QFz1hLUKvx5AYvwiFK45lqRRmgM8V4oo0ePryt/yjUOi01F9M
 czeY7Uk9t+CJBp9nS2DsO1jowNa0FLAxR6dIos7evshTKaOxX/sHcnnPntVdZb4O5qTK
 m/qmQDNCGViAcXdYBwysSIYp+Fg7UyjkABmbfnF7hYG077jbhbGBj4lIE41mKmydSSUT
 anLK/I9/OmrbZAFsK+wsq03gbTwy0XE3FKxbs/yWsN4aIFD/OdMH7CM4GAWX9JxVz5Oi
 63eA==
X-Gm-Message-State: ACrzQf2mpLdbVH/CU9nIiWV5cIb3bT0P7h3iwvROgXUEfjI/XfUwNLzm
 vEKUZkUl0MyGShWjHvfV3v1xbUFSK6YLqo0pWeRO1A==
X-Google-Smtp-Source: AMsMyM4TnPZUbURsP5BnRXq8d6hA/qshAGD43sNBUgtRFJmy1zG4ZPjO55nhnzDzvSMBCXJWhr1o64pz5goInSn46Ck=
X-Received: by 2002:a05:651c:1508:b0:26c:622e:abe1 with SMTP id
 e8-20020a05651c150800b0026c622eabe1mr7742402ljf.228.1664207540822; Mon, 26
 Sep 2022 08:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
In-Reply-To: <20220926142330.GC2658254@chaop.bj.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Sep 2022 16:51:44 +0100
Message-ID: <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=tabba@google.com; helo=mail-lj1-x236.google.com
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

On Mon, Sep 26, 2022 at 3:28 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> On Fri, Sep 23, 2022 at 04:19:46PM +0100, Fuad Tabba wrote:
> > > Regarding pKVM's use case, with the shim approach I believe this can be done by
> > > allowing userspace mmap() the "hidden" memfd, but with a ton of restrictions
> > > piled on top.
> > >
> > > My first thought was to make the uAPI a set of KVM ioctls so that KVM could tightly
> > > tightly control usage without taking on too much complexity in the kernel, but
> > > working through things, routing the behavior through the shim itself might not be
> > > all that horrific.
> > >
> > > IIRC, we discarded the idea of allowing userspace to map the "private" fd because
> > > things got too complex, but with the shim it doesn't seem _that_ bad.
> > >
> > > E.g. on the memfd side:
> > >
> > >   1. The entire memfd must be mapped, and at most one mapping is allowed, i.e.
> > >      mapping is all or nothing.
> > >
> > >   2. Acquiring a reference via get_pfn() is disallowed if there's a mapping for
> > >      the restricted memfd.
> > >
> > >   3. Add notifier hooks to allow downstream users to further restrict things.
> > >
> > >   4. Disallow splitting VMAs, e.g. to force userspace to munmap() everything in
> > >      one shot.
> > >
> > >   5. Require that there are no outstanding references at munmap().  Or if this
> > >      can't be guaranteed by userspace, maybe add some way for userspace to wait
> > >      until it's ok to convert to private?  E.g. so that get_pfn() doesn't need
> > >      to do an expensive check every time.
> > >
> > >   static int memfd_restricted_mmap(struct file *file, struct vm_area_struct *vma)
> > >   {
> > >         if (vma->vm_pgoff)
> > >                 return -EINVAL;
> > >
> > >         if ((vma->vm_end - vma->vm_start) != <file size>)
> > >                 return -EINVAL;
> > >
> > >         mutex_lock(&data->lock);
> > >
> > >         if (data->has_mapping) {
> > >                 r = -EINVAL;
> > >                 goto err;
> > >         }
> > >         list_for_each_entry(notifier, &data->notifiers, list) {
> > >                 r = notifier->ops->mmap_start(notifier, ...);
> > >                 if (r)
> > >                         goto abort;
> > >         }
> > >
> > >         notifier->ops->mmap_end(notifier, ...);
> > >         mutex_unlock(&data->lock);
> > >         return 0;
> > >
> > >   abort:
> > >         list_for_each_entry_continue_reverse(notifier &data->notifiers, list)
> > >                 notifier->ops->mmap_abort(notifier, ...);
> > >   err:
> > >         mutex_unlock(&data->lock);
> > >         return r;
> > >   }
> > >
> > >   static void memfd_restricted_close(struct vm_area_struct *vma)
> > >   {
> > >         mutex_lock(...);
> > >
> > >         /*
> > >          * Destroy the memfd and disable all future accesses if there are
> > >          * outstanding refcounts (or other unsatisfied restrictions?).
> > >          */
> > >         if (<outstanding references> || ???)
> > >                 memfd_restricted_destroy(...);
> > >         else
> > >                 data->has_mapping = false;
> > >
> > >         mutex_unlock(...);
> > >   }
> > >
> > >   static int memfd_restricted_may_split(struct vm_area_struct *area, unsigned long addr)
> > >   {
> > >         return -EINVAL;
> > >   }
> > >
> > >   static int memfd_restricted_mapping_mremap(struct vm_area_struct *new_vma)
> > >   {
> > >         return -EINVAL;
> > >   }
> > >
> > > Then on the KVM side, its mmap_start() + mmap_end() sequence would:
> > >
> > >   1. Not be supported for TDX or SEV-SNP because they don't allow adding non-zero
> > >      memory into the guest (after pre-boot phase).
> > >
> > >   2. Be mutually exclusive with shared<=>private conversions, and is allowed if
> > >      and only if the entire gfn range of the associated memslot is shared.
> >
> > In general I think that this would work with pKVM. However, limiting
> > private<->shared conversions to the granularity of a whole memslot
> > might be difficult to handle in pKVM, since the guest doesn't have the
> > concept of memslots. For example, in pKVM right now, when a guest
> > shares back its restricted DMA pool with the host it does so at the
> > page-level. pKVM would also need a way to make an fd accessible again
> > when shared back, which I think isn't possible with this patch.
>
> But does pKVM really want to mmap/munmap a new region at the page-level,
> that can cause VMA fragmentation if the conversion is frequent as I see.
> Even with a KVM ioctl for mapping as mentioned below, I think there will
> be the same issue.

pKVM doesn't really need to unmap the memory. What is really important
is that the memory is not GUP'able. Having private memory mapped and
then accessed by a misbehaving/malicious process will reinject a fault
into the misbehaving process.

Cheers,
/fuad

> >
> > You were initially considering a KVM ioctl for mapping, which might be
> > better suited for this since KVM knows which pages are shared and
> > which ones are private. So routing things through KVM might simplify
> > things and allow it to enforce all the necessary restrictions (e.g.,
> > private memory cannot be mapped). What do you think?
> >
> > Thanks,
> > /fuad

