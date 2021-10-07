Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FA42587A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:54:02 +0200 (CEST)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWef-0000gc-K8
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYWYp-0003g3-CF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYWYl-0002dy-1X
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633625271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=64OP9Sh5CtZ7w77SVfPDlPsD121w4g3g7HcfLM2wm9o=;
 b=c/A1CMhkZIaCmCXi1wc8bL2svLxt+OpAR4ZQaAmp82TQzV7AmvlM0ll2WX5mJtFY4p2kPC
 HoPbHSREUs9X3hufNPcr+YP/ORIiwTPKZnYfnO5ai6pPNULaiLELvquP9Xrbx2Abkhhh+O
 5W1qpg/kPrZgTXxfWsyHq/LyTTZjVI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-3N5yx2IsMe-rTEqB4Qza4w-1; Thu, 07 Oct 2021 12:47:44 -0400
X-MC-Unique: 3N5yx2IsMe-rTEqB4Qza4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E995245B2
 for <qemu-devel@nongnu.org>; Thu,  7 Oct 2021 16:32:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D78052913E;
 Thu,  7 Oct 2021 16:12:36 +0000 (UTC)
Date: Thu, 7 Oct 2021 18:12:34 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YV8ccu9MpKjyXT/G@redhat.com>
References: <YUG71uATYCwpRyQH@redhat.com> <8735q3y5db.fsf@dusky.pond.sub.org>
 <YUSuThJtW9ar2wCY@redhat.com> <87a6jrimaf.fsf@dusky.pond.sub.org>
 <YVsKpClmGgq5ki7r@redhat.com> <87mtnnvay7.fsf@dusky.pond.sub.org>
 <YVyFwWHY7a7CKMxN@redhat.com> <874k9uqov5.fsf@dusky.pond.sub.org>
 <YV3QlKi4jeW+54Yb@redhat.com> <87ee8xhz6u.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ee8xhz6u.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2021 um 13:06 hat Markus Armbruster geschrieben:
> >> >> > HMP in contrast means separate code for every command, or translated to
> >> >> > the CLI for each command line option. HMP is not defined in QAPI, it's
> >> >> > a separate thing that just happens to call into QAPI-based QMP code in
> >> >> > the common case.
> >> >> >
> >> >> > Is this what you have in mind for non-JSON command line options?
> >> >> 
> >> >> We should separate the idea "HMP wraps around QMP" from its
> >> >> implementation as handwritten, boilerplate-heavy code.
> >> >> 
> >> >> All but the latest, QAPI-based CLI options work pretty much like HMP: a
> >> >> bit of code generation (hxtool), a mix of common and ad hoc parsers,
> >> >> boring handwritten code to translate from parse tree to internal C
> >> >> interfaces (which are often QMP command handlers), and to stitch it all
> >> >> together.
> >> >> 
> >> >> Reducing the amount of boring handwritten code is equally desirable for
> >> >> HMP and CLI.
> >> >> 
> >> >> So is specifying the interface in QAPI instead of older, less powerful
> >> >> schema languages like hxtool and QemuOpts.
> >> >> 
> >> >> There are at least three problems:
> >> >> 
> >> >> 1. Specifying CLI in QAPI hasn't progressed beyond the proof-of-concept
> >> >> stage.
> >> >> 
> >> >> 2. Backward compatibility issues and doubts have defeated attempts to
> >> >> replace gnarly stuff, in particular QemuOpts.
> >> >> 
> >> >> 3. How to best bridge abstract syntax differences has been unclear.
> >> >> Whether the differences are historical accidents or intentional for ease
> >> >> of human use doesn't matter.
> >> >> 
> >> >> Aliases feel like a contribution towards solving 3.
> >> >> 
> >> >> I don't think 1. is particularly difficult.  It's just a big chunk of
> >> >> work that isn't really useful without solutions for 2. and 3.
> >> >> 
> >> >> To me, 2. feels intractable head on.  Perhaps we better bypass the
> >> >> problem by weakening the compatibility promise like we did for HMP.
> >> >
> >> > Can we define 2 in a bit more specific terms? I feel the biggest part
> >> > of 2 is actually 3.
> >> >
> >> > You mention QemuOpts, but how commonly are the potentially problematic
> >> > features of it even used? Short booleans are deprecated and could be
> >> > dropped in 6.2. merge_lists may or may not have to be replicated.
> >> > I know building lists from repeated keys is said to be a thing, where
> >> > does it happen? I've worked on some of the big ones (blockdev, chardev,
> >> > object, device) and haven't come across it yet.
> >> 
> >> Alright, I'll look for you :) Check out commit 2d6dcbf93fb, 396f935a9af,
> >> 54cb65d8588, f1672e6f2b6.  These are fairly recent, which is kind of
> >> depressing.  There may be more.
> >
> > Should we patch QemuOpts to disallow this by default and require setting
> > QemuOptsList.legacy_enable_repeated_options just to avoid new instances
> > sneaking in?
> 
> I honestly don't know.
> 
> On the one hand, the use of repeated keys for lists wasn't designed into
> QemuOpts, it was a "clever" (ab)use of a QemuOpts implementation detail.
> 
> On the other hand, -vnc vnc=localhost:1,vnc=unix:/tmp/vnc feels
> friendlier to human me than -vnc vnc.0=localhost:1,vnc.1=unix:/tmp/vnc.
> 
> Repeated keys just don't fit into the QAPI parsing pipeline.  "Object
> member names are unique" is baked into data structures and code.  Quite
> reasonable when you start with JSON.
> 
> But this is a digression.

