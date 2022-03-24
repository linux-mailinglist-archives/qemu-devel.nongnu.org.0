Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380574E6006
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:11:45 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIZL-0008Nd-Dn
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:11:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXIWF-0007B9-5M
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:08:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:25338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXIWC-0000dP-R5
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648109308; x=1679645308;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uPTzAkK8QVodgv3adJZUTJY9obszEJVCmExS1Li424A=;
 b=RsrtDg/GwIFVp/Rk2n4VV5DQ+M5MHfgB0yh/2fU2z2Wsa+Mw8+pqfL+c
 RTFSFqoSp3ZuULzbyKTdR/JyslEYYm9QswPvejSLk/Q91YGstNUff7s3D
 fjac3bAsZDKY80vEeKLFYV8q3dVtcHYRK/792dG/grNz0yGjQcwe+sh0r
 i2rHQuTp06sCseZXkBWUTeCW0iTEDeH54gmPtQ1rva7ouxf8/gXy+8QOc
 IMgsw6nZYyw+UlcOxFA6aYFz6yyFXvnJ95HnomGXZHj8KDd8Wwen6n09T
 V1PCJJTrsuCCcJ26azBj1hpWUgG5cnhOr+XKTgOlupXOagJuScalpmdkS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258502148"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="258502148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:08:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561270484"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.201.150])
 ([10.249.201.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:08:19 -0700
Message-ID: <4fc788e8-1805-c7cd-243d-ccd2a6314a68@intel.com>
Date: Thu, 24 Mar 2022 16:08:17 +0800
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
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220324075703.7ha44rd463uwnl55@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/24/2022 3:57 PM, Gerd Hoffmann wrote:
> On Thu, Mar 24, 2022 at 02:52:10PM +0800, Xiaoyao Li wrote:
>> On 3/22/2022 5:02 PM, Gerd Hoffmann wrote:
>>> On Thu, Mar 17, 2022 at 09:58:49PM +0800, Xiaoyao Li wrote:
>>>> Add sept-ve-disable property for tdx-guest object. It's used to
>>>> configure bit 28 of TD attributes.
>>>
>>> What is this?
>>
>> It seems this bit doesn't show up in the public spec yet.
>>
>> Bit 28 (SEPT_VE_DISABLE): Disable EPT violation conversion to #VE ON guest
>> TD ACCESS of PENDING pages.
>>
>> The TDX architecture requires a private page to be accepted before using. If
>> guest accesses a not-accepted (pending) page it will get #VE.
>>
>> For some OS, e.g., Linux TD guest, it doesn't want the #VE on pending page
>> so it will set this bit.
> 
> Hmm.  That looks rather pointless to me.  The TDX patches for OVMF add a
> #VE handler, so I suspect every guest wants #VE exceptions if even the
> firmware cares to install a handler ...

#VE can be triggered in various situations. e.g., CPUID on some leaves, 
and RD/WRMSR on some MSRs. #VE on pending page is just one of the 
sources, Linux just wants to disable this kind of #VE since it wants to 
prevent unexpected #VE during SYSCALL gap.

> Also: What will happen instead? EPT fault delivered to the host?

Yes.

> take care,
>    Gerd
> 


