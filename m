Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4F40FB50
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:06:34 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFRh-0004Fa-4g
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRFPD-0002oP-Fz
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:03:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRFP8-0000cT-Dl
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631891029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XEkqczxQI1yuvbOH4QMjCDRFmfNhROoUWfDHs7VK5G4=;
 b=Kw2xI0NZaiiC23qGCtIrgFbazzzyYgAPH0U1x1/hWGPWnj78g9XSYOsfmyw7LC1oIdRjgd
 uUgV4BFIQW2373IhuDQYmRFJXEu7RT6D8TsWyHdySZS/w6gdkKskTFlkhar68FSE6qIs1E
 hV2n5i36S2HHQbBBHilPGZdnnbgSZLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-pOzFszClMv6lDqQvROYqbA-1; Fri, 17 Sep 2021 11:03:45 -0400
X-MC-Unique: pOzFszClMv6lDqQvROYqbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FBCA1966320
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 15:03:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF6460843;
 Fri, 17 Sep 2021 15:03:43 +0000 (UTC)
Date: Fri, 17 Sep 2021 17:03:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YUSuThJtW9ar2wCY@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <8735q3y5db.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2021 um 10:26 hat Markus Armbruster geschrieben:
> >> When exactly are collisions an error?  How exactly are non-erroneous
> >> collisions resolved?  qapi-code-gen.rst needs to answer this.
> >
> > The strategy implemented in this version is: Collisions are generally an
> > error, except for wildcard aliases conflicting with a non-wildcard-alias
> > value. In this case the wildcard alias is ignored and the value is
> > assumed to belong elsewhere.
> 
> Kinds of collisions:
> 
>                 member          ordinary alias  wildcard alias
> member          error[1]        error[2]        member wins[4]
> ordinary alias                  error[3]        ordinary wins[4]
> wildcard alias                                  ???[5]
> 
> [1] Test case duplicate-key demonstrates.
> 
> [2] Test case alias-name-conflict demonstrates.
> 
> [3] No test case, manual testing results in "alias 'a' collides with
>     alias 'a'".
> 
> [4] Please confirm I got this right.
> 
> [5] No test case, manual testing results in no error.  What's the
>     intended behavior?

[5] is going to become "more local wins". In v3 it's "runtime error if
both are specified, except sometimes".

Both [4] and [5] are runtime errors if two values are specified and
there aren't two consumers for them.

> >> We actually require much less: for QMP chardev-add, we need
> >> 'data.addr.data.FOO' and nothing else, and for CLI -chardev, we need
> >> 'FOO' and nothing else (I think).  The unneeded ones become accidental
> >> parts of the external interface.  If experience is any guide, we'll have
> >> plenty of opportunity to regret such accidents :)
> >> 
> >> Can we somehow restrict external interfaces to what we actually need?
> >
> > Not reasonably, I would say. Of course, you could try to cover all
> > paths with aliases in the top level, but the top level really shouldn't
> > have to know about the details of types deep inside some union variants.
> >
> > The solution for reducing the allowed options here is to work on
> > introspection, mark 'data' deprecated everywhere and get rid of the
> > simple union nonsense.
> 
> Accidental extension of QMP to enable QAPIfication elsewhere would be a
> mistake.  Elsewhere right now: -chardev.
>
> The knee-jerk short-term solution for QMP is to ignore aliases there
> completely.  Without introspection, they can't be used seriously anyway.

I would say it's intentional enough. If we can flatten simple unions for
the CLI, why not accept them in QMP, too? (And management tools will
only be happier if they can use the same representation for QMP and
CLI.) I hope that we can get introspection done for 6.2, but even if we
can't, making the case already work shouldn't hurt anyone.

Now you could argue that some aliases to be introduced for -chardev have
no place in QMP because they have no practical use there. But isn't a
consistent QAPI structure on all external interfaces more valuable than
keeping the interface in QMP minimal, but inconsistent with the CLI?

The problem I would generally see with accidental extension of QMP is
that it may restrict future changes for no reason. But if we already
get the restriction because we must stay compatible with the CLI, too,
then this doesn't apply any more.

> Of course, we eventually want to use them for evolving QMP, e.g. to
> flatten simple unions.  The knee-jerk solution sets up another obstacle.
> 
> The issue also exists in -chardev with a JSON argument.  We can apply
> the knee-jerk solution to any JSON-based interface, not just to QMP.
> 
> The issue also exists in -chardev with a dotted keys argument.  There,
> we definitely need the outermost alias (e.g. "host") for compatibility,
> and we may want the member ("data.addr.data.host") for symmetry with
> JSON.  I can't see an argument for exposing the intermediate aliases as
> dotted keys, though.
> 
> I find the argument "for symmetry with JSON" quite weak.  But exposing
> the member seems unlikely to create problems later on.

