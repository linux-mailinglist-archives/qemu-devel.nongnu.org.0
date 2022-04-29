Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239651453D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:20:07 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMnG-0000Bn-L9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nkMVh-00056P-8c
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:01:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:16699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nkMVe-0001VW-An
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651222914; x=1682758914;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JcYgFbmmWy7KmKdJAGWySzL+ta2UkuH51ghygFC5jAM=;
 b=PxFmUpVY6LQ9OXwY4fnLoPE7PsP083l9fTDFsuMbiWPrgi5YRyzYG/mt
 CycEfuAKLmMW9Ilu2m+Ox9iH1j/wnZ2dd7pcMpJTA0DQKXt1n+nHQNDA7
 9XS8QyluS9WH89irUe0/skOCQ1kc0muJeYsf0JCxmBlwhOL3liDj52swY
 DlERPXQjg8B09vq1e/yYrp4MXzYj36Qn/6pyAdIagE2YBgIq2vRFJy5Lw
 HvsmBVA+7ukqXtzzGXk0SRSIax62332kLBnOgD9bV4r1Xi1cZDWzeqVLi
 NFd+rf65/jadH0cJ/EjAVpZv6M/WsxXGlYdwU1tIemFbk9TWBxrOQTw2f w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266109699"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="266109699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 02:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="880554309"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2022 02:01:48 -0700
Message-ID: <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Fri, 29 Apr 2022 17:01:47 +0800
In-Reply-To: <20220427163401.20c69375@redhat.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-04-27 at 16:34 +0200, Igor Mammedov wrote:
> On Tue, 12 Apr 2022 14:57:52 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > Since ACPI 6.2, previous NVDIMM/_DSM funcions "Get Namespace Label
> > Data
> > Size (function index 4)", "Get Namespace Label Data (function index
> > 5)",
> > "Set Namespace Label Data (function index 6)" has been deprecated
> > by ACPI
> 
> where it's said that old way was deprecated, should be mentioned here
> including
> pointer to spec where it came into effect.

OK. https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
3.10 Deprecated Functions.
I put it in cover letter. Will also mention it here.
> 
...
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index 0d43da19ea..7cc419401b 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -848,10 +848,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr,
> > uint64_t val, unsigned size)
> >  
> >      nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > in->revision,
> >                   in->handle, in->function);
> > -
> > -    if (in->revision != 0x1 /* Currently we only support DSM Spec
> > Rev1. */) {
> > -        nvdimm_debug("Revision 0x%x is not supported, expect
> > 0x%x.\n",
> > -                     in->revision, 0x1);
> > +    /* Currently we only support DSM Spec Rev1 and Rev2. */
> 
> where does revision 2 come from? It would be better to add a pointer
> to relevant spec.

https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
Section 3 "_DSM Interface for the NVDIMM Device", table 3-A and 3-B.

I'll add this in comments in next version.
> 
> > +    if (in->revision != 0x1 && in->revision != 0x2) {
> > +        nvdimm_debug("Revision 0x%x is not supported, expect 0x1
> > or 0x2.\n",
> > +                     in->revision);
> 
> since you are touching nvdimm_debug(), please replace it with
> tracing,
> see docs/devel/tracing.rst and any commit that adds tracing calls
> (functions starting with 'trace_').

OK I'll have a try.
> 
> >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > dsm_mem_addr);
> >          goto exit;
> >      }
> 
> 
> this whole hunk should be a separate patch, properly documented
> 
OK
> 
> also I wonder if DSM

It's not in SDM, but above-mentioned _DSM Interface spec by Intel.
> 
> > @@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml *dev)
> >  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t
> > ram_slots)
> >  {
> >      uint32_t slot;
> > +    Aml *method, *pkg, *buff;
> > +
> > +    /* Build common shared buffer for params pass in/out */
> > +    buff = aml_buffer(4096, NULL);
> > +    aml_append(root_dev, aml_name_decl("BUFF", buff));
> 
> is there a reason to use global variable instead of LocalX?

Local in root_dev but global to its sub devices? I think it is doable.

But given your below comments on return param _LS{I,R,W}, I now think,
in v2, I'm not going to reuse existing "NCAL" method, but implement
_LS{I,R,W} their own, stringently follow interface spec. Then, no buff
required at all. How do you like this?
> 
> >  
> >      for (slot = 0; slot < ram_slots; slot++) {
> >          uint32_t handle = nvdimm_slot_to_handle(slot);
> > @@ -1264,6 +1269,49 @@ static void nvdimm_build_nvdimm_devices(Aml
> > *root_dev, uint32_t ram_slots)
> >           */
> >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > aml_int(handle)));
> >  
> > +        /* Build _LSI, _LSR, _LSW */
> 
> should be 1 comment per method with spec/ver and chapter where it's
> defined

