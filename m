Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61125A14C8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:47:29 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE8m-0004sd-OZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRE4F-0005Te-Sk
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:42:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:55781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRE4C-0006kx-JC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661438564; x=1692974564;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZVTIjYVchpIcQqqc0ZaCjQcEwojmXfhbS+FFEpZPwJM=;
 b=jblth2qvh7ESGPB1ZMt3ipEpBfZiqv8ir5iQ0ktHtyRsjw5fS5qXZraL
 1wkCCWEcTEfBLtw3dtRkX/fKyjG4OOsDsVx/DK3jGcUeZDsxYjH4zZVRe
 H/UUQ/Ay/St+1AS7xTv8FoKqK8nJQcLl0uDF0iwO2POQov+THlnHg2DfQ
 kqgmunCs30E8qjmy0XG37UxAafAsl6jstS2cutumrVSC/KV2JQcoz0oh2
 VJiZkJc/VQHzwQHms6j/pm9m0q76FDGALtPHiBX3ojpiubFKPXg5qVK1u
 KFJgQ3qaI+NsII7M13Yft95h6jto+Paosjiu+nnh7nwTNGyxHACk4rrul w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281222840"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="281222840"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:42:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671011415"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.55])
 ([10.255.29.55])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:42:36 -0700
Message-ID: <389a2212-56b8-938b-22e5-24ae2bc73235@intel.com>
Date: Thu, 25 Aug 2022 22:42:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v1 15/40] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-16-xiaoyao.li@intel.com>
 <20220825113636.qlqmflxcxemh2lmf@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220825113636.qlqmflxcxemh2lmf@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/25/2022 7:36 PM, Gerd Hoffmann wrote:
> On Tue, Aug 02, 2022 at 03:47:25PM +0800, Xiaoyao Li wrote:
>> Bit 28, named SEPT_VE_DISABLE, disables	EPT violation conversion to #VE
>> on guest TD access of PENDING pages when set to 1. Some guest OS (e.g.,
>> Linux TD guest) may require this bit set as 1. Otherwise refuse to boot.
> 
> --verbose please.  That somehow doesn't make sense to me.
> 
> A guest is either TDX-aware (which should be the case for linux 5.19+),
> or it is not.  My expectation would be that guests which are not
> TDX-aware will be disturbed by any #VE exception, not only the ones
> triggered by EPT violations.  So I'm wondering what this config bit
> actually is useful for ...

This bit, including other properties of tdx-guest object, are supposed 
to be configured for TD only. On VM creation phase, user needs to decide 
if it's a TD (TDX VM) or non-TD (previous normal VM) by attaching 
tdx-guest object or not.

If it's a TD when VM creation, but the guest kernel is not 
TDX-capable/-aware, it's doomed to fail booting.

For TD guest kernel, it has its own reason to turn SEPT_VE on or off. 
E.g., linux TD guest requires SEPT_VE to be disabled to avoid #VE on 
syscall gap [1]. Frankly speaking, this bit is better to be configured 
by TD guest kernel, however current TDX architecture makes the design to 
let VMM configure.


[1]: TD pages that are not accepted cause a #VE exception.
It is possible for a hypervisor to take away a guest page
and thus trigger a #VE the next time it is accessed.
Normally the guest would just panic in such a case, but
for that it first needs to execute the #VE handler
reliably.

This can cause problems with the "system call gap": a malicious
hypervisor might trigger a #VE for example on the system call entry
code, and when a user process does a system call it would trigger a
and SYSCALL relies on the kernel code to switch to the kernel stack,
this would lead to kernel code running on the ring 3 stack.  This could
be exploited by a combination of malicious host and malicious ring 3
program to attack the kernel.


> take care,
>    Gerd
> 


