Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F93A053F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:47:08 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqict-00058x-9h
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqibD-00040j-GI
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqib9-0002Iz-Tu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623185118;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inYyUCzEPNq4Ie7mgPs6At4ZMwbCVStRAxjvOeXEmb0=;
 b=MHlBfrc92Q7dKf1CFuERJdR+ab7/MnA2qhsIzvcWdsjJmSvKSYzjJW5ic/NDDEAhYJP4nP
 oRasA32GgbzqJEHmziRFGiY96pxYEcsmpPgJ+la8dZ3YQRJU/MZc/6ddepPJ2vBCCZGTZI
 OG+GPqv/kaNQAelE9TRhHGvqfnfty2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-qaLI2FWfM6Sf9XldOJuFJA-1; Tue, 08 Jun 2021 16:45:16 -0400
X-MC-Unique: qaLI2FWfM6Sf9XldOJuFJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB19107ACCA;
 Tue,  8 Jun 2021 20:45:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1CAE60853;
 Tue,  8 Jun 2021 20:45:12 +0000 (UTC)
Date: Tue, 8 Jun 2021 21:45:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
Message-ID: <YL/W1QqMPjZLvq+F@redhat.com>
References: <20210608192537.103584-1-ckuehl@redhat.com>
 <YL/Ouxk9LcVzE28D@redhat.com>
 <d01cae3a-eee4-1488-6f74-6b0beef38c6c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d01cae3a-eee4-1488-6f74-6b0beef38c6c@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 03:32:54PM -0500, Connor Kuehl wrote:
> On 6/8/21 3:10 PM, Daniel P. Berrangé wrote:
> > On Tue, Jun 08, 2021 at 02:25:37PM -0500, Connor Kuehl wrote:
> >> It may not be appropriate for me to take over as a maintainer at this time,
> >> but I would consider myself familiar with AMD SEV and what this code is
> >> meant to be doing as part of a VMM for launching SEV-protected guests.
> >>
> >> To that end, I would be happy to volunteer as a reviewer for SEV-related
> >> changes so that I am CC'd on them and can help share the review burden with
> >> whoever does maintain this code.
> >>
> >> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> >> ---
> >> Note: because there's no maintainer entry, when running
> >> ./scripts/get_maintainers.pl on target/i386/sev.c, my name and the qemu
> >> mailing list is the only thing that shows up... it doesn't even show
> >> previous committers (as it would before applying this patch). Which is
> >> probably not great considering I do not make pull requests to QEMU.
> >>
> >> Is the way forward to get someone to sign up as a maintainer before
> >> applying a patch like this?
> > 
> > There's no requirement to have a maintainer before having a reviewer.
> > If any of the existing committers shown do send pull requests, it is
> > probably co-incidental since they're not listed as official maintainers,
> > and being listed as Reviewer doesn't commit you to doing pull requests.
> > 
> > That said if you're the only nominated reviewer and actually do useful
> > reviews, you will probably quickly find yourself the defacto maintainer
> > in 12 months time and end up doing pull requests... 
> 
> Right, I am just worried that if I am the only person that shows up in
> the get_maintainer.pl output, the submitter will have to know some other
> way who a relevant maintainer is that can take the patches otherwise
> they won't be CC'd. Or we'll have to hope a relevant maintainer sees
> them on the list. Or I'll have to chase down a maintainer myself
> assuming the reviews all check out. :-)

Well there's no real guarantee that any of the previous committers will
take the patch even if they are listed by get_maintainer. This is typical
with anything lacking a maintainer assigned. We typically hope that
whoever runs the "misc" queue sees the patch and picks it up, but often
it requires pings to remind someone to pick it up.

The only real right answer here is to actually get someone as the
nominated maintainer. Every other scenario is a just a band aid and
is not a good experiance for contributors. A nominated reviewer is
usually hoped to be a stepping stone to someone becoming maintainer
in future, so in that sense the fact that only you will be cc'd is
sort of intentional :-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


