Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE343F6E40
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:22:28 +0200 (CEST)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkQf-0004sb-RI
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGh-0000kX-8K; Wed, 25 Aug 2021 00:12:08 -0400
Received: from ozlabs.org ([203.11.71.1]:46081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0007UI-4w; Wed, 25 Aug 2021 00:12:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbv1DBSz9t2b; Wed, 25 Aug 2021 14:11:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864699;
 bh=ux8aE5TyqLn91N9kT9I1KUZNy7QIHEWuCUabsrZJuEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9hqAzn0pYB+NRRBHoB+5aRA6sEUtBf83FimOot0CkPiirjw2G+hqs6ovV9BMy4Uf
 7oLKC3anPchcPsQeGYSPn/on0xU8db9+FnIUCbOT+S3EzRrUF/wAYX172PFR5DiOGu
 +C3I8QIEDBQY7nkdjz80aRWUBL6h+HrMyQddTvbc=
Date: Wed, 25 Aug 2021 13:53:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
 QAPI event
Message-ID: <YSW+tnFLmKKfLYl9@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F0duiL92mS4/K8TB"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-6-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--F0duiL92mS4/K8TB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:33PM -0300, Daniel Henrique Barboza wrote:
> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> as CPUs.
>=20
> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used by all
> guest side unplug errors in the future. This event has a similar API as
> the existing DEVICE_DELETED event, always providing the QOM path of the
> device and dev->id if there's any.
>=20
> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  qapi/machine.json         |  7 ++++++-
>  qapi/qdev.json            | 28 +++++++++++++++++++++++++++-
>  stubs/qdev.c              |  7 +++++++
>  4 files changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d438f1c8d..1a8ffc9381 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, =
which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
> =20
> +
> +QEMU API (QAPI) events
> +----------------------
> +
> +``MEM_UNPLUG_ERROR`` (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
> +
> +
>  System emulator machines
>  ------------------------
> =20
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..cd397f1ee4 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1271,6 +1271,10 @@
>  #
>  # @msg: Informative message
>  #
> +# Features:
> +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_GUEST_ERROR
> +#              instead.
> +#
>  # Since: 2.4
>  #
>  # Example:
> @@ -1283,7 +1287,8 @@
>  #
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
> -  'data': { 'device': 'str', 'msg': 'str' } }
> +  'data': { 'device': 'str', 'msg': 'str' },
> +  'features': ['deprecated'] }
> =20
>  ##
>  # @SMPConfiguration:
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 0e9cb2ae88..8b1a1dd43b 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -84,7 +84,9 @@
>  #        This command merely requests that the guest begin the hot remov=
al
>  #        process.  Completion of the device removal process is signaled =
with a
>  #        DEVICE_DELETED event. Guest reset will automatically complete r=
emoval
> -#        for all devices.
> +#        for all devices.  If a guest-side error in the hot removal proc=
ess is
> +#        detected, the device will not be removed and a DEVICE_UNPLUG_GU=
EST_ERROR
> +#        event is sent.  Some errors cannot be detected.
>  #
>  # Since: 0.14
>  #
> @@ -124,3 +126,27 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_UNPLUG_GUEST_ERROR:
> +#
> +# Emitted when a device hot unplug fails due to an internal guest
> +# error.
> +#
> +# @device: the device's ID if it has one
> +#
> +# @path: the device's QOM path
> +#
> +# Since: 6.2
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_UNPLUG_GUEST_ERROR"
> +#      "data": { "device": "core1",
> +#                "path": "/machine/peripheral/core1" },
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
> +  'data': { '*device': 'str', 'path': 'str' } }
> diff --git a/stubs/qdev.c b/stubs/qdev.c
> index 92e6143134..28d6d531e6 100644
> --- a/stubs/qdev.c
> +++ b/stubs/qdev.c
> @@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
>  {
>      /* Nothing to do. */
>  }
> +
> +void qapi_event_send_device_unplug_guest_error(bool has_device,
> +                                               const char *device,
> +                                               const char *path
> +{
> +    /* Nothing to do. */
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--F0duiL92mS4/K8TB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvrYACgkQbDjKyiDZ
s5JT0RAApSdGmcK9EkGrPKiQadSTz/vt8h0tmdK9UXVH+rWtDW1LpFIvrKXCZcq0
8mO5tppJITLR2o5nE7omFBRhGGzzHpl0XARFYCP+Euzf3CPss8PkJ1QOh3p125tC
wInkWdswZcCTwS87ZyWL32Sztu28hgeio8t5JbIMmR7HqVXj/NfhFiSnivo37of0
I+yiKeQTptkturSNLnmOh2cC959spTvYLs9shkggMvbJCMdzbrAMU/kzUU8K0BLi
ihKis/rI76mqEGg2IjEDJew2nlr3+gfUH0PRG4ZbkQ9NlF2ICQZnEzXxLeH8X4RU
0JIRt4fZqOUPO6oG7D124Zdw6ydSDtyEtCaxut2Kye0p1F0MrGoAeV/rdnHpDBFm
tuPL3gbdIlfaYHKdmdb8rrbfF/ekPJamNanPKiDyQxPxpaa5hT5OSjLRySbRkT4a
FroM9tWTI+ON9Ev/qn2zP5YbeY5exdTSzdHJUSmJji3qPgvqYurLmvehiAJl5ucM
MzddlNRV11hSEa1lovClVmnt1KG7+uw8fuLVLaFboCH5lSY78xHINvqqBAaUGh3P
yBakvIIEL890wESgRBQBGvaA71VOiR+1FGwwFoSeQVa6mgxof7Us/U+J2RPka0gg
G8nn9Sx1BSYupTrKNRbwggdZzVL6H5XYDn2YSru1wIMMFjDFFkM=
=KJE+
-----END PGP SIGNATURE-----

--F0duiL92mS4/K8TB--

