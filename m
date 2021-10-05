Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FC4228EE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:53:30 +0200 (CEST)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXksr-0000nx-Mr
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mXkok-0006u9-43
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mXkoh-0001R6-CR
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633441750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x8d37sBukX0KlpVqAEi8n4qc9PxaLZBhzNvFsrfBhhU=;
 b=Bpvq9QGrStvA/liYi+5oF8whU7EUb+hicuxct7GoZ57hxh5GQ6CrWRDnox0sFHwkLp5xaS
 lflHp8RjFqQoYAWhC0/QJV7NE65ESqYNy2GPSXbICmapRVU2096ej021B6rxko82dhoo2C
 otyq/ASecgjnuhkvp8QUYUGjO1qpcBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-6OBLQSI0MT69M_RyH_0zfQ-1; Tue, 05 Oct 2021 09:49:07 -0400
X-MC-Unique: 6OBLQSI0MT69M_RyH_0zfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA491023F58
 for <qemu-devel@nongnu.org>; Tue,  5 Oct 2021 13:49:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9635260C13;
 Tue,  5 Oct 2021 13:49:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25D42113865F; Tue,  5 Oct 2021 15:49:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org> <YUSuThJtW9ar2wCY@redhat.com>
 <87a6jrimaf.fsf@dusky.pond.sub.org> <YVsKpClmGgq5ki7r@redhat.com>
