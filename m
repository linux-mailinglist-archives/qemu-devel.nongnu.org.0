Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8082F4859
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:12:39 +0100 (CET)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd8o-0003Je-49
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kzd5L-0000QO-Df; Wed, 13 Jan 2021 05:09:03 -0500
Received: from mout.web.de ([212.227.15.3]:37901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kzd5J-0003oK-A6; Wed, 13 Jan 2021 05:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610532531;
 bh=0cyNB1G0ayVl7VYXWAYCGOCLHGtryr6Fm0T/oORJh4E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HccbX5pZ5+REnHnPzXopklo0vAtYE5Q+13phNBwzuUYo78TtZgAzQYy5GbGMbYMD6
 I9Hy+BDdOnxxsxxFZB8CUd7rzOfkkcPHm1pTpTxl0R5h4Ex5i02SgeVdVHofwmkXat
 Ln6oSvjlx7xRN+jxigrbGkIHU5VEDSoFLEs8581s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.58]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LhvUI-1kCarx0TTu-00nBpA; Wed, 13
 Jan 2021 11:08:51 +0100
Date: Wed, 13 Jan 2021 11:08:42 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v14 0/7] Introduce 'yank' oob qmp command to recover
 from hanging qemu
Message-ID: <20210113110836.009939ba@gecko.fritz.box>
In-Reply-To: <87a6tenn2x.fsf@dusky.pond.sub.org>
References: <cover.1609167865.git.lukasstraub2@web.de>
 <87a6tenn2x.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BW4tDDOFA4ZMGvSbfb5linV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:VW0EuBXkSGK2snsbMliX+uIces8cdeoW/hKcLvF1B17npsFHAzF
 xd6cQdO8yaaEAtFoEG1Rdq99xX39W+OiJnBN8wccTeunEfmyCokFL+UshRuKY51u94VhyaM
 Uwk97NFSh6cHRbTCsW6wx/3xu5nwCa6AfY0ZCbo8TZYVIZqgPQ/tvG9Sj7VLbwtBI5Gwl9B
 GnIg4lCMpljvtLNdAvkgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S8cI4zN/TOI=:KH9AzA3EN56tub9hLY8j/I
 OEI7s4cJgvIQMLwVahoeh2w4At7K9c6GrdKpsLgGil3XFSVaJgJU7p1HySnZuZ47dUuA0Zxbe
 2gIFIk8bVlM7k6IkXZdpt+PMjcN0HaRiy2XAjht3c9f/2aNIH+uDEig9bYaA0crs9/39F2g9k
 praH+KgaVz//Oe4si7boTSubPLdvS161MBwHdqME62A+hrK7dyCATFrtJMG2eN7aRK9teGtqC
 bmmySg2qBdGunXYa3/+lEQfy7UGmEFC6vt8mEQH0JH2e9oO5mMvQE4wIn3UM0ktb0k7mkQ0+v
 zX16Kr2gKtKPTGmUoTNFw3sD2Hg7yfNQrmkBwIb0yUuLsghznyKArJCqZoSxD9e24YhQRgA76
 0zGw6p3O+FMBsANkKYABZr8UXQkhbhaRbMIOZHqKm442oqhYtSWG4OroEeNC/sS3PgcMwIsgI
 LBdvPI01Qm9NJjyRhCSJcv5926Q90Ot58UQcj5OnX7J+QHQaW3NMVTIxYWjuG4nZbG2zy/X6D
 w3faPJLTr9YA8BuDqgrtMJluSf+WScRDTxRW3y+J7olju12iTO6UWnbUPGvxPrupGLmFiPuuj
 avQK2hlvLGS9e/4MLuVvgj5+UlqHwst+ru/HzuCjh7xyMEXcZ22jCR7XvY89ne1Rkpftpyug0
 sDvW1UkGTVtzHqMoGJUSY+vOOt/stoMkuhhz/ViShdGd78ODlPS5/tC72R3wRKtEJjDuKFnkt
 CuLBTV/4QU7GQNPeab54sbc7cz6vFNxSNb77zsc+QCj5FNfDMmWRAFmvUdlAYmhNLx2GsW//H
 p0xjDzTfEZPMcOM0Xs85j08327tHyabtmvuxN1mlMsAIdeS7ZGq/S2wloaxlCb27VZLhdKRP/
 X3lx8lkGgS2DEmWEj8Gw==
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 dgilbert@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/BW4tDDOFA4ZMGvSbfb5linV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Jan 2021 17:20:54 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Queued.  Thanks for persevering!
>=20

Great, Thanks!

Regards,
Lukas Straub

--=20


--Sig_/BW4tDDOFA4ZMGvSbfb5linV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/+xqoACgkQNasLKJxd
slhUDhAApOWya7Pj8lagbuAyhFi1nu1i1buFc9fybu+saMak/f75x1VhlBavQD+M
steZ2nI0P35ECGWtbhgUPxfuORq1J/3rQfapPn/iPPdNukQ8vCuGc8f+XPrAJ+x6
h59+KklNbc1IjYXFiEOg5ryp0+Rzo+zk7pYCXLsmYzqe4kze5F8XwQrLfQtzws6l
/wZq9D2wt+RFuNbc0FsCacD1DyZxijYAZx54GGvlYBFqinhWrVgd6kg3LTGymqiu
8jH42qKdd1aHYOY+nNAxO0UmzckXThiVG/2zP0+G3TLm4rRdRcBe4oqhwgggXrmI
phu7UxDkl9vhpEgqw42+L+IHnr5x7Ik7nUv+ONzJO3C5LTJ41pP0xRYSD83Sj0FK
D8/jF4ddeykeUDvzeJcPVON+/WW/6YmRow1lcSoYzujbvXefy3x7t5r7uzIrIx5p
S0wLepeOrrshbKCom64NOm0pux/joxTZMItQ3HazOWMOXCn388WO5CPgzcEVrWIj
j9qMZeYfXhXTRdLyeg3l7+hAlQ9BmskvTFKg6rdsvhss/T8jOS2FzQ6wYpj3dT6t
pqqosmnY+zPsmpB9gOmHzhQ6o/4D3X+U1BPOC8y+ZFr4U9LH3mxyvkdbroCR7xaZ
WhAfz2/NPOzC2bei/vQqbj61qc9zreWwIboc5dKdMWv9Gy7+Jsk=
=37p5
-----END PGP SIGNATURE-----

--Sig_/BW4tDDOFA4ZMGvSbfb5linV--