Making a list out of repeated keys should be easy in the keyval parser.
Turning a single or an absent key into a list in the right cirumstances
is harder because the keyval parser knows nothing about the schema.

Of course, we use the keyval parser in combination with the keyval
visitor, and when visiting lists, we could accept absent or scalar
values by wrapping a list around the input. (Doing the same for objects
would feel a bit crazier, but I don't think we need that anyway.)

So I think this is actually doable if we want.

But in general, the split between parser and schema keeps giving us
trouble, and visitors not knowing anything about future visitor calls
can make things harder, too. Probably too late to use a fundamentally
different way to parse things, though.

> >> > Can we have an intermediate state where CLI parsing involves both QAPI
> >> > generated options and manually written ones? So that we can actually put
> >> > the QAPIfication work already done to use instead of just having a
> >> > promise that it will make things possible eventually, in a few years?
> >> 
> >> We kind of sort of have that already: a few option arguments are
> >> QAPI-based.
> >> 
> >> Perhaps it's time to crack 1., but in a way that accommodates
> >> handwritten options.  Could be like "this option takes a string
> >> argument, and the function to process the option is not to be generated,
> >> only called (just like 'gen': false for commands).  We may want to make
> >> introspection describe the argument as "unknown", to distinguish it from
> >> genuine string arguments.
> >
> > Maybe 'data': 'any' rather than 'gen': false if the keyval parser makes
> > sense for the option.
> 
> Yes, providing for "keyval without visitor" may be useful.
> 
> >                       Or as a first step, just call into a single C
> > function for any unknown option so that we don't have to split the big
> > switch block immediately and can instead reduce it incrementally. Then
> > 'data': 'any' is an intermediate step we can take when a function is too
> > complicated to be fully QAPIfied in a single commit.
> 
> Yes, we could have some options defined in the QAPI schema, the
> remainder in .hx, then stitch the generated code together.  Enables
> moving commands from .hx to the QAPI schema one by one.
> 
> I'm not sure that's simpler than replacing .hx wholesale.

I didn't even think of .hx any more. So the above refers only to the
parsing loop in qemu_init(). Moving things from .hx to the schema can
probably be done mostly independent from converting the implementation
when you start with 'gen': false.

Actually, the other thing .hx contains is help texts. I seem to remember
that you had another half-finished set of patches to display help from
QAPI documentation?

> > But yes, I guess cracking 1. is what I had in mind: Let QAPI control the
> > command line parsing and only call out into handwritten code for not yet
> > converted options. I think this would be a big step forward compared to
> > the current state of only calling into QAPI for selected options because
> > it makes it very obvious that new code should use QAPI, and it would
> > also give us more a visible list of things that still need to be
> > converted.
> 
> No argument.
> 
> I have (dusty) RFC patches.

Time to undust them?

> >> >> > What I had in mind was using the schema to generate the necessary code,
> >> >> > using the generic keyval parser everywhere, and just providing a hook
> >> >> > where the QDict could be modified after the keyval parser and before the
> >> >> > visitor. Most command line options would not have any explicit code for
> >> >> > parsing input, only the declarative schema and the final option handler
> >> >> > getting a QAPI type (which could actually be the corresponding QMP
> >> >> > command handler in the common case).
> >> >> >
> >> >> > I think these are very different ideas. If we want HMP-like, then all
> >> >> > the keyval based code paths we've built so far don't make much sense.
> >> >> 
> >> >> I'm not sure the differences are "very" :)
> >> >> 
> >> >> I think you start at "human-friendly and machine-friendly should use the
> >> >> abstract syntax defined in the QAPI schema, except where human-friendly
> >> >> has to differ, say for backward compatibility".
> >> >> 
> >> >> This approach considers differences a blemish.  The "standard" abstract
> >> >> syntax (the one defined in the QAPI schema) should be accepted in
> >> >> addition to the "alternate" one whenever possible, so "modern" use can
> >> >> avoid the blemishes, and blemishes can be removed once they have fallen
> >> >> out of use.
> >> >> 
> >> >> "Alternate" should not be limited to human-friendly.  Not limiting keeps
> >> >> things consistent, which is good, because differences are bad.
> >> >> 
> >> >> Is that a fair description?
> >> >
> >> > Hm, yes and no.
> >> >
> >> >
> >> > I do think that making the overlap between "standard" and "alternate"
> >> > abstract syntax as big as possible is a good thing because it means less
> >> > translation has to go on between them, and ultimately the interfaces are
> >> > more consistent with each other which actually improves the human
> >> > friendliness for people who get in touch with both syntaxes.
> >> >
> >> > The -chardev conversion mostly deals with differences that I do consider
> >> > a blemish: There is no real reason why options need to have different
> >> > names on both interfaces, and there is also a lot of nesting in QMP for
> >> > which there is no real reason.
> >> >
> >> > The reason why we need to accept both is compatibility, not usability.
> >> 
> >> Compatibility requires us to accept both, but each in its place.  It
> >> doesn't actually require us to accept both in either place.
> >
> > Yes.
> >
> >> > There are also some differences that are justified by friendliness.
> >> > Having "addr" as a nested struct in QMP just makes sense, and on the
> >> > command line having it flattened makes more sense.
> >> >
> >> > So accepting "path" for "device" in ChardevHostdev is probably a case
> >> > where switching both QMP and CLI to "modern" use and remove the
> >> > "blemish" eventually makes sense to me. The nesting for "addr" isn't.
> >> >
> >> > We may even add more differences to make things human friendly. My
> >> > standard for this is whether the difference serves only for
> >> > compatibility (should go away eventually) or usability (should stay).
> >> 
> >> In theory, cleaning up QMP is nice.  In practice, we don't have a good
> >> way to rename or move members.  When we do, we have to make both old and
> >> new optional, even when you actually have to specify exactly one.  This
> >> isn't the end of the world, but it is trading one kind of blemish for
> >> another.
> >> 
> >> Improving on that would involve a non-trivial extension to
> >> introspection.  Pain right away, gain only when all management
> >> applications that matter grok it.
> >> 
> >> I think the realistic assumption is that QMP blemishes stay.
> >> 
> >> Of course, we'd prefer not to copy existing QMP blemishes into new
> >> interfaces.  That's why we have SocketAddress for new code, and
> >> SocketAddressLegacy for old code.  Workable for simple utility types.  I
> >> don't have a good solution for "bigger" types.
> >
> > If this is a common problem and we want to solve it in a declarative
> > way, presumably a way to define mappings similar to aliases is not
> > unthinkable. Apart from the effort to implement it, there is no reason
> > why two types on the external interface couldn't share a single
> > representation in C, just with different mappings.
> 
> True.
> 
> If we use aliases to provide multiple wire formats for a common C type,
> the common C type can only be the most nested one.  I'd prefer the least
> nested one.  We'll live.

This direction would actually have been easier to implement, but it's
also much less powerful and couldn't have solved the problem I tried to
solve.

It could be used for flattening simple unions and for local aliases, but
pulling things like addr.* to the top level would be impossible unless
you directly embed the fields of SocketAddress into ChardevBackend.

> >> >> I start at "human-friendly syntax should be as friendly as we can make
> >> >> it, except where we have to compromise, say for backward compatibility".
> >> >> 
> >> >> This approach embraces differences.  Mind, not differences just for
> >> >> differences sake, only where they help users.
> >> >> 
> >> >> Additionally accepting the "standard" abstract syntax is useful only
> >> >> where it helps users.
> >> >> 
> >> >> "Alternate" should be limited to human-friendly.
> >> >
> >> > I think there is a small inconsistency in this reasoning: You say that
> >> > differences must help users, but then this is not the measuring stick
> >> > you use in the next paragraph. If it were, you would be asking whether
> >> > rejecting "standard" abstract syntax helps users, rather than whether
> >> > adding it does. (Even more so because rejecting it is more work! Not
> >> > much more work, but it adds a little bit of complexity.)
> >> 
> >> Additionally accepting "standard" complicates the interface and its
> >> documentation.  Whether this helps users more than it hurts them is not
> >> obvious.
> >
> > Fair. When it's unclear for users, let's consider developers? :-)
> >
> > I really don't want to invest a lot of time and effort (and code
> > complexity) just to get "standard" rejected.
> 
> I acknowledge the existence of working code :)
> 
> If we had understood the problem back then as well as we do now, you
> might have written different code.

