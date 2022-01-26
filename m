Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF9A49D25F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:13:03 +0100 (CET)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCnj4-0004bB-3d
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:13:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nCnV8-0003cM-FV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:58:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nCnV3-0001wc-PK
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643223512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=o80O2zG8ohqFR8AG7Q2bLdb6fg2XUJ8n9Zq5H4gObNg=;
 b=W+lVFx1mSlW+7y1GD+6Ny88fCL5l5H11JPUPd/n4omVkgAsXAk875bTTg0FUtsTqt/toE8
 BojCGiPgbDhFFx7EC1KVut5eOMKElvaiSHL6Mf22Zt1IQPTUy1qD8Am5HWBxAAyRMMXZt7
 dCw5Iy3GGPGdoxgpOB+BtylIrwSASQU=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-r12fApddOfSAvr_3CdRgbQ-1; Wed, 26 Jan 2022 13:58:31 -0500
X-MC-Unique: r12fApddOfSAvr_3CdRgbQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 s81-20020a1f2c54000000b0032101a87523so229540vks.0
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=o80O2zG8ohqFR8AG7Q2bLdb6fg2XUJ8n9Zq5H4gObNg=;
 b=OwOPA9OXqit3v02UPWMo7Hti1RECHPqWfybAIvqdTY5cdauFbUk9VTpn+lhDem2zUW
 R1jL0KN0VgHObw3Xzcnk27y2VHuY7PRHpzJ9wp7z1VD91I3ez3aV1dgM1wftIOnxAHVu
 DswVhzXI1vvmn49Pl5sMucL4iJrENtDISRj78Hg2QQW0In9oo5T1vivUrNgjL+/0c16+
 p3/+bu4mfViofVUYMxz9RjXnBNPlzX9OYrZXrsOtmbtQOQof3mv+rDzLOtIOCDxdl7MG
 ef1+yH2uUTXFaIVrDks55WWu/G1/qYXT7yNklt1lVlrFJzVsSUtRvygDpe7MFCYI5Sty
 Q3qQ==
X-Gm-Message-State: AOAM5311TEHSqKoxDCilptcniL13estpRbmzbmO8y7Z8TcpZQ89zyn2w
 50bmtIaEWDgdKnr11+uW0iQuqJkoyU0X+FNVJQN2vcUgEsvLI++xxGGtdRVKyRIqSWe4pgDT/PI
 DkS07kK7FmIQ3DgOCLRxTv0pdLU+0vF8=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr85468vso.61.1643223510088;
 Wed, 26 Jan 2022 10:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycSe4Jkap9R5YZQZ7kAhnIsZE3RLr9SDfcAcMDFo6blS0ysLRIMjO2ByPMT7lFhKcVoay4yTgrxcLFp0a8NUc=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr85457vso.61.1643223509676;
 Wed, 26 Jan 2022 10:58:29 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Wed, 26 Jan 2022 13:58:19 -0500
Message-ID: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
Subject: Notes on Generating Python signatures for QMP RPCs
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hiya, I was experimenting with $subject and ran into a few points of
interest. This is basically an informal status report from me. I've
CC'd some of the usual suspects for people who care about SDKs and API
design and such.

This is just a list of some observations I had, so not everything
below is a question or an action item. Just sharing some notes.

(0) This experiment concerned generating signatures based on
introspection data, dynamically at runtime. In this environment type
hints are not required, as they are not actually used at runtime.
However, I added them anyway as an exercise for dynamic documentation
purposes. (i.e. `help(auto_generated_function)` showing type hints can
still be useful -- especially without access to QAPI doc blocks.)
Determining type information is also necessary for generating the
marshaling/unmarshaling functions to communicate with the server.

(1) QAPI types the return of many commands as an empty object. That's
literally indeed what happens on the wire, and it makes sense in that
if these commands were ever to return anything, it is a "compatible
evolution" to include new fields in such an object. In Python, this
does not make much sense, though; as this is somewhat hard to
annotate:

async def stop() -> Literal[{}]: ...

The more pythonic signature is:

async def stop() -> None: ...

I feel like it's spiritually equivalent, but I am aware it is a
distinct choice that is being made. It could theoretically interfere
with a choice made in QAPI later to explicitly return Null. I don't
think we'd do that, but it's still a choice of abstraction that
reduces the resolution of distinct return signatures.

(1.5) Do we have a formal definition for what we consider to be a
"compatible evolution" of the schema? I've got a fairly good idea, but
I am not sure how it's enforced. Is it just Markus being very
thorough? If we add more languages to the generator, we probably can't
burden Markus with knowing how to protect the compatibility of every
generator. We might need more assertions for invariants in the
generator itself ... but to protect "evolution", we need points of
reference to test against. Do we have anything for this? Do we need
one? Should I write a test?

(2) There are five commands that are exempted from returning an
object. qom-get is one. However, what I didn't really explicitly
realize is that this doesn't mean that only five commands don't return
an object -- we also actually allow for a list of objects, which
*many* commands use. There's no technical issue here, just an
observation. It is no problem at all to annotate Python commands as
"-> SomeReturnType" or "-> List[SomeDifferentReturnType]" or even "->
str:" as needed.

(3) Over the wire, the order of arguments to QMP commands is not
specified. In generating commands procedurally from introspection
data, I am made aware that there are several commands in which
"optional" arguments precede "required" arguments. This means that
function generation in Python cannot match the stated order 1:1.

