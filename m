Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682E27BBC8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 06:07:46 +0200 (CEST)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kN6vZ-0002Tx-8M
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 00:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sean.j.christopherson@intel.com>)
 id 1kN6um-00023Y-0M
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 00:06:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:48487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sean.j.christopherson@intel.com>)
 id 1kN6uj-0006Xg-SQ
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 00:06:55 -0400
IronPort-SDR: Gyf9blO9x/N2YLVhVNpo6+m8kl8oeBHSf8LKM781DTw+znfNZ+Zx87wfvp9RgdLKMhOeyGoYC8
 jqq6Fd0poSKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="141511679"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="141511679"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 21:06:49 -0700
IronPort-SDR: ApnA/f/CxUxtFfI6AUY6sarLD5E7WfkcMFTN2TthzC6NyteJVKUwWxGCwmaTT87/ZySyecMLCi
 1ayQdCL/bbNg==
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="488909363"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 21:06:49 -0700
Date: Mon, 28 Sep 2020 21:06:47 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Krish Sadhukhan <krish.sadhukhan@oracle.com>
Subject: Re: [PATCH 2/6 v3] KVM: SVM: Fill in conforming svm_x86_ops via macro
Message-ID: <20200929040647.GJ31514@linux.intel.com>
References: <1595895050-105504-1-git-send-email-krish.sadhukhan@oracle.com>
 <1595895050-105504-3-git-send-email-krish.sadhukhan@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595895050-105504-3-git-send-email-krish.sadhukhan@oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=sean.j.christopherson@intel.com; helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 00:06:50
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, jmattson@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 28, 2020 at 12:10:46AM +0000, Krish Sadhukhan wrote:
> The names of some of the svm_x86_ops functions do not have a corresponding
> 'svm_' prefix. Generate the names using a macro so that the names are
> conformant. Fixing the naming will help in better readability and
> maintenance of the code.

I'd probably prefer to split this into two patches, one to rename all the
functions and then the second to introduce the autofill macros.  Ditto for
VMX.

> Suggested-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

All of the patches with my SOB need

  Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>

> Signed-off-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
> ---

