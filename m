Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29144D405
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:27:09 +0100 (CET)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6MO-0007oK-Ef
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6LW-00075N-Kx
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:26:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6LV-0004Rc-05
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636622772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2Hw/GZ529hu0TcJw7IYZH49R1NWhxJb8WpPKJXJP2gA=;
 b=IHOWX0HP24D9xTtZYtA2sfdtCTY/swYyti2trwVOt0YeMlgHiT1QhMa98mZKfLwtu4rXd6
 2m/EhDdDJg7xlOyX8y0MSzflu01lrhdzoUkoHr3wDeyLdmbC8LTbH2XUtG2g8bosoB1tII
 AATXUtdiBMg2A2NZ0uliQyKkg4rrMW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-f99vd9azMbS3g35rgFkRKw-1; Thu, 11 Nov 2021 04:26:08 -0500
X-MC-Unique: f99vd9azMbS3g35rgFkRKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A7D875108;
 Thu, 11 Nov 2021 09:26:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 636FA60854;
 Thu, 11 Nov 2021 09:26:04 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:26:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2 1/6] qapi/qom,target/i386: sev-guest: Introduce
 kernel-hashes=on|off option
Message-ID: <YYzhqUkFqpgsDIyC@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-2-dovmurik@linux.ibm.com>
 <87h7cmk5n5.fsf@dusky.pond.sub.org>
 <32a065bb-ec2e-f2e7-356b-68b41531aab1@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <32a065bb-ec2e-f2e7-356b-68b41531aab1@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 08:20:48PM +0200, Dov Murik wrote:
> 
> 
> On 08/11/2021 17:51, Markus Armbruster wrote:
> > Dov Murik <dovmurik@linux.ibm.com> writes:
> > 
> >> Introduce new boolean 'kernel-hashes' option on the sev-guest object.
> >> It will be used to to decide whether to add the hashes of
> >> kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
> >> The default value is 'off'.
> >>
> >> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >> ---
> >>  qapi/qom.json     |  7 ++++++-
> >>  target/i386/sev.c | 20 ++++++++++++++++++++
> >>  qemu-options.hx   |  6 +++++-
> >>  3 files changed, 31 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/qapi/qom.json b/qapi/qom.json
> >> index ccd1167808..4fd5d1716b 100644
> >> --- a/qapi/qom.json
> >> +++ b/qapi/qom.json
> >> @@ -769,6 +769,10 @@
> >>  # @reduced-phys-bits: number of bits in physical addresses that become
> >>  #                     unavailable when SEV is enabled
> >>  #
> >> +# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
> >> +#                 designated guest firmware page for measured boot
> >> +#                 with -kernel (default: false)
> > 
> > Missing: (since 7.0)
> > 
> 
> I agree the "since" clause is missing, but I think this series (at least
> patches 1-4) should be considered a bug fix (because booting with
> -kernel will break in 6.2 for older OVMF which doesn't have guest
> firmware area for hashes).
> 
> I think it should be added for 6.2.
> 
> Paolo?
> 
> 
> If agreed, the hunk should be:

Yes, the kernel hashes feature was introduced in this 6.2 dev
cycle, and this patch is fixing a significant behavioural
problem with it. We need this included in the 6.2 release


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


