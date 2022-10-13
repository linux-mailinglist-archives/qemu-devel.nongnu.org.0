Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743F5FD4CD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 08:29:15 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiriU-00004t-4m
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 02:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1oireq-0006Ak-2U
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:25:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:3201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1oiren-0002Jb-Gj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665642325; x=1697178325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MutQrDjAleoUx9rFmvNVX6NbKzh0ZpgW6eoetAmtTAk=;
 b=lRgKW7U6UqS+sDxAVoN0n/RZ18jPzecQTqBqkA0UgHJeFUzdDL6gZiBS
 I8u68OZwNjW4V4OyLT4ZJ0yzMrTca608bswEcTOxp8SvejnlmsfLzVT4d
 5LI3tdRHYfESK5HuTwNoriweawB/AAkICadbSW4/WQghPKdLbidN8JsAv
 JgMApl6V+mMIPSzhihlYdkYfzuE/02G+r0+J3n6ytg/nX2OaxnQHEEUnD
 zg0Chusaw14YIu0fDXQqpPU+VrGW5nmewj9lQXnFdfgEcsyuP5HFJU5+i
 5XvkLBr/Kz63v/6YWmCgqTb6a1lxJtZla6hkzfD2Z1kRZ9LghD6osWhWh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="288257790"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="288257790"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 23:24:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="872195929"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="872195929"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 23:24:17 -0700
Date: Thu, 13 Oct 2022 02:23:48 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "Zhong, Yang" <yang.zhong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Yang, Weijiang" <weijiang.yang@intel.com>, yang.zhong@linux.intel.com
Subject: Re: [PATCH] target/i386: Switch back XFRM value
Message-ID: <Y0eu9Nq/fhZLKwCt@yangzhon>
References: <20221012082609.922631-1-yang.zhong@intel.com>
 <3a08ba1b681315cc1062d68f86392bb7d94eb680.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a08ba1b681315cc1062d68f86392bb7d94eb680.camel@intel.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=yang.zhong@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 09:59:04AM +0000, Huang, Kai wrote:
> On Wed, 2022-10-12 at 04:26 -0400, Yang Zhong wrote:
> > The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> > FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):ECX, which made SGX
> 						^
> 
> Nit: both ECX and EDX are wrongly set, but not only ECX.
> 

  Yes, I will change to CPUID(EAX=12,ECX=1):{ECX,EDX}, thanks! 

> > enclave only supported SSE and x87 feature(xfrm=0x3).
> 
> Is this true?  Perhaps I am missing something, but it seems env-
> >features[FEAT_XSAVE_XCR0_LO] only includes LBR bit, which is bit 15.

  We printed the XFRM value from SGX SDK to find this issue.

> 
> /* Calculate XSAVE components based on the configured CPU feature flags */
> static void x86_cpu_enable_xsave_components(X86CPU *cpu)
> {    
>     ...
>     env->features[FEAT_XSAVE_XSS_LO] = mask & CPUID_XSTATE_XSS_MASK;
>     ...
> }
> 
> /* CPUID feature bits available in XSS */
> #define CPUID_XSTATE_XSS_MASK    (XSTATE_ARCH_LBR_MASK)
> 
> > 
> > Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
> > ---
> >  target/i386/cpu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index ad623d91e4..19aaed877b 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          } else {
> >              *eax &= env->features[FEAT_SGX_12_1_EAX];
> >              *ebx &= 0; /* ebx reserve */
> > -            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
> > -            *edx &= env->features[FEAT_XSAVE_XSS_HI];
> > +            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
> > +            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
> >  
> >              /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
> >              *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
> 
> The code looks good:
> 
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> 