s/the problem/the maintainer's preferences/ ;-)

The implicit requirement I wasn't aware of is "there should be only one
way to express the same thing on each external interface". Aliases go
against that by their very nature - they provide a second way.

> Aliases are for *adding* "alternate" to "standard" by nature.
> 
> To get "alternate" *instead* of "standard", something else might be a
> better fit.  "T2 inherits from T1 with the following renames" comes to
> mind.

Right.

> >> >> > I guess I can go into more details once we have answered these
> >> >> > fundamental questions.
> >> >> >
> >> >> > (We could and should have talked about them and about whether you want
> >> >> > to have aliases at all a year ago, before going into detailed code
> >> >> > review and making error messages perfect in code that we might throw
> >> >> > away anyway...)
> >> >> 
> >> >> I doubt you could possibly be more right than that!
> >> >
> >> > So what questions need to be answered before we can make a decision?
> >> >
> >> > You talked a lot about how you like QMP to be different from the command
> >> > line. So is restricting aliases to the command line enough to make them
> >> > acceptable? Or do we need larger changes? Should I just throw them away
> >> > and write translation code for -chardev manually?
> >> 
> >> Fair question, but I'm out of time for right now.  Let's continue
> >> tomorrow.
> >
> > :-)
> 
> What's the smallest set of aliases sufficient to make your -chardev
> QAPIfication work?

