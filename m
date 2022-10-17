Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFDE600C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:38:59 +0200 (CEST)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNWM-0003o9-UT
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1okNPb-0005kO-Ph
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:32:19 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1okNPZ-0004Vr-Tt
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:31:59 -0400
Received: by mail-lf1-x135.google.com with SMTP id g1so16781380lfu.12
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5nozSFDmTVpu8GTMuUa17TgcVMpawH1V5x78PIRZetg=;
 b=SDSplUZ2VPkr2D1rPark9w6rINsj4QsGj8mIaHHj3cG7qqYj2xeg5bRcHWiAiCGNxn
 GsUn6i3U2OjLAFYiVGFUliiR7Eg727DK3wDSXfnbZMZbfbIZ31+HdQCxkX49ygkx2h2T
 JvvJpr3zkIRAU4V1EE328YM6hb7KitEqUGTlUdtUSKdTXZdHKruA7oQebxjBvB7yCdng
 14amkvXgB/TlF3oG6EUoWuZ8TnSYQkSfag7jNPXgHEtx3NHXccP4GhcHXIeI1JTCLuLR
 Ff1yL/Q300jH2Amjcw85DuxVyH90T6VnZoMTJKObTmi2YSvh5JYckhqKh2RO00z96P+I
 iG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nozSFDmTVpu8GTMuUa17TgcVMpawH1V5x78PIRZetg=;
 b=FoMS4h9U+nbdL/kdTPFeTPI11enWJic6pIe6n2AqtBz9heNs66YXdtKzm+esP32yhf
 zBH68PA8jt8XPw4XuEXTEEUMT4v0VSDPpmsUfqB/4CLC2qHTFnTvSY1pkErLkJA5Vge/
 2xE5nv43thUB8RfwJ72cx8+ZLVDhTAd32cKk1xxqNA6G0dAZULaLf/BXB6H5jB8sLDfR
 savhND91E1bnpzy+GjMbahSwfyO18tLnIwwN5nS3D31t/3Pd5CTmUHWX7kudbBH15cFi
 3G1YZZm7X/RRjmYComK5wC69UbD6LkjFUdoGYarcqPc1BBF6fV6RiB8AIk8HBPK7/VE+
 4H4A==
X-Gm-Message-State: ACrzQf3vxlGxzgybKmayZaDh5V436oXBjPF5sdUZV/uW7lIq0n6u6tc/
 KVxqzbWjvTA2QhM59bTmxrZXnhUr1TdHNTHs3m6N8w==
X-Google-Smtp-Source: AMsMyM5QQdeoCZqf4USHrTYZuLKFaoT483vufBzxBArWmR3pEEZFNUg/KtF5cabXdDzXtcRyF9bfuHIHJTBpaJKALKA=
X-Received: by 2002:a05:6512:4cb:b0:4a2:25b6:9e73 with SMTP id
 w11-20020a05651204cb00b004a225b69e73mr3967251lfq.30.1666002715568; Mon, 17
 Oct 2022 03:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
 <20221013133457.GA3263142@chaop.bj.intel.com>
In-Reply-To: <20221013133457.GA3263142@chaop.bj.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Oct 2022 11:31:19 +0100
Message-ID: <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=tabba@google.com; helo=mail-lf1-x135.google.com
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

> >
> > Actually, for pKVM, there is no need for the guest memory to be
> > GUP'able at all if we use the new inaccessible_get_pfn().
>
> If pKVM can use inaccessible_get_pfn() to get pfn and can avoid GUP (I
> think that is the major concern?), do you see any other gap from
> existing API?

Actually for this part no, there aren't any gaps and
inaccessible_get_pfn() is sufficient.

> > This of
> > course goes back to what I'd mentioned before in v7; it seems that
> > representing the memslot memory as a file descriptor should be
> > orthogonal to whether the memory is shared or private, rather than a
> > private_fd for private memory and the userspace_addr for shared
> > memory. The host can then map or unmap the shared/private memory using
> > the fd, which allows it more freedom in even choosing to unmap shared
> > memory when not needed, for example.
>
> Using both private_fd and userspace_addr is only needed in TDX and other
> confidential computing scenarios, pKVM may only use private_fd if the fd
> can also be mmaped as a whole to userspace as Sean suggested.

That does work in practice, for now at least, and is what I do in my
current port. However, the naming and how the API is defined as
implied by the name and the documentation. By calling the field
private_fd, it does imply that it should not be mapped, which is also
what api.rst says in PATCH v8 5/8. My worry is that in that case pKVM
would be mis/ab-using this interface, and that future changes could
cause unforeseen issues for pKVM.

Maybe renaming this to something like "guest_fp", and specifying in
the documentation that it can be restricted, e.g., instead of "the
content of the private memory is invisible to userspace" something
along the lines of  "the content of the guest memory may be restricted
to userspace".

What do you think?

Cheers,
/fuad

>
> Thanks,
> Chao
> >
> > Cheers,
> > /fuad

