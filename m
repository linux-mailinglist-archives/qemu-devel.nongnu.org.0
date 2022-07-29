Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE91585570
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 21:06:25 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHVJY-0008P8-HQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 15:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHVFc-0005zA-P8
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:02:20 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHVFb-0002RP-6g
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:02:20 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso6410822pjq.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=LkO9SgTZ2fPl2HYX0gFonlaXjyZgw7WltwbfzzP2PWU=;
 b=LcCMO/BfHtLr67gbUfFYeZ2DnL0Qe15D/zjxvFdRRh7VmNk7LN5oMsc24VO/GmbV/U
 PuV6l97/eHoUtKDyH52SVtPAZ87OnqBus/o63uyQuFgufZzCyq9XsxfOUYAdERS1Jgqd
 Z8e1N8bqzr0z8QDItDcXKcyyEaabrG/16s5zoaP1WRFBF4Ue7XuTf8xaQCPaAoBgg974
 KUIBiMYBx36eqSObwBq4p2WXddbpg1bPZ34gDbt+XQiuHO4akXNCCqBoLF/FeCnzUG2i
 XE9mksL3i7ZMYBmA4SOK8RBlplgWMUQ4wTuOLsTMqyyIK0ibz34Lq8CE9D2iQAq/i5AS
 iEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=LkO9SgTZ2fPl2HYX0gFonlaXjyZgw7WltwbfzzP2PWU=;
 b=f8JFYjLBv2tP1YdqN/0IqmAuUvjpfqDmeEd7lozVLoLGXP3izh8YAuFTIBgHSPVk8x
 UbpyQpZcStso0AwRYH1RFLjhJ5U+TjruZMiLR8sCZVbyvfC5ezfDBS+gsYSqU/9H6Gen
 X/XKABH6DbfzVy+UQVuUViDrhlti2DOl3B7Xl44sMYF0flo2Eq5gyxNW2llbEGbYJjFv
 FpPpZ18kpEnjylqTOyvDILgdpOxKyMK/vo3WQ9XESJleg4gsY8LwpmgbvpCyZz7EqRSB
 8w4y8kvZGazIsVQxTxGUciumHdDSDC1O3VKIDqiSZrb/dKKOSmoTJziRxroOW7NwPzUU
 LWQA==
X-Gm-Message-State: ACgBeo3p6EIjXI6piutiAYTrrpk0Xx8hV0mfBZW8KdaLmgxnWIBTSpeE
 h9qbVXpj1eiNVDmYuiJniQpCcA==
X-Google-Smtp-Source: AA6agR6iqcQsub1nBR7JRnM5qfcyEbknlTLsOfU5kvnAs7e7vtoc0LC7cubgKQlDwv2I4efPq2wL9Q==
X-Received: by 2002:a17:90a:2ec5:b0:1f2:ea66:c832 with SMTP id
 h5-20020a17090a2ec500b001f2ea66c832mr6318473pjs.31.1659121336897; 
 Fri, 29 Jul 2022 12:02:16 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 n16-20020a170902e55000b0016d5cf36ff8sm4042180plf.274.2022.07.29.12.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 12:02:16 -0700 (PDT)
Date: Fri, 29 Jul 2022 19:02:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 08/14] KVM: Rename mmu_notifier_*
Message-ID: <YuQutJAhKWcsrrYl@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-9-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706082016.2603916-9-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102b.google.com
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

On Wed, Jul 06, 2022, Chao Peng wrote:
> The sync mechanism between mmu_notifier and page fault handler employs
> fields mmu_notifier_seq/count and mmu_notifier_range_start/end. For the
> to be added private memory, there is the same mechanism needed but not
> rely on mmu_notifier (It uses new introduced memfile_notifier). This
> patch renames the existing fields and related helper functions to a
> neutral name mmu_updating_* so private memory can reuse.

mmu_updating_* is too broad of a term, e.g. page faults and many other operations
also update the mmu.  Although the name most definitely came from the mmu_notifier,
it's not completely inaccurate for other sources, e.g. KVM's MMU is still being
notified of something, even if the source is not the actual mmu_notifier.

If we really want a different name, I'd vote for nomenclature that captures the
invalidation aspect, which is really what the variables are all trackng, e.g.

  mmu_invalidate_seq
  mmu_invalidate_in_progress
  mmu_invalidate_range_start
  mmu_invalidate_range_end


