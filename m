Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D60458FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:07:33 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9ym-0004Ft-PB
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mp9tJ-0000V8-UM
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:01:54 -0500
Received: from [2607:f8b0:4864:20::733] (port=42920
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mp9tH-00069s-U3
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:01:53 -0500
Received: by mail-qk1-x733.google.com with SMTP id g28so18138190qkk.9
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AkVa9dgYFMW65oNWi3lEAnC5wvNaUzrKbDuhcPjVyAM=;
 b=YbZPXtBUsIP409q2mT8lSr4BqkVNQQ7uwSh3flKk8k1tLdFvFH+qBcjZfbEQuRnSJt
 ym7KIc8Rr2qe7cnTl58XYSE6lugUqTMCIbLTauRHYkZqs9rs3GKm1bMlBUWI+TRMcDGX
 I0UZlTo4cd8ySiP1lEYqugVzwPTPEfPtKNmmPzejl2rh3HDr1pH7Jp2W80NczxtpUT2f
 7DZmFWyXm06nxDnZOIMEP5lLL2tkQARwppJwaeUpCzINEB5Wi61hhIuu1iPds6HyRHDs
 CkaIWL9eMwFvW3dqc9J2iSLvyxaUEjT+FHbVEY0VTDVLySkuR3731mB61RPDNMhCVl2Y
 9yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AkVa9dgYFMW65oNWi3lEAnC5wvNaUzrKbDuhcPjVyAM=;
 b=ToFSez9Aj6eDjygUUodquiPmldcjWe8BAGRpWQihiInNuEMHUYV/8DFlpY0b2pSPNA
 5BMsAFCAtsNZYPHHqoKYdwcpPyjl+kfMmhbq77lDH/UkU2sKIUTPvQS87I7jTXQYkcMx
 iyL94KN/a3hfVh8eCYlUa4/74hSVaxcM0YBrznea5O29k19zKaWYJ3NC1oexLIJeMKuS
 v5JNLrC4gEAsf9CZJJN4qwitBYhO79hIeFeYlwkMvWu+b2zfrAYCCR3ydigAxO1Iijnz
 3Pm2yc5w/qf5sC9K07ohmUE8KI/dTS6RSUU32P4psucQET2OLI5Wy/kq32tU00KChyRo
 OJeQ==
X-Gm-Message-State: AOAM530zO8jsgx7N7gs1se1yVm92kmkHFUhGQasjH4RD56Mu7DAPqezr
 pFM6b5G4MAGAVKZba2uubgXj/Q==
X-Google-Smtp-Source: ABdhPJx4FBEsFukDClDSwGw8qd9OgvbrBef1ytO7EqEtX4yVEQkSoyHCZqYrRFEAi40duExffLYOuw==
X-Received: by 2002:a05:620a:190b:: with SMTP id
 bj11mr47809423qkb.514.1637589709646; 
 Mon, 22 Nov 2021 06:01:49 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id s13sm4716120qki.23.2021.11.22.06.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 06:01:49 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mp9tE-00DsN8-Ie; Mon, 22 Nov 2021 10:01:48 -0400
Date: Mon, 22 Nov 2021 10:01:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211122140148.GR876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
 <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
 <20211122133145.GQ876299@ziepe.ca>
 <56c0dffc-5fc4-c337-3e85-a5c9ce619140@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56c0dffc-5fc4-c337-3e85-a5c9ce619140@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733; envelope-from=jgg@ziepe.ca;
 helo=mail-qk1-x733.google.com
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
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 02:35:49PM +0100, David Hildenbrand wrote:
> On 22.11.21 14:31, Jason Gunthorpe wrote:
> > On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:
> > 
> >> I do wonder if we want to support sharing such memfds between processes
> >> in all cases ... we most certainly don't want to be able to share
> >> encrypted memory between VMs (I heard that the kernel has to forbid
> >> that). It would make sense in the use case you describe, though.
> > 
> > If there is a F_SEAL_XX that blocks every kind of new access, who
> > cares if userspace passes the FD around or not?
> I was imagining that you actually would want to do some kind of "change
> ownership". But yeah, the intended semantics and all use cases we have
> in mind are not fully clear to me yet. If it's really "no new access"
> (side note: is "access" the right word?) then sure, we can pass the fd
> around.

What is "ownership" in a world with kvm and iommu are reading pages
out of the same fd?

"no new access" makes sense to me, we have access through
read/write/mmap/splice/etc and access to pages through the private in
kernel interface (kvm, iommu)

Jason

