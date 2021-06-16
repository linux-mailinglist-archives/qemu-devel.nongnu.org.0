Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A403A90F1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 07:01:26 +0200 (CEST)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltNg5-0003pm-8f
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 01:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltNeL-0002Ps-5S
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 00:59:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41341 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltNeI-000504-JG
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 00:59:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G4XzJ3BSQz9sXG; Wed, 16 Jun 2021 14:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623819564;
 bh=NJ1havyXoXrvnqtIGK5sIAXNtH9Yfdt1Btxu7gD4/lA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WIRNUITQl7VLBFvjpKpjudktMZKaMnvKMsfUxbjMRIlGfknUGTsWM625bpqBlxHtC
 DpVAy+swhi5/0zaa9jWDko+kUOr7eultNjeOUZ+cYVnNFjye2t9+vPSR/ltXLJ+ayT
 12xdVVCz/BmD3m/hENFGI+pJF+X5mjm2pNxYdb90=
Date: Wed, 16 Jun 2021 14:38:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os,
 and accel labels
Message-ID: <YMmATetQ5oAEgZtb@yekko>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <YMgLha7YL8XYrShS@yekko>
 <88526829-d341-6e72-2bde-7694835599b7@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MNAIih1XN18XhPUt"
Content-Disposition: inline
In-Reply-To: <88526829-d341-6e72-2bde-7694835599b7@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 John Snow <jsnow@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MNAIih1XN18XhPUt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 03:56:46PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 6/15/21 4:08 AM, David Gibson wrote:
> > On Mon, Jun 14, 2021 at 01:32:11PM -0400, John Snow wrote:
> > In general, what's the convention when a bug is independent of (say)
> > the accel: does it get none of the accel tags, or all of them?
> > Likewise with OS and the other categories.
>=20
> None: remove the label. Otherwise you'll notify everybody subscribed
> to specific labels.
>=20
> >> We probably want to keep a set of labels that apply to the host
> >> architecture. These are useful for build failures, environment setup i=
ssues,
> >> or just documenting the exact environment on which an issue was observ=
ed.
> >=20
> > Ah.. that's another general question.  Are the labels supposed to
> > document where the problem has been definitely observed, or a best
> > estimate at where it will appear.  It would be very common for a bug
> > to be observed initially on only one, but quickly turn out to be
> > independent of host and/or target arch.
>=20
> Similar. If the problem is generic, remove the specific labels.
>=20
> Regards,
>=20
> Phil.


Understood, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MNAIih1XN18XhPUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDJgEsACgkQbDjKyiDZ
s5IRlw/9FLPwNz/KbwDRDUgjh719iZ536SDVaex5E0hyss/lcSITw6R+ltqAs1hv
ogckuQnZi5vMSA2EwWEMfC26KjIrmtd5RUQY8w6q+6RUZHbmbzxZEkuU4/PiLzEN
8g7+vB9YQFTvs+bfROnCEYVnhjtVpBI1dhk8U0zHnYTsnIsZTm/w/8MeMv8M1wDs
laI2TFhUDVAFtTl/rGZn+YkGkaGlrlunSGuL2V45sqNO9tFJf7tHBstg8jRXIXZe
TJg5DzgtncH/DQrJhkgpEQFJELwej2UDWG1rkDjU8vQHJV83nHw8FGZQRcknbni6
pcinwp8QveK5Ds4zBXJTw4rn22N9ZSAyUCyoRcU/dAkVjg7/im0GLHal18tujcIQ
275IBV5Xip4DTmC7lwMK6+haX9H8a2C/6VXn7/E+egCGIjENLV9z0Ma83ih5l8Ue
BEM4vJQ1N/MxnoemzNfpU72sbW9Pjp9myR68SJh+vvnpiAFk9Ear7cn+mJI4X3Il
9oYWTN62L72mgf+kZ33D35k5D9yk0ENig3h5xim9/vThkVcLs3O0z6Q6pbanr8Yu
LLri3ng72k+Y1SAbPAdgqKHWsuBYDJGgJyR+xK/awABvwBLqxvE/NYYPCcicHTsv
0arKEdbqeCpU0Whh/0fce5QoOaaupEFnhffM1STe/TprxrnMzY8=
=GPPa
-----END PGP SIGNATURE-----

--MNAIih1XN18XhPUt--

