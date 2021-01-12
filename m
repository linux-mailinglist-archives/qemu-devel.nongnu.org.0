Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10902F26D5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 04:52:16 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzAj9-0007HL-NQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 22:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzAgt-0005q9-6o; Mon, 11 Jan 2021 22:49:55 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33399 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzAgo-00061h-OE; Mon, 11 Jan 2021 22:49:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFGmR6wtWz9sWL; Tue, 12 Jan 2021 14:49:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610423383;
 bh=GOPARHl2Um0wlY8mSkWS1A+Okstbf4+CZEKk7OTEAuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GizeGJ8fT5fZp0PaNju9Vhw2AQ64lxlUzkkXtPdhEKC+G84KceTrjQE2zSBLbMVFX
 abcyYNdjZWcEj0vYuJxZMcCq6ZKD0Wy3KBqKqi75iZaqVEKYnHLMf4UWixjC1X0FTd
 GNDHtfV0Y1VUOgrA4PN2ljilC0YIulkGThPDnHrU=
Date: Tue, 12 Jan 2021 14:03:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [for-6.0 v5 06/13] securable guest memory: Decouple
 kvm_memcrypt_*() helpers from KVM
Message-ID: <20210112030322.GK3051@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-7-david@gibson.dropbear.id.au>
 <e8c1f2a7-e5b9-8181-2c7b-0287699ac9c9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYjDATHXTWnytHRU"
Content-Disposition: inline
In-Reply-To: <e8c1f2a7-e5b9-8181-2c7b-0287699ac9c9@redhat.com>
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, david@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zYjDATHXTWnytHRU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 07:13:27PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 12/4/20 6:44 AM, David Gibson wrote:
> > The kvm_memcrypt_enabled() and kvm_memcrypt_encrypt_data() helper funct=
ions
> > don't conceptually have any connection to KVM (although it's not possib=
le
> > in practice to use them without it).
> >=20
> > They also rely on looking at the global KVMState.  But the same informa=
tion
> > is available from the machine, and the only existing callers have natur=
al
> > access to the machine state.
> >=20
> > Therefore, move and rename them to helpers in securable-guest-memory.h,
> > taking an explicit machine parameter.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  accel/kvm/kvm-all.c                   | 27 --------------------
> >  accel/stubs/kvm-stub.c                | 10 --------
> >  hw/i386/pc_sysfw.c                    |  6 +++--
> >  include/exec/securable-guest-memory.h | 36 +++++++++++++++++++++++++++
> >  include/sysemu/kvm.h                  | 17 -------------
> >  5 files changed, 40 insertions(+), 56 deletions(-)
> ...
>=20
> > +static inline int securable_guest_memory_encrypt(MachineState *machine,
> > +                                              uint8_t *ptr, uint64_t l=
en)
> > +{
> > +    SecurableGuestMemory *sgm =3D machine->sgm;
> > +
> > +    if (sgm) {
> > +        SecurableGuestMemoryClass *sgmc =3D SECURABLE_GUEST_MEMORY_GET=
_CLASS(sgm);
> > +
> > +        if (sgmc->encrypt_data) {
>=20
> Can this ever happen? Maybe use assert(sgmc->encrypt_data) instead?

It's made moot by changes in the next spin.

>=20
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> > +            return sgmc->encrypt_data(sgm, ptr, len);
> > +        }
> > +    }
> > +
> > +    return 1;
> > +}
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYjDATHXTWnytHRU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/9EXoACgkQbDjKyiDZ
s5KvzQ/9EugoRV/WIF4Cga4OBwqfG0O80793x36mlNZm4fotE3mrayRqFRAhQ5jF
E4xbG69Bp5GPK+9YzDAOWrGlNBBw9z0LSGQlBytS9hEODtAOFJfRsUT4Tn5eohJr
liADZgHG9cQtOCZTpX8zp5LDT2XSsiLhorfuHXG7QzOJmEzTJRXLccpmdbOyQnYO
wsHHXy/ZEocPVSsHCJU015hoB67JJYnIRj/tEv9WbasWFf3QlQF/IvB3oetmemZ1
uTPwUAfD58PAf6G7/JQ3Qkj1HqpRBou/n7rp3pBtj4t+zqL4shv2SH1sJBICRvJK
l9CLHpkNfUhPERZMKTw76EyqZWttBKyhlaxSgRBvnZXsRBdW/LX02ytC35r4g1wc
eMVpb/1HAJjOnhS97O+F0BivaOvz5t3/TSUuR0Nkdlhk8bOJyb7pXIW81YGuLcio
OJa7O38z3nyOd8CNtfm0NHCpUYI/OYR5APkVTqmKNBsLttWRvGVv8NNM+7hs0kZh
KUSg/x2JSm2MkgwIU4E1wkF8V38wDXPJsWOelzWLRZSfUELOWRjSveuNeH3PLjHx
fFdwDEY4G19X4/IIegPoC2TWZDngKot5bD3qiOqUxLfnpaCe2jN5k8hmk9ImWYqe
3SUuZXrWZyFsbBugLr/LLPUcDbZWuCxuV+4f1ntHeqlySS5Z/r4=
=2yF9
-----END PGP SIGNATURE-----

--zYjDATHXTWnytHRU--