Date: Tue, 05 Oct 2021 15:49:04 +0200
In-Reply-To: <YVsKpClmGgq5ki7r@redhat.com> (Kevin Wolf's message of "Mon, 4
 Oct 2021 16:07:32 +0200")
Message-ID: <87mtnnvay7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 02.10.2021 um 15:33 hat Markus Armbruster geschrieben:
>> I apologize for this wall of text.  It's a desparate attempt to cut
>> through the complexity and my confusion, and make sense of the actual
>> problems we're trying to solve.
>> 
>> So, what problems exactly are we trying to solve?
>
> I'll start with replying to your final question because I think it's
> more helpful to start with the big picture than with details.
>
> So tools like libvirt want to have a single consistent interface to
> configure things on startup and at runtime. We also intend to support
> configuration files that should this time support all of the options and
> not just a few chosen ones.

Yes.

> The hypothesis is that QAPIfying the command line is the correct
> solution for both of these problems, i.e. all available command line
> options must be present in the QAPI schema and will be processed by a
> single parser shared with QMP to make sure they are consistent.

Yes.

This leads us to JSON option arguments and configuration files.
Well-suited for management applications that already use QMP.

> Adding QAPIfied versions of individual command line options are steps
> towards this goal. As soon as they exist for every option, the final
> conversion from an open coded getopt() loop (or in fact a hand crafted
> parser in the case of vl.c) to something generated from the QAPI schema
> should be reasonably easy.

Yes.

> You're right that adding a second JSON-based command line interface for
> every option can already achieve the goal of providing a unified
> external interface, at the cost of (interface and code) duplication. Is
> this duplication desirable? Certainly no. Is it acceptable? You might
> get different opinions on this one.

We'd certainly prefer CLI options to match corresponding QMP commands
exactly.

Unfortunately, existing CLI options deviate from corresponding QMP
commands, and existing CLI options without corresponding QMP commands
may violate QMP design rules.

Note: these issues pertain to human-friendly option syntax.  The
machine-friendly option syntax is still limited to just a few options,
and it does match QMP there.

> In my opinion, we should try to get rid of hand crafted parsers where
> it's reasonably possible, and take advantage of the single unified
> option structure that QAPI provides. -chardev specifically has a hand
> crafted parser that essentially duplicates the automatically generated
> QAPI visitor code, except for the nesting and some differences in option
> names.

We should definitely parse JSON option arguments with the QAPI
machinery, and nothing more.

Parsing human-friendly arguments with it is desirable, but the need for
backward compatibility can make it difficult.  Even where compatibility
is of no concern, simply swapping concrete JSON syntax for dotted keys
may result in human interfaces that are less than friendly.

Are we in agreement that this is the problem at hand?

> Aliases are one tool that can help bridge these differences in a generic
> way with minimal effort in the individual case. They are not _necessary_
> to solve the problem; we could instead just use manually written code to
> manipulate input QDicts so that QAPI visitors accept them. Even with
> aliases, there are a few things left in the chardev code that are
> converted this way. Aliases just greatly reduce the amount of this code
> and make the conversion declarative instead.

Understood.

> Now a key point in the previous paragraph is that aliases add a generic
> way to do this. So even if they are immediately motivated by -chardev,
> it might be worth looking at other cases they could enable if you think
> that -chardev alone isn't sufficient justification to have this tool.
> I guess this is the point where things become a bit less clear because
> people are just hand waving with vague ideas for additional uses.
>
> Do we need to invest more thought on these other cases? We probably do
> if it makes a difference for the answer to the question whether we want
> to add aliases to our toolbox. Does it?

I hope we can make a case for aliases without looking beyond CLI
QAPIfication.  That's a wide field already, with enough opportunity to
get lost in details.

If we later put aliases to other uses, we might have to adapt them some.
That's okay.  Designing for one problem we have and understand has a
much better chance of success than trying to design for all problems we
might have.

There are many CLI options to be QAPIfied.  -chardev is one of the more
thornier ones, which makes it a useful example.

>> But what about the dotted keys argument?
>> 
>> One point of view is the difference between the JSON and the dotted keys
>> argument should be concrete syntax only.  Fine print: there may be
>> arguments dotted keys can't express, but let's ignore that here.
>> 
>> Another point of view is that dotted keys arguments are to JSON
>> arguments what HMP is to QMP: a (hopefully) human-friendly layer on top,
>> where we have a certain degree of freedom to improve on the
>> machine-friendly interface for human use.
>
> This doesn't feel unreasonable because with HMP, there is precedence.
> But this is not all what we have used dotted key syntax for so far. I'm
> not against making a change there if we feel it makes sense, but we
> should be clear that it is a change.

Our first uses of dotted keys were green fields.  Sticking to QAPI/QMP's
abstract syntax was simplest.

> I think we all agree that -blockdev isn't human-friendly. Dotted key
> syntax makes it humanly possible to use it on the command line, but
> friendly is something else entirely. It is still a 1:1 mapping of QMP to
> the command line, and this is how we advertised it, too.

Yes.

>                                                          This has some
> important advantages, like we don't have a separate parser for a
> human-friendly syntax, but the generic keyval parser covers it.

There are two generic parts in play: the keyval parser, and the QAPI
input visitor.

Using identical abstract syntax both for JSON and dotted keys arguments
makes use of both parts simple: pass the argument to
qobject_input_visitor_new_str() to create a visitor, then visit the QAPI
type with it.

When abstract syntax differs, using the keyval parser is still simple,
but to use the QAPI input visitor, we need separate QAPI types.  Massive
code duplication in the QAPI schema.

To avoid the duplication, we can instead translate the parse tree
produced for the dotted keys argument.  Plenty of boring code.

In short: yes, using the same abstract syntax for both has advantages.

> HMP in contrast means separate code for every command, or translated to
> the CLI for each command line option. HMP is not defined in QAPI, it's
> a separate thing that just happens to call into QAPI-based QMP code in
> the common case.
>
> Is this what you have in mind for non-JSON command line options?

We should separate the idea "HMP wraps around QMP" from its
implementation as handwritten, boilerplate-heavy code.

All but the latest, QAPI-based CLI options work pretty much like HMP: a
bit of code generation (hxtool), a mix of common and ad hoc parsers,
boring handwritten code to translate from parse tree to internal C
interfaces (which are often QMP command handlers), and to stitch it all
together.

Reducing the amount of boring handwritten code is equally desirable for
HMP and CLI.

So is specifying the interface in QAPI instead of older, less powerful
schema languages like hxtool and QemuOpts.

There are at least three problems:

1. Specifying CLI in QAPI hasn't progressed beyond the proof-of-concept
stage.

2. Backward compatibility issues and doubts have defeated attempts to
replace gnarly stuff, in particular QemuOpts.

3. How to best bridge abstract syntax differences has been unclear.
Whether the differences are historical accidents or intentional for ease
of human use doesn't matter.

Aliases feel like a contribution towards solving 3.

I don't think 1. is particularly difficult.  It's just a big chunk of
work that isn't really useful without solutions for 2. and 3.

To me, 2. feels intractable head on.  Perhaps we better bypass the
problem by weakening the compatibility promise like we did for HMP.

> What I had in mind was using the schema to generate the necessary code,
> using the generic keyval parser everywhere, and just providing a hook
> where the QDict could be modified after the keyval parser and before the
> visitor. Most command line options would not have any explicit code for
> parsing input, only the declarative schema and the final option handler
> getting a QAPI type (which could actually be the corresponding QMP
> command handler in the common case).
>
> I think these are very different ideas. If we want HMP-like, then all
> the keyval based code paths we've built so far don't make much sense.

I'm not sure the differences are "very" :)

I think you start at "human-friendly and machine-friendly should use the
abstract syntax defined in the QAPI schema, except where human-friendly
has to differ, say for backward compatibility".

This approach considers differences a blemish.  The "standard" abstract
syntax (the one defined in the QAPI schema) should be accepted in
addition to the "alternate" one whenever possible, so "modern" use can
avoid the blemishes, and blemishes can be removed once they have fallen
out of use.

"Alternate" should not be limited to human-friendly.  Not limiting keeps
things consistent, which is good, because differences are bad.

Is that a fair description?

I start at "human-friendly syntax should be as friendly as we can make
it, except where we have to compromise, say for backward compatibility".

This approach embraces differences.  Mind, not differences just for
differences sake, only where they help users.

Additionally accepting the "standard" abstract syntax is useful only
where it helps users.

"Alternate" should be limited to human-friendly.

Different approaches, without doubt.  Yet both have to deal with
differences, and both could use similar techniques and machinery for
that.  You're proposing to do the bulk of the work with aliases, and to
have a tree-transforming hook for the remainder.  Makes sense to me.
However, in sufficiently gnarly cases, we might have to bypass all this
and keep using handwritten code until the backward compatibility promise
is history: see 2. above.

In addition each approach has its own, special needs.

Yours adds "alternate" syntax to QMP.  This poses documentation and
introspection problems.  The introspection solutions will then
necessitate management application updates.

Mine trades these problems for others, namely how to generate parsers
for two different syntaxes from one QAPI schema.

Do I make sense?

>> Both -chardev and QMP chardev-add use the same helpers (there are minor
>> differences that don't matter here).  The former basically translates
>> its flat argument into the latter's arguments.  HMP chardev-add is just
>> like -chardev.
>> 
>> The quickest way to QAPIfy existing -chardev is probably the one we
>> chose for -object: if the argument is JSON, use the new, QAPI-based
>> interface, else use the old interface.
>
> -chardev doesn't quite translate into chardev-add arguments. Converting
> into the input of a QMP command normally means providing a QDict that
> can be accepted by the QAPI-generated visitor code, and then using that
> QAPI parser to create the C object. What -chardev does instead is using
> an entirely separate parser to create the C object directly, without
> going through any QAPI code.

Yes, and that's quite some extra code, with plenty of opportunity for
inconsistency.

> After QAPIfication, both code paths go through the QAPI code and undergo
> the same validations etc.
>
> If we still have code paths that completely bypass QAPI, it's hard to
> call the command line option fully QAPIfied. Of course, if you don't
> care about duplication and inconsistencies between the interfaces,
> though, and just want to achieve the initially stated goal of providing
> at least one interface consistent between QMP and CLI (besides others)
> and a config file, then it might be QAPIfied enough.

Reworking human-friendly -chardev to target QMP instead of a C interface
shared with QMP would be nice.  Just because prior attempts to replace
gnarly stuff compatibly have failed doesn't mean this one must fail.

>> Now the question that matters for this series: how can QAPI aliases
>> help us with the things discussed above?
>
> The translation needs to be implemented somehow. The obvious way is just
> writing, reviewing and maintaining code that manually translates. (We
> don't have this code yet for a fully QAPIfied -chardev. We only have
> code that bypasses QAPI, i.e. translates to the wrong target format.)
>
> Aliases help because they allow reducing the amount of code in favour of
> data, the alias declarations in the schema.

Understood.

>> If we use the flat variation just internally, say for -chardev's dotted
>> keys argument, then introspection is not needed.  We'd use "with
>> aliases" just for translating -chardev's dotted keys argument.
>
> Note that we're doing more translations that just flattening with
> aliases, some options have different names in QMP and the CLI.
>
> But either way, yes, alias support could be optional so that you need to
> explicitly enable it when creating a visitor, and then only the CLI code
> could actually enable it.
>
> Limits the possible future uses for the new tool in our toolbox, but is
> sufficient for -chardev. We can always extend support for it later
> if/when we actually want to make use of it outside of the CLI.

Yes.

>> Valid argument.  CLI with JSON argument should match QMP.  Even when
>> that means both are excessively nested.
>> 
>> CLI with dotted keys is a different matter, in my opinion.
>
> I'm skipping quite a bit of text here, mainly because I think we need an
> answer first if we really want to switch the keyval options to be
> HMP-like in more than just the support status (see above).
>
> Obviously, the other relevant question would then be if it also ends up
> like HMP in that most interesting functionality isn't even available and
> you're forced to use QMP/JSON when you're serious.

I figure this is because we have let "QMP first" degenerate into "QMP
first, HMP never" sometimes, and we did so mostly because HMP is extra
work that was hard to justify.

What if you could get the 1:1 HMP command basically for free?  It may
not be the most human-friendly command possible.  But it should be a
start.

> I guess I can go into more details once we have answered these
> fundamental questions.
>
> (We could and should have talked about them and about whether you want
> to have aliases at all a year ago, before going into detailed code
> review and making error messages perfect in code that we might throw
> away anyway...)

I doubt you could possibly be more right than that!


