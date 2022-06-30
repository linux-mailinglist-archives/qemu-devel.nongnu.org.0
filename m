Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B55622E5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:16:03 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6zdy-0000FU-4L
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1o6zcS-0007yh-9D
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:14:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1o6zcQ-0007uM-Dw
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:14:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id r66so254950pgr.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CseVMsc9DMcvnremI2IMCVn9RXMEwKZ3PfQxnseEk1Y=;
 b=L86qxID6q2M+JSm6WJlw/ywbiK2Bd4F4OqP2crvM+fBErSUs7vAk8+S+Iq/oWCc3S3
 A/zD733aSeW/NQtqDBUXacjPlB7RxpFMnf6lRRa/+NdtBmLjMtHmcPsoOWwkq8KCWT59
 Wrjd2sZMC+z5N1mQaKCk8s3sRW71BeCnVhZwSRy715zMP+SNJe7eU9WYohudOv1KNRGA
 /2Hl1gt/4XtlScYZ3mwC111MIu9O+AEpZ9xmxnKCHZmdZRhh6DrJvNuc5sQfRD0Ka1kU
 JrjpbfOKNuX8+d69m9LSTBv0r1O0mwEp5rUB+SIBwil7KVtufeEqPNZkhvO1MatEsuMw
 lriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CseVMsc9DMcvnremI2IMCVn9RXMEwKZ3PfQxnseEk1Y=;
 b=0Qqmezht6QwVliHoHZkOIKyGB7oZvOX/ti561KbuZoGbZEulvWXdNKWveTTViC0C3/
 FZG5wBz+f4aav8ppt68m37gIeOTJ9/HWFu0TMa9EEH1KS/nsLvS6THbAhLCRgQZ9917c
 9YbaH5juZJvUUBZ63eeqfYutEkgUB7E8ppKQn/E8ctQs8tNPhDEhVrnrt/oiE8wSZCkT
 npLHrfc0eLxok7AIQZ9guq5N0DAxGHgRT7vonUZTakKMZ0MeONyNDra5aKjkj1LoVrxw
 pQsAvusnvjXjvv9MXJEG3UN8y8odEqdi8oi8ZzXpnqfuD9KKruyFh+FFoDLUY3LrOMMj
 K98g==
X-Gm-Message-State: AJIora/HKFlKJWj/+hY3Q/XoG1oSBBSShQaAmaGdlUz39V1mjWfY77QZ
 GpW5n0wf+UZuDZxVheYn6yNBVTlMf2d3sN9ZqLBfeA==
X-Google-Smtp-Source: AGRyM1sSw2bcuHVxuECIXV0dhinx7eNbwu+6Xk72mVPwUCDEPf65Qjtbn+gPrnXqf1ZcPTdHgl0RAcjI8NMysu55SIM=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr8746604pgw.223.1656616463900; Thu, 30
 Jun 2022 12:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
 <20220624090246.GA2181919@chaop.bj.intel.com>
In-Reply-To: <20220624090246.GA2181919@chaop.bj.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 30 Jun 2022 12:14:13 -0700
Message-ID: <CAGtprH82H_fjtRbL0KUxOkgOk4pgbaEbAydDYfZ0qxz41JCnAQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: "Nikunj A. Dadhania" <nikunj@amd.com>, kvm list <kvm@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86 <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
 Andi Kleen <ak@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=vannapurve@google.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

...
> > >     /*
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index afe18d70ece7..e18460e0d743 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -2899,6 +2899,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
> > >     if (max_level == PG_LEVEL_4K)
> > >             return PG_LEVEL_4K;
> > >
> > > +   if (kvm_slot_is_private(slot))
> > > +           return max_level;
> >
> > Can you explain the rationale behind the above change?
> > AFAIU, this overrides the transparent_hugepage=never setting for both
> > shared and private mappings.
>
> As Sean pointed out, this should check against fault->is_private instead
> of the slot. For private fault, the level is retrieved and stored to
> fault->max_level in kvm_faultin_pfn_private() instead of here.
>
> For shared fault, it will continue to query host_level below. For
> private fault, the host level has already been accounted in
> kvm_faultin_pfn_private().
>
> Chao
> >

With transparent_hugepages=always setting I see issues with the
current implementation.

Scenario:
1) Guest accesses a gfn range 0x800-0xa00 as private
2) Guest calls mapgpa to convert the range 0x84d-0x86e as shared
3) Guest tries to access recently converted memory as shared for the first time
Guest VM shutdown is observed after step 3 -> Guest is unable to
proceed further since somehow code section is not as expected

Corresponding KVM trace logs after step 3:
VCPU-0-61883   [078] ..... 72276.115679: kvm_page_fault: address
84d000 error_code 4
VCPU-0-61883   [078] ..... 72276.127005: kvm_mmu_spte_requested: gfn
84d pfn 100b4a4d level 2
VCPU-0-61883   [078] ..... 72276.127008: kvm_tdp_mmu_spte_changed: as
id 0 gfn 800 level 2 old_spte 100b1b16827 new_spte 100b4a00ea7
VCPU-0-61883   [078] ..... 72276.127009: kvm_mmu_prepare_zap_page: sp
gen 0 gfn 800 l1 8-byte q0 direct wux nxe ad root 0 sync
VCPU-0-61883   [078] ..... 72276.127009: kvm_tdp_mmu_spte_changed: as
id 0 gfn 800 level 1 old_spte 1003eb27e67 new_spte 5a0
VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
id 0 gfn 801 level 1 old_spte 10056cc8e67 new_spte 5a0
VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
id 0 gfn 802 level 1 old_spte 10056fa2e67 new_spte 5a0
VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
id 0 gfn 803 level 1 old_spte 0 new_spte 5a0
....
 VCPU-0-61883   [078] ..... 72276.127089: kvm_tdp_mmu_spte_changed: as
id 0 gfn 9ff level 1 old_spte 100a43f4e67 new_spte 5a0
 VCPU-0-61883   [078] ..... 72276.127090: kvm_mmu_set_spte: gfn 800
spte 100b4a00ea7 (rwxu) level 2 at 10052fa5020
 VCPU-0-61883   [078] ..... 72276.127091: kvm_fpu: unload

Looks like with transparent huge pages enabled kvm tried to handle the
shared memory fault on 0x84d gfn by coalescing nearby 4K pages
to form a contiguous 2MB page mapping at gfn 0x800, since level 2 was
requested in kvm_mmu_spte_requested.
This caused the private memory contents from regions 0x800-0x84c and
0x86e-0xa00 to get unmapped from the guest leading to guest vm
shutdown.

Does getting the mapping level as per the fault access type help
address the above issue? Any such coalescing should not cross between
private to
shared or shared to private memory regions.

> > >     host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
> > >     return min(host_level, max_level);
> > >  }
> >

Regards,
Vishal

