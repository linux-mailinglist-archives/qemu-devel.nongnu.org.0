Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDC4B4322
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:53:56 +0100 (CET)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWBG-00028A-OT
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nJW0m-0007V0-VX
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:43:06 -0500
Received: from mga14.intel.com ([192.55.52.115]:8228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nJW0i-0002J2-De
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644824580; x=1676360580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7PmNVBxqSFXTolcps9A2esKibAs0RIPh2oGvdng5wL8=;
 b=GcZe+fTn6CzMjHgDicU/N+0brlXsrfCjeZ4rr3XgI3Seal32iM/d6fV4
 5FAiXsSRiE12lR/YiSynjXbXiM/4O7nPdSbgKQwXlicEpqrEJi2/aTDlf
 /NrFcJKaPnttOB5tWsZA194+m/AUhuXdG/o5sHTdXOEmpRETkXcBS6Pjy
 511oWp/MWJVZ0QJdVieKboSaP9ndK5XPGeEubAmBqn7BX9nGupPTJLVuH
 /VVq8OUo/OCDpeXvvIS8zgMKH+ts3xudkdK2CgjDk0vMzHC/jPofSBPea
 11PBrSnWq0d3vZO5287dXZgGeyU976KikfFvL0snTZjfp0NUWq26v/nyI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="250241235"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="250241235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:42:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="538439262"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Feb 2022 23:42:55 -0800
Date: Mon, 14 Feb 2022 15:27:21 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <20220214072721.GB5015@yangzhon-Virtual>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207093752.7503b6cb@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
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

   Philippe, I verified this patch, which work well. Thanks a lot!

   (qemu) qom-list /machine
   ......
   sgx-epc[2] (child<sgx-epc>)
   ......
   sgx-epc[0] (child<memory-region>)
   acpi-device (link<hotplug-handler>)
   sgx-epc[1] (child<sgx-epc>)
   ......

   Yang
  

