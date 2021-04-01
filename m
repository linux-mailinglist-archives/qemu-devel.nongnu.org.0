Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FF350E1A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:32:06 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRp01-0000Db-9c
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRoyu-00088H-Ic; Thu, 01 Apr 2021 00:30:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53013 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRoyr-0002D4-FE; Thu, 01 Apr 2021 00:30:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9qxL1GMrz9sWF; Thu,  1 Apr 2021 15:30:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617251446;
 bh=EZUv+EJQ1QATvYanC1K6159Y7gdkfI6GYJxbbojOrDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bh5PnL7JRLV2T/7fVFdX8FgLtHLR3UZQ5qVXgnLHIbt65AX7igRsCoLYKhRB64epm
 SPcnOGwoUtqfV+jkvHLlzUuugj6udXwzTPHdAffvwAVr8dtwp+ilNKiAiZgxu6gXe0
 pKAwSpjY3zbOvjkPL3JkqvlDt5QZomITuvTUrkjs=
Date: Thu, 1 Apr 2021 14:17:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <YGU7MKPDohqmDfdF@yekko.fritz.box>
References: <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
 <YGO9oklIrjN7O0f2@yekko.fritz.box>
 <20210331060427.16984110@bahia.lan>
 <YGP+3m96lwZrMxwU@yekko.fritz.box>
 <962e1ff8-50f8-bea6-7aab-850a16ede116@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aAVdPbqhL9qQEENY"
Content-Disposition: inline
In-Reply-To: <962e1ff8-50f8-bea6-7aab-850a16ede116@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aAVdPbqhL9qQEENY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 11:31:25PM -0700, Richard Henderson wrote:
> On 3/30/21 10:47 PM, David Gibson wrote:
> > Richard - the remaining possible problem with the hflags stuff seems
> > to manifest with the assert failing in the last patch.  However, I'm
> > guess that's just exposing some more subtle problem introduced by an
> > earlier patch.  Any chance you could re-order the series to insert the
> > assert near the beginning, which might give us a better way of
> > bisecting if this shows up again.
>=20
> No, we begin in a very sorry state.  Every one of the patches reduces the
> number of bugs with hflags.  If we put the assert anywhere but the end, it
> *will* fail.

Heh, ok, understood.

> If you can get the assert to trigger again, we can work out where the next
> problem is hiding.

Ok.  *fingers crossed*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aAVdPbqhL9qQEENY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlOy8ACgkQbDjKyiDZ
s5Llig//bFHUkwajDCB9WgOdIyy3PsjkpuaOxpoJzJFCgnZkLGr6fakqtFBZyPsM
zY4Xw1JxiCXkm5MFGi3Jv+Z1UeR2+7czFzG0BF2CpWihkdCxTK39O2TGLrLYZZ3b
Aho5KipersFVSq8f5wiSS88bgMZ94Hnc3mroUdH0sIDszHGDSBOf0cTJ/UOvZ15C
Dnq3oHwGTDZJe/0QX+/zzOuAg7v4uObyk0lG0O0E51Ax588q3ZzU4T4fGWzqmWAm
3UQdtsbwZ4uCrLGAHspMjeouGV/QlPX8dpCiMUM6P5RBH6Xz4qVoCeTnfe3IcJPm
5SNrrRCpxn+U68ZIQerekKPrHbsJbe+maxtDubw4hDydgsqU99puWV83PozoTnJc
r15PIHtbUJ2c20XKOc2G4W7p9xFq0MF79ESu3dYi8FqxOe5vmgYvUe3Xo8PKYrZv
eoXTOh72OIE6Ty1AbeSW7xK3RsrisuiCCBeiP/CrXbQGTIZNTrycD7ofbqNuqDxG
bEMre2xoj9DXEr+M002vcpdMIV1Jqm0kbk/y8cf6Z8LRj+1FDPWC2XiCJJ1k5vPH
tFBJb+8RHJf7GR1rWPB+zPtQluiK5kvy9m/NfD7TqnqbHgo/aXx1WEFURHmJh5/S
Bw1wX8zZiD/Kjzz9T/YN7N+97ktL5Y3Y/bkDqPYprRW8TOJbzJU=
=+kes
-----END PGP SIGNATURE-----

--aAVdPbqhL9qQEENY--

