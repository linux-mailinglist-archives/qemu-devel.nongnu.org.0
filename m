Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268D5B2BF4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 04:11:17 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWTUB-000712-Mj
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 22:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWTSV-0005Tg-Qz
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:09:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWTST-0001b7-4c
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662689369; x=1694225369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H3Xpf+inD9HYcVVTkmUa4kmqcQBxs+qfPIsZyroFgN0=;
 b=S00weZhKDtB4yYSUwZSDRO4QkYF53jjVwALXgUFt3UgzGspFtQCtroFm
 piyuNYrDagcwFdJHyExQOcQKo6JzGE2GrggTtNQbHQ0K7tpcvFgmcJ36S
 EqOTLteqL4HL+w6n6a+IDDEwd8WRMORYnGOHmKCoKrG9x8/2xw+Y4m2wr
 1U3n8ZVgyKTC7cv3dxAw20NyLJtHcvewuWWYZGws/LtVLts2f7y0/GLjs
 2VNewXmaG/PNJh6OcTb+4G/rWgjEl8TVI5sxsBJAx7dy7QQ4J65Ca1uGQ
 iu+drwHiuooLqofjsQHmUoau5rJS9Bw2lmk3A38TLjSZMt9wt8k464RqO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361332460"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="361332460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 19:09:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="592431009"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.255.28.150])
 ([10.255.28.150])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 19:09:22 -0700
Message-ID: <f5ded358-945f-55ce-873f-1f0b6b644d1d@intel.com>
Date: Fri, 9 Sep 2022 10:09:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWljaGFsIFByw612b3puw61r?=
 <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
 <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
 <YxmxVuYq2vqFgvqK@redhat.com>
 <CAFEAcA_wuKOTZN4u-Um4ya6_Ca7AnT-PW1nogrnwxUwfa6q6yQ@mail.gmail.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <CAFEAcA_wuKOTZN4u-Um4ya6_Ca7AnT-PW1nogrnwxUwfa6q6yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chenyi.qiang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 9/8/2022 6:54 PM, Peter Maydell wrote:
> On Thu, 8 Sept 2022 at 10:09, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Thu, Sep 08, 2022 at 09:53:44AM +0100, Peter Maydell wrote:
>>> On Thu, 8 Sept 2022 at 09:08, Chenyi Qiang <chenyi.qiang@intel.com> wrote:
>>>>
>>>> After updating linux headers to v6.0-rc, clang build on x86 target would
>>>> generate warnings like:
>>>>
>>>> target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
>>>> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
>>>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>>>          struct kvm_msrs info;
>>>>                          ^
>>>> target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
>>>> type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
>>>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>>>          struct kvm_cpuid2 cpuid;
>>>>                            ^
>>>> target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
>>>> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
>>>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>>>          struct kvm_msrs info;
>>>>                          ^
>>>>
>>>> Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
>>>> it is acceptable to turn off this warning, which is only relevant to people
>>>> striving for fully portable C code.
>>>
>>> Can we get the kernel folks to fix their headers not to
>>> use GCC extensions like this ? It's not a big deal for us
>>> I guess, but in general it doesn't seem great that the
>>> kernel headers rely on userspace to silence warnings...
>>
>> The kernel headers are fine actually - it is C99 compliant to have
>> a unsized array field in structs. eg
>>
>> The problem is in the QEMU code which is taking the kernel declared
>> struct, and then embedding it inside another struct. e.g. the
>> kernel exposes:
>>
>>    struct kvm_msrs {
>>          __u32 nmsrs; /* number of msrs in entries */
>>          __u32 pad;
>>
>>          struct kvm_msr_entry entries[];
>>    };
>>
>> which we then use as:
>>
>>    uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
>>    {
>>      struct {
>>          struct kvm_msrs info;
>>          struct kvm_msr_entry entries[1];
>>      } msr_data = {};
> 
> Hmm, and the kernel used to define the 'entries' field as 'entries[0]',
> which is the GNU 'zero-length-array' extension. So the kernel has
> switched to the C-standard-defined flexible array member. Those
> (unlike the GNU zero-length-array) have some extra restrictions
> like this "can't put the struct into another struct" one. So
> effectively we've moved from a GCC extension that clang doesn't
> complain about to one that it does complain about.
> 
>> IOW, our locally defined struct is just there to force a stack
>> allocation large enough for 1 kvm_msr_entry. A clever trick, but
>> requires that we turn off the CLang portability warning
> 
> I guess that's the most reasonable thing. Might be worth
> expanding on some of this in the commit message, though.
> 
> Also, this patch disabling the warning needs to come before
> the patch where the headers are updated; otherwise this will
> break bisection with clang.
> 

Indeed. If necessary, I would expand the commit message and send the 
next version.

> thanks
> -- PMM

