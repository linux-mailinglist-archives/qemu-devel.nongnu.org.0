Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F524242E5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:41:02 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9yX-0000vC-2g
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY9uT-0005IP-KI
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY9uM-0007XD-Sz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CX9ikNO0VrpIHnnik91XuAGxPaOsFfDDBc2rQ4QvWhY=;
 b=WXThTrbIQ/MAG9bzeAAvkKIeglHoNLhDQPY8mQ67zBPt6meYBlJ6+MWEBmHJ3kt56H6Oop
 k0VJBLPMHaIwxOLsUZ/u5VCO4+dWkloenEhjKnPc1wSjRKBzMjhe7BzEwl70dQGDj9PF4G
 wzVF7vvsg4tsIBuQqN4Y4UaWDko7yhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-NDzMmBFCOhqIFLE9jYVxlQ-1; Wed, 06 Oct 2021 12:36:40 -0400
X-MC-Unique: NDzMmBFCOhqIFLE9jYVxlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7494410168C0
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 16:36:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD335C1A1;
 Wed,  6 Oct 2021 16:36:38 +0000 (UTC)
Date: Wed, 6 Oct 2021 18:36:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YV3QlKi4jeW+54Yb@redhat.com>
References: <YUB0BcZUwwwecrFl@redhat.com> <87k0jj8evk.fsf@dusky.pond.sub.org>
 <YUG71uATYCwpRyQH@redhat.com> <8735q3y5db.fsf@dusky.pond.sub.org>
 <YUSuThJtW9ar2wCY@redhat.com> <87a6jrimaf.fsf@dusky.pond.sub.org>
 <YVsKpClmGgq5ki7r@redhat.com> <87mtnnvay7.fsf@dusky.pond.sub.org>
 <YVyFwWHY7a7CKMxN@redhat.com> <874k9uqov5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <874k9uqov5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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

Am 06.10.2021 um 15:11 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 05.10.2021 um 15:49 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > Am 02.10.2021 um 15:33 hat Markus Armbruster geschrieben:
> >> >> I apologize for this wall of text.  It's a desparate attempt to cut
> >> >> through the complexity and my confusion, and make sense of the actual
> >> >> problems we're trying to solve.
> >> >> 
> >> >> So, what problems exactly are we trying to solve?
> >> >
> >> > I'll start with replying to your final question because I think it's
> >> > more helpful to start with the big picture than with details.
> >> >
> >> > So tools like libvirt want to have a single consistent interface to
> >> > configure things on startup and at runtime. We also intend to support
> >> > configuration files that should this time support all of the options and
> >> > not just a few chosen ones.
> >> 
> >> Yes.
> >> 
> >> > The hypothesis is that QAPIfying the command line is the correct
> >> > solution for both of these problems, i.e. all available command line
> >> > options must be present in the QAPI schema and will be processed by a
> >> > single parser shared with QMP to make sure they are consistent.
> >> 
> >> Yes.
> >> 
> >> This leads us to JSON option arguments and configuration files.
> >> Well-suited for management applications that already use QMP.
> >> 
> >> > Adding QAPIfied versions of individual command line options are steps
> >> > towards this goal. As soon as they exist for every option, the final
> >> > conversion from an open coded getopt() loop (or in fact a hand crafted
> >> > parser in the case of vl.c) to something generated from the QAPI schema
> >> > should be reasonably easy.
> >> 
> >> Yes.
> >> 
> >> > You're right that adding a second JSON-based command line interface for
> >> > every option can already achieve the goal of providing a unified
> >> > external interface, at the cost of (interface and code) duplication. Is
> >> > this duplication desirable? Certainly no. Is it acceptable? You might
> >> > get different opinions on this one.
> >> 
> >> We'd certainly prefer CLI options to match corresponding QMP commands
> >> exactly.
> >> 
> >> Unfortunately, existing CLI options deviate from corresponding QMP
> >> commands, and existing CLI options without corresponding QMP commands
> >> may violate QMP design rules.
> >> 
> >> Note: these issues pertain to human-friendly option syntax.  The
> >> machine-friendly option syntax is still limited to just a few options,
> >> and it does match QMP there.
> >
> > On the other hand, we only have a handful of existing options that are
> > very complex. Most of them aren't even structured and just take a single
> > scalar value. So I'm relatively sure that we know the big ones, and
> > we're working on them.
> >
> > Another point here is that I would argue that there is a difference
> > between existing options and human-friendly options. Not all existing
> > options are human-friendly just because they aren't machine friendly
> > either, and there is probably potential for human-friendly syntax that
> > doesn't exist yet.
> >
> > So I would treat support for existing options (i.e. compatibility) and
> > support for human-friendly options (i.e. usability) as two separate
> > problems.
> 
> That's fair.
> 
> Instead of "human-friendly option syntax", I could've written "our
> traditional option syntax (which is better suited to humans than to
> machines, although it still fails to be truly friendly to anyone)", but
> that's a tad long, isn't it?

