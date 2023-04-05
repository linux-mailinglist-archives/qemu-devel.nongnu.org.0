Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49326D7FEA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:46:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4NN-0004cE-Ap; Wed, 05 Apr 2023 10:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pk4NL-0004bl-O8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:44:39 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pk4NK-0001nH-0I
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680705871; i=lukasstraub2@web.de;
 bh=lBluFbhbB8wxJnfOuawF9LoqEn1U3NWmoM/EuIY5ln8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OdtxvjiJs6BNOD3F0p8RmsgOM9azAPa6dp/kR+ziAd7Tk7B2fu1oLn/GnnT/A+CLa
 CVPWq5YN93DE5qwllmdEUeo3kDkSBjI6DnVQLZb11ISDxJopdFAKPu1vEtJ3Bxbpn6
 OAdNAT3ciSX19jR2MHUiDFgofNPW+FvwEJJSpt63ePrSHda+DaBhgHw/vR/xLjDsCC
 eMCWVRPBKcp1vWVhHyacNZRkGxbzpFhmoznCssk6OYR4yhtXq/fLFmRy/21r+7Sc54
 x5IlViIXLy30jzzlgQ07JX88T+9kapg8ahPN9A1hDgvhbrDLdgdymdL9mrA64vDKu1
 oHOhls01+IAIQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.108]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79RG-1qT95X2VEi-017mMo; Wed, 05
 Apr 2023 16:44:31 +0200
Date: Wed, 5 Apr 2023 14:44:13 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH 00/14] migration/ram.c: Refactor compress code
Message-ID: <20230405144413.67f0b505@gecko.fritz.box>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1u0=RzmI/bXTIgBB87Yt2Rj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Zgl2cBtvHDJlNX3bzcpTj4eb437BE30LiTJEf1ejRj7dKJb38aM
 j0JAQAYP6Aj8Fi32TcmcQrdWnf/OIPGmLL8QjJ2CVWG3o6VIS/xZ2pzAdFmZZcYX2JkmIwN
 ANqjdnuZ823+kuQUyJt+oghFgN5cwxw878uMfGDdXtDp/FN3D2Gv4ojmo8NHRoFb/oqnu1P
 81OvrGdaP5xhkBEmGmNMg==
UI-OutboundReport: notjunk:1;M01:P0:tiQIC9G+Lb4=;fTSyzimWQTUHu1wnExsJ9j2yMjz
 +kAo2WmBGNQM3sl+2gj1PAfWp+UrGVV8uV56f/rJdDpbGSBJv9aBfm7Xc4qMwB3H94vB1wYxF
 SHbIxeKtNClCKc76g6Xsl769zkKVc4A6S42WFDu32g1VD5vWVjNCyrQLP+QSvD8U7IM+21c1p
 ferysoKP3lm16N1P/FRaeH9dX6YSZasy5ocfoTPEi3pyeNN4vC07LaKdUR43L7zEBk5j7o8KI
 Gb7PzbNnAmtWxDEBL5f4dLuCNlN58xokfVz9DuLSqJuw97JsjqyMX8JLe1orZc+49IXSd+jsM
 h4zCgXTvgU9OOua4R1RLC2OeBZos4ruRi/l1/k/faO/p+IxCKXRpkONZ1OjBJfqI+rWA/8784
 YsTyB28ekE/m+4te4pj9XEABE2x6Jt//ECMBVdsHTRfTsLGpJ7cEo2KeQBtgMgbLZvoeczV3z
 vwbANu/Fkwx4F5sOq9HoiBwTuuUt25TFy559T0kza0Zuc8fN3iDiTbiQIn8HsEvle3b6xivi3
 KBnOa9SVQ+n7DUDCFp7tkm3rbpWAslAs10n+ipAdQV7B0BlN6dz+9CCMSlIRtLlgg9K95Nmtx
 0/SZk3pNxWLQyUI7u93sz5eCfRz9tvwczHN0z7BTAyvo4X7imA+dZkWyqgLBzT9YSaToPeUgJ
 fz9U29xmsO24j08pgsOTF0CFnvCFHezZ8YoH32LORSvnXs0eknyeqoTlg1pHoVt5oc+7eBevu
 TPAt0TV1Vk6Z6nh/XDn098jQLakB5LMAG3J1rAcdroeZq9P0hq3ceRbSLtBep73Ta+6vatmdD
 lW+gx0TE16SmYlDc30As0qMzmm7Zk5AM20YLhGlp6hz0j3QWGzqm77Z/p01KS2vx+pVLkyS/w
 kl6tJ+lT0DO47DAQDRbEED6V6hUFZ0HDypVNMgi39O5bid/xQ9WYT6t9VFrDtEcqy7xDwqn05
 Rn2rMOC22qREQpeLK/wAi63PNQI=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/1u0=RzmI/bXTIgBB87Yt2Rj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 2 Apr 2023 17:55:59 +0000
Lukas Straub <lukasstraub2@web.de> wrote:

> This series refactors the ram compress code.
>=20
> It first removes ram.c dependencies from the core compress code, then
> moves it out to its own file. Finally, on the migration destination side
> the initialisation and cleanup of compress threads is moved out of ram.c
> to migration.c. This allows using COLO with compress enabled.
>=20
> This series is based on the following series:
> https://lore.kernel.org/qemu-devel/af76761aa6978071c5b8e9b872b697db465a55=
20.1680457631.git.lukasstraub2@web.de/T/#t
>=20

Hmm, I'm wondering if I should add postcopy+compress tests in this
series? Because if we start this, the test matrix really will explode.

Regards,
Lukas Straub

--=20


--Sig_/1u0=RzmI/bXTIgBB87Yt2Rj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQtiT0ACgkQNasLKJxd
sliZURAArIwauN9p3TdPA3nTyewrDIWSldLr4egjdAS7+cY24xPtpAk/aU6Mg13b
ROHXjrfyValByMx19Kyez8GateNeh9u9vUohGNH9UVOuwSloHT5OC0qd4FitBSL8
7tmh6pjhQhD4zjllBKF3v5nWCkvNxpMRFHLJvstFbTSGXs1dFdd4xXEAdjE4uouv
EfHYtysDusmqU7cFmjtf4AMvwftj1mAoVppT5X0Jg4dARFmcMCCh1gPAfjfCLowe
LfsSNJDu6RZV82VvEbMY/HbPbXT9nn85RPkSETJYh9fJU+LRllLYfK3lomTIHhtv
7W4CpvRh2snZ+vxgxpmQ+EUGoil5k0SuMXGmJlRFu7BQuPrcCiJWAmoOj71UP3Lh
U/kT49wuj3egeA3kCxDncV3FVnkmm7ttEUd9RE1HR7LwvKHuAeb0lBFp9/1YEYxB
LY7+PBBxFUDnGBF/Uar3/32ErfZFJXliznoQUAew+ZBrCNJTjZv12JOgt7APa8tS
FzMj5uxLOtvheDqm1+GBFHciQ/VwxQFRqPgIMjtkhWtKVlYsd63IameGytCTaFKb
yTtbFdc8CXw2IG//gs8TohMtg0gXOCJDC8yE05S/kxZFwXiuYSQXjgBe4JXOZASZ
PlvNj7ppAiGFKVmtEJhy8+S4Ok6tDu3GcuotP4VwCVtwZCXPeJU=
=rG90
-----END PGP SIGNATURE-----

--Sig_/1u0=RzmI/bXTIgBB87Yt2Rj--

