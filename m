Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8D5E7FA0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:23:21 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblSS-0005uD-16
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1obl7S-0002nd-48
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:01:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:29374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1obl7P-0001K1-3V
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663948895; x=1695484895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sJ2DSmydkKQTvr55SPm68vrM1cqha/06Gku1h1HMiiY=;
 b=dY8vzbbHQB4ivEbA3zt9fWlrU1XiJBpoM3nWT5rNklhYtqFy2C5VvRty
 0Q/X5dd52Gp5KLZ5P7Nuxdx3GpBVg1nHF61M//FoVr7WT2b2y5EURGcbV
 gLEOa4HJTExDjX1MoxQ5tnqVsJkupQCr3kC/W19uSzuZVqY9acCSWO8h3
 CqW6hoPQBlB312xuLnn5ZBHT4E/yYoJzWHvvbG45Y8HQpESUJLV8ycGAk
 JMDwSmRu11hL01d5cJc8KDBFqite4lTGCAitdf22v2R4IHu72hxiT+0DM
 LQUNDDDiaoPOGW1YPXhJLJkoZY6EAAckW9M0GqAPbQTr0WWxVkzDNTOJW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="280985879"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="280985879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 09:01:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="795545703"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.238])
 ([10.255.29.238])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 09:01:20 -0700
Message-ID: <b1f238c6-ab3d-eb8f-d1b4-dbdf342c002c@intel.com>
Date: Sat, 24 Sep 2022 00:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Content-Language: en-US
To: Yang Zhong <yang.zhong@linux.intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Wang, Lei" <lei4.wang@intel.com>, paul.c.lai@intel.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, robert.hu@intel.com,
 chenyi.qiang@intel.com
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm> <Yy21A2CWzrS3SIzH@yangzhon>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <Yy21A2CWzrS3SIzH@yangzhon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/2022 9:30 PM, Yang Zhong wrote:
> On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
>> * Wang, Lei (lei4.wang@intel.com) wrote:
>>> The new CPU model mostly inherits features from Icelake-Server, while
>>> adding new features:
>>>   - AMX (Advance Matrix eXtensions)
>>>   - Bus Lock Debug Exception
>>> and new instructions:
>>>   - AVX VNNI (Vector Neural Network Instruction):
>>>      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
>>>      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
>>>      - VPDPWSSD: Multiply and Add Signed Word Integers
>>>      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
>>>   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
>>>     using FP16 instead of FP32 for ~2X performance gain
>>>   - SERIALIZE: Provide software with a simple way to force the processor to
>>>     complete all modifications, faster, allowed in all privilege levels and
>>>     not causing an unconditional VM exit
>>>   - TSX Suspend Load Address Tracking: Allows programmers to choose which
>>>     memory accesses do not need to be tracked in the TSX read set
>>>   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
>>>     inputs and conversion instructions from IEEE single precision
>>>
>>> Features may be added in future versions:
>>>   - CET (virtualization support hasn't been merged)
>>> Instructions may be added in future versions:
>>>   - fast zero-length MOVSB (KVM doesn't support yet)
>>>   - fast short STOSB (KVM doesn't support yet)
>>>   - fast short CMPSB, SCASB (KVM doesn't support yet)
>>>
>>> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
>>> Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
>>
>> Hi,
>>     What fills in the AMX tile and tmul information leafs
>> (0x1D, 0x1E)?
>     
>>    In particular, how would we make sure when we migrate between two
>> generations of AMX/Tile/Tmul capable devices with different
>> register/palette/tmul limits that the migration is tied to the CPU type
>> correctly?
>>    Would you expect all devices called a 'SappireRapids' to have the same
>> sizes?
>>
> 
>     There is only one palette in current design. This palette include 8
>     tiles.  Those two CPUID leafs defined bytes_per_tile, total_tile_bytes,
>     max_rows and etc, the AMX tool will configure those values into TILECFG with
>     ldtilecfg instrcutions. Once tiles are configured, we can use
>     tileload instruction to load data into those tiles.
> 
>     We did migration between two SappireRapids with amx self test tool
>     (tools/testing/selftests/x86/amx.c)started in two sides, the migration
>     work well.
> 
>     As for SappireRapids and more newer cpu types, those two CPUID leafs
>     definitions are all same on AMX.

I'm not sure what definitions mean here. Are you saying the CPUID values 
of leaf 0x1D and 0x1E won't change for any future Intel Silicion?

Personally, I doubt it. And we shouldn't take such assumption unless 
Intel states it SDM.

> So, on AMX perspective, the migration
>     should be workable on subsequent cpu types. thanks!

I think what Dave worried is that when migrating one VM created with 
"SapphireRapids" model on SPR machine to some newer platform in the 
future, where the newer platform reports different value on CPUID leaves 
0x1D and 0x1E than SPR platform.

I think we need to contain CPUID leaves 0x1D and 0x1E into CPU model as 
well. Otherwise we will hit the same as Intel PT that SPR reports less 
capabilities that ICX.



