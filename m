Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9382CA81D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:22:39 +0100 (CET)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8QI-0004j0-GV
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kk8Oj-0003vI-5b
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:21:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kk8Oe-0000KO-OB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606839655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECJ4VEhEHEQd0NEpYrKjWrWplfQUiDGmfsfsBk6vr/E=;
 b=Myqp2lf/TeYHfxgod5kqq66ki0jkxLOx238zgUP7djN4zLC40k+680t//llBFcW+o2EfUC
 84CEHwJjOzGCsahMIQY7JpLDxnr7VJWe6FRZAhIWdtPBQ3sjMdWxnjLf7fAIucGtZlvIcF
 LMYKPKOZTXa9mSm/Zg7mz7AFhjphWn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-BfLGqVvWPvq-wiM36dqybw-1; Tue, 01 Dec 2020 11:20:53 -0500
X-MC-Unique: BfLGqVvWPvq-wiM36dqybw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B74100ED06;
 Tue,  1 Dec 2020 16:20:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E2610016FF;
 Tue,  1 Dec 2020 16:20:43 +0000 (UTC)
Date: Tue, 1 Dec 2020 17:20:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201201162042.GB6264@merkur.fritz.box>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
MIME-Version: 1.0
In-Reply-To: <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.11.2020 um 20:35 hat Paolo Bonzini geschrieben:
> On 30/11/20 19:10, Kevin Wolf wrote:
> > Am 30.11.2020 um 17:57 hat Paolo Bonzini geschrieben:
> > > The main problem is that it wouldn't extend well, if at all, to
> > > machines and devices.  So those would still not be integrated into the
> > > QAPI schema.
> > 
> > What do you think is the biggest difference there? Don't devices work
> > the same as user creatable objects in that you first set a bunch of
> > properties (which would now be done through QAPI instead) and then call
> > the completion/realize method that actually makes use of them?
> 
> For devices it's just the practical issue that there are too many to have
> something like this series.  For machine types the main issue is that the
> version-specific machine types would have to be defined in one more place.

Sure, the number of devices means that we can't convert all of them at
once. And we don't need to, we can make the change incrementally.

The only thing we can't do during this incremental phase is switching
device_add from 'gen': false to actually using QAPI types. Doing that
would be the very last step in the conversion.

> > > The single struct doesn't bother me _too much_ actually.  What bothers me is
> > > that it won't be a single source of all QOM objects, only those that happen
> > > to be created by object-add.
> > 
> > But isn't it only natural that a list of these objects will exist in
> > some way, implicitly or explicitly? object-add must somehow decide which
> > object types it allows the user to create.
> 
> There's already one, it's objects that implement user creatable.  I don't
> think having it as a QAPI enum (or discriminator) is worthwhile, and it's
> one more thing that can go out of sync between the QAPI schema and the C
> code.

Well, we all know that this series duplicates things. But at the same
time, we also know that this isn't going to be the final state.

Once QAPI learns about QOM inheritance (which it has to if it should
generate the boilerplate), it will know which objects are user creatable
without a an explicitly defined separate enum.

I think it will still need to have the enum internally, but as long as
it's automatically generated, that shouldn't be a big deal.

> > I'm also pretty sure that QOM as it exists now is not the right solution
> > for any of them because it has some major shortcomings. It's too easy to
> > get things wrong (like the writable properties after creation), its
> > introspection is rather weak and separated from the QAPI introspection,
> > it doesn't encourage documentation, and it involves quite a bit of
> > boilerplate and duplicated code between class implementations.
> > 
> > A modified QOM might be the right solution, though. I would like to
> > bring QAPI and QOM together because most of these weaknesses are
> > strengths of QAPI.
> 
> I agree wholeheartedly.  But your series goes to the opposite excess.
> Eduardo is doing work in QOM to mitigate the issues you point out, and you
> have to meet in the middle with him.  Starting with the user-visible parts
> focuses on the irrelevant parts.

QAPI is first and foremost about user-visible parts, and in fact most of
the problems I listed are about external interfaces. It seems to make a
lot of sense to me to start there.

