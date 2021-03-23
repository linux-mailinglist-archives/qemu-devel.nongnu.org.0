Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6C346836
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:57:35 +0100 (CET)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmDe-0004HU-M0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHh-00018n-UD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:41 -0400
Received: from mout.web.de ([212.227.15.4]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHf-00049O-Dw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616522254;
 bh=5QIyFX0m0QcV+qilyWak6RT6KATFVx//on8hfkPOpdE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=e/uNgx/EJ1ztNeLwasN78tv4NrdQ4MzinT/p60yEvSQNmQLFVYxP1LfmGJ5YvXBBF
 yks2GCOGP3+ULVen6uuD36plTBrOFUI+ulc+ASjJFwYQ7ajSgCPIVSd5nQ6oP78fTW
 uyiLhgduwsrvQhDkMJwNUt6y8yiBJNLXLDs1Xw9g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LdrkJ-1m6ah306AV-00j2FC; Tue, 23
 Mar 2021 18:57:34 +0100
Date: Tue, 23 Mar 2021 18:57:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g1ya8hekrzGSQGvyjdQPQt8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:sdffesVZ4RgHWgC1uoU34tAXAUXxvRk9bCNWhZN80r/3OAOpjGy
 nO5uuq31pObjWowX/HjPEj5L2D1I+LIlA9PbtH9xZ0hwSh1YvfpXLEIVeiDAqDAeBDShMBn
 ixIYLEn5HvoGwq2axmpgy7J3NPnPVdyjmV382voHZeM1qKd7H+nCHNvygb6kpzYdfDedNG5
 EvaIW+DVdGep4wThRfrrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HVXDw4rgH0g=:okb8A7uG3ZmikCkzWeZ8Uc
 ZlN+CXg1+2jgpTvnS56v7xp6zC3xsZG0QjUv6wY2RPdVjVHCkwW3FF5t73UnNuSr0VWZOydSm
 G8sK1NjJAcZVA3cFPqvvtfwVD6bKX2nlFAmSnlmf9B5QOtQWQsaEu/RnNSTUFskt58rcREgsl
 FeWqrcV0G4SOpldLvtM3xGLUXXe8rg3g5OqsUu7WeHRikd6dPsiz8Vcf1WCc7cUi9VZtIgKn8
 1wLmFTBtYSsz/9JOWUxO35mq5x/YsXBj6XV2qeBjJzAdo6IrINSErpPsBy7zpd8xMf89R3sfs
 47O1Hcb4QbhP837FJco71VD/xqysHLl/IWvLSUZp805ftzNZAzJc4Mn5WfL8Cb+pcSrqqe5rI
 HjtW84rdsrayzDbNzPOvBZXMH//NBRp0HDwuCcTLeGpOgRp4adUDVikiKWBYFp+gQaYDrghKb
 QctCQD88ZqCguawcdzSOuZWXPA1GF5EjxYn3x0mPgYdL+SWXt2Ek2wCcBl4KbYZLT/QCIMDBZ
 PGSe1+MVrtoHMLt13QSiJgOGIwFrWzr2y0zmwjhJXJawUPoSrj6d1yOZqTKCsVrFRDS1DxQg0
 xBJKYlI10SNuFumecZ36CaI0C5v3WJWMkpmTpSqYQChSR4NJ+1SrokR5TcxFFoni9pbjW3QlY
 siNBgWu+yTJYbDV84bJ+eiCazSvGi8kKPskHsKhbmQbX4IaFL+9gwluhhFsEucl1om42w1EvG
 5F3rhdLkTfFyBOKbN5P5WFqzVLWe5V3Z0U7EsZz6XA22p1sBtderI1o4h7XOkJ3alqFs4/pjd
 I01UW8FPDfC5rQIUZmGsIj9jRbalM/5fjjUUjrDKAD7W8jTdEkdsOSfOec0IAq+HIoj5yZrZb
 z8cN+8pjPVN5SVKkrFbQ==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/g1ya8hekrzGSQGvyjdQPQt8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
-v3:
 -Base on <cover.1616521341.git.lukasstraub2@web.de>
  ([PATCH 0/2] yank: Always link full yank code)
 -Drop patch 1 (tests: Use the normal yank code instead of stubs in relevan=
t tests)

-v2:
 -test: add license
 -test: factorize testcases to a single function
 -test: test chardev_change with initialization of new chardev failing
 -fix chardev_change with initialization of new chardev failing
 -add reviewed-by and tested-by tags

Based-on: <cover.1616521341.git.lukasstraub2@web.de>
([PATCH 0/2] yank: Always link full yank code)

Lukas Straub (4):
  tests: Add tests for yank with the chardev-change case
  chardev/char.c: Move object_property_try_add_child out of chardev_new
  chardev/char.c: Always pass id to chardev_new
  chardev: Fix yank with the chardev-change case

 MAINTAINERS            |   1 +
 chardev/char-socket.c  |  20 +++-
 chardev/char.c         |  77 +++++++++++-----
 include/chardev/char.h |   3 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 201 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 276 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/g1ya8hekrzGSQGvyjdQPQt8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaLAwACgkQNasLKJxd
sljZ4Q/+LqiNZKpKgLOQWHM39wXIw8TOD2GrnFSaNKeuPolAZo+UruZKptBLAmKY
QLP8YMuIIQbpXxQ898n3SU9JgGx14AgsWeIFrRyi399usCl5o8wHOol701BxJr1W
XqkbpN0MN4ZyfZr8YLOg7yB8VJDuF3KB8ydeB9PyrJMisqqlroxWBLXBAO/act+M
kAZlYeaR3hUsQznJ7cjrr/eoXryTtiKavkY2/pFnaxS0DsgKQJzvnh7BvZHYs0l6
QTO+Brso03IcymQ2QhaKDAwFa+Bezpn4Ci6NJFPMnz1tOZDn+/HMvYxjJb9ZK3HH
UnpYvPXehDMe/YWShCP3oOdlh/Ek4xBBuP0LuwReMvTr6Y6fXjBxu6rK+7oAT53D
CCtk4UpdKGpEmEuhAJrDggJ+SLgPAQiD82LVSgw4b0NB6j56A4PQHv6P5IWM+ihc
zsYMAgEXf4tbCjVPq8XnBkXZu1+dCMPdJgi99Rft2fDJDYxBGzQ4I7Z6zy/uLtuY
4ifsiVk9aIlgdghtRJ2GNk5uxJwva3mMeAP5uaQqO7bWE6dPHjk+Hh6geFtOACc6
3HjwFLOkcnqgC5FJAQFEBffIjFb5QX3DxTTYapMYcdyqj6N50wgZClayO0nVXMEm
4BaC/xBVga/9AS49f4pQ/XOTiWatsDZIO2qBis29LX9muM3UQmc=
=D0Nl
-----END PGP SIGNATURE-----

--Sig_/g1ya8hekrzGSQGvyjdQPQt8--

