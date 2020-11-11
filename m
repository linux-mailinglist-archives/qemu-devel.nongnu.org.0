Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1C2AE615
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 02:55:32 +0100 (CET)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcfMB-0001dm-Il
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 20:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@intel.com>) id 1kcfL2-0001CG-4b
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:54:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:24991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@intel.com>) id 1kcfL0-0005E1-7T
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:54:19 -0500
IronPort-SDR: L/GQyh7gw43QOvVqV/btcUNjafui36UTcUk4PBywlggxg8zS9uXV67DvGtb/zydv9Aodsi1/Sv
 yqaK4g5tL+oQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166571168"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="166571168"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 17:54:13 -0800
IronPort-SDR: ShTzttbpJhhVObE/uPGQ1IIFtcRrMq7lyomvqLLTwyUUcEfjzmRgzv90n2+1Gt8I8DklUw7iH+
 2JS2VnhT6hMw==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="541585162"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.238.4.107])
 ([10.238.4.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 17:54:10 -0800
Subject: Re: [PATCH 4/5 v4] KVM: VMX: Fill in conforming vmx_x86_ops via macro
To: Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Like Xu <like.xu@linux.intel.com>, kvm@vger.kernel.org
References: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
 <20201110012312.20820-5-krish.sadhukhan@oracle.com>
 <0ef40499-77b8-587a-138d-9b612ae9ae8c@linux.intel.com>
 <e9819b87-c4e0-d15b-80b8-637ecb74f1c3@oracle.com>
From: "Xu, Like" <like.xu@intel.com>
Message-ID: <159af74f-15d3-9c90-8a39-e24715255144@intel.com>
Date: Wed, 11 Nov 2020 09:54:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <e9819b87-c4e0-d15b-80b8-637ecb74f1c3@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.93; envelope-from=like.xu@intel.com;
 helo=mga11.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 20:54:13
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org,
 sean.j.christopherson@intel.com, jmattson@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/11 3:02, Krish Sadhukhan wrote:
>
> On 11/9/20 5:49 PM, Like Xu wrote:
>> Hi Krish,
>>
>> On 2020/11/10 9:23, Krish Sadhukhan wrote:
>>> @@ -1192,7 +1192,7 @@ void vmx_set_host_fs_gs(struct vmcs_host_state 
>>> *host, u16 fs_sel, u16 gs_sel,
>>>       }
>>>   }
>>>   -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
>>> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu)
>>
>> What do you think of renaming it to
>>
>>     void vmx_prepare_switch_for_guest(struct kvm_vcpu *vcpu)；
>
>
> In my opinion, it sounds a bit odd as we usually say, "switch to 
> something". :-)
>
> From that perspective, {svm|vmx}_prepare_switch_to_guest is probably the 
> best name to keep.

Ah, I'm fine with the original one and thank you.

>
>
>>
>> ?
>>
>> Thanks,
>> Like Xu
>>
>>>   {
>>>       struct vcpu_vmx *vmx = to_vmx(vcpu);
>>>       struct vmcs_host_state *host_state;
>>>
>>> @@ -311,7 +311,7 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int 
>>> cpu,
>>>   int allocate_vpid(void);
>>>   void free_vpid(int vpid);
>>>   void vmx_set_constant_host_state(struct vcpu_vmx *vmx);
>>> -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu);
>>> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu);
>>>   void vmx_set_host_fs_gs(struct vmcs_host_state *host, u16 fs_sel, u16 
>>> gs_sel,
>>>               unsigned long fs_base, unsigned long gs_base);
>>>   int vmx_get_cpl(struct kvm_vcpu *vcpu);
>>


