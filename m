Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A95A9582
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:15:41 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiAe-000281-2K
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTi8X-0000ig-5Z
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTi8T-00031H-S3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662030805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a07wwY5jqern82ZZT+U9TXCgc3yZphgpJakjgoIc3Sk=;
 b=LHltM6m7VmYOTGB0nBoIhuA9erTkzUDSSP7bDPJpVF86HhySi7o2egFJz5pLHx7H2i8Xvi
 Y/iwv2JV9WuFGvUMpN6CFzjdPhoUnZBrXi9hS2KbCn9pclblKPYTkum08uFsPtufQQsgaK
 JD4DufWS2ni52PLjIpQ/T6U0wb0hZmo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-7LzD_pZjOZuPeqi7fY6tsA-1; Thu, 01 Sep 2022 07:13:22 -0400
X-MC-Unique: 7LzD_pZjOZuPeqi7fY6tsA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7C6382C96E;
 Thu,  1 Sep 2022 11:13:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE6A492C3B;
 Thu,  1 Sep 2022 11:13:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBDE021E6900; Thu,  1 Sep 2022 13:13:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
 <87zgfkabel.fsf@pond.sub.org>
 <20220831124512.ngotphuwnsx6pyqn@tapioca>
 <87pmgg8se1.fsf@pond.sub.org>
 <20220831134725.j7lsf7nzt2tc3glr@tapioca>
 <87y1v45urm.fsf@pond.sub.org>
 <20220901075609.e76e4bbbxlaqw6hj@tapioca>
Date: Thu, 01 Sep 2022 13:13:19 +0200
In-Reply-To: <20220901075609.e76e4bbbxlaqw6hj@tapioca> (Victor Toso's message
 of "Thu, 1 Sep 2022 09:56:09 +0200")
Message-ID: <87o7vz2vqo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> First of all, I'm happy that this patch got us into this
> discussion.

Me too!

> On Wed, Aug 31, 2022 at 04:53:49PM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>>
>> > Hi,
>> >
>> > On Wed, Aug 31, 2022 at 03:16:54PM +0200, Markus Armbruster wrote:
>> >> Cc: Kevin for an improved chance of getting any nonsense I might write
>> >> corrected.
>> >>
>> >> Victor Toso <victortoso@redhat.com> writes:
>> >>
>> >> > Hi,
>> >> >
>> >> > On Wed, Aug 31, 2022 at 01:40:50PM +0200, Markus Armbruster wrote:
>> >> >> Victor Toso <victortoso@redhat.com> writes:
>> >> >>
>> >> >> > The example output is setting optional member "backing" with nul=
l.
>> >> >> > This has no runtime impact. Remove it.
>> >> >> >
>> >> >> > Problem was noticed when using the example as a test case for Go
>> >> >> > bindings.
>> >> >>
>> >> >> "Fix example" and "problem" implies there's something wrong.
>> >> >> "No runtime impact" sounds like it's redundant, but not wrong.
>> >> >> Wrong or not wrong?
>> >> >
>> >> > I take your comment is more about the wording which is confusing.
>> >> >
>> >> > Would it be better if I change to:
>> >> > '''
>> >> >    The example output is setting optional member "backing" with
>> >> >    null. While this has no runtime impact, setting optional
>> >> >    members with empty value should not be encouraged. Remove it.
>> >> > '''
>> >> >
>> >> > While I think the above is true, my main reason for proposing
>> >> > this change is to re-use the example as a test case, but I'm not
>> >> > sure if adding anything related to it would make it better (only
>> >> > more confusing!).
>> >>
>> >> I had a closer look at the schema.
>> >>
>> >> The definition of backing is
>> >>
>> >>     ##
>> >>     # @BlockdevOptionsGenericCOWFormat:
>> >>     #
>> >>     # Driver specific block device options for image format that have=
 no option
