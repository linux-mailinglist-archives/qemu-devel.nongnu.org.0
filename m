Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1F2F66E0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:10:56 +0100 (CET)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0699-0004ok-21
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l05jX-0001Gw-UX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l05jT-0008KK-OZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610642661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irYbBfLbYvf1aAxzWdmeH+VPSGtQNNhv4mlzflzK8eg=;
 b=eSuz5lo8tAv9JXqiLRN6VJABQP0XecF7pf+Kw2fw51OeIVVAA+KQSl/ECkgynXj/CsQYCQ
 //TIKtvA964Hq8yLbJRyZ0PHp4ijVJLoAgfrNh2lAo7gRtun+EmfKNc83x79sHXjsbznEz
 ZknJNkZ97QreTVqSaXj2j4/YyDfzWek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532--BwLhJqxN0-MiR_-MlSfOw-1; Thu, 14 Jan 2021 11:44:19 -0500
X-MC-Unique: -BwLhJqxN0-MiR_-MlSfOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4F96107ACF7;
 Thu, 14 Jan 2021 16:44:17 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A2B85C1BD;
 Thu, 14 Jan 2021 16:44:17 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:44:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210114164416.GC306329@stefanha-x1.localdomain>
References: <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
 <20210114140217.GD292902@stefanha-x1.localdomain>
 <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:18:48PM +0100, BALATON Zoltan wrote:
> On Thu, 14 Jan 2021, Stefan Hajnoczi wrote:
> > On Wed, Jan 13, 2021 at 07:20:42PM -0500, John Snow wrote:
> > > On 1/13/21 6:45 PM, BALATON Zoltan wrote:
> > > >=20
> > > > Please don't. That would break all scripts that already call qemu u=
sing
> > > > single dash options. Forcing everyone to edit their scripts is not =
nice.
> > > > How about also accepting single dash in qemu-img for consistency th=
en
> > > > you can use whatever you want in docs as long as single dash still =
works
> > > > for consistency and backward compatibility.
> > >=20
> > > That's not what I meant -- I meant for documentation purposes. QEMU c=
an keep
> > > accepting single dash, but we should standardize on the spelling for
> > > purposes of interactive messages, documentation, etc.
> >=20
> > I wasn't aware of the fact that some of the utilities are sensitive to
> > '--' vs '-'! I'm in favor of consistently using '--' in documentation
> > but allowing both for backwards compatibility where '-' is currently
> > supported.
> >=20
> > If we are in agreement, then let's:
> >=20
> > 1. Add a section to CODING_STYLE.rst or other developer documentation
> >   documenting this.
>=20
> I'd be more in favour of documenting that QEMU accepts - options but also=
 --
> as alternative and fixing the tools that currently use getopt_long to use
> getopt_long_only to keep it consistent with main QEMU executable. Otherwi=
se
> this will get more and more inconsistent with new options added with -- a=
nd
> old ones only exist in - form so to keep consistency we should standardis=
e
> on - not --.
>=20
> > 2. Convert existing documentation to use '--'. This will make it more
> >   consistent and also avoid confusion about '-' vs '--'.
>=20
> You could still use -- in documentation but what's the problem with - if =
--
> is also accepted if one wants to type that?

What is the policy for QEMU documentation?

1. Use '-' everywhere

or

2. Use '--' everywhere

or

3. Use whichever you prefer

or

?

Stefan

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAdOAACgkQnKSrs4Gr
c8hqsAgAmXIkuNRzWevHajPYKg9ADFGskRNsqquicOO/OtLUTSOu4GieSvhvVCAc
w2Kq74+cyFu2bfRICiwCd5LOILfkzEdLpflhwA2EN8ygmUXEMx9tG4uFMGbS11Bm
/F5PUFQuxhobnN4FEUeHtPPaBT/KmBo3mMCMqCcAw6iVmjLZQC1y1yprYkzB6aJf
XBHr+WWejZJKRrG0/7Q3zlq8TXUq63XoaExUcLtl8ixuJxhPEBmh67FXWdgy+MQV
9Hxc2MDoJoWTRJOqlB4U0goNCd9ot6kuLkHBgKoF6v+9GI8qYTmM2zhSz5ZGk8kc
9fx7b0fEdfm9O18WmNpP1JqJJ1dFFw==
=Ue+M
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--


