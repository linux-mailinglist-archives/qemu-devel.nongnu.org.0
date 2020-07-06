Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40302215FE4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 22:07:37 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsXOq-0003BW-8r
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 16:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jsXNd-0001bb-JE
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 16:06:21 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jsXNb-0004sd-QL
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 16:06:21 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5FxN-1ksvBm11OP-01192U; Mon, 06 Jul 2020 22:06:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] M68k next patches
Date: Mon,  6 Jul 2020 22:05:56 +0200
Message-Id: <20200706200559.160209-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QMb/K/vKy91cDn+6Q9gahUNR/YOyHsIleT5l0y3DcGKOHH5417s
 yThTFDtK4RKOX2Q44qHlfU+z0oygwTa/5OlRY4TJYpdZ42WHAX+83A/tKl9FWdlpatUI0pD
 qKXEah8rulEy1NMdqPlcB3TEWdavh1psLm6mnD/M+OGrpIuVlS7uaUrLY9gblBLITjHH6Ne
 oTnm5rAvAXxnFYuJN4gbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CiBS6l7P3fo=:e1RewxE+aCGOrNrr9JguUa
 RkI5sGIOeoNSj+/Pc4MK+4wFTfg2Yfr/E1G/OfQ3NZi+R+AG8vj4QoexfyuzQ+j3a1YcOQ7tF
 pGUA3eTvprSy4J3R3ZLdkPc81kkKNXYpSaWMpeVGtqIJgKjLz0DF4mNya3qww++JLXo7NoS1u
 Kr+B0BoOzmChEbnTkMIxb22eNfTshMja5nrkW0LMkOEjnqXnShpDBuR2IJ3teH+3pJEHdg9go
 GwfLm4QCWJf8WxbVSjFhUW40DjACFRCpK/66cJl3IL+qrfZl68IvL2tqN8F8M0odpYcwp011j
 JvydGvau1pC7EaV71R6OPJ6A4nb+hVHZmRQW7/r1RK39R6+srpiCfpfarjwj4+xxWRwmiEa9u
 lSXctTBJq6oWGkZFw/6Z/me7EcZyBMj3vUWhz50loeHx/PamvrixfMI6sTUBr0o3PnALwjlro
 VUY5U65Slwfko2iB3HV5gI2kmwunfZgnPEW+rrbt3OprRBXTYqmCXzx7jHsQv22oP63hpqKEF
 pP9QbY2ZnCD2IJh95qQHWZOQ5lgkTx4QchedZF1H3rZWlQPjcHEekbRvL7F5EVOjTzljQnP1n
 Lf40sG7bP/HKvPyOo8wTWKi/nSTMmrtTLgQgfswXeKC3r4/+7iTocb2oa1br0AKJgf34mjZ5L
 64Lul3Ml48UQMzLF5kqaZBf430jc9YR9wcBbHEo3ARdVTDQIALAy56++RCBcqCWre4pJguQCn
 hLQmkNGD6wuNbL5Ex4xv9wJ56lxTjOrc7yN3/VbPgsjDHChHxHTBkgixppMANnX0o6TgMR/GX
 8cnhWSqdF3flCbsy6kZXfpsi5pliyFXCqzm1BYPoFUVLtTiEbslQyphbFsEpbDScR9zlP8E
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 15:40:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 64f0ad8ad8e13257e7c912df470d46784b55c3fd=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2020-07-02' =
into staging (2020-07-02 15:54:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request=0D
=0D
for you to fetch changes up to d159dd058c7dc48a9291fde92eaae52a9f26a4d1:=0D
=0D
  softfloat,m68k: disable floatx80_invalid_encoding() for m68k (2020-07-06 =
21:41:52 +0200)=0D
=0D
----------------------------------------------------------------=0D
m68k pull-request 20200706=0D
=0D
disable floatx80_invalid_encoding() for m68k=0D
fix m68k_cpu_get_phys_page_debug()=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  softfloat,m68k: disable floatx80_invalid_encoding() for m68k=0D
=0D
Mark Cave-Ayland (2):=0D
  target/m68k: fix physical address translation in=0D
    m68k_cpu_get_phys_page_debug()=0D
  target/m68k: consolidate physical translation offset into=0D
    get_physical_address()=0D
=0D
 include/fpu/softfloat.h | 24 ++++++++++++++++++++++++=0D
 target/m68k/helper.c    | 17 ++++++++---------=0D
 2 files changed, 32 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