Well, my simple argument is: It's hard to get rid of them, so why bother
with extra complexity to get rid of them?

But I think there is a better argument, and "symmetry with JSON"
actually covers support for the intermediate aliases, too:

The alias that flattens SocketAddressLegacy isn't an alias for the
command chardev-add, it's an alias for the type. If you have code that
formats JSON for SocketAddressLegacy, then you should be able to use it
everywhere where a SocketAddressLegacy is required.

So if your code to format JSON for SocketAddressLegacy uses the alias to
provide a flat representation, but the caller producing ChardevBackend
doesn't flatten the union yet, then that should be fine. And if you have
code for flat ChardevBackend, but your common SocketAddressLegacy code
still produces the nesting, then that should be fine, too.

Essentially partial use of aliases in JSON is a feature to allow libvirt
adopting changes incrementally. And just having a mapping of JSON to the
command line is why it should be there in dotted key syntax, too.

> You argue that "the top level really shouldn't have to know about the
> details of types deep inside some union variants."  That's a valid
> argument about the QAPI schema language's support for abstraction.  But
> the QAPI schema language is means, while the external interfaces are
> ends.  They come first.  A nicer schema language is certainly desirable,
> but the niceties shouldn't leak crap into the external interfaces.
> 
> Let me work through an example to ground this.  Consider chardev-add /
> -chardev.  Structure of chardev-add's argument:
> 
>     id: str
>     backend:
>         type: enum ChardevBackendKind
>         data: one of the following, selected by the value of @type:
>         for socket:
>             addr:
>                 type: enum SocketAddressType
>                 data: one of the following, selected by the value of @type:
>                   for inet:
>                   host: str
>                   ...
>           ...
> 
> In contrast, -chardev's argument is flat.  To QAPIfy it, we could use
> aliases from the root into the object nest:
> 
>     from type to backend.type
>     from host to backend.data.addr.data.host
>     ...
> 
> We'd certainly design chardev-add's argument differently today, namely
> with much less nesting.  Say we want to evolve to this structure:
> 
>     id: str
>     type: enum ChardevBackendKind
>     one of the following, selected by the value of @type:
>     for socket:
>     addr:
>         type: enum SocketAddressType
>         one of the following, selected by the value of @type:
>         for inet:
>         host: str
>         ...
>     ...
> 
> We obviously need to keep the old structure around for compatibility.
> For that, we could use a *different* set of aliases:
> 
>     from type to backend.type
>     from addr.host to backend.data.addr.data.host
>     ...
> 
> What's the plan for supporting different uses wanting different aliases?
> Throw all the aliases together and shake?  Then one interface's
> requirements will contaminate other interfaces with unwanted aliases.
> Getting one interface right is hard enough, having to reason about *all*
> QAPI-based interfaces would set us up for failure.  And what if we run
> into contradictory requirements?

Are there legitimate reasons for exposing the same QAPI type in
different ways on different interfaces? This sounds like a bad idea to
me. If it's the same thing, it should look the same.

The biggest reason for QAPIfying things is to unify interfaces instead
of having different parsers everywhere. Intentionally accepting some
keys only in QMP and others only in the CLI seems to go against this
goal.

> Could we instead tag aliases somehow, pass a tag to the visitor, and
> have it ignore aliases with a different tag?
> 
> Reminds me of the problem of generating multiple QMPs from a single
> schema, e.g. one for qemu-system-FOO, and another one for
> qemu-storage-daemon.  Inchoate idea: use tags for that somehow.  But I
> digress.
> 
> I'm actually tempted to try how far we can get with just one level of
> aliases, i.e. aliases that can only resolve to a member, not to another
> alias.  I'd expect the code to become quite a bit simpler.

The visitor code would become slightly simpler, but the schema would
become much less maintainable. If someone adds a new field to, say,
InetSocketAddress, review would have to catch this and request that a
new alias be added to ChardevOptions. I don't think this is a realistic
option.

> > I think I've come to the conclusion that it's not easy enough to
> > explain. As long as the parsing order should remain an implementation
> > detail that schema authors shouldn't rely on, it's not possible at all.
> >
> > It's a pity because the code would have been simpler and it would
> > probably have worked for the cases we're interested in. But it doesn't
> > work in all hypothetical cases and we can't document the conditions for
> > that without making people rely on the parsing order.
> 
> The order in which the visitors visit members is not really specified.
> The examples in qapi-code-gen.rst show it's in source order, and the
> order is quite unlikely to change.  So, making it official is not out of
> the question.
> 
> However, depending on member order for anything feels iffy.  I'd like to
> be able to shuffle them around without breaking anything.
> 
> Thoughts?

No, I agree. As I said it's not simple enough to explain, so I'll just
have the deleted code back and add a bit to improve error reporting. Not
a big deal for me - though it might be one for your review...

Kevin


