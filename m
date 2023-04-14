Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DA6E2B85
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 23:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnQeZ-0006aO-8F; Fri, 14 Apr 2023 17:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3usA5ZAYKCks5rn0wpt11tyr.p1z3rz7-qr8ry010t07.14t@flex--seanjc.bounces.google.com>)
 id 1pnQeV-0006aD-6D
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:08:15 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3usA5ZAYKCks5rn0wpt11tyr.p1z3rz7-qr8ry010t07.14t@flex--seanjc.bounces.google.com>)
 id 1pnQeT-0001Li-5h
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:08:14 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 o9-20020a170902d4c900b001a2bef29d53so19150521plg.7
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681506490; x=1684098490;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=b7Jr+FjVXuQEnXDMlE3gznMa+dmQespZNtp7nLwMnLo=;
 b=Z5HvJTutAVSami8OKTwQ0L/Tb2qB7TzKRMxFI28D2AJ1QCpuyyvVHOIi9Fb3XHR9ej
 LUNfDfNV6JeVjW3E90abkAcvZRFvh1n+aONtio3M8f0noPTpRbjMmxowI+9sS4Xq8hOM
 Sf8ikJlSVrVt4ndDSkdOQC01mNz5LJQqb5MN5v49d2Xg9pi+/EcTwfMmakOAtcymdSPB
 3uhaOLkyYQ+M+WsF5l8y2hIZEq9pNWsbaA7iwUmYpJ328Zz4BxjSvHOlfXGK+mUVM1vi
 r2OSTO5kfzooBMyGZCEiZPK8V4lIN0PFu5BvTJM4WCQKYevPaAgKuJZuB8K2huoAWqrx
 vn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681506490; x=1684098490;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7Jr+FjVXuQEnXDMlE3gznMa+dmQespZNtp7nLwMnLo=;
 b=HOxDld4BSa0+LxURMSUcLpNkw3MdQAvfjklykJ/z3G565cAhzONb9h3XNExbKAeMAI
 ULA+27ZxXKFE6vcgTSNHSaC9Q4tc0akd3SlW69rOXIIn319g4L8fpCFcqju03FibVJkE
 oIberGwwNVMIVnJ19rG7LV6Ydp7wX7eDGjw9xOXA7yr4nGss4rUFxDTnAeVUKCVvXSlO
 5hvJ1oqwOk7PtbD0XNe5xH/2mbeP5+UCWPl193kYbOS2AVZ8zCC8/Ze0VYYUJMzR+b2o
 Pe4V9/B9u1GYPerP0u2lmAB9zGm+xDC8D1hUE7svbhqL8Qwhgy5dDbN9YuBSvSqBsi/o
 dmMA==
X-Gm-Message-State: AAQBX9faK59bxK4xPRp7xX1bWKAY5SLEV1PnNOT866DENTMC9l9aeLhJ
 b4jT/Sm+gFYKwrg3QmaSz0mxUNGvV7g=
X-Google-Smtp-Source: AKy350bBbN9SHkQpgaNZinbD0G0RBAygFGxlP9+ytFbgc7OhIviX9khLc+w+xI6iW/tqbkBNGnqofgsbIU0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:58a:0:b0:513:57ce:d61c with SMTP id
 132-20020a63058a000000b0051357ced61cmr1120918pgf.7.1681506490508; Fri, 14 Apr
 2023 14:08:10 -0700 (PDT)
Date: Fri, 14 Apr 2023 14:08:08 -0700
In-Reply-To: <20230328104108.GB2909606@chaop.bj.intel.com>
Mime-Version: 1.0
References: <20230128140030.GB700688@chaop.bj.intel.com>
 <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
 <20230308074026.GA2183207@chaop.bj.intel.com>
 <20230323004131.GA214881@ls.amr.corp.intel.com>
 <20230324021029.GA2774613@chaop.bj.intel.com>
 <6cf365a3-dddc-8b74-4d74-04666fbeb53d@intel.com>
 <20230328104108.GB2909606@chaop.bj.intel.com>
Message-ID: <ZDnAuGKrCO2wgjlG@google.com>
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, 
 Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3usA5ZAYKCks5rn0wpt11tyr.p1z3rz7-qr8ry010t07.14t@flex--seanjc.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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

