Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADE36501C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 04:10:21 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfqG-0005fg-1S
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 22:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1lYfoz-0004yK-9I
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:09:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:59459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1lYfov-00062c-NK
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 22:09:00 -0400
IronPort-SDR: 9InAMpiOzaoqNdaGqnoaPGBCFJYDAHuWIv8Znzaxi/nEsgu8/BUtglsHbiIpeTqGy2RHD6yJY8
 0CWB0OuQ3loA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="280755131"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="280755131"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 19:08:48 -0700
IronPort-SDR: i7Q/akWPMVfB+vmHUp+s8+6gY/c7pjA77JqzFId9MQpZQCat3KZ1BsdWjT7figLg90ccgke5zC
 yjmu9fN7Skfw==
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="616769126"
Received: from hburk-mobl2.amr.corp.intel.com ([10.212.231.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 19:08:47 -0700
Message-ID: <7439eb6198e095e3e8a354b7d22be4ab298e435b.camel@intel.com>
Subject: Re: [PATCH 13/32] linux-headers: Add placeholder for
 KVM_CAP_SGX_ATTRIBUTE
From: Kai Huang <kai.huang@intel.com>
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Date: Tue, 20 Apr 2021 14:08:44 +1200
In-Reply-To: <20210419100156.53504-14-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
 <20210419100156.53504-14-yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=kai.huang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 2021-04-19 at 18:01 +0800, Yang Zhong wrote:
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
This needs to be changed to 196, since KVM SGX code has changed to 196.



