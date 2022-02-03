Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5A4A82A9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:48:01 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZei-0006MW-7r
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZXA-0001eB-1q
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:40:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZX3-0000G4-R6
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643884803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=r0BYbuiPumP8tsOsC0ApeRW9bX5kHmR6KXpQs1Wr5m8=;
 b=QPNz7TWJEeI3o842psT0+Xxlw87kdwOiPS7/91A90ILun6Ep23uruZj8zXmYOCvjKO/6hP
 nfBk+ciMxGO/0Evt5mHX0+tXRyPHa4TtSckSOvxgFX0tcnWRqEQ0HU+4g8Y+AB0bJbU9Us
 JQJONg7C6gDjErYRUoxd8VnLsnYiuGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-CgByzvdIOwGNV7Rpy6uoDg-1; Thu, 03 Feb 2022 05:39:59 -0500
X-MC-Unique: CgByzvdIOwGNV7Rpy6uoDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080F31091DA0
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 10:39:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A151F108B4;
 Thu,  3 Feb 2022 10:39:21 +0000 (UTC)
Date: Thu, 3 Feb 2022 10:39:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
Message-ID: <Yfuw1gGPPf8IPzLB@redhat.com>
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 26, 2022 at 01:58:19PM -0500, John Snow wrote:
> (1) QAPI types the return of many commands as an empty object. That's
> literally indeed what happens on the wire, and it makes sense in that
> if these commands were ever to return anything, it is a "compatible
> evolution" to include new fields in such an object. In Python, this
> does not make much sense, though; as this is somewhat hard to
> annotate:
> 
> async def stop() -> Literal[{}]: ...
> 
> The more pythonic signature is:
> 
> async def stop() -> None: ...
> 
> I feel like it's spiritually equivalent, but I am aware it is a
> distinct choice that is being made. It could theoretically interfere
> with a choice made in QAPI later to explicitly return Null. I don't
> think we'd do that, but it's still a choice of abstraction that
> reduces the resolution of distinct return signatures.

As you mention though, bear in mind that a command returning
nothing today, might return something tomorrow. IOW, we'd be
going from a empty dict to a non-empty dict. If you use "None"
then it'd be gonig from None to a non-empty dict.

I think you can argue both of these approaches are backwards
compatible. The python app is not likely to be looking at
the return type at all initially - unlike C, errors get
raised as exceptions, so you don't need to look at return
type to distinguish succes from failure. 

So I'd consider it merely a documentation problem to say
that a "None" return type might later change to a dict.
Dunno how you represent that in python type annotations,
but I presume there's a way.

> (1.5) Do we have a formal definition for what we consider to be a
> "compatible evolution" of the schema? I've got a fairly good idea, but
> I am not sure how it's enforced. Is it just Markus being very
> thorough? If we add more languages to the generator, we probably can't
> burden Markus with knowing how to protect the compatibility of every
> generator. We might need more assertions for invariants in the
> generator itself ... but to protect "evolution", we need points of
> reference to test against. Do we have anything for this? Do we need
> one? Should I write a test?

It isn't enforced through any technical measures. For example just
recently we accidentally broke back compat of query-sgx by deleting
a field.

From the POV of defining "compatible evolution" I guess I'd
ask what constraints you envisage being important from your
Python code generator POV ?

We do allow fields to be deleted, which is a *non-compatible*
evolution, but they MUST have been marked as deprecated for
2 cycles first.

Because the C generated code is only used inside QEMU, when
we have intentional non-compatible changes, we merely update
the callers in QEMU as needed.

If you are anticipating the python generated code to be a
publically consumable API this becomes a bit more complex
problem as you can't rely on fixing callers.

> (3) Over the wire, the order of arguments to QMP commands is not
> specified. In generating commands procedurally from introspection
> data, I am made aware that there are several commands in which
> "optional" arguments precede "required" arguments. This means that
> function generation in Python cannot match the stated order 1:1.
> 
> That's not a crisis per se. For generating functions, we can use a
> stable sort to bubble-up the required arguments, leaving the optional
> ones trailing. However, it does mean that depending on how the QAPI
> schema is modified in the future, the argument order may change
> between versions of a generative SDK. I'd like to avoid that, if I
> can.

I'd say sorting required vs optional arguments is doomed as
a strategy. Stuff that is mandatory today can be made optional
tomorrow and I think that's reasonable to want todo as we
evolve an API design.

Consider for example a command for querying something about
a CPU.  It might take a mandatory CPU ID number as its
input parameter today. It could then be changed to accept
either a CPU ID or a QOM Path, and both would be marked
optional but at least one would need to set.

This is backwards compatible from POV of callers because
anyone passing a CPU ID today can carry on passing a CPU
ID. New callers can choose to use QOM path instead.

