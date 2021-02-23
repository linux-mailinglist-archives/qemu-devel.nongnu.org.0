Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4163224F5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:44:15 +0100 (CET)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPYU-0001md-5Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWZ-0000H2-Lq; Mon, 22 Feb 2021 23:42:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58509 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWX-00058l-68; Mon, 22 Feb 2021 23:42:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl5xX0NY7z9sVF; Tue, 23 Feb 2021 15:42:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614055328;
 bh=t11N6CehHckOupi/Zupds8DSTWicTcUit2wzkZ4gVHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JRGRChuykt3MufJ9R+UGPBengqn73+14MIL0XeJ8111GwqIEeFf0Kg4wZVf7WxMrd
 CBhkElQQAHMc6Wv15a2EiJCZhs7xTdhMfp87gFS7Ws6bk/WbfcY+lcZlgs3pWk+W1Z
 HDN9BaQU8Ajo9GmyuuwDEv6aF14yLKGa/U2U5xNU=
Date: Tue, 23 Feb 2021 15:31:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 0/5] CPU unplug timeout/LMB unplug cleanup in DRC
 reconfiguration
Message-ID: <YDSFM60EXaBQfkdZ@yekko.fritz.box>
References: <20210222194531.62717-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8O8Yd/BisecLF5Zs"
Content-Disposition: inline
In-Reply-To: <20210222194531.62717-1-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8O8Yd/BisecLF5Zs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:45:26PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version contains fixes proposed during the review of v3.
> Patches were rebased on top of David's ppc-for-6.0.

Applied to ppc-for-6.0.

>=20
>=20
> changes from v3:
> - former patch 1: already pushed to ppc-for-6.0
> - former patch 2: dropped
> - all patches: commit message trimmed to < 76 chars per line
> - all patches: added R-bs from previous review
> - patch 3:
>     * removed the migratable state of the unplug timer
>     * added a 'spapr_drc_start_unplug_timeout_timer()' helper to start th=
e timer
>     * added a .post_load implementation to vmstate_spapr_drc, pointed to
>       a new spapr_drc_post_load() function
>     * spapr_drc_post_load() starts the DRC unplug timer from the beginnin=
g using
>       spapr_drc_start_unplug_timeout_timer()
>=20
> - patch 4:
>     * use spapr_drc_start_unplug_timeout_timer() to start the timer in sp=
apr_drc_unplug_request()
>     (To David: I kept your Reviewed-by in this patch despite this change =
- feel free
>      to review it again)
>=20
> - patch 5:
>     * removed the 'DIMM' wording when referring to kernel internals
>     * move the g_assert() to spapr_clear_pending_dimm_unplug_state()
>     * do not g_assert(dev), but g_assert(ds) if dev !=3D NULL inside
>       spapr_clear_pending_dimm_unplug_state()
>=20
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04196=
=2Ehtml
>=20
> Daniel Henrique Barboza (5):
>   spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusable
>   spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
>   spapr_drc.c: introduce unplug_timeout_timer
>   spapr_drc.c: add hotunplug timeout for CPUs
>   spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state
>=20
>  hw/ppc/spapr.c             | 53 ++++++++++++++++++--
>  hw/ppc/spapr_drc.c         | 99 +++++++++++++++++++++++++++++++-------
>  hw/ppc/spapr_pci.c         |  4 +-
>  hw/ppc/trace-events        |  2 +-
>  include/hw/ppc/spapr.h     |  2 +
>  include/hw/ppc/spapr_drc.h |  7 ++-
>  6 files changed, 142 insertions(+), 25 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8O8Yd/BisecLF5Zs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0hTEACgkQbDjKyiDZ
s5IodRAAlW6OBKPrHDHwQBpcFisbUMKdzCGdFxGsRdBKGW2idqZBKrIvX0gty4vi
kD1R7Q98IV7WCt/qwZKjWMFQqaShECgLY6K1metGFU0hbxtS6rcBUz7ubIbaATrj
x8Rqo1U6ccLdA5r31Eyzasqn8b9zahOzQdrLbVO14t3pvdV0cY7irxMrwG6eVb7M
5zc4ZjSD8Trb8P6T7g2ykXs4i0helxB/l/tuOvi9RIKPyUfcApD1YG5BN7R2NU8d
IVBTBhcPUlVzo4aK0QiUYEPjkOXtlEQU6DKHnlcEWGlql2Zu/pa3Ag65xZxNLq5Q
bLPiToLN0UiP2laeICMQJ/9ZW57MnEJNXHQ8asCM4Q6hGdezfgDuewDYjNXqrkkU
1qnjeV5GTkFGMswg+BQ029yKj7t6xp0cotPzp2KvAqtYmgTrkgEJVfzn+6ejvhSM
OsqxrxwPtPAqMjHwRVOyxjNd58RlDd/1KyBaXBltM39ESoCbtOsis5cTYJjfqzKA
aOG3AwYBlbwt8IJCZ65U84xoTXum7NoyIM7a54/axt8F+cTK3b4VMvQvjJjhdJUp
vJOdeGivE30Skp/stANMS8XkbXK46rtEQnh5HpxozbaG+pr1VenzvuXAouOu7tbw
fTSMuAh2NXOyxr+/s12q7y/c6KLflPOAhX8TG6FmA/gnjja1MEI=
=VOOO
-----END PGP SIGNATURE-----

--8O8Yd/BisecLF5Zs--

