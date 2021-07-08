Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04623BF38D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:26:37 +0200 (CEST)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IoG-000167-GC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1IX2-0004K0-Hb; Wed, 07 Jul 2021 21:08:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1IWz-0000gu-Pd; Wed, 07 Jul 2021 21:08:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GKypn30Mwz9sfR; Thu,  8 Jul 2021 11:08:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625706513;
 bh=BDYRfh3J7xnk4TR0+XhIKsOiE5qp4hIeZVd4xSG+wKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ScETA7f53NxABbn/eK9LSb1Wx4KQDpBqyaXckRumYEbvvwRp9WmatjVVCcE/MwIuz
 3RtdJfcemjsykPHnven0aRkJ1Jg2byN78kZ4GBpjEhxGPCz9N4bnEdB1qyt5ztuhHP
 MujY6Es7HnkI6Uhh1uobjE352SQ10JMAbE+N+zzE=
Date: Thu, 8 Jul 2021 10:49:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 0/3] DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YOZLkVgR5WU0Qe/Z@yekko>
References: <20210707003314.37110-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TNHftULo8bGDxk2l"
Content-Disposition: inline
In-Reply-To: <20210707003314.37110-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TNHftULo8bGDxk2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 09:33:11PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version is rebased with current master (9aef0954195cc),
> hopefully an adequate format of patch 1, and David's R-b on all
> patches.

Markus do you want to take this, or will you ack and I'll take it
through the ppc tree?

If you want to take it then, for the ppc parts:
Acked-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> changes from v3:
> - patch 1:
>   * fixed format
> - all patches:
>   * rebased with master
>   * added David's R-b
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05842=
=2Ehtml
>=20
> changes from v2:
> - patch 1:
>   * moved DEVICE_UNPLUG_ERROR declaration to qapi/qdev.json
>   * updated 'device_del' description
>   * added 'deprecated' notice on MEM_UNPLUG_ERROR
>   * added MEM_UNPLUG_ERROR 'deprecated' info in docs/system/deprecated.rst
> - patch 2:
>   * send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> - patch 3 (new):
>   * send DEVICE_UNPLUG_ERROR in acpi/memory_hotplug.c
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01304=
=2Ehtml
>=20
> changes from v1:
> - former patches 1 and 2: dropped
> - patch 1 (former 3): changed the version to '6.1'
> - patch 2 (former 4): add a DEVICE_UNPLUG_ERROR event in the device
>   unplug error path of CPUs and DIMMs
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682=
=2Ehtml
>=20
> *** BLURB HERE ***
>=20
> Daniel Henrique Barboza (3):
>   qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
>   spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
>   memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
>     acpi_memory_hotplug_write()
>=20
>  docs/system/deprecated.rst | 10 ++++++++++
>  hw/acpi/memory_hotplug.c   | 13 +++++++++++--
>  hw/ppc/spapr.c             |  8 ++++++++
>  hw/ppc/spapr_drc.c         | 15 +++++++++------
>  qapi/machine.json          |  6 +++++-
>  qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
>  6 files changed, 69 insertions(+), 10 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TNHftULo8bGDxk2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmS40ACgkQbDjKyiDZ
s5JWVBAAkQSsZDtYhhN+lNMg2GnNO3pM8tiMciNyEW8eEmVoWtyNZdvkYIRvZYn6
iDp7rRKm8ppxEcFrCbMgJqQtHSb4q54JRK02VN7oZAU2N56l5n8ktZ3SStdU44UR
fvlGS8mDlcd5t1dDnlirhADCyPzZPoD+FljsQ1TS4vHMY0sPHeOK4+JfzV4bMBEs
2afvtbLY53pTQ6SSodZGy0GfTSl9JNW9er9DpDY3y+VLxKw42T3ncGl28HfIVL4K
oVITl/+Ip+sj7ZkNU98UEbLvwrr5Ci2m9ZZd0cJv0pY2ay2401jsg7ulMnF4e2hV
C3+VXS4yfodUyFx/fq4mHcg2Y1w1ulpfH+PJSv0CWaVNXHjT3msSl2ezJbdKZNlU
wuxAGI4D+mohUi5qcks0kskmUEkpjA4odNAjL3o9mJNLf0MO4B+3+E9zbzi8khQ9
P7DMz2ZIKCdlPUDOzO1CzF4As9KXdj3aXPuEDyL5zlrKlw1XZsJpyTECpayMIX93
sqa+1KQsvAcjIeBHfw3sdpG+COT73MTVSUipnH477knjnqhBHJgehqGx/o/nTnPQ
Jkxen4MxpTu+okuCCTpXwMM8plANQpXxsUO6Yxkyd/T2i3a92sInWBFPfqsJK7+J
ZUkwHpPrVACs37vNKrpkvEnNpySWLrxZ7aUcKX8VQxh4ZfUMEzY=
=9axu
-----END PGP SIGNATURE-----

--TNHftULo8bGDxk2l--

