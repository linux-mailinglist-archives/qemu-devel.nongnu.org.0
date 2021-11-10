Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639344C1F3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:14:20 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknQh-00058D-7J
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:14:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mknNn-00034w-D5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:11:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:58776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mknNk-0007UN-Dl
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:11:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232610168"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232610168"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 05:11:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="669795860"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Nov 2021 05:11:11 -0800
Date: Wed, 10 Nov 2021 20:56:37 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/5] SGX NUMA support plus vepc reset
Message-ID: <20211110125637.GA3447@yangzhon-Virtual>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <f8ce527e-5ea7-3359-d2e9-62497136d7af@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ce527e-5ea7-3359-d2e9-62497136d7af@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, jarkko@kernel.org, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 01:52:09PM +0100, Paolo Bonzini wrote:
> On 11/1/21 17:20, Yang Zhong wrote:
> >The basic SGX patches were merged into Qemu release, the left NUMA
> >function for SGX should be enabled. The patch1 implemented the SGX NUMA
> >ACPI to enable NUMA in the SGX guest. Since Libvirt need detailed host
> >SGX EPC sections info to decide how to allocate EPC sections for SGX NUMA
> >guest, the SGXEPCSection list is introduced to show detailed sections info
> >in the monitor or HMP interface.
> >
> >This version also plus the vEPC reset support because the related kernel
> >patches were merged into tip tree master branch, please ref below link:
> >https://lore.kernel.org/all/20211021201155.1523989-1-pbonzini@redhat.com/
> >or the tip tree master branch.
> 
> Hi,
> 
> I queued patch 5, and enough of patch 2 to avoid crashing 'info numa'.
> 
> For patch 5, note that linux-headers/ is automatically generated
> from Linux headers (as the name says!) so the ioctl has to be
> declared in hw/i386/sgx-epc.c.
>
 
  Paolo, thanks!

  No other maintainers to review numa patches, so i will send the numa
  patches again? thanks!

  Yang

 
> Thanks,
> 
> Paolo

