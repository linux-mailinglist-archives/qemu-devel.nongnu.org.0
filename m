Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E8696C67
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRziM-0008FL-Fu; Tue, 14 Feb 2023 13:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34c3rYwYKClICyu73w08805y.w86Ay6E-xyFy578707E.8B0@flex--seanjc.bounces.google.com>)
 id 1pRziK-0008AZ-S1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:36 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34c3rYwYKClICyu73w08805y.w86Ay6E-xyFy578707E.8B0@flex--seanjc.bounces.google.com>)
 id 1pRziJ-0000Db-8W
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:07:36 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-52ec8c88d75so141818187b3.12
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wX05IVkHj3QBCA1mIon81shk3MJEJQ/4hz193u4oHCc=;
 b=Dt+QCXEL/j2OVlYZG+8qwoo88m8d8gSqPp1DJoQ+IGJpPuoZGZ7SYYDdYB8+yJ3eDl
 jeP6IZHDHerpXSU/A3lwaLOqhRFKoFsgEci4P2KArqSNVmooBA2C7+kM9EYWXXJTyLae
 Xg1dZ+EziJ8yGcFploTgi9FMPrPslHsMYXReHQVo9CBAaIj0P6zc7wVMCM6iWLSQwSfv
 rIpX9OdI9ocknhGSMghX+77PCRzZY4cpQYWxW05GrdrgU5xkG+PmVmF6RvgPoyIDvsRh
 kG8ONtGxcufDvuzLkSW/HaWjLqmZO3eUfiS87W6x7qkvY49eByyFST1j571DlgUotIiS
 /nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wX05IVkHj3QBCA1mIon81shk3MJEJQ/4hz193u4oHCc=;
 b=LMEiJD8UfpGpw8cNGLgCrra5Mb6+aqsFNGLAouOAO+n3unwg/nB3AQ5LeuQ5zu+0qk
 bg3LuVXa0vQTQ57Jw+/GjOp68wLXtIcCsgN2Sn5WE/BGj8m9ihz3iw7cwleQ+i2dqGMV
 Bk5NQjV/RSblCiA42J/Gj/ZkG19ln1hWbV4Gcr/i6QAT4Q7sBLUFFwvrvuLL1uzNXkAu
 bALPOBhau79ObJwvIJ1qJIpvBEbbixgaLB3DhPKvac0/HhmX2wo3oO8If4dZoJbtkBfo
 rRkWKsHuuIWd2Q0PDLKDuSg75KA8Bz1xOYA8AW0cCHBM+EGllhhpv5HajYGa1io441a0
 BCtQ==
X-Gm-Message-State: AO0yUKVed8izF8xIflMpKJreGN3jObzC7WXqYaHWU8x2meBeZQ7yGV0S
 ZNK5oUokQn+g6Ahr9xm9wimJ/ZssL2g=
X-Google-Smtp-Source: AK7set+EI7pNBbm5Gukj5zYQbLZVnpf4V0D4zMPyPaLWe/aBZALXoW94wxCwwjPKImE/Ubi3qEmpRmHjMf0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:dd0a:0:b0:52a:9490:4f66 with SMTP id
 e10-20020a81dd0a000000b0052a94904f66mr350779ywn.56.1676398049608; Tue, 14 Feb
 2023 10:07:29 -0800 (PST)
Date: Tue, 14 Feb 2023 10:07:28 -0800
In-Reply-To: <20230213235343.GC4175971@ls.amr.corp.intel.com>
Mime-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <20230209072529.GB4175971@ls.amr.corp.intel.com>
 <Y+WRUriIoan/XChx@google.com> <20230213235343.GC4175971@ls.amr.corp.intel.com>
Message-ID: <Y+vN4L3N6f3fFlgA@google.com>
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=34c3rYwYKClICyu73w08805y.w86Ay6E-xyFy578707E.8B0@flex--seanjc.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Feb 13, 2023, Isaku Yamahata wrote:
> On Fri, Feb 10, 2023 at 12:35:30AM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Wed, Feb 08, 2023, Isaku Yamahata wrote:
> > > On Fri, Dec 02, 2022 at 02:13:40PM +0800,
> > > Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > > 
> > > > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > > > +					   struct kvm_memory_attributes *attrs)
> > > > +{
> > > > +	gfn_t start, end;
> > > > +	unsigned long i;
> > > > +	void *entry;
> > > > +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > > > +
> > > > +	/* flags is currently not used. */
> > > > +	if (attrs->flags)
> > > > +		return -EINVAL;
> > > > +	if (attrs->attributes & ~supported_attrs)
> > > > +		return -EINVAL;
> > > > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > > > +		return -EINVAL;
> > > > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > > > +		return -EINVAL;
> > > > +
> > > > +	start = attrs->address >> PAGE_SHIFT;
> > > > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > > > +
> > > > +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > > > +
> > > > +	mutex_lock(&kvm->lock);
> > > > +	for (i = start; i < end; i++)
> > > > +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > > > +				    GFP_KERNEL_ACCOUNT)))
> > > > +			break;
> > > > +	mutex_unlock(&kvm->lock);
> > > > +
> > > > +	attrs->address = i << PAGE_SHIFT;
> > > > +	attrs->size = (end - i) << PAGE_SHIFT;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> > > > +
> > > 
> > > If memslot isn't private, it should return error if private attribute is set.
> > 
> > Why?  I'd rather keep the two things separate.  If we enforce this sort of thing
> > at KVM_SET_MEMORY_ATTRIBUTES, then we also have to enforce it at
> > KVM_SET_USER_MEMORY_REGION.
> 
> For device assignment via shared GPA, non-private memory slot needs to be
> allowed.

That doesn't say anything about why setting attributes needs to poke into the
memslot.  The page fault path already kicks out to userspace if there's a
discrepancy between the attributes and the memslot, why is that insufficient?

