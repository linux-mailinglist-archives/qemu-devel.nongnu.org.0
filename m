Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797437501D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:25:42 +0200 (CEST)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYOD-0007dY-Im
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leYN1-00073z-VB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:24:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:44151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leYMz-0005Dy-F3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:24:27 -0400
IronPort-SDR: nuGxl4cDBSaSr8TaoJL5SUITNhpdf+egIH2M6aIz7T1JnAjQ6xfr0hmQWSVBAHKG6WxPOXijb7
 zO+v034ygiKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="219278643"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="219278643"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 00:24:17 -0700
IronPort-SDR: XP108HyxrS4VZjriQvpXgcXzYiYUePf/hGwa6zTOHaJB7gFbr1wnLB7Monyp2dmneM1ViOxU8a
 3e4lJpt8T5dQ==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="430401215"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 00:24:15 -0700
Date: Thu, 6 May 2021 15:11:46 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Kai Huang <kai.huang@intel.com>
Subject: Re: [RESEND PATCH 13/32] linux-headers: Add placeholder for
 KVM_CAP_SGX_ATTRIBUTE
Message-ID: <20210506071146.GA21621@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-14-yang.zhong@intel.com>
 <eb4c7f3035c4542ec78c6bf5c7ee98af36c46230.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb4c7f3035c4542ec78c6bf5c7ee98af36c46230.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, May 06, 2021 at 02:17:21PM +1200, Kai Huang wrote:
> On Fri, 2021-04-30 at 14:24 +0800, Yang Zhong wrote:
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
> 
> This hasn't been updated to 196.
>
  As for KVM_CAP_SGX_ATTRIBUTE is still 195, i mentioned this in the coverletter, and this release
  still rebased on KVM-SGX upstream branch(5.12.0-rc3+). Since the KVM-SGX series has been merged
  into linux release in 5/1, i will rebase Qemu SGX on linux release in the next version patch series. 

> 
> Btw, should we just copy the latest kvm.h from linux kernel? 193-195 are missing if only
> define KVM_CAP_SGX_ATTRIBUTE here.

  There are three macro definitions before KVM_CAP_SGX_ATTRIBUTE, and KVM_CAP_X86_BUS_LOCK_EXIT use case
  is being upstreamed by our colleague. 
  As for other two macro definitions, i am not sure if we need add those here. thanks!

  Yang
  


