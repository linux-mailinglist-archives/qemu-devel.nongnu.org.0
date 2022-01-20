Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44139495459
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:44:47 +0100 (CET)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcQQ-0006Fn-4O
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAXZF-0000NX-8x
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:33:36 -0500
Received: from mga06.intel.com ([134.134.136.31]:54065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAXZ2-0003ET-ME
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642685600; x=1674221600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xIBAo0jnN5VKZaniLGZTzBzdnuHLe/OGisetX0JUBK0=;
 b=lXebpnkziP3qPyMrVR5rxypLQQGIzxDVX/1rR2NuEy3r+cwdHfclAYWo
 6787E3Xj2ZI7OTQM+M7AsK1igUku4rrydhqFBuowvRpdEK3M98N5f22zB
 Zzk598IOldSMaJVem0ea378M2NkaA3aSDuKFLVynarIY7AEB9sWK3ylgj
 PTBpAB5v2G3oSx+bsLGPpb/ICvG7UWRZSAqHo2+2z5sFizSwD+u5pjX+e
 1EOTAnk1PX7vFq2qXnUDte2q/PUvjONHy6cpq15SetiYKk3Or2KN4XApS
 XFOtYTM/DMNH3C4Gc+hlJ8EAypb74LkRNmtO1kNyfMz83ow9TXqjSKrXm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="306081513"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="306081513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 05:32:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="477787731"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 05:32:35 -0800
Date: Thu, 20 Jan 2022 21:17:17 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 f4bug@amsat.org
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Message-ID: <20220120131717.GA28380@yangzhon-Virtual>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
 <20220120091601.GA27922@yangzhon-Virtual>
 <YekvAuBUzcfSaHiT@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YekvAuBUzcfSaHiT@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On Thu, Jan 20, 2022 at 09:44:34AM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 20, 2022 at 05:16:01PM +0800, Yang Zhong wrote:
> > On Thu, Jan 20, 2022 at 09:10:34AM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
> > > > The SGX NUMA patches were merged into Qemu 7.0 release, we need
> > > > clarify detailed version history information and also change
> > > > some related comments, which make SGX related comments clearer.
> > > > 
> > > > The QMP command schema promises backwards compatibility as standard.
> > > > We temporarily restore "@section-size", which can avoid incompatible
> > > > API breakage. The "@section-size" will be deprecated in 7.2 version.
> > > > 
> > > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >  qapi/machine.json     |  4 ++--
> > > >  qapi/misc-target.json | 17 ++++++++++++-----
> > > >  hw/i386/sgx.c         | 11 +++++++++--
> > > >  3 files changed, 23 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > > index b6a37e17c4..cf47cb63a9 100644
> > > > --- a/qapi/machine.json
> > > > +++ b/qapi/machine.json
> > > > @@ -1207,7 +1207,7 @@
> > > >  #
> > > >  # @memdev: memory backend linked with device
> > > >  #
> > > > -# @node: the numa node
> > > > +# @node: the numa node (Since: 7.0)
> > > >  #
> > > >  # Since: 6.2
> > > >  ##
> > > > @@ -1288,7 +1288,7 @@
> > > >  #
> > > >  # @memdev: memory backend linked with device
> > > >  #
> > > > -# @node: the numa node
> > > > +# @node: the numa node (Since: 7.0)
> > > >  #
> > > >  # Since: 6.2
> > > >  ##
> > > > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > > > index 1022aa0184..a87358ea44 100644
> > > > --- a/qapi/misc-target.json
> > > > +++ b/qapi/misc-target.json
> > > > @@ -344,9 +344,9 @@
> > > >  #
> > > >  # @node: the numa node
> > > >  #
> > > > -# @size: the size of epc section
> > > > +# @size: the size of EPC section
> > > >  #
> > > > -# Since: 6.2
> > > > +# Since: 7.0
> > > >  ##
> > > >  { 'struct': 'SGXEPCSection',
> > > >    'data': { 'node': 'int',
> > > > @@ -365,7 +365,9 @@
> > > >  #
> > > >  # @flc: true if FLC is supported
> > > >  #
> > > > -# @sections: The EPC sections info for guest
> > > > +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> > > 
> > > I expected deprecation would start now (7.0, and it would be removed
> > > in 7.2.
> > > 
> > > Also needs to be documented in docs/about/deprecated.rst
> > > 
> > > 
> >   
> >    Thanks Daniel, Please check if below comments are okay or not? If no
> >    problem, I will send v3 today, thanks! 
> >  
> >    diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >    index e21e07478f..810542427f 100644
> >    --- a/docs/about/deprecated.rst
> >    +++ b/docs/about/deprecated.rst
> >    @@ -441,3 +441,13 @@ nanoMIPS ISA
> > 
> >    The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> >    As it is hard to generate binaries for it, declare it deprecated.
> >    +
> >    +
> >    +SGX backwards compatibility
> >    +---------------------------
> >    +
> >    +@section-size (Since 7.0)
> >    +''''''''''''''''''''''''
> >    +
> >    +The ``@section-size`` will be replaced with ``@sections`` struct and declare
> >    +it deprecated.
> 
> This needs to be higher up in the file - look at the section
> with the heading 'QEMU Machine Protocol (QMP) commands' for
> how we list QMP features we're removing.
>   

   Thanks, I will add this in v3.
 
> 
> >    diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> >    index a87358ea44..c88fd0c2a2 100644
> >    --- a/qapi/misc-target.json
> >    +++ b/qapi/misc-target.json
> >    @@ -365,7 +365,7 @@
> >    #
> >    # @flc: true if FLC is supported
> >    #
> >   -# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> >   +# @section-size: The EPC section size for guest (7.0, and it would be removed in 7.2)
> 
> We don't need this comment - see the other reply in this thread
> about using an '@deprecated' tag instead, which gets turned into
> a comment in the auto-generated documentation. 
> 

  Thanks Daniel, it is strange that my mail couldn't receive this mail. But I checked this
  from link(https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg04247.html).

  So here, I also thanks Philippe, who shared one helpful example for me. thanks again!

  Yang 


> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

