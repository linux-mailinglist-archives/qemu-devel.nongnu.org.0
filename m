Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C85E7E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:27:41 +0200 (CEST)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkaa-0001Lg-Oe
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1obkU5-0002jv-21
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:20:58 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1obkU0-0007fT-Bq
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:20:54 -0400
Received: by mail-lj1-x236.google.com with SMTP id x29so463619ljq.2
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=SUWKwcsZsry2fgvm0fDpc5kVnOus3A4t37kogjVDCAM=;
 b=ENR7gm/ufNi1bXyPhRkLqOIR8X61pAuHZDAxvBQJtBMo1XxcJXpZCyvZXjdZtxEGqs
 Rld/BEcs2SP4Qyo9L4ZnVLbMttpTZWKLplZzijm55RmkSXps8vg+nlMTQRL8Q8n8sP8V
 PQt74elT4aSaOtht+ghVFN1gYzIIvLmyZUBZycxab9teGDT4klNyOyRb/aF7xVrdEhn9
 7oLI/l2Io92zNWZn3GSEQCNXcxdOVW4hgKbxpiZ3V8r6dHHCPZ3UDzrOP3Zt+jMD0Csi
 vmw3ypm10IkLOpdYu1J8qcIYc6CXN4laL/fqx5HsbDxujMM99DHcUV+6BWkduPO9udYw
 ZNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SUWKwcsZsry2fgvm0fDpc5kVnOus3A4t37kogjVDCAM=;
 b=vkf7oaVX8A6BeI6m89oF7aP4jQXcyI5jZCKeHXmXaMa850017BG5LXD/HhjujM0a9U
 OO+jGhBA19niey9QRjKrqCk4wRVl2/q5MPBYysn4BEL63C+61kUcjylvcZgg38P3Lqxl
 18sFQRvYkcSzhQ9RW3ryv9Aqw7QvFC8NjJBOIojr7WSJyJbdVJEsd24kU+oJ2RjGCIcf
 UwE84riFUFgP/iOkdh/TkCUidG+CRT8oZgyYQfqfawW1ZwmzLRk+8G368p/VeK/2ZRhL
 rEe4Mu1nBSJknZeEsWosiAp8pXkrsdXmukZjSWhws5EEUBeixfOUAzNC8S3i8VuBzmVQ
 mI+A==
X-Gm-Message-State: ACrzQf29DaHT4s8/MUbQdAoZJ3bSXD+b18OBhTdhu8TPcnUQ0DVT9jy0
 BNXy3m6+JpEsES+ZRH3kq5x5K7n6VyIKdm8JkDetow==
X-Google-Smtp-Source: AMsMyM7wJ1CjDy1uo28Cq+7fc7qkrSMtXjul2vWncBmw/XrFOfxAvAKrbpIhjT0LJgDsFIw328yn+2TOFJu3bRs5xe4=
X-Received: by 2002:a05:651c:1508:b0:26c:622e:abe1 with SMTP id
 e8-20020a05651c150800b0026c622eabe1mr3040402ljf.228.1663946450628; Fri, 23
 Sep 2022 08:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <84e81d21-c800-4fd5-ad7c-f20bcdd7508b@www.fastmail.com>
In-Reply-To: <84e81d21-c800-4fd5-ad7c-f20bcdd7508b@www.fastmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 23 Sep 2022 16:20:13 +0100
Message-ID: <CA+EHjTzt6grmRx59ziG6LHWBsE598dxiOYqqRM4cKvpF3ujqHg@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: Andy Lutomirski <luto@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, 
 Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, Linux API <linux-api@vger.kernel.org>, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, 
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

<...>

> > Regarding pKVM's use case, with the shim approach I believe this can be=
 done by
> > allowing userspace mmap() the "hidden" memfd, but with a ton of restric=
tions
> > piled on top.
> >
> > My first thought was to make the uAPI a set of KVM ioctls so that KVM
> > could tightly
> > tightly control usage without taking on too much complexity in the
> > kernel, but
> > working through things, routing the behavior through the shim itself
> > might not be
> > all that horrific.
> >
> > IIRC, we discarded the idea of allowing userspace to map the "private"
> > fd because
> > things got too complex, but with the shim it doesn't seem _that_ bad.
>
> What's the exact use case?  Is it just to pre-populate the memory?

Prepopulate memory and access memory that could go back and forth from
being shared to being private.

Cheers,
/fuad



> >
> > E.g. on the memfd side:
> >
> >   1. The entire memfd must be mapped, and at most one mapping is allowe=
d, i.e.
> >      mapping is all or nothing.
> >
> >   2. Acquiring a reference via get_pfn() is disallowed if there's a map=
ping for
> >      the restricted memfd.
> >
> >   3. Add notifier hooks to allow downstream users to further restrict t=
hings.
> >
> >   4. Disallow splitting VMAs, e.g. to force userspace to munmap() every=
thing in
> >      one shot.
> >
> >   5. Require that there are no outstanding references at munmap().  Or =
if this
> >      can't be guaranteed by userspace, maybe add some way for userspace=
 to wait
> >      until it's ok to convert to private?  E.g. so that get_pfn() doesn=
't need
> >      to do an expensive check every time.
>
> Hmm.  I haven't looked at the code to see if this would really work, but =
I think this could be done more in line with how the rest of the kernel wor=
ks by using the rmap infrastructure.  When the pKVM memfd is in not-yet-pri=
vate mode, just let it be mmapped as usual (but don't allow any form of GUP=
 or pinning).  Then have an ioctl to switch to to shared mode that takes lo=
cks or sets flags so that no new faults can be serviced and does unmap_mapp=
ing_range.
>
> As long as the shim arranges to have its own vm_ops, I don't immediately =
see any reason this can't work.

