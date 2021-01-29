Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AC3084D9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:10:22 +0100 (CET)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5M33-00063O-D6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1T-0004QR-Rd; Fri, 29 Jan 2021 00:08:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48981 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5M1P-0004KL-T2; Fri, 29 Jan 2021 00:08:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRljS108vz9sWC; Fri, 29 Jan 2021 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611896908;
 bh=DwX2xxp5BxsJ1HzAhDzhru9OGZh5PT/Wc2rbbkSsLV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hU/MKdSS1PWDXCcXkV2VLuodi+2M4FCALrpQ0vL927xQvWbvWcXknfvjleAKFkCmq
 41F6OcUo0Wnphq8Gem1z8zDISgISOcrv4KUE7N/fgwOca9ohkMSxDgm212hw9PnE6Z
 3yOdyy/JUVjKj+CsREYbvAKDByGnH78tMh4e1aMk=
Date: Fri, 29 Jan 2021 14:12:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v7 08/13] confidential guest support: Move SEV
 initialization into arch specific code
Message-ID: <20210129031240.GK6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-9-david@gibson.dropbear.id.au>
 <20210115142425.540b6126.cohuck@redhat.com>
 <20210118030308.GG2089552@yekko.fritz.box>
 <20210118090336.1e708346.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline
In-Reply-To: <20210118090336.1e708346.cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 09:03:36AM +0100, Cornelia Huck wrote:
> On Mon, 18 Jan 2021 14:03:08 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Jan 15, 2021 at 02:24:25PM +0100, Cornelia Huck wrote:
> > > On Thu, 14 Jan 2021 10:58:06 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > While we've abstracted some (potential) differences between mechani=
sms for
> > > > securing guest memory, the initialization is still specific to SEV.=
  Given
> > > > that, move it into x86's kvm_arch_init() code, rather than the gene=
ric
> > > > kvm_init() code.
> > > >=20
> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > ---
> > > >  accel/kvm/kvm-all.c   | 14 --------------
> > > >  accel/kvm/sev-stub.c  |  4 ++--
> > > >  target/i386/kvm/kvm.c | 12 ++++++++++++
> > > >  target/i386/sev.c     |  7 ++++++-
> > > >  4 files changed, 20 insertions(+), 17 deletions(-)
> > > >  =20
> > >=20
> > > (...)
> > >  =20
> > > > @@ -2135,6 +2136,17 @@ int kvm_arch_init(MachineState *ms, KVMState=
 *s)
> > > >      uint64_t shadow_mem;
> > > >      int ret;
> > > >      struct utsname utsname;
> > > > +    Error *local_err =3D NULL;
> > > > +
> > > > +    /*
> > > > +     * if memory encryption object is specified then initialize the
> > > > +     * memory encryption context (no-op otherwise)
> > > > +     */
> > > > +    ret =3D sev_kvm_init(ms->cgs, &local_err); =20
> > >=20
> > > Maybe still leave a comment here, as the code will still need to be
> > > modified to handle non-SEV x86 mechanisms? =20
> >=20
> > Uh.. I'm confused.. this hunk is adding a comment, not removing one..
>=20
> Yes, but there was a "TODO: handle non-SEV" comment before. This will
> probably need some massaging if we add Intel mechanisms?

Technically, not exactly.  New mechanisms would have their own
initialization, which might go adjacent to this, or could be somewhere
else - the sev_kvm_init() is a no-op if a non-SEV mechanism is
selected (currently impossible).

The distinction is pretty subtle, though, so I've altered the comment
here in a way I hope explains it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATfSYACgkQbDjKyiDZ
s5KpmBAAvXbfy0wsBXV2LxclUf3rOIb38gJz63FDxGMBnrE+Eu2GU/hpPLQhQcGs
v8eHYvojmpV2ZP/JCUPDDvIS3tRpDtnSHhcN/s59cTYjJ88I6UPTF6vDsgczpYwA
Rm7C+vv+f8KKavNJS2rMkbd8p3szOLBRz6fCvFCleKfKqRdoaXSLS16as6Y0t9ul
K9Ye0f1gmnyAKFJhUAG6yQxAfoJT4iW/kgk6KdzDJgt4qFO0yCqfThG+RC7Thuyw
E/WwceaEG1ZQzacTsJzxbdF2v0SjZum1x5E7XeFZKTTHDrjJ7LSE0DmO8jvJUdF6
GsJt7oFEOmH14zxrlgo0bktU0epd3lz5YpabdhRjfuj+EdmU8uRyYsltox3EG5Fc
S2QTub1ytbFtcIFmuHBdEsAZHUUPEPpU+1YnNeNYj1rmTgOY7P/RMFny1T2qp24Y
4hMCEF7vyMLX8nRP+FianFBIKSsaEmN4U8YakQW+L8CS5P7v6Y5T4krGe6XhZMnq
VfRhG08e9oDo7KWcgiV3zhrVXQ2G04cOCoRnmRSXrvxGdVDP9wELehqhwzypz2qi
iWlBXCyVNIR2Ib/3F/eKvm4yEOWeJOJ5apdciuRHIPbZYF/QN92SIIIJmzmycR/x
mB8RSP8scbvuD6Jdwh78AQzgxqjmlhPg0xXHqAcZ4fy3iGhFqug=
=/g2J
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--