> > > Mostly because it's more or less the same issue that you have with
> > > BlockdevOptions, with the extra complication that this series only deals
> > > with the easy one of the four above categories.
> > 
> > I'm not sure which exact problem with BlockdevOptions you mean. The
> > reason why the block layer doesn't use BlockdevOptions everywhere is
> > -drive support.
> 
> You don't have a single BlockdevOptions* field in the structs of block/.  My
> interpretation of this is that BlockdevOptions* is a good schema for
> configuring things but not for run-time state.

I'm not sure what you mean with run-time state. Yes, BlockdevOptions is
about external interfaces, not about implementation details. Same thing
as QOM properties are external interfaces, not implementation details.
There may be fields in the internal state that correspond 1:1 to the
externally visible QAPI type/QOM property, but it's not necessarily the
case.

> > > > Maybe if we don't want to commit to keeping the ObjectOptions schema,
> > > > the part that should wait is object-add and I should do the command line
> > > > options first? Then the schema remains an implementation detail for now
> > > > that is invisible in introspection.
> > > 
> > > I don't see much benefit in converting _any_ of the three actually.  The
> > > only good reason I see for QAPIfying this is the documentation, and the
> > > promise of deduplicating QOM boilerplate.  The latter is only a promise, but
> > > documentation alone is a damn good reason and it's enough to get this work
> > > into a mergeable shape as soon as possible!
> > 
> > I think having some input validation done by QAPI instead of in each QOM
> > object individually is nice, too. You get it after CLI, QMP and HMP all
> > go through QAPI.
> 
> But the right way to do that is to use Eduardo's field properties: they make
> QOM do the right thing, adding another layer of parsing is just adding more
> complexity.

QAPI is already here and it's going to stay. QOM doesn't have to
duplicate input validation that existing code can already perform.

I'm not sure which complexity you think I'm introducing: QAPI is already
there. I'm adding the schema, which you agree is valuable documentation,
so we want to have it either case. The actual change to QOM that we have
in this series is this:

 include/qom/object_interfaces.h |  7 -------
 qom/qom-qmp-cmds.c              | 44 ++++++++++++++++++++++----------------------
 2 files changed, 22 insertions(+), 29 deletions(-)

Arguably some more runtime complexity on object-add because we do the
QAPI validation and build an ObjectOptions object just to feed it back
to a visitor. Do we really care?

> Are there any validation bugs that you're fixing?  Is that
> something that cannot be fixed elsewhere, or are you papering over bad QOM
> coding?  (Again, I'm not debating that QOM properties are hard to write
> correctly).

Yes, I found bugs that the QAPI schema would have prevented. They were
generally about not checking whether mandatory propertes are actually
set.

Of course you can fix broken QOM property implementations manually. And
I sent separate patches to fix them manually because we don't go through
QAPI for user creatable types yet (even after this series, -object would
still be missing).

But if a property is declared mandatory in the schema, I shouldn't have
to bother with manual checks in ucc->complete.

> > > But maybe, we could start in the opposite direction: start with the use QAPI
> > > to eliminate QOM boilerplate.  Basing your work on Eduardo's field
> > > properties series, you could add a new 'object' "kind" to QAPI that would
> > > create an array of field properties (e.g. a macro expanding to a compound
> > > literal?)
> > 
> > There is a very simple reason why I don't want to start with the QAPI
> > generator: John has multiple series pending that touch basically every
> > part of the QAPI generator. This means not only that I need to be
> > careful about merge conflict (or base my work on top of five other
> > series, which feels adventurous), but also that I would be competing
> > with John for Markus' reviewer capacity, further slowing things down.
> 
> That's something that you have to discuss with John and Markus.  It may be
> that John has to shelve part of his work or rebase on top of yours instead.
> 
> By adding an extra parsing layer you're adding complexity that may not be
> needed in the end, and we're very bad of removing it later.  So I'm worried
> that this series will become technical debt in just a few months.

Again: Which complexity?

> > Well, two reasons: Also because this series for the external interface
> > of the objects already exists and it's an incremental step towards your
> > proposal: The types for 'properties' will already exist then and I won't
> > have to convert both internal state and external interfaces at the same
> > time.
> 
> I don't think converting internal state to QAPI is useful.  QAPI and QOM are
> external interfaces and that's what they should remain; anything that is not
> an external interface should (must) remain plain C code.

Yes, I agree. What I mean is changing property declarations and probably
replacing most existing property getters or setters, which in turn
access the internal state. That's just different work from describing
the external interface.

Kevin


