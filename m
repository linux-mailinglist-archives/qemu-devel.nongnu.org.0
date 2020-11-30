Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CA2C8891
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:49:25 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlQa-0005Q4-8g
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjlOn-0004rM-EM
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjlOk-0001Ty-4j
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606751249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9N2TWotiukxeD2jj4sh0dYZgqgxUDPGNC8Z3kuJVWDw=;
 b=d/bxS8sAp2pg/5Poj6Ef//2nh2+H63WPig+jFOIMvfLefoOwo83gS4ajg5cfLGgNpcOjA4
 ySq/6pqLBnAvcIJdHVVUc4F8bhF/23i2ZPvkCZ6HeeGSxijQhXmbEWIbkS32o26vWl+5ch
 GuHPs3gfAWSGSMac6YeDqBzpzjfCj0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-3Copb1UyPu60EAeqHZaafg-1; Mon, 30 Nov 2020 10:47:28 -0500
X-MC-Unique: 3Copb1UyPu60EAeqHZaafg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FADC8EC04D;
 Mon, 30 Nov 2020 15:46:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA46F5D9F1;
 Mon, 30 Nov 2020 15:46:06 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:46:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201130154605.GC5078@merkur.fritz.box>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.11.2020 um 15:58 hat Paolo Bonzini geschrieben:
> On 30/11/20 13:25, Kevin Wolf wrote:
> > This series adds a QAPI type for the properties of all user creatable
> > QOM types and finally makes QMP object-add use the new ObjectOptions
> > union so that QAPI introspection can be used for user creatable objects.
> > 
> > After this series, there is least one obvious next step that needs to be
> > done: Change HMP and all of the command line parser to use
> > ObjectOptions, too, so that the QAPI schema is consistently enforced in
> > all external interfaces. I am planning to send another series to address
> > this.
> > 
> > In a third step, we can try to start deduplicating and integrating things
> > better between QAPI and the QOM implementation, e.g. by generating parts
> > of the QOM boilerplate from the QAPI schema.
> 
> With this series it's basically pointless to have QOM properties at
> all.

Not entirely, because there are still some writable properties that can
be changed later on.

After working through all the user creatable objects, I would say that
separating these from the creation-time options is actually a good thing
because there are basically two types of property setters in the
existing implementations:

1. It starts with something like 'if (completed)' and takes two different
   paths, so they are already separated. Often one path is just
   returning an error, but sometimes we actually make an effort to
   update the internal state according to the new value.

2. No distinction is made. Usually the result is inconsistent state
   because the property values themselves are updated, but they have
   been interpreted once in ucc->complete and are ignored afterwards. Or
   maybe even worse, they are still used, but no care is taken that they
   are consistent with the rest of the internal state.

   Unfortunately my impression is that this is the more common type.

So with this in mind, I think I'm in favour of completely leaving the
initialisation of properties on object creation to QAPI, and only
providing individual setters if we actually intend to allow property
changes after creation.

> Instead, you are basically having half of QEMU's backend data model
> into a single struct.
> 
> So the question is, are we okay with shoveling half of QEMU's backend data
> model into a single struct?  If so, there are important consequences.

Yeah, the single struct bothers me a bit, both in the QAPI schema and in
the C source.

We probably need to have it present in the schema in some way so we can
actually check input against the schema. Maybe we can have it
automatically compiled by the QAPI generator so that we don't need to
manually update the enum and the union each time.

In the C source, I guess the other option would be to have pointers
rather than directly embedding all struct types. In the long run this
might make more sense. As long as it's only user-creatable objects, it's
no worse than BlockdevOptions.

> 1) QOM basically does not need properties anymore except for devices and
> machines (accelerators could be converted to QAPI as well). All
> user-creatable objects can be changed to something like chardev's "get a
> struct and use it fill in the fields", and only leave properties to devices
> and machines.

True for those properties that don't support updates after object
creation. For these, leaving the work to QAPI simplifies things a lot.

> 2) User-creatable objects can have a much more flexible schema.  This means
> there's no reason to have block device creation as its own command and
> struct for example.

In theory yes. The block layer isn't really QAPIfied, though, it just
has a QAPI wrapper (similar to how this series doesn't QAPIfy QOM, but
justs wraps it). But for the long term vision, I think it's a reasonable
goal to have block nodes represented as QOM-with-QAPI objects.

> The problem with this series is that you are fine with deduplicating things
> as a third step, but you cannot be sure that such deduplication is possible
> at all.  So while I don't have any problems in principle with the
> ObjectOptions concept, I don't think it should be committed without a clear
> idea of how to do the third step.

Do you have any specific concerns why the deduplication might not
possible, or just because it's uncharted territory?

The only reason why I wouldn't like to wait too long with merging this
is because of merge conflicts (the list of properties or their details
might change and this could go unnoticed).

Maybe if we don't want to commit to keeping the ObjectOptions schema,
the part that should wait is object-add and I should do the command line
options first? Then the schema remains an implementation detail for now
that is invisible in introspection.

> In the meanwhile, of course I have no problem with deprecating the opened
> and loaded properties.

If we decide that we don't want to have the schema at all (which I hope
we won't decide), I can split the deprecation into separate patches.

Kevin


