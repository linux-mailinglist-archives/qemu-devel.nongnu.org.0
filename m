Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D46E8E96
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQu4-0007vI-Rg; Thu, 20 Apr 2023 05:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtz-0007df-Lk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:32 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQty-000866-4Q
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984105; i=lukasstraub2@web.de;
 bh=KUBsNEdVYLT7okRgGGCyMsgCGPVFEjmzuOl8jovNUi8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jdMWhMeGvl550SfrUTafc9fYeu0K3C9shMvYx7GmtwJ/QPbgN5oG7+OfuG5ha1kse
 ftYc/k2yYtJg4druBe3hhz1rpnSGq65qg5vQ8T+JPdF8+viA2vXtCLLK63rFdAFkiO
 vUXZsCSrzxUV8RkX0iC5HMOLXAkeo3vVNWJWLnllzUrDBnaD/QnLCM1xlAX3GrudoT
 Pn1qb2PvKDJGlXc6209X54aVNMroOjMtyiWsbKDlt1uS6JnwgaEdJbCA/gAjJJDeM7
 +fLrIux6rPLq8mUNHToDq5a3D2sNf+IVic88Y9Q4s4QutN68fDlzNy7VuuF6t23wyd
 I7LF3LNpwzLvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MaHWj-1plz2K1ma5-00WCrT; Thu, 20
 Apr 2023 11:48:25 +0200
Date: Thu, 20 Apr 2023 11:48:24 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 10/13] ram.c: Remove whitespace (squash with previous patch)
Message-ID: <cdb82473b02794f867efd115f1bd2c7a1e392a02.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vhy6HXgVKnRipTWMMxuKJ0k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:XoB+sasPT/4fx5VBA+rYuwuXPFJeuzLjleOuyPvUZAINyyZb7no
 3nHmQRD8CBvRT9S4QNuytLNdZVFsdCQWdDJlxA6f62/3rF0AoAFiNE+oksXz/bT9TqM1OnE
 UhZb6BPB6qoBJQ9NZa2oDKKwlPJaHbO9OJq7Ij/PLm707D4+rjePWVWumbkEW7eYlw2W6Nu
 DcNf/VwTivFqNNZzcSbJA==
UI-OutboundReport: notjunk:1;M01:P0:Y6uO0l3txys=;UF0HUGnwii8AegVE4nQk/42tuyB
 wNauOTKSd38tCnrO1KJ1ocq8EkSR79YH9zdhNhgCIr6/ReMgsToNwJT7OZA8k/cB6iXbQJZ7G
 2HF1ZqlmMCwHwfd22EcGhJTiu0ljWYhaKurePAhD4QZ4CDGXs9SXzBlNot6ZV26IMjk72Glrz
 HqTUU9nmZjFGeAcvPMjehRwLsvtHzd0+rSdzEmwdirkibYUc4esSxJxKS5ONMqDaQoEnRElNp
 cLAP0KY89+WEdRac1sbI+R9lfXm0VZ6X8+wt4bd+8hNYGXCDrQbH9PhZi5gHxGc2cUl/GC5VS
 JJZN6Go/uMgWJN1UKE61RSvP18NUHlXKBdG+Z41rYFyhaNTmRNJA1tod8WVFtRoVqpvWSVPuw
 VKQe5cR+r8C7HE9vtgKp4XnFKRNBrBeVFbGohV3wrGjhq1FYvWagPIo7nUXH+fAcV8yBimTgy
 uWoY9ndUpp1dPJFT0YoElWb2CVr851lGPzrULfDMIIsM9ooqD8lqEl1DsMOzL54Ajc/lONEix
 RPRKzHNHYA8wq/gQ1+HmWTuUSuv4VUp/Cd7Ho0waW7mS3gAj5/O9Sbh3jcs1HgCxpweypCYXN
 4A99xdwmzHfI6LpRy1ekz9qIs3LOkotskMwOaoPAgywu/qNQ5WCFcCTgvmgqtSY6DCezOx2iN
 zcLFaOSWvIm+5yEFYakwC/4lW8pkWJLgUDuOdaWfQ1WujRIVAjIdLFHnhZywBHESKpzYUp5ZA
 67amwZYziYeeZbN4x+s/6d0MU4r8GWsIa6G1jhV/e3y+gvGBn+lLu4vL6q4Puk+O1lCRpvkWB
 Gb1sp8hFfn472pWBlu366MyL1QQbLS0n3x1Y/e1IAQ9S4b84lLW0uqH89h9PTy1eEFzQ9V0Q+
 At9GYj1AhZ0EXur3zaRUgoCRGy/FLE9irgAAoRgT2jZpdV7Q4K3DIotaVYxd8j8Nl78dO8SHl
 pPywtQ==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/vhy6HXgVKnRipTWMMxuKJ0k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 42d6a54132..7be09c18e3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -529,24 +529,6 @@ static bool pss_overlap(PageSearchStatus *pss1, PageSe=
archStatus *pss2)
         (pss1->host_page_start =3D=3D pss2->host_page_start);
 }

-
-
-
-
-/* split */
-
-
-
-
-
-
-
-/* split */
-
-
-
-
-
 /**
  * save_page_header: write page header to wire
  *
--
2.40.0


--Sig_/vhy6HXgVKnRipTWMMxuKJ0k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCmgACgkQNasLKJxd
slh2bQ/9F9maf2Oe1GFfD0JoGvv9H1bOU6o7wQ2oHHhxFp5WQSUnh59wfbaTfREw
UwviioywMY7Q/meTUcRrVsCPSVKUEmCuLAp/e4uncRHpvr1wUnABukPJRmm1cXOB
i6nqR16y54rogx3f5GpDg+/Oir5acg+1CBWcBOVOY0aik+NRiqXF3uZK6FsAZthg
mCZnR6bDp9Y2+TW2Uh4HWL+6KcNoGzYa1l/18UWsyuAC8/SuYbgoWkeYzVClUzky
5XGStUhm7eia9tq2yvx1uhWUCu+bKatTKhvMdDhEIj3GYS9bDC/ggFfJKOlkZPU0
SLjFM+Fh5tSarv/lni6rcJbEOEnOss/yl+7K+kPTcWYYz1yRTYXSIaFzHV59cR8L
hil2Wq0R59e+ozz+dnzqu8PoPXpck8+hZqEvqi9aREuE/kbaeEgKawZNTsTsssVY
6MazhCrq7Khvcl2mSdrS2CJ26MmhRyiY1Rstm7aVydTvMrPkSsIx1P+oYP1alvkU
MHClfFBs9JR2QwWJYR8A8iUapdxjIzbS9KizA5NLHmfyZxe55CGwWYHq+uQPaxta
4JN0QlhIMkZD4XZf5D/0zA0CgQcz+bkBwMsEHUAdqjI6Moep+b2d+B8XeBlGlSnm
TFWWrosABcAoZCYXtYUzIa7yhp+qF5ID0IRNxf/1SRTdIaKHgdk=
=QBrI
-----END PGP SIGNATURE-----

--Sig_/vhy6HXgVKnRipTWMMxuKJ0k--

