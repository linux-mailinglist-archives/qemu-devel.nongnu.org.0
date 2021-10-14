Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368342D64C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:42:03 +0200 (CEST)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxFS-0000js-3P
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1max8v-0008Kf-Mi
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1max8t-0003uZ-6m
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634204114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJYBn0b0G8Q9MgABtrLfA4+1N5yVVctsvzzoNv3uhss=;
 b=iNmS/OIm+uxlfmJ4CYhe7pWsjwEvlOWyXc1tJRg7lTEH6rDL2wL6UWzDhM/re1wRhGNUr+
 EUjMgmDPSq2quEV12YCoz7ovNpCJ0Tkyg7tn5oDsmo+GPvmch4GvXqRbHG5wyj6WyRZgHZ
 iw5roUfJhITW4ngqxsKy19jZ687s47c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-cIpWl7T0NmGl0z4LQxOHVQ-1; Thu, 14 Oct 2021 05:35:11 -0400
X-MC-Unique: cIpWl7T0NmGl0z4LQxOHVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F5629F93D
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:35:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2638B60E1C;
 Thu, 14 Oct 2021 09:35:06 +0000 (UTC)
Date: Thu, 14 Oct 2021 11:35:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YWf5yVRKkQZkkoa5@redhat.com>
References: <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org> <YUSuThJtW9ar2wCY@redhat.com>
 <87a6jrimaf.fsf@dusky.pond.sub.org> <YVsKpClmGgq5ki7r@redhat.com>
 <87y270uhsl.fsf@dusky.pond.sub.org> <YWWda+hjUlDkT1tb@redhat.com>
 <877dehuus1.fsf@dusky.pond.sub.org>
 <871r4ptc33.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871r4ptc33.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

Am 13.10.2021 um 13:10 hat Markus Armbruster geschrieben:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Kevin Wolf <kwolf@redhat.com> writes:
> >
> >> Am 11.10.2021 um 09:44 hat Markus Armbruster geschrieben:
> >>> Kevin Wolf <kwolf@redhat.com> writes:
> >>> 
> >>> [...]
> >>> 
> >>> > What I had in mind was using the schema to generate the necessary code,
> >>> > using the generic keyval parser everywhere, and just providing a hook
> >>> > where the QDict could be modified after the keyval parser and before the
> >>> > visitor. Most command line options would not have any explicit code for
> >>> > parsing input, only the declarative schema and the final option handler
> >>> > getting a QAPI type (which could actually be the corresponding QMP
> >>> > command handler in the common case).
> >>> 
> >>> A walk to the bakery made me see a problem with transforming the qdict
> >>> between keyval parsing and the visitor: error reporting.  On closer
> >>> investigation, the problem exists even with just aliases.
> >>
> >> I already commented on part of this on IRC, but let me reply here as
> >> well.
> >>
> >> On general remark is that I would make the same distinction between
> >> aliases for compatibility and usability that I mentioned elsewhere in
> >> this thread.
> >>
> >> In the case of compatibility, it's already a concession that we still
> >> accept the option - suboptimal error messages for incorrect command
> >> lines aren't a major concern for me there. Users are supposed to move to
> >> the new syntax anyway.
> >
> > Well, these aren't "incorrect", merely deprecated.  Bad UX is still bad
> > there, but at least it'll "fix" itself when the deprecated part goes
> > away.

Most of the error messages aren't "incorrect" either, merely suboptimal
and guiding the user towards verbose non-deprecated alternatives.

> >>> We obediently do what the error message tells us to do:
> >>> 
> >>>     $ qemu-system-x86_64 -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345
> >>>     qemu-system-x86_64: -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345: Parameters 'backend.*' used inconsistently
> >>> 
> >>> Mission accomplished: confusion :)
> >>
> >> This one already fails before aliases do their work. The reason is that
> >> the default key for -chardev is 'backend', and QMP and CLI use the same
> >> name 'backend' for two completely different things.
> >
> > Right.  I was confused (and the mission was truly accomplished).
> >
> >> We could rename the default key into 'x-backend' and make it behave the
> >> same as 'backend', then the keyval parser would only fail when you
> >> explicitly wrote '-chardev backend=udp,...' and the problem is more
> >> obvious.
> >
> > Technically a compatibility break, but we can hope that the longhand
> > form we change isn't used.

No, it's not a compatibility break. Existing command lines can only have
'backend=...', but not 'backend.*=...', so there is no conflict and they
keep working.

> >> By the way, we have a very similar issue with '-drive file=...', if we
> >> ever want to parse that one with the keyval parser. It can be both a
> >> string for the filename or an object for the configuration of the 'file'
> >> child that many block drivers have.
> >
> > Should I be running for the hills?

