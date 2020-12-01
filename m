Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588482CAC8C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:40:09 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBVQ-0007SU-E7
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkBRV-0005bB-Or
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:36:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkBRR-0000EJ-85
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606851360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MtjdTrINFP27l/jG+7XjjH07fvhFJ/R8UMvU37Nt2E=;
 b=NWmimJdv4iE1Q4r+L9yxYp1/0vXPPn7NwOJRISVjbpx7H0APAuvQt4d0rrGP/Gqnk8yKxk
 kY9eZm8w2Ssx0LqSixvvMXAiWALIHhnJz9XrIklWfqw7n7IUkrkOBn7YtsqyC85yhYFITP
 Fj/C5amcpMbXG9WjY/67GUqwxOYstV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-xBZ6nBR7MCCGUpbMQwqCAg-1; Tue, 01 Dec 2020 14:35:56 -0500
X-MC-Unique: xBZ6nBR7MCCGUpbMQwqCAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5A9C9CDC1;
 Tue,  1 Dec 2020 19:35:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED6619C44;
 Tue,  1 Dec 2020 19:35:30 +0000 (UTC)
Date: Tue, 1 Dec 2020 20:35:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201201193528.GC6264@merkur.fritz.box>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
MIME-Version: 1.0
In-Reply-To: <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Am 01.12.2020 um 18:16 hat Paolo Bonzini geschrieben:
> On 01/12/20 17:20, Kevin Wolf wrote:
> > Am 30.11.2020 um 20:35 hat Paolo Bonzini geschrieben:
> > > For devices it's just the practical issue that there are too many to have
> > > something like this series.  For machine types the main issue is that the
> > > version-specific machine types would have to be defined in one more place.
> > 
> > Sure, the number of devices means that we can't convert all of them at
> > once. And we don't need to, we can make the change incrementally.
> 
> There's also the question that most devices are not present in all binaries.
> So QAPI introspection would tell you what properties are supported but not
> what devices are.  Also the marshaling/unmarshaling code for hundreds of
> devices would bloat the QEMU executables unnecessarily (it'd all be
> reachable from visit_DeviceOptions so it'd not be possible to compile it
> out, even with LTO).

I don't think this is actually a new things. We already have types and
commands declared with things like 'if': 'defined(TARGET_S390X)'.
As far as I understand, QAPI generated files are already built per
target, so not compiling things into all binaries should be entirely
possible.

What probably needs a solution is that an explicit 'if' in the schema
would duplicate information that is actually defined in the build system
configuration. So we would somehow need a common source for both.

> Plus the above issue with machine types.

As I said, I don't know the machine type code well, so I'm not really
sure about the best way there.

But maybe QAPI isn't for version-specific machine types. I think they
never have additional properties, but only different init functions. So
their description in QAPI would be essentially empty anyway.

So maybe only the abstract base class that actually defines the machine
properties (like generic-pc-machine) should be described in QAPI, and
then the concrete machine types would inherit from it without being
described in QAPI themselves?

> > > > > The single struct doesn't bother me _too much_ actually.  What bothers me is
> > > > > that it won't be a single source of all QOM objects, only those that happen
> > > > > to be created by object-add.
> > > > 
> > > > But isn't it only natural that a list of these objects will exist in
> > > > some way, implicitly or explicitly? object-add must somehow decide which
> > > > object types it allows the user to create.
> > > 
> > > There's already one, it's objects that implement user creatable.  I don't
> > > think having it as a QAPI enum (or discriminator) is worthwhile, and it's
> > > one more thing that can go out of sync between the QAPI schema and the C
> > > code.
> > 
> > Well, we all know that this series duplicates things. But at the same
> > time, we also know that this isn't going to be the final state.
> > 
> > Once QAPI learns about QOM inheritance (which it has to if it should
> > generate the boilerplate), it will know which objects are user creatable
> > without a an explicitly defined separate enum.
> > 
> > I think it will still need to have the enum internally, but as long as
> > it's automatically generated, that shouldn't be a big deal.
> 
> Right, I don't want to have the final state now but I'd like to have a
> rough idea of the plan:
> 
> 1) whether to generate _all_ boilerplate or only properties

