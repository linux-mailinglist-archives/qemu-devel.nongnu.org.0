Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88A6D3998
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:58:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wh-0006s6-Ci; Sun, 02 Apr 2023 13:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wf-0006rd-Cs
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:49 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wd-00049E-SD
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458203; i=lukasstraub2@web.de;
 bh=EB8VaRAWBK0oXLR+71tIM6tqF5W0FQ15mCpwJS4kA3U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZumiD/YCehugIaWecE1yeLgz01JrBqthWXCSKovTJyAHhKLMBBVnx5+1WVW6VozCZ
 dFD4tB4Kv8PU5+KvBIhr3RcmFKN3JDjV6wQJGYRIQGVShfSDydvKl6kIF9ODzOxmoJ
 gsMdnlO0H6oAvmA/qogPLwPhqJENzOTw7QpOUoAAXLP5+u7khLatGkxh6gcc603fXn
 0XUkCNrzj2Yhx9/3XrhT2IPnf0e8YLMpxvImpvsb86f2mVOhcIMlvTJ85uD9eGV/wI
 uFrBxpa8V6z641VPwrg1mYeR/WuAJsSwpWuYRBruVu20ZSxTVAoe16ZD2x7wZ8cwt0
 frpJOyOpvOiMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MfKtN-1qKakC1d8N-00ga7n; Sun, 02
 Apr 2023 19:56:43 +0200
Date: Sun, 2 Apr 2023 17:56:42 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 12/14] ram.c: Remove unused include after moving out code
Message-ID: <b79093582686e7f495c8dba6346d50efd6f07a98.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9SucF5WtwMDwze47kR+5Lte";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:WQgbku5LHYMz+D+yNvZHdlYu/sFOdpCOtCWza8BOacZmQMLwq6V
 6NdJiQ+Bysdbjk0rNoln5HL1lAMjQ00RTEabHsf9D0jttjCeiuIVwfU7DLE9MI+mTexzF64
 f5XpaHjVMP3KlSVS8PX5KoYf1NK4E2ejTl1Uxc0SrqHqo2Np6uvQ3VhPCyoHrLQB50GtsAh
 6Dw59DRqKZJFZbO2rUPTg==
UI-OutboundReport: notjunk:1;M01:P0:cajR0OPTqdw=;LsQgOTQPanAafeOcI9rpw4PKwU6
 eU5uqjrgktDiCUlvWAE5QTDtS2w/MYWXx4BDmDMQF66X4In8GWguiqp+n+NEG4i3A1F5ZchxG
 qVNFonJZfCNMPIZEjmuXr5pRCoCd2mK8wsxgxzRmuOqnyC8cCSMbbxIpB7HgULCkEjiTwmOnu
 nuPj3DAKIdf2THomTO9jnQHUu7ngdcNmpnTUgJiUH4Vk47iiKJ+DZ2hxe+01DN9eTPQOJT9L/
 66M2PyNx8guZveZH23SdbmieTxr1+rQR/8/CoD+KsgI11ICtnKy+AHlfQcGEzX4jBj8GgfXI0
 apqk52L4dPu2o3O1UVSDBHMetwx4lxiSvbTGxon9SwemAZfsvPOKYbsczXe68WOFJMr8X3TAr
 +ZSdP8T+4dCkzfl9dH12adXL4p6xThTM0oxnI0dbFpxpcxgYccSGfIrehgG1Nw/63tB0UXc4b
 W1vJKtu8TmeJf6t1sX4sTUNq8OagiyovDBuTlGHf0VzhikXkexpuVtKkX5FmwAFZ9isufS+ry
 teH16p58P19WGejjHqE3RLfxJZe2Bt/Fl9sJHOS62GevMnjCoANkJIxuI6cx46FKbrlEC2ZvB
 HwiOxpY5W04NdX9kUyUoSetHxJBRXStyCWA7Plto5RiAFWK2/huHOwPn1kjTqv3jc1GM/qvoY
 WipqYA7B5z+4qs1SMYvZOhZjsTey1E0HQdVAbSpU2IE2aiV6a8rBA3+2NnBt8Lm40LARwdBaK
 4JR3DPDEemdJu6Sne4yf3HZWfS2Yu4HhaGPEdrViMLrtjL46jGegwrasUFRs9V6hpWa9DTnk2
 akH0rOjSaXDS5mdaVOW3DHvelxw7G+XOA0QtSY/t+ZgkCazkvva7WE+TRqdcXcOt21RCDcYle
 LBeXx62JrCpPw4zwrWwfKiIfv8y6zLPxCwLlxBk/bwF/uJeQnX0oSXFo5bqC6fEvDze6rmfLo
 twIphIElRX56zl+w0te7hP6akvQ=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/9SucF5WtwMDwze47kR+5Lte
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7a8f540737..9072d70f7c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -32,7 +32,6 @@
 #include "qemu/bitmap.h"
 #include "qemu/madvise.h"
 #include "qemu/main-loop.h"
-#include "io/channel-null.h"
 #include "xbzrle.h"
 #include "ram-compress.h"
 #include "ram.h"
--
2.30.2


--Sig_/9SucF5WtwMDwze47kR+5Lte
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwdoACgkQNasLKJxd
slid4Q/9GOVZL2uCKe4A3Xy9O58ZC3MFG5j8pcGsaYtadkEoVrEfee4RnH5t2ms8
wPhiN0OMI54tk78vmIB5ko6sny9C5AuqziU8hwF839vtNGtQUpLjIxFcRL7SiHJU
HiTNy9fnMLAHxmu56Fbh6LthgZ1xMs6DSmw1qJBqBAr5SH7nxtwZCvS/xYpyOtRc
RMnn16i0uMEh0NnrQ7zAMSEc4Uvia31ZmVXGXLaJd4JltGkS4XR9ygI5XBHivZkZ
8VDQRrCVPe6lolY7Wut/4ZIzVwNCPiAc+8A9plzy/C9sjds2tSoMuWy2P0XE908I
ReiwxL85lY/QpRKDPsik92iV7CEUBPfNR96gY+1D+ufkJUyW9KMIQ5ehvPbb5xsV
Ob8TV0iHrXyTAILPj8Ad/5OcDQETaQrqgc+R+yAEq22Jgb4tRWkC08/zh5SpcYJS
z0OfjbMdgbzK2Efzjv1Djpcg7iI0KZt7AJQqTvvLSQjI1bogvaHFTbdxUqF1n1H/
eurmEORp/dTMbX0PuBTchNUQPlkoQYaOa78aziM989m9+T+5deIaikooZzXRxi/m
UaTpS99PVKIwgYbwYnGjfTT+dRgRSEGJhIeqR3n8p2bC2Td+TWKGy6XADQ+yN2kO
4rUscMNLX9zPs/Ws5Uzk3ODa/iwYyz8Zn/LfBQMcTx5AoyfGrFg=
=YLJL
-----END PGP SIGNATURE-----

--Sig_/9SucF5WtwMDwze47kR+5Lte--

