Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9154DACF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 08:39:20 +0200 (CEST)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1j9y-00028u-VO
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 02:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1j4a-0000cz-2J
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 02:33:46 -0400
Received: from mga06b.intel.com ([134.134.136.31]:29135 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1j4X-0003IZ-19
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 02:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655361220; x=1686897220;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=14eXm+vYVl6RkXQqMQxdS3FEgcWqyDNa7FfqsMkcnec=;
 b=PDtnhbwkCV48O+dILipRyGn/FJx6ZYfe0jvlr7AUTbXA1iwcgHg6WjqX
 cFBRZmtSaLLB+G3IfSxKuTJvfwEQcIlInROfJZzLN6H9/J8ylrEUroBA2
 9mahQH4x+54sd4DlW7N8vSk4/o3DmJk+U8IrvrVZ044MX70sxiY2bMxzh
 /jbNnW0NUg9CekDR8hIXZoQnAi5qaJzoWuazm8xpsvvmpR2ffDksaeKoe
 4FD4o6/CiIBgMGbNNryNiBYrjbz+eAyd36+DrGhY0RJKwIuq4DfsfZLWF
 vuq4AWYv7IE5kE+NJ6WiFb8DEEobnyn9rx8tkmYxaHOV71vDWqTN67pEt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340834519"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="340834519"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:33:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="831428108"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.162])
 ([10.249.169.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:33:30 -0700
Message-ID: <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
Date: Thu, 16 Jun 2022 14:33:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: New "IndustryStandard" fw_cfg?
Content-Language: en-US
To: "Xu, Min M" <min.m.xu@intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Aktas, Erdem" <erdemaktas@google.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/15/2022 8:46 AM, Xu, Min M wrote:
> I would like to add more engineers (Confidential Computing Reviewers in EDK2 community and Intel's QEMU engineers) in this mail thread.
> 
>> -----Original Message-----
>> From: Dionna Amalie Glaze <dionnaglaze@google.com>
>> Sent: Wednesday, June 15, 2022 2:09 AM
>> To: qemu-devel@nongnu.org
>> Cc: Xu, Min M <min.m.xu@intel.com>; Lendacky, Thomas
>> <Thomas.Lendacky@amd.com>
>> Subject: New "IndustryStandard" fw_cfg?
>>
>> Hi y'all, I'm Dionna. I work on Confidential VMs at Google Cloud. I've been
>> keeping up with the TDX and SEV-SNP developments in OVMF and Linux,
>> and some in Qemu.
>>
>> There's a new UEFI feature in v2.9 of the specification (March 2021) that
>> allows for memory ranges to be classified as "unaccepted", since both TDX
>> and SEV-SNP require that the guest VM accept any host-made changes to
>> page state. We should expect newer technologies on non-x86 architectures
>> to require memory acceptance as well. Operating systems are not
>> necessarily going to support this memory type, however.
>>
>> This leads to a problem: how does the UEFI know that the OS it's going to
>> boot will support unaccepted memory? 

After re-read and re-think, I think the problem is better to state as: 
we need an interface for QEMU to tell OVMF how much memory it needs to 
accept, from [Minimum to All]. So for the case that user wants to boot 
an partial-enabled confidential VMs (like current Linux TDX and SNP 
guest), user needs to specify from QEMU to tell OVMF to accept all the 
memory.

> Right now we (Google Compute
>> Engine) have a system of "tagging" for guest image providers to state that
>> their OS supports some new feature so that we can enable appropriate
>> configurations for certain images.
>>
>> I could go about adding a Google-specific fw_cfg file path and definition to
>> tell our custom OVMF build to use unaccepted memory or not, but I
>> personally prefer open source. I don't know y'all's process though, so I'm
>> asking before making a patch set.
>>
>> There are two approaches I've considered.
>>
>> 1. An arch-specific config key for a u64 value:
>>
>> The idea would be that I would add QemuFwCfgItemUnacceptedMinimum =
>> 0x8005 here
>> https://github.com/tianocore/edk2/blob/master/OvmfPkg/Include/Industry
>> Standard/QemuFwCfg.h#L50
>>
>> For Qemu, the main code I see for adding config is here, but I'm not sure
>> what y'all's preferred external configuration method is to get a value from an
>> invocation (flag, config file, etc) to fw_cfg.c:
>> https://github.com/qemu/qemu/blob/58b53669e87fed0d70903e05cd42079
>> fbbdbc195/hw/i386/fw_cfg.c#L95
>>
>> We'd add something like
>>
>> fw_cfg_add_u64(fw_cfg, FW_CFG_MINIMUM_ACCEPTED_MEMORY_SIZE,
>> ms->minimum_accepted_memory_size);
>>
>> where FW_CFG_MINIMUM_ACCEPTED_MEMORY_SIZE is #defined as
>> FW_CFG_ARCH_LOCAL + 5 in
>> https://github.com/qemu/qemu/blob/266469947161aa10b1d36843580d36
>> 9d5aa38589/hw/i386/fw_cfg.h
>>
>> The name has "minimum" in it since the firmware can choose to accept
>> more than the minimum, and specifically interpret 0 as UINT64_MAX.
>>
>> 2. A "well-known" file path to be included in the file slots starting at 0x0020,
>> such as "etc/min_accepted_mem_size", still plumbed through like in 1.
>>
>> Thanks!
>>
>> --
>> -Dionna Glaze, PhD (she/her)


