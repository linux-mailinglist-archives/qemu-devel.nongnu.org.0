Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0135587B23
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:59:03 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpc5-0000lM-DK
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIpZB-0005ZM-9d
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:56:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:21463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIpZ8-0003mK-UY
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659437758; x=1690973758;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vZz9mzuhpu3zRjEhVt6UxN62+bj06C97CVbwXNC20bk=;
 b=MhC6AJzvcrDP3+zzzsaQpyGaYG2e58g0yRhSQcaif6Cept0k/n3U4Q/i
 2jw+9e06j5Vb+RPG3h4l3BAlCtZZVekMG2qIXu/8FDh1FA86MvyaBjFoi
 OgWATq6AH1u5VKq1bYLnK9ria6yFkoT9u0FadDO9O5TPDj89sMeiRhNvA
 MDVXjpqm74kMsKq37TahYWsD7dZ6f50hpAPN39CEMZOR7XV8ouslEUMwp
 73cYddbUIJWfWW8p0PTFP2UroMaqJt0D6BMWm9Wm0D+Gpxx/MGfy4z/8P
 t/UMuZ7EfwgJJNr9XHvgZI0QAdk2ZmuPbmO3Myt8ymdFp1NU2e/D9tSDn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286939994"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286939994"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:55:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="578175803"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.192])
 ([10.249.175.192])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:55:51 -0700
Message-ID: <db14e4f1-6090-7f97-f690-176ba828500c@intel.com>
Date: Tue, 2 Aug 2022 18:55:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v1 00/40] TDX QEMU support
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <YujzOUjMbBZRi/e6@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <YujzOUjMbBZRi/e6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/2022 5:49 PM, Daniel P. Berrangé wrote:
> On Tue, Aug 02, 2022 at 03:47:10PM +0800, Xiaoyao Li wrote:

>> - CPU model
>>
>>    We cannot create a TD with arbitrary CPU model like what for non-TDX VMs,
>>    because only a subset of features can be configured for TD.
>>    
>>    - It's recommended to use '-cpu host' to create TD;
>>    - '+feature/-feature' might not work as expected;
>>
>>    future work: To introduce specific CPU model for TDs and enhance +/-features
>>                 for TDs.
> 
> Which features are incompatible with TDX ?

TDX enforces some features fixed to 1 (e.g., CPUID_EXT_X2APIC, 
CPUID_EXT_HYPERVISOR)and some fixed to 0 (e.g., CPUID_EXT_VMX ).

Details can be found in patch 8 and TDX spec chapter "CPUID virtualization"

> Presumably you have such a list, so that KVM can block them when
> using '-cpu host' ? 

No, KVM doesn't do this. The result is no error reported from KVM but 
what TD OS sees from CPUID might be different what user specifies in QEMU.

> If so, we should be able to sanity check the
> use of these features in QEMU for the named CPU models / feature
> selection too.

This series enhances get_supported_cpuid() for TDX. If named CPU models 
are used to boot a TDX guest, it likely gets warning of "xxx feature is 
not available"

We have another series to enhance the "-feature" for TDX, to warn out if 
some fixed1 is specified to be removed. Besides, we will introduce 
specific named CPU model for TDX. e.g., TDX-SapphireRapids which 
contains the maximum feature set a TDX guest can have on SPR host.

> 
> With regards,
> Daniel


