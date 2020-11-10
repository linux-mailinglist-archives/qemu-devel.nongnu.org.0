Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7C2ACAB4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:51:18 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIoX-0000Ls-3Q
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1kcInG-0008Fo-Kt
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:49:59 -0500
Received: from mga09.intel.com ([134.134.136.24]:18211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1kcInE-0002mG-4x
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:49:57 -0500
IronPort-SDR: gSh6nA8vHEMlJAoLFEtU2dGIqQEhoUvH6RkAWGaf7wcnUD7mIk8jspXhnPTe+OgxY1XOmEg5XR
 NkMuGfwztJGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170052841"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="170052841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 17:49:53 -0800
IronPort-SDR: iLWfhVeJPwdl5kuGCq5+cXXPjDRZ9x4YsAf2jLwQG0BcO3surBEqJqnh3wHuvDDNi9n2w1eBHV
 V2yd4E+7dGQA==
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="541126259"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.238.4.107])
 ([10.238.4.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 17:49:51 -0800
Subject: Re: [PATCH 4/5 v4] KVM: VMX: Fill in conforming vmx_x86_ops via macro
To: Krish Sadhukhan <krish.sadhukhan@oracle.com>, kvm@vger.kernel.org
References: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
 <20201110012312.20820-5-krish.sadhukhan@oracle.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <0ef40499-77b8-587a-138d-9b612ae9ae8c@linux.intel.com>
Date: Tue, 10 Nov 2020 09:49:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110012312.20820-5-krish.sadhukhan@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=like.xu@linux.intel.com; helo=mga09.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:49:53
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Krish,

On 2020/11/10 9:23, Krish Sadhukhan wrote:
> @@ -1192,7 +1192,7 @@ void vmx_set_host_fs_gs(struct vmcs_host_state *host, u16 fs_sel, u16 gs_sel,
>   	}
>   }
>   
> -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu)

What do you think of renaming it to

	void vmx_prepare_switch_for_guest(struct kvm_vcpu *vcpu)；

?

Thanks,
Like Xu

>   {
>   	struct vcpu_vmx *vmx = to_vmx(vcpu);
>   	struct vmcs_host_state *host_state;
> 
> @@ -311,7 +311,7 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
>   int allocate_vpid(void);
>   void free_vpid(int vpid);
>   void vmx_set_constant_host_state(struct vcpu_vmx *vmx);
> -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu);
> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu);
>   void vmx_set_host_fs_gs(struct vmcs_host_state *host, u16 fs_sel, u16 gs_sel,
>   			unsigned long fs_base, unsigned long gs_base);
>   int vmx_get_cpl(struct kvm_vcpu *vcpu);


