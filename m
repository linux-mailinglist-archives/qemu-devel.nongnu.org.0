Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647344D1F5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:37:01 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3hk-0008CG-Cy
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml3g3-0006xu-PO
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:35:16 -0500
Received: from mga04.intel.com ([192.55.52.120]:51667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml3g0-0007qu-BM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:35:15 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="231584209"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="231584209"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 22:35:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452616680"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Nov 2021 22:35:07 -0800
Date: Thu, 11 Nov 2021 14:20:31 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/5] SGX NUMA support plus vepc reset
Message-ID: <20211111062031.GB4787@yangzhon-Virtual>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <f8ce527e-5ea7-3359-d2e9-62497136d7af@redhat.com>
 <20211110125637.GA3447@yangzhon-Virtual>
 <8532a0e7-17e0-7f71-f1dd-1e01a4dc1e29@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8532a0e7-17e0-7f71-f1dd-1e01a4dc1e29@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 05:07:40PM +0100, Paolo Bonzini wrote:
> On 11/10/21 13:56, Yang Zhong wrote:
> >   Paolo, thanks!
> >
> >   No other maintainers to review numa patches, so i will send the numa
> >   patches again? thanks!
> 
> The patch look good, but they were sent too close to the 6.2 release
> freeze.  I'll take a look at them again a month.
>

  Thanks Paolo, once the new Qemu version is ready, i will send V4. thanks!

  Regards,

  Yang
 
> Paolo