I would like to generate as much boilerplate as possible. That is, I
don't want to constrain us to only properties, but at the same time, I'm
not sure if it's possible to get rid of all boilerplate.

Basically, the vision I have in mind is that QAPI would generate code
that is the same for most instances, and then provide an option that
prevents code generation for a specific part for more complicated cases,
so that the respective function can (and must) be provided in the C
source.

> 2) whether we want to introduce a separation between configuration
> schema and run-time state

You mean the internal run-time state? How is this separation not already
present with getter/setter functions for each property? In many cases
they just directly access the run-time state, but there are other cases
where they actually do things.

Or do you mean between create-time options and properties that can be
written at runtime? In that case, yes, I think that would be very
desirable because mashing them together has resulted in lots of bugs.

> 3) in the latter case, whether properties will survive at all---iothread and
> throttle-groups don't really need them even if they're writable after
> creation.

How do you define properties, i.e. at which point would they stop
existing and what would be a non-property alternative?

Outside of QOM, usually have a query-* command that returns the whole
state rather than a single property, and possibly individual QMP
commands to update the state.


blockdev-reopen takes a new configuration (the same structure as
blockdev-add) and then applies that whole new configuration to the
existing block node. I guess this would be an alternative, though it is
somewhat inconvenient because you have to repeat all the options that
you don't want to change.

The blockdev-reopen way has one important advantage: You can change
multiple options at the same time when there are dependencies between
the options so that individually changing each option would be invalid,
but together it's possible.

throttle-group needs this in QOM, and it's easily implemented: It just
has a single 'limits' property, which is a struct and is always updated
as a single unit.


So in summary, it seems to me that the QOM way is more flexible because
you can get both models out of it. Whether we actually need this
flexibility I can't say.

But there is another reason why I didn't intend to remove properties
entirely, which is that things are a lot easier as long as you don't
have to break external interfaces, which qom-set/get/list are.


The way I imagined it so far is roughly like this:

* Configuration options are described in the QAPI schema. This is mainly
  for object creation, but runtime modifiable properties are a subset of
  this.

* Properties are generated for each option. By default, the getter
  just returns the value from the configuration at creation time, though
  generation of it can be disabled so that it can be overridden. Also,
  setters just return an error by default.

* Property setters aren't called for object creation. Instead, the
  relevant ObjectOptions branch is made available to some init method.

* Runtime modifiable properties (declared as such in the schema) don't
  get the default setter, so you have to provide an implementation for
  them.

> These questions have a substantial effect on how to handle this series.
> Without answers to this questions I cannot understand the long term and its
> interaction with other long term plans for QOM.
> 
> > > > A modified QOM might be the right solution, though. I would like to
> > > > bring QAPI and QOM together because most of these weaknesses are
> > > > strengths of QAPI.
> > > 
> > > I agree wholeheartedly.  But your series goes to the opposite excess.
> > > Eduardo is doing work in QOM to mitigate the issues you point out, and you
> > > have to meet in the middle with him.  Starting with the user-visible parts
> > > focuses on the irrelevant parts.
> > 
> > QAPI is first and foremost about user-visible parts, and in fact most of
> > the problems I listed are about external interfaces.
> 
> Yes, but QAPI is also about interfacing with existing code.  Also, QAPI does
> not generate only structs, it also generate C function prototypes. I'm not
> sure whether a QOM object's more similar to the struct case (what you do
> here) or to the QMP command case:
> 
> - there's a 1:1 correspondence between ObjectOptions cases and ucc->complete
> implementations
> 
> - there's a registry of object types just like there's one for QMP commands.

This is an interesting comparison. I never thought of likening objects
to commands, but there is some truth to it. I certainly did envision
objects as separate type of QAPI entities, which I guess is why I didn't
really like Dan's suggestion to make objects an extension of structs,
but I couldn't really express why. I think your comparison gives a good
answer.

However, this series is still not doing the wrong thing: If you think
about commands, they don't exist without an arguments struct. Similarly,
objects don't exist without a properties struct.

