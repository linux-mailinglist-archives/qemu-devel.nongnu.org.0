Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0F6F9D36
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 03:08:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvpKj-0004WL-M0; Sun, 07 May 2023 21:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvpKh-0004Vu-QB
 for qemu-devel@nongnu.org; Sun, 07 May 2023 21:06:31 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvpKf-0008JG-VM
 for qemu-devel@nongnu.org; Sun, 07 May 2023 21:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507983; i=lukasstraub2@web.de;
 bh=6opSZ7EhSQQiBWXwwglK608tjAJNW/ZxHhlt72YERdU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=iFNTYBcTlPDS+4s/mH7IAADzxO+YhTG8t/F70OiHUA9TzZGFUMlIA98OfDq2jaIXR
 r0VCJohcUxJUoDLve1M0NPW4nmdru+JLTwXTz8CJF9F+GCr7xaxVwgdv5dsTgsby1W
 UaSQl+trXn9wAeuXBUT1qxnEqi47+zN0W39DeIhnGbaxw7ogsdGkuvYYxYZWIoGgPE
 cX2BNoAMBna8fpE1Sl4GNx1g2wbf6MINNSy5Fzc/gmzLQyOlo53MwnA6m4MpDSDuWa
 hAgutPc8h2XBiUIkdBWUjCCg2K7IfrxWjx+gA3cvV43e6MA7biSAVBZTAA5xgcKjSB
 PRwXBXP9FybGQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6BN-1pfXOk2jJ7-00Ip3Q; Mon, 08
 May 2023 03:06:23 +0200
Date: Mon, 8 May 2023 03:06:04 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
Message-ID: <20230508010342.4162c526@gecko.fritz.box>
In-Reply-To: <87jzxrt3u7.fsf@secure.mitica>
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qsOnfr+MlbRYc+wLvXLyToS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:P9Dk8qHsbi/uRIioPa17AWzcMpmdeFks1s776BteKEo3UGL8lRo
 8I2+ve/eWCwAw/2U0pR5gg3G0tsJbeYjmekLJuUx6Pr2oyw4DuChoaEbFWd1SYn6gkDSoVO
 qIq7BJEZJNkVAttDyiMrIwRMCMT/tfqw6p0I69OJP5m+QIdW4jNgD7qdRBkOvsJGkWxNxy4
 o8rP9yWHnBS1TGCVnZTlA==
UI-OutboundReport: notjunk:1;M01:P0:jD2D21nUvJI=;zl0bFWs+vX71gmZEV4WoiC/i0co
 iV68+e2PLh11/KBHQa3E+DI+0/ci6LFgtHdFqaIJ1LqLrHY6oALzzFddNIN79AdoaD4xWAiX2
 Kw+HDFrUtdGGlYjymJV9kMw6zM+4d3agGbajaTw8ztbzi6F3+r50RJDMmihC40QI6Yw5PFqKW
 sFsNyWNTYnhkmS7CkVImm/wm36+st6g/GaRlZfMOPywC+Dfa5R5GSUzNmJG8l4Uz0AIYTg7vm
 7Zd4qSMioCl6mSRm7PW5Y9eh50mql0ex/uWUFOBtBq86/vVRof2noxMRrEUDF7Ba7z7xgbNoB
 pvlylUWuG5xhxhGLHcVkhupIknQ69tl9+1vybtfKeh0lv6PlZjVqKwyvE6496KO/ArOSCBgZE
 Xt0DtnCTsy1hiTjXbDZVTu3cZKbpV4mrGAyQkaMqOxyPfOKGoFleVxC0Z2ax641UvuUvi5fzy
 20T2X2eABUwYlBqmO3ftqKF86MHXTV/5FmyY+GEKY9RIEhYrHRaWyMrkGd3PG97zYSYr6SOYS
 ZgRgbj9hqWheS0X5uKrrYCpPg0qaPf9Npwj6ROLvh/JwmrEhhE49FALtChEmwk7Mjj3pjTpiT
 JzvMiQPT0fj5UxcxcV356wVgj4ALh7LfOxnxeB05C3ZQ4p7QXeuv1NYJl0O1uRJQxLZ4FX6jq
 B5q1KN8i/zFwtHNv9RyUMfZ0O/WIYsS4cr/+wL6taIOBiyHAn6WELscZ0jNwCGDsiJQriUR16
 aFdgzHHWwj8bWjHDRCB0PBw4Kld+fHcz9aYp3SuIBAQo+hnzzbbqDTxbb+8scxV1xSqR6OwpA
 a1I0r/g3PhlYaTKA87XhdwQyE2TL6ocFnk34ueF2djz9IfplDM1u0YDIS9HALcAQLeTBiWtD4
 eJ1b2ryblSCz9FxZZ7QN+6Os64gvCj8ZwOAQbChTMR91+HKwalVhYFRT6LtQmBnZBcUi0DFqp
 Het/iAbO167WQco5iaH3oXKHE1w=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/qsOnfr+MlbRYc+wLvXLyToS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 02 May 2023 12:39:12 +0200
