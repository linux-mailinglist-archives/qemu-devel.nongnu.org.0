Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AA587ADB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:41:47 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpLO-0006My-LD
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIpIL-00010E-7A
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:38:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:61022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIpII-0001u4-H5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659436714; x=1690972714;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yRO/Qak8meRaRYV429cR8sxpDUpVbz1fGwGn6gbLGuA=;
 b=LmSXvzofgkLovlkpcnnVIqCGjSdto/MlYIZiHOwfGzy5iiFHCyYDUtKb
 rVbWnxEF1QSAapYuRkALHR4kQNgNx0lgbOF4bjCLq8sfnIfTEOcE8JGGv
 LVHhBy2MsvgTStCmFBpJVAv65GcdJRrOMEiV6dc7oWmuTjZnNF2G3tR60
 yZMzgBCYGKxgEB1GUTNek7aDbEgpXcNxjLlD9D255yE9NvjzDybK3D+Da
 aP9Fg58LKDFtN3DUa42YFyA2N0U4Lv297MAoW7tAaMWgo/Vtjg7Wp2gZc
 Z5iVg8IC7bKLAhCxNRmgpItX5oByyNk22kkptTvPwFmHtcPFgSmxr274x A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290590920"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="290590920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:38:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="578172223"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.192])
 ([10.249.175.192])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:38:26 -0700
Message-ID: <8442ad7a-7c91-e5ba-3f12-c2e053290857@intel.com>
Date: Tue, 2 Aug 2022 18:38:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/40] *** HACK *** linux-headers: Update headers to
 pull in TDX API changes
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
 <20220802074750.2581308-2-xiaoyao.li@intel.com> <YujyyAeHMJaWOtR2@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <YujyyAeHMJaWOtR2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=xiaoyao.li@intel.com;
 helo=mga03.intel.com
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

On 8/2/2022 5:47 PM, Daniel P. Berrangé wrote:
> On Tue, Aug 02, 2022 at 03:47:11PM +0800, Xiaoyao Li wrote:
>> Pull in recent TDX updates, which are not backwards compatible.
>>
>> It's just to make this series runnable. It will be updated by script
>>
>> 	scripts/update-linux-headers.sh
>>
>> once TDX support is upstreamed in linux kernel.
> 
> I saw a bunch of TDX support merged in 5.19:
> 
> commit 3a755ebcc2557e22b895b8976257f682c653db1d
> Merge: 5b828263b180 c796f02162e4
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon May 23 17:51:12 2022 -0700
> 
>      Merge tag 'x86_tdx_for_v5.19_rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>      
>      Pull Intel TDX support from Borislav Petkov:
>       "Intel Trust Domain Extensions (TDX) support.
>      
>        This is the Intel version of a confidential computing solution called
>        Trust Domain Extensions (TDX). This series adds support to run the
>        kernel as part of a TDX guest. It provides similar guest protections
>        to AMD's SEV-SNP like guest memory and register state encryption,
>        memory integrity protection and a lot more.
>      
>        Design-wise, it differs from AMD's solution considerably: it uses a
>        software module which runs in a special CPU mode called (Secure
>        Arbitration Mode) SEAM. As the name suggests, this module serves as
>        sort of an arbiter which the confidential guest calls for services it
>        needs during its lifetime.
>      
>        Just like AMD's SNP set, this series reworks and streamlines certain
>        parts of x86 arch code so that this feature can be properly
>        accomodated"
> 
> 
> Is that sufficient for this patch, or is there more pending out of
> tree that QEMU still depends on ?

That's TDX guest support, i.e., running Liunx as TDX guest OS.

What QEMU needs is TDX KVM support and that hasn't been merged yet.

> With regards,
> Daniel


