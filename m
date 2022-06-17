Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7A54EF64
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 04:55:32 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o228x-0007CY-5W
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 22:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o227a-0006XZ-4R
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 22:54:06 -0400
Received: from mga06b.intel.com ([134.134.136.31]:52038 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o227X-0002r2-7l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 22:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655434443; x=1686970443;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kehvOA+WlcYi0NDK62FCoRHgqD2//OQ6m2ORscGLBRo=;
 b=lg0Ax6UhXE4POWZsyvHBFGQp4sSeLf0CcTwQaR2n0U7p3SBGRdFXjAUH
 3GNa0WpIg7tP94gRtj6wc8UpVeG9KHixcMSW6JLmKp/LFftFTJvI4zG24
 a2Ke9iPLYBtU3nVRExjqoVvQEkaLXAvQo/3mqfVzIiH2HWFPV+5jj6v/E
 whodrnOwwoQnCdRMcbsWjMaUChpkyYMG8AGxCWhOioS9puCNoKxNBA2P3
 XANuqqCXCTTWrHVxO/cAlHNw8XxQPSupIRAHYyTIXp925KkozMkvYcpf7
 NkP+r7ZW2UifO7vieYWQ9V+btVDvCVcchjqFnmdmgyTAlf9ivgNzLuSId g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341059196"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341059196"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 19:53:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="589924799"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.92])
 ([10.255.29.92])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 19:53:48 -0700
Message-ID: <503fadf7-c6d1-61dd-236e-fcca895e8aef@intel.com>
Date: Fri, 17 Jun 2022 10:53:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: New "IndustryStandard" fw_cfg?
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Xu, Min M" <min.m.xu@intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>, "Aktas, Erdem"
 <erdemaktas@google.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
 <20220616082846.wtmf3wbxzilzvqt4@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220616082846.wtmf3wbxzilzvqt4@sirius.home.kraxel.org>
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

On 6/16/2022 4:28 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> After re-read and re-think, I think the problem is better to state as: we
>> need an interface for QEMU to tell OVMF how much memory it needs to accept,
>> from [Minimum to All]. So for the case that user wants to boot an
>> partial-enabled confidential VMs (like current Linux TDX and SNP guest),
>> user needs to specify from QEMU to tell OVMF to accept all the memory.
> 
> Asking the user to manually configure stuff sucks, that's why I think
> it makes sense to let firmware and guest negotiate this automatically.
> 
> That doesn't work today though, so we will need some config option
> indeed.
> 
> The proposal in the parallel thread is to just accept all low memory
> (below 4G) unconditionally.  So maybe it is enough to have:
> 
>    * accept all memory below 4G
>    * accept all memory
> 
> Possibly we need:
> 
>    * accept all memory below 4G
>    * accept all memory below 4G, plus x GB of high memory.
>    * accept all memory
> 
> In any case the config option should be designed in a way that we can
> add a 'automatic' choice later, i.e. we can have ...
> 
>    * automatic (default)
>    * accept all memory below 4G
>    * accept all memory
> 
> ... once the automatic negotiation is available.

IMO, basically, we need two options:

1. accept all memory, for the case that guest OS cannot handle 
unaccepted memory;

2. accept minimal memory, for the case that guest OS is capable of
accepting memory.

    Accepting memory is time consuming. To save as much time as possible,
    OVMF only needs to accept:

    a. the enough memory for its own code running;

    b. the enough memory for guest OS to setup everything ready to accept
       memory on guest own. e.g.,

       i.  the memory where guest kernel locates;
       ii. the stack/heap/memory buffer, from which guest kernel needs
           to allocate memory

    As long as both a) and b) are meet, we can accept as less as possible
    to save the time OVMF is running.

    Min did some POC on this for TDX, that accepts 256M/128M (I don't
    remember the exact number) in OVMF for guest kernel to operate
    normally and guest can accept remaining unaccepted memory on its own.

More flexible, we can provide a 3) option, that guest tells OVMF the GPA 
ranges that need to be accepted by OVMF.

> take care,
>    Gerd
> 


