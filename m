Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C75F0158
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 01:23:55 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2sk-0004lX-Nw
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 19:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oe2rM-0003En-0T
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 19:22:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oe2rJ-0008LJ-Vo
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 19:22:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so2715497pjh.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=SlBvqIbtpL0VufXgwK7uhVH38JuonCmEli0InnRVEwc=;
 b=WuAt0WRwYyROULHsLoKuJv2kXZVaCxvv5se5SYxucmOEgMFUNx2D57LgdDwCei2x1H
 BHZJk6cnqMJ9lpHSGjIAQZn0y8BmTQuG82WIZcNgoFeD7LG4pqgoDjfwNUvpxX0kJLxv
 Dw+WsZzJyUYdaQkT0re+VcE6b51zajqB6Pihs0d5Dm06lt/3y15zlDRlEVhaJYcITjqq
 kxupICcV/19shZioX2psCPJiZdpZ4ysq5/1T3jM0Xx0pSi+GIDFyiPzVO05s6m98CDTT
 tOo/5JDD8RVKU0DNuMgu6l56RXQ8C5tSDlMssCXWcmrz1Q8KJiW+10QJLFQH8nbm/WCu
 b7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=SlBvqIbtpL0VufXgwK7uhVH38JuonCmEli0InnRVEwc=;
 b=p5I1EsuXH1OGhhXeStWqjyodMBaaGX7xA0Lgsc1kzG5mJUAjnm0bnD5LPouD8IcTeu
 +1pj11BJC+lBfRjHkogiRXX2q1PPXkbtayc3c9ywqQ0OQUHJUzEGaebRNjEZnPrfRYUf
 Sn8FiOkd8/L5RBYE1HFE6SJAxupLVAAfIGn1zN3cwfI02K4zt2wBC0wr7dfwq/X7U0SH
 RiK8R7eyBIyHAXoCxuqUoqjzz4Yp2W/VR11IUHcJAnpKRWAzwFFz9BVID6ihAwqBe8XT
 BrczS5FcYbx95GLg1pzMpymSr0pXGRsk4xXDkvfWV7g87bBK3idUecNggxMSAqIx2yTN
 MB3Q==
X-Gm-Message-State: ACrzQf03gcM8ha2BvjmWiMH42dMxO2pGV/0lrtuFAvjBxEPfKyLfzWSu
 WfbVfOXqpqPWxn4EuEqSj1ZqJg==
X-Google-Smtp-Source: AMsMyM75zZcPQQjlBQckiGdn+LExa+Ehm1TbE+ovPavYyibrIT8X85CNF5p+NDaTg0PkeD+6UnKilA==
X-Received: by 2002:a17:90b:1d81:b0:205:f381:7372 with SMTP id
 pf1-20020a17090b1d8100b00205f3817372mr11503541pjb.165.1664493743484; 
 Thu, 29 Sep 2022 16:22:23 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 g11-20020a17090a290b00b001f319e9b9e5sm4062149pjd.16.2022.09.29.16.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 16:22:22 -0700 (PDT)
Date: Thu, 29 Sep 2022 23:22:19 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 2/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YzYoq/4AcWGS/noD@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
 <20220929224516.GA2260388@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929224516.GA2260388@ls.amr.corp.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102a.google.com
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

On Thu, Sep 29, 2022, Isaku Yamahata wrote:
> On Thu, Sep 15, 2022 at 10:29:07PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > @@ -4645,14 +4672,20 @@ static long kvm_vm_ioctl(struct file *filp,
> >  		break;
> >  	}
> >  	case KVM_SET_USER_MEMORY_REGION: {
> > -		struct kvm_userspace_memory_region kvm_userspace_mem;
> > +		struct kvm_user_mem_region mem;
> > +		unsigned long size = sizeof(struct kvm_userspace_memory_region);
> > +
> > +		kvm_sanity_check_user_mem_region_alias();
> >  
> >  		r = -EFAULT;
> > -		if (copy_from_user(&kvm_userspace_mem, argp,
> > -						sizeof(kvm_userspace_mem)))
> > +		if (copy_from_user(&mem, argp, size);
> > +			goto out;
> > +
> > +		r = -EINVAL;
> > +		if (mem.flags & KVM_MEM_PRIVATE)
> >  			goto out;
> 
> Nit:  It's better to check if padding is zero.  Maybe rename it to reserved.
> 
> +               if (mem.pad1 || memchr_inv(mem.pad2, 0, sizeof(mem.pad2)))
> +                       goto out;

No need, KVM has more or less settled on using flags instead "reserving" bytes.
E.g. if/when another fancy feature comes along, we'll add another KVM_MEM_XYZ
and only consume the relevant fields when the flag is set.  Reserving bytes
doesn't work very well because it assumes that '0' is an invalid value, e.g. if
the future expansion is for a non-private file descriptor, then we'd need a new
flag even if KVM reserved bytes since fd=0 is valid.

The only reason to bother with pad2[14] at this time is to avoid having to define
yet another struct if/when the struct needs to expand again.  The struct definition
will still need to be changed, but at least we won't end up with struct
kvm_userspace_memory_region_really_extended.

