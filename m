Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5C4B01A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 01:47:52 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHxcl-000158-3q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 19:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nHxU1-0008WI-PM
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:38:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:10870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nHxTU-0002YA-4b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 19:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644453496; x=1675989496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zB6AoUKvVij7NWzZ9PeCjkUlZ2UWAt5KrXtxCVaMnF4=;
 b=QsnSSJWeKby8LN4eIEmLf+lx5ewTj4i7mLgKecYH9icUwFxAdchtnhWe
 erLixuIkINth8wT1iDulOb9hnUaoehY1tnMp2duLugmYtNbknZIZ7GaeE
 9u0IFhxInl1TI4vxg9bKCWDDXGNXsMKZ1YPPXy/GVtAVtBug1P+yOjsvd
 2yrX2uc5y7s9IiQlDTFQEkRkWyL+LaNOuGTS6xTA2U3iPxA8q3y872GdN
 Lt+QjKUVPpzbkBetcmvnPPI5o3tW21R+ZYw6giYJtRDEWQc+VP8MgupUd
 2EbZotQ+ETOzuS0QcXW3LLPDS/TaXaFR+9SJV3Fdtl3icNMNx1cxWNZlM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="273921788"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="273921788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:38:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="541377323"
Received: from yangweij-mobl.ccr.corp.intel.com (HELO [10.255.28.189])
 ([10.255.28.189])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:38:01 -0800
Message-ID: <d5e051cd-a4ff-6816-a279-92e97b57e7c8@intel.com>
Date: Thu, 10 Feb 2022 08:37:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/2] Enable legacy LBR support for guest
Content-Language: en-US
To: Like Xu <like.xu.linux@gmail.com>
References: <20220122161201.73528-1-weijiang.yang@intel.com>
 <e2c18d80-7c4e-6a0a-d37e-3a585d53d3f2@gmail.com>
From: "Yang, Weijiang" <weijiang.yang@intel.com>
In-Reply-To: <e2c18d80-7c4e-6a0a-d37e-3a585d53d3f2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=weijiang.yang@intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: ehabkost@redhat.com, kvm@vger.kernel.org, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 likexu@tencent.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/9/2022 5:14 PM, Like Xu wrote:
> Hi Weijiang,
>
> On 23/1/2022 12:11 am, Yang Weijiang wrote:
>> KVM legacy LBR patches have been merged in kernel 5.12, this patchset
>> is to expose the feature to guest from the perf capability MSR. Qemu can
>> add LBR format in cpu option to achieve it, e.g., -cpu host,lbr-fmt=0x5,
>
> Some older Intel CPUs may have lbr-fmt=LBR_FORMAT_32 (which is 0), would
> you help verify that KVM is supported on these platforms ? If so, how 
> do we enable
> guest LBR form the QEMU side, w/ -cpu host,lbr-fmt=0x0 ?

Hi, Like, do you know which cpu model or platform so that I can have a 
test on?

>
>> the format should match host value in IA32_PERF_CAPABILITIES.
>>
>> Note, KVM legacy LBR solution accelerates guest perf performace by 
>> LBR MSR
>> passthrough so it requires guest cpu model matches that of host's, i.e.,
>
> Would you help add live migration support across host/guest CPU models 
> when
> hosts at both ends have the same number of LBR entries and the same 
> lbr-fmt ?
Yes, I'm working on this part for Arch LBR, then enable it for legacy 
LBR as well.
>
> Thanks,
> Like Xu
>
>> only -cpu host is supported.
>>
>> Change in v5:
>>     1. This patchset is rebased on tip : 6621441db5
>>     2. No functional change since v4.