So I think however you express API params in python needs
to cope with this scenario, which means not sorting
args based on optional vs required. Effectively need
to assume that all args are potentially optional on a
long enough timeframe.

> One trick I have available to me in Python is the ability to stipulate
> that all (QAPI) "optional" arguments are keyword-only. This means that
> Optional parameters can be re-ordered arbitrarily without any breakage
> in the generative python API. The only remaining concern is if the
> *mandatory* arguments are re-ordered.
> 
> (In fact, I could stipulate that ALL arguments in Python bindings are
> keyword-only, but I think that's going overboard and hurts usability
> and readability.)

I don't think you have any choice - they must all be keyword
only if you want protection from future schema changes.

> Marc-Andre has mentioned this before, but it might be nice to actually
> specify a canonical ordering of arguments for languages that require
> such things, and to make sure that we do not break this ordering
> without good reason.

Declaring a canonical ordering is not unreasonable as a concept
on the surface. Essentially this is akin to fixing the order of
fields in a C struct and making it append-only.

None the less if you rely on this for positional arguments in
python callers are still going to break when we *intentionally*
delete fields/parameters (after a deprecation cycle). WIth
strictly keyword only args, if the caller was not using the
deleted field they won't be affected by the deletion as they
won't be position sensitive.

> (4) StrOrNull is a tricky design problem.
> 
> In Python, generally, omitted arguments are typed like this:
> async def example_command(arg: Optional[int] = None) -> None: ...
> 
> Most Python programmers would recognize that signature as meaning that
> they can omit 'arg' and some hopefully good default will be chosen.
> However, in QAPI we do have the case where "omitted" is distinct from
> "explicitly provided null". This is ... a bit challenging to convey
> semantically. Python does not offer the ability to tell "what kind of
> None" it received; i.e. unlike our generated QMP marshalling
> functions, we do not have a "has_arg" boolean we can inspect.
> 
> So how do we write a function signature that conveys the difference
> between "omitted" and "explicitly nulled" ...?
> 
> One common trick in Python is to create a new sentinel singleton, and
> name it something like "Default" or "Unspecified" or "Undefined". Many
> programmers use the ellipsis `...` value for this purpose. Then, we
> can check if a value was omitted (`...`) or explicitly provided
> (`None`). It is very unlikely that these sentinels would organically
> collide with user-provided values (Unless they were trying to
> explicitly invoke default behavior.)
> 
> However, `...` isn't supported as a type and using it as the default
> value invalidates the typing of the field. As far as I can tell, it
> CANNOT be typed. We could create our own sentinel, but IMO, this
> creates a much less readable signature:
> 
> async def example_command(arg: Union[int, qmp.Default] = qmp.Default)
> -> None: ...
> 
> This probably doesn't communicate "This parameter is actually
> optional" to a casual Python programmer, so I think it's a dead end.

It sounds like you need a wrapper type.  This StrOrNull scenario
is QMP's "alternate" type IIUC, but you're trying to avoid
expressing the existance fo the "alternate" type in the API

ie you're trying to support

    example_command("foo") 
    example_command(None)
    example_command()

but that's impossible as the last 2 can't be distinguished

If you explicitly huave an "Alternate" object type, which
is a wrapper for any other type, then you can do

    example_command(Alternate("foo")) 
    example_command(Alternate(None))
    example_command()

and now be able to distinguish the different scenarios.

> (5) Generating functions from introspection data is difficult because
> all of the structures are anonymous. The base type for most objects
> becomes `Dict[str, Any]` but this isn't very descriptive. For Python
> 3.8+, we can do a little better and use `Dict[Literal["name", "node"],
> Any]` to help suggest what keys are valid, but we don't have access to
> an in-line definition that pairs key names with values.

Yep, we've also taken advantage of this to rename structs
periodically as while it affected the generated C code
inside QEMU, it didn't affect any QMP clients.

I think it is not unreasonable to expose the struct names
on introspection though, and just accept that it ties our
hands a little more to avoid renaming structs. I don't
think we rename frequently enough that this matters.

> (6) Dealing with variants is hard. I didn't get a working
> implementation for them within one day of hacking, so I stubbed them
> out. There's no major blocker here, just reporting that I still have
> to finish this part of the experiment. I'm pretty happy that Markus
> simplified the union types we have, though. To my knowledge, I got
> everything else working perfectly.

Variants feels like it is the same kind of problem space
as the StrOrNone scenario earlier.

> (7) I have no idea what to do about functions that "may not return".
> The QGA stuff in particular, I believe, is prone to some weirdness
> that violates the core principles of the QMP spec. Maybe we can add a
> "NORETURN" feature flag to those commands in the schema so that
> clients can be aware of which commands may break the expectation of
> always getting an RPC reply?

A "NORETURN" flag sounds like a reasonable idea.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


