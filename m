Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7F3650B2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 05:13:31 +0200 (CEST)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYgpO-0001LT-Ib
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 23:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYgnF-0000ra-TU
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:11:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:4162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYgnD-0005HP-Or
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:11:17 -0400
IronPort-SDR: LJ39gZB8rwQTowldS59c59BKBy0ubQnyNd/wv1a4W1BCuYV9eAR91JjFN1LQEJPA+KH3UnYI5N
 iXyx0nkTPhMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="259391656"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="259391656"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 20:11:09 -0700
IronPort-SDR: JFBK22EzqxGysM7/3nkyQmlihIUaH3rfpAqZ4YhTu8uHoQyIJeCip8umJao3xo8lKDpNvFZUUt
 X0vl/2W4TEdQ==
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="420233938"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 19 Apr 2021 20:11:07 -0700
Date: Tue, 20 Apr 2021 10:58:48 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Kai Huang <kai.huang@intel.com>
Subject: Re: [PATCH 13/32] linux-headers: Add placeholder for
 KVM_CAP_SGX_ATTRIBUTE
Message-ID: <20210420025848.GA10152@yangzhon-Virtual>
References: <20210419100156.53504-1-yang.zhong@intel.com>
 <20210419100156.53504-14-yang.zhong@intel.com>
 <7439eb6198e095e3e8a354b7d22be4ab298e435b.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7439eb6198e095e3e8a354b7d22be4ab298e435b.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 02:08:44PM +1200, Kai Huang wrote:
> On Mon, 2021-04-19 at 18:01 +0800, Yang Zhong wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > KVM_CAP_SGX_ATTRIBUTE is a proposed capability for Intel SGX that can be
> > used by userspace to enable privileged attributes, e.g. access to the
> > PROVISIONKEY.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  linux-headers/linux/kvm.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> > index 020b62a619..0961b03007 100644
> > --- a/linux-headers/linux/kvm.h
> > +++ b/linux-headers/linux/kvm.h
> > @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
> >  #define KVM_CAP_SYS_HYPERV_CPUID 191
> >  #define KVM_CAP_DIRTY_LOG_RING 192
> > +#define KVM_CAP_SGX_ATTRIBUTE 195
> >  
> > 
> This needs to be changed to 196, since KVM SGX code has changed to 196.
>
  Justly double confirmed from the sgx code in the kvm queue branch, i will
  change this value in the next version, thanks!

  Yang  

