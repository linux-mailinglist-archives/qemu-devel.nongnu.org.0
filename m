Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0F34680C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:47:44 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOm43-0001NU-Gw
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlCx-0007mT-BH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:47 -0400
Received: from mout.web.de ([212.227.15.14]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlCv-00018T-H0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616521960;
 bh=PorecR14Io9+9W8VVWliPrIQAKkg01/zvQivCBGIfq0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=X0bTEj21g1py/DxyvB5jLf1xliPLizfClM26bVCfg9jWAKnM+1Uxb54gDb0+S/T9v
 RetlgMaUxXR5luxO2uxvh6nf8LTMkHQ5tuiddR5nXXPHMmfMQMIxGM5c/HKglNRz/6
 oqatLEPfwvk7QGU1CAzZQ/5ulqScBRDk9gv8qF78=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lp712-1luohn3X4m-00eqQQ; Tue, 23
 Mar 2021 18:52:39 +0100
Date: Tue, 23 Mar 2021 18:52:19 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] yank: Always link full yank code
Message-ID: <cover.1616521341.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m+yzMI/J+wsZCdULU._tm69";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:9foVk6KQCFAq/J8YkKXjC9o8TZkzOzOlBGvAa4+wwOoFZhoDII3
 VulgJMX+gZ8gSyEpS20HuXU26xKF//BurjonK8RvTHCjE0xdyvvcjdsiRAhhpYKBSIe1YP1
 MqL0x41YNtMzN1YMqTPkTLVpyjxNzin429BZxRf7A1naxQf9TxRo+zaI00wuZZvCHJt0VXr
 nmGdY09nZLaBIvhLfEVlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:86zmW7AFboQ=:dvUfe75m/EUJZyk+HAAwbi
 3U8wPFNyG/r0UuhHzbXqtYCDeEmi9GtjzE62brpY2FbLX+rkVAN2j2JvdDlUuXxEfi5eL+9V7
 n8e5HdA0IY/gHJkbmF8bdtj1tGBbkrQcEGpLRxAjZLXv12aAlAD74RUB8gT7xZjwAw/V3eFTl
 42emyYdnHSY2C1vI78U32OYhdWoObzO0+n8JSCcSvTYKbxIlWFtvYBkHaVnph1gteogERcJql
 m4b73kFip6QbJICFoDzxVrEqPVt+oXp5hDvEl8qmBvHkevS5ZKileeU/c3wFFl30Gh65bDhn6
 wBwr3Mxsm+AzSRG31nf1HyzsW0ExkuKmswawrec1n07xZBc2EduG3LwliqCOQUBiKS3BhlD6l
 hF9KNm/LeYDB+dw7jLtiwwaCGn6ZaE4xZ5cPEqg71H4aQRsR+L2Qzc4MF0yPXp8uV7S5G01md
 bfcaafRXl9iuBWZhwQq9hyGdRq0fxTAg0XGv5K1bYVjZe2IJHeOgOI5dwD3lxGfs5njTH34Tt
 kH6lqsm+a4oRdfvnuHMut4CpQoji/LIjRXP8qVazTOu5sWxc5RgqeaHaXB8Vi42t3c8ZBP5/f
 VJmnvHadNUlawTPwtQrYOzw7SmjA+vrJKocNJxntE+1THYTJEFYC4ihj/gkYnnMzpvewWt8Tz
 44KKw7y+G0KQLgQ7zDlPfdV5nZ+9vyuQmNvpvKasXBZfsfgk/npGEvMyC4Zyz76iknMPVtEEk
 bZ7dfhDCGGdUvpQ2ggrZ0cbyhNmUdFWSJ5KOF5mpFw9nXYRyr8qz8j84V6BvDipRAJUNBKgV4
 bJIqux7GSQQCKilMy6lxdchu0BNRqdPN+hMI+XmiaIc9nDPFiJAWqQElEToqqbuD8ik3wgZyw
 MTS5lwvb2sJZJYCbq7Uw==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/m+yzMI/J+wsZCdULU._tm69
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches remove yank's dependency on qiochannel and always link it in.
Please Review.

Regards,
Lukas Straub

Lukas Straub (2):
  yank: Remove dependency on qiochannel
  yank: Always link full yank code

 MAINTAINERS                   |  2 +-
 chardev/char-socket.c         | 21 ++++++++++++++-------
 include/qemu/yank.h           | 10 ----------
 migration/channel.c           |  6 ++++--
 migration/meson.build         |  1 +
 migration/multifd.c           |  3 ++-
 migration/qemu-file-channel.c |  3 ++-
 migration/yank_functions.c    | 20 ++++++++++++++++++++
 migration/yank_functions.h    | 17 +++++++++++++++++
 stubs/meson.build             |  1 -
 stubs/yank.c                  | 29 -----------------------------
 util/meson.build              |  2 +-
 util/yank.c                   |  8 --------
 13 files changed, 62 insertions(+), 61 deletions(-)
 create mode 100644 migration/yank_functions.c
 create mode 100644 migration/yank_functions.h
 delete mode 100644 stubs/yank.c

--
2.30.2

--Sig_/m+yzMI/J+wsZCdULU._tm69
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaKtMACgkQNasLKJxd
sli21hAAi86FkzbpYM/VM+pKXDJmxNfyxsRuf61RB/sxDLwrdCmhcgMzpyJfZgo0
DXljo81sZcjxxBbbTnxegaLrZqU4s4ZMUc1w1Pl5I5Y2BC+RvRdOzwdV7KsO0ol9
WPUw7+3tbo0aChlZW69c5259tgnuioRkvIfDFBUL8Ym/0WZl1ufv5wGcSr9pe3rT
LOZIlX4xHHuAjJkDtBHNgMzWCSZVB4p1t88s5jmaZXcF+BtX300eMhZHfQ/LahAv
76bUi1xm+xy2F2DUyrq2WX1ljdhXz5f2RIr7V4ouHcuEkGbjrgXsWOrveJPCh0kl
JoJWyzenLHR0HawRQ6DerO4GTlzyRqNAbKmAwio0nUzia0HHT28+C6PefaNy7SSi
V6K63k9uj9iUNcmwYTARfGRENP9ZWxZa2qAKDRVpDBG7oi/E3tekyw35XCs/J8dn
g18bSeiHNrIedIxGXrmh/mOe2CfplLk954jrRdGqvP6nStKAO4JLFZbbgaZ9qHMQ
DEfLOiFt5r0NUCeEREYPsBSmZ2C6Wo+GqlWqMxnT6Hy61+evWXGQpAySPhdybaQR
IwKB/HXHFQc22XKwq4OJuN2W9mxZq3GIpCdfC1VIaYNygKCfUfsz7pM+M6ZJmmOR
fknihnfYpC0qPxlXwxP3uSbcPVCvviFg7EAIxNeBy9MKiolTNkc=
=F8fz
-----END PGP SIGNATURE-----

--Sig_/m+yzMI/J+wsZCdULU._tm69--

