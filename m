Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0763F7FAF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 03:13:30 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ3xQ-0005u0-BA
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 21:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJ3bJ-0000ie-6C; Wed, 25 Aug 2021 20:50:41 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43099 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJ3bD-0001hq-Vm; Wed, 25 Aug 2021 20:50:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gw45F0WMhz9sjJ; Thu, 26 Aug 2021 10:50:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629939025;
 bh=I+CMNLdu4oJzzaQvFJgU0w8NORALCZfXAvWUU8KHXIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mTPsLQBlyMjZujqUH/zWTYmVmYFhzcgazKV+Q4Cv8T1UHQcwyXYxKjWzgLNuHZy39
 rtYbA/isjdOITv07z+zjDz+eR/VKZWOlrvY05Kn/WMkcT/ney5t0eBInVZNjrNP5Jt
 HfGJgbr2dp0gI1AhLEPINQxml6j2vpRpYwBVAGkc=
Date: Wed, 25 Aug 2021 23:35:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Paul A. Clarke" <pc@us.ibm.com>
Subject: Re: [PATCH v2 02/16] target/ppc: add user read functions for MMCR0
 and MMCR2
Message-ID: <YSZHDLP7qSSYvOBU@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-3-danielhb413@gmail.com>
 <YSXHU2NJbJpI6spA@yekko>
 <20210825122510.GB1113121@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rf7ljvyfhaj1LGkn"
Content-Disposition: inline
In-Reply-To: <20210825122510.GB1113121@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Rf7ljvyfhaj1LGkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 07:25:10AM -0500, Paul A. Clarke wrote:
> On Wed, Aug 25, 2021 at 02:30:11PM +1000, David Gibson wrote:
> > On Tue, Aug 24, 2021 at 01:30:18PM -0300, Daniel Henrique Barboza wrote:
> > > From: Gustavo Romero <gromero@linux.ibm.com>
> > >=20
> > > This patch adds handling of UMMCR0 and UMMCR2 user read which,
> > > according to PowerISA 3.1, has some bits ommited to the
> >=20
> > Nit: One 'm' in "omited".
>=20
> Let's trade that extra 'm' for a 't', FTW:  "omitted".  :-)

Er.. yes.  Muphry's law in action.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Rf7ljvyfhaj1LGkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEmRwoACgkQbDjKyiDZ
s5JS2w//eFPX+cueuy2LZL+w+tRdHKZM5YT2yo8Kisz+dt8fAhZih/XJr+dpEpgW
GPTIBgaQ0LCbbE0+xV51/gk9BaOH/FF9uyaQYHnCDHBwwaq9yPxcip6KIaOUcKKw
ETa86VVoncPw4hIhz5gfQ+Mw1fK15C08IiSmDVGFn8nck6wu6YL6jzx3GvvQOeV3
b5MQNLQKD4LW9bPC3ooL6Hh6G608H3YPs5lan7GQsTI/Q+PI8zyXb5KIocFhOyjh
C7T3lwek9rg/nHTEF/WRbsmK3pvo7E3kVeOh5go6YVF3YTOTY9K1NZ4cckWRoxPC
skdEB+VGd6WVTtCjacPGksPkgW53+wdujYrpnN8oeb08IRb866E7/Y5oXiQR/07s
OJ1HntomeBgM5+eZ0wfTqIGZi0N+Lidch8L+B1Kv/mlTVL6RhKThp8uYkXb2Q6+A
qbP3i0cadogqgMqlV9soSBkpkkLSqTzB97OzaCyBl7TPyfbT4o4VM7kQxHxRHXPO
eDV/tQIFAuakRzODk2MqkmtwjEiebDu/kuUUUnsLsDkc7hu/BlrVb6FAsjxZ8eJ9
QLanyWs3BnVMQ7behjNdq6rhPskGBI+s4zIdPdjW71tP51wFsxJbF6KLnP5x8dJo
SuVjSbdqF9XHExZG5fK3Wwv/nfCp6tW96s+gnVMWxd86JhZf0Fc=
=NHbw
-----END PGP SIGNATURE-----

--Rf7ljvyfhaj1LGkn--

