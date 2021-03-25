Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1553486B0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 02:53:43 +0100 (CET)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFBu-0002AB-NL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 21:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFAp-00014Y-Oj; Wed, 24 Mar 2021 21:52:35 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50523 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFAm-0007a7-S0; Wed, 24 Mar 2021 21:52:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5Slt3Qf2z9sWX; Thu, 25 Mar 2021 12:52:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616637146;
 bh=wqbuhJ6jHsElSix/fTSR2rOAX+XtGAGO1nJN4Fj/xUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LewSEbf6ixLGHIZkeeMCf35r3U6EyG4kVTksZ+i1aivjbhho/Vhlxe/g7vXKfuf43
 yQH15J7IQtPnQ9Pl2J4gC8xjg8vYb2yyiMUwTrH2EMDWRCwoRv9Q+BLhBFN2CghdHU
 zndU320sHvePfHhKeKF2+uIkNg+KGoJIZ9XcN/bg=
Date: Thu, 25 Mar 2021 12:32:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YFvoP20SkpTrp6pQ@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qOOv7PlkpAyY/Pc7"
Content-Disposition: inline
In-Reply-To: <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qOOv7PlkpAyY/Pc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 04:09:59PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/23/21 10:40 PM, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 3/22/21 10:12 PM, David Gibson wrote:
> > > > On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza w=
rote:
> > > > > Hi,
> > > > >=20
> > > > > This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> > > > > DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in=
 [1].
> > > > >=20
> > > > > Patches 1 and 3 are independent of the ppc patches and can be app=
lied
> > > > > separately. Patches 2 and 4 are based on David's ppc-for-6.0 bran=
ch and
> > > > > are dependent on the QAPI patches.
> > > >=20
> > > > Implementation looks fine, but I think there's a bit more to discuss
> > > > before we can apply.
> > > >=20
> > > > I think it would make sense to re-order this and put UNPLUG_ERROR
> > > > first.  Its semantics are clearer, and I think there's a stronger c=
ase
> > > > for it.
> > >=20
> > > Alright
> > >=20
> > > >=20
> > > > I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Do=
es
> > > > it really tell the user/management anything useful beyond what
> > > > receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?
> > >=20
> > >=20
> > > It informs that the hotunplug operation exceed the timeout that QEMU
> > > internals considers adequate, but QEMU can't assert that it was caused
> > > by an error or an unexpected delay. The end result is that the device
> > > is not going to be deleted from QMP, so DEVICE_NOT_DELETED.
> >=20
> > Is it, though?  I mean, it is with this implementation for papr:
> > because we clear the unplug_requested flag, even if the guest later
> > tries to complete the unplug, it will fail.
> >=20
> > But if I understand what Markus was saying correctly, that might not
> > be possible for all hotplug systems.  I believe Markus was suggesting
> > that DEVICE_NOT_DELETED could just mean that we haven't deleted the
> > device yet, but it could still happen later.
> >=20
> > And in that case, I'm not yet sold on the value of a message that
> > essentially just means "Ayup, still dunno what's happening, sorry".
> >=20
> > > Perhaps we should just be straightforward and create a DEVICE_UNPLUG_=
TIMEOUT
> > > event.
> >=20
> > Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
> > be "guest rejected hotplug", or something more specific, in the rare
> > case that the guest has a way of signalling something more specific,
> > or "timeout" - but the later *only* to be sent in cases where on the
> > timeout we're able to block any later completion of the unplug (as we
> > can on papr).
>=20
> I believe that's already covered by the existing API:
>=20
>=20
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: device name
> +#
> +# @msg: Informative message

Oh, sorry, I missed that

> The 'informative message' would be the reason the event occurred. In patch
> 4/4, for the memory hotunplug refused by the guest, it is being set as:
>=20
>      qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
>                                   "for device %s", dev->id);
>      qapi_event_send_device_unplug_error(dev->id, qapi_error);
>=20
>=20
>=20
> We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug time=
out
> case (currently on patch 2/4) by just changing 'msg', e.g.:
>=20
>=20
>      qapi_error =3D g_strdup_printf("CPU hotunplug timeout for device %s"=
, dev->id);
>      qapi_event_send_device_unplug_error(dev->id, qapi_error);

I think that makes sense for the cases on papr.  Less sure about the
cases Markus has mentioned.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qOOv7PlkpAyY/Pc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb6DwACgkQbDjKyiDZ
s5IimRAAmgdQk2S0HGsspow4QrrjjM1dC38Mv7nYwppbP6P26OYaWlePHUu3l4uJ
q1t9dnpqqUC0FHYIg8/CsAj6ivjjyqwFJFovq7kPR/hIUIgvdfZ7IrbSOE2Zfkpq
sQI73T/HJ8YRo0zMXSMgHqN760YMeNXB0LyltEXBRyIQw342ceJabS2wG/nsEhR3
DvDtTbVS8x2dJRSiBWYe3pd6r2yCKrTT10u7yN8agq5sQdAMkNUNhtgSI43TW42f
37QUtQdIrktMLVX2cr7Ejo6ziYwyxlYwXnzO8ssk0vlSHpCvL6nDyuYTdXZfqhOW
t859aaF+D5yQOzHMFXC4sHsxj6VG+gYPqtoT+Hinu9BtUj+jXnIrpE8HGc8Lu8cy
EAYKiTsPAGyTRYMP6RjRov8BEuxy9c7WjIbx9Z/WEvp+mXzks4PKEWYjt2wZY5P4
NfqIrGSnmnsiwqXooS5hDCtRKlVz2eRp5QcKKjvH4tbRJBtijAaZUNSqLoCbX4+/
WNjEMRIkQies+VJmJ7HBJjwwG1eklBF1pvSjBeL0gayHRtzStTeZQgLQWVn3m8tX
hETrxGvIhstE8uAvEGUtDr4T2CsnDu51ueptv4gGC7CYX+P1nJhuNwHTok85+Qb5
vQAZQnEYizWIKnkDHuvzaNG2ZwPHv6W7I0c8jM07TdPDHPgJ41M=
=IaKU
-----END PGP SIGNATURE-----

--qOOv7PlkpAyY/Pc7--

