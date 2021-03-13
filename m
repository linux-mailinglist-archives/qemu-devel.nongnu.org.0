Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F49339D72
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:50:14 +0100 (CET)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0uT-0000kP-32
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sK-000797-8C
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:01 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:44529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sG-00075B-7l
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:47:59 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mofx1-1m5OON3dsX-00p4IB; Sat, 13 Mar 2021 10:47:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Linux user for 6.0 patches
Date: Sat, 13 Mar 2021 10:47:42 +0100
Message-Id: <20210313094747.2966948-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6LLpjDy+FtUJmwbhFnpVS6mJKBGbN/fWdivENfxcKtvrJyijUIP
 hsCOh8SS28/dSfKjmzvyDdZYL/byhkBRFegsD23wC/wn9kNvPmlRIwztL/BygjjUur6fdW1
 3kt5kO6nJK8lT8nmqNG0q2XMVX4PpXXC1RwJ6k2y/MCGsnr/cWilP3zvK6gcdwllcf5v050
 yFiwRGgDEdd9O426SXzQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:06aNd7TfSKU=:V9VRyrF42lBm+AJJKZXKSP
 D6gWFdaFyUOEeVwTiNegcp3DkenuikvoDzdF/kG8+fEpqc33/R5CVMj2weCfxyENbqX3JWS+n
 k6z1D6h3Alzz+svHT1zhftjBMC7eqVJ/2BDYHuVxRcsL1DH/5xIfNmgiBbgpXUmENVE+7h9jc
 AVVO2wOY8sw3nY8kJVtEIBc2rCb5xlx7pwi97m2QGeM11wjdIXmFn92NOO3N2fPfdhAOJ+o15
 PE1izYZifEvPtvzF7C6sL8OUpDU859hXqqjrlFkRes17XVg8+Tlu9Cr9rsHAJPtyBvGGqRbDt
 fDu9mbcQOehaSaK1hCW/ZJNgJjq1hnuQKDg2bR7e/MdbixpX4CYWXpEF0VwhjMkKo8Tpu6RiJ
 Sa5mXmpTkxc5BL7Hh93CNmkh08JJHMIHPc8YOBi6JhuyqW6Q18fVbbicF9nP/3B41O7Mb7Os2
 /xAcezeGxQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3f8d1885e48e4d72eab0688f604de62e0aea7a38=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210311-pull-reques=
t'=3D=0D
 into staging (2021-03-12 13:53:44 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 0266e8e3b3981b492e82be20bb97e8ed9792ed00:=0D
=0D
  linux-user/elfload: fix address calculation in fallback scenario (2021-03=
-1=3D=0D
3 10:45:11 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210313=0D
=0D
- fix elfload=0D
- fix executable page of /proc/self/maps=0D
- add preserve-arg[0] support for binfmt_misc=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  linux-user: manage binfmt-misc preserve-arg[0] flag=0D
=0D
Nicolas Surbayrole (1):=0D
  linux-user: Fix executable page of /proc/self/maps=0D
=0D
Vincent Fazio (3):=0D
  linux-user/elfload: munmap proper address in pgd_find_hole_fallback=0D
  linux-user/elfload: do not assume MAP_FIXED_NOREPLACE kernel support=0D
  linux-user/elfload: fix address calculation in fallback scenario=0D
=0D
 linux-user/elfload.c        |  8 +++----=0D
 linux-user/main.c           | 24 ++++++++++++++++++++=0D
 linux-user/syscall.c        |  6 ++---=0D
 scripts/qemu-binfmt-conf.sh | 44 +++++++++++++++++++++++--------------=0D
 4 files changed, 58 insertions(+), 24 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