It is, but I had the impression that you used the same term for both
things without making a distinction.

> >> > In my opinion, we should try to get rid of hand crafted parsers where
> >> > it's reasonably possible, and take advantage of the single unified
> >> > option structure that QAPI provides. -chardev specifically has a hand
> >> > crafted parser that essentially duplicates the automatically generated
> >> > QAPI visitor code, except for the nesting and some differences in option
> >> > names.
> >> 
> >> We should definitely parse JSON option arguments with the QAPI
> >> machinery, and nothing more.
> >
> > Yes, no doubt. (And we don't even consistently do that yet, like
> > device-add going through QemuOpts after going through QAPI and throwing
> > away all type information and silently ignoring anything it doesn't know
> > to handle.)
> 
> At least device-add is the last remaining user of 'gen': false.
> 
> The 'any' type also leaves type checking to handwritten code, but at
> least it doesn't throw away type information first.  Used by qom-get and
> qom-set.

Even if device-add wasn't 'gen': false, in theory nothing would stop it
from going back from the QAPI C object through a output visitor and
QemuOpts and throwing the type information away again. Of course, with
explicit type checks in QAPI, we're less likely to mess up the other
side because otherwise things just wouldn't work.

But I actually know a subsystem where such conversions happen... *cough*

> >> > HMP in contrast means separate code for every command, or translated to
> >> > the CLI for each command line option. HMP is not defined in QAPI, it's
> >> > a separate thing that just happens to call into QAPI-based QMP code in
> >> > the common case.
> >> >
> >> > Is this what you have in mind for non-JSON command line options?
> >> 
> >> We should separate the idea "HMP wraps around QMP" from its
> >> implementation as handwritten, boilerplate-heavy code.
> >> 
> >> All but the latest, QAPI-based CLI options work pretty much like HMP: a
> >> bit of code generation (hxtool), a mix of common and ad hoc parsers,
> >> boring handwritten code to translate from parse tree to internal C
> >> interfaces (which are often QMP command handlers), and to stitch it all
> >> together.
> >> 
> >> Reducing the amount of boring handwritten code is equally desirable for
> >> HMP and CLI.
> >> 
> >> So is specifying the interface in QAPI instead of older, less powerful
> >> schema languages like hxtool and QemuOpts.
> >> 
> >> There are at least three problems:
> >> 
> >> 1. Specifying CLI in QAPI hasn't progressed beyond the proof-of-concept
> >> stage.
> >> 
> >> 2. Backward compatibility issues and doubts have defeated attempts to
> >> replace gnarly stuff, in particular QemuOpts.
> >> 
> >> 3. How to best bridge abstract syntax differences has been unclear.
> >> Whether the differences are historical accidents or intentional for ease
> >> of human use doesn't matter.
> >> 
> >> Aliases feel like a contribution towards solving 3.
> >> 
> >> I don't think 1. is particularly difficult.  It's just a big chunk of
> >> work that isn't really useful without solutions for 2. and 3.
> >> 
> >> To me, 2. feels intractable head on.  Perhaps we better bypass the
> >> problem by weakening the compatibility promise like we did for HMP.
> >
> > Can we define 2 in a bit more specific terms? I feel the biggest part
> > of 2 is actually 3.
> >
> > You mention QemuOpts, but how commonly are the potentially problematic
> > features of it even used? Short booleans are deprecated and could be
> > dropped in 6.2. merge_lists may or may not have to be replicated.
> > I know building lists from repeated keys is said to be a thing, where
> > does it happen? I've worked on some of the big ones (blockdev, chardev,
> > object, device) and haven't come across it yet.
> 
> Alright, I'll look for you :) Check out commit 2d6dcbf93fb, 396f935a9af,
> 54cb65d8588, f1672e6f2b6.  These are fairly recent, which is kind of
> depressing.  There may be more.