On Tue, Mar 28, 2023, Chao Peng wrote:
> On Fri, Mar 24, 2023 at 10:29:25AM +0800, Xiaoyao Li wrote:
> > On 3/24/2023 10:10 AM, Chao Peng wrote:
> > > On Wed, Mar 22, 2023 at 05:41:31PM -0700, Isaku Yamahata wrote:
> > > > On Wed, Mar 08, 2023 at 03:40:26PM +0800,
> > > > Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > > > 
> > > > > On Wed, Mar 08, 2023 at 12:13:24AM +0000, Ackerley Tng wrote:
> > > > > > Chao Peng <chao.p.peng@linux.intel.com> writes:
> > > > > > 
> > > > > > > On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
> > > > > > > > On Fri, Dec 02, 2022, Chao Peng wrote:
> > > > > > > +static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
> > > > > > > +{
> > > > > > > +	if (!offset)
> > > > > > > +		return true;
> > > > > > > +	if (!gpa)
> > > > > > > +		return false;
> > > > > > > +
> > > > > > > +	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
> > > > 
> > > > This check doesn't work expected. For example, offset = 2GB, gpa=4GB
> > > > this check fails.
> > > 
> > > This case is expected to fail as Sean initially suggested[*]:
> > >    I would rather reject memslot if the gfn has lesser alignment than
> > >    the offset. I'm totally ok with this approach _if_ there's a use case.
> > >    Until such a use case presents itself, I would rather be conservative
> > >    from a uAPI perspective.
> > > 
> > > I understand that we put tighter restriction on this but if you see such
> > > restriction is really a big issue for real usage, instead of a
> > > theoretical problem, then we can loosen the check here. But at that time
> > > below code is kind of x86 specific and may need improve.
> > > 
> > > BTW, in latest code, I replaced count_trailing_zeros() with fls64():
> > >    return !!(fls64(offset) >= fls64(gpa));
> > 
> > wouldn't it be !!(ffs64(offset) <= ffs64(gpa)) ?
> 
> As the function document explains, here we want to return true when
> ALIGNMENT(offset) >= ALIGNMENT(gpa), so '>=' is what we need.
> 
> It's worthy clarifying that in Sean's original suggestion he actually
> mentioned the opposite. He said 'reject memslot if the gfn has lesser
> alignment than the offset', but I wonder this is his purpose, since
> if ALIGNMENT(offset) < ALIGNMENT(gpa), we wouldn't be possible to map
> the page as largepage. Consider we have below config:
> 
>   gpa=2M, offset=1M
> 
> In this case KVM tries to map gpa at 2M as 2M hugepage but the physical
> page at the offset(1M) in private_fd cannot provide the 2M page due to
> misalignment.
> 
> But as we discussed in the off-list thread, here we do find a real use
> case indicating this check is too strict. i.e. QEMU immediately fails
> when launch a guest > 2G memory. For this case QEMU splits guest memory
> space into two slots:
> 
>   Slot#1(ram_below_4G): gpa=0x0, offset=0x0, size=2G
>   Slot#2(ram_above_4G): gpa=4G,  offset=2G,  size=totalsize-2G
> 
> This strict alignment check fails for slot#2 because offset(2G) has less
> alignment than gpa(4G). To allow this, one solution can revert to my
> previous change in kvm_alloc_memslot_metadata() to disallow hugepage
> only when the offset/gpa are not aligned to related page size.
> 
> Sean, How do you think?

I agree, a pure alignment check is too restrictive, and not really what I intended
despite past me literally saying that's what I wanted :-)  I think I may have also
inverted the "less alignment" statement, but luckily I believe that ends up being
a moot point.

The goal is to avoid having to juggle scenarios where KVM wants to create a hugepage,
but restrictedmem can't provide one because of a misaligned file offset.  I think
the rule we want is that the offset must be aligned to the largest page size allowed
by the memslot _size_.  E.g. on x86, if the memslot size is >=1GiB then the offset
must be 1GiB or beter, ditto for >=2MiB and >=4KiB (ignoring that 4KiB is already a
requirement).

We could loosen that to say the largest size allowed by the memslot, but I don't
think that's worth the effort unless it's trivially easy to implement in code,
e.g. KVM could technically allow a 4KiB aligned offset if the memslot is 2MiB
sized but only 4KiB aligned on the GPA.  I doubt there's a real use case for such
a memslot, so I want to disallow that unless it's super easy to implement.

