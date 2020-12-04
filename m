Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090BC2CEEC8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:29:07 +0100 (CET)
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klB8z-0001tr-It
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klB5Y-0000Lb-88
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klB5W-0000g8-IZ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607088330;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X/a++xww5bzaRfGpbjrSlypbsSv7INhqHTSBjxbZQlc=;
 b=U0S9Ta3Pxtu0TorZo6vCRn5l9lPEgQnbsXBwvepl8v/JDsZnICWaW4htD9sp4cBajKBc/g
 hzJRLe2dr24PVUlpPkMMXbitkz5MLAu9Hzefj9nAD9BnNnBys1j8QEtn8Owd+q/maM4C5H
 ha7IRIjws0VijD2Euqc7+hLWjNf9p+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-monpTWtON_mFFFUnjNVkCw-1; Fri, 04 Dec 2020 08:25:17 -0500
X-MC-Unique: monpTWtON_mFFFUnjNVkCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189C1800D55;
 Fri,  4 Dec 2020 13:25:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A805C22B;
 Fri,  4 Dec 2020 13:25:03 +0000 (UTC)
Date: Fri, 4 Dec 2020 13:25:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201204132500.GI3056135@redhat.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204130727.GD2883@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 thuth@redhat.com, pbonzini@redhat.com, david@redhat.com, rth@twiddle.net,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 01:07:27PM +0000, Dr. David Alan Gilbert wrote:
> * Cornelia Huck (cohuck@redhat.com) wrote:
> > On Fri, 4 Dec 2020 09:06:50 +0100
> > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > 
> > > On 04.12.20 06:44, David Gibson wrote:
> > > > A number of hardware platforms are implementing mechanisms whereby the
> > > > hypervisor does not have unfettered access to guest memory, in order
> > > > to mitigate the security impact of a compromised hypervisor.
> > > > 
> > > > AMD's SEV implements this with in-cpu memory encryption, and Intel has
> > > > its own memory encryption mechanism.  POWER has an upcoming mechanism
> > > > to accomplish this in a different way, using a new memory protection
> > > > level plus a small trusted ultravisor.  s390 also has a protected
> > > > execution environment.
> > > > 
> > > > The current code (committed or draft) for these features has each
> > > > platform's version configured entirely differently.  That doesn't seem
> > > > ideal for users, or particularly for management layers.
> > > > 
> > > > AMD SEV introduces a notionally generic machine option
> > > > "machine-encryption", but it doesn't actually cover any cases other
> > > > than SEV.
> > > > 
> > > > This series is a proposal to at least partially unify configuration
> > > > for these mechanisms, by renaming and generalizing AMD's
> > > > "memory-encryption" property.  It is replaced by a
> > > > "securable-guest-memory" property pointing to a platform specific  
> > > 
> > > Can we do "securable-guest" ?
> > > s390x also protects registers and integrity. memory is only one piece
> > > of the puzzle and what we protect might differ from platform to 
> > > platform.
> > > 
> > 
> > I agree. Even technologies that currently only do memory encryption may
> > be enhanced with more protections later.
> 
> There's already SEV-ES patches onlist for this on the SEV side.
> 
> <sigh on haggling over the name>
> 
> Perhaps 'confidential guest' is actually what we need, since the
> marketing folks seem to have started labelling this whole idea
> 'confidential computing'.

I think we shouldn't worry about the specific name too much, as it
won't be visible much outside QEMU and the internals of the immediate
layer above such as libvirt. What matters much more is that we have
documentation that clearly explains what the different levels of
protection are for each different architecture, and/or generation of
architecture. Mgmt apps / end users need understand exactly what
kind of unicorns they are being promised for a given configuration.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


