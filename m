Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F4181DB2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:25:04 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC4AJ-0003w9-Ef
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jC49V-00036v-Sj
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jC49T-0000dX-8I
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:24:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58595
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jC49T-0000bq-4a
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583943850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5VMrcHWfOkb/79wmWy6c9+Iqpm67kjgPFbLd9vqIWA=;
 b=bErMs1s893HqV2mbauzF7s0CcDmNDtxrOePgLRpRcgCKGhEn0x5YXvFO59Qv8wxwqZuLhc
 8R4rLnb29+B3WaugIMO9YwewU9/9GwHdKFp2nkaJfq/7DdYcHAJ/bnboRB1/GPwrCOVRoa
 waNAbNsm5AtmmFlxlvGhnXs6HM5BApY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-QYGw6PEiM4GnyG0_NOZeBw-1; Wed, 11 Mar 2020 12:24:02 -0400
X-MC-Unique: QYGw6PEiM4GnyG0_NOZeBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0811C1005512;
 Wed, 11 Mar 2020 16:24:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02268100164D;
 Wed, 11 Mar 2020 16:23:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87D6211386A6; Wed, 11 Mar 2020 17:23:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 00/18] Convert QAPI doc comments to generate rST
 instead of texinfo
References: <20200309154405.13548-1-peter.maydell@linaro.org>
Date: Wed, 11 Mar 2020 17:23:56 +0100
In-Reply-To: <20200309154405.13548-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 9 Mar 2020 15:43:47 +0000")
Message-ID: <87sgievp0j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> This series switches all our QAPI doc comments over from
> texinfo format to rST. It then removes all the texinfo
> machinery, because this was the last user of texinfo.
>
> I would ideally like to get this into the release, though

Making 5.0 would be nice.  Missing it wouldn't be terrible, though.

> the softfreeze date is now approaching rapidly...

It is.

> Based-on: 20200306171749.10756-1-peter.maydell@linaro.org
> ("post-rst-conversion cleanups") though any conflicts
> vs master should be trivial.
[...]
> The basic approach is somewhat similar to how we deal with kerneldoc
> and hxtool: we have a custom Sphinx extension which is passed a
> filename which is the json file it should run the QAPI parser over and
> generate documentation for. Unlike 'kerneldoc' but somewhat like
> hxtool, I have chosed to generate documentation by generating a tree
> of docutils nodes, rather than by generating rST source that is then
> fed to the rST parser to generate docutils nodes.  Individual lumps of
> doc comment go to the rST parser, but the structured parts we render
> directly. This makes it easier to get the structure and heading level
> nesting correct.
>
> Rather than trying to exactly handle all the existing comments I have
> opted (as Markus suggested) to tweak them where this seemed more
> sensible than contorting the rST generator to deal with
> weirdnesses. The principal changes are:
>  * whitespace is now significant, and multiline definitions must have
>    their second and subsequent lines indented to match the first line
>  * general rST format markup is permitted, not just the small set of
>    markup the old texinfo generator handled. For most things (notably
>    bulleted and itemized lists) the old format is the same as rST was.
>  * Specific things that might trip people up:
>    - instead of *bold* and _italic_ rST has **bold** and *italic*
>    - lists need a preceding and following blank line
>    - a lone literal '*' will need to be backslash-escaped to
>      avoid a rST syntax error
>  * the old leading '|' for example (literal text) blocks is replaced
>    by the standard rST '::' literal block.

I trust this is actually a *block*, unlike the the old one, where each
line is its own @example ... @end example.

>  * headings and subheadings must now be in a freeform documentation
>    comment of their own
>  * we support arbitrary levels of sub- and sub-sub-heading, not just a
>    main and sub-heading like the old texinfo generator
>  * as a special case, @foo is retained and is equivalent to ``foo``

I consider all of these obvious improvements, except for the "headings
must now be in a freeform documentation comment of their own", which you
explain further below.

> Moving on to the actual code changes:
>  * we start by changing the existing parser code to be more careful
>    with leading whitespace: instead of stripping it all, it strips
>    only the amount required for indented multiline definitions, and
>    complains if it finds an unexpected de-indent. The texinfo
>    generator code is updated to do whitespace stripping itself, so
>    there is no change to the generated texi source.
>  * then we add the new qapidoc Sphinx extension, which is not yet used
>    by anything. This is a 500 line script, all added in one patch. I
>    can split it if people think that would help, but I'm not sure I
>    see a good split point.
>  * then we can convert the two generated reference documents, one at a
>    time. This is mostly just updating makefile rules and the like.
>  * after that we can do some minor tweaks to doc comments that would
>    have confused the texinfo parser: changing our two instances of
>    '|'-markup literal blocks to rST '::' literal blocks, and adding
>    some headings to the GA reference so the rST interop manual ToC
>    looks better.
>  * finally, we can delete the old texinfo machinery and update the
>    markup docs in docs/devel/qapi-code-gen.txt

