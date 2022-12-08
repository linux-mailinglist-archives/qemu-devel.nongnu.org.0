Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B286470D7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 14:35:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3H2A-0003F5-Ll; Thu, 08 Dec 2022 08:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@linux.intel.com>)
 id 1p3BEv-0005BU-E8
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:22:41 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@linux.intel.com>)
 id 1p3BEt-00084y-Mz
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670484159; x=1702020159;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=S2/UYAGkvrRi7wqxX0E0Zqp3HgDBYvDxgPJZBhm6L0k=;
 b=m5KB6gqEigvvzxen76FsLNObt9YUdj5+iV9Vn3feh1S9zYXXuPfK0c2F
 7ofkAC24hZCyJRE7PKRux2zqtAamEu0WCn2y5cA+TQo59B3DUIBwZqp1w
 mFy74FUOUrJAT8LYRpriOt3RLV9Fn1fNamwp4OegLJBCD5J9NcZjgyHPY
 TjxXe7XBj3UG87h7xyLsqtWym0UThwY/f6i/wIareUY9rxFPx1OKGcW3H
 UBTjEnA2U+z42i513pNQvPo4oX+jlRnFgM9RRE97XH9gF8tJYbrPbVCVX
 NCWoyvV2P6tskbBm4rQSuQXec8E6eZN3G7TPEnUqf/lVpqpBNSmqDeVCH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="304728875"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="304728875"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:16:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="892110489"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="892110489"
Received: from yadongqi-mobl2.ccr.corp.intel.com (HELO [10.238.6.50])
 ([10.238.6.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:16:11 -0800
Message-ID: <08bb6ea1-f648-cf27-9e89-a7e1e7ff6339@linux.intel.com>
Date: Thu, 8 Dec 2022 15:16:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: qemu-devel@nongnu.org, pbonzini@redhat.com, yadong.qi@linux.intel.com
From: "Qi, Yadong" <yadong.qi@linux.intel.com>
Subject: WHPX CPUID-0x40000000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=yadong.qi@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Dec 2022 08:33:50 -0500
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

Hi, all
May I know why the Hypervisor vendor signature value is cleared to 0 in 
whpx-all.c?

https://gitlab.com/qemu-project/qemu/-/blob/master/target/i386/whpx/whpx-all.c#L1963
switch (cpuid_fn) {
case 0x40000000:
     /* Expose the vmware cpufrequency cpuid leaf */
     rax = 0x40000010;
     rbx = rcx = rdx = 0;
     break;


-- 
Best Regard
Yadong

