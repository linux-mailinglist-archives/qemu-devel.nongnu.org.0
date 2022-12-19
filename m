Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870C65075B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 06:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p795O-000895-PV; Mon, 19 Dec 2022 00:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1p795M-00088x-HS
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 00:53:12 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1p795J-0003PN-VM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 00:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671429189; x=1702965189;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=yW0ZEdJooyBvxc+7UGNnofMuluj42c9Q97mGxXSok+o=;
 b=gMXRB5UKE+63W8KtlHxtVTcb3q1wdKqf2Ku3fFSrftf3RrkmbdhJD+3R
 jwp81UBfqP/GaICi9CwpXe/tDCuR4LX/f4MY+8bhatcs/y1CVyy1LZ2F7
 tu4kn38CmL60r9BySXWLxqPE9WPdQ1d18BnOHxAIY1yUcrk5iS9qJYRPn
 laAzWKdp/2s1YunazkFqgZrZeugTxpuuhXq+viQr3JxXQqAd3YmlsZtKU
 gpweCi5aG9ssn4RoijHB/232peGqny2ccEaTnGgygqbSwYcBxMF/GpOoh
 GQosY9hpv5fWCNykL/Mq/JkAoJzNKFYB7Bw0qVaCpsgftchXVYWVSi6yE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="319323506"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="319323506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 21:53:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="792759874"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="792759874"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.254.211.19])
 ([10.254.211.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 21:53:01 -0800
Message-ID: <404a6c0d-e974-9034-1de9-321924e989c9@intel.com>
Date: Mon, 19 Dec 2022 13:52:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/6] Support for new CPU model SapphireRapids
Content-Language: en-US
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
References: <20221102085256.81139-1-lei4.wang@intel.com>
In-Reply-To: <20221102085256.81139-1-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei4.wang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kindly ping for any comments:)

BR,
Lei

On 11/2/2022 4:52 PM, Wang, Lei wrote:
> This series aims to add a new CPU model SapphireRapids, and tries to
> address the problem stated in
> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
> so that named CPU model can define its own AMX values, and QEMU won't
> pass the wrong AMX values to KVM in future platforms if they have
> different values supported.
> 
> The original patch is
> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.
> 
> ---
> 
> Changelog:
> 
> v2:
>  - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
>    unsupported.
>  - Remove unnecessary function definition and make code cleaner.
>  - Fix some typos.
>  - v1:
>    https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t
> 
> Wang, Lei (6):
>   i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
>   i386: Remove unused parameter "uint32_t bit" in
>     feature_word_description()
>   i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
>     features
>   i386: Mask and report unavailable multi-bit feature values
>   i386: Initialize AMX CPUID leaves with corresponding env->features[]
>     leaves
>   i386: Add new CPU model SapphireRapids
> 
>  target/i386/cpu-internal.h |  11 ++
>  target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
>  target/i386/cpu.h          |  16 ++
>  3 files changed, 322 insertions(+), 16 deletions(-)
> 