Juan Quintela <quintela@redhat.com> wrote:

> [...]
>=20
> my patches are only code movement and cleanups, so Lukas any clue?
>=20
> Lukas, I am going to drop the compress code for now and pass the other
> patches.  In the meanwhile, I am going to try to setup some machine
> where I can run the upstream tests and see if I can reproduce there.
> BTW, I would be happy if you double check that I did the rebase
> correctly, they didn't apply correctly, but as said, the tests have been
> running for two/three days on all my daily testing, so I thought that I
> did the things correctly.

Hi,
I rebased the series here and got exactly the same files as in this
pull request. And I can't reproduce these failures either.

Maybe you can run the CI just on the newly added compress tests and see
if it already blows up without the refactoring?

Anyway, this series is not so important anymore...

> Richard, once that we are here, one of the problem that we are having is
> that the test is exiting with an abort, so we have no clue what is
> happening.  Is there a way to get a backtrace, or at least the number
>=20
> Later, Juan.
>=20



--=20


--Sig_/qsOnfr+MlbRYc+wLvXLyToS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYSvwACgkQNasLKJxd
slgj4BAAsZ3+RVbdX4F7sONU0bmaBQ0hQDSKnTNC69PJJvVUen5ysQ+IRuWFItOJ
0cG5UKVDN+YuWKLptr15CS+bzwDiLYTWiwYWSk8/YjQ/gv/IMDH/VS741vU/rmMg
m3b6ZojFxh/XUlrvl2/UfddtOAo4nZm1MmYpWdZWYG0MD3YM9/tTb82rHq+5owZJ
HKkguYNwOfMifzuYwTmsGClhIrd0QPgmYJmS3Y43uCnlIcsG3O0XOz2WSNFgo+Gt
1jqWPH3vdSYYlKOjOXLNGNAJggY38OvSPyxoePj9DkA5/jjWUkyoIE5GROp3QYpQ
PkaImP9HiM8zQE14J2fzdvhhpCJq6mDIQrasr8WJ0N3zD0vQt+mrbdYubJDUxnwo
IDrA4U3wo+xdau5DQwuf08vKVTwk26/vscHGb6MiMTA4oMCD+uxipFL3RWgUHyQI
Vct9bdkNwanFOr+z23gH0OEdb+jcEg/j98aMh2nSGfj4NiQmgcKcy/ShfttbDZ2v
fEP4EcjtviDY5oLcN2Pr3Aaaur9u99vNrYVmE1XpVfbWgdDaOE4Xl3V73EXqX2yh
ms+A04jmKBFbixfi0OCG56raxt4LJCe9oW2f1mPikcfFbV9AVsKM9wqnz+xxUzcZ
B2Gn7TTdTSkRjmyzl1wYg1WbPGGt+jdJW8ALQKo6+T0t12zcUf4=
=BN25
-----END PGP SIGNATURE-----

--Sig_/qsOnfr+MlbRYc+wLvXLyToS--

