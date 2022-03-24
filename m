Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454994E656B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 15:38:40 +0100 (CET)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXObi-0004b9-K4
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 10:38:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXOaD-0003gS-Ht
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:37:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:50418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXOaB-0001bY-Fj
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648132619; x=1679668619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kuUZZE3Y+2nYQ+xUdxnV5mXzvQrIWXlqswvHHABl52o=;
 b=kdspzDJ68W7mk3tWdkicVgHsMIux/clHKeP3nUhudorw29rPP62v78zQ
 vXCfcVAI8FOvM83IWtSsrPkRrE8tG8eKRM31scKlg3bdD3aPxpHFuG4vY
 TVFTwCBJCyquMXO5IChMJjYcCGhWm+7RkJAyyn2qZK7lRKa0tBENwhJH8
 ZnPd7HxGvnvDFg3Kl8dJk1LSLB52Q7xeZC2jEc4LYsmR5219OQZW+kkbw
 p+zhGYLxCdUqllB58GKfd6JnI8i6kAp5k7wudyGt9I6JiJqMCPmnw+N/p
 GcXFgRMmvLcNh1qJu99ymP9Ul9trGQh0u/pBmBZtPf1tHRNGboGvBIgBC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="319099860"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="319099860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 07:36:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="561397107"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.242])
 ([10.255.29.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 07:36:53 -0700
Message-ID: <b8ea630c-cbd8-80f4-1acc-396f1665dfba@intel.com>
Date: Thu, 24 Mar 2022 22:36:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-13-xiaoyao.li@intel.com>
 <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
 <b452d357-8fc2-c49c-8c19-a57b1ff287e8@intel.com>
 <20220324075703.7ha44rd463uwnl55@sirius.home.kraxel.org>
 <4fc788e8-1805-c7cd-243d-ccd2a6314a68@intel.com>
 <20220324093725.hs3kpcehsbklacnj@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220324093725.hs3kpcehsbklacnj@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/2022 5:37 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> #VE can be triggered in various situations. e.g., CPUID on some leaves, and
>> RD/WRMSR on some MSRs. #VE on pending page is just one of the sources, Linux
>> just wants to disable this kind of #VE since it wants to prevent unexpected
>> #VE during SYSCALL gap.
> 
> Linux guests can't disable those on their own?  Requiring this being
> configured on the host looks rather fragile to me ...

Yes, current TDX architecture doesn't allow TD guest to do so. Maybe in 
the future, it can be allowed, maybe.

> take care,
>    Gerd
> 


