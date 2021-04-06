Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95A354DCD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:25:25 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTg5T-0002eM-AO
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lTg3W-00022n-Pu
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:23:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:35294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lTg3R-0005sm-NM
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:23:21 -0400
IronPort-SDR: wZgWOll5bPMKyRYZZk2TVfvfc47PO69evsg3ZHN+pHM49LKTLZvx60VlMVR4rS2LNlhp+6nPhu
 oOKMzzaW9+rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="213366592"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="213366592"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 00:23:11 -0700
IronPort-SDR: raszK+IKOKAv2PJQoy3ZkVk5tfsFXrkPlFB0Qurc3kya1HKjB/HaKY4DCG99NUD/PwCEb0TClK
 zBDB0oGQBT9Q==
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="414652330"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 Apr 2021 00:23:09 -0700
Date: Tue, 6 Apr 2021 15:11:00 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] i386/cpu: Expose AVX_VNNI instruction to guset
Message-ID: <20210406071100.GA22954@yangzhon-Virtual>
References: <20210406015757.25718-1-yang.zhong@intel.com>
 <35eb247d-55be-981a-8818-16aceb84cf82@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35eb247d-55be-981a-8818-16aceb84cf82@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, bonzini@gnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 09:15:44AM +0200, Philippe Mathieu-Daudé wrote:
> Typo "guest" in subject.
> 
  Philippe, thanks for your comments! It's my fault, let me change it and 
  if there is no any other issue , i will send new version tomorrow. thanks!

  Yang

> On 4/6/21 3:57 AM, Yang Zhong wrote:
> > Expose AVX (VEX-encoded) versions of the Vector Neural Network
> > Instructions to guest.>
> > The bit definition:
> > CPUID.(EAX=7,ECX=1):EAX[bit 4] AVX_VNNI
> > 
> > The following instructions are available when this feature is
> > present in the guest.
> >   1. VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> >   2. VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> >   3. VPDPWSSD: Multiply and Add Signed Word Integers
> >   4. VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> > 
> > As for the kvm related code, please reference Linux commit id 1085a6b585d7.
> > 
> > The release document ref below link:
> > https://software.intel.com/content/www/us/en/develop/download/\
> > intel-architecture-instruction-set-extensions-programming-reference.html
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  target/i386/cpu.c | 4 ++--
> >  target/i386/cpu.h | 2 ++
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 6b3e9467f1..f0c48f06a2 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -996,7 +996,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
> >          .type = CPUID_FEATURE_WORD,
> >          .feat_names = {
> >              NULL, NULL, NULL, NULL,
> > -            NULL, "avx512-bf16", NULL, NULL,
> > +            "avx-vnni", "avx512-bf16", NULL, NULL,
> >              NULL, NULL, NULL, NULL,
> >              NULL, NULL, NULL, NULL,
> >              NULL, NULL, NULL, NULL,
> > @@ -3273,7 +3273,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
> >              MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
> >              MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
> >          .features[FEAT_7_1_EAX] =
> > -            CPUID_7_1_EAX_AVX512_BF16,
> > +            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
> >          /*
> >           * Missing: XSAVES (not supported by some Linux versions,
> >           * including v4.1 to v4.12).
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 570f916878..edc8984448 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -804,6 +804,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
> >  /* Speculative Store Bypass Disable */
> >  #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
> >  
> > +/* AVX VNNI Instruction */
> > +#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
> >  /* AVX512 BFloat16 Instruction */
> >  #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
> >  
> > 

