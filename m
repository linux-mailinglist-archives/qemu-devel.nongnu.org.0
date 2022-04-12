Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137AC4FE403
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 16:41:19 +0200 (CEST)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neHhl-0006hb-Iy
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 10:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1neHdL-0003j3-SV
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:36:44 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1neHdJ-0004XC-V2
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:36:43 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bk12so13840144qkb.7
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=evNj2CNMoMsw5e7L6RfPQYGJFzo3TZYC7FsieHWZ5Ls=;
 b=P4KDTA4ChNl8eFo5TaRAl/5FnI/hVHjJzJBo1xbfO6E6tcQCaqBfnBN1z5fv3DfE1u
 iQILgHtSz7DDusNSlvJP3Z1yMP4+yKAQ2Eyz628hQVcLvQ+BxsdlwhsUbE6fvWB/Q2is
 KJFMZcpNQuQ1kXRm/7dZww/aXDBDg6Qg87XJBXqMNal9QHP5YcfHOuo4039oAPwifclm
 Ni6jxAqEXJAsTg1vDWd5O4322/PPXZOhWqI7cTTZAicevA8+5AkWYEBaFSAdm27ELa3S
 niv0qlWzCgCFeZ31VkUUBPNxRCHtURSjk4RK/eF6eqwh/psh+4pwILguC3l2W1BosUlI
 tCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=evNj2CNMoMsw5e7L6RfPQYGJFzo3TZYC7FsieHWZ5Ls=;
 b=rHBFjsTl40HVzVSO/UjC1+4dyNvXX6XwRz9qxvLVDuUpH3AtZEa2sbSKyy+kATWR8b
 qucbF5ZFyn0TRCzjcwVHdmoYVY6mL2qedFUK3oi4iP/cnhaqotab3DC8Fb1V6kp8Mpgq
 HARLKrJ6Yc/LtR9a7j0tBlJkk/p/EI0hhNjgVXpCNoL/5xSQB7D84IoRBlc5VJ10ZXas
 nII5+D7HKJd+XUlApvUf4s4BGSwstBW/3sxR2YfPWv7WTGSQpT+XMXK9OqWzHG9tSxxZ
 RY2h20eWccUxj62o1Bo490vJlGhTMoG9FPp9YYvfon7dktkInLIvk8e1xuPLLfnJjU+W
 qEyQ==
X-Gm-Message-State: AOAM530M0FhRotKJIb7FRCM789arIFqD6du1BQjkIE6/2nuKBX8R7WYP
 pPANAxmAqxrfsJF2467RDjl5LQ==
X-Google-Smtp-Source: ABdhPJySHPHmQqifS2wea+F5V8gixdYIV//Jv7wOTevmOQGVNlVLMxWAFhJpJjukoZ7Xd9/fbgNIYA==
X-Received: by 2002:a37:990:0:b0:69a:976:be4e with SMTP id
 138-20020a370990000000b0069a0976be4emr3264529qkj.321.1649774197434; 
 Tue, 12 Apr 2022 07:36:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 n7-20020ac85a07000000b002f1421dac8csm324215qta.80.2022.04.12.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 07:36:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1neHdE-000uGn-C6; Tue, 12 Apr 2022 11:36:36 -0300
Date: Tue, 12 Apr 2022 11:36:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220412143636.GG64706@ziepe.ca>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
 <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b; envelope-from=jgg@ziepe.ca;
 helo=mail-qk1-x72b.google.com
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

On Fri, Apr 08, 2022 at 08:54:02PM +0200, David Hildenbrand wrote:

> RLIMIT_MEMLOCK was the obvious candidate, but as we discovered int he
> past already with secretmem, it's not 100% that good of a fit (unmovable
> is worth than mlocked). But it gets the job done for now at least.

No, it doesn't. There are too many different interpretations how
MELOCK is supposed to work

eg VFIO accounts per-process so hostile users can just fork to go past
it.

RDMA is per-process but uses a different counter, so you can double up

iouring is per-user and users a 3rd counter, so it can triple up on
the above two

> So I'm open for alternative to limit the amount of unmovable memory we
> might allocate for user space, and then we could convert seretmem as well.

I think it has to be cgroup based considering where we are now :\

Jason

