Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FC545908
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 02:13:46 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzSHZ-0002Fk-HO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 20:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcorr@google.com>)
 id 1nzSFV-0001Po-Ot
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 20:11:37 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:42564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcorr@google.com>)
 id 1nzSFT-0008BB-PZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 20:11:37 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so1398192fac.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lN+fOqwv9bBcDqIpukqHItG5mOqsK9h2lCdbXTf1cPM=;
 b=DayT0SdBt1ymTKyry+8RI8dWvFXfKXAgjmO8VhNnB1yoDZK63YuzcCUTHD3X1Z3+t5
 KxmGEbccYszaa9LA1rH+uPvXkUot/k7y+eYJ5dVw1vcNDUZMV9ll/y/F+7N08dr0Wzcn
 baBzETzPA15Z2tn9QgoF5S7+WOA0j8RJa/fH3l+HKIsIdEIRN75ENG6RuJQTaJE4f7s+
 tdQ6ePOMDHk+W48X2uZ7KmmqPYEcwu7pMK65fJXjpYRLWoV5X97j/IkcgrkGUpYpxwIB
 E5LIO66muSm/XASIShQU2K4+YUS/ejVNHYtSotPk8eFHXkkvvETkJhzMm8POKoBM9Wup
 sSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lN+fOqwv9bBcDqIpukqHItG5mOqsK9h2lCdbXTf1cPM=;
 b=jxXrRNLcGN6suYv/ZmzCUP04FfX5Y11+noiB0jUwN1uI4vP4rbUoko1NwHYEPUWsLf
 QVVSxnjqECbyZ6NzIL15qb6WcWQhwYW/3PgvDsQ80bAQbIVViXOJ7Dmci651dBTXn49H
 AUnPF0RoPHKNvePTGkEVqZcy5VHenS55FRI/lUAur3vJsruBMg0l6I4D+uFH/fzKj6fB
 /N4TWjxQHShwvt9TwUv4zWEVD4TsqtBuNaVOMV9V0hQIKcNbBa0O882I2G414dRpvuiq
 ENc2Mq55PAYSoPppq3LcrTRJztNnEBxksdKeBtDs4hVMinB2omjmDwMUTOfkrF01oFSA
 NPrA==
X-Gm-Message-State: AOAM531Pl0ij0jsdqPQ21U6m1U1Tx6YZrnQPkBiqUUrRV1OB40BBnygv
 K4ppZW9PNxtPh9GCBu2YTaBsUiIaSq3LJSrjXpQp1w==
X-Google-Smtp-Source: ABdhPJzdaT0C30mX9Im9rqGsL6x1Rmi0294lLn68XE92+pqgxWwSN0AqB6f3CMYnEGDUJ7ZH1btvuZX8xfTHzXelZbU=
X-Received: by 2002:a05:6870:b616:b0:e2:f8bb:5eb with SMTP id
 cm22-20020a056870b61600b000e2f8bb05ebmr3338490oab.218.1654819893261; Thu, 09
 Jun 2022 17:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
In-Reply-To: <20220608021820.GA1548172@chaop.bj.intel.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 9 Jun 2022 17:11:21 -0700
Message-ID: <CAA03e5GmJw8u83=OG2wYrhdO81Sx5Jme-jkUnoTMQ7cc_o7u=w@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, kvm list <kvm@vger.kernel.org>, 
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
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=marcorr@google.com; helo=mail-oa1-x32.google.com
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

On Tue, Jun 7, 2022 at 7:22 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> On Tue, Jun 07, 2022 at 05:55:46PM -0700, Marc Orr wrote:
> > On Tue, Jun 7, 2022 at 12:01 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> > > On Mon, Jun 06, 2022 at 01:09:50PM -0700, Vishal Annapurve wrote:
> > > > >
> > > > > Private memory map/unmap and conversion
> > > > > ---------------------------------------
> > > > > Userspace's map/unmap operations are done by fallocate() ioctl on the
> > > > > backing store fd.
> > > > >   - map: default fallocate() with mode=0.
> > > > >   - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
> > > > > The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
> > > > > secondary MMU page tables.
> > > > >
> > > > ....
> > > > >    QEMU: https://github.com/chao-p/qemu/tree/privmem-v6
> > > > >
> > > > > An example QEMU command line for TDX test:
> > > > > -object tdx-guest,id=tdx \
> > > > > -object memory-backend-memfd-private,id=ram1,size=2G \
> > > > > -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
> > > > >
> > > >
> > > > There should be more discussion around double allocation scenarios
> > > > when using the private fd approach. A malicious guest or buggy
> > > > userspace VMM can cause physical memory getting allocated for both
> > > > shared (memory accessible from host) and private fds backing the guest
> > > > memory.
> > > > Userspace VMM will need to unback the shared guest memory while
> > > > handling the conversion from shared to private in order to prevent
> > > > double allocation even with malicious guests or bugs in userspace VMM.
> > >
> > > I don't know how malicious guest can cause that. The initial design of
> > > this serie is to put the private/shared memory into two different
> > > address spaces and gives usersapce VMM the flexibility to convert
> > > between the two. It can choose respect the guest conversion request or
> > > not.
> >
> > For example, the guest could maliciously give a device driver a
> > private page so that a host-side virtual device will blindly write the
> > private page.
>
> With this patch series, it's actually even not possible for userspace VMM
> to allocate private page by a direct write, it's basically unmapped from
> there. If it really wants to, it should so something special, by intention,
> that's basically the conversion, which we should allow.

I think Vishal did a better job to explain this scenario in his last
reply than I did.

> > > It's possible for a usrspace VMM to cause double allocation if it fails
> > > to call the unback operation during the conversion, this may be a bug
> > > or not. Double allocation may not be a wrong thing, even in conception.
> > > At least TDX allows you to use half shared half private in guest, means
> > > both shared/private can be effective. Unbacking the memory is just the
> > > current QEMU implementation choice.
> >
> > Right. But the idea is that this patch series should accommodate all
> > of the CVM architectures. Or at least that's what I know was
> > envisioned last time we discussed this topic for SNP [*].
>
> AFAICS, this series should work for both TDX and SNP, and other CVM
> architectures. I don't see where TDX can work but SNP cannot, or I
> missed something here?

Agreed. I was just responding to the "At least TDX..." bit. Sorry for
any confusion.

> >
> > Regardless, it's important to ensure that the VM respects its memory
> > budget. For example, within Google, we run VMs inside of containers.
> > So if we double allocate we're going to OOM. This seems acceptable for
> > an early version of CVMs. But ultimately, I think we need a more
> > robust way to ensure that the VM operates within its memory container.
> > Otherwise, the OOM is going to be hard to diagnose and distinguish
> > from a real OOM.
>
> Thanks for bringing this up. But in my mind I still think userspace VMM
> can do and it's its responsibility to guarantee that, if that is hard
> required. By design, userspace VMM is the decision-maker for page
> conversion and has all the necessary information to know which page is
> shared/private. It also has the necessary knobs to allocate/free the
> physical pages for guest memory. Definitely, we should make userspace
> VMM more robust.

Vishal and Sean did a better job to articulate the concern in their
most recent replies.

