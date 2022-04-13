Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8D4FFD2D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 19:55:46 +0200 (CEST)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nehDU-0004SV-GK
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 13:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1nehA5-0003g2-Td
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 13:52:13 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1nehA4-0007qo-55
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 13:52:13 -0400
Received: by mail-qt1-x829.google.com with SMTP id z14so1920095qto.5
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AOcfAyqGgzTsDLYWZNFvb/pt3FEBh03V8FeUjVfINLs=;
 b=Bossa6GEY7VuCphnLPZuOzJUtcvFY0Xkwv27PVSBfCC/FdX4k2U/R/8tc3e6/TDG9b
 w/9uAgh8u82TWvzqs9/oqezRfVKYTJcg88jPsDyVpjn5i6qVesFEQ/DApakc869u+5lk
 GwUeq/iRHuUUSbU5VPjF+x+Nxyo3LcL64cerGvihnoxpTS7x163MByH0tjIdn6VLh7j0
 ORezJT/JFq5so7GsIh61VtI+O3VpLisBAYp/sU9dzGHFPjvZ0UPJeFpJ9W27eu7ET5GJ
 cvhFhPAZ1ZOsHSur//jxKwQ6gDdtJtdM7gcJ7fyJKGc6kOw1FZQe9pd2KDaJak2ceHpG
 PJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AOcfAyqGgzTsDLYWZNFvb/pt3FEBh03V8FeUjVfINLs=;
 b=RtHjJqvXx45TXQRQXFnuLg1UU44UDV7PkRqYw7s0Hwi4EfA9Ue777GSJW/VKpic7o2
 ZWLj3Vx+vZDadzwmbaV/Odxc29pt/3jN9ZherS18VjXYWOyk1SGCGnsik/Jvzv4XVRcH
 eUXir9wjnyKniu9L1HezSuoEes55yQLC1uBJGubgFUxe0TIzZCBaxZqxlrs6EjwfUwRh
 zrefyvFwlAvcSca2T+8pXj8iLKOYkSuQo3XlYIKR8kqNnewh4a+EATCFkhxItNrAj9PC
 8V/Rxr3/h/IujkPIY9kErW0m0TrwbwqmM4KopU9whaIKrtafsIlAYVUnua6ojFo2jPGC
 LCmg==
X-Gm-Message-State: AOAM530DBqnODJm/ZNOzd2K4R1Oir/6qpUBU88iMedEWAQLMgOLd2Nhs
 uHtsadRJOuH6L+DKWATxTf73bQ==
X-Google-Smtp-Source: ABdhPJyFh5b43Bp+tYjO2fJUecpGRbFTQokPtotFsAvgNZxKoFX6OH3MdddD7y2rpYU6hDl31dtUUQ==
X-Received: by 2002:a05:622a:1392:b0:2e1:e7b9:3ce4 with SMTP id
 o18-20020a05622a139200b002e1e7b93ce4mr7976945qtk.153.1649872330523; 
 Wed, 13 Apr 2022 10:52:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05620a424a00b00680c0c0312dsm23050212qko.30.2022.04.13.10.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 10:52:09 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nehA0-001kWp-5D; Wed, 13 Apr 2022 14:52:08 -0300
Date: Wed, 13 Apr 2022 14:52:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220413175208.GI64706@ziepe.ca>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
 <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
 <20220412143636.GG64706@ziepe.ca>
 <1686fd2d-d9c3-ec12-32df-8c4c5ae26b08@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1686fd2d-d9c3-ec12-32df-8c4c5ae26b08@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::829; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, kvm list <kvm@vger.kernel.org>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 06:24:56PM +0200, David Hildenbrand wrote:
> On 12.04.22 16:36, Jason Gunthorpe wrote:
> > On Fri, Apr 08, 2022 at 08:54:02PM +0200, David Hildenbrand wrote:
> > 
> >> RLIMIT_MEMLOCK was the obvious candidate, but as we discovered int he
> >> past already with secretmem, it's not 100% that good of a fit (unmovable
> >> is worth than mlocked). But it gets the job done for now at least.
> > 
> > No, it doesn't. There are too many different interpretations how
> > MELOCK is supposed to work
> > 
> > eg VFIO accounts per-process so hostile users can just fork to go past
> > it.
> > 
> > RDMA is per-process but uses a different counter, so you can double up
> > 
> > iouring is per-user and users a 3rd counter, so it can triple up on
> > the above two
> 
> Thanks for that summary, very helpful.

I kicked off a big discussion when I suggested to change vfio to use
the same as io_uring

We may still end up trying it, but the major concern is that libvirt
sets the RLIMIT_MEMLOCK and if we touch anything here - including
fixing RDMA, or anything really, it becomes a uAPI break for libvirt..

> >> So I'm open for alternative to limit the amount of unmovable memory we
> >> might allocate for user space, and then we could convert seretmem as well.
> > 
> > I think it has to be cgroup based considering where we are now :\
> 
> Most probably. I think the important lessons we learned are that
> 
> * mlocked != unmovable.
> * RLIMIT_MEMLOCK should most probably never have been abused for
>   unmovable memory (especially, long-term pinning)

The trouble is I'm not sure how anything can correctly/meaningfully
set a limit.

Consider qemu where we might have 3 different things all pinning the
same page (rdma, iouring, vfio) - should the cgroup give 3x the limit?
What use is that really?

IMHO there are only two meaningful scenarios - either you are unpriv
and limited to a very small number for your user/cgroup - or you are
priv and you can do whatever you want.

The idea we can fine tune this to exactly the right amount for a
workload does not seem realistic and ends up exporting internal kernel
decisions into a uAPI..

Jason

