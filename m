Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37354494C90
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:13:08 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVNL-0000TW-AG
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATzw-0002Xx-N0
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:44:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATzt-0003dC-6W
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642671886;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Da8f/S3THRqD1P522OhcD5K312+OO78AVaS3t+WQEo=;
 b=fxyRJNGQ6rNC3s5BkEWOZgrs8VM9fcxOYlwGx5SHPbiWV68GLnb7s868nka6gLRzwQp73f
 67tYfgDATL620QnGvyNPiHM++q5wMZYEVbIdV1ZRSV+6Cz9YFKuE7DLQe/nR/WERYLjQIT
 guB6sYk31H0PIL4GBkjZj7LUV8EyYH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-C0HU9H_gPtCCgblZnnvqXg-1; Thu, 20 Jan 2022 04:44:39 -0500
X-MC-Unique: C0HU9H_gPtCCgblZnnvqXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6AE84DA40;
 Thu, 20 Jan 2022 09:44:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1657E2C5;
 Thu, 20 Jan 2022 09:44:37 +0000 (UTC)
Date: Thu, 20 Jan 2022 09:44:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Message-ID: <YekvAuBUzcfSaHiT@redhat.com>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
 <20220120091601.GA27922@yangzhon-Virtual>
MIME-Version: 1.0
In-Reply-To: <20220120091601.GA27922@yangzhon-Virtual>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 05:16:01PM +0800, Yang Zhong wrote:
> On Thu, Jan 20, 2022 at 09:10:34AM +0000, Daniel P. Berrangé wrote:
> > On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
> > > The SGX NUMA patches were merged into Qemu 7.0 release, we need
> > > clarify detailed version history information and also change
> > > some related comments, which make SGX related comments clearer.
> > > 
> > > The QMP command schema promises backwards compatibility as standard.
> > > We temporarily restore "@section-size", which can avoid incompatible
> > > API breakage. The "@section-size" will be deprecated in 7.2 version.
> > > 
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >  qapi/machine.json     |  4 ++--
> > >  qapi/misc-target.json | 17 ++++++++++++-----
> > >  hw/i386/sgx.c         | 11 +++++++++--
> > >  3 files changed, 23 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > index b6a37e17c4..cf47cb63a9 100644
> > > --- a/qapi/machine.json
> > > +++ b/qapi/machine.json
> > > @@ -1207,7 +1207,7 @@
> > >  #
> > >  # @memdev: memory backend linked with device
> > >  #
> > > -# @node: the numa node
> > > +# @node: the numa node (Since: 7.0)
> > >  #
> > >  # Since: 6.2
> > >  ##
> > > @@ -1288,7 +1288,7 @@
> > >  #
> > >  # @memdev: memory backend linked with device
> > >  #
> > > -# @node: the numa node
> > > +# @node: the numa node (Since: 7.0)
> > >  #
> > >  # Since: 6.2
> > >  ##
> > > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > > index 1022aa0184..a87358ea44 100644
> > > --- a/qapi/misc-target.json
> > > +++ b/qapi/misc-target.json
> > > @@ -344,9 +344,9 @@
> > >  #
> > >  # @node: the numa node
> > >  #
> > > -# @size: the size of epc section
> > > +# @size: the size of EPC section
> > >  #
> > > -# Since: 6.2
> > > +# Since: 7.0
> > >  ##
> > >  { 'struct': 'SGXEPCSection',
> > >    'data': { 'node': 'int',
> > > @@ -365,7 +365,9 @@
> > >  #
> > >  # @flc: true if FLC is supported
> > >  #
> > > -# @sections: The EPC sections info for guest
> > > +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
> > 
> > I expected deprecation would start now (7.0, and it would be removed
> > in 7.2.
> > 
> > Also needs to be documented in docs/about/deprecated.rst
> > 
> > 
>   
>    Thanks Daniel, Please check if below comments are okay or not? If no
>    problem, I will send v3 today, thanks! 
>  
>    diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>    index e21e07478f..810542427f 100644
>    --- a/docs/about/deprecated.rst
>    +++ b/docs/about/deprecated.rst
>    @@ -441,3 +441,13 @@ nanoMIPS ISA
> 
>    The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>    As it is hard to generate binaries for it, declare it deprecated.
>    +
>    +
>    +SGX backwards compatibility
>    +---------------------------
>    +
>    +@section-size (Since 7.0)
>    +''''''''''''''''''''''''
>    +
>    +The ``@section-size`` will be replaced with ``@sections`` struct and declare
>    +it deprecated.

This needs to be higher up in the file - look at the section
with the heading 'QEMU Machine Protocol (QMP) commands' for
how we list QMP features we're removing.


>    diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>    index a87358ea44..c88fd0c2a2 100644
>    --- a/qapi/misc-target.json
>    +++ b/qapi/misc-target.json
>    @@ -365,7 +365,7 @@
>    #
>    # @flc: true if FLC is supported
>    #
>   -# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
>   +# @section-size: The EPC section size for guest (7.0, and it would be removed in 7.2)

We don't need this comment - see the other reply in this thread
about using an '@deprecated' tag instead, which gets turned into
a comment in the auto-generated documentation. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


