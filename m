Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986E421109
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:10:26 +0200 (CEST)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOfg-0001aO-Df
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXOdA-0007a6-Kn
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXOd6-0006yx-DV
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633356463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6tr4gP8/4b0wgPof0xpJ58nhrT+wfAV/InySzDTRJ4=;
 b=PkPBZwfl+gHrC8xOK3WCfzVKD3UfMLmJYCCiLaMWxaRamcklAZT5PXojERclTbUMxu/Osb
 Qb/HQq0XGMI2goMLTYYCZQqoKe3dcpxwIdBI2Cnida/GhZw8aRlqge3XSBZc8/hFdSxjMT
 pncZc/LxUHCpsPblQafF/tSCwyaUXBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-eFQ0ncHwNL6JSSu6Ra-UGw-1; Mon, 04 Oct 2021 10:07:42 -0400
X-MC-Unique: eFQ0ncHwNL6JSSu6Ra-UGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25ACD100CCC8
 for <qemu-devel@nongnu.org>; Mon,  4 Oct 2021 14:07:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 168DD5BAE7;
 Mon,  4 Oct 2021 14:07:34 +0000 (UTC)
Date: Mon, 4 Oct 2021 16:07:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YVsKpClmGgq5ki7r@redhat.com>
References: <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org> <YUSuThJtW9ar2wCY@redhat.com>
 <87a6jrimaf.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6jrimaf.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Am 02.10.2021 um 15:33 hat Markus Armbruster geschrieben:
> I apologize for this wall of text.  It's a desparate attempt to cut
> through the complexity and my confusion, and make sense of the actual
> problems we're trying to solve.
> 
> So, what problems exactly are we trying to solve?

I'll start with replying to your final question because I think it's
more helpful to start with the big picture than with details.

So tools like libvirt want to have a single consistent interface to
configure things on startup and at runtime. We also intend to support
configuration files that should this time support all of the options and
not just a few chosen ones.

The hypothesis is that QAPIfying the command line is the correct
solution for both of these problems, i.e. all available command line
options must be present in the QAPI schema and will be processed by a
single parser shared with QMP to make sure they are consistent.

Adding QAPIfied versions of individual command line options are steps
towards this goal. As soon as they exist for every option, the final
conversion from an open coded getopt() loop (or in fact a hand crafted
parser in the case of vl.c) to something generated from the QAPI schema
should be reasonably easy.

You're right that adding a second JSON-based command line interface for
every option can already achieve the goal of providing a unified
external interface, at the cost of (interface and code) duplication. Is
this duplication desirable? Certainly no. Is it acceptable? You might
get different opinions on this one.

In my opinion, we should try to get rid of hand crafted parsers where
it's reasonably possible, and take advantage of the single unified
option structure that QAPI provides. -chardev specifically has a hand
crafted parser that essentially duplicates the automatically generated
QAPI visitor code, except for the nesting and some differences in option
names.

Aliases are one tool that can help bridge these differences in a generic
way with minimal effort in the individual case. They are not _necessary_
to solve the problem; we could instead just use manually written code to
manipulate input QDicts so that QAPI visitors accept them. Even with
aliases, there are a few things left in the chardev code that are
converted this way. Aliases just greatly reduce the amount of this code
and make the conversion declarative instead.

Now a key point in the previous paragraph is that aliases add a generic
way to do this. So even if they are immediately motivated by -chardev,
it might be worth looking at other cases they could enable if you think
that -chardev alone isn't sufficient justification to have this tool.
I guess this is the point where things become a bit less clear because
people are just hand waving with vague ideas for additional uses.

Do we need to invest more thought on these other cases? We probably do
if it makes a difference for the answer to the question whether we want
to add aliases to our toolbox. Does it?

> But what about the dotted keys argument?
> 
> One point of view is the difference between the JSON and the dotted keys
> argument should be concrete syntax only.  Fine print: there may be
> arguments dotted keys can't express, but let's ignore that here.
> 
> Another point of view is that dotted keys arguments are to JSON
> arguments what HMP is to QMP: a (hopefully) human-friendly layer on top,
> where we have a certain degree of freedom to improve on the
> machine-friendly interface for human use.

