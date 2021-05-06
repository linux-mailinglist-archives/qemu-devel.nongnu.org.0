Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501EA374D6B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:19:34 +0200 (CEST)
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTbx-00077a-CP
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1leTa6-0005VG-Ea
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:17:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:49713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1leTa2-0004Fd-NL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:17:38 -0400
IronPort-SDR: AAe9tikPQeRF19w4VbgHv+71bgxQduABvoLK152v3XzfFauYiKMde2jvtGnetFawZmgAxMDKsK
 cM/dSuvg+eww==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="198436102"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="198436102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 19:17:25 -0700
IronPort-SDR: Le8obW8Z/RU5mUqVj6+nA+gmSPylraZ9nPKQavDUyjaVnuJe8VE0P+InncjiGPp8mRZagxQnPF
 mISAy+yW9lvA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="428371814"
Received: from jhagel-mobl1.amr.corp.intel.com (HELO
 khuang2-desk.gar.corp.intel.com) ([10.212.164.152])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 19:17:23 -0700
Message-ID: <eb4c7f3035c4542ec78c6bf5c7ee98af36c46230.camel@intel.com>
Subject: Re: [RESEND PATCH 13/32] linux-headers: Add placeholder for
 KVM_CAP_SGX_ATTRIBUTE
From: Kai Huang <kai.huang@intel.com>
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Date: Thu, 06 May 2021 14:17:21 +1200
In-Reply-To: <20210430062455.8117-14-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-14-yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kai.huang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-04-30 at 14:24 +0800, Yang Zhong wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> KVM_CAP_SGX_ATTRIBUTE is a proposed capability for Intel SGX that can be
> used by userspace to enable privileged attributes, e.g. access to the
> PROVISIONKEY.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  linux-headers/linux/kvm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 020b62a619..0961b03007 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>  #define KVM_CAP_DIRTY_LOG_RING 192
> +#define KVM_CAP_SGX_ATTRIBUTE 195
>  
> 

This hasn't been updated to 196.


Btw, should we just copy the latest kvm.h from linux kernel? 193-195 are missing if only
define KVM_CAP_SGX_ATTRIBUTE here.


