Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E5458149
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 01:07:47 +0100 (CET)
Received: from localhost ([::1]:53920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moaOY-0000aG-6R
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 19:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1moaMK-0008Eq-Hm
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 19:05:28 -0500
Received: from [2607:f8b0:4864:20::72b] (port=42720
 helo=mail-qk1-x72b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1moaMI-00050z-2i
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 19:05:28 -0500
Received: by mail-qk1-x72b.google.com with SMTP id g28so14112134qkk.9
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 16:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6kf0/w3Hs1LmxnVhawaFCuKI3Bol3tZdSQQzWs8byfA=;
 b=Eu9tUAhvgTI39XRCgxe+Jp08cFeT8T3hFyVYcEyCfpJZ/9//e91DHQodhxUFFVeKX3
 EAh2D7HiMmk/XJO8/23Bwbc2IMWKufpGX3TuMxYxmYEBo3fxYPh4XbxA3/yi35ppr7UR
 MeW0iep4uj/s+PfeXw4Oi6o9pzpyPILyXGe9p3fMK7gVYs3IQsE07bDSYmKDvRU31xsH
 I9AszubKwbiVvIidR65oTOi4Jwh4aBuq0HiZv70UZ/E+uUKx+HexzvVkG7BbnnMUW75G
 kisyixitbh8q4pERKXhJRTrw/dKmm5p2xbgLCDLTGzMursE/1dxcHdo5PSugqhx71NsJ
 U6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6kf0/w3Hs1LmxnVhawaFCuKI3Bol3tZdSQQzWs8byfA=;
 b=wQjemJmEzgHnATG8D8JVHKqvOLrf8jncEWKyChDokgmcSOuuYqzO324eKAoBBiJQtZ
 bxy1OVAX0f1T2a5mQ3sU6VOyDb/wxCs7a0VRB13OhJuOYVTlNIMf/xDaOONk9z9rLvwk
 xd0rYsJaRL5/ec7ts/dPdAUNNzVI7QnVzx8NO6xaHwO55to83CMJQdr8HqBXjr5/FAjp
 V8/U6EKpqpDpo2K4dSS04bRlp6+CIAjizyv3yl/exyBmGTAX0DN7+C4jwxTuNDUkwy5W
 ciOjA+BZD31IrKXQVG1zfvUTXyEgbgob3UeuOFK9aa1V+H/ZFhvPU5LuKeUkpvbqaNr5
 auMg==
X-Gm-Message-State: AOAM531ld7Uc8xdxGaW7lPb291qfW+foiSEO0wJnOl+ccfGwIFs6kjEV
 +H987JL8Kizt+LRKaKMJLaa7VQ==
X-Google-Smtp-Source: ABdhPJzZj9ReBVUwh/WgmkPvKfwGr6/EBPjNWPCz36F6uolqc0T3L8/Tzkwwaj4TEzJoCDzGgJ3vxw==
X-Received: by 2002:a05:620a:1029:: with SMTP id
 a9mr37789932qkk.186.1637453124120; 
 Sat, 20 Nov 2021 16:05:24 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id a16sm2114487qta.94.2021.11.20.16.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 16:05:23 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1moaME-00DLbk-EV; Sat, 20 Nov 2021 20:05:22 -0400
Date: Sat, 20 Nov 2021 20:05:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211121000522.GP876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <YZf4aAlbyeWw8wUk@google.com> <20211119194746.GM876299@ziepe.ca>
 <YZgjc5x6FeBxOqbD@google.com> <20211119233312.GO876299@ziepe.ca>
 <YZhOBD6vlkBEyq8t@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZhOBD6vlkBEyq8t@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b; envelope-from=jgg@ziepe.ca;
 helo=mail-qk1-x72b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 20, 2021 at 01:23:16AM +0000, Sean Christopherson wrote:
> On Fri, Nov 19, 2021, Jason Gunthorpe wrote:
> > On Fri, Nov 19, 2021 at 10:21:39PM +0000, Sean Christopherson wrote:
> > > On Fri, Nov 19, 2021, Jason Gunthorpe wrote:
> > > > On Fri, Nov 19, 2021 at 07:18:00PM +0000, Sean Christopherson wrote:
> > > > > No ideas for the kernel API, but that's also less concerning since
> > > > > it's not set in stone.  I'm also not sure that dedicated APIs for
> > > > > each high-ish level use case would be a bad thing, as the semantics
> > > > > are unlikely to be different to some extent.  E.g. for the KVM use
> > > > > case, there can be at most one guest associated with the fd, but
> > > > > there can be any number of VFIO devices attached to the fd.
> > > > 
> > > > Even the kvm thing is not a hard restriction when you take away
> > > > confidential compute.
> > > > 
> > > > Why can't we have multiple KVMs linked to the same FD if the memory
> > > > isn't encrypted? Sure it isn't actually useful but it should work
> > > > fine.
> > > 
> > > Hmm, true, but I want the KVM semantics to be 1:1 even if memory
> > > isn't encrypted.
> > 
> > That is policy and it doesn't belong hardwired into the kernel.
> 
> Agreed.  I had a blurb typed up about that policy just being an "exclusive" flag
> in the kernel API that KVM would set when creating a confidential
> VM,

I still think that is policy in the kernel, what is wrong with
userspace doing it?

> > Your explanation makes me think that the F_SEAL_XX isn't defined
> > properly. It should be a userspace trap door to prevent any new
> > external accesses, including establishing new kvms, iommu's, rdmas,
> > mmaps, read/write, etc.
> 
> Hmm, the way I was thinking of it is that it the F_SEAL_XX itself would prevent
> mapping/accessing it from userspace, and that any policy beyond that would be
> done via kernel APIs and thus handled by whatever in-kernel agent can access the
> memory.  E.g. in the confidential VM case, without support for trusted devices,
> KVM would require that it be the sole owner of the file.

And how would kvm know if there is support for trusted devices?
Again seems like policy choices that should be left in userspace.

Especially for what could be a general in-kernel mechanism with many
users and not tightly linked to KVM as imagined here.

Jason

