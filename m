Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA85204C8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:55:09 +0200 (CEST)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no8XE-0001tp-Di
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no8W2-0000UD-Jq
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no8Vz-00042u-Hk
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652122430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lVEVN9KCEfQD5C98WvH090gVpV6b7/oXEfFjfdUlUs=;
 b=QDtw+k+Evag2Egbso7F7Sp8iiJo6DegxXxWonOpLtu9Ye6GG43PGQE9CTLKt97ET1D+jlu
 OfTqkgovVL0kQ/C4umCKDVNNcoQXcg3BWDMDen4ki4xS5bg24rSlqn05beHGWxnSoKn7lq
 f2FUlnCIDmvR983bDbwQ32J7oEpkPt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-WVRxbcfGPnWzj3fGOc_FyA-1; Mon, 09 May 2022 14:53:49 -0400
X-MC-Unique: WVRxbcfGPnWzj3fGOc_FyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF5AC85A5BC
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 18:53:48 +0000 (UTC)
Received: from localhost (unknown [10.40.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95753C27E89;
 Mon,  9 May 2022 18:53:47 +0000 (UTC)
Date: Mon, 9 May 2022 20:53:46 +0200
From: Victor Toso <victortoso@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220509185346.7d2qz4lr4rpuat7q@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ztfulmdtj45blcj5"
Content-Disposition: inline
In-Reply-To: <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ztfulmdtj45blcj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 02, 2022 at 10:01:41AM -0400, Andrea Bolognani wrote:
> On Mon, May 02, 2022 at 01:46:23PM +0200, Markus Armbruster wrote:
> > Andrea Bolognani <abologna@redhat.com> writes:
> > >> > The wire protocol would still retain the unappealing
> > >> > name, but at least client libraries could hide the
> > >> > uglyness from users.
> > >>
> > >> At the price of mild inconsistency between the library
> > >> interface and QMP.
> > >
> > > That's fine, and in fact it already happens all the time
> > > when QAPI names (log-append) are translated to C
> > > identifiers (log_append).
> >
> > There's a difference between trivial translations like
> > "replace '-' by '_'" and arbitrary replacement like the one
> > for enumeration constants involving 'prefix'.
>=20
> Fair enough.
>=20
> I still feel that 1) users of a language SDK will ideally not
> need to look at the QAPI schema or wire chatter too often and

That should be the preference, yes.

> 2) even when that ends up being necessary, figuring out that
> LogAppend and logappend are the same thing is not going to be
> an unreasonable hurdle, especially when the status quo would be
> to work with Logappend instead.

If user really needs to leave their ecosystem in order to check
an alias, I hope we are already considering this a corner case.
Still, if we are thinking about multiple languages communicating
with QEMU, it is reasonable to consider the necessity of some
docs page where they can easily grep/search for the types, alias,
examples, etc.  IMHO, this should be a long term goal and not a
blocker... I can volunteer on working on that later.

> > > The point is that, if we want to provide a language
> > > interface that feels natural, we need a way to mark parts
> > > of a QAPI symbol's name in a way that makes it possible for
> > > the generator to know they're acronyms and treat them in an
> > > appropriate, language-specific manner.
> >
> > It's not just acronyms.  Consider IAmALittleTeapot.  If you
> > can assume that only beginning of words are capitalized, even
> > for acronyms, you can split this into words without trouble.
> > You can't recover correct case, though: "i am a little
> > teapot" is wrong.
>=20
> Is there any scenario in which we would care though? We're in
> the business of translating identifiers from one machine
> representation to another, so once it has been split up
> correctly into the words that compose it (which in your example
> above it has) then we don't really care about anything else
> unless acronyms are involved.
>=20
> In other words, we can obtain the list of words "i am a little
> teapot" programmatically both from IAmALittleTeapot and
> i-am-a-little-teapot, and in both cases we can then generate
> IAmALittleTeapot or I_AM_A_LITTLE_TEAPOT or
> i_am_a_little_teapot or whatever is appropriate for the context
> and target language, but the fact that in a proper English
> sentence "I" would have to be capitalized doesn't really enter
> the picture.
>=20
> > "Split before capital letter" falls apart when you have
> > characters that cannot be capitalized: Point3d.
> >
> > Camel case is hopeless.
>=20
> I would argue that it works quite well for most scenarios, but
> there are some corner cases where it's clearly not good enough.
> If we can define a way to clue in the generator about "Point3d"
> having to be interpreted as "point 3d" and "VNCProps" as "vnc
> props", then we are golden. That wouldn't be necessary for
> simple cases that are already handled correctly.
>=20
> A more radical idea would be to start using dash-notation for
> types too. That'd remove the word splitting issue altogether,
> at the cost of the schema being (possibly) harder to read and
> more distanced from the generated code.
>=20
> You'd still only be able to generate VncProps from vnc-props
> though.
>=20
> > > The obvious way to implement this would be with an
> > > annotation along the lines of the one I proposed. Other
> > > ideas?
> >
> > I'm afraid having the schema spell out names in multiple
> > naming conventions could be onerous.  How many names will
> > need it?
>=20
> I don't have hard data on this. I could try extracting it, but
> that might end up being a bigger job than I had anticipated.

