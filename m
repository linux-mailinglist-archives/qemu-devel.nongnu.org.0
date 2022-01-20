Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E3494BAA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:28:26 +0100 (CET)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUg4-0005ll-RY
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nATn9-00061M-TX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:31:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nATn5-0001yJ-Dh
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642671095; x=1674207095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y09SI+oBNbiZRQePPSXfWTBUxmhyxPkphAbJCfvEwbQ=;
 b=guhuZRSXjccfdyKTquTjmVOyE4xZmA5GeKvKUQDxVfLbzlWBaN8xWzMp
 gPQTm6Hpw0d2q774e9Vm5ZhU7dGgLdzNRL9msngiztafBJRkWIdsi1Q7W
 4PRFlU3vq7pn8zjfe4U1xn2WzIgiNQ7uSPhOlzOLJvqVsihGDtIcHU/CK
 DOFZVO5R5Tc1GvtFAP4wk7/2If0MUa5KG4IKNS3J8EwbTsf7gLbTeM4Sx
 Ste1WIRqaTrkQTXJQ/y3dIQ4TpQKdOEZJSzX81b+8wGOJ1uH0UHgW9qmY
 kp+q3VwVHvtxnPU/v1TVAH2oVB8tU2TEYwottbxtBpWLD3kptevKMX4iI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="242874175"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="242874175"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:31:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="694135085"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 01:31:19 -0800