OK
> 
> > +        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
> > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > 0800200C9A66"),
> > +                            aml_int(2), aml_int(4), aml_int(0),
> > +                            aml_int(handle))));
> > +        aml_append(nvdimm_dev, method);
> 
> _LSI should return Package

Right. See above.
> 
> > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > +        aml_append(method,
> > +            aml_create_dword_field(aml_name("BUFF"), aml_int(0),
> > "DWD0"));
> > +        aml_append(method,
> > +            aml_create_dword_field(aml_name("BUFF"), aml_int(4),
> > "DWD1"));
> 
> theoretically aml_create_dword_field() takes TermArg as source
> buffer,
> so it doesn't have to be a global named buffer.
> Try keep buffer in LocalX variable and check if it works in earliest
> Windows version that supports NVDIMMs. If it does then drop BUFF and
> use
> Local variable, if not then that fact should be mentioned in commit
> message/patch

Thanks Igor. I'm new to asl grammar, I'll take your advice.

> 
> > +        pkg = aml_package(1);
> > +        aml_append(pkg, aml_name("BUFF"));
> > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > +        aml_append(method, aml_store(aml_arg(0),
> > aml_name("DWD0")));
> > +        aml_append(method, aml_store(aml_arg(1),
> > aml_name("DWD1")));
> 
> perhaps use less magical names for fields, something like:
>   DOFF
>   TLEN
> add appropriate comments

No problem.
> 
> Also I'd prepare/fill in buffer first and only then declare
> initialize
> Package + don't use named object for Package if it can be done with
> help
> of Local variables.
> 
> > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > 0800200C9A66"),
> > +                            aml_int(2), aml_int(5),
> > aml_name("PKG1"),
> > +                            aml_int(handle))));
> 
> this shall return Package not a Buffer

Right, Going to re-implement these methods rather than wrapper NCAL.
> 
> > +        aml_append(nvdimm_dev, method);
> > +
> > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > +        aml_append(method,
> > +            aml_create_dword_field(aml_name("BUFF"), aml_int(0),
> > "DWD0"));
> > +        aml_append(method,
> > +            aml_create_dword_field(aml_name("BUFF"), aml_int(4),
> > "DWD1"));
> > +        aml_append(method,
> > +            aml_create_field(aml_name("BUFF"), aml_int(64),
> > aml_int(32672), "FILD"));
> > +        pkg = aml_package(1);
> > +        aml_append(pkg, aml_name("BUFF"));
> > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > +        aml_append(method, aml_store(aml_arg(0),
> > aml_name("DWD0")));
> > +        aml_append(method, aml_store(aml_arg(1),
> > aml_name("DWD1")));
> > +        aml_append(method, aml_store(aml_arg(2),
> > aml_name("FILD")));
> > +        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
> > +                            aml_touuid("4309AC30-0D11-11E4-9191-
> > 0800200C9A66"),
> > +                            aml_int(2), aml_int(6),
> > aml_name("PKG1"),
> > +                            aml_int(handle))));
> 
> should return Integer not Buffer, it looks like implicit conversion
> will take care of it,
> but it would be better to explicitly convert it to Integer even if
> it's only for the sake
> of documenting expected return value (or add a comment)

I observed guest kernel ACPI component complaining this; just warning,
no harm. I'll re-implement it.
> 
> Also returned value in case of error NVDIMM_DSM_RET_STATUS_INVALID,
> in NVDIMM and ACPI spec differ. So fix the spec or remap returned
> value.
> 
> 
> > +        aml_append(nvdimm_dev, method);
> > +
> >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> >          aml_append(root_dev, nvdimm_dev);
> >      }
> 
> 


