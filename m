Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E549E437
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:52 +0100 (CET)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5UB-0000bz-28
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5PA-00071Y-PD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:05:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:8158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5OU-0000ob-RH
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643292298; x=1674828298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f0JhhQWAt4h68kGAKhHgxOiuTNLOHBhFFftzY5usE4M=;
 b=Z7AnVQQo/ZzbThCgr+5R5UnnR1p2u8PWPj+FPU0IoZp5dG0b3HMef8Ib
 cixXgpqJ2qOk9nFVgW1iOz86mz3yrJCM1QimWoncHUf8czoXUJKQp1DIH
 lRJ43uvHt/tey7CoPfzxFee/qG7/OAE+G7Lig+2WBkV0eDVCXdQDWvEsV
 KD1QLCnLqSqGl27zqjGMeX8ZoSQKSjCS3elsFaJqWM3LTFZ1nGXCdHJK1
 vXfwELejoVQcU2rwS1PqOrI/i86NgEWEaeiNt/I0X8zBOm/7MefHaLL0T
 Hc3AZkX2xpA565PPPCkry7Uk0fRUt2ve6voD5lnEn+1lRzVOrLb6x4SO0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="310167311"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="310167311"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 06:02:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="477875117"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Jan 2022 06:02:08 -0800
Date: Thu, 27 Jan 2022 21:46:45 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/7] x86: Add AMX CPUIDs enumeration
Message-ID: <20220127134645.GB8954@yangzhon-Virtual>
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-6-yang.zhong@intel.com>
 <4d1faab0-cef8-6f59-3e84-844db1bfbce1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d1faab0-cef8-6f59-3e84-844db1bfbce1@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 11:13:07AM +0100, Paolo Bonzini wrote:
> On 1/24/22 08:55, Yang Zhong wrote:
> >diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >index caf1388d8b..25d26a15f8 100644
> >--- a/target/i386/kvm/kvm.c
> >+++ b/target/i386/kvm/kvm.c
> >@@ -1765,7 +1765,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >                  c = &cpuid_data.entries[cpuid_i++];
> >              }
> >              break;
> >-        case 0x14: {
> >+        case 0x14:
> >+        case 0x1d: {
> 
> Should this include 0x1e as well?
>
  
  Thanks, we missed this.

  Yang 
 
> Paolo
> 
> >              uint32_t times;
> >              c->function = i;