>> >>     # besides their data source and an optional backing file.
>> >>     #
>> >>     # @backing: reference to or definition of the backing file block
>> >>     #           device, null disables the backing file entirely.
>> >>     #           Defaults to the backing file stored the image file.
>> >>     #
>> >>     # Since: 2.9
>> >>     ##
>> >>     { 'struct': 'BlockdevOptionsGenericCOWFormat',
>> >>       'base': 'BlockdevOptionsGenericFormat',
>> >>       'data': { '*backing': 'BlockdevRefOrNull' } }
>> >>
>> >> Meaning, if I remember correctly (with some help from commit
>> >> c42e8742f52's message):
>> >>
>> >> 1. Present @backing
>> >>
>> >> 1.a. of type 'str' means use the existing block device with this ID as
>> >>      backing image
>> >>
>> >> 1.b. of type 'BlockdevOptions' means use the new block device defined=
 by
>> >>      it as backing image
>> >>
>> >> 1.c. that is null means use no backing image
>> >>
>> >> 2. Absent @backing means default to the backing file named in the COW
>> >>    image.
>> >
>> > Over the wire, how you get the difference between 1.c and 2? Are
>> > you saying that for optional member "backing" we should be
>> > explicit sending null over the wire?
>>
>> In the QAPI schema language, absent optional members do not default to
>> any specific value.  Or in other words, "absent" is distinct from
>> "present with value V" for any value V.
>>
>> Now, the *semantics* of "absent" are often identical to some default
>> value.  Documentation should then say something like (default:
>> DEFAULT-VALUE).
>
> Yep, this is fine.
>
>> In this particular instance, it isn't: "absent" means something else
>> than any possible value.
>
> The major painpoint for me is that, in Go an optional member is a
> field with a pointer to that field's type. A pointer is default
> initialized with nil and if the user of the Go module does
> nothing with it, we naturally omit it in the output JSON.
>
> This needs to be workaround in two cases so far:
> BlockdevRefOrNull and StrOrNull. This two alternate types are the
> only ones that take JSON null as value. I'm sure I'll make it
> work.

Losely related:

commit 481b002cc81ed7fc7b06e32e9d4d495d81739d14
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Apr 29 15:35:05 2015 -0600

    qobject: Add a special null QObject
=20=20=20=20
    I'm going to fix the JSON parser to recognize null.  The obvious
    representation of JSON null as (QObject *)NULL doesn't work, because
    the parser already uses it as an error value.  Perhaps we should
    change it to free NULL for null, but that's more than I can do right
    now.  Create a special null QObject instead.
=20=20=20=20
    The existing QDict, QList, and QString all represent something that
    is a pointer in C and could therefore be associated with NULL.  But
    right now, all three of these sub-types are always non-null once
    created, so the new null sentinel object is intentionally unrelated
    to them.
=20=20=20=20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Eric Blake <eblake@redhat.com>
    Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>

I figure something like this should work for Go as well, i.e. create a
singleton type to represent the QAPI type 'null'.

> --
>
> Now, should we really keep using null type as alternative way of
> expressing "disabling feature" or even "use something else"?
>
> I'd be happy to work on improving this if that's reasonable. My
> 2c bellow.
>
>     ##
>     # @BlockdevRefOrNull:
>     #
>     # Reference to a block device.
>     #
>     # @definition: defines a new block device inline
>     # @reference: references the ID of an existing block device.
>     #             An empty string means that no block device should
>     #             be referenced.  Deprecated; use null instead.
>     # @null: No block device should be referenced (since 2.10)
>     #
>     # Since: 2.9
>     ##
>     { 'alternate': 'BlockdevRefOrNull',
>       'data': { 'definition': 'BlockdevOptions',
>                 'reference': 'str',
>                 'null': 'null' } }
>
> BlockdevRefOrNull is only used by BlockdevOptionsGenericCOWFormat
> which is used by BlockdevOptions ('qed' and 'vmdk') and extend by
> BlockdevOptionsQcow and BlockdevOptionsQcow2.
>
> As you pointed out before, setting backing to null means
> disabling. This is expressed in both BlockdevRefOrNull and
> @BlockdevOptionsGenericCOWFormat documentation.
>
> IMHO the idea of disabling the default is fine but would be
> better expressed with a boolean type, something like:
>
>     { 'alternate': 'BlockdevRefOrNull',
>       'data': { 'definition': 'BlockdevOptions',
>                 'reference': 'str',
>                 'enable': 'bool' } }
>
> Which makes { backing: false } a bit nicer to my newbie eyes. If
> backing member is made non optional, { backing: true } should
> have the same value as omitting an optional backing member.

So:

1. Present @backing

1.a. of type 'str' means use the existing block device with this ID as
     backing image

1.b. of type 'BlockdevOptions' means use the new block device defined by
     it as backing image

1.c. that is false means use no backing image

1.d. that is true means use the backing file named in the COW
     image.

2. Absent @backing defaults to true, i.e. 1.d.

Looks fine to me as an interface, if I ignore compatibility concerns.

We could quibble about the name 'enable'.  It's not part of the external
interface.

Sadly, the idea runs afoul a QAPI restriction:

    scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:68:
    In file included from ../qapi/block.json:8:
    ../qapi/block-core.json: In alternate 'BlockdevRefOrNull':
    ../qapi/block-core.json:4362: branch 'enabled' can't be distinguished f=
rom 'reference'

This is due to

commit c0644771ebedbd8f47f3c24816445e30111d226b (tag: pull-qapi-2017-05-31)
Author: Markus Armbruster <armbru@redhat.com>
Date:   Mon May 22 18:42:15 2017 +0200

    qapi: Reject alternates that can't work with keyval_parse()
=20=20=20=20
    Alternates are sum types like unions, but use the JSON type on the
    wire / QType in QObject instead of an explicit tag.  That's why we
    require alternate members to have distinct QTypes.
=20=20=20=20
    The recently introduced keyval_parse() (commit d454dbe) can only
    produce string scalars.  The qobject_input_visitor_new_keyval() input
    visitor mostly hides the difference, so code using a QObject input
    visitor doesn't have to care whether its input was parsed from JSON or
    KEY=3DVALUE,...  The difference leaks for alternates, as noted in commit
    0ee9ae7: a non-string, non-enum scalar alternate value can't currently
    be expressed.
=20=20=20=20
    In part, this is just our insufficiently sophisticated implementation.
    Consider alternate type 'GuestFileWhence'.  It has an integer member
    and a 'QGASeek' member.  The latter is an enumeration with values
    'set', 'cur', 'end'.  The meaning of b=3Dset, b=3Dcur, b=3Dend, b=3D0, =
b=3D1 and
    so forth is perfectly obvious.  However, our current implementation
    falls apart at run time for b=3D0, b=3D1, and so forth.  Fixable, but n=
ot
    today; add a test case and a TODO comment.
=20=20=20=20
    Now consider an alternate type with a string and an integer member.
    What's the meaning of a=3D42?  Is it the string "42" or the integer 42?
    Whichever meaning you pick makes the other inexpressible.  This isn't
    just an implementation problem, it's fundamental.  Our current
    implementation will pick string.
=20=20=20=20
    So far, we haven't needed such alternates.  To make sure we stop and
    think before we add one that cannot sanely work with keyval_parse(),
    let's require alternate members to have sufficiently distinct
    representation in KEY=3DVALUE,... syntax:
=20=20=20=20
    * A string member clashes with any other scalar member
=20=20=20=20
    * An enumeration member clashes with bool members when it has value
      'on' or 'off'.
=20=20=20=20
    * An enumeration member clashes with numeric members when it has a
      value that starts with '-', '+', or a decimal digit.  This is a
      rather lazy approximation of the actual number syntax accepted by
      the visitor.
=20=20=20=20
      Note that enumeration values starting with '-' and '+' are rejected
      elsewhere already, but better safe than sorry.
=20=20=20=20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <1495471335-23707-5-git-send-email-armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Astute readers may now wonder why our string member does *not* clash
with scalar member null.  The answer is kind of embarrassing: because
the keyval input visitor supports numbers and booleans, but not null.
If you need null, you get to use JSON.

If we enhanced the visitor to support null like it supports booleans,
the value null would become ambiguous, and to remove this ambiguity,
we'd have to make 'str' clash with 'null'.

I've come to regret adding 'null' to the QAPI schema language.  I didn't
fully understand how this innocent-looking feature was going to interact
with everything else.  More trouble than it's worth.

The dotted keys syntax as an alternative to JSON is also plenty of
trouble, but we knew that, and accepted it because there's also worth.

>     ##
>     # @StrOrNull:
>     #
>     # This is a string value or the explicit lack of a string (null
>     # pointer in C).  Intended for cases when 'optional absent' already
>     # has a different meaning.
>     #
>     # @s: the string value
>     # @n: no string value
>     #
>     # Since: 2.10
>     ##
>     { 'alternate': 'StrOrNull',
>       'data': { 's': 'str',
>                 'n': 'null' } }
>
> StrOrNull is used in MigrateSetParameters (*tls-creds,
> *tls-hostname, *tls-authz):
>   JSON null: disable specifics or the entirety of migrating
>              with tls.
>   "" (empty string): Uses some specifics default.
>   omitted: Likely to error if using x509 tls?
>
>   Similarly, a boolean would make more sense to express disabled?
>
>     https://gitlab.com/qemu-project/qemu/-/commit/4af245dc3e6e5c96405b3ed=
b9d75657504256469?view=3Dparallel
>
> StrOrNull is also used in x-blockdev-set-iothread in the iothread
> member, documented as follow:
>
>    # @iothread: the name of the IOThread object or null for the
>    # main loop
>
> iothread here is non optional, meaning that the user has to set a
> string with the name of IOThread object or null. This really
> seems a case where iothread could be optional "str" instead of
> StrOrNull where omitting defaults to main loop.

Then "absent" is not the same as "present with value V" for any value V.
That's okay; it conforms to the schema language design.  I just don't
like that part of the schema language design.  To be clear: insufficient
reason to reject a patch.

We'd have to provide backward compatibility somehow.

>> Aside: no, I don't like this part of the QAPI schema language design
>> either.  "Absent defaults to DEFAULT-VALUE" is easier to explain and
>> understand.
>
> Well, there always room for improving.

Here's a concrete improvement I'd like to see some day: extend the QAPI
language to support optionals with a default value, i.e. absent is
indistinguishable from present with the default value.  Then use this
for as many optionals as we can.

>> Back to your question: to get 1.c., you pass a member "backing": null on
>> the wire, and to get 2., you pass no "backing" member.
>
> Cheers,
> Victor


