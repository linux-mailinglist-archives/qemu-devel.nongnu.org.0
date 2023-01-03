Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C615F65B944
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 03:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCWm4-0002wt-8Q; Mon, 02 Jan 2023 21:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1pCWm1-0002we-1X
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 21:11:29 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1pCWlx-0004Gm-FV
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 21:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672711885; x=1704247885;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=pSNI/4Tf73Ws+ysigzG/JulYZyOzw1BRG6gGPQ1GxfE=;
 b=c1tBvpm0hfHtYcPpnj3APsu0ieDuTyl1KOP9e9hs0Qn0cW19NynZrIrQ
 ez9a00U58wwda3XxCv81C2vedm0eLum/A0ceJGbUPXRkHM6k4OQjeOfPX
 TNDZS+BpcH4EFzuKxoX1l2Ko/HwMVeph88NBz/lQBLCktGtRWe82JP64P
 FhNPVEIcxY2e/QB+0oHN+Iw8/7+r738QKkR51f4T5F7nP9ETVaJs84t43
 a977iGfkQvml0sW77b57dtqgvegw56LBixgAP3HL9l3OMTny3QY+WiL4c
 tlrxMtN6H/eUCeNveQn9zGWPK/q72A0rb7yuvgMgeKWm/r6mC9HBc+2Z2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="321632453"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="321632453"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 18:11:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="604674610"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="604674610"
Received: from jiaxiche-mobl.ccr.corp.intel.com (HELO [10.254.214.246])
 ([10.254.214.246])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 18:11:19 -0800
Message-ID: <066c704e-e297-1755-4a44-e3a2e4d130ea@linux.intel.com>
Date: Tue, 3 Jan 2023 10:11:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] target/i386: Support new Intel platform Instructions
 in CPUID enumeration
From: Jiaxi Chen <jiaxi.chen@linux.intel.com>
To: qemu-devel@nongnu.org
References: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
In-Reply-To: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=jiaxi.chen@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Kindly ping for any comments.

BR,
Jiaxi

On 12/8/2022 3:19 PM, Jiaxi Chen wrote:
> Latest Intel platform Granite Rapids/Sierra Forest has introduced below
> new instructions and CPUIDs:
> 
>  - CMPccXADD CPUID.(EAX=7,ECX=1):EAX[bit 7]
>  - AMX-FP16 CPUID.(EAX=7,ECX=1):EAX[bit 21]
>  - AVX-IFMA CPUID.(EAX=7,ECX=1):EAX[bit 23]
>  - AVX-VNNI-INT8 CPUID.(EAX=7,ECX=1):EDX[bit 4]
>  - AVX-NE-CONVERT CPUID.(EAX=7,ECX=1):EDX[bit 5]
>  - PREFETCHITI CPUID.(EAX=7,ECX=1):EDX[bit 14]
> 
> Details can be found in recent Intel ISE (Instruction Set Extensions)[1].
> 
> Linux 6.2 will support for advertising these features to userspace. KVM
> patches have been merged into kvm/next[2]. This patch series adds CPUID
> definitions of the corresponding features in QEMU. 
> 
> [1] Intel ISE: https://cdrdv2.intel.com/v1/dl/getContent/671368
> [2] kvm/next: https://git.kernel.org/pub/scm/virt/kvm/kvm.git
> 
> Jiaxi Chen (6):
>   target/i386: Add support for CMPCCXADD in CPUID enumeration
>   target/i386: Add support for AMX-FP16 in CPUID enumeration
>   target/i386: Add support for AVX-IFMA in CPUID enumeration
>   target/i386: Add support for AVX-VNNI-INT8 in CPUID enumeration
>   target/i386: Add support for AVX-NE-CONVERT in CPUID enumeration
>   target/i386: Add support for PREFETCHIT0/1 in CPUID enumeration
> 
>  target/i386/cpu.c | 26 +++++++++++++++++++++++---
>  target/i386/cpu.h | 15 +++++++++++++++
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> 
> base-commit: ea3a008d2d9ced9c4f93871c823baee237047f93

-- 
Regards,
Jiaxi

