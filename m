Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4B4002FE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:12:12 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBnX-0003im-Ll
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mMBdJ-0004L5-Ds
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mMBdH-0005FH-9u
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684894;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ybHw7U4g3iVRZxIp5kFJ8XRmPMWIYv/Oqv8Fl2TUX8o=;
 b=NYZzEOjlU3Fwxl/z0vi6mpys/wLJ51NjIg8yZzE1/n6egZvdFxF4pnqpOOS9mtvb8qeJA3
 Ib4Z2E6GBwokvWo1zR6wIueq+oH7E0/GryK9W3qz9nijIfsg9CZ1KiaRjeubGchnh9I0fS
 mxsrJINgWC4m1PM9fiL/hahgfiPfa2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-gofoRV0fOo-HWvDl8q6ZYg-1; Fri, 03 Sep 2021 12:01:30 -0400
X-MC-Unique: gofoRV0fOo-HWvDl8q6ZYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7D01DF8A5;
 Fri,  3 Sep 2021 16:01:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B7D19C59;
 Fri,  3 Sep 2021 16:01:21 +0000 (UTC)
Date: Fri, 3 Sep 2021 17:01:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v2 12/12] i386/sev: update query-sev QAPI format to
 handle SEV-SNP
Message-ID: <YTJGzrnqO9vzUqNq@redhat.com>
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-13-michael.roth@amd.com>
 <87tuj4qt71.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tuj4qt71.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 04:14:10PM +0200, Markus Armbruster wrote:
> Michael Roth <michael.roth@amd.com> writes:
> 
> > Most of the current 'query-sev' command is relevant to both legacy
> > SEV/SEV-ES guests and SEV-SNP guests, with 2 exceptions:
> >
> >   - 'policy' is a 64-bit field for SEV-SNP, not 32-bit, and
> >     the meaning of the bit positions has changed
> >   - 'handle' is not relevant to SEV-SNP
> >
> > To address this, this patch adds a new 'sev-type' field that can be
> > used as a discriminator to select between SEV and SEV-SNP-specific
> > fields/formats without breaking compatibility for existing management
> > tools (so long as management tools that add support for launching
> > SEV-SNP guest update their handling of query-sev appropriately).
> 
> Technically a compatibility break: query-sev can now return an object
> that whose member @policy has different meaning, and also lacks @handle.
> 
> Matrix:
> 
>                             Old mgmt app    New mgmt app
>     Old QEMU, SEV/SEV-ES       good            good(1)
>     New QEMU, SEV/SEV-ES       good(2)         good
>     New QEMU, SEV-SNP           bad(3)         good
> 
> Notes:
> 
> (1) As long as the management application can cope with absent member
> @sev-type.
> 
> (2) As long as the management application ignores unknown member
> @sev-type.
> 
> (3) Management application may choke on missing member @handle, or
> worse, misinterpret member @policy.  Can only happen when something
> other than the management application created the SEV-SNP guest (or the
> user somehow made the management application create one even though it
> doesn't know how, say with CLI option passthrough, but that's always
> fragile, and I wouldn't worry about it here).
> 
> I think (1) and (2) are reasonable.  (3) is an issue for management
> applications that support attaching to existing guests.  Thoughts?

IIUC you can only reach scenario (3) if you have created a guest
using '-object sev-snp-guest', which is a new feature introduced
in patch 2.

IOW, scenario (3)  old mgmt app + new QEMU + sev-snp guest does
not exist as a combination. Thus the (bad) field is actually (n/a)

So I believe this proposed change is acceptable in all scenarios
with existing deployed usage, as well as all newly introduced
scenarios.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


