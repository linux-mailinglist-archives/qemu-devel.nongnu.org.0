Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0450562E5B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 10:34:37 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7C6m-0000bE-HK
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 04:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1o7C4C-0008Iw-0F
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:31:56 -0400
Received: from mga06b.intel.com ([134.134.136.31]:5351 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1o7C49-0003Cv-DH
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656664313; x=1688200313;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GaaUl5K+Z0229M0ZO/Jyt/5bCGrRgAkDzFQBslECcx8=;
 b=EtKaph7O8C9l+iKdbqMnLw1wD2qRn4ttqKXrL//bq9lio14uiVbzcXZl
 e+3C2I+zfKeP0aEYpxdwOZ+EQWQGGRTOBA12A0RDrcg6WOhqhz7fObqdB
 9Us6VVGNRfKIhd+eo+1sEYGKrFKXyFBJGZw5l+P49JTPElexafmIgMFwU
 nD77QtJyNFBCopO7+uXnP3b0gpr8SAWWz0spn/oozYWimWCCvhv7+nLP+
 v4+DDEQvG1lsEaFC6YQ4UWQuduKoDiHMWC3pNhO196U2lKplb9lA0FwT9
 aVI2sjUveySrok92aYjfLEB+HudhSURg4yqo1Uc8TzJH+dHpVQHiNBRCD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="344275355"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="344275355"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="694425313"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2022 01:31:42 -0700
Message-ID: <00e48b2c7f82a91b006ab3002acd3fd5d2be2e86.camel@linux.intel.com>
Subject: Re: [QEMU PATCH v2 3/6] acpi/nvdimm: NVDIMM _DSM Spec supports
 revision 2
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Fri, 01 Jul 2022 16:31:41 +0800
In-Reply-To: <20220616133816.74cb2eb7@redhat.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-4-robert.hu@linux.intel.com>
 <20220616133816.74cb2eb7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=robert.hu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-06-16 at 13:38 +0200, Igor Mammedov wrote:
> On Mon, 30 May 2022 11:40:44 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > The Intel Optane PMem DSM Interface, Version 2.0 [1], is the up-to-
> > date
> > spec for NVDIMM _DSM definition, which supports revision_id == 2.
> > 
> > Nevertheless, Rev.2 of NVDIMM _DSM has no functional change on
> > those Label
> > Data _DSM Functions, which are the only ones implemented for
> > vNVDIMM.
> > So, simple change to support this revision_id == 2 case.
> > 
> > [1] 
> > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> 
> pls enumerate functions that QEMU implement and that are supported by
> rev=2,
> do we really need rev2 ?

No matter rev.1 or rev.2, current QEMU implements only the three label
methods: get namespace label data size (func index 4), get namespace
label data (func index 5), set namespace label data (func index 6).
In both rev.1 an rev.2, these 3 _DSM label methods are deprecated by
ACPI Label methods. So, okay, we don't really need rev.2, at present.
> 
> also don't we need make sure that rev1 only function are excluded?
> /spec above says, functions 3-6 are deprecated and limited to rev1
> only/
> "
> Warning: This function has been deprecated in preference to the ACPI
> 6.2 _LSW (Label Storage Write)
> NVDIMM Device Interface and is only supported with Arg1 – Revision Id
> = 1. It is included here for
> backwards compatibility with existing Arg1 - Revision Id = 1
> implementations.
> "
Well, they're deprecated, not obsoleted, so still included, I think.
Anyway, as said above, we don't need this patch at this moment, let's
keep it unchanged.
> 
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> > ---
> >  hw/acpi/nvdimm.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index 0ab247a870..59b42afcf1 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -849,9 +849,13 @@ nvdimm_dsm_write(void *opaque, hwaddr addr,
> > uint64_t val, unsigned size)
> >      nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > in->revision,
> >                   in->handle, in->function);
> >  
> > -    if (in->revision != 0x1 /* Currently we only support DSM Spec
> > Rev1. */) {
> > -        nvdimm_debug("Revision 0x%x is not supported, expect
> > 0x%x.\n",
> > -                     in->revision, 0x1);
> > +    /*
> > +     * Current NVDIMM _DSM Spec supports Rev1 and Rev2
> > +     * Intel® OptanePersistent Memory Module DSM Interface,
> > Revision 2.0
> > +     */
> > +    if (in->revision != 0x1 && in->revision != 0x2) {
> > +        nvdimm_debug("Revision 0x%x is not supported, expect 0x1
> > or 0x2.\n",
> > +                     in->revision);
> >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > dsm_mem_addr);
> >          goto exit;
> >      }
> 
> 


