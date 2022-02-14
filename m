Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C44B42B5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:19:29 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVdv-0006Zc-RC
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nJVZI-0004Wj-4W
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:14:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:31031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nJVZF-0003CG-Cg
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644822877; x=1676358877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WnPst2BEmjMQ6aCqVhwPvcM66mgtbjC+v4nnO/FV64s=;
 b=K4c2UQEU4dGbR0X9y6j7y32W8n1Z8J2sq9vXphYyhgO7P8YlZxr7kCYt
 1wxu8kbYQ42MOHYRh+wK6opeI8oyuGHbGuagwXNbXaJC+ihstk5X3kuEB
 hF7mYyraPffWwVEMZ01eHgX81OL77a8UwnjJMs3CD1VCnQDG7EBOBSqMO
 D/kcZi68EFVUuiBPxAgaDyZD/acNeSxpFqeWC0yg9zTQ7MtgEpq4fZsHv
 v3rXdaivda0LyChVIN33S2JtKYQ6WOXSnhLl4bRmY8+76hWIfiDL/hb/e
 kMQbOJ3IyRv3e88rnuTFzuLr3bzcAqSXJoPObED6Nm9+rsLU543ZTtKmC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="229994128"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="229994128"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:14:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543259913"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Feb 2022 23:14:31 -0800
Date: Mon, 14 Feb 2022 14:58:57 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <20220214065857.GA5015@yangzhon-Virtual>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207093752.7503b6cb@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 09:37:52AM +0100, Igor Mammedov wrote:
> On Sat,  5 Feb 2022 13:45:26 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
> > Previously SGX-EPC objects were exposed in the QOM tree at a path
> > 
> >   /machine/unattached/device[nn]
> > 
> > where the 'nn' varies depending on what devices were already created.
> > 
> > With this change the SGX-EPC objects are now at
> > 
> >   /machine/sgx-epc[nn]
> > 
> > where the 'nn' of the first SGX-EPC object is always zero.
> 
> yet again, why it's necessary?


  Igor, Sorry for delay feedback because of Chinese New Year holiday.

  This series patches are to fix below issues I reported before,
  https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html

  Since the /machine/unattached/device[0] is used by vcpu and Libvirt
  use this interface to get unavailable-features list. But in the SGX
  VM, the device[0] will be occupied by virtual sgx epc device, Libvirt
  can't get unavailable-features from this device[0].

  Although patch 2 in this series already fixed "unavailable-features" issue,
  this patch can move sgx virtual device from /machine/unattached/device[nn]
  to /machine/sgx-epc[nn], which seems more clear. Thanks!

  Yang
  

> 
> > 
> > Reported-by: Yang Zhong <yang.zhong@intel.com>
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >  hw/i386/sgx.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > index a2b318dd938..3ab2217ca43 100644
> > --- a/hw/i386/sgx.c
> > +++ b/hw/i386/sgx.c
> > @@ -304,6 +304,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
> >      for (list = x86ms->sgx_epc_list; list; list = list->next) {
> >          obj = object_new("sgx-epc");
> >  
> > +        object_property_add_child(OBJECT(pcms), "sgx-epc[*]", OBJECT(obj));
> > +
> >          /* set the memdev link with memory backend */
> >          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
> >                                &error_fatal);

