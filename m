Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF82DCC55
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:05:43 +0100 (CET)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpmQ2-0001tq-Si
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmLF-0000Mu-MD; Thu, 17 Dec 2020 01:00:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36153 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpmL5-0001HE-Aj; Thu, 17 Dec 2020 01:00:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CxLvH5l7Kz9sVX; Thu, 17 Dec 2020 17:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608184827;
 bh=HFpcuWIE4ziFINaRm+1QOnEHHwfsGuq2tu3PW8bRLD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwmIrcP4MdleOHL9qEXmftBI3LXoZ5BTGeYoM0DbXMFkYEInQG1lXiyU/bYDEH1kO
 jBA1teKx3zu3a6ZOBafBK9O5YEat31ry8vccl6bv7gh+wIcV1z246rm5RZYpzXya33
 +WpgD+7OwJFtVrnoJOjf0AxcFypKDEaykKhtE6kk=
Date: Thu, 17 Dec 2020 16:38:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [for-6.0 v5 08/13] securable guest memory: Introduce sgm "ready"
 flag
Message-ID: <20201217053820.GG310465@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-9-david@gibson.dropbear.id.au>
 <20201214180036.3837693e.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline
In-Reply-To: <20201214180036.3837693e.cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 06:00:36PM +0100, Cornelia Huck wrote:
> On Fri,  4 Dec 2020 16:44:10 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > The platform specific details of mechanisms for implementing securable
> > guest memory may require setup at various points during initialization.
> > Thus, it's not really feasible to have a single sgm initialization hook,
> > but instead each mechanism needs its own initialization calls in arch or
> > machine specific code.
> >=20
> > However, to make it harder to have a bug where a mechanism isn't proper=
ly
> > initialized under some circumstances, we want to have a common place,
> > relatively late in boot, where we verify that sgm has been initialized =
if
> > it was requested.
> >=20
> > This patch introduces a ready flag to the SecurableGuestMemory base type
> > to accomplish this, which we verify just before the machine specific
> > initialization function.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/core/machine.c                     | 8 ++++++++
> >  include/exec/securable-guest-memory.h | 2 ++
> >  target/i386/sev.c                     | 2 ++
> >  3 files changed, 12 insertions(+)
> >=20
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 816ea3ae3e..a67a27d03c 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1155,6 +1155,14 @@ void machine_run_board_init(MachineState *machin=
e)
> >      }
> > =20
> >      if (machine->sgm) {
> > +        /*
> > +         * Where securable guest memory is initialized depends on the
> > +         * specific mechanism in use.  But, we need to make sure it's
> > +         * ready by now.  If it isn't, that's a bug in the
> > +         * implementation of that sgm mechanism.
> > +         */
> > +        assert(machine->sgm->ready);
>=20
> Under which circumstances might we arrive here with 'ready' not set?
>=20
> - programming error, setup is happening too late -> assert() seems
>   appropriate

Yes, this is designed to catch programming errors.  In particular I'm
concerned about:
  * Re-arranging the init code, and either entirely forgetting the sgm
    setup, or accidentally moving it too late
  * The sgm setup is buried in the machine setup code, conditional on
    various things, and changes mean we no longer either call it or
    (correctly) fail
  * User has specified an sgm scheme designed for a machine type other
    than the one they selected.  The arch/machine init code hasn't
    correctly accounted for that possibility and ignores it, instead
    of correctly throwing an error
=20
> - we tried to set it up, but some error happened -> should we rely on
>   the setup code to error out first? (i.e. we won't end up here, unless
>   there's a programming error, in which case the assert() looks
>   fine)

Yes, that's my intention.

>   Is there a possible use case for "we could not set it up, but we
>   support an unsecured guest (as long as it is clear what happens)"?

I don't think so.  My feeling is that if you specify that you want the
feature, qemu needs to either give it to you, or fail, not silently
degrade the features presented to the guest.

>   Likely only for guests that transition themselves, but one could
>   argue that QEMU should simply be invoked a second time without the
>   sgm stuff being specified in the error case.

Right - I think whatever error we give here is likely to be easier to
diagnose than the guest itself throwing an error when it fails to
transition to secure mode (plus we should catch it always, rather than
only if we run a guest which tries to go secure).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/a7soACgkQbDjKyiDZ
s5INlRAAwWOMdkH6Nhz/QFJG/PAQMaw8j/iG16Hw59Yn7v9ckalk6baO0yVwdkEl
HTrHigAQZ2UwFBNwKO3/hdz+nk4ui8Zz1VR7iyZVLzy9W6i+xKg06uGHAY3G7gF8
MrnzhtdO9RO9hZpaziBogwUlz/TYyeRhpxUQYQtpPdfWNsI2ddE6QblSVD1RdFyj
9xEVaBtfXaIi5Okzn6iUSrFSr1EZZYA941COQlPqLm+jB6ezfzbctS7Fyz2MXCxH
WZBSgOXNTvhaDGEk0EIE9qPsVpoYFUdNqVWR9Hl0lQ+u1LptajRr5X/2gTeOA+3B
zRzpGkKb7uFKKt0GS+xFrc82jXWjm8bXlM3rk2vvR4w9w7WrxUw58MyRrLgL4fSc
dGFyKXo2t1R1gclwHuNDmGYMcC69gKLJDN5fisQWw+0ltPLuFMvUfLQpMTWBhKZX
UMGYvfrbYSMvGdTg1fsT1CT+YM5JWYvRVAdfW0dGPpbvro8NEHrboOkAByYntgUS
ZsriDdwfZfD2MltRW6BY0Nc7nR/lbovKEZIoJVRZZNv2d89SSafYc+gnFc+EuZ2o
0IOmgtQknJtr6juQZOaWXgRexUwhPqG3TyTI98C7r65ZYfL2ZTALTD9sIpWlR1SZ
TYZrZSArPuEZQDK5jKQEkHsAbot0wpsx+KrFCqIscn23eWbnwtA=
=xGJh
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--

