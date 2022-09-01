Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44945A9248
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:43:40 +0200 (CEST)
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfnX-0006Nq-TC
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTf3h-0005sr-Q4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTf3e-0004Hj-B0
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rS84tJxn6unEPUa79SrhXZazyqMdV9rDFv+M05kFf7M=;
 b=bxJLjWu6xD9i9VggW+QLueoncjA2wbT0dWoqUVCDcnngsla0nNSCNtSP8o3oTuYcWvehpl
 /jaB0rnbr3BZ7yGfeqwF3rGf5D/goz+LQbF6InNwarR4O/bdOZtan0UW0hh28OWWroOu21
 57gWecOa8/S73H0rovxCbnsaPOJtxnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-ZHp2ufasMRCoGKQXgJUX4A-1; Thu, 01 Sep 2022 03:56:11 -0400
X-MC-Unique: ZHp2ufasMRCoGKQXgJUX4A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A318964084;
 Thu,  1 Sep 2022 07:56:11 +0000 (UTC)
Received: from localhost (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA98B403344;
 Thu,  1 Sep 2022 07:56:10 +0000 (UTC)
Date: Thu, 1 Sep 2022 09:56:09 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
Message-ID: <20220901075609.e76e4bbbxlaqw6hj@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
 <87zgfkabel.fsf@pond.sub.org>
 <20220831124512.ngotphuwnsx6pyqn@tapioca>
 <87pmgg8se1.fsf@pond.sub.org>
 <20220831134725.j7lsf7nzt2tc3glr@tapioca>
 <87y1v45urm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="des4ziuj7pglv4sh"
Content-Disposition: inline
In-Reply-To: <87y1v45urm.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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


--des4ziuj7pglv4sh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

First of all, I'm happy that this patch got us into this
discussion.

On Wed, Aug 31, 2022 at 04:53:49PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi,
> >
> > On Wed, Aug 31, 2022 at 03:16:54PM +0200, Markus Armbruster wrote:
> >> Cc: Kevin for an improved chance of getting any nonsense I might write
> >> corrected.
> >>
> >> Victor Toso <victortoso@redhat.com> writes:
> >>
> >> > Hi,
> >> >
> >> > On Wed, Aug 31, 2022 at 01:40:50PM +0200, Markus Armbruster wrote:
> >> >> Victor Toso <victortoso@redhat.com> writes:
> >> >>
> >> >> > The example output is setting optional member "backing" with null.
> >> >> > This has no runtime impact. Remove it.
> >> >> >
> >> >> > Problem was noticed when using the example as a test case for Go
> >> >> > bindings.
> >> >>
> >> >> "Fix example" and "problem" implies there's something wrong.
> >> >> "No runtime impact" sounds like it's redundant, but not wrong.
> >> >> Wrong or not wrong?
> >> >
> >> > I take your comment is more about the wording which is confusing.
> >> >
> >> > Would it be better if I change to:
> >> > '''
> >> >    The example output is setting optional member "backing" with
> >> >    null. While this has no runtime impact, setting optional
> >> >    members with empty value should not be encouraged. Remove it.
> >> > '''
> >> >
> >> > While I think the above is true, my main reason for proposing
> >> > this change is to re-use the example as a test case, but I'm not
> >> > sure if adding anything related to it would make it better (only
> >> > more confusing!).
> >>
> >> I had a closer look at the schema.
> >>
> >> The definition of backing is
> >>
> >>     ##
> >>     # @BlockdevOptionsGenericCOWFormat:
> >>     #
> >>     # Driver specific block device options for image format that have no option
> >>     # besides their data source and an optional backing file.
> >>     #
> >>     # @backing: reference to or definition of the backing file block
> >>     #           device, null disables the backing file entirely.
> >>     #           Defaults to the backing file stored the image file.
> >>     #
> >>     # Since: 2.9
> >>     ##
> >>     { 'struct': 'BlockdevOptionsGenericCOWFormat',
> >>       'base': 'BlockdevOptionsGenericFormat',
> >>       'data': { '*backing': 'BlockdevRefOrNull' } }
> >>
> >> Meaning, if I remember correctly (with some help from commit
> >> c42e8742f52's message):
> >>
> >> 1. Present @backing
> >>
> >> 1.a. of type 'str' means use the existing block device with this ID as
> >>      backing image
> >>
> >> 1.b. of type 'BlockdevOptions' means use the new block device defined by
> >>      it as backing image
> >>
> >> 1.c. that is null means use no backing image
> >>
> >> 2. Absent @backing means default to the backing file named in the COW
> >>    image.
> >
> > Over the wire, how you get the difference between 1.c and 2? Are
> > you saying that for optional member "backing" we should be
> > explicit sending null over the wire?
>
> In the QAPI schema language, absent optional members do not default to
> any specific value.  Or in other words, "absent" is distinct from
> "present with value V" for any value V.
>
> Now, the *semantics* of "absent" are often identical to some default
> value.  Documentation should then say something like (default:
> DEFAULT-VALUE).

Yep, this is fine.

> In this particular instance, it isn't: "absent" means something else
> than any possible value.

The major painpoint for me is that, in Go an optional member is a
field with a pointer to that field's type. A pointer is default
initialized with nil and if the user of the Go module does
nothing with it, we naturally omit it in the output JSON.

This needs to be workaround in two cases so far:
BlockdevRefOrNull and StrOrNull. This two alternate types are the
only ones that take JSON null as value. I'm sure I'll make it
work.

--

Now, should we really keep using null type as alternative way of
expressing "disabling feature" or even "use something else"?

I'd be happy to work on improving this if that's reasonable. My
2c bellow.

    ##
    # @BlockdevRefOrNull:
    #
    # Reference to a block device.
    #
    # @definition: defines a new block device inline
    # @reference: references the ID of an existing block device.
    #             An empty string means that no block device should
    #             be referenced.  Deprecated; use null instead.
    # @null: No block device should be referenced (since 2.10)
    #
    # Since: 2.9
    ##
    { 'alternate': 'BlockdevRefOrNull',
      'data': { 'definition': 'BlockdevOptions',
                'reference': 'str',
                'null': 'null' } }

BlockdevRefOrNull is only used by BlockdevOptionsGenericCOWFormat
which is used by BlockdevOptions ('qed' and 'vmdk') and extend by
BlockdevOptionsQcow and BlockdevOptionsQcow2.

As you pointed out before, setting backing to null means
disabling. This is expressed in both BlockdevRefOrNull and
@BlockdevOptionsGenericCOWFormat documentation.

IMHO the idea of disabling the default is fine but would be
better expressed with a boolean type, something like:

    { 'alternate': 'BlockdevRefOrNull',
      'data': { 'definition': 'BlockdevOptions',
                'reference': 'str',
                'enable': 'bool' } }

Which makes { backing: false } a bit nicer to my newbie eyes. If
backing member is made non optional, { backing: true } should
have the same value as omitting an optional backing member.

    ##
    # @StrOrNull:
    #
    # This is a string value or the explicit lack of a string (null
    # pointer in C).  Intended for cases when 'optional absent' already
    # has a different meaning.
    #
    # @s: the string value
    # @n: no string value
    #
    # Since: 2.10
    ##
    { 'alternate': 'StrOrNull',
      'data': { 's': 'str',
                'n': 'null' } }

StrOrNull is used in MigrateSetParameters (*tls-creds,
*tls-hostname, *tls-authz):
  JSON null: disable specifics or the entirety of migrating
             with tls.
  "" (empty string): Uses some specifics default.
  omitted: Likely to error if using x509 tls?

  Similarly, a boolean would make more sense to express disabled?

    https://gitlab.com/qemu-project/qemu/-/commit/4af245dc3e6e5c96405b3edb9d75657504256469?view=parallel

StrOrNull is also used in x-blockdev-set-iothread in the iothread
member, documented as follow:

   # @iothread: the name of the IOThread object or null for the
   # main loop

iothread here is non optional, meaning that the user has to set a
string with the name of IOThread object or null. This really
seems a case where iothread could be optional "str" instead of
StrOrNull where omitting defaults to main loop.

> Aside: no, I don't like this part of the QAPI schema language design
> either.  "Absent defaults to DEFAULT-VALUE" is easier to explain and
> understand.

Well, there always room for improving.

> Back to your question: to get 1.c., you pass a member "backing": null on
> the wire, and to get 2., you pass no "backing" member.

Cheers,
Victor

--des4ziuj7pglv4sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMQZZgACgkQl9kSPeN6
SE8ELRAAl6P+PEKgsZSX6Ttb7BLqdy/PMuL7qN93K/EM7DIKgJp9KSclgGmVf3Xd
kXSvImHTNAaQxVv9gMonn9xUJwm4VREZXFcFtyj7tF2lmXEieZVPffnFO6/A03rv
C1JNBYFWMeLAKTXfmLBtFB4WugMJE11p1nWGDhCV9rVHYl5DTep8GRpkK6HpWWyT
t1IAQ3rS1FCsXNZIrihgMXJa2OzggqH5D+vHO5Pm1yjmhqyXSeMg8VyzuakgyrFa
2P6zYQMMDdO3ogSKJfkcIc+ndAVF0ftK10vmE7ZQDdrXUfntIANoSTf5IKQ8+MLh
NCB+Yn6SKzNyMZ6A4zMGeFnjBF2Bjd2pEKBeUeTcW1BHdNzPQncY/OxMNs0AYwQg
Cm6rA+rRwQAWaabNkqmO+LtH1GqaZcqFwn5RRwZJxfPOvSiIDh3UqWS6ewNysM9o
t6zS53kHm9lEFss3VWSmjDJvJgj1x26zgexjUXuErHjGsdOQQvhwWw4T9uLenQxq
UL+gc3nuky2exb2yt4G+YOxUJXYf3sUyfXHrmcEWv5i+dPHEWmtQgzjAmpcbnanG
0lr3QUUYOwWK7U5Es6iaCsjv9SKYsXc1iyukIPYcQfqAoM1r1W1AiqxCWWZlWUb7
ZuLzeIqElokp4BMi3NuduZqznnqDpESJbWXRsl57Hgw4njhCtJc=
=Dc2W
-----END PGP SIGNATURE-----

--des4ziuj7pglv4sh--


