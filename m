Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CDE4937B7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:49:49 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7bA-0006lb-85
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nA7QG-00079R-6P
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:38:34 -0500
Received: from mga17.intel.com ([192.55.52.151]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nA7Q9-00010Y-Ok
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642585105; x=1674121105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W/URGzdPx5cI784F2AYOoXyYGkG9khldENSL3Ltt9qA=;
 b=CX8UxPnmaZEtdr88DuFS8Dy+VY/eepzEkd/8F4z4eBiTz+JM9D8zH2Kb
 IWZsXRBsAtD/MYSwq8NRrg4T0HgPq6N5osvKwif7Xg269V7cYhuHZpGES
 O+jfupvndym8NWNFGy2eAYUMFOvrlKpic/eOn4B9mo5vlOnlHw7JU2E29
 5ZckZk3OUDCgkcsBp/Y6S6F/hl8OBrolE1RQhfIHIIiVsmgmNZ7Wz2THk
 8pjMcNFPNEQ7JEBAZ1Qh/AS/6H5zyeU2VMYNScn7yn+2VuHASgKcBKI2R
 YdQBzxT0G1GHuILhfFlYZxVw4uxyk3QW3Yry2ihSiauGkU1T3vh4Ia0G6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="225701496"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="225701496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 01:38:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="532205764"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 19 Jan 2022 01:38:16 -0800
Date: Wed, 19 Jan 2022 17:22:59 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi: Cleanup SGX related comments
Message-ID: <20220119092259.GA25040@yangzhon-Virtual>
References: <20220119120014.342180-1-yang.zhong@intel.com>
 <YefW/sAB2SEKHU24@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YefW/sAB2SEKHU24@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 09:16:46AM +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 19, 2022 at 07:00:14AM -0500, Yang Zhong wrote:
> > The SGX NUMA patches were merged into Qemu 7.0 release, we need
> > clarify detailed version history information and also change
> > some related comments, which make SGX related comments clearer.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  qapi/machine.json     |  4 ++--
> >  qapi/misc-target.json | 14 +++++++++-----
> >  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
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
> > index 1022aa0184..558521bd39 100644
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
> > @@ -365,7 +365,7 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> > -# @sections: The EPC sections info for guest
> > +# @sections: The EPC sections info for guest(Since: 7.0)
> 
> Minor point - a space is needed before '('
> 
> >  #
> >  # Since: 6.2
> >  ##
> > @@ -390,7 +390,9 @@
> >  #
> >  # -> { "execute": "query-sgx" }
> >  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > -#                  "flc": true, "section-size" : 0 } }
> > +#                  "flc": true,  "sections":
> > +#                  [{"node": 0, "size": 67108864},
> > +#                  {"node": 1, "size": 29360128}]} }
> >  #
> >  ##
> >  { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> > @@ -408,7 +410,9 @@
> >  #
> >  # -> { "execute": "query-sgx-capabilities" }
> >  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > -#                  "flc": true, "section-size" : 0 } }
> > +#                  "flc": true, "section" :
> > +#                  [{"node": 0, "size": 67108864},
> > +#                  {"node": 1, "size": 29360128}]} }
> 
> The 'section-size' shouldn't be removed here - we still need the
> command fixed to bring back the 'section-size' as it should not
> have been deleted.
> 
> Adding the 'section' docs is ok though.


  Thanks Daniel, You mean I need add extra doc like below? 6.2 and 7.0 command
  description for @query-sgx ?

  ##
  # @query-sgx:
  #
  # Returns information about SGX
  #
  # Returns: @SGXInfo
  #
  # Since: 6.2
  #
  # Example:
  #
  # -> { "execute": "query-sgx" }
  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
  #                  "flc": true, "section-size" : 0 } }
  #
  # Since: 7.0
  #
  # Example:
  #
  # -> { "execute": "query-sgx" }
  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
  #                  "flc": true,  "sections":
  #                  [{"node": 0, "size": 67108864},
  #                  {"node": 1, "size": 29360128}]} }
  #
  ##
  { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }

  If this is okay for you, I can send v2 to you, thanks!

  Yang

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

