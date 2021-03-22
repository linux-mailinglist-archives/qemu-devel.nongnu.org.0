Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7734497F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:44:02 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMin-0001wy-PS
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgE-0000Fi-13
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:22 -0400
Received: from mout.web.de ([212.227.17.11]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgA-00050w-2q
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427673;
 bh=VQmQHxOlIwWuvWEaxswc56/uNCL+NMy4m2qTKNaKpPw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=dlbm3Z7LqlA6JivuN3lWDHDtkxKSirIU/gHfd07Sv7CwEhyRBSanKRCRIgD7ZidLz
 TRhl1+fipJgvnxnJW303Kcb++i2P2elb2IFpf6Y0BChaHTCn//cKsjViyWh38Ik/9s
 gx4SgfK7/edDSWAYYeKZPhqD/jy+/j1BWx4yxqbw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M2dg1-1lhH6j3dgL-00sMFd; Mon, 22
 Mar 2021 16:41:13 +0100
Date: Mon, 22 Mar 2021 16:40:55 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/5] yank: Add chardev tests and fixes
Message-ID: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c=tGVWTLF0wnpnscJnujf.6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/FHdOplOIMworDNi1A+aTrWEaJ2eqjNP0CtSk4UwDmBtcX6n3KP
 RdHl+37pzgCWVRA9IZqaWewijAarrmkI3Rzl2F3jsqJW7oTuN18axyhqE28FWZxKUPmmRpa
 Yfluc0KqnDqnCByFadLFLGEaHaV2k3Mq0o71DBfoYkmk5efUShQOaqn2H3nannnQD9nwena
 d+TzX+vBIS0F9jm3x8oSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BS0FpqjoZnU=:sJ4HRKbgIw3AYqk/kGjwE5
 2q8YfXzngkfrm2AlPHjw/ZbTf1BJZpdREMhY3lR4E9rErsjeGU2oT3V5a5v6417vezXS4RYWL
 k0aoKRMguDpbob/EiUk9ETl+YwlgIr2APTNh2uNBwNLtOraIi67FfhQsh7jEVLD9Q3T2hwPTS
 g6dGcOyul1HN2DiZP3feCHhD/wKzgjMgD0QIK1Jx3GAdm/VItyVj9yMJkuhKNl7kk9Nhtejqe
 fYTZFIIN5WfxuJGShPF3eOIvg1bCwWGNTWV80oQ3XlbAQ+3kFFs0gN3nFu2mRt/8WRYGclBVw
 2/zrKNByPlWKb9QNQmXUk1zvaRH3h1M2Fi3UrmE2puJFKpaEMTX55fg1ygoG0CWL84JaWvVsn
 XHBYJz//7R3084/iqJMbLPE0Rb/riOrZDUUwF0toty1jhplVG2ntX+KTMYbscVIcxnX4MjK29
 WzWfgic9OeoJTbbgigyeAMt1yEVnrwX6T5w7SHTf5R0t1y7W7EudaQL40eYvwWqDWh8R8t9Z/
 I/s/n+U1IjoxNd0ZNzGehWDLQkeMSyBBeXAO12SBKLIej3UaWiT+lExrFpcQFso06QZ6ptaHT
 uTUDDm2VkibnthRubOgZypu9bzDNfticfmEDb1EtS5Z7i9Rh/qbKZeqnjbel6FfU+gPyRLR03
 pTAEuvXTGARg/0UwL8TVnVkw1cDhTwy3Iq/oC3aTWY1se1SVSLiJpK31usmBf4lAYlzFZG/VL
 RNyyeE3MMB4/OmcxwHQU9B/BoJAef1MHmwDz/OGN1YzM8sLgyW1oValeCm5ISUfOzqxkQH/kW
 bLR4sfI3vHBoN/hk1nCvCkTC2sy7EOIVt62wmvpDFhn5zxU3UORBCjMpjVEIm5233+arVUSoQ
 CToriJ4TWJYWmdEbZDCDrj+bp3xDoWG0KH2sSpNSqNUGfa7IycjdbJTf1dHxbeXH0zL0KYwZu
 4FtQDZBY2k1dcQPSAzaKVVat8RCuvu+rMiakByThPQXFTQNir7MxpygNvdAucOJAEe9cXrEil
 ZtlkU+JLQLNACiNjcWsvVS5vKGqCJeUWCgtF4qA8Hsgh779m3+YbVRzP/VSU9UdGTfYFt87QC
 z4HUaq/BhttZZDx3IfwUYh8TQLj9s/x00UuVI4pFLHB6fo0iv/oTqURwEsmF1Bf/ruPoNfmRh
 f3dFlZYzp8J1qdkuFgkHJQD5Z99Wb0Cb4UGPyDqKpsCm/o+MuGH9Z6BT+JPZc58wOVoFA=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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

