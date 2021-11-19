Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99B45679B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 02:49:29 +0100 (CET)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnt1r-0001B3-T1
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 20:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mnt10-0000Ui-1j
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 20:48:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:45458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mnt0x-0004nS-C1
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 20:48:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214365365"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="214365365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 17:48:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="455584089"
Received: from dmkresin-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.138.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 17:48:24 -0800
Date: Thu, 18 Nov 2021 17:48:22 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Shreyas Shah <shreyas.shah@elastics.cloud>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211119014822.j247ayrsdve4yxyu@intel.com>
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
 <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=ben.widawsky@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 Saransh Gupta1 <saransh@ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-11-18 22:52:56, Shreyas Shah wrote:
> Hello Folks,
> 
> Any plan to add CXL2.0 switch ports in QEMU? 

What's your definition of plan?

> 
> Regards,
> Shreyas

[snip]

