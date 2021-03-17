Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36133FA82
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:35:07 +0100 (CET)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdoo-0003Xj-26
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMdj6-00022G-6M
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:29:16 -0400
Received: from 13thmonkey.org ([80.100.255.32]:64846
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMdj3-00033Q-BY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:29:11 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 4EA8CC13ADD; Wed, 17 Mar 2021 22:29:06 +0100 (CET)
Date: Wed, 17 Mar 2021 22:29:06 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Win10 always takes 100% cpu power even when idle
Message-ID: <YFJ0ovLcg17WwHaJ@diablo.13thmonkey.org>
References: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
 <YFIr7YJvjGXURoRl@redhat.com>
 <YFI1tThW/xpwNOsc@diablo.13thmonkey.org>
 <YFI24wf3rg993d7H@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lONJRgUMt/CpDpdV"
Content-Disposition: inline
In-Reply-To: <YFI24wf3rg993d7H@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lONJRgUMt/CpDpdV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 17, 2021 at 05:05:39PM +0000, Daniel P. Berrang=E9 wrote:
> Possibly you need some of the hyperv enlightenments enabled too. Though
> I can't recall the precise command line offhand, as I just rely on
> virt-install virt-manager to do the right thing for Windows guests.

HuperV support/emulation is only available under KVM and thus only under
Linux, so that is not going to help :-/

My question is more on what causes this? Say a 10% to 20% cpu usage loss due
to IPI's and interrupts not working as smooth as could be is not nice but
workable, a 200% constant cpu usage that makes it unresponsive and bog slow=
 is
unworkable.

Is some interrupt never cleared correctly and constantly triggered? Is the
pauze/wait for interrupt not implemented correctly? Regardless of which
accelerator, basic TCG doesn't work either. And why don't the BSDs and Linux
as guests suffer from this?

How to trace this? Is there something I could trace that details this
behaviour?

With regards,
Reinoud


--lONJRgUMt/CpDpdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBSdJ0ACgkQgpw3AEPI
qmg3zAgAwcglEsh4frAuHTZ1VYB8pZ8pi+TmR+j8GKAZwxju9uKr7Bxfvl8vjLeq
Px4h69WX8QAuSqynmFtws0CG3wLx/gtosqNiUta+YF5cVcQs7ZmZeNx04T9exTDy
uadt4vJJVBEYZwEM66EZYIcQtqrSKnqBPurznGVrHFUOZDafA8/OESf2EDdrRnTf
9K3LPpM+6vSdWDEMTQG5/DYSTecewvy+y0ItqCM2S48fd0+gM4HBn5WopO4C0ueq
RcfdZ0Olgmt0PNIimPIyxDJBZSlkSH7FxSHJoSiWEHBtlqA4X9TDmMpL6GINEWf8
SiOrsavYUvxBjEaaiwmjvu2V8/czBQ==
=EFAY
-----END PGP SIGNATURE-----

--lONJRgUMt/CpDpdV--

