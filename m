Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFD4A595D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:40:01 +0100 (CET)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpdo-0005lH-E8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpJn-0006VY-95
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpJl-0003GU-3E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643707153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4F3QfhYQny+qF7mmtLii/jveeg/oKcQ+v4twmwYnfE=;
 b=BYDVSReK0CzgnSMY5i9dQ9/DAD/xBEodev4WYOKRh84Hc8Kd4MHe8akTcrW8yeBMz7cdYP
 uVyRistZ17FWcz7c0zg74JhUGADtg5uNfiKckaMVZG+b6HEypSwnc1lOqX45aBZscSX9q+
 hwshop3AqeMtRUi3re2FGW29p1GVF5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Ypj9hHNgOEyEYOAXl49i2w-1; Tue, 01 Feb 2022 04:19:12 -0500
X-MC-Unique: Ypj9hHNgOEyEYOAXl49i2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E8E083DD2B;
 Tue,  1 Feb 2022 09:19:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D58FD1084266;
 Tue,  1 Feb 2022 09:18:20 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:18:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <Yfj62JWk7/VqOFDa@redhat.com>
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
 <Yfgkdij1x2gSTdXt@redhat.com>
 <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 05:18:04PM -0300, Leonardo Bras Soares Passos wrote:
> On Mon, Jan 31, 2022 at 3:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos wrote:
> > > What I meant here is:
> > > 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
> > > thus have those bits enabled)
> > > 2 - Guest is migrated to a host such as the above, which does not
> > > support those features (bits disabled), but does support EPYC-Milan
> > > cpus (without those features).
> > > 3 - The migration should be allowed, given the same cpu types. Then
> > > either we have:
> > > 3a : The guest vcpu stays with the flag enabled (case I tried to
> > > explain above), possibly crashing if the new feature is used, or
> > > 3b: The guest vcpu disables the flag due to incompatibility,  which
> > > may make the guest confuse due to cpu change, and even end up trying
> > > to use the new feature on the guest, even if it's disabled.
> >
> > Neither should happen with a correctly written mgmt app in charge.
> >
> > When launching a QEMU process for an incoming migration, it is expected
> > that the mgmt app has first queried QEMU on the source to get the precise
> > CPU model + flags that were added/removed on the source. The QEMU on
> > the target is then launched with this exact set of flags, and the
> > 'check' flag is also set for -cpu. That will cause QEMU on the target
> > to refuse to start unless it can give the guest the 100% identical
> > CPUID to what has been requested on the CLI, and thus matching the
> > source.
> >
> > Libvirt will ensure all this is done correctly. If not using libvirt
> > then you've got a bunch of work to do to achieve this. It certainly
> > isn't sufficient to merely use the same plain '-cpu' arg that the
> > soruce was original booted with, unless you have 100% identical
> > hardware, microcode, and software on both hosts, or the target host
> > offers a superset of features.
> 
> Oh, that is very interesting! Thanks for sharing!
> 
> Well, then at least one unexpected scenario should happen:
> - VM with EPYC-Milan cpu, created in source host
> - Source host with EPYC-Milan cpu. Support for 'extra features'
> enabled ( erms / fsrm in this ex.)
> - Target host with EPYC-Milan cpu. No support for 'extra features'.
> Since the VM will be created with support for 'extra features', trying
> to migrate from source host to target host should fail, right?
> 
> Which is, IMHO, odd. I imagine questions like:

Yes, it can certainly be surprising to users. It is a never ending
source of support requests from users. Note this isn't an AMD problem,
it affects Intel too, and indeed any scenario where features can be
hidden/visible based on firmware settings or microcode updates.

The classic is Intel removing the TSX related features in microcode
updates, which results in their CPUs loosing the hle and rtm features.
This has caused migration compatibility pain for so many people.

> - "How does a host with EPYC-Milan cpu does not offer support to
> receive a live migration of some VMs with EPYC-Milan cpu?", or even
> - "If I can create a VM with EPYC-Milan cpu on that host, why can't I
> receive (via migration) some VMs with EPYC-Milan CPU ?"

Yes, these are exactly the questions we get from users quite
frequently.

Ultimately we need to explain that there's more to CPU compatibility
than merely the physical hardware, rather it covers

 - Physical CPU
 - Microcode update
 - Firmware settings
 - Host kernel version
 - QEMU version

Any one of those pieces can prevent a given feature being usable
by the guest, and so be the cause of live migration compatibility
trouble.

The number 1 priority is that mgmt apps don't allow the migration
to start if there is such an incompatibility, and we're pretty
good at that now.

After that is becomes a documentation and training problem. It is
important to understand that if users have a cluster of machines that
they want to live migrate between, keeping those 5 pieces in sync
across all machines is very important. Microcode is usually the most
trouble, since it is the one that actively removes existing features
most frequently. We've had the kernel remove features proactively
though, to prevent VMs using them, in the expectation that a future
microcode update might later remove the same feature.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