That's not a crisis per se. For generating functions, we can use a
stable sort to bubble-up the required arguments, leaving the optional
ones trailing. However, it does mean that depending on how the QAPI
schema is modified in the future, the argument order may change
between versions of a generative SDK. I'd like to avoid that, if I
can.

One trick I have available to me in Python is the ability to stipulate
that all (QAPI) "optional" arguments are keyword-only. This means that
Optional parameters can be re-ordered arbitrarily without any breakage
in the generative python API. The only remaining concern is if the
*mandatory* arguments are re-ordered.

(In fact, I could stipulate that ALL arguments in Python bindings are
keyword-only, but I think that's going overboard and hurts usability
and readability.)

Marc-Andre has mentioned this before, but it might be nice to actually
specify a canonical ordering of arguments for languages that require
such things, and to make sure that we do not break this ordering
without good reason.

(Of course, SDK stability is not fully possible, and if this
functionality is desired, then it's time to use libvirt, hint hint
hint! However, we can avoid pointless churn in generated code and make
it easier to use and experiment with.)

(4) StrOrNull is a tricky design problem.

In Python, generally, omitted arguments are typed like this:
async def example_command(arg: Optional[int] = None) -> None: ...

Most Python programmers would recognize that signature as meaning that
they can omit 'arg' and some hopefully good default will be chosen.
However, in QAPI we do have the case where "omitted" is distinct from
"explicitly provided null". This is ... a bit challenging to convey
semantically. Python does not offer the ability to tell "what kind of
None" it received; i.e. unlike our generated QMP marshalling
functions, we do not have a "has_arg" boolean we can inspect.

So how do we write a function signature that conveys the difference
between "omitted" and "explicitly nulled" ...?

One common trick in Python is to create a new sentinel singleton, and
name it something like "Default" or "Unspecified" or "Undefined". Many
programmers use the ellipsis `...` value for this purpose. Then, we
can check if a value was omitted (`...`) or explicitly provided
(`None`). It is very unlikely that these sentinels would organically
collide with user-provided values (Unless they were trying to
explicitly invoke default behavior.)

However, `...` isn't supported as a type and using it as the default
value invalidates the typing of the field. As far as I can tell, it
CANNOT be typed. We could create our own sentinel, but IMO, this
creates a much less readable signature:

async def example_command(arg: Union[int, qmp.Default] = qmp.Default)
-> None: ...

This probably doesn't communicate "This parameter is actually
optional" to a casual Python programmer, so I think it's a dead end.

The last thing I can think of here is to instead introduce a special
sentinel that represents the explicit Null instead. We could use a
special Null() type that means "Explicitly send a null over the wire."

This value comes up fairly infrequently, so most signatures will
appear "Pythonic" and the jankiness will be confined to the few
commands that require it, e.g.

async def example_command(arg: Optional[Union[int, Null]] = None) -> None: ...

The above would imply an optional argument that can be omitted, can be
provided with an int, or can be provided with an explicit Null. I
think this is a good compromise.

(5) Generating functions from introspection data is difficult because
all of the structures are anonymous. The base type for most objects
becomes `Dict[str, Any]` but this isn't very descriptive. For Python
3.8+, we can do a little better and use `Dict[Literal["name", "node"],
Any]` to help suggest what keys are valid, but we don't have access to
an in-line definition that pairs key names with values.

Python 3.8+ would allow us the use of TypedDict, but those have to be
generated separately ... AND we still don't have a name for them, so
it'd be a little hogwash to have a function like:

async def some_command(arg: Anon321) -> None: ...

That doesn't really tell me, the human, much of anything. The best
that could perhaps be done is to create type aliases based on the name
of the argument it is the data type for, like "ArgObject". It's a bit
messy. For now, I've just stuck with the boring `Dict[Literal[...],
Any]` definition.

(6) Dealing with variants is hard. I didn't get a working
implementation for them within one day of hacking, so I stubbed them
out. There's no major blocker here, just reporting that I still have
to finish this part of the experiment. I'm pretty happy that Markus
simplified the union types we have, though. To my knowledge, I got
everything else working perfectly.

(7) I have no idea what to do about functions that "may not return".
The QGA stuff in particular, I believe, is prone to some weirdness
that violates the core principles of the QMP spec. Maybe we can add a
"NORETURN" feature flag to those commands in the schema so that
clients can be aware of which commands may break the expectation of
always getting an RPC reply?

(8) Thanks for reading. I'm still buried under my holiday inbox, but I
am trying like hell to catch up on everything. I know I missed a few
calls in which API design was discussed, and I apologize for that.
Please send me invitations using "to: jsnow@redhat.com" to ensure I do
not miss them. I am also frantically trying to clean up the Async QMP
project I was working on to have more mental bandwidth for other
tasks, but it's dragging on a bit longer than I had anticipated.
Please accept my apologies for being somewhat reclusive lately.

I'll (try to) send a status overview of the various projects I'm
working on later to help set priority and discuss with the community
what my goals are and what I'd like to do. I have an awful lot of code
I've built up in local branches that I would like to share, but I'm
already sending code upstream as fast as I can, so maybe I'll just do
an overview at some point and point to unfinished code/experiments so
it's at least not completely unwitnessed work.

I hope 2022 is treating you all well,
--John Snow