So while this series is doing only one part of the whole solution, that
the second part is missing doesn't make the first part wrong.

> So another possibility could be that the QAPI generator essentially
> generated the user_creatable_add_type function that called out to
> user-provided functions qom_scsi_pr_helper_complete,
> qom_throttle_group_complete, etc.  The arguments to those functions would be
> the configuration.  That is a very interesting prospect (though one that
> would require changes to the QAPI code generator).

I was thinking of using .instance_init because it's more generic, but
using ucc->complete (and in the long run realize for qdev) might require
less modifications of non-user-creatable objects.

One possibly nasty detail to consider there is that we sometimes declare
the USER_CREATABLE interface in the base class, so ucc->complete is for
the base class rather than the actually instantiated class. If we only
instantiate leaf classes (I think this is true), we can move
USER_CREATABLE there.

I also had in mind just passing the whole configuration struct
(essentially always 'boxed': true), but you're right that individual
parameters like for commands would be possible. I'm not entirely
convinced that they would be better (there was a reason why we
introduced 'boxed': true), but it's an option.

> > BlockdevOptions is about external interfaces, not about
> > implementation details. Same thing as QOM properties are external
> > interfaces, not implementation details. There may be fields in the
> > internal state that correspond 1:1 to the externally visible QAPI
> > type/QOM property, but it's not necessarily the case.
> 
> Right.  It may well be that we decide that, as a result of this series,
> QOM's property interface is declared essentially a failed experiment.  I
> wouldn't be surprised, and that's why I want to understand better where we
> want to go.
> 
> For example, Eduardo is focusing specifically on external interfaces that
> correspond 1:1 to the internal implementation.  If we decide that
> non-1:1-mappings and checks on mandatory properties are an important part of
> QOM, that may make large parts of his work moot.  If we decide that most QOM
> objects need no properties at all, then we don't want to move more
> qdev-specific stuff from to QOM.

Hm, it's a good point. 1:1 properties would actually end up in generated
code anyway, so simplifying them is maybe not that useful in the end. It
would probably result in nicer generated code, but that's it.

> > QAPI is already here and it's going to stay. QOM doesn't have to
> > duplicate input validation that existing code can already perform.
> > 
> > I'm not sure which complexity you think I'm introducing: QAPI is already
> > there. I'm adding the schema, which you agree is valuable documentation,
> > so we want to have it either case. The actual change to QOM that we have
> > in this series is this:
> 
> The complexity is that properties used to be split in two places, and now
> they're split in three places.
> 
> It may very well be that this is a good first step to at least have classes
> described in the QAPI schema.  But since _in the short term_ there are
> things that the series makes worse (and has a risk of bringing things out of
> sync), I'd like to understand the long term plan and ensure that the QAPI
> maintainers are on board with it.
> 
> Can you at least add a comment to all UserCreatable classes that says "if
> you add a property, remember to modify ... as well in the QAPI schema"?

I was hoping that by converting object-add in this series, and the CLI
options soon afterwards, it would be very obvious if you forget to
change the schema because your new property just wouldn't work (at least
not during creation).

But I can add comments if you think this is still worthwhile.

> > > Are there any validation bugs that you're fixing?  Is that
> > > something that cannot be fixed elsewhere, or are you papering over bad QOM
> > > coding?  (Again, I'm not debating that QOM properties are hard to write
> > > correctly).
> > 
> > Yes, I found bugs that the QAPI schema would have prevented. They were
> > generally about not checking whether mandatory propertes are actually
> > set.
> 
> Okay, I found your series at
> https://patchew.org/QEMU/20201130105615.21799-1-kwolf@redhat.com/ too, good
> to know.

And two more patches of the same type here:

https://patchew.org/QEMU/20201117163045.307451-1-kwolf@redhat.com/

> So that's another useful thing that can be chalked to this series at least
> if -object and object_add are converted (and also, another thing against QOM
> properties and 1:1 mappings between configuration schema and run-time
> state).

Yes. object-add is already covered by this series and -object should be
easy, so we can have this more or less now. Getting the design right for
QOM code generation will certainly take more time, discussion and also
experimentation.

Kevin