If that means that I can then just commit whatever feels right to me? :-P

> >>> Example: manual transformation leads to confusion #2
> >>> 
> >>> Confusion is possible even without tricking the user into mixing
> >>> "standard" and "alternate" explicitly:
> >>> 
> >>>     $ qemu-system-x86_64 -chardev udp,id=chr0,backend.data.remote.type=udp
> >>>     qemu-system-x86_64: -chardev udp,id=chr0,backend.data.remote.type=udp: Parameters 'backend.*' used inconsistently
> >>> 
> >>> Here, the user tried to stick to "standard", but forgot to specify a
> >>> required member.  The transformation machinery then "helpfully"
> >>> transformed nothing into something, which made the visitor throw up.
> >>
> >> Not the visitor, but the keyval parser. Same problem as above.
> >>
> >>> Clear error reporting is a critical part of a human-friendly interface.
> >>> We have two separate problems with it:
> >>> 
> >>> 1. The visitor reports errors as if aliases didn't exist
> >>> 
> >>>    Fixing this is "merely" a matter of tracing back alias applications.
> >>>    More complexity...
> >>> 
> >>> 2. The visitor reports errors as if manual transformation didn't exist
> >>> 
> >>>    Manual transformation can distort the users input beyond recognition.
> >>>    The visitor reports errors for the transformed input.
> >>> 
> >>>    To fix this one, we'd have to augment the parse tree so it points
> >>>    back at the actual user input, and then make the manual
> >>>    transformations preserve that.  Uff!
> >>
> >> Manual transformations are hard to write in a way that they give perfect
> >> results. As long as they are only used for legacy syntax and we expect
> >> users to move to a new way to spell things, this might be acceptable for
> >> a transition period until we remove the old syntax.
> >
> > Valid point.
> >
> >> In other cases, the easiest way is probably to duplicate even more of
> >> the schema and manually make sure that the visitor will accept the input
> >> before we transform it.
> >>
> >> The best way to avoid this is providing tools in QAPI that make manual
> >> transformations unnecessary.
> >
> > Reducing the amount of handwritten code is good, as long as the price is
> > reasonable.  Complex code fetches a higher price.
> >
> > I think there are a couple of ways to skin this cat.
> >
> > 0. Common to all ways: specify "standard" in the QAPI schema.  This
> >    specifies both the "standard" wire format, its parse tree
> >    (represented as QObject), and the "standard" C interface (C types,
> >    basically).
> >
> >    Generic parsers parse into the parse tree.  The appropriate input
> >    visitor validates and converts to C types.
> >
> > 1. Parse "alternate" by any means (QemuOpts, keyval, ad hoc), validate,
> >    then transform for the "standard" C interface.  Parsing and
> >    validating can fail, the transformation can't.
> >
> >    Drawbacks:
> >
> >    * We duplicate validation, which is a standing invitation for bugs.
> >
> >    * Longwinded, handwritten transformation code.  Less vulnerable to
> >      bugs than validation code, I believe.
> >
> > 2. Parse "alternate" by any means (QemuOpts, keyval, ad hoc), transform
> >    to "standard" parse tree.
> >
> >    Drawbacks:
> >
> >    * Bad error messages from input visitor.
> >
> >    * The handwritten transformation code is more longwinded than with 1.
> >
> > 3. Specify "alternate" in the QAPI schema.  Map "alternate" C interface
> >    to the "standard" one.
> >
> >    Drawbacks:
> >
> >    * QAPI schema code duplication
> >
> >    * Longwinded, handwritten mapping code.
> >
> >    This is what we did with SocketAddressLegacy.
> >
> > 4. Extend the QAPI schema language to let us specify non-standard wire
> >    format(s).  Use that to get the "alternate" wire format we need.
> >
> >    Drawbacks:
> >
> >    * QAPI schema language and generator become more complex.
> >
> >    * Input visitor(s) become more complex.
> >
> >    * Unless we accept "alternate" everywhere, we need a way to limit it
> >      to where it's actually needed.  More complexity.
> >
> >    The concrete proposal on the table is aliases.  They are not a
> >    complete solution.  To solve the whole problem, we combine them with
> >    2.  We accept 4's drawbacks for a (sizable) reduction of 2's.
> >    Additionally, we accept "ghost" aliases.

We combine it with 2 to solve these problems:

* Automatically determining the union type for SocketAddressLegacy

* Accepting short-form booleans (deprecated since 6.0, can be dropped)

* Diverging default values between CLI and QMP.

  This includes a case in chardev-udp where QMP requires a whole
  SocketAddressLegacy or nothing, but CLI accepts specifying only one of
  host/port and provides a default for the other one.