Should we patch QemuOpts to disallow this by default and require setting
QemuOptsList.legacy_enable_repeated_options just to avoid new instances
sneaking in?

> When I wrote 2., I was specifically thinking of -object, where we
> decided not to mess the human-friendly syntax in part because we didn't
> fully understand what a conversion from QemuOpts to keyval could break.

I seem to remember we were confident that only the various list hacks
would be problematic. They only property in -object that makes use of
them is memory-backend.host-nodes. We should deprecate the old syntax
for it and move on.

> > Can we have an intermediate state where CLI parsing involves both QAPI
> > generated options and manually written ones? So that we can actually put
> > the QAPIfication work already done to use instead of just having a
> > promise that it will make things possible eventually, in a few years?
> 
> We kind of sort of have that already: a few option arguments are
> QAPI-based.
> 
> Perhaps it's time to crack 1., but in a way that accommodates
> handwritten options.  Could be like "this option takes a string
> argument, and the function to process the option is not to be generated,
> only called (just like 'gen': false for commands).  We may want to make
> introspection describe the argument as "unknown", to distinguish it from
> genuine string arguments.

Maybe 'data': 'any' rather than 'gen': false if the keyval parser makes
sense for the option. Or as a first step, just call into a single C
function for any unknown option so that we don't have to split the big
switch block immediately and can instead reduce it incrementally. Then
'data': 'any' is an intermediate step we can take when a function is too
complicated to be fully QAPIfied in a single commit.

But yes, I guess cracking 1. is what I had in mind: Let QAPI control the
command line parsing and only call out into handwritten code for not yet
converted options. I think this would be a big step forward compared to
the current state of only calling into QAPI for selected options because
it makes it very obvious that new code should use QAPI, and it would
also give us more a visible list of things that still need to be
converted.

> >> > What I had in mind was using the schema to generate the necessary code,
> >> > using the generic keyval parser everywhere, and just providing a hook
> >> > where the QDict could be modified after the keyval parser and before the
> >> > visitor. Most command line options would not have any explicit code for
> >> > parsing input, only the declarative schema and the final option handler
> >> > getting a QAPI type (which could actually be the corresponding QMP
> >> > command handler in the common case).
> >> >
> >> > I think these are very different ideas. If we want HMP-like, then all
> >> > the keyval based code paths we've built so far don't make much sense.
> >> 
> >> I'm not sure the differences are "very" :)
> >> 
> >> I think you start at "human-friendly and machine-friendly should use the
> >> abstract syntax defined in the QAPI schema, except where human-friendly
> >> has to differ, say for backward compatibility".
> >> 
> >> This approach considers differences a blemish.  The "standard" abstract
> >> syntax (the one defined in the QAPI schema) should be accepted in
> >> addition to the "alternate" one whenever possible, so "modern" use can
> >> avoid the blemishes, and blemishes can be removed once they have fallen
> >> out of use.
> >> 
> >> "Alternate" should not be limited to human-friendly.  Not limiting keeps
> >> things consistent, which is good, because differences are bad.
> >> 
> >> Is that a fair description?
> >
> > Hm, yes and no.
> >
> >
> > I do think that making the overlap between "standard" and "alternate"
> > abstract syntax as big as possible is a good thing because it means less
> > translation has to go on between them, and ultimately the interfaces are
> > more consistent with each other which actually improves the human
> > friendliness for people who get in touch with both syntaxes.
> >
> > The -chardev conversion mostly deals with differences that I do consider
> > a blemish: There is no real reason why options need to have different
> > names on both interfaces, and there is also a lot of nesting in QMP for
> > which there is no real reason.
> >
> > The reason why we need to accept both is compatibility, not usability.
> 
> Compatibility requires us to accept both, but each in its place.  It
> doesn't actually require us to accept both in either place.

Yes.

