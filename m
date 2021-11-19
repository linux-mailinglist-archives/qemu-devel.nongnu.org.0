Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2A457755
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:50:48 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9uI-0003V3-NG
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:50:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo9rS-0002f2-K3
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:47:50 -0500
Received: from [2607:f8b0:4864:20::f35] (port=46660
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo9rQ-0006YK-Ib
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:47:50 -0500
Received: by mail-qv1-xf35.google.com with SMTP id jo22so7803923qvb.13
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 11:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b8HwEu/l2NAGuMcWKH5jQM9AiiPfyTyPdU6LnAiTwjE=;
 b=eXYLScpgWGOSOqBVSQtdTVD++xT2fUA+29WU5uRjLvVVyE3JEysFYMD3c5m3MUuwhi
 2/dEOlgu6r/9aoIpMC/3VJ29OZt+Y5gY+DeEvBjU4JCXVvlQTRyE4kipd4bnNE4VfygO
 gi2wVXk5KMG1My3gjGCyppqDyPaW46HK5/4P7hKcEdPibptKWHECr7E7AOpM6qgeV0Gk
 5XFBGCzNpMsoTIPVISn+JIpRXTxD1C4vDaEFVrlgHo58JmtwUKTR1DrLx7zfgn5Z1MG8
 NtfI2Hh1jxXAWFSVfmkK0Vl+a+bgSvADPQFiF6otkPWuXnCgFRePBcvR1qLvCTFwllWk
 rJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b8HwEu/l2NAGuMcWKH5jQM9AiiPfyTyPdU6LnAiTwjE=;
 b=iwYJchzRhOFVn9caMv5Z003SCWGAGI+OIlIHPo4M7fza5TnVNskFjRTlvO3esZxsJR
 pItbXAaNjF8Bl76EXPE+TG4olJgq2slBj+W/RiP5ZD0KlTao7zm7AoPPu0148+X8glaM
 nbcfUbk6UW+pKo/RV+2VeLFjdZvDuyq/8glqzyxEgz3Ox7HGmQCZmu7NrwwPRl2CRlB0
 jRW+Wz/NG4BbrWvEKYh6wTMxWxfil++5C/hyEY33T0DHrMPv8iRTKdw2n0MKBII2Shyj
 4vD98Z3XEtHEHUBv/E4gAhtw8u8vuVQRM95hUwA6OCNbryzo59IJFA8peFm5+cvgbNYm
 PphQ==
X-Gm-Message-State: AOAM533FispCOjZE9vOkxwshDNtKjAi51udTQYeBrphfJPCcIimk9zOc
 ZdqNVoNBLL88IkoNC98AKuDxag==
X-Google-Smtp-Source: ABdhPJwYijRrK8qgpzAhCkRXoqK9YWbXTodbosR5h3I14ZDdTjYbPRJ8dYw0rADALVOrpBmC6Q7oWg==
X-Received: by 2002:a05:6214:4107:: with SMTP id
 kc7mr76325935qvb.57.1637351267376; 
 Fri, 19 Nov 2021 11:47:47 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id d13sm339977qkn.100.2021.11.19.11.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 11:47:46 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mo9rO-00Cdid-BP; Fri, 19 Nov 2021 15:47:46 -0400
Date: Fri, 19 Nov 2021 15:47:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211119194746.GM876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <YZf4aAlbyeWw8wUk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZf4aAlbyeWw8wUk@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35; envelope-from=jgg@ziepe.ca;
 helo=mail-qv1-xf35.google.com
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

On Fri, Nov 19, 2021 at 07:18:00PM +0000, Sean Christopherson wrote:
> On Fri, Nov 19, 2021, David Hildenbrand wrote:
> > On 19.11.21 16:19, Jason Gunthorpe wrote:
> > > As designed the above looks useful to import a memfd to a VFIO
> > > container but could you consider some more generic naming than calling
> > > this 'guest' ?
> > 
> > +1 the guest terminology is somewhat sob-optimal.
> 
> For the F_SEAL part, maybe F_SEAL_UNMAPPABLE?

Perhaps INACCESSIBLE?

> No ideas for the kernel API, but that's also less concerning since
> it's not set in stone.  I'm also not sure that dedicated APIs for
> each high-ish level use case would be a bad thing, as the semantics
> are unlikely to be different to some extent.  E.g. for the KVM use
> case, there can be at most one guest associated with the fd, but
> there can be any number of VFIO devices attached to the fd.

Even the kvm thing is not a hard restriction when you take away
confidential compute.

Why can't we have multiple KVMs linked to the same FD if the memory
isn't encrypted? Sure it isn't actually useful but it should work
fine.

Supporting only one thing is just a way to avoid having a linked list
of clients to broadcast invalidations too - for instance by using a
standard notifier block...

Also, how does dirty tracking work on this memory?

Jason

