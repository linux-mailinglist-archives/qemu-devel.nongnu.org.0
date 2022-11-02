Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0526156C4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 01:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq1xQ-0004dx-US; Tue, 01 Nov 2022 20:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oq1xO-0004df-RQ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 20:50:14 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oq1xM-0003RP-Oi
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 20:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667350212; x=1698886212;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=im3e/kcKkggYT9vAYCbSKJT9VmWaOlYNxEq9LGFch4A=;
 b=OWX1SYPg7DZNMAukhBxOwWXgtmHQOjNVgfnK8F4ZhZeQG1F8jf3fw0tD
 y5QS+8WRnBJTbfFQ2t7lPq0C7/t+VT3niNGbFsgs1qKhLhrkxjc4UQk6N
 OdtKueHuc9Tiz/8NIY3Srfxkbrvr1GTJaU64aqHvNPe8IQgcJycfiFv++
 /mGLMY4fUvbHStlcfvK7CMutlz6cMTmrWn6ZDJEb6IYBXO3adO4BstwR9
 dbN6zxZKIJZt36mxEQzJ/WzBsgVWaY4aDgyuvDF2iuXfFPppqx3uUBBUr
 GNV9t8L1Jc+n7YBihpNLtla7kLJT/vUn9gzB55Mvio3urvDPTzZt46KqL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="395589053"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="395589053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 17:50:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="665352977"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="665352977"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.31.47])
 ([10.255.31.47])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 17:49:58 -0700
Message-ID: <75afc4bd-75fc-78da-9c97-035f7f87d7c5@intel.com>
Date: Wed, 2 Nov 2022 08:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH 0/2] i386/cpuid: Minor fixes for CPUID leaf 1f setup
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220712021249.3227256-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220712021249.3227256-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=xiaoyao.li@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/12/2022 10:12 AM, Xiaoyao Li wrote:
> The issue that fixed by Patch 1 looks fatal though it doesn't appear on
> KVM because KVM always searches with assending order and hit with the
> correct cpuid leaf 0.
> 
> Patch 2 removes the wrong constraint on CPUID leaf 1f

Kindly ping.

> Xiaoyao Li (2):
>    i386/cpuid: Decrease cpuid_i when skipping CPUID leaf 1F
>    i386/cpuid: Remove subleaf constraint on CPUID leaf 1F
> 
>   target/i386/kvm/kvm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 