> > There are also some differences that are justified by friendliness.
> > Having "addr" as a nested struct in QMP just makes sense, and on the
> > command line having it flattened makes more sense.
> >
> > So accepting "path" for "device" in ChardevHostdev is probably a case
> > where switching both QMP and CLI to "modern" use and remove the
> > "blemish" eventually makes sense to me. The nesting for "addr" isn't.
> >
> > We may even add more differences to make things human friendly. My
> > standard for this is whether the difference serves only for
> > compatibility (should go away eventually) or usability (should stay).
> 
> In theory, cleaning up QMP is nice.  In practice, we don't have a good
> way to rename or move members.  When we do, we have to make both old and
> new optional, even when you actually have to specify exactly one.  This
> isn't the end of the world, but it is trading one kind of blemish for
> another.
> 
> Improving on that would involve a non-trivial extension to
> introspection.  Pain right away, gain only when all management
> applications that matter grok it.
> 
> I think the realistic assumption is that QMP blemishes stay.
> 
> Of course, we'd prefer not to copy existing QMP blemishes into new
> interfaces.  That's why we have SocketAddress for new code, and
> SocketAddressLegacy for old code.  Workable for simple utility types.  I
> don't have a good solution for "bigger" types.

If this is a common problem and we want to solve it in a declarative
way, presumably a way to define mappings similar to aliases is not
unthinkable. Apart from the effort to implement it, there is no reason
why two types on the external interface couldn't share a single
representation in C, just with different mappings.

So far I think we only did this for SocketAddressLegacy, though, so it
might not be a very high priority.

> > Now with this, it's still open whether the "standard" syntax should only
> > be supported in QMP or also in the CLI, and whether "alternate" syntax
> > should only be supported in the CLI or also in QMP.
> >
> > Is usability actually improved by rejecting the "standard" syntax on the
> > command line, or by rejecting "alternate" syntax in QMP? Hardly so. It's
> > also not compatibility. So what is the justification for the difference?
> > Maintainability? I honestly don't see the improvement there either.
> >
> > So I don't really see a reason for differences, but at the same time
> > it's also not a very important question to me. If you prefer restricting
> > things, so be it.
> 
> I dislike adding "alternate" to machine-friendly QMP / CLI poses,
> because:
> 
> * Adding "alternate" poses documentation and introspection problems.
>   The introspection solutions will then necessitate management
>   application updates.  Anything we do becomes ABI immediately, so we
>   better get it right on the first try.
> 
> * Ignoring the documentation problems is a bad idea, because
>   undocumented interfaces are.
> 
> * If we ignore the introspection problems, then machines are well
>   advised to stick to introspectable "standard".  Why add "alternate"
>   then?  Complexity for nothing.
> 
> * Adding "alternate" to existing interfaces is pretty much pointless.
>   To use "alternate", machines first have to check whether this QEMU
>   provides it, and if not, fall back to "standard".  Just use "standard"
>   and call it a day.
> 
> * For new interfaces, the differences between "standard" and "alternate"
>   are hopefully smaller than for old interfaces.  Machines will likely
>   not care for improvements "alternate" may provide over "standard".
> 
> I haven't made up my mind on adding "standard" to human-friendly CLI.

Removing "alternate" from QMP is easy, at least as long as we don't want
to have a different set of "alternate" still enabled in QMP.

Removing "standard" from the CLI is much harder. If we can avoid this,
let's please avoid it.

> Too many ways to do the same thing are bound to confuse.  We could end
> up with the standard way, the alternate way we provide for backward
> compatibility, the alternate way we provide for usability, and any
> combination thereof.
> 
> Each of the three ways has its uses, though.  Combinations not so much.
> 
> Adding "standard" to human-friendly CLI only poses documentation
> problems (there is no introspection).  If we limit the backward
> compatibility promise to machine-friendly, getting things wrong is no
> big deal.

That's the plan, but it requires getting machine friendly as a first
step so that there is a stable alternative and we can actually lower the
backwards compatibility promise for the existing syntax.

> >> I start at "human-friendly syntax should be as friendly as we can make
> >> it, except where we have to compromise, say for backward compatibility".
> >> 
> >> This approach embraces differences.  Mind, not differences just for
> >> differences sake, only where they help users.
> >> 
> >> Additionally accepting the "standard" abstract syntax is useful only
> >> where it helps users.
> >> 
> >> "Alternate" should be limited to human-friendly.
> >
> > I think there is a small inconsistency in this reasoning: You say that
> > differences must help users, but then this is not the measuring stick
> > you use in the next paragraph. If it were, you would be asking whether
> > rejecting "standard" abstract syntax helps users, rather than whether
> > adding it does. (Even more so because rejecting it is more work! Not
> > much more work, but it adds a little bit of complexity.)
> 
> Additionally accepting "standard" complicates the interface and its
> documentation.  Whether this helps users more than it hurts them is not
> obvious.

