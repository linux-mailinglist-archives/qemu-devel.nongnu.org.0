Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25954CD2E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:39:17 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V6x-0008Np-AQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1Una-0002Gg-GZ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:19:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1UnX-0001sR-Ss
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655306351; x=1686842351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ta1M9KEZeaRp35ixdb6DGWIuZ/W7w33x+Uz57J7Fun0=;
 b=jHxZXkSLQRZhjYw9tEBEzUgTHq4WHsWdmYteT+JrQv9qtYjqRkQ4SEsW
 Qggie51Zm5WVUVaod93mGKLkw5VWjj5HzHWdLgDjaP/IK0vc6aBO0U58c
 yETxi8yxCsPLltPTBkq6jQa+atY+hRaf/SlZIQ+U1cma2/fvnW18BXVef
 gNqKjLYKGsBL6To1zcUnTXEVEUm8rJ955gAVybrO/remaEIMxmvxvn8OM
 crTAaCwquVVdPCC+rW0U2o3QX2/fJugAFqRfMOuMyEO351RcmnK84+fTL
 /MYB8+W/+zEtiZi7k9scELMMJwOUKNpJlHNHkxbxdG/cO5tnX890Ozdkw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258849936"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="258849936"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 08:19:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="589173688"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.10])
 ([10.255.29.10])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 08:19:06 -0700
Message-ID: <843cb055-d28e-1753-5dd5-9d4565171084@intel.com>
Date: Wed, 15 Jun 2022 23:19:01 +0800
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Why does UEFI need to know it?

Per my understanding, Unaccepted Memory in UEFI is introduced for 
confidential VMs, i.e., for Intel TDX and AMD SEV-SNP. The only reason 
UEFI/OVMF reports "Unaccepted Memory" to OS, is a confidential VM is 
desired. Thus, the (guset) OS has to be enlightened to know how to 
handle unaccepted memory. And of course, the non-confidential 
enlightened OS, e.g., old linux kernel, fails boot/hits issue if it 
doesn't support unaccepted memory.


