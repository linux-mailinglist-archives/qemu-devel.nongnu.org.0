Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B8490650
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:58:21 +0100 (CET)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9PiO-0004bx-JD
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9Pda-0001tm-7u
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:53:22 -0500
Received: from mga07.intel.com ([134.134.136.100]:13996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9PdW-00016K-NM
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642416798; x=1673952798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VNwrsVSi78pbVR1cW/gdkq5+e6dhfh3aUxKsVDIKRwM=;
 b=ib/PLjzzBs3dj6U08bn+jc7RSfMl6LvS7K/3K7tea+PnchLFb0xf1wNi
 ht+GzW0mRL3YsA12nokxXtGM6mBmGmASKSUDnseW2AQ5QcLu6U7MpLpoa
 MFlTd1+/+wgNrqExfi8visRInErKHdFHS2rmmnXw9xv1tYtbnIMqSQjr6
 ysG/5ndEJZ38xxA1Tk5EzX6Yw+N7845QDy5RprRuG+nczUZ1G/RZWh1kc
 Z1YYyfCv3GFXw2eQRZyRsSF1PdyQyxu8VoIXb+oYeDNa7ybmUypIu6Oyx
 1lJ3HRdxYvqjHX8+AlCfSLyzDO7HBiC70fniNMYRnHJ8g6B8CxJYwWfMa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="307942583"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="307942583"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 02:52:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="531291799"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Jan 2022 02:52:48 -0800
Date: Mon, 17 Jan 2022 18:37:31 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL 11/13] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <20220117103731.GB20805@yangzhon-Virtual>
References: <20211215202515.91586-1-pbonzini@redhat.com>
 <20211215202515.91586-12-pbonzini@redhat.com>
 <YeBQDnavNT3ZE5mf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeBQDnavNT3ZE5mf@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 04:15:10PM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 15, 2021 at 09:25:13PM +0100, Paolo Bonzini wrote:
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > Add the SGXEPCSection list into SGXInfo to show the multiple
> > SGX EPC sections detailed info, not the total size like before.
> > This patch can enable numa support for 'info sgx' command and
> > QMP interfaces. The new interfaces show each EPC section info
> > in one numa node. Libvirt can use QMP interface to get the
> > detailed host SGX EPC capabilities to decide how to allocate
> > host EPC sections to guest.
> 
> 
> 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 5aa2b95b7d..1022aa0184 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -337,6 +337,21 @@
> >    'if': 'TARGET_ARM' }
> >  
> >  
> > +##
> > +# @SGXEPCSection:
> > +#
> > +# Information about intel SGX EPC section info
> > +#
> > +# @node: the numa node
> > +#
> > +# @size: the size of epc section
> > +#
> > +# Since: 6.2
> 
> This is wrong because it was merged for 7.0 not 6.2
> 
> > +##
> > +{ 'struct': 'SGXEPCSection',
> > +  'data': { 'node': 'int',
> > +            'size': 'uint64'}}
> > +
> >  ##
> >  # @SGXInfo:
> >  #
> > @@ -350,7 +365,7 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> > -# @section-size: The EPC section size for guest
> > +# @sections: The EPC sections info for guest
> 
> This is a non-backwards compatible schema change.
> 
> "@section-size" must not be removed without going
> through a deprecation period, so this needs to be
> re-instated.
> 
> The "@sections" addition needs a "Since 7.0" annotation too.
> 
> 
> Yong, can you submit a followup patch to correct these mistakes
> 

  Thanks, I will submit one patch to fix this version issue. This series
  support SGX NUMA, the background is SGX EPC section number is not fixed(<=8)
  I added this "@sections" to include numa node and EPC section size, which can
  be shown how to allocate EPC sections to different NUMA nodes in the VM.
  The older "@section-size" is only suitable for one EPC section on one NUMA node
  in one VM, so I moved this size into "@sections" here for NUMA support.

  Yang
 
  
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

