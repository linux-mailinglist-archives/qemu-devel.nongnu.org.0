Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708D6AF6B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:28:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZduK-0005tu-SD; Tue, 07 Mar 2023 15:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Mp4HZAYKCrMlXTgcVZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--seanjc.bounces.google.com>)
 id 1pZduI-0005rB-Da
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:27:34 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Mp4HZAYKCrMlXTgcVZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--seanjc.bounces.google.com>)
 id 1pZduG-0002Q2-Ny
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:27:34 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 q61-20020a17090a1b4300b00237d2fb8400so8632759pjq.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678220850;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WGcASroMdccxdn62Jjtjh8PVnJGDXhBcjr99ONuCvY4=;
 b=OwwLfDPKljzAkPvlj0S/FrolNQFkMYhVCSYaPZA6BhlyFeubRSg3vonk6akM+nwgAx
 dcS6vYx/LWgfF4nSPN+n5wRbJl1+oX04X/RQuea86YN+QKQuGEhXA8GHTKbpJNljgVbg
 1tgLB7KavCS6Q8io76xaUiHKm29QSamSGbG7VBUDlQZNg7fOcC8uJ1SLfFlvvf38+NHp
 H0+zdtAOsLWl91QdOI5eJY+EmcNzqsXqCw01IvZ9IrObznTsFWqkSsLtumj8X2Gb549e
 mgTJkRz7STcC9OGGE966xqlp75dxFmI9JO9DcpLgaboo61ZXNHLGYkcot+ahXB1p5gKf
 Im0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678220850;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGcASroMdccxdn62Jjtjh8PVnJGDXhBcjr99ONuCvY4=;
 b=mfSct78xGpOVNGgcbqJhhdZFlVkMyVp7URUFGOAS3Hnirhhylo2Xw0KwTmwEH8aVVL
 G7OwXwl2GonX5/KyARmmWhFB8trnCp+P7amnU5vjJ9848twDaaDJiJclqjYJLe3A7AEN
 7Tk6RAjwMfAtfzQvo9LTMxbDvEmK27u1YcSHJzJHNcKxxUrHLoKexRbYc41fABzwXxi3
 nT+f++fwPCrx0e/fTZFHLPrbRiMVarNqjnPM5MmdwoPhNHf90T06htqNesIs4eFTmoZ1
 aF6ZssTbbnkj+QjtGlu3GDbjOKW0VdO/6A9VoowgmDvDE6f6XEscCAw/KedbUZYHkf84
 HD6A==
X-Gm-Message-State: AO0yUKXBHNRe2MFjTyJjZ6b6o+HRPK8XgBVJAIuPnJPu0fTCm2/oCI7w
 TYKk55pPPlrv6oTaTEAyCUjeeI99qJM=
X-Google-Smtp-Source: AK7set9n+PBGh5X4bHcHssSmlZaRESH4dUDPeHJTAkKKGP+YbNHu8+uM5MNsGFpRsbe7uC0L5WQKdFmMJ3c=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:2948:0:b0:503:7bcd:9806 with SMTP id
 bu8-20020a632948000000b005037bcd9806mr5442294pgb.4.1678220850029; Tue, 07 Mar
 2023 12:27:30 -0800 (PST)
Date: Tue, 7 Mar 2023 12:27:28 -0800
In-Reply-To: <diqzcz5kz85e.fsf@ackerleytng-cloudtop.c.googlers.com>
Mime-Version: 1.0
References: <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
 <diqzcz5kz85e.fsf@ackerleytng-cloudtop.c.googlers.com>
Message-ID: <ZAeeMA9pPYwFiuaX@google.com>
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, corbet@lwn.net, vkuznets@redhat.com, 
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de, 
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, 
 kirill.shutemov@linux.intel.com, luto@kernel.org, jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 qperret@google.com, tabba@google.com, michael.roth@amd.com, mhocko@suse.com, 
 wei.w.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3Mp4HZAYKCrMlXTgcVZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--seanjc.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please trim your replies so that readers don't need to scan through a hundred or
so lines of quotes just to confirm there's nothing there.

On Tue, Mar 07, 2023, Ackerley Tng wrote:
> Chao Peng <chao.p.peng@linux.intel.com> writes:
> 
> > Register/unregister private memslot to fd-based memory backing store
> > restrictedmem and implement the callbacks for restrictedmem_notifier:
> >    - invalidate_start()/invalidate_end() to zap the existing memory
> >      mappings in the KVM page table.
> >    - error() to request KVM_REQ_MEMORY_MCE and later exit to userspace
> >      with KVM_EXIT_SHUTDOWN.
> 
> > Expose KVM_MEM_PRIVATE for memslot and KVM_MEMORY_ATTRIBUTE_PRIVATE for
> > KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to userspace but either are
> > controlled by kvm_arch_has_private_mem() which should be rewritten by
> > architecture code.
> 
> Could we perhaps rename KVM_MEM_PRIVATE to KVM_MEM_PROTECTED, to be in
> line with KVM_X86_PROTECTED_VM?
> 
> I feel that a memslot that has the KVM_MEM_PRIVATE flag need not always
> be private; It can sometimes be providing memory that is shared and
> also accessible from the host.
> 
> KVM_MEMORY_ATTRIBUTE_PRIVATE is fine as-is because this flag is set when
> the guest memory is meant to be backed by private memory.
> 
> KVM_MEMORY_EXIT_FLAG_PRIVATE is also okay because the flag is used to
> indicate when the memory error is caused by a private access (as opposed
> to a shared access).
> 
> kvm_slot_can_be_private() could perhaps be renamed kvm_is_protected_slot()?

No to this suggestion.  I agree that KVM_MEM_PRIVATE is a bad name, but
kvm_is_protected_slot() is just as wrong.  The _only_ thing that the flag controls
is whether whether or not the memslot has an fd that is bound to restricted memory.
The memslot itself is not protected in any way, and if the entire memslot is mapped
shared, then the data backed by the memslot isn't protected either.

What about KVM_MEM_CAN_BE_PRIVATE?  KVM_MEM_PRIVATIZABLE is more succinct, but
AFAICT that's a made up word, and IMO is unnecessarily fancy.

