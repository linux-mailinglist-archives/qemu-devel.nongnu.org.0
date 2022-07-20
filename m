Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E857C0A8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 01:10:15 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEIpZ-0001ya-Sd
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 19:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1oEInq-0000cI-2R
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 19:08:26 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1oEIno-00076n-74
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 19:08:25 -0400
Received: by mail-pf1-x435.google.com with SMTP id 17so161213pfy.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 16:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nszl3bsf2mnME2IbrRKNWdpEyNRDpL7edLFc4oh5rQk=;
 b=FwlOpTY1Xy5ZtTxSMQshR8kwWNBaEnIm9ywPyxdMxe3T/XxFEM/rXOZ8shtzx6jRRS
 91M8w+897Sjn6+U9yhdoQBbOHvUIZbnudqyVKqIbiFL3KIAItk6n7+SblQBLvdTN309V
 3g30TPedV8pjIQUF/c55Q9haSHOBERI23VMmBXMMfrJh6ECBxww0/hu+TOsLKCzYQ+gw
 GdGAnrtzEzMI3WfqML65BzsZafuMe/PQ0gjEW6sraCLwWPSVKqu83KinR/xUkg5DZP6e
 1lFSj7wj5ru0N/Lu8b5OfGt3wIdl4NxJaMaNB7fu16Hj/vtrqiGttQ3ijzZC5VLTZ10Y
 P4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nszl3bsf2mnME2IbrRKNWdpEyNRDpL7edLFc4oh5rQk=;
 b=1RalV8T1zQsdZr6SOUVrIyL3fQfHfNKW8cP9sUvLWTuop/OOen+fAJ8Gi0WNVB58MA
 IaWYoFsYMxYZQpSmFVHttAD14U9vhoTDR3T5VzvjIwy+hY7hrMkv+bOdfJKNwIy9ux19
 JCx9CIFXuoAir5mhsMQBqdiqRgyuOnsvAGzIYjiruBEj8E+3UQgeZS6LMtn9YW3RDo8+
 UrOL879VWgvIoOdlQA5fNy+1HCrnZUT0cZ3TR7IdUBGodE3SvQxWPVghLnJoaWg0WwbM
 3pu/f7byhR3Lx+9Ld8WXJ4gXGE0fXk1jU0pP/aOZcqynxZzYz2M176Lmjr1v7lj2krys
 OmSA==
X-Gm-Message-State: AJIora+/6qNiis9mDhedAs/Bom+mTkDLt0RC0Vi3666PvBoSBpnDzjag
 aMUTNNQzucSOpQxllecZq8HhbAz2tpFlHpFmalhg1g==
X-Google-Smtp-Source: AGRyM1sVSu2sWaA6KhwjXATdLIcan8zoTwRzYetVEkO/NR0+movB4Kj6gdLqTbANspAPpdn1ss3XaAW1x7VvJRw8slU=
X-Received: by 2002:a62:1a8b:0:b0:528:d505:1a06 with SMTP id
 a133-20020a621a8b000000b00528d5051a06mr41267868pfa.78.1658358501699; Wed, 20
 Jul 2022 16:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
 <20220624090246.GA2181919@chaop.bj.intel.com>
 <CAGtprH82H_fjtRbL0KUxOkgOk4pgbaEbAydDYfZ0qxz41JCnAQ@mail.gmail.com>
 <20220630222140.of4md7bufd5jv5bh@amd.com>
 <4fe3b47d-e94a-890a-5b87-6dfb7763bc7e@intel.com>
 <Ysc9JDcVAnlVrGC8@google.com> <5d0b9341-78b5-0959-2517-0fb1fe83a205@intel.com>
In-Reply-To: <5d0b9341-78b5-0959-2517-0fb1fe83a205@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 20 Jul 2022 16:08:10 -0700
Message-ID: <CAGtprH9knCr++C7jgXYCi1zfYcreip1uun-d+eucjEQy9xymNg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Michael Roth <michael.roth@amd.com>, 
 Chao Peng <chao.p.peng@linux.intel.com>, "Nikunj A. Dadhania" <nikunj@amd.com>,
 kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, 
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
 Andi Kleen <ak@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=vannapurve@google.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

> > Hmm, so a new slot->arch.page_attr array shouldn't be necessary, KVM can instead
> > update slot->arch.lpage_info on shared<->private conversions.  Detecting whether
> > a given range is partially mapped could get nasty if KVM defers tracking to the
> > backing store, but if KVM itself does the tracking as was previously suggested[*],
> > then updating lpage_info should be relatively straightfoward, e.g. use
> > xa_for_each_range() to see if a given 2mb/1gb range is completely covered (fully
> > shared) or not covered at all (fully private).
> >
> > [*] https://lore.kernel.org/all/YofeZps9YXgtP3f1@google.com
>
> Yes, slot->arch.page_attr was introduced to help identify whether a page
> is completely shared/private at given level. It seems XARRAY can serve
> the same purpose, though I know nothing about it. Looking forward to
> seeing the patch of using XARRAY.
>
> yes, update slot->arch.lpage_info is good to utilize the existing logic
> and Isaku has applied it to slot->arch.lpage_info for 2MB support patches.

Chao, are you planning to implement these changes to ensure proper
handling of hugepages partially mapped as private/shared in subsequent
versions of this series?
Or is this something left to be handled by the architecture specific code?

Regards,
Vishal