This doesn't feel unreasonable because with HMP, there is precedence.
But this is not all what we have used dotted key syntax for so far. I'm
not against making a change there if we feel it makes sense, but we
should be clear that it is a change.

I think we all agree that -blockdev isn't human-friendly. Dotted key
syntax makes it humanly possible to use it on the command line, but
friendly is something else entirely. It is still a 1:1 mapping of QMP to
the command line, and this is how we advertised it, too. This has some
important advantages, like we don't have a separate parser for a
human-friendly syntax, but the generic keyval parser covers it.

HMP in contrast means separate code for every command, or translated to
the CLI for each command line option. HMP is not defined in QAPI, it's
a separate thing that just happens to call into QAPI-based QMP code in
the common case.

Is this what you have in mind for non-JSON command line options?

What I had in mind was using the schema to generate the necessary code,
using the generic keyval parser everywhere, and just providing a hook
where the QDict could be modified after the keyval parser and before the
visitor. Most command line options would not have any explicit code for
parsing input, only the declarative schema and the final option handler
getting a QAPI type (which could actually be the corresponding QMP
command handler in the common case).

I think these are very different ideas. If we want HMP-like, then all
the keyval based code paths we've built so far don't make much sense.

> Both -chardev and QMP chardev-add use the same helpers (there are minor
> differences that don't matter here).  The former basically translates
> its flat argument into the latter's arguments.  HMP chardev-add is just
> like -chardev.
> 
> The quickest way to QAPIfy existing -chardev is probably the one we
> chose for -object: if the argument is JSON, use the new, QAPI-based
> interface, else use the old interface.

-chardev doesn't quite translate into chardev-add arguments. Converting
into the input of a QMP command normally means providing a QDict that
can be accepted by the QAPI-generated visitor code, and then using that
QAPI parser to create the C object. What -chardev does instead is using
an entirely separate parser to create the C object directly, without
going through any QAPI code.

After QAPIfication, both code paths go through the QAPI code and undergo
the same validations etc.

If we still have code paths that completely bypass QAPI, it's hard to
call the command line option fully QAPIfied. Of course, if you don't
care about duplication and inconsistencies between the interfaces,
though, and just want to achieve the initially stated goal of providing
at least one interface consistent between QMP and CLI (besides others)
and a config file, then it might be QAPIfied enough.

> Now the question that matters for this series: how can QAPI aliases
> help us with the things discussed above?

The translation needs to be implemented somehow. The obvious way is just
writing, reviewing and maintaining code that manually translates. (We
don't have this code yet for a fully QAPIfied -chardev. We only have
code that bypasses QAPI, i.e. translates to the wrong target format.)

Aliases help because they allow reducing the amount of code in favour of
data, the alias declarations in the schema.

> If we use the flat variation just internally, say for -chardev's dotted
> keys argument, then introspection is not needed.  We'd use "with
> aliases" just for translating -chardev's dotted keys argument.

Note that we're doing more translations that just flattening with
aliases, some options have different names in QMP and the CLI.

But either way, yes, alias support could be optional so that you need to
explicitly enable it when creating a visitor, and then only the CLI code
could actually enable it.

Limits the possible future uses for the new tool in our toolbox, but is
sufficient for -chardev. We can always extend support for it later
if/when we actually want to make use of it outside of the CLI.

> Valid argument.  CLI with JSON argument should match QMP.  Even when
> that means both are excessively nested.
> 
> CLI with dotted keys is a different matter, in my opinion.

I'm skipping quite a bit of text here, mainly because I think we need an
answer first if we really want to switch the keyval options to be
HMP-like in more than just the support status (see above).

Obviously, the other relevant question would then be if it also ends up
like HMP in that most interesting functionality isn't even available and
you're forced to use QMP/JSON when you're serious.

I guess I can go into more details once we have answered these
fundamental questions.

(We could and should have talked about them and about whether you want
to have aliases at all a year ago, before going into detailed code
review and making error messages perfect in code that we might throw
away anyway...)

Kevin


