Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C463ED8E0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:25:21 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdYF-00075R-Uk
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFdX7-0006Ns-MN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFdX3-0006Q7-B3
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629123843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TU9WQqclCj5JWpeWLZIR7qY0KU/ywm/jjSLxeA7lujc=;
 b=hVUHIJuxcYFJeVLdRFcOYZh6f/DDTA1rtnyxEdtkV/d6k62HmF9lGenPxymkzcYsuRMwNw
 8mazb/kHNR4Js7czh8TQCkGhHFcCjEI1EXUZBZ6UnaLqYYG0M5p/jM714bhk7vGcnkUkko
 AjZtgITi8KQ4RaHaoUCdmmrIHbD4fA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-GDv6rcngPZi8eOuy76aKWQ-1; Mon, 16 Aug 2021 10:24:02 -0400
X-MC-Unique: GDv6rcngPZi8eOuy76aKWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D94F800493;
 Mon, 16 Aug 2021 14:24:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EFE75D9D3;
 Mon, 16 Aug 2021 14:23:52 +0000 (UTC)
Date: Mon, 16 Aug 2021 15:23:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YRp09sXRaNPefs2g@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, richard.henderson@linaro.org, jejb@linux.ibm.com,
 tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com, frankeh@us.ibm.com,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 04:15:46PM +0200, Paolo Bonzini wrote:
> On 16/08/21 15:25, Ashish Kalra wrote:
> > From: Ashish Kalra<ashish.kalra@amd.com>
> > 
> > This is an RFC series for Mirror VM support that are
> > essentially secondary VMs sharing the encryption context
> > (ASID) with a primary VM. The patch-set creates a new
> > VM and shares the primary VM's encryption context
> > with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> > The mirror VM uses a separate pair of VM + vCPU file
> > descriptors and also uses a simplified KVM run loop,
> > for example, it does not support any interrupt vmexit's. etc.
> > Currently the mirror VM shares the address space of the
> > primary VM.
> > 
> > The mirror VM can be used for running an in-guest migration
> > helper (MH). It also might have future uses for other in-guest
> > operations.
> 

snip

> With this implementation, the number of mirror vCPUs does not even have to
> be indicated on the command line.  The VM and its vCPUs can simply be
> created when migration starts.  In the SEV-ES case, the guest can even
> provide the VMSA that starts the migration helper.

I don't think management apps will accept that approach when pinning
guests. They will want control over how many extra vCPU threads are
created, what host pCPUs they are pinned to, and what schedular
policies might be applied to them.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


