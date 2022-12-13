Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AA64B4DE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:10:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p546Z-0007ed-J8; Tue, 13 Dec 2022 07:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p546S-0007Y9-SG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:09:47 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p546P-0002wT-KH
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670933381; x=1702469381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dyv1R/6BTE9iFQ4ldpV49Tph9Ev3OBjeZLlpinLC6Yg=;
 b=jXS7XNOupyrCGOf5basYZCPRniuEx+F8zClb1Kwqw89WO3LvALAln0nL
 oxWx/MtlKBar37hc9Fw6lUZiVoYiF/fJeM8DOZyAWAOTWsVNk93MoFvxT
 40Sy1uLzeTIHya4M/mjcuzDK/dWwNweKVMH6KbIhPeTyvUwpIh4oNRRSk
 P+OvzcM0i49iwm7j2f+vgLNN550P/liF2Jd/6VR+S/r2Syijh9SHDP7gT
 i7Hbf3ZDP+Y/zOO0lH44vz/DDC4NcAX+UzRXKgg5MFAFOMh2USVm0VsXs
 0Z7TfwV6r6KYwkYmTrCKTV56nGDVTNWk5EMZ+QZWDyG5hXc/MX49kfgxM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315752883"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315752883"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:09:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="648537021"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="648537021"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.31.20])
 ([10.255.31.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:09:35 -0800
Message-ID: <cc6304b1-fe60-565c-f561-541ec1c8b479@intel.com>
Date: Tue, 13 Dec 2022 20:09:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/8] target/i386/intel-pt: print special message for
 INTEL_PT_ADDR_RANGES_NUM
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
 <20221208062513.2589476-5-xiaoyao.li@intel.com>
 <c920ff81-0231-b70f-5ede-b1085c583086@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <c920ff81-0231-b70f-5ede-b1085c583086@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/2022 2:43 PM, Chenyi Qiang wrote:
> 
> 
> On 12/8/2022 2:25 PM, Xiaoyao Li wrote:
>> Bit[2:0] of CPUID.14H_01H:EAX stands as a whole for the number of INTEL
>> PT ADDR RANGES. For unsupported value that exceeds what KVM reports,
>> report it as a whole in mark_unavailable_features() as well.
>>
> 
> Maybe this patch can be put before 3/8.

patch 3 introduces the logic to check bit 2:0 of CPUID leaf 14_1 as 
whole. So it's better to be after patch 3.

+            /* Bits 2:0 are as a whole to represent INTEL_PT_ADDR_RANGES */
+            if ((requested_features & INTEL_PT_ADDR_RANGES_NUM_MASK) >
+                (host_feat & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
+                unavailable_features |= requested_features &
+                                        INTEL_PT_ADDR_RANGES_NUM_MASK;

>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/cpu.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 65c6f8ae771a..4d7beccc0af7 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4387,7 +4387,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>>           return;
>>       }
>>   
>> -    for (i = 0; i < 64; ++i) {
>> +    if ((w == FEAT_14_1_EAX) && (mask & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
>> +        warn_report("%s: CPUID.14H_01H:EAX [bit 2:0]", verbose_prefix);
>> +        i = 3;
>> +    } else {
>> +        i = 0;
>> +    }
>> +
>> +    for (; i < 64; ++i) {
>>           if ((1ULL << i) & mask) {
>>               g_autofree char *feat_word_str = feature_word_description(f, i);
>>               warn_report("%s: %s%s%s [bit %d]",


