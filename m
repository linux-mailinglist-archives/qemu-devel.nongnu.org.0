Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4831318B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:56:12 +0100 (CET)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l959H-00062M-DW
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9058-0002Vs-Bk; Mon, 08 Feb 2021 01:31:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33419 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l904o-0006fL-IY; Mon, 08 Feb 2021 01:31:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYx3S5zWgz9sVR; Mon,  8 Feb 2021 17:30:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612765828;
 bh=3z5T9UJRaU02SEuUWnxCg67jwmlHvzlscr5ZKg9Xvvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JALvtq4wKY9GQURpsQywClnqBMnItqdZ5nKUoA1PupUYb+7sKNBAwO2Eavnjek5Nn
 BnMZm0Jq9L+ElDEHAMSG/C/Ykuj6bsjNuPTv2S90ULVJUjnj5TZxk1X18hhewH4eLX
 0rCQqnyDuhYjtgjWCVcHb1fUK/j04CgjOvQO22NA=
Date: Mon, 8 Feb 2021 17:21:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC Qemu PATCH v2 1/2] spapr: drc: Add support for async hcalls
 at the drc level
Message-ID: <20210208062122.GA40668@yekko.fritz.box>
References: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
 <160674938210.2492771.1728601884822491679.stgit@lep8c.aus.stglabs.ibm.com>
 <20201221130853.15c8ddfd@bahia.lan>
 <20201228083800.GN6952@yekko.fritz.box>
 <3b47312a-217f-8df5-0bfd-1a653598abad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <3b47312a-217f-8df5-0bfd-1a653598abad@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 linux-nvdimm@lists.01.org, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 Greg Kurz <groug@kaod.org>, shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org,
 bharata@linux.vnet.ibm.com, imammedo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 12:40:31PM +0530, Shivaprasad G Bhat wrote:
> Thanks for the comments!
>=20
>=20
> On 12/28/20 2:08 PM, David Gibson wrote:
>=20
> > On Mon, Dec 21, 2020 at 01:08:53PM +0100, Greg Kurz wrote:
> ...
> > > The overall idea looks good but I think you should consider using
> > > a thread pool to implement it. See below.
> > I am not convinced, however.  Specifically, attaching this to the DRC
> > doesn't make sense to me.  We're adding exactly one DRC related async
> > hcall, and I can't really see much call for another one.  We could
> > have other async hcalls - indeed we already have one for HPT resizing
> > - but attaching this to DRCs doesn't help for those.
>=20
> The semantics of the hcall made me think, if this is going to be
> re-usable for future if implemented at DRC level.

It would only be re-usable for operations that are actually connected
to DRCs.  It doesn't seem to me particularly likely that we'll ever
have more asynchronous hcalls that are also associated with DRCs.

> Other option
> is to move the async-hcall-state/list into the NVDIMMState structure
> in include/hw/mem/nvdimm.h and handle it with machine->nvdimms_state
> at a global level.

I'm ok with either of two options:

A) Implement this ad-hoc for this specific case, making whatever
simplifications you can based on this specific case.

B) Implement a general mechanism for async hcalls that is *not* tied
to DRCs.  Then use that for the existing H_RESIZE_HPT_PREPARE call as
well as this new one.

> Hope you are okay with using the pool based approach that Greg

Honestly a thread pool seems like it might be overkill for this
application.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAg2F8ACgkQbDjKyiDZ
s5IHuA/9HyiCaZs3cWwZpR/QYIuwRGbtPEcvZlPwFFGfHwTmhbLPngp5pYbuO+tJ
Z9D61MwH1qNT1Q2XV8rW9moj+hTuJVjJZqFe05UApHqh2yq/OtHaZRUvZXYjtO9q
lF7sE9RnfPKs6eG9zWrqETIXyDq96SPoW1WZ6aryOUpfammRweNsl0YrXhWKv8Th
zJUczQMU3CuO/uANcw5hkVjH4amiKsGHXJnXqqeh7IQBx7WxVb3PN5jllxUOjI5b
Y6wxPllbvqf0n4I0NPYsY4juaaiLWXdO3PfMefvLVmx0NalyKyNiidTd3sVY0/UP
Thgc3PTuAij6v+PJbEcalHyEGuemE1QyGRCO7LDcVaw9N0Fr1NwtMpIkqtSyzhgO
U2fdn0Hi4OIuBac3CvEjXfbludNGbqIlsVQPvdtaBLJYgo1xvnWqKxUYv2YPF/kt
SDEehG2LvVk/5igzJ9sESyn8yROzXWJ3OfKJc2ivm6CcG/EMPGN87PqvjwRCmmoX
3IR2V5DLuIVNaPyIZSQuC60UJmOo52xGuGxtYH6cFQU2yFgiymFiQ9uHct4lZKrT
nv2YZL4JHX2rNZgk/mZtPoany4ilhWkbvpLWhDmFoOgfLOp7t3CqsD7XAu8u9FSH
pMaLTbLKIlrSSKsm+XiecWtFU7Zt1lhYHm7QIw73PLmw47jntos=
=gnLb
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

