Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BF49378E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:44:14 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Vl-0000WI-40
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:44:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA78T-0002Rt-7S
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA78Q-0004hb-Fy
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642584005;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ/e5ShB7G/83gVelFjui2ecbJpnpFTGfUTs4XL/IrI=;
 b=PtsuVV5a2IYS74KQVVUGQieX/Ay06JJ6+P3j8jQ7HTiZbFRXtwNe+GzVvSNztQVWVMhH9F
 quskA837jZCrwrX9kN4EpcpN/bzpDpfx2iUo3AAEgNXnr5tGIwYUNyeET2dy5D4Q7oQac8
 siMGcA1FKgvC5Z39ZJ6GZbq/i5SxZgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-dI8GREdCO-OfhQIhMP316Q-1; Wed, 19 Jan 2022 04:20:04 -0500
X-MC-Unique: dI8GREdCO-OfhQIhMP316Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3838B835B47;
 Wed, 19 Jan 2022 09:20:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2614F84A;
 Wed, 19 Jan 2022 09:19:52 +0000 (UTC)
Date: Wed, 19 Jan 2022 09:19:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PULL 11/13] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <YefXtfvTUCClK8Bj@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
 <20211215202515.91586-12-pbonzini@redhat.com>
 <YeBQDnavNT3ZE5mf@redhat.com>
 <20220117103731.GB20805@yangzhon-Virtual>
MIME-Version: 1.0
In-Reply-To: <20220117103731.GB20805@yangzhon-Virtual>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 06:37:31PM +0800, Yang Zhong wrote:
> On Thu, Jan 13, 2022 at 04:15:10PM +0000, Daniel P. Berrangé wrote:
> > On Wed, Dec 15, 2021 at 09:25:13PM +0100, Paolo Bonzini wrote:
> > > From: Yang Zhong <yang.zhong@intel.com>
> > > 
> > > Add the SGXEPCSection list into SGXInfo to show the multiple
> > > SGX EPC sections detailed info, not the total size like before.
> > > This patch can enable numa support for 'info sgx' command and
> > > QMP interfaces. The new interfaces show each EPC section info
> > > in one numa node. Libvirt can use QMP interface to get the
> > > detailed host SGX EPC capabilities to decide how to allocate
> > > host EPC sections to guest.
> > 
> > 
> > 
> > > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > > index 5aa2b95b7d..1022aa0184 100644
> > > --- a/qapi/misc-target.json
> > > +++ b/qapi/misc-target.json
> > > @@ -337,6 +337,21 @@
> > >    'if': 'TARGET_ARM' }
> > >  
> > >  
> > > +##
> > > +# @SGXEPCSection:
> > > +#
> > > +# Information about intel SGX EPC section info
> > > +#
> > > +# @node: the numa node
> > > +#
> > > +# @size: the size of epc section
> > > +#
> > > +# Since: 6.2
> > 
> > This is wrong because it was merged for 7.0 not 6.2
> > 
> > > +##
> > > +{ 'struct': 'SGXEPCSection',
> > > +  'data': { 'node': 'int',
> > > +            'size': 'uint64'}}
> > > +
> > >  ##
> > >  # @SGXInfo:
> > >  #
> > > @@ -350,7 +365,7 @@
> > >  #
> > >  # @flc: true if FLC is supported
> > >  #
> > > -# @section-size: The EPC section size for guest
> > > +# @sections: The EPC sections info for guest
> > 
> > This is a non-backwards compatible schema change.
> > 
> > "@section-size" must not be removed without going
> > through a deprecation period, so this needs to be
> > re-instated.
> > 
> > The "@sections" addition needs a "Since 7.0" annotation too.
> > 
> > 
> > Yong, can you submit a followup patch to correct these mistakes
> > 
> 
>   Thanks, I will submit one patch to fix this version issue. This series
>   support SGX NUMA, the background is SGX EPC section number is not fixed(<=8)
>   I added this "@sections" to include numa node and EPC section size, which can
>   be shown how to allocate EPC sections to different NUMA nodes in the VM.
>   The older "@section-size" is only suitable for one EPC section on one NUMA node
>   in one VM, so I moved this size into "@sections" here for NUMA support.

I understand the motivation for introducing '@sections' for NUMA and have
no objection to doing that.

The problem is that you also removed "@section-size" and this is an
incompatible API breakage. The QMP command schema promises backwards
compatibility as standard. If any field needs to be removed it is
*mandatory* to mark the field as deprecated for a minimum of two
QEMU releases, beforef it is permitted to remove it.

IOW, we need to have *both*  @sections and @section-size reported
for at least QEMU 7.0.0 and 7.1.0 releases. If you deprecate @section-size
in 7.0.0, the soonest you can delete it is in the 7.2.0 release.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