Date: Thu, 20 Jan 2022 17:16:01 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Message-ID: <20220120091601.GA27922@yangzhon-Virtual>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeknCiBuMEaD3XP2@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 09:10:34AM +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
> > The SGX NUMA patches were merged into Qemu 7.0 release, we need
> > clarify detailed version history information and also change
> > some related comments, which make SGX related comments clearer.
> > 
> > The QMP command schema promises backwards compatibility as standard.
> > We temporarily restore "@section-size", which can avoid incompatible
> > API breakage. The "@section-size" will be deprecated in 7.2 version.
> > 
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  qapi/machine.json     |  4 ++--
> >  qapi/misc-target.json | 17 ++++++++++++-----
> >  hw/i386/sgx.c         | 11 +++++++++--
> >  3 files changed, 23 insertions(+), 9 deletions(-)
> > 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index b6a37e17c4..cf47cb63a9 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1207,7 +1207,7 @@
> >  #
> >  # @memdev: memory backend linked with device
> >  #
> > -# @node: the numa node
> > +# @node: the numa node (Since: 7.0)
> >  #
> >  # Since: 6.2
> >  ##
> > @@ -1288,7 +1288,7 @@
> >  #
> >  # @memdev: memory backend linked with device
> >  #
> > -# @node: the numa node
> > +# @node: the numa node (Since: 7.0)
> >  #
> >  # Since: 6.2
> >  ##
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 1022aa0184..a87358ea44 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -344,9 +344,9 @@
> >  #
> >  # @node: the numa node
> >  #
> > -# @size: the size of epc section
> > +# @size: the size of EPC section
> >  #
> > -# Since: 6.2
> > +# Since: 7.0
> >  ##
> >  { 'struct': 'SGXEPCSection',
> >    'data': { 'node': 'int',
> > @@ -365,7 +365,9 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> > -# @sections: The EPC sections info for guest
> > +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> 
> I expected deprecation would start now (7.0, and it would be removed
> in 7.2.
> 
> Also needs to be documented in docs/about/deprecated.rst
> 
> 
  
   Thanks Daniel, Please check if below comments are okay or not? If no
   problem, I will send v3 today, thanks! 
 
   diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
   index e21e07478f..810542427f 100644
   --- a/docs/about/deprecated.rst
   +++ b/docs/about/deprecated.rst
   @@ -441,3 +441,13 @@ nanoMIPS ISA

   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
   As it is hard to generate binaries for it, declare it deprecated.
   +
   +
   +SGX backwards compatibility
   +---------------------------
   +
   +@section-size (Since 7.0)
   +''''''''''''''''''''''''
   +
   +The ``@section-size`` will be replaced with ``@sections`` struct and declare
   +it deprecated.
   diff --git a/qapi/misc-target.json b/qapi/misc-target.json
   index a87358ea44..c88fd0c2a2 100644
   --- a/qapi/misc-target.json
   +++ b/qapi/misc-target.json
   @@ -365,7 +365,7 @@
   #
   # @flc: true if FLC is supported
   #
  -# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
  +# @section-size: The EPC section size for guest (7.0, and it would be removed in 7.2)
   #
   # @sections: The EPC sections info for guest (Since: 7.0) 
   
   Regards,

   Yang


> 
> > +#
> > +# @sections: The EPC sections info for guest (Since: 7.0)
> >  #
> >  # Since: 6.2
> >  ##
> > @@ -374,6 +376,7 @@
> >              'sgx1': 'bool',
> >              'sgx2': 'bool',
> >              'flc': 'bool',
> > +            'section-size': 'uint64',
> >              'sections': ['SGXEPCSection']},
> >     'if': 'TARGET_I386' }
> >  
> > @@ -390,7 +393,9 @@
> >  #
> >  # -> { "execute": "query-sgx" }
> >  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > -#                  "flc": true, "section-size" : 0 } }
> > +#                  "flc": true,  "section-size" : 96468992,
> > +#                  "sections": [{"node": 0, "size": 67108864},
> > +#                  {"node": 1, "size": 29360128}]} }
> >  #
> >  ##
> >  { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> > @@ -408,7 +413,9 @@
> >  #
> >  # -> { "execute": "query-sgx-capabilities" }
> >  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > -#                  "flc": true, "section-size" : 0 } }
> > +#                  "flc": true, "section-size" : 96468992,
> > +#                  "section" : [{"node": 0, "size": 67108864},
> > +#                  {"node": 1, "size": 29360128}]} }
> >  #
> >  ##
> >  { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > index 5de5dd0893..a2b318dd93 100644
> > --- a/hw/i386/sgx.c
> > +++ b/hw/i386/sgx.c
> > @@ -83,7 +83,7 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
> >             ((high & MAKE_64BIT_MASK(0, 20)) << 32);
> >  }
> >  
> > -static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
> > +static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
> >  {
> >      SGXEPCSectionList *head = NULL, **tail = &head;
> >      SGXEPCSection *section;
> > @@ -106,6 +106,7 @@ static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
> >          section = g_new0(SGXEPCSection, 1);
> >          section->node = j++;
> >          section->size = sgx_calc_section_metric(ecx, edx);
> > +        *size += section->size;
> >          QAPI_LIST_APPEND(tail, section);
> >      }
> >  
> > @@ -156,6 +157,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
> >  {
> >      SGXInfo *info = NULL;
> >      uint32_t eax, ebx, ecx, edx;
> > +    uint64_t size = 0;
> >  
> >      int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
> >      if (fd < 0) {
> > @@ -173,7 +175,8 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
> >      info->sgx1 = eax & (1U << 0) ? true : false;
> >      info->sgx2 = eax & (1U << 1) ? true : false;
> >  
> > -    info->sections = sgx_calc_host_epc_sections();
> > +    info->sections = sgx_calc_host_epc_sections(&size);
> > +    info->section_size = size;
> >  
> >      close(fd);
> >  
> > @@ -220,12 +223,14 @@ SGXInfo *qmp_query_sgx(Error **errp)
> >          return NULL;
> >      }
> >  
> > +    SGXEPCState *sgx_epc = &pcms->sgx_epc;
> >      info = g_new0(SGXInfo, 1);
> >  
> >      info->sgx = true;
> >      info->sgx1 = true;
> >      info->sgx2 = true;
> >      info->flc = true;
> > +    info->section_size = sgx_epc->size;
> >      info->sections = sgx_get_epc_sections_list();
> >  
> >      return info;
> > @@ -249,6 +254,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> >                     info->sgx2 ? "enabled" : "disabled");
> >      monitor_printf(mon, "FLC support: %s\n",
> >                     info->flc ? "enabled" : "disabled");
> > +    monitor_printf(mon, "size: %" PRIu64 "\n",
> > +                   info->section_size);
> >  
> >      section_list = info->sections;
> >      for (section = section_list; section; section = section->next) {
> > 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