The only way to know is by checking /o\
I'll give it a shot.

> My guess is that the number of cases where the naive algorithm
> can't split words correctly is relatively small compared to the
> size of the entire QAPI schema. Fair warning: I have made
> incorrect guesses in the past ;)
>=20
> > Times how many naming conventions?
>=20
> Yeah, I don't think requiring all possible permutations to be
> spelled out in the schema is the way to go. That's exactly why
> my proposal was to offer a way to inject the semantic
> information that the parser can't figure out itself.
>=20
> Once you have a way to inform the generator that "VNCProps" is
> made of the two words "vnc" and "props", and that "vnc" is an
> acronym, then it can generate an identifier appropriate for the
> target language without having to spell out anywhere that such
> an identifier would be VNCProps for Go and VncProps for Rust.
>=20
> By the way, while looking around I realized that we also have
> to take into account things like D-Bus: the QAPI type
> ChardevDBus, for example, would probably translate verbatim to
> Go but have to be changed to ChardevDbus for Rust. Fun :)
>=20
> Revised proposal for the annotation:
>=20
>   ns:word-WORD-WoRD-123Word

I really like it.

> Words are always separated by dashes; "regular" words are
> entirely lowercase, while the presence of even a single
> uppercase letter in a word denotes the fact that its case
> should be preserved when the naming conventions of the target
> language allow that.
>=20
> > Another issue: the fancier the translation from schema name
> > to language-specific name gets, the harder it becomes to find
> > one from the other.
>=20
> That's true, but at least to me the trade-off feels reasonable.

I don't quite get the argument why it gets harder to find. We can
simply provide the actual name as reference in the generated
documentation, no?

As Kevin already pointed out that he is not planning to work on
the Alias (reference below), any other idea besides the Andrea's
annotation suggestion? While this is not a blocker, I agree it
would be nice to be consistent.

    https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04703.html

Cheers,
Victor

--ztfulmdtj45blcj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ5YzkACgkQl9kSPeN6
SE/FPQ//bajEUFH5FMJatSzixxvkL6dRBgxFFGIyiy1X4lSOYxyL/R5V+QDnzEnf
iFKoXMlRAg0k4qEfuBY6WYscFEjtH2pmxoxSior5xeIOso4rmZ3YSJzZfDZyyAAt
fuptOURw+OQ2HjNGH12mRnzsqO7p3LwTaibVi5YoMuWDE2w3UqmYH4toaVhH3y2g
d1dFum6QvpMCSYn0ThMkJHBjJ0xn/jE8k9A0vK6KrItlT8fTzHcIlqJdnBi8n6GT
4WhYvQE87Z+LTPCcwCUESS9wtW9mRsEA827PNpSy8Pzi0cPtXXGBlV0tITkksd+0
CdUTBm6o/q3Ye4xi3PW2ThkFMUzvDzPTlYExTiHnAxs09xWNu13KpqRCud8IgG1d
cYgfAHMCm7NQPq5LYsli8LclLN3Ri3AiuvIDmL5siJUfk9FXP6tZvNSIvZVWiJ+0
F3Q24kCDtNqQvZh4p+cc38o2FeGBzIpEuYer9CsW8r6hzZsVIPObgGbffIYdVUNg
eimhbLBVAE2xvWs1YSprLSnuxMQh5/MESOAgw7arK4PfG2aSwj+lgYC8v/hlADyP
5WSf1cxRuj6Nne1d/T+GryIq/baTwBq5VhRauSVq+z7XSBNje6xBf9Abk9mEOJ1e
F7JgbSW6pmGDhh+yPE3OVH6hCq8t+mK8lcTU9nG0k+lgCZLd9sU=
=qbFr
-----END PGP SIGNATURE-----

--ztfulmdtj45blcj5--


