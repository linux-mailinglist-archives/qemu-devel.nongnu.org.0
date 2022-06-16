Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385C54DA07
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 07:52:22 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1iQX-0006vP-65
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 01:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1iNg-0005IN-DE
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 01:49:27 -0400
Received: from mga17.intel.com ([192.55.52.151]:26675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o1iNd-00012f-Op
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 01:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655358561; x=1686894561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7q+liQpaS4RSq+Y+sPm5n+V8v8CGLONlUm/40d4Ij3Q=;
 b=ANB64+T+a1LsolE5CEzX3HlyClBS9R1uKhbRRKtoZEYwEOZdocEMA7vH
 SZAlxrHM33KAr6BZPGx3WARj4z2AU9Q3vTTLA1COQVcJt7xRrUBD2ZA+2
 vOYB/MUuQhdAPwW299AMG68exMiZEB1NCLLcE0i/qBFqpNAdgM1/wUPzz
 MMoHKaXAIlTTkCexzQjkipxA8ztNpeDUUwJsuNa/2Z7hy3bDZE0XPx+Dt
 ZdsH/ZRHkem9622//mCSwsbmWxDjoYmHA5E58SCN2+ou8nc9lJzIfDHMh
 bCNXeS9RFqTM7OSngMpgYw1J3vxy6ovVHCvCMcUpyAhCiVEI/YyU8v3vo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259635635"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="259635635"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:49:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="831415172"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.162])
 ([10.249.169.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:49:13 -0700
Message-ID: <6c2f350c-61eb-825d-36b7-86c913e610b3@intel.com>
Date: Thu, 16 Jun 2022 13:49:11 +0800
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
 <843cb055-d28e-1753-5dd5-9d4565171084@intel.com>
 <20220616053741.strgwe3mx3adxzui@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220616053741.strgwe3mx3adxzui@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
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

On 6/16/2022 1:37 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> Per my understanding, Unaccepted Memory in UEFI is introduced for
>> confidential VMs, i.e., for Intel TDX and AMD SEV-SNP. The only reason
>> UEFI/OVMF reports "Unaccepted Memory" to OS, is a confidential VM is
>> desired.
> 
> No.  Reporting "Unaccepted Memory" to the OS is not a hard requirement
> for confidential VMs, it only optimizes boot times.  Instead of doing
> that time-consuming process in the firmware for all memory we tell the
> guest OS which memory is accepted already and which is not.  So the
> guest OS can go accept the remaining memory in a background process.

But for non-confidential VMs, even a range of memory is reported as 
unaccepted nothing prevents it from being accessed without accepting it, 
and it's not time-consuming. Did I miss anything?

> take care,
>    Gerd
> 


