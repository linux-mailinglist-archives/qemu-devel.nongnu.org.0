Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30941FC54
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:35:29 +0200 (CEST)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfAl-000851-78
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWf9B-0007Mc-Ex
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWf96-0001qv-M1
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633181622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OmDYN4OdY1apTzDXGBGVrKCK8Yad5mxPwkiwpwrzB50=;
 b=MGo/66RCDTZ3QRqhsUR+1S9tGyADas94ABKDFcF+qbKX95n/mzTpyFEPwya8P5P2fQeZqN
 tRrTAgTW0/AX+g1WcxFVDpSsLxwxK1qWAHmxgxhKjWGyplCWiY2+wLBWhvRckARJvzLPs9
 4MjA+0sHMc2lOsERPLwoLHC4/wp6XOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-IwUS-SrCNHqdPkXIYufkCw-1; Sat, 02 Oct 2021 09:33:33 -0400
X-MC-Unique: IwUS-SrCNHqdPkXIYufkCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CAFB18125C0
 for <qemu-devel@nongnu.org>; Sat,  2 Oct 2021 13:33:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A7C160C05;
 Sat,  2 Oct 2021 13:33:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 93C4F113865F; Sat,  2 Oct 2021 15:33:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org> <YUSuThJtW9ar2wCY@redhat.com>
Date: Sat, 02 Oct 2021 15:33:28 +0200
In-Reply-To: <YUSuThJtW9ar2wCY@redhat.com> (Kevin Wolf's message of "Fri, 17
 Sep 2021 17:03:42 +0200")
Message-ID: <87a6jrimaf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

> Am 17.09.2021 um 10:26 hat Markus Armbruster geschrieben:

[...]

>> >> We actually require much less: for QMP chardev-add, we need
>> >> 'data.addr.data.FOO' and nothing else, and for CLI -chardev, we need
>> >> 'FOO' and nothing else (I think).  The unneeded ones become accidental
>> >> parts of the external interface.  If experience is any guide, we'll have
>> >> plenty of opportunity to regret such accidents :)
>> >> 
>> >> Can we somehow restrict external interfaces to what we actually need?
>> >
>> > Not reasonably, I would say. Of course, you could try to cover all
>> > paths with aliases in the top level, but the top level really shouldn't
>> > have to know about the details of types deep inside some union variants.
>> >
>> > The solution for reducing the allowed options here is to work on
>> > introspection, mark 'data' deprecated everywhere and get rid of the
>> > simple union nonsense.
>> 
>> Accidental extension of QMP to enable QAPIfication elsewhere would be a
>> mistake.  Elsewhere right now: -chardev.
>>
>> The knee-jerk short-term solution for QMP is to ignore aliases there
>> completely.  Without introspection, they can't be used seriously anyway.
>
> I would say it's intentional enough. If we can flatten simple unions for
> the CLI, why not accept them in QMP, too? (And management tools will
> only be happier if they can use the same representation for QMP and
> CLI.) I hope that we can get introspection done for 6.2, but even if we
> can't, making the case already work shouldn't hurt anyone.
>
> Now you could argue that some aliases to be introduced for -chardev have
> no place in QMP because they have no practical use there. But isn't a
> consistent QAPI structure on all external interfaces more valuable than
> keeping the interface in QMP minimal, but inconsistent with the CLI?
>
> The problem I would generally see with accidental extension of QMP is
> that it may restrict future changes for no reason. But if we already
> get the restriction because we must stay compatible with the CLI, too,
> then this doesn't apply any more.

I agree consistency matters.  But what exactly should be consistent?

I believe we all agree that a CLI option's *JSON* argument should be
consistent with the corresponding QMP command.  This is easy: since both
JSON arguments are fed to the same QAPI machinery, consistency is the
default, and inconsistency would take extra effort.

But what about the dotted keys argument?

One point of view is the difference between the JSON and the dotted keys
argument should be concrete syntax only.  Fine print: there may be
arguments dotted keys can't express, but let's ignore that here.

Another point of view is that dotted keys arguments are to JSON
arguments what HMP is to QMP: a (hopefully) human-friendly layer on top,
where we have a certain degree of freedom to improve on the
machine-friendly interface for human use.

Let me try to explain why I believe the latter one makes more sense.

When QAPIfying existing CLI options, the new dotted keys option argument
must be backward compatible to the old option argument, and the QMP
command must also remain backward compatible.

If their abstract syntax is already perfectly consistent, we can simply
use qobject_input_visitor_new_str().  All we have to worry then is the
differences between dotted keys syntax and whatever it replaces (almost
always QemuOpts), which is of no concern to us right now.

What if their abstract syntax differs, as it does for -chardev and
QMP chardev-add?

One solution is to use the *union* of the two languages both for CLI and
QMP.  Complicates both.  I don't like this.  We can try to mitigate by
deprecating unwanted parts of the abstract syntax.  More on that below.

