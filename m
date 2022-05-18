Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2D52B596
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:08:25 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFfM-0002AC-Bv
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrFTL-0001Zm-69
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nrFTH-00038P-1q
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2UpXrkh7qY3hzLo+vDzxcU7YOFQRbSzQHXMxntmKFA=;
 b=RQgPoAQmAVDEfSnXkTr3Mjn5RNOnbjgqpUjcifRkbfviJzxtTC/+rMnPERQ0YBZ7xU73kL
 3m2c/Up0tnwL3ogB9lU+pXDxSfjo/ZWwhPfahzJlk3qLXMaN60hxapLbDEEubfQvdmDavt
 wAZFB2Tmu5NpAUWvN+tRuYUHNCiMB3M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-FYf4VYmSMVuNOS20DHgsvQ-1; Wed, 18 May 2022 04:55:50 -0400
X-MC-Unique: FYf4VYmSMVuNOS20DHgsvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0AE29DD9AB
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 08:55:50 +0000 (UTC)
Received: from localhost (unknown [10.40.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DC4A7AD5;
 Wed, 18 May 2022 08:55:49 +0000 (UTC)
Date: Wed, 18 May 2022 10:55:48 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220518085548.gri7ojvp5ezrstsj@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <87r150dugw.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fny7abjgl53zlmtk"
Content-Disposition: inline
In-Reply-To: <87r150dugw.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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


--fny7abjgl53zlmtk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 11, 2022 at 04:17:35PM +0200, Markus Armbruster wrote:
> Daniel P. Berrang=E9 <berrange@redhat.com> writes:
> > Caller
> >
> >     block_resize(device=3D"dev0", size=3D1*GiB)
> >     block_resize(node_name=3D"devnode0", size=3D1*GiB)
> >
> >
> > In golang definition
> >
> >    type BlockResizeArguments struct {
> >        Device string
> >        NodeName string
> >        Size int
> >    }
> >
> > Caller choice of
> >
> >    cmd :=3D &BlockResizeCommand{
> >        Device: "dev0",
> >        Size: 1 * GiB,
> >    }
> >
> >    cmd :=3D &BlockResizeCommand{
> >        NodeName: "devnode0",
> >        Size: 1 * GiB,
> >    }
>=20
> Note that the Go bindings you sketched effectively use (poor
> man's) keyword arguments.
>=20
> > Neither case can easily prevent passing Device and NodeName
> > at same time.
>=20
> That defect lies at the schema's feet.

Right. The schema does not provide any metadata to explicit say
that only @device or @node-name should be used, correct?

This would be important to differentiate of a simple 'adding a
new optional argument' plus 'making this other argument
optional'.

> >> * At some future date, the old way gets deprecated: argument @device
> >>   acquires feature @deprecated.
> >
> > Ok, no change needed to the APIs in either case. Possibly have
> > code emit a warning if a deprecated field is set.
> >
> >> * Still later, the old way gets removed: @device is deleted, and
> >>   @node-name becomes mandatory.
> >
> > Again no change needed to APIs, but QEMU will throw back an
> > error if the wrong one is used.=20
> >
> >> What is the proper version-spanning interface?
> >>=20
> >> I figure it's both arguments optional, must specify the right one for
> >> the version of QEMU actually in use.  This spans versions, but it fails
> >> to abstract from them.
> >
> > Yep, I think that's inevitable in this scenario. THe plus side
> > is that apps that want to span versions can do so. The downside
> > is that apps that don't want smarts to span version, may loose
> > compile time warnings about use of the now deleted field.=20
>=20
> The version-spanning interface will arguably be a bad interface for any
> version.
>
> > I suggested the code generator have an option to say what level
> > of compat to use for generated code, so that apps can request an
> > API without compat, which will result in compile errors. This
> > though assumes every consumer app is embedding their own
> > generated copy of the code. Not neccessarily desirable.
> >
> > At the C level you can play games with __deprecated__ to get
> > compile time warnings in some cases.=20
> >
> > #define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_56
> >
> > causes QEMU to get compile time warnings (or errors) if it
> > attempts to use a API feature deprecated in 2.56, even if
> > the API exists in the header & library.=20
> >
> >
> >> Note that it's not enough to replace "delete member" by "mark member
> >> deleted in <version>".  You also have to keep full history for "is it
> >> optional".  And for types, because those can evolve compatibly, too,
> >> e.g. from struct to flat union, or from string to alternate of string
> >> and something else.  What is the proper version-spanning interface in
> >> all the possible cases?
> >
> > I've not thought through all possible scenarios, but there may end
> > up being restrictions, such that changes that were previously possible
> > may have to be forbidden.
>=20
> "There may be restrictions" is not exactly a confidence-inspring design
> assumption.  We need a reasonably dependable idea on what exactly we're
> intending to sacrifice.

I can't help much here but I guess we can evolve QAPI schema as
we move forward. Adding metadata that helps document changes to
the benefit of giving code generators tools to provide a way to
work with those QAPI changes seems desirable, no?

> > One example,  in the past we could do deprecate a field 'foo', then
> > delete 'foo' and then some time re-introduce 'foo' with a completely
> > different type. That would not be possible if we wanted to maintain
> > compat, but in this example that's probably a good thing, as it'll
> > be super confusing to have the same field name change type like that
> > over time. Easier to just use a different name.
> >
> > So the question to me is not whether all our previous changes are
> > still possible, but whether enough of the typwes of change are
> > possible, such that we can cope with the ongoing maint in a
> > reasonable way. I don't think we've explored the possibility enough
> > to say one way or the other.
> >
> >> > Apps that wish to have version compat, would of course need to write
> >> > their code to be aware of which fields they need to seend for which
> >> > QEMU version.
> >>=20
> >> At which point we're reinventing libvirt.

IMHO, at this moment, qapi-go is targeting communicating with
QEMU and handling multiple QEMU versions seems reasonable to me.

Perhaps libvirt can use qapi-go in the future or other generated
interface. That would be cool.

> > The premise of the code generators is that there are applications
> > that want to consume QEMU that are not libvirt. With this line of
> > reasoning we could easily say that all such applications should
> > just use libvirt and then we don't need to provide any of these
> > code generators.  The fact that we're considering these code
> > generators though, says that we're accepting there are valid use
> > cases that don't want to use libvirt for whatever reasons.
>=20
> Can't resist any longer: "What has libvirt ever done for us?"
> https://www.youtube.com/watch?v=3DQc7HmhrgTuQ
>=20
> >                                                            It is
> > reasonable that some of those applications may wish to target
> > a wide range of QEMU versions, just like libvirt does.
>=20
> At which point they're comitting to reinventing the relevant parts of
> libvirt.
>=20
> I'd expect marshalling and umarshalling QMP to be among the
> smaller sub-problems then.  It may look relatively large at
> first, because it's among the first ones to be solved.  More so
> when you hand-wave away the more interesting ones of
> *abstraction* until they bite you in the posterior.

I might have missed it but I don't see unsolvable problems.

 1) We decide if we want a Golang interface that can communicate
    with multiple QEMU versions or not;
 2) We discuss how that Golang interface would look like;
 3) We discuss what is needed in QEMU/QAPI to achieve (2)
 4) We work on QEMU/QAPI to address (3)
 5) We move on with qapi-go proposal