How do you define "make the QAPIfication work"?

The -chardev conversion adds the following aliases to the schema:

* SocketAddressLegacy: Flatten a simple union (wildcard alias +
  non-local alias)

    { 'source': ['data'] },
    { 'name': 'fd', 'source': ['data', 'str'] }

* ChardevFile: Rename local member

    { 'name': 'path', 'source': ['out'] }

* ChardevHostdev: Rename local member

    { 'name': 'path', 'source': ['device'] }

* ChardevSocket: Flatten embedded struct (wildcard alias)

    { 'source': ['addr'] }

* ChardevUdp: Flatten two embedded structs with renaming (wildcard
  alias + non-local alias)

    { 'source': ['remote'] },
    { 'name': 'localaddr', 'source': ['local', 'data', 'host'] },
    { 'name': 'localport', 'source': ['local', 'data', 'port'] }

* ChardevSpiceChannel: Rename local member

    { 'name': 'name', 'source': ['type'] }

* ChardevSpicePort: Rename local member

    { 'name': 'name', 'source': ['fqdn'] }

* ChardevBackend: Flatten a simple union (wildcard alias)

    { 'source': ['data'] }

* ChardevOptions: Flatten embedded struct (wildcard alias)

    { 'source': ['backend'] }

The deeper they are nested in the type hierarchy, especially when unions
with different variants come into play, the nastier they are to replace
with C code. The C code stays the simplest if all of the aliases are
there, and it gets uglier the more of them you leave out.

I don't know your idea of "sufficient", so I'll leave mapping that to a
scale of sufficiency to you.

Kevin


