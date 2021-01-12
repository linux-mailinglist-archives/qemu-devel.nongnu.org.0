Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAC2F26D4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 04:52:15 +0100 (CET)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzAj8-0007GD-Nf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 22:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzAgr-0005pw-Qo; Mon, 11 Jan 2021 22:49:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51929 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzAgo-00061g-JA; Mon, 11 Jan 2021 22:49:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFGmS0mCjz9sXb; Tue, 12 Jan 2021 14:49:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610423384;
 bh=btmVH3UE3ShVXpQ3NbbiNduitqKhghwHg9P22JeqMZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J263AgD7rwcibc8HJ+ZqsDGjtMjb/cdAjxrJWOLQMxO68SMyASi1nOa3utfRUK5ao
 Dkq5HFDlmk/65X9E5GSBD7aI+37hiF9DAhLZRb2QIOH4t/m9PocoSK7JH+O5Mou//E
 lOv+AsEMns0PYhUwvI9AxPRV6D+RbKEgzjssFwrI=
Date: Tue, 12 Jan 2021 14:02:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20210112030230.GJ3051@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204095005.GB3056135@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DesjdUuHQDwS2t4N"
Content-Disposition: inline
In-Reply-To: <20201204095005.GB3056135@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, thuth@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net, mdroth@linux.vnet.ibm.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DesjdUuHQDwS2t4N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 09:50:05AM +0000, Daniel P. Berrang=E9 wrote:
> On Fri, Dec 04, 2020 at 04:44:02PM +1100, David Gibson wrote:
> > A number of hardware platforms are implementing mechanisms whereby the
> > hypervisor does not have unfettered access to guest memory, in order
> > to mitigate the security impact of a compromised hypervisor.
> >=20
> > AMD's SEV implements this with in-cpu memory encryption, and Intel has
> > its own memory encryption mechanism.  POWER has an upcoming mechanism
> > to accomplish this in a different way, using a new memory protection
> > level plus a small trusted ultravisor.  s390 also has a protected
> > execution environment.
> >=20
> > The current code (committed or draft) for these features has each
> > platform's version configured entirely differently.  That doesn't seem
> > ideal for users, or particularly for management layers.
> >=20
> > AMD SEV introduces a notionally generic machine option
> > "machine-encryption", but it doesn't actually cover any cases other
> > than SEV.
> >=20
> > This series is a proposal to at least partially unify configuration
> > for these mechanisms, by renaming and generalizing AMD's
> > "memory-encryption" property.  It is replaced by a
> > "securable-guest-memory" property pointing to a platform specific
> > object which configures and manages the specific details.
>=20
> There's no docs updated or added in this series.
>=20
> docs/amd-memory-encryption.txt needs an update at least, and
> there ought to be a doc added describing how this series is
> to be used for s390/ppc

Fair point, I've made a bunch of doc updates for the next spin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DesjdUuHQDwS2t4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/9EUQACgkQbDjKyiDZ
s5JzAQ//SvrT3nuK8XyVRauAL7EhoV1epcnrl2exKWQteytnpnCW3Mw0x95IfC6w
ukVrdcGbN84Xt6YcsXj+ajhi3G97MFMt675PUourF18qBgoPzlXTTEIJQ99z3kOm
ZARhaxGen02w0TiuZjdvxoG9b7EJYOb9Ie8gSgb7twgDImB64xiXqnh3iDSFoxLr
Ia90xBQMLPg8fg/7yxj4TkHqnRwDyTUrWH5A0b5i5cBI4YSy8855x5tA0Xp6VVPw
tzY5Ky8qSPcTKr6lL3y/sU+pk47KqcwgFvqgUWU0+IUBZ0/Ntl/ECTVSBhgRexlo
XF+duybxFoQ172mz/IW7psAhHpBs245BZ8vycB6FPEfbl4rUAJujulzgmBgSib2g
d5g4j8uIpnpoJrp+x1OrofvrSdNicC/2YWlwMmmybBW6V8UAoV+Dpx9LnNIlHzjI
5r9NBMDr0gf74UGS93DSgrkcq1rn/TiISIeZu6/QKStInGptChZcXjFaOlKTMYu8
LDNwF+ihad2N8lacXIl+6tjHViTUH0IXJJEatLhGj2G7GwIQHCYgjo5bkls4guBT
n7umTEIFCPlICEUfZi6zCsc+z/NInlGhF2E56bR1XCtLJpidF7xoORYkcz5qZfZc
g5SwJwo9gLSRqZgDnMhgdKgL49E9jdhqUw0DzYdXub6Ty0iH8Us=
=4wXi
-----END PGP SIGNATURE-----

--DesjdUuHQDwS2t4N--

