Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F4474719
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 17:05:54 +0100 (CET)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxAJN-0001VM-F4
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 11:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxAEU-0006D1-F1
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:00:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mxAEL-0001U8-Sm
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639497640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/8/y+Zmrx5ETG8Tj5N10NU12EarY3PPFHKeC4lex2iA=;
 b=b8BpqlTvUUAtZ5wnA6fVG6MYx8jg7UIgoIut6N/FfxXcx5CSzlT3rkzSLxHg9zdB8W9U6K
 zqgIMscqtdhPx78HcOG3idsqGPzovvRUevgviCJBjRT+mjmOsovsuDGKRgBIgmgXIRGj1A
 9YyJUonPqBQY3+06ZsEO8LRRYe3nnUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-XVx_WtYFP7yubqjpXxe8IQ-1; Tue, 14 Dec 2021 11:00:35 -0500
X-MC-Unique: XVx_WtYFP7yubqjpXxe8IQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0326D190B2AD
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 16:00:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8732A173;
 Tue, 14 Dec 2021 16:00:32 +0000 (UTC)
Date: Tue, 14 Dec 2021 17:00:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <Ybi/ngFqSiVVs07x@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <871r365042.fsf@dusky.pond.sub.org> <YbhwrGRDs5lA7I7r@redhat.com>
 <87fsqvqm7k.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87fsqvqm7k.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2021 um 15:45 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 23.11.2021 um 17:05 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > This series adds QOM class definitions to the QAPI schema, introduces
> >> > a new TypeInfo.instance_config() callback that configures the object at
> >> > creation time (instead of setting properties individually) and is
> >> > separate from runtime property setters (which often used to be not
> >> > really tested for runtime use), and finally generates a marshalling
> >> > function for .instance_config() from the QAPI schema that makes this a
> >> > natural C interface rather than a visitor based one.
> >> >
> >> > This is loosely based on Paolo's old proposal in the wiki:
> >> > https://wiki.qemu.org/Features/QOM-QAPI_integration
> >> >
> >> > The series is in a rather early stage and I don't really have any
> >> > automated tests or documentation in this series yet. I'm also only
> >> > converting the class hierarchy for the random number generator backends
> >> > to show what the result looks like, the other objects still need to be
> >> > done.
> >> >
> >> > So the question to you isn't whether this is mergeable (it isn't), but
> >> > whether you think this is the right approach for starting to integrate
> >> > QOM and QAPI better.
> >> >
> >> > You'll also see that this doesn't really remove the duplication between
> >> > property definitions in the code and configuration struct definitions in
> >> > the QAPI schema yet (because we want to keep at least a read-only
> >> > runtime property for every configuration option), but at least they mean
> >> > somewhat different things now (creation vs. runtime) instead of being
> >> > completely redundant.
> >> >
> >> > Possible future steps:
> >> >
> >> > * Define at least those properties to the schema that correspond to a
> >> >   config option. For both setters and getters for each option, we'll
> >> >   probably want to select in the schema between 'not available',
> >> >   'automatically generated function' and 'manually implemented'.
> >> >
> >> >   Other runtime properties could be either left in the code or added to
> >> >   the schema as well. Either way, we need to figure out how to best
> >> >   describe these things in the schema.
> >> 
> >> Permit me a diversion of sorts.
> >> 
> >> With QOM, we have properties.  A property is readable if it has a
> >> getter, writable if it has a setter.  There is no real concept of
> >> configuration vs. state.  Writable properties can be written at any
> >> time.
> >> 
> >> In practice, some properties are to be used only like configuration, and
> >> we check configuration at realize time (for devices), or by a surrogate
> >> like qemu_add_machine_init_done_notifier().  If you set them later,
> >> things may break, and you get to keep the pieces.
> >> 
> >> In this "QOM/QAPI integration part 1", configuration (expressed in QAPI
> >> schema) makes it into QOM.
> >> 
> >> Now we have configuration *and* properties.
> >> 
> >> Do we need the properties?
> >
> > Configuration is for creating objects, properties are for runtime after
> > the creation. So for the practical answer, as long as you can find a QOM
> > type that wants to allow either changing an option at runtime or just
> > exposing its current value, I would say, yes, we need both. And I can
> > easily list some QOM types that do.
> >
> > The theoretical answer is that of course you can replace properties with
> > custom query-* and set-* QMP commands, but that's not only hardly an
> > improvment, but also a compatibility problem.
> 
> That would be nuts.
> 
> > The approach I'm taking here with QAPIfication of objects (and planning
> > to take for future conversions) is to drop setters that can't work at
> > runtime (which might be the majority of properties), but keep properties
> > around otherwise. Everything else would be a per-object decision, not
> > part of the infrastructure work.
> 
> Getting rid of such setters makes sense.
> 
> It's been a while since I reviewed...  I don't remember anymore whether
> we can have configuration parameters that are also properties.  If yes,
> would it make sense to generate such properties?

It's not only possible, but the normal case. These properties are often
read-only after realize, but with existing types, we (almost?) always
allow querying properties later even if they can be set only before
realize (and therefore become part of the configuration after this
series).

As for generating, yes, I think that we do that at least partially
(setters will probably have to be manually implemented in the common
case). This is in fact the very proposal in the original cover letter
that you replied to here.

> >> Note I'm not asking whether we need setters.  I'm asking whether we
> >> need to expose configuration bits via qom-set & friends in addition to
> >> the QAPI schema and query-qmp-schema.
> >
> > I'm not sure I follow here. How is querying or changing option values
> > redundant with querying which options exist?
> >
> > Maybe qom-list could become obsolete if we move all properties (and not
> > just the configuration) into the QAPI schema, but I don't see qom-get
> > and qom-set going away.
> >
> >> > * Getting rid of the big 'object-add' union: While the union is not too
> >> >   bad for the rather small number of user-creatable objects, it
> >> >   wouldn't scale at all for devices.
> >> >
> >> >   My idea there is that we could define something like this:
> >> >
> >> >   { 'struct': 'ObjectOptions',
> >> >     'data': {
> >> >         'id': 'str',
> >> >         'config': { 'type': 'qom-config-any:user-creatable',
> >> >                     'embed': true } } }
> >> >
> >> >   Obviously this would be an extension of the schema language to add an
> >> >   'embed' option (another hopefully more acceptable attempt to flatten
> >> >   things...), so I'd like to hear opinions on this first before I go to
> >> >   implement it.
> >> 
> >> 'embed': true would splice in the members of a struct type instead of a
> >> single member of that struct type.  Correct?
> >> 
> >> Stretch goal: make it work for union types, too :)
> >> 
> >> I've thought of this before.  Plenty of nesting in the wire format
> >> exists pretty much only to let us have the C structs we want.  Right
> >> now, the only way to "splice in" such a struct is the base type.
> >> General splicing could be useful.  It may take an introspection flag
> >> day.
> >
> > Base types aren't visible in the introspection either, so probably not
> > if you continue to just report the resulting structure?
> 
> Yes, this should be feasible, except for splicing a union into a union,
> because then you get multiple (tag, variants), which the introspection
> schema can't do.  So don't go there, at least for now.

Right. Let's think about that when we have a use case for splicing
unions into unions.

Kevin