I see only benefits with this project, plus the fact we already
have Golang projects doing their own code to communicate with
QEMU and I do believe we will make their lives easier.

> > It is also reasonable to say that libvirt would be better off
> > if it could auto-generate a client API for QEMU too, instead
> > of writing it by hand from a human reading the QAPI
> >
> > With regards,
> > Daniel

Cheers,
Victor

--fny7abjgl53zlmtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmKEtJQACgkQl9kSPeN6
SE93nA/8D6C25URx66z+YoH45+3LcYhXVZ2RWKpMQ1h3lAO43UQcKP0pzO+ekKYw
pzLTl2yDl6SJGvRr9p5LomcoIzaSZjxHmE0ImelwN6keywlNwFqTOz+e+86Fy1jQ
CxM6a8gPFLQjArSgHva3bN8w0g8/y19NMj9m0RDy5icg/MMzJePbzI//X/PrgiFN
7+rL5z5a3qUTXKLdcaRLhxwxGJuxDC6b1fTFi886Gt1nBsvKupJoaxPSEo+99yml
ffBYhR7eddtAk6FaEyRIDa3daiZM+7ZuVNQG70OhrSM9mt/skWw5Tln8p35O0Ph8
pnyvwaO1wMEFJz1A7o1RTxuhEH0Op77Pgz1Mvt2yENkHhogicw8KsYG9uLuqG/ht
8I4sxtwmNnl933snN1IOYB4GhypB27XSm1UmEHF71S7PC8y87sVH8R8el8J9HGIu
KoCuZAyZoKyanyfkn1C4xRwS9slkQLOLtvtnQrm00CWjQ2E+VGlCXtYx5+b8fDQy
0Pr0ffWgHpxxV5Octmt7F4zx6r0+4xvFOjDGpx2rSpQSs7jmzbZLvVTTwCtpG1aP
FV11OGyJwX3rWN4AKhMfxI9uEB7pqpJD3nGQIzEha53NY64BjVrnxXCXr/jz6cq1
ADmmk8bWlG2GHhtRrAbQYPQVQeEUDkiXhGv9RcG8020MZ5JGlf8=
=0VQn
-----END PGP SIGNATURE-----

--fny7abjgl53zlmtk--