If we treat dotted keys as separate, human-friendly layer on top, we can
instead *translate* from one language to the other.  This is actually
what -chardev, HMP chardev-add, and all the other HMP commands wrapping
around QMP do today, or close to it.


Different tack.  I've been struggling with distilling my intuitions
about the proposed QAPI aliases feature into thought (one reason for me
taking so painfully long to reply).  I believe my difficulties are in
part due to a disconnect from use cases: there's a lot aliases could
enable us to do, and I keep getting lost in possibilities.  So let's try
to ground this by looking at QAPIfication of -chardev.  This way, we
discuss how to solve a specific problem in its entirety instead of
trying to come to a conclusion on a building block that may be useful
(but isn't sufficient) to solve an unclear set of problems (unclear to
*me*).

The equivalent QMP command is chardev-add.  The definition of its
argument is spread over several QAPI type definitions.  It boils down
to:

    id: str
    backend: ChardevBackend
        type: ChardevBackendKind        tag
        data: ChardevFile               when file
            *logfile: str
            *logappend: bool
            *in: str
            out: str
            *append: bool
        ...
        data: ChardevSocket             when socket
            *logfile: str
            *logappend: bool
            addr: SocketAddressLegacy
                type: SocketAddressType        tag
                data: InetSocketAddress        when inet
                    host: str
                    port: str
                    *numeric: bool
                    ...
                ...
            ...

This is old stuff; we'd use a lot less nesting today.

The argument of -chardev is flat, as output of -help shows:

    ...
    -chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]
    ...
    -chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]
    ...

The historical reason for -chardev being flat is that QemuOpts supports
only flat out of the box.  Nested requires gymnastics of the kind we
generally perform only under duress.

There's also a reason for *keeping* it flat: nesting is awful in dotted
keys syntax.  With JSON, you simply throw another pair of braces on the
heap.  With dotted keys, you get to repeat long key prefixes over and
over.

Let me stitch the two interfaces together:

    -chardev file                       backend.type
             ,id=id,                    id
             path=path                  backend.data.out
                                        backend.data.in
                                        backend.data.append
             [,mux=on|off]
             [,logfile=PATH]            backend.data.logfile
             [,logappend=on|off]        backend.data.logappend
    ...
    -chardev socket                     backend.type
             ,id=id                     id
                                        backend.data.addr.type
             [,host=host]               backend.data.addr.data.host + default
             ,port=port                 backend.data.addr.data.port
                                        backend.data.addr.data.numeric
             [,to=to]                   backend.data.addr.data.to
             [,ipv4=on|off]             backend.data.addr.data.ipv4
             [,ipv6=on|off]             backend.data.addr.data.ipv6
                                        backend.data.addr.data.keep-alive
                                        backend.data.addr.data.mptcp
             [,nodelay=on|off]          backend.data.nodelay
             [,reconnect=seconds]       backend.data.reconnect
             [,server=on|off]           backend.data.server
             [,wait=on|off]             backend.data.wait
             [,telnet=on|off]           backend.data.telnet
                                        backend.data.tn3270
             [,websocket=on|off]        backend.data.websocket
             [,mux=on|off]
             [,logfile=PATH]            backend.data.logfile
             [,logappend=on|off]        backend.data.logappend
             [,tls-creds=ID]            backend.data.tls-creds
             [,tls-authz=ID]            backend.data.tls-authz

CLI parameter @mux has nothing in the right column.  The code looks like
it's syntactic sugar for something I don't understand.  Moving on.

A few things in the right column have nothing in the left column.  I can
see three possible cases:

* It's only missing in help.  Example: parameter append actually exists,
  and corresponds to backend.data.append

* -chardev can't do.  Example, maybe: backend.data.in.

* Magic.  Example: the value of backend.data.addr.type is derived from
  presence of path.

