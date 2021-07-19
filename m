Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC73CCCE2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 06:11:08 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KcV-0007hD-Hb
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 00:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KYy-0006nL-IO; Mon, 19 Jul 2021 00:07:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39991 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KYw-0002ak-IN; Mon, 19 Jul 2021 00:07:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSpG25sYyz9sRf; Mon, 19 Jul 2021 14:07:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626667642;
 bh=lXZlLoOtboIySfWpMyobrjhaCVf4jQkXbJrgaNkNv3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CDFQiXfdrzZmCog1wshz0pgZQ5eWo9IQpsRnQdkvJjwEL1lP/hmk1AjaKsEhfVmO/
 DrlCIafhUS75vq1K6yFo9amSNdhdle9LsuSHOLk2jdaYlekdw1Bd4t+L5KcLTEj5xZ
 Ea1/mocKYFsfnIs/j+IAqGWqEoEwm50xPHG0m4JY=
Date: Mon, 19 Jul 2021 14:07:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 5/7] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YPT6dpR/32HOT5zc@yekko>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U5dMvTQCo/d7yHix"
Content-Disposition: inline
In-Reply-To: <20210712194339.813152-6-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 eblake@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--U5dMvTQCo/d7yHix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 04:43:37PM -0300, Daniel Henrique Barboza wrote:
> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> as CPUs.
>=20
> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> unplug errors in the future. This event has a similar API as the
> existing DEVICE_DELETED event, with an extra optional 'msg' parameter
> that can be used to explain the reason for the error.
>=20
> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

This no longer applies clean for me - looks like deprecated.rst has
been moved.

At this point I'm willing to queue this tentatively for 6.2, but I'll
need a rebased respin (and fold in Greg's acks, please).

> ---
>  docs/system/deprecated.rst | 10 ++++++++++
>  qapi/machine.json          |  6 +++++-
>  qapi/qdev.json             | 30 +++++++++++++++++++++++++++++-
>  stubs/qdev.c               |  7 +++++++
>  4 files changed, 51 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 6d438f1c8d..c0c3431ada 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
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
> +Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
> +
> +
>  System emulator machines
>  ------------------------
> =20
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..a595c753d2 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1271,6 +1271,9 @@
>  #
>  # @msg: Informative message
>  #
> +# Features:
> +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instea=
d.
> +#
>  # Since: 2.4
>  #
>  # Example:
> @@ -1283,7 +1286,8 @@
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
> index d1d3681a50..52c36c7b9c 100644
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
> +#        for all devices.  If an error in the hot removal process is det=
ected,
> +#        the device will not be removed and a DEVICE_UNPLUG_ERROR event =
is
> +#        sent.  Some errors cannot be detected.
>  #
>  # Since: 0.14
>  #
> @@ -124,3 +126,29 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: the device's ID if it has one
> +#
> +# @path: the device's path within the object model
> +#
> +# @msg: optional informative message
> +#
> +# Since: 6.2
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_UNPLUG_ERROR"
> +#      "data": { "device": "core1",
> +#                "msg": "Device hotunplug rejected by the guest for devi=
ce core1",
> +#                "path": "/machine/peripheral/core1" },
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_ERROR',
> +  'data': { '*device': 'str', 'path': 'str' , '*msg': 'str' } }
> diff --git a/stubs/qdev.c b/stubs/qdev.c
> index 92e6143134..ffa8f7b59e 100644
> --- a/stubs/qdev.c
> +++ b/stubs/qdev.c
> @@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
>  {
>      /* Nothing to do. */
>  }
> +
> +void qapi_event_send_device_unplug_error(bool has_device, const char *de=
vice,
> +                                         const char *path,
> +                                         bool has_msg, const char *msg)
> +{
> +    /* Nothing to do. */
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U5dMvTQCo/d7yHix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD0+nQACgkQbDjKyiDZ
s5IdtxAAsrKIfhO5r0hfWPYFm4EPfW8vaXedWMsa1WyvT7ypn7OAsCLeGCCSXl5+
c2QpB6BJu8c9mOVow8qg5eE2sE/vgo09WOvenZSyfwjSDvJSBGKjIAApBVKC0WJR
R7DTB94J51M42TXeNv18JTrDJO3fWlR/vgvMIdNilLCsVi8vFc7n3ATDGzqi7hTT
sXQLt5L153gRz4o9pOy9wJmUi3yvLJpX0OXCl4kfGXgvxXReCroF30lAtYt7Dl3d
N8Bf3vr6Fy50q4Pckd42/lpZ/fP7Xj7Oi3OdTQrtBsiNeDTYSYuYVmuEWAPDf4E5
Y0xt46i2TjdAMn0fKUoKR+pX9hs2P6TXiHSrv0ACY/DpnyPRp6+R6bWDsRahk/Fh
DXcgRXBzB3uHHJ85bXDXJnwm1Un5I4KS73fu/LO7h6USeqsgMYu915jMFjxLPIGF
H/mhR211+44p99SqBUAtawMlG5QF0De+Db5Lr9eFlYoIgSv0c8p3tDRWgVNSEqzs
eDDWvaF5WIJSRqsZOHP1gdELwQcWT1BKuMFBBSpd7e2jAUxhp8QcYSwhIJajD0HG
0WM6fvf/QaeKR8ziwHPj9uB78tuNUSI/rbkFUhEZCg7V21KDcD0Oq51+LroT13pO
pJSkurxTdZQOUuxGrLYohPUnSrzxbzwym10anPWSJ1enzgA0J/0=
=sRMu
-----END PGP SIGNATURE-----

--U5dMvTQCo/d7yHix--

