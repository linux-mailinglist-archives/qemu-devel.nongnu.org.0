Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838B1F5218
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 12:17:55 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jixnu-0002nn-2r
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jixm2-0001fj-U1; Wed, 10 Jun 2020 06:15:59 -0400
Received: from ozlabs.org ([203.11.71.1]:34081)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jixm0-00083V-1S; Wed, 10 Jun 2020 06:15:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49hjYT3Ldmz9sQx; Wed, 10 Jun 2020 20:15:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1591784141;
 bh=kbYY1DGFXehDXUZKCqytgYqkpJwAwWtz1LoghtEPn20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmVwxz2beFE9nHWWdu1wACSCiyeApQbnTUnyl9nLUCCny+BnpOYRxQER9XosyJQ1w
 /UK8N5Q0bPwh+o9JMEcookzRDR9Tdn+Bh6MPzr1laSifySBAvVgaUQoVaWCOu5XadR
 Y46aypcTaM6+MgPYMZXPUKLjy6Pcf662XOjyOwR4=
Date: Wed, 10 Jun 2020 20:07:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/1] virtio-ccw: auto-manage VIRTIO_F_IOMMU_PLATFORM
 if PV
Message-ID: <20200610100756.GO494336@umbus.fritz.box>
References: <20200606013217.2cffa3ed.pasic@linux.ibm.com>
 <20200608181428.3c6f127c.cohuck@redhat.com>
 <20200608190045.319dd68b.pasic@linux.ibm.com>
 <20200609084402.35d317ec.cohuck@redhat.com>
 <20200609114130.0ca9190b.pasic@linux.ibm.com>
 <20200609174747.4e300818@ibm-vm>
 <20200609182839.7ac80938.pasic@linux.ibm.com>
 <20200609124155-mutt-send-email-mst@kernel.org>
 <20200610043118.GF494336@umbus.fritz.box>
 <4e5d62d8-9bfb-67d5-7398-2079729fd85e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jozmn01XJZjDjM3N"
Content-Disposition: inline
In-Reply-To: <4e5d62d8-9bfb-67d5-7398-2079729fd85e@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 06:15:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Viktor Mihajlovski <mihajlov@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Boris Fiuczynski <fiuczy@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jozmn01XJZjDjM3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 09:22:45AM +0200, David Hildenbrand wrote:
> On 10.06.20 06:31, David Gibson wrote:
> > On Tue, Jun 09, 2020 at 12:44:39PM -0400, Michael S. Tsirkin wrote:
> >> On Tue, Jun 09, 2020 at 06:28:39PM +0200, Halil Pasic wrote:
> >>> On Tue, 9 Jun 2020 17:47:47 +0200
> >>> Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:
> >>>
> >>>> On Tue, 9 Jun 2020 11:41:30 +0200
> >>>> Halil Pasic <pasic@linux.ibm.com> wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>> I don't know. Janosch could answer that, but he is on vacation. Add=
ing
> >>>>> Claudio maybe he can answer. My understanding is, that while it mig=
ht
> >>>>> be possible, it is ugly at best. The ability to do a transition is
> >>>>> indicated by a CPU model feature. Indicating the feature to the gue=
st
> >>>>> and then failing the transition sounds wrong to me.
> >>>>
> >>>> I agree. If the feature is advertised, then it has to work. I don't
> >>>> think we even have an architected way to fail the transition for that
> >>>> reason.
> >>>>
> >>>> What __could__ be done is to prevent qemu from even starting if an
> >>>> incompatible device is specified together with PV.
> >>>
> >>> AFAIU, the "specified together with PV" is the problem here. Currently
> >>> we don't "specify PV" but PV is just a capability that is managed by =
the
> >>> CPU model (like so many other).
> >>
> >> So if we want to keep it user friendly, there could be
> >> protection property with values on/off/auto, and auto
> >> would poke at host capability to figure out whether
> >> it's supported.
> >>
> >> Both virtio and CPU would inherit from that.
> >=20
> > Right, that's what I have in mind for my 'host-trust-limitation'
> > property (a generalized version of the existing 'memory-encryption'
> > machine option).  My draft patches already set virtio properties
> > accordingly, it should be possible to set (default) cpu properties as
> > well.
>=20
> No crazy CPU model hacks please (at least speaking for the s390x).

Uh... I'm not really sure what you have in mind here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jozmn01XJZjDjM3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7gsPwACgkQbDjKyiDZ
s5L0sBAAx3ZTgpDbASeYbEurpTjq1D3wxIKbpNP9U5tWo2p+Pib5iDMCJ679kpoX
Sc4IRQD2a1Wc4yFg2DKdtoC9fmEHpR/SqdtohEG24vs+EXLKUhwAzg5Gx+I/prWk
EvDIqMJYip0WH5uvgv2MMz0NLLoXXeqUNenMci93QrwjpoPDP0/jh9A6dsZ3X9S5
6EB8morrgCyQyX6GxRKm+zuM6YTEjz4MB4yWattbIihh4HHgIsDbSw37oYvVSPSo
VrdPVGgcNCfF6vi0bu+QZDQEhwHOlcynMQNTMHn1aCFfgGcGh0qyRP+bPkPyMzIh
1woOr+o0hlZDjZfb2sF7P+k1W1YQ1T7YdNAgX1hApdE/v+RY36b3tjappZs3nJi7
ItaFU1Xg8lh5BQL5cbrTdAMYk7FJa2m7Et6u4N/eXUHq8lOScHVyTrircDFFlN/G
7ZyBJueIZ6Lj7um2DZKOyi4UHiBf/u1FUgUFbOGAkyaBajXzQOBvoSrm9y+ktEYQ
2/jqha4XwnLX08Ht3EkuRTFFFXPMRaPYPqYf88FiHfmjNq1+LqdX7hey5S9Dn69M
ajHke3Dw17RhhpTqQvCcCP6M+jh4UCjqxXvR0q19EjMoS14jLqiK7BSpseVmScqp
rsG8nRyIT6sLseThoRX9utyiSfAZ+KK4Wpf4ssGcc7HHE3plJkQ=
=uDZn
-----END PGP SIGNATURE-----

--jozmn01XJZjDjM3N--

