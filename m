Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE739D3AB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:53:38 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6KX-0008UO-87
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hr-0003bm-CY; Sun, 06 Jun 2021 23:50:51 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hk-0002cA-47; Sun, 06 Jun 2021 23:50:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt20Mlmz9sT6; Mon,  7 Jun 2021 13:50:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=mYiL7+HGRHdMvi7TritmoVZp1mIbao+FnfZXcNKJBjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iU3yODHllWBszQdcVVgTXI6tpyKZ90lHC2ge0hFLQZj47FkgA7mKpVcYXMKFEe011
 nqX/XYj53Tew/nYFiLTZX4D+TXG134TciKlgwTqjDGe3EgVZwzqjEU5Ijd2J7LaBL+
 qtv6XmM6KopeZ/wXOEvLa2YSoHzauT5nW3TBHCEg=
Date: Mon, 7 Jun 2021 12:23:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI
 event
Message-ID: <YL2DDOkbk+6gpjpF@yekko>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VsykvSp1eq8g+vVN"
Content-Disposition: inline
In-Reply-To: <20210604200353.1206897-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VsykvSp1eq8g+vVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 05:03:52PM -0300, Daniel Henrique Barboza wrote:
> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> as CPUs.
>=20
> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> unplug errors in the future.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  qapi/machine.json | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 58a9c86b36..f0c7e56be0 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1274,3 +1274,26 @@
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
>    'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @DEVICE_UNPLUG_ERROR:
> +#
> +# Emitted when a device hot unplug error occurs.
> +#
> +# @device: device name
> +#
> +# @msg: Informative message
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_UNPLUG_ERROR"
> +#      "data": { "device": "dimm1",
> +#                "msg": "Memory hotunplug rejected by the guest for devi=
ce dimm1"
> +#      },
> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> +#
> +##
> +{ 'event': 'DEVICE_UNPLUG_ERROR',
> +  'data': { 'device': 'str', 'msg': 'str' } }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VsykvSp1eq8g+vVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9gwoACgkQbDjKyiDZ
s5KHDA/8DEKArfmHskHudLGbSUoZI0ykU9fvCmlzXeLY+litQZ8ZRb/uqilYKnW/
waCxb8oJ2afuynFKH8hZ5brfKJz8I+gqyGr8CIjvTV3ffJ1r8Ki77Z13ZV9soxvS
SnoVbzgxcx4SpYfJYOfkIlceWt/01MBMbpjl5tBjbuNSH9Pra97RVQqaOnLZitej
cnjgXuz3KhaHLIPMdhzocddZqwtBqE843zC9ZKkTGI/GKfaQ8vTMMeE9WVelZFJT
MpougBRvUYS9DPi7XbHd1xwq3eYQW2+7BjtoEnbDkYYbDDgpySMI7MODh/B52fYD
SionyOTHJwWzbSMaBag68d7PwEbsyrrvSoE3d2zxuoLYWZYBmOZoZV2k5lIVvq1C
ilhmZ5L0biqO6u/wlWayUzlGCBV5B4RqUigFR1ZDVVIJwscVooIOz7oesDRKZzY6
rqpBCb11USs+wFwwLQM674qsK+S/ZE0ZxTkIop1KO3UyzQPsuCx53t15XbKG5iB6
gzqQg4LXIbgvpC5EV7nm2CVdbDOU+gXX0eEsW+wgCDCmVISpBgdQmtxaBu4AH+qT
notBN8uX2S+O9+dmeRNswFXXs7dNVTwBxA/SYrJVMruhVtzzKOxRRsVmuMY/jWSQ
+h9YpYXvYt6QQAP2yPWxPd5iRRT447uMibPlSDZKFOue0UuFdR0=
=7oHl
-----END PGP SIGNATURE-----

--VsykvSp1eq8g+vVN--

