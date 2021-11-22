Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492445911C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:15:44 +0100 (CET)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpB2l-0004xQ-6t
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mpAxE-000094-NJ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:10:00 -0500
Received: from [2607:f8b0:4864:20::831] (port=40764
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mpAxC-0001KX-IA
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:10:00 -0500
Received: by mail-qt1-x831.google.com with SMTP id t34so16763400qtc.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5VTof+3edSRysBWJfMrn+QjeSl3KM16l29/PC/dx3o4=;
 b=GgW+p5PeHc0bQly0v21nzAJ3y6uv9j+6GJjj3/kSRMtOhXgQUdo630hHq9WFNfMw3+
 7jwm/pEg3OMqP3OSiHN9g6X2ApOK6D6i97qPCojv4hHg6bX3hTJX1VRV9wv9AJivwnTz
 NMbrhhMDJdFriocGD9Q87qSC2eg3XWgnsBQvzED4l/rtGH5c3J9RkR24eZLMQVocatzk
 16fEwCdt4zSVbLzcMUR1znohS2vSzntWqte0ryaXUwXGyQptkpXIcQYp/zc6kdLcBhqC
 Cg6yB3MWTxm24NNgtuPBXuKgfkuCI4/QoYWo4AoHhvWYPVXt8w84jQYnFFi6M8A4ngDL
 vRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5VTof+3edSRysBWJfMrn+QjeSl3KM16l29/PC/dx3o4=;
 b=mBZ93B1LVAO+Z4ETCf3pAFmkIfSFcsHMun0q4p4hBFc3FacVj/Saadfk7X2GNkNrI/
 Ia9GuvW750z7CpQyqIwkrdKN+I7m12uyorN8NiMhAL6JxRKFXjCu3IXjA1AusQJHee68
 K5fZViEsTM9NrOD/UbBuvnX5C4NsClF21N4uHJbzmvCCq6HmwJMMGXjbEHe8+V8BJGsZ
 WRyNmYZYbWXCjV+EuuOxlcgHVzf92zNlJcvn2wCI6OZDblK9Ye8n9k+hdTy6TLqojLsM
 t80g0/eAm/hYLMw8wsPI2Qhdd8i5S8+qoEGQLSXB0UhAnhTnrWH9DMl9zn4BaDMQuev8
 C8Qg==
X-Gm-Message-State: AOAM530xFJ2hnM3sQORyeuCxitnsiJwJFwBFXpi3VhwJ8Ljid6e+sS3l
 76df4Cd4fkVInJEQRRyM2cB/Dg==
X-Google-Smtp-Source: ABdhPJyRLMA8XcwBk54ljNUHf6oDk+V6lmAhSa4hBpytn+jTTywY+jUzb27EMb9+9wB5t9Defs2Bqw==
X-Received: by 2002:a05:622a:189:: with SMTP id
 s9mr31877263qtw.352.1637593797445; 
 Mon, 22 Nov 2021 07:09:57 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id b9sm4563076qtb.53.2021.11.22.07.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 07:09:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mpAxA-00DtLu-8c; Mon, 22 Nov 2021 11:09:56 -0400
Date: Mon, 22 Nov 2021 11:09:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211122150956.GS876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
 <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
 <20211122133145.GQ876299@ziepe.ca>
 <56c0dffc-5fc4-c337-3e85-a5c9ce619140@redhat.com>
 <20211122140148.GR876299@ziepe.ca>
 <d2b46b84-8930-4304-2946-4d4a16698b24@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2b46b84-8930-4304-2946-4d4a16698b24@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-x831.google.com
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

On Mon, Nov 22, 2021 at 03:57:17PM +0100, David Hildenbrand wrote:
> On 22.11.21 15:01, Jason Gunthorpe wrote:
> > On Mon, Nov 22, 2021 at 02:35:49PM +0100, David Hildenbrand wrote:
> >> On 22.11.21 14:31, Jason Gunthorpe wrote:
> >>> On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:
> >>>
> >>>> I do wonder if we want to support sharing such memfds between processes
> >>>> in all cases ... we most certainly don't want to be able to share
> >>>> encrypted memory between VMs (I heard that the kernel has to forbid
> >>>> that). It would make sense in the use case you describe, though.
> >>>
> >>> If there is a F_SEAL_XX that blocks every kind of new access, who
> >>> cares if userspace passes the FD around or not?
> >> I was imagining that you actually would want to do some kind of "change
> >> ownership". But yeah, the intended semantics and all use cases we have
> >> in mind are not fully clear to me yet. If it's really "no new access"
> >> (side note: is "access" the right word?) then sure, we can pass the fd
> >> around.
> > 
> > What is "ownership" in a world with kvm and iommu are reading pages
> > out of the same fd?
> 
> In the world of encrypted memory / TDX, KVM somewhat "owns" that memory
> IMHO (for example, only it can migrate or swap out these pages; it's
> might be debatable if the TDX module or KVM actually "own" these pages ).

Sounds like it is a swap provider more than an owner?

Jason