I appreciate the outline.

> On headings:
> Because the rST generator works by assembling a tree of docutils
> nodes, it needs to know the structure of the document, in the
> sense that it wants to know that there is a "section with a level
> 1 heading titled Foo", which contains "section with a level 2
> heading titled Bar", which in turn contains the documentation for
> commands Baz, Boz, Buz. This means we can't follow the texinfo
> generator's approach of just treating '=3D Foo' as another kind
> of markup to be turned into a '@section' texinfo and otherwise
> just written out into the output stream. Instead we need to
> be able to distinguish "this is a level 1 section heading"
> from any other kind of doc-comment, and the user shouldn't be
> able to insert directives specifying changes in the document
> structure randomly in the middle of what would otherwise be a
> lump of "just rST source to be fed to a rST parser".
> The approach I've taken to letting the generator know the structure
> is to special-case headings into "must be in their own freeform
> doc-comment as a single line", like this:
>  ##
>  # =3D Foo
>  ##
> This is easy to spot in the 'freeform' method, and matches how

Thanks for the rationale.

> we already mark up headings in almost all cases. An alternative
> approach would be to have parser.py detect heading markup, so
> that instead of
>         for doc in schema.docs:
>             if doc.symbol:
>                 vis.symbol(doc, schema.lookup_entity(doc.symbol))
>             else:
>                 vis.freeform(doc)
> (ie "everything the parser gives you is either documenting
> a symbol, or it is a freefrom comment") we have:
>         for doc in schema.docs:
>             if doc.symbol:
>                 vis.symbol(doc, schema.lookup_entity(doc.symbol))
>             else if doc.is_section_header:
>                 vis.new_section(doc.heading_text, doc.heading_level)
>             else:
>                 vis.freeform(doc)
> (ie "everything the parser gives you is either documenting
> a symbol, or a notification about the structure of the document,
> or a freeform comment".) I feel that would be less simple than
> we currently have, though.

I consider the way we translate '# =3D' and '# =3D=3D' to @section and
@subsection a lazy hack.  If I put one of these in the wrong place, we
happily generate crap Texinfo, makeinfo will complain, and I then get to
map from generated .texi to your doc comment.  Meh.

I've always felt parsing the document structure was the sane thing to
do.  "Less simple"?  I'm not sure.  I'll have to look at your patches.

> There are a few things I have left out of this initial series:
>  * unlike the texinfo, there is no generation of index entries
>    or an index in the HTML docs

In theory, that's sad.  In practice, I don't use the index, I visit the
.txt in Emacs and search.

>  * although there are HTML anchors on all the command/object/etc
>    headings, they are not stable but just serial-number based
>    tags like '#qapidoc-35', so not suitable for trying to link
>    to from other parts of the docs

No existing links lost, I trust.

>  * unlike the old texinfo generation, we make no attempt to regression
>    test the rST generation in 'make check'. This is trickier than
>    the texinfo equivalent, because we never generate rST source
>    that we could compare against a golden reference. Comparing
>    against generated HTML is liable to break with new Sphinx
>    versions; trying to compare the data structure of docutils nodes
>    would be a bit more robust but would require a bunch of code to
>    mock up running Sphinx somehow.

You mean tests/qapi-schema/doc-good.texi, I presume.  I hate losing that
one, I really do.  It's been invaluable when messing with the doc
generation backend.  tests/qapi-schema/doc-good.out only covers the
frontend.

One more loss:

   * No .txt, .pdf and .info output.  I don't care for .pdf myself, I
     expected losing of .info, but the loss of .txt is a real pain point
     for me.  Any chance to get it back?

> My view is that we can add niceties like this later; the series
> already seems big enough to me.

It is.

> You can find the HTML rendered version of the results
> of this series at:
> http://people.linaro.org/~peter.maydell/qdoc-snapshot/interop/qemu-ga-ref=
.html
> http://people.linaro.org/~peter.maydell/qdoc-snapshot/interop/qemu-qmp-re=
f.html
> (look also at
>  http://people.linaro.org/~peter.maydell/qdoc-snapshot/interop/index.html
>  if you want to see how the ToC for the interop manual comes out)
> The manpages are
> http://people.linaro.org/~peter.maydell/qemu-ga-ref.7
> http://people.linaro.org/~peter.maydell/qemu-qmp-ref.7
> (download and render with 'man -l path/to/foo.7')
>
> For comparison, the old texinfo-to-HTML versions of the docs are:
> https://www.qemu.org/docs/master/qemu-ga-ref.html
> https://www.qemu.org/docs/master/qemu-qmp-ref.html
>
> Git branch of this series also available at
> https://git.linaro.org/people/peter.maydell/qemu-arm.git sphinx-conversio=
ns

Saved me time, thanks!


