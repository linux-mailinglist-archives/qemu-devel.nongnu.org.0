Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6E50AD03
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:02:02 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhgP-0002f7-E9
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nhhVi-0004fO-9k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:50:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:54211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nhhVe-0007Ey-Hd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650588654; x=1682124654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2AzYSvm6f/r5I1M27+zDDYbAvGE5Tb/Dgpxxuk8GRXs=;
 b=NLyRHTo4X4Nku2k2KLLEnX3O+C+3eHNyD3WyCKzEVCFp6+cfqqJeHsHA
 MRclGqcSn73H9Gnx5yp3kvL4Uis3aveBKyzvVo0yroEC41zOr2KgeIY8X
 6/Koi45VSHYDNeHIr0AgMpbZAZISOTyx3Jq2oIoaNFqkahsXXmjH+c6pN
 92cruZL4MNxgBYSMlDemWoXEYh7qXyCenSlbszNAICrLhXpBKdBAjdWJF
 f/YwvgFQ4B00CG8yWMZQOMOfUEny0BZgwIbDzreydhkvQNBbVD3dHZicQ
 4qkxLoHN7L+LXkCf5miLihqQT9lTkbtlBBScYdRNXzifcJUwFdUfXWqbw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263375556"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="263375556"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 17:50:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="577564376"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.55])
 ([10.255.28.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 17:50:47 -0700
Message-ID: <37534451-b4b6-4547-a43b-ca0965b384d4@intel.com>
Date: Fri, 22 Apr 2022 08:50:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of
 common x86 base machine type
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
 <20220310080630-mutt-send-email-mst@kernel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220310080630-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 9:07 PM, Michael S. Tsirkin wrote:
> On Thu, Mar 10, 2022 at 08:28:09PM +0800, Xiaoyao Li wrote:
>> For PIT, it's straightforward to merge microvm::pit and
>> pc_machine::pit_enabled into x86ms::pit
>>
>> For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
>> ability to dis-/en-able PIC and it's the preparation for future TDX
>> support.
> 
> 
> Looks ok but we are in freeze. I will tag this but pls do ping me
> after the release to make sure it's not lost. Thanks!

Michael,

Hope they won't get lost :)

>> ---
>> Resend:
>>   - collect Reviewed-by;
>>   - rebase to 2048c4eba2b4 ("Merge remote-tracking branch 'remotes/philmd/tags/pmbus-20220308' into staging")
>>
>> Xiaoyao Li (2):
>>    hw/i386: Make pit a property of common x86 base machine type
>>    hw/i386: Make pic a property of common x86 base machine type
>>
>>   hw/i386/microvm.c         | 54 ++-------------------------------------
>>   hw/i386/pc.c              | 24 +++--------------
>>   hw/i386/pc_piix.c         |  4 ++-
>>   hw/i386/pc_q35.c          |  4 ++-
>>   hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
>>   include/hw/i386/microvm.h |  4 ---
>>   include/hw/i386/pc.h      |  2 --
>>   include/hw/i386/x86.h     |  4 +++
>>   8 files changed, 65 insertions(+), 81 deletions(-)
>>
>> -- 
>> 2.27.0
> 


