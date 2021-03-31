Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A734F567
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 02:18:42 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lROZF-0004a5-Hb
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 20:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROXN-0003T5-8l; Tue, 30 Mar 2021 20:16:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48703 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROXH-00081z-13; Tue, 30 Mar 2021 20:16:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F96LT31Lsz9sXV; Wed, 31 Mar 2021 11:16:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617149793;
 bh=NbTNOWoedxL+YtskLRq/SvJNFf8dOQH8eiTLBCZV2zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eC5mMiqVzeHkzUVocXNTOI99llmMIWAuG0b3+9yC3J9s5TdovfQmHs3VCIArJE1Av
 mYojMsu0bGN7UMZQOM2iqiJ9on81wbSdmsb7rgwUaPtDsw37AC8lqAj6heh6NWhhQJ
 M1Dy5q32uUNqNhOsGxf9DrT7OHGkG1550nQOuX8U=
Date: Wed, 31 Mar 2021 11:09:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <YGO9oklIrjN7O0f2@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ucfy3SayQQ6ECKFo"
Content-Disposition: inline
In-Reply-To: <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
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


--ucfy3SayQQ6ECKFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 08:01:13AM -0700, Richard Henderson wrote:
> On 3/29/21 10:54 PM, David Gibson wrote:
> >    B) Just the hflags patches from my / Richard's tree
> >       https://gitlab.com/dgibson/qemu/-/pipelines/278497244
>=20
> Look closer at this one -- it's an s390x test that's failing:
>=20
> make: *** [/builds/dgibson/qemu/tests/Makefile.include:63:
> run-tcg-tests-s390x-linux-user] Error 2

Goldangit!  Good point.  Now I'm even more baffled as to how I wasn't
able to reproduce on master, but was on different variants of my tree.
A whole heap of bad luck, I guess.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ucfy3SayQQ6ECKFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjvaAACgkQbDjKyiDZ
s5JeOA/+Lp0FYxlezY4BSjgL5zrH19FLlh90DPBU0R60AHwOfEZn5bOK50W7f53A
E57FLgVOfDo0C9h7DWvSBQ1ytCxxqQUl/2a03Bq8pDp2dlPmtj3LUuel2K8ViPY4
Muqia9PUcFkCT0pq/pUo8dBXzHxNe/55SFyvA7b1EnzK1MWPbm97J6ZoYqV9/Hko
7LO168QRm/i87yAdEfhcxOyggJf0J9ZgaVp6wbjvKmOKo46pXVUyXJbcnROrV+XC
eufl+W+1HYoPvqdCTLsGdVVM3CIZvp/UvqVdLg8Lzf2SzmU+Rg2wHmNDsuCZ08oZ
DVWq2ZK3KDLcGt6GnjpX2EFH1mv9qcyn/HfHmi7e73BrwqsCsc0gwDHM4WVATSgr
aoRvQZ3WORmxTSJ/cpigX6nEYN8zz5DkGLI3/161RhEVggA6pgnnBk6ztyu6IhWO
veufENV/QC49oQqp4FoDtkpJvdMCqqCGIhkGHaD4ek8MV0qhanLCLtNlM6EIZgC3
oEIC9zCeD7V3Zk3DTaYeohJjTkstNa91xq22uZ8NJAI7gcnxc1uK5O2ZxhxSVPTr
Y1m9M688nrYnpScVrNq8waVIYbYXrvcG/cqfAcXnBoF47kr8UXh+lCcPIuByPP9P
EResN8D0mOFKB5Xjy2jKSTCmxaHLuobib7oXaj6HW+47kVoK60s=
=omBK
-----END PGP SIGNATURE-----

--ucfy3SayQQ6ECKFo--

