Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2245F601C41
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 00:23:12 +0200 (CEST)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okYVq-0003q4-EA
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 18:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1okYQk-0001tu-Ux
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:17:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1okYQi-0004Tr-2k
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:17:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id l1so12029839pld.13
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TrR1U1OdGGBTNU+L/j5+q/HQQR5gcpgDZtfvTOOBt0M=;
 b=Pa9UF6Hi2q1b744+/zFgnMjVA7j2pgI5ymLqfYIjscYUAYCF5ZXYRaOr8OH7B7Xd9F
 /HznXiV0rMC5mH6t0PX9UTIUMnvfTMra5P8j8/Err3N0tWueZMfcGzGtxNdF72RRSt7o
 NHpkNbOoj5ABhkcBEje6If6JGJVChr/yUqpTjUi6oHUQYtvQcn2Qq0A0mMJRwm7jwCpU
 txbpSRtq6Deb3lMYIB2V2HXjwUD/dBV3FD8oYF4YSQczKnAO+mdCYqOZu/+92E+l+c3z
 qnP5v2XAfcbbMH4rprLDtpkgxOqarwr2vDP6sOEKWp3p6bnA4ZtbMgRsXFz+JSka9OPZ
 iKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrR1U1OdGGBTNU+L/j5+q/HQQR5gcpgDZtfvTOOBt0M=;
 b=Jix3XnJUQEB/o4cF5oQ5IvImNkC/aBzU4QFQU17N4rNKX6HmPx0U0SpRTYpY0yYcoA
 /8Gd68tG4iyKwnJDP3YXzNmasu9/AnHJCpdS1pN4LcNV1Wq4kGhLJ2ltL1Jx8vVZJ+O5
 6XAtjpu4FksO21buPiy1dv8zHPmJPEBsMezhRD/PDjfNF1aXhs9UJDOjA3SbgrDaZnD6
 wA8Ui7Ego6X3UAJabJQHRscPG2pTyNkPqZas71TnQtMyz5RPnBA8Ug40/j5K6t96xdMA
 bNv2iQUnGBBaVviGP8xM1FPEB86pWo+8rdEVJWlkQdvirkoph9cdvzXLHKrqZMy7A+0q
 jLww==
X-Gm-Message-State: ACrzQf1DaJNMYuFRnJeThqUkKdxCbwegAtSc2pZg16Q2z3aP4U3kq+ff
 VlMJcYeuzhAnDabubkrsQH1F7w==
X-Google-Smtp-Source: AMsMyM5sOws5M1E82UjbITIFno8w/HG4mdjtUwGqdWDsxnzcg+d5uvozuCFcCUl9QhNTIh10tM+Etg==
X-Received: by 2002:a17:903:1c2:b0:185:47ce:f4d2 with SMTP id
 e2-20020a17090301c200b0018547cef4d2mr14097565plh.101.1666045069741; 
 Mon, 17 Oct 2022 15:17:49 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 p13-20020a17090a74cd00b0020ad46d277bsm9992889pjl.42.2022.10.17.15.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 15:17:49 -0700 (PDT)
Date: Mon, 17 Oct 2022 22:17:45 +0000
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Subject: Re: [PATCH v8 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <Y03UiYYioV+FQIpx@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-6-chao.p.peng@linux.intel.com>
 <CA+EHjTxukqBfaN6D+rPOiX83zkGknHEQ16J0k6GQSdL_-e9C6g@mail.gmail.com>
 <20221012023516.GA3218049@chaop.bj.intel.com>
 <CA+EHjTyGyGL+ox81=jdtoHERtHPV=P7wJub=3j7chdijyq-AgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyGyGL+ox81=jdtoHERtHPV=P7wJub=3j7chdijyq-AgA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62a.google.com
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

On Mon, Oct 17, 2022, Fuad Tabba wrote:
> Hi,
> 
> > > > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > > > +#define KVM_MEM_ATTR_SHARED    0x0001
> > > > +static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
> > > > +                                    bool is_private)
> > > > +{
> > >
> > > I wonder if this ioctl should be implemented as an arch-specific
> > > ioctl. In this patch it performs some actions that pKVM might not need
> > > or might want to do differently.
> >
> > I think it's doable. We can provide the mem_attr_array kind thing in
> > common code and let arch code decide to use it or not. Currently
> > mem_attr_array is defined in the struct kvm, if those bytes are
> > unnecessary for pKVM it can even be moved to arch definition, but that
> > also loses the potential code sharing for confidential usages in other
> > non-architectures, e.g. if ARM also supports such usage. Or it can be
> > provided through a different CONFIG_ instead of
> > CONFIG_HAVE_KVM_PRIVATE_MEM.
> 
> This sounds good. Thank you.

I like the idea of a separate Kconfig, e.g. CONFIG_KVM_GENERIC_PRIVATE_MEM or
something.  I highly doubt there will be any non-x86 users for multiple years,
if ever, but it would allow testing the private memory stuff on ARM (and any other
non-x86 arch) without needing full pKVM support and with only minor KVM
modifications, e.g. the x86 support[*] to test UPM without TDX is shaping up to be
trivial.

[*] https://lore.kernel.org/all/Y0mu1FKugNQG5T8K@google.com