--Sig_/c=tGVWTLF0wnpnscJnujf.6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.

Regards,
Lukas Straub

Changes:
-v2:
 -test: add license
 -test: factorize testcases to a single function
 -test: test chardev_change with initialization of new chardev failing
 -fix chardev_change with initialization of new chardev failing
 -add reviewed-by and tested-by tags

Based-on: <20210316135907.3646901-1-armbru@redhat.com>
([PATCH] yank: Avoid linking into executables that don't want it)

Alternative based on:
https://github.com/Lukey3332/qemu.git yank_next

Lukas Straub (5):
  tests: Use the normal yank code instead of stubs in relevant tests
  tests: Add tests for yank with the chardev-change case
  chardev/char.c: Move object_property_try_add_child out of chardev_new
  chardev/char.c: Always pass id to chardev_new
  chardev: Fix yank with the chardev-change case

 MAINTAINERS             |   1 +
 chardev/char-socket.c   |  20 +++-
 chardev/char.c          |  77 ++++++++++-----
 include/chardev/char.h  |   3 +
 tests/qtest/meson.build |   6 +-
 tests/unit/meson.build  |   5 +-
 tests/unit/test-yank.c  | 201 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 280 insertions(+), 33 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/c=tGVWTLF0wnpnscJnujf.6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYuocACgkQNasLKJxd
slgQIQ//atwmJYVZZYBZ8dEt5jAPhrxuGVUKRlZl29TJaLpzwsmQRAWXySuSfgq0
sWPmnY3ThbvzTqkuzy2+n0zeVkocCFrTNNVXY+BxsEH0s2vARjqavH+NArcrec5A
luEnX8qwP6MGWFzzeP3dOqsErInQYGHmPrKCesjFi3gcPb+BEB3DDVLfB3GgzbV6
4oWG9x+4cL3U+IJMy+omNo38XMnPHkHI7lWLDyncpddzL7kYnNBQqzL7pplYi4MY
6ZixeeqUTl2HY1gT8fu/VCgfyCMJQCoAR09xSqtOl67ngZc5b8j9IOZ7h0UiO9M7
wEqhCGhxzRAlB47xQK/flNy4eCsI+uFAsdL1fDqu2mHSon6/UpHj/JuGykHyCR3r
WVYnZiD/T95EYMWie4xNjF71FASo5gQnNHXT0fMQ6noIxNPfN7JZxgIBrfrGA0jx
J9dDWwbPcXYdNFDCrCiraUmR84XiaFlz6S45NqS+9PhyOTUovpPFJdOc4PsUj6xT
iN7D6JqFmiDY7JWX4foPGkYLKUOpFuA7Cx4LlaWqS9jEEljq6e88aP7aS0g8Vpve
1wbNW2M0QCUjvaSxbOBCywazdTQv76g1cUO/6A0+NyCmBVpJ8RJM6AFOJUlm0x4y
QFu/GYA2VzPL7CWIT5Ys/9ubDDPQFpzdJlewttHQkfSfNA8xqXg=
=5LIH
-----END PGP SIGNATURE-----

--Sig_/c=tGVWTLF0wnpnscJnujf.6--

