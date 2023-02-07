Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534668CD37
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 04:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPERM-0006oX-49; Mon, 06 Feb 2023 22:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pPERJ-0006ni-OI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 22:14:37 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pPERG-00023q-SY
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 22:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675739674; x=1707275674;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=wFuJOcRnxhNvPh971ghasLO8hPjes4GazDUTK1Ezf8A=;
 b=hDXLFRXbk6sbsz/O4r8DxU9BIzxkHsU9cfL27kzZJWdYY1FqhkpHJ3C8
 6Jqn5asiHzuh8/3PJ3c4jNHf5wzakarQyoVGn3EzWjgDDRB1MYrwTBKsX
 /86ttiBL7adot2CPZIdgzevGhljL7e7rDJNPYIMXWdUgVm3P5SSt6FXyL
 OD8cAwO5F8W/yRDt7kPrOdkVZ3pCz+/oiw4bof+wjYRxJMRHHdGBYLw6A
 hvixXJQqfhB3MIB7byrwxHAXSpWxwWDwrFCE4P2l4I93mGM5EP3a5RrAK
 vMkFS/XeI77tVlR9xJGwxo7XGipmSLq1/gNAyzDw4KYTlFQahbHXemUkp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="415605573"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="415605573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 18:51:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840605633"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="840605633"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.95])
 ([10.238.212.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 18:50:58 -0800
Message-ID: <22fde3ed-a4e7-db65-2e8a-ce6346fe6ac0@intel.com>
Date: Tue, 7 Feb 2023 10:50:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
From: "Wang, Lei" <lei4.wang@intel.com>
Subject: Re: [PATCH v3 0/6] Support for new CPU model SapphireRapids
To: Igor Mammedov <imammedo@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230202120533.37972585@imammedo.users.ipa.redhat.com>
Content-Language: en-US
In-Reply-To: <20230202120533.37972585@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei4.wang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 2/2/2023 7:05 PM, Igor Mammedov wrote:
> On Fri,  6 Jan 2023 00:38:20 -0800
> Lei Wang <lei4.wang@intel.com> wrote:
> 
>> This series aims to add a new CPU model SapphireRapids, and tries to
>> address the problem stated in
>> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
>> so that named CPU model can define its own AMX values, and QEMU won't
>> pass the wrong AMX values to KVM in future platforms if they have
>> different values supported.
>>
>> The original patch is
>> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.
> 
> MultiBitFeatureInfo looks like an interesting
> idea but among fixing whatever issues this has atm,
> you'd probably need to introduce a new  qdev_bitfield property
> infrastructure so that such features could be treated like any
> other qdev properties.
> Also when MultiBitFeatureInfo is added, one should convert all
> other usecases where it's applicable (not only for new code)
> so that we would end up with consolidated approach instead of
> zoo mess.
> 
> I'm not sure all MultiBitFeatureInfo complexity is necessary
> just for adding a new CPU model, I'd rather use ad hoc approach
> that we were using before for non boolean features.

Hi, Igor. I do not quite understand what does the "ad hoc approach" mean,
currently if we specify a multi-bit non-boolean CPUID value which is different
from the host value to CPU model, e.g., consider the following scenario:

- KVM **ONLY** supports value 5 (101) and,
- QEMU user want to pass value 3 (011) to it,

and follow the current logic:

    uint64_t unavailable_features = requested_features & ~host_feat;

then:

1. The warning message will be messy and not intuitive:

requested_features bit 1 is 1 and host_feat bit 1 is 0, so it will warn on this
non-sense bit.


2. Some CPUID bits will "leak" into the final CPUID passed to KVM:

requested_features bit 0 is 1 and host_feat bit 0 is also 1, so it will pass
this CPUID bit to host, the request_features value is 3 (011), finally we get 1
(001), this is not we want.

Am I understanding it correctly?

> 
> And then try to develop MultiBitFeatureInfo & co as a separate
> series to demonstrate how much it will improve current
> cpu models definitions.
> 
> PS:
>  'make check-acceptance' are broken with this
> 
>> ---
>>
>> Changelog:
>>
>> v3:
>>  - Rebase on the latest QEMU (d1852caab131ea898134fdcea8c14bc2ee75fbe9).
>>  - v2: https://lore.kernel.org/qemu-devel/20221102085256.81139-1-lei4.wang@intel.com/
>>
>> v2:
>>  - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
>>    unsupported.
>>  - Remove unnecessary function definition and make code cleaner.
>>  - Fix some typos.
>>  - v1: https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t
>>
>>
>> Lei Wang (6):
>>   i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
>>   i386: Remove unused parameter "uint32_t bit" in
>>     feature_word_description()
>>   i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
>>     features
>>   i386: Mask and report unavailable multi-bit feature values
>>   i386: Initialize AMX CPUID leaves with corresponding env->features[]
>>     leaves
>>   i386: Add new CPU model SapphireRapids
>>
>>  target/i386/cpu-internal.h |  11 ++
>>  target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
>>  target/i386/cpu.h          |  16 ++
>>  3 files changed, 322 insertions(+), 16 deletions(-)
>>
>>
>> base-commit: d1852caab131ea898134fdcea8c14bc2ee75fbe9
> 