Both -chardev and QMP chardev-add use the same helpers (there are minor
differences that don't matter here).  The former basically translates
its flat argument into the latter's arguments.  HMP chardev-add is just
like -chardev.

The quickest way to QAPIfy existing -chardev is probably the one we
chose for -object: if the argument is JSON, use the new, QAPI-based
interface, else use the old interface.

Sugar is only available with the old QemuOpts argument.

Feature-parity with QMP is only available with the new JSON argument.

This kicks the "retire QemuOpts" can down the road.  The hope is to
eventually weaken the compatibility promise for the non-JSON argument
(like we did for HMP), then switch it to dotted keys.  Whether we ditch
the translation from flat to nested then is an open question.

A different problem would be adding a new -chardev somewhere.  Not
having to drag all the compatibility baggage along would be nice.  On
the other hand, dotted keys without flattening would result in an awful
human interface.  Flattening by hand like the existing code does is
unappealing.  We could use a bit of help from the QAPI generator.

Perhaps we hate QMP chardev-add's nesting enough to flatten it to
something like

    id: str
    type: ChardevBackendKind        tag
    # ChardevFile                   when file
        *logfile: str
        *logappend: bool
        *in: str
        out: str
        *append: bool
    ...
    # ChardevSocket                 when socket
    *logfile: str
    *logappend: bool
    addr: SocketAddress
        type: SocketAddressType         tag
        # InetSocketAddress             when inet
        host: str
        port: str
        *numeric: bool

To avoid a compatibility break, we'd actually have to keep the old
structure around, too.  Deprecate, drop after grace period expires.


Now the question that matters for this series: how can QAPI aliases help
us with the things discussed above?

1. Aliases can help with flattening input wire formats.  Missing parts:
introspection, feature deprecated for aliases.

Note:

* Input: aliases don't affect output.

* Wire format: aliases don't affect the generated C types.

* Aliases can only be "flatter" than the thing they alias.  The members
  remain nested until drop the old interface.

* Feature deprecated for aliases: straightforward, I think.

* Introspection: requires a schema extension, which means users of
  introspection will need an update to actually see aliases.

  Corollary: until all of the users that matter are updated, we can't
  deprecate members, only aliases.  Unfortunately, members is what we
  actually *want* to deprecate here.

  Why do we need a schema extension?  We can't simply expose aliases as
  if they were members, because that would look as if you had to specify
  both (which is actually an error).

  When we drop the old interface, the old, deprecated members go away,
  and the aliases morph into members.  Well-behaved users of
  introspection should deal with the morphing.  Still, there's a risk.

As much as I hate excessive nesting, I'm not sure flattening old
interfaces such as QMP chardev-add is worth the trouble.  More on that
below, in reply to your arguments.

Flattening could reduce the difference to the current, non-QAPIfied
-chardev, though, which could help with QAPIfying it.  How exactly
remains unclear, at least to me, especially for sugar and magic.

2. Aliases can help with adding flatter options to existing input wire
formats.  This is 1. less the hope to get rid of the nested option some
day.  Missing parts: introspection.  Old introspection users simply
can't see the flat option, which is fine.

Is adding a flat option to old interfaces such as QMP chardev-add worth
the trouble?  If you have to check whether the flat option is available
before you can use it, and else fall back to the nested option, always
using the nested option is simpler.

I figure the most likely user of these aliases would be a QAPIfied
-chardev.  That use is legitimate.  But if it remains the only one, all
the extra work to expose them in the external interface in a consumable
way (the "missing parts" above) is wasted.

3. Aliases might help with creating flatter variations of old input wire
formats.  This is 2. plus a way to limit each interface to one option.
Missing parts: a way to limit, introspection.

Note:

* "A way to limit" is too vague to be useful.  Needs design work.
  Stupidest solution that could possibly work: hard-code two options,
  with and without aliases.

* Introspection is needed only for machine-friendly interfaces.
  Implementing it might be expensive.

If we use the flat variation just internally, say for -chardev's dotted
keys argument, then introspection is not needed.  We'd use "with
aliases" just for translating -chardev's dotted keys argument.

We could also use the flat variation to create alternate, more modern
interfaces with much less code duplication in the schema, and much less
boring translation code between the differently nested duplicates.

Example: we have SocketAddress for use by "modern" interfaces, and
SocketAddressLegacy strictly for existing ones.  We have hand-written
code to convert SocketAddressLegacy to SocketAddress.  Not terrible for
a simple type like SocketAddress, but imagine doing the same for
flattening ChardevBackend.

>> Of course, we eventually want to use them for evolving QMP, e.g. to
>> flatten simple unions.  The knee-jerk solution sets up another obstacle.
>> 
>> The issue also exists in -chardev with a JSON argument.  We can apply
>> the knee-jerk solution to any JSON-based interface, not just to QMP.
>> 
>> The issue also exists in -chardev with a dotted keys argument.  There,
>> we definitely need the outermost alias (e.g. "host") for compatibility,
>> and we may want the member ("data.addr.data.host") for symmetry with
>> JSON.  I can't see an argument for exposing the intermediate aliases as
>> dotted keys, though.
>> 
>> I find the argument "for symmetry with JSON" quite weak.  But exposing
>> the member seems unlikely to create problems later on.
>
> Well, my simple argument is: It's hard to get rid of them, so why bother
> with extra complexity to get rid of them?

It's either that, or writing documentation explaining the now many ways
to do the same thing.

> But I think there is a better argument, and "symmetry with JSON"
> actually covers support for the intermediate aliases, too:
>
> The alias that flattens SocketAddressLegacy isn't an alias for the
> command chardev-add, it's an alias for the type. If you have code that
> formats JSON for SocketAddressLegacy, then you should be able to use it
> everywhere where a SocketAddressLegacy is required.
>
> So if your code to format JSON for SocketAddressLegacy uses the alias to
> provide a flat representation, but the caller producing ChardevBackend
> doesn't flatten the union yet, then that should be fine. And if you have
> code for flat ChardevBackend, but your common SocketAddressLegacy code
> still produces the nesting, then that should be fine, too.
>
> Essentially partial use of aliases in JSON is a feature to allow libvirt
> adopting changes incrementally.

This is about evolving existing JSON-based interfaces (QMP, basically)
compatibly.

To be able to use aliases for this, we need to supply missing parts
(detailed above), and they are anything but trivial.  Users of
introspection need updates, too.

I hate excessive nesting, I really do.  I'd love to see excessively
nested existing interfaces cleaned up.  Sadly, the paths towards that
goal I can see feel too costly just for cleanliness.

>                                 And just having a mapping of JSON to the
> command line is why it should be there in dotted key syntax, too.

We don't have a mapping from HMP to QMP, only the other way round.

I believe we should make CLI with dotted keys like HMP (not least
because it already is for many complex options).  Then we don't have a
mapping from QMP to CLI with dotted keys.  We do have a (trivial!)
mapping to CLI with JSON.

>> You argue that "the top level really shouldn't have to know about the
>> details of types deep inside some union variants."  That's a valid
>> argument about the QAPI schema language's support for abstraction.  But
>> the QAPI schema language is means, while the external interfaces are
>> ends.  They come first.  A nicer schema language is certainly desirable,
>> but the niceties shouldn't leak crap into the external interfaces.
>> 
>> Let me work through an example to ground this.  Consider chardev-add /
>> -chardev.  Structure of chardev-add's argument:
>> 
>>     id: str
>>     backend:
>>         type: enum ChardevBackendKind
>>         data: one of the following, selected by the value of @type:
>>         for socket:
>>             addr:
>>                 type: enum SocketAddressType
>>                 data: one of the following, selected by the value of @type:
>>                   for inet:
>>                   host: str
>>                   ...
>>           ...
>> 
>> In contrast, -chardev's argument is flat.  To QAPIfy it, we could use
>> aliases from the root into the object nest:
>> 
>>     from type to backend.type
>>     from host to backend.data.addr.data.host
>>     ...
>> 
>> We'd certainly design chardev-add's argument differently today, namely
>> with much less nesting.  Say we want to evolve to this structure:
>> 
>>     id: str
>>     type: enum ChardevBackendKind
>>     one of the following, selected by the value of @type:
>>     for socket:
>>     addr:
>>         type: enum SocketAddressType
>>         one of the following, selected by the value of @type:
>>         for inet:
>>         host: str
>>         ...
>>     ...
>> 
>> We obviously need to keep the old structure around for compatibility.
>> For that, we could use a *different* set of aliases:
>> 
>>     from type to backend.type
>>     from addr.host to backend.data.addr.data.host
>>     ...
>> 
>> What's the plan for supporting different uses wanting different aliases?
>> Throw all the aliases together and shake?  Then one interface's
>> requirements will contaminate other interfaces with unwanted aliases.
>> Getting one interface right is hard enough, having to reason about *all*
>> QAPI-based interfaces would set us up for failure.  And what if we run
>> into contradictory requirements?
>
> Are there legitimate reasons for exposing the same QAPI type in
> different ways on different interfaces? This sounds like a bad idea to
> me. If it's the same thing, it should look the same.
>
> The biggest reason for QAPIfying things is to unify interfaces instead
> of having different parsers everywhere. Intentionally accepting some
> keys only in QMP and others only in the CLI seems to go against this
> goal.

Valid argument.  CLI with JSON argument should match QMP.  Even when
that means both are excessively nested.

CLI with dotted keys is a different matter, in my opinion.

>> Could we instead tag aliases somehow, pass a tag to the visitor, and
>> have it ignore aliases with a different tag?
>> 
>> Reminds me of the problem of generating multiple QMPs from a single
>> schema, e.g. one for qemu-system-FOO, and another one for
>> qemu-storage-daemon.  Inchoate idea: use tags for that somehow.  But I
>> digress.
>> 
>> I'm actually tempted to try how far we can get with just one level of
>> aliases, i.e. aliases that can only resolve to a member, not to another
>> alias.  I'd expect the code to become quite a bit simpler.
>
> The visitor code would become slightly simpler, but the schema would
> become much less maintainable. If someone adds a new field to, say,
> InetSocketAddress, review would have to catch this and request that a
> new alias be added to ChardevOptions. I don't think this is a realistic
> option.

Shouldn't a wildcard alias in ChardevOptions take care of that?

[...]

I apologize for this wall of text.  It's a desparate attempt to cut
through the complexity and my confusion, and make sense of the actual
problems we're trying to solve.

So, what problems exactly are we trying to solve?


