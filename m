Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C74888F5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 12:44:33 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Wci-0003iY-NN
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 06:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaE-0001Wd-Pj
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:00 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaC-0008Aw-TW
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:41:58 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvrVJ-1mGLph3GND-00sw43; Sun, 09
 Jan 2022 12:41:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] M68k for 7.0 patches
Date: Sun,  9 Jan 2022 12:41:45 +0100
Message-Id: <20220109114149.1275322-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6ry/y7oQfsmkMtH0v7u0y157yBrCPp8ECfloycN+lWqsyVNZe4g
 zWeQ2m1g0skVioc+oNABJ/XsEu0h+62vsjr2ozs87whWwPRG3s8J1d7BMI8vj1uR9ocjXK9
 fPOuHq59RU5UWACK0fhaPeU3uyC6VkL3J9GAWfcFw4k8JyjWxVSHgphNsRyH6cSblnznhli
 p2L4r+cRdmTnhzwh9b/fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:by5aKC+mFpc=:HhgO0cyl3zu4ceFbForUKQ
 +JdepwL2OI5MPj4zcKDWYZm39rac26hPvnFDokXdzgufCxK0zONxKyq3r5zfM5NQC/Eob4WWI
 XLOxzvaNQay9xtvf6HGOoVc95eOFqYM21lCrfymmmR02tU8dUUA8lmgIaiNfExOV5SL0y/YS+
 pGgrEDycw8UvaZEHBfossapZE2zGAN4NQKA5XKCbF1osOcnCypgLOaNAMd7dlsQBlWmTg8poY
 znESVpzlTKEdjcWZydKCftke+JXYM+GjebbwQ9ShIb73g/qjciXjHZ3jrMa5PMX92d2KAGOVe
 wn6oTD38ELTYPgBbCy92kth9cbqOoiu0Grl2k1bw4f7m2iD914FbbsV0cX5OqkF+uf+pdOO4a
 L6X9y76ChMmacFGvDgVpJuOJcieNi7c3WDUqVO4STlNNBShrkaYA9jARgMoN4Y/1BaRy6IGSE
 KC4sjLqg/Uk2qRvJ79ORDoWgCj3kG3RaShuFxNimRarZbs8I1hsm5S06ATWbza+7jddAsziic
 GYJ8UMwNjizIOV/YxSanSjOIot0ComuWFDq0FenDYCkgkUHbIAnSYCiHapR59xha/eiBZqw95
 2j4SDAA5cuwQbYiamWOi6kgcHZ9MgQedNDgE7mRQu3asF2eSB+Mk56SAAROQUqo4Ukkf/tMTf
 /g8ctm1tMi/0w88sZbs2LpH9KK1cqRU1bmqG+OGwZDLp+3Odz0bjEjFgp4v50WNjhpaw=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524=
:=0D
=0D
  Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into stag=
ing (2022-01-08 09:37:59 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-7.0-pull-request=0D
=0D
for you to fetch changes up to 31144eb6393b66b06a13e8a6ad0e730f9e82d4c6:=0D
=0D
  target/m68k: don't word align SP in stack frame if M68K_FEATURE_UNALIGNED=
_DATA feature enabled (2022-01-09 12:05:02 +0100)=0D
=0D
----------------------------------------------------------------=0D
M68k pull request 20220109=0D
=0D
Add virt compat machine type for 7.0=0D
fix q800 -bios parameter=0D
fix VRAM refresh=0D
fix M68K_FEATURE_UNALIGNED_DATA feature=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (2):=0D
  hw: m68k: Add virt compat machine type for 7.0=0D
  q800: fix segfault with invalid MacROM=0D
=0D
Mark Cave-Ayland (2):=0D
  macfb: fix VRAM dirty memory region logging=0D
  target/m68k: don't word align SP in stack frame if=0D
    M68K_FEATURE_UNALIGNED_DATA feature enabled=0D
=0D
 hw/display/macfb.c      | 2 +-=0D
 hw/m68k/q800.c          | 5 +++--=0D
 hw/m68k/virt.c          | 9 ++++++++-=0D
 target/m68k/op_helper.c | 5 ++++-=0D
 4 files changed, 16 insertions(+), 5 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

