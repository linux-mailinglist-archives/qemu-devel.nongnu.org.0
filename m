Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E15AC85F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 02:59:34 +0200 (CEST)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV0SW-0005Wc-Db
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 20:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oV0RM-0004B8-06
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 20:58:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:8459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oV0RJ-0008C9-HJ
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 20:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662339493; x=1693875493;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YzhiMcnNvEkzR0+JM0yNBiJ87xB0TW2FYyKCzuVLNCQ=;
 b=EST+52P1jFne3cS3Vg071g0r9CLIlSqIp9BCYIRfzHqxAE/p2+ni5Nw/
 2suf/k3QEeFxNVnDyuJMV3IHXspm7bKSx+GW9DJ+jl4OIOtIC/ntABID4
 OPwt0b4ORcjxzBPuxGbhtEa6IbXy7OI7k9Bez902SQEl8H31jweDwYotm
 wCzO9hnOuomXHUiGEKVYn7kBzBJI/Lz8F1AIR2ZipMFg+N1MvIw0a1+08
 wj3TXS0gHvRQhwb5ofA+NXbY0WnqRTJlAxAzGdIXuVEeMvWpA7KY4Stsg
 WKrEVnhD60hI1rE1WPOoc2sZXxJVtkUjUJx7DMK7cGJm2qVB+xn9/sV1n w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="297588019"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="297588019"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 17:58:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="590722460"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.200])
 ([10.249.175.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 17:58:05 -0700
Message-ID: <0752e387-187d-2edb-2feb-56bdec37d0ce@intel.com>
Date: Mon, 5 Sep 2022 08:58:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH v1 00/40] TDX QEMU support
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=134.134.136.65;
 envelope-from=xiaoyao.li@intel.com; helo=mga03.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

Hi Gerd

On 8/2/2022 3:47 PM, Xiaoyao Li wrote:
..
> == Change history ==
> Changes from RFC v4:
> [RFC v4] https://lore.kernel.org/qemu-devel/20220512031803.3315890-1-xiaoyao.li@intel.com/
> 
> - Add 3 more patches(9, 10, 11) to improve the tdx_get_supported_cpuid();

Patch 8-11 are the only left ones that don't get your Acked-by. Do you 
have any comment on them?

