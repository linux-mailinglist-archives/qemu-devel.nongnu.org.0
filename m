Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7006D8EDA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 07:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkIEy-0006av-9K; Thu, 06 Apr 2023 01:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkIEu-0006ak-Og
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 01:32:53 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkIEs-0001Nk-FQ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 01:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680759170; x=1712295170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cMFk0kD0fD4lzWVclNnHbpr4Qy6lzQjrbBOjirg5Flo=;
 b=kO3HEUd0p+gW/XUkUqqrxaf87wUYRYq4/C1y31tBHtnL3SrWNSHXauMk
 F51wWX0jo480a2EzZxHR/+njtN3xdF9e9Qi3EKAWmMmCzQcU+BuDiy3ES
 zcCUqgMmCzEktYZzucaHghhieg6b0/yMnfNhcKShd90Yc2vrfUkiWBnSv
 ALTtGIgI4JqpQZZ1uVTJItM7U1QmAwI21aULU09C7sbYNJJzGQRaNokfo
 21GC4HxtnPasoQJ6o67OZFiKPrvFI+BQBA0Gq5KcskFWskW1wlKO9O+HV
 f3uXui9GoHCTO3Qe7WpYR4WuVjRLrUcYzeApiem1bJFop4CwwdDpS/xV8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323021863"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="323021863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719567164"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="719567164"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:32:43 -0700
Date: Thu, 6 Apr 2023 01:32:26 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: "Yang, Weijiang" <weijiang.yang@intel.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Zhong, Yang" <yang.zhong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [RESEND PATCH v2] target/i386: Switch back XFRM value
Message-ID: <ZC5ZasjwCbnoA04A@yangzhon>
References: <20221026115745.528314-1-yang.zhong@intel.com>
 <253335ef-5e63-0182-f92b-a576b2459cff@intel.com>
 <CAATJJ0JLFA3b=KYP-OKXzritJGY1GuuRh+E4D6XZ3RLa6zKn_g@mail.gmail.com>
 <3df48e2b-f417-21dc-d386-95399c3e694e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3df48e2b-f417-21dc-d386-95399c3e694e@intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yang.zhong@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Mar 27, 2023 at 04:03:54PM +0800, Yang, Weijiang wrote:
> 
> On 3/27/2023 3:33 PM, Christian Ehrhardt wrote:
> > On Thu, Oct 27, 2022 at 2:36 AM Yang, Weijiang <weijiang.yang@intel.com> wrote:
> > > 
> > > On 10/26/2022 7:57 PM, Zhong, Yang wrote:
> > > > The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> > > > FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
> > > > SGX enclave only supported SSE and x87 feature(xfrm=0x3).
> > > > 
> > > > Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
> > > > 
> > > > Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
> > > > ---
> > > >    target/i386/cpu.c | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > > index ad623d91e4..19aaed877b 100644
> > > > --- a/target/i386/cpu.c
> > > > +++ b/target/i386/cpu.c
> > > > @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> > > >            } else {
> > > >                *eax &= env->features[FEAT_SGX_12_1_EAX];
> > > >                *ebx &= 0; /* ebx reserve */
> > > > -            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
> > > > -            *edx &= env->features[FEAT_XSAVE_XSS_HI];
> > > > +            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
> > > > +            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
> > > Oops, that's my fault to replace with wrong definitions, thanks for the fix!
> > > 
> > > Reviewed-by:  Yang Weijiang <weijiang.yang@intel.com>
> > Hi,
> > I do not have any background on this but stumbled over this and wondered,
> > is there any particular reason why this wasn't applied yet?
> > 
> > It seemed to fix a former mistake, was acked and then ... silence
> 
> Chris, thanks for the catch!
> 
> I double checked this patch isn't in the latest 8.0.0-rc1 tree.
> 
> 
> Hi, Paolo,
> 
> Could you help merge this fixup patch? Thanks!


  Hello all,

  Let me rebase this patch and resend it, thanks!

  Yang


> 
> > 
> > > >                /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
> > > >                *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
> > 

