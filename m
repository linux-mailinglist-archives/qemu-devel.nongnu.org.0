Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B695AA5F0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 04:35:53 +0200 (CEST)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTwXA-0001zK-8D
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 22:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTwUo-0008Rf-9B
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:33:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:10821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTwUl-0005Xz-RR
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662086003; x=1693622003;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r8zeg1tyZGMcF3UMzs+ZwZWbgreiiSaM+r6CEBdUuzU=;
 b=WKOIBU1oTCEoGbfc13WvOfzEMB2tOGL3jT+wvO4F2JmGpxX0Vcl+oS5z
 XeaimKBQE2esMhmQeNniD2kV2UeLVIUMhSc6IPpr4V4AK5hNk+E9FhCgc
 f8KNcQ7OVrPG6lkY5iEc2VH8pfoyruhYYm+/Z7zXsR5tc5/htXyycn2BX
 9c8CjfcrVwOkpFoG/IN3f1FRlW601y2Ex3e5XkYmBgBdAgMcC34Oa5L49
 cba0Doeq0lm7Zp0okOYrrOSaJ4OhcJyWZEXk7kmbEbHGbnBDjVJJ6KivH
 Qz/Vsgjm9tIRMJcMVmdheGeqF3MCa3ezib6GcC4sDHEFXERnu20O2HIUl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="322031394"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="322031394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 19:33:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642698192"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.28])
 ([10.249.171.28])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 19:33:12 -0700
Message-ID: <a700a0c6-7f25-dc45-4c49-f61709808f29@intel.com>
Date: Fri, 2 Sep 2022 10:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
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
 <389a2212-56b8-938b-22e5-24ae2bc73235@intel.com>
 <20220826055711.vbw2oovti2qevzzx@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220826055711.vbw2oovti2qevzzx@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=192.55.52.88;
 envelope-from=xiaoyao.li@intel.com; helo=mga01.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/26/2022 1:57 PM, Gerd Hoffmann wrote:
>    Hi,
>   
>> For TD guest kernel, it has its own reason to turn SEPT_VE on or off. E.g.,
>> linux TD guest requires SEPT_VE to be disabled to avoid #VE on syscall gap
>> [1].
> 
> Why is that a problem for a TD guest kernel?  Installing exception
> handlers is done quite early in the boot process, certainly before any
> userspace code runs.  So I think we should never see a syscall without
> a #VE handler being installed.  /me is confused.
> 
> Or do you want tell me linux has no #VE handler?

The problem is not "no #VE handler" and Linux does have #VE handler. The 
problem is Linux doesn't want any (or certain) exception occurrence in 
syscall gap, it's not specific to #VE. Frankly, I don't understand the 
reason clearly, it's something related to IST used in x86 Linux kernel.

>> Frankly speaking, this bit is better to be configured by TD guest
>> kernel, however current TDX architecture makes the design to let VMM
>> configure.
> 
> Indeed.  Requiring users to know guest kernel capabilities and manually
> configuring the vmm accordingly looks fragile to me.
> 
> Even better would be to not have that bit in the first place and require
> TD guests properly handle #VE exceptions.
> 
>> This can cause problems with the "system call gap": a malicious
>> hypervisor might trigger a #VE for example on the system call entry
>> code, and when a user process does a system call it would trigger a
>> and SYSCALL relies on the kernel code to switch to the kernel stack,
>> this would lead to kernel code running on the ring 3 stack.
> 
> Hmm?  Exceptions switch to kernel context too ...
> 
> take care,
>    Gerd
> 