* Enable aliases for chardev types (= aliases for enum values)

Solving these in generic QAPI code would probably be possible, but apart
from the short-form booleans the drawbacks of 2 are pretty much
insignificant (especially the error messages part doesn't apply), so it
feels tolerable.

> > 5. Extend the QAPI schema language to let us specify "alternate" wire
> >    formats for "standard" types
> >
> >    This is like 3, except the schema code is mostly referenced instead
> >    duplicated, and the mapping code is generated.  Something like
> >    "derive type T' from T with these members moved / renamed".
> >
> >    Drawbacks
> >
> >    * QAPI schema language and generator become more complex.
> >
> >    * Unlike 4, we don't have working code.
> >
> >    Like 4, this will likely solve only part of the problem.
> 
> I got one more:
> 
> 6. Stir more sugar into the input visitor we use with keyval_parse():
> 
>    - Recognze unique suffix of full key.  Example: "ipv6" as
>      abbreviation of "backend.data.remote.data.ipv4".

Deciding "unique" in the visitor code feels tricky. You don't know what
future code will visit.

The only option I see is that the QAPI generator already compiles a full
list of possible abbreviations for every object type. (Obviously fails
for 'any', but I think this is not a problem.) Ugly.

Maintaining compatibility feels hard. Adding a new member "ipv4" to a
completely different type that might be used in a different union
branch, would make this stop working, probably without anyone noticing.

>    - Default union type tag when variant members of exactly one branch
>      are present.  Example: when we got "backend.data.addr.data.host",
>      "backend.data.addr.type" defaults to "inet".
> 
>    Beware, this is even hairier than it may look.  For instance, we want
>    to expand "host=playground.redhat.com,port=12345" into
> 
>        backend.type=socket
>        backend.data.addr.type=inet
>        backend.data.addr.data.host=playground.redhat.com
>        backend.data.addr.data.port=12345
> 
>    and not into
> 
>        backend.type=udp
>        backend.data.remote.type=inet
>        backend.data.remote.data.host=playground.redhat.com
>        backend.data.remote.data.port=12345
> 
>    I'm afraid this idea also solves only part of the problem.

Am I misunderstanding how you intended it to work? I thought it wouldn't
accept host=... at all because it isn't a unique suffix. In which case
it would obviously solve even less of the problem.

> > Which one is the least bad?
> >
> > If this was just about dragging deprecated interfaces to the end of
> > their grace period, I'd say "whatever is the least work", and that's
> > almost certainly whatever we have now, possibly hacked up to use the
> > appropriate internal interface.
> >
> > Unfortunately, it is also about providing a friendlier interface to
> > humans "forever".
> >
> > With 4 or 5, we invest into infrastructure once, then maintain it
> > forever, to make solving the problem easier and the result easier to
> > maintain.
> >
> > Whether the investment will pay off depends on how big and bad the
> > problem is.  Hard to say.  One of the reasons we're looking at -chardev
> > now is that we believe it's the worst of the bunch.  But how big is the
> > bunch, and how bad are the others in there?
> >
> >>> I'm afraid I need another round of thinking on how to best drag legacy
> >>> syntax along when we QAPIfy.
> >>
> >> Let me know when you've come to any conclusions (or more things to
> >> discuss).
> >
> > Is 3 too awful to contemplate?

I don't feel it's worth my while because the result would be only
marginally better than the existing 1.

The short-term alternative is just adding JSON and leaving the rest
alone. Maybe deprecate the old syntax and just break it at some flag day
together with -object and -device. This fixes the compatibility
problems, but leaves the usability problem unaddressed, i.e. it will
result in a very human unfriendly syntax. If that is preferable to
having suboptimal error messages in legacy cases, I'm not sure. But at
least it will be a lot easier for me.


If we do want to address a wider problem, including making CLI more
human friendly (which would possibly not only apply to -chardev, but
also -blockdev and other options if it allows more than one valid syntax
on the command line), I'm willing to work on 4 or 5.

I think mandatory (to avoid ghosts) flattening and local renames can be
solved without touching the visitor like this alias series does, just by
generating different code, like:

    if (v.profile == QMP):
        visit_Foo(...)
    else if (v.profile == CLI):
        visit_Foo_members(...)

I don't see yet how to do this for non-local renames (like localaddr ->
local.data.host for charev-udp). Making the alternate syntax mandatory
to avoid ghosts also means that the solution can't be applied to
existing options like -blockdev without breaking compatibility.

Anyway, I've made two attempts at solving a wider problem (first just
flattening simple unions, and then more generically with aliases) and
both got shot down by you. For the third attempt I'd prefer very clear
requirements before I even start because I don't feel like wasting
another year.

Kevin