Fair. When it's unclear for users, let's consider developers? :-)

I really don't want to invest a lot of time and effort (and code
complexity) just to get "standard" rejected.

> > So it seems that in practice your approach is more like "different by
> > default, making it the same needs justification", whereas I am leaning
> > more towards "same by default, making it different needs justification".
> >
> > Your idea of "human-friendly syntax should be as friendly as we can make
> > it" isn't in conflict with either approach. The thing that the idea
> > might actually conflict with is our time budget.
> 
> Reasonable people often have quite different ideas on "human-friendly".
> 
> >> Different approaches, without doubt.  Yet both have to deal with
> >> differences, and both could use similar techniques and machinery for
> >> that.  You're proposing to do the bulk of the work with aliases, and to
> >> have a tree-transforming hook for the remainder.  Makes sense to me.
> >> However, in sufficiently gnarly cases, we might have to bypass all this
> >> and keep using handwritten code until the backward compatibility promise
> >> is history: see 2. above.
> >
> > Possibly. I honestly can't tell how many of these cases we will have.
> > In all of -object, we had exactly one problematic option. This could
> > easily be handled in a tree-transforming hook.
> >
> >> In addition each approach has its own, special needs.
> >> 
> >> Yours adds "alternate" syntax to QMP.  This poses documentation and
> >> introspection problems.  The introspection solutions will then
> >> necessitate management application updates.
> >> 
> >> Mine trades these problems for others, namely how to generate parsers
> >> for two different syntaxes from one QAPI schema.
> >> 
> >> Do I make sense?
> >
> > In the long run, won't we need documentation and introspection even for
> > things that are limited to the command line? Introspection is one of the
> > big features enabled by CLI QAPIfication.
> 
> CLI introspection is about the machine-friendly syntax, not the
> human-friendly one, just like monitor introspection is about QMP, not
> HMP.

Good point.

> >> >> Valid argument.  CLI with JSON argument should match QMP.  Even when
> >> >> that means both are excessively nested.
> >> >> 
> >> >> CLI with dotted keys is a different matter, in my opinion.
> >> >
> >> > I'm skipping quite a bit of text here, mainly because I think we need an
> >> > answer first if we really want to switch the keyval options to be
> >> > HMP-like in more than just the support status (see above).
> >> >
> >> > Obviously, the other relevant question would then be if it also ends up
> >> > like HMP in that most interesting functionality isn't even available and
> >> > you're forced to use QMP/JSON when you're serious.
> >> 
> >> I figure this is because we have let "QMP first" degenerate into "QMP
> >> first, HMP never" sometimes, and we did so mostly because HMP is extra
> >> work that was hard to justify.
> >> 
> >> What if you could get the 1:1 HMP command basically for free?  It may
> >> not be the most human-friendly command possible.  But it should be a
> >> start.
> >
> > How would you do this?
> >
> > The obvious way is mapping QMP 1:1 like we do for some of the command
> > line options. But you just argued that this is not what you would prefer
> > for the command line, so it's probably not what you have in mind for HMP
> > either?
> 
> I think there are QMP commands where a 1:1 HMP command would be just
> fine.
> 
> For others, it would be awkward, but that could still better than
> nothing.
> 
> Infrastructure we build to QAPIfy the command line could probably be
> used to get less awkward HMP commands without writing so much code.
> 
> Note I'm not talking about HMP commands somebody *wants* to write, say
> to provide convenience magic that is inappropriate for QMP, or
> specialized higher level commands where QMP only provides general
> building blocks.

So basically, if a handwritten HMP handler doesn't exist for a given QMP
command, just generate one automatically? Sounds reasonable enough to
me.

> >> > I guess I can go into more details once we have answered these
> >> > fundamental questions.
> >> >
> >> > (We could and should have talked about them and about whether you want
> >> > to have aliases at all a year ago, before going into detailed code
> >> > review and making error messages perfect in code that we might throw
> >> > away anyway...)
> >> 
> >> I doubt you could possibly be more right than that!
> >
> > So what questions need to be answered before we can make a decision?
> >
> > You talked a lot about how you like QMP to be different from the command
> > line. So is restricting aliases to the command line enough to make them
> > acceptable? Or do we need larger changes? Should I just throw them away
> > and write translation code for -chardev manually?
> 
> Fair question, but I'm out of time for right now.  Let's continue
> tomorrow.

:-)

Kevin


