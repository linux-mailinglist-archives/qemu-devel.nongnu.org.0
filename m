Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DA252587
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 04:44:11 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAlQ3-0007eM-3J
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 22:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1kAlPJ-0006oU-CE
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 22:43:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:32684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1kAlPG-0003Do-FT
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 22:43:24 -0400
IronPort-SDR: gmBPM/oSwPcz3wgP1I3/GOHBGph05eLrP9isOzpR8szvave1TduIWutsmPUeaTcJKo/ZKKO02i
 CVuvyyQj7YpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143889320"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="143889320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 19:43:18 -0700
IronPort-SDR: yz0WD4t8sQ1JBpezTRpKP/rBpiMwuO0pyDi8xzpJt605NUI//N7XOEYfy7jslFBFdt4xOq3qhP
 /yoYk5eDjPQA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474599333"
Received: from kblgvt-desktop.sh.intel.com (HELO [10.239.13.113])
 ([10.239.13.113])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 19:43:17 -0700
Subject: Re: [PATCH 2/2] target/i386: Add missed features to Cooperlake CPU
 model
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20191225063018.20038-1-xiaoyao.li@intel.com>
 <20191225063018.20038-3-xiaoyao.li@intel.com>
 <20200824220759.GS642093@habkost.net>
 <9cdaaa8d-4ce2-88c7-2400-eed62ffe779b@intel.com>
 <20200825140145.GU642093@habkost.net>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <3644bc2e-feaa-94cb-7c57-701539894384@intel.com>
Date: Wed, 26 Aug 2020 10:43:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825140145.GU642093@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 22:43:18
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, NICE_REPLY_A=-2.602, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cathy Zhang <cathy.zhang@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/2020 10:01 PM, Eduardo Habkost wrote:
> On Tue, Aug 25, 2020 at 08:20:35AM +0800, Xiaoyao Li wrote:
>> On 8/25/2020 6:07 AM, Eduardo Habkost wrote:
>>> On Wed, Dec 25, 2019 at 02:30:18PM +0800, Xiaoyao Li wrote:
>>>> It lacks VMX features and two security feature bits (disclosed recently) in
>>>> MSR_IA32_ARCH_CAPABILITIES in current Cooperlake CPU model, so add them.
>>>>
>>>> Fixes: 22a866b6166d ("i386: Add new CPU model Cooperlake")
>>>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>>> ---
>>>>    target/i386/cpu.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 50 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>>> index e1eb9f473989..c9798ac8652b 100644
>>>> --- a/target/i386/cpu.c
>>>> +++ b/target/i386/cpu.c
>>>> @@ -3198,7 +3198,8 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>>>                CPUID_7_0_EDX_SPEC_CTRL_SSBD | CPUID_7_0_EDX_ARCH_CAPABILITIES,
>>>>            .features[FEAT_ARCH_CAPABILITIES] =
>>>>                MSR_ARCH_CAP_RDCL_NO | MSR_ARCH_CAP_IBRS_ALL |
>>>> -            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO,
>>>> +            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
>>>> +            MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
>>>
>>> This seems to break on some Cooperlake hosts, see:
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1860743
>>>
>>> Are all Cooperlake hosts supposed to have TAA_NO set?  Are there
>>> hosts where this requires a microcode update to be installed?
>>>
>>
>> All the production CPX in market should have IAA_NO bit. We can check it
>> directly with rdmsr(0x10a).
>>
>> The problem of this issue is due to commit db616173d787 ("x86/tsx: Add
>> config options to set tsx=on|off|auto"), which sets the default to "off" for
>> 100% safety. However, default to off may cause noticeable regressions on TSX
>> safe platform, e.g., CPX.
>>
>> Maybe we need to set CONFIG_X86_INTEL_TSX_MODE_AUTO=y for OSV released
>> kernel?
> 
> Considering that disabling TSX is a policy decision likely to be
> taken by the OS vendor or by the system administrator, we could
> at least make the CPU model easier to use on those cases.
> 
> Maybe we should provide a version of Cooperlake without TSX, like
> we already do for the other CPU models?
> 

sure we can do it.

