Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1F2F9E37
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:34:26 +0100 (CET)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Snh-00016D-3B
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slb-0007jO-QW; Mon, 18 Jan 2021 06:32:15 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Sla-0000N7-0L; Mon, 18 Jan 2021 06:32:15 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGhds-1lFA8O0mMU-00DnXP; Mon, 18 Jan 2021 12:32:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Trivial branch for 6.0 patches
Date: Mon, 18 Jan 2021 12:32:01 +0100
Message-Id: <20210118113205.1915888-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5Gc967od3dN+OGgcQwtX/qPdD2y2V4G6Vjjf3AFzflsxG7RJoVe
 dJC1WYLeYUeH1tggFu73/ZnPQwH96j3uZRVrb/fCDMV9V6AeIoXtN8MHEzO06jsdQ1gUY08
 DOd1oHwUTxaZd4G/gKQhm8K3bPYo3vylI29M7r+gezUYLolnnaldtAL70SpYe6oHHX88hHF
 L/88wTU1mZ/2vzzpzo9Ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:83EzG334xOI=:wJerRRQ54DKSrWBOKTpXZn
 q3xvrwZ7+gv/yW6lsTxsBZAka9ftY0XVkjHG13ZHpeR4OL5G5BkbXXZKt0iFwtw8ryY+pmJMy
 jlFZXF+FBpgeDt5RyGC3Qvd+Pqn3JXx9sivhSAOaSohGy5G3XdZXF8t5gwMzhhbeZ13GMYknu
 gLEzAVL22qdpseyZqLurxZZrnPh5MWidYX5sH68y/e+lpWFPHNBtcTZHhml0n2i3N1Dt+D9bN
 T57MgmA1MW/X4VjbB0zW9TPJ0IBwLDORMgU7OqXZ966J0RsI2uXmPuebjGVWfnFwEadeprfsB
 YJf+KzLzjeVTr+8Csh2A/gVtiGdHzsX1A/EPYCt1Dp9ULMixgb4cFLEfUC/BDpJJNvWutMmY1
 SP8c3bnXaqoZEsD+D1SjSH1uMByGIKDB6BjJb+D6w0yFuaxF+XWvJulQaxkur
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e0cbcf1eea16e81f116560130a1b36da711fb102=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (=3D=0D
2021-01-17 17:04:40 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request=
=0D
=0D
for you to fetch changes up to 580e733321511ab4eda7d6ca14ca157d71ea8728:=0D
=0D
  hw/ide/ahci: Replace fprintf() by qemu_log_mask(GUEST_ERROR) (2021-01-18 =
11=3D=0D
:51:26 +0100)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches 20210118=0D
=0D
Fix memory leaks=0D
Use qemu_log_mask(GUEST_ERROR) rather than error_report().=0D
=0D
----------------------------------------------------------------=0D
=0D
Gan Qixin (2):=0D
  pl031: Use timer_free() in the finalize function to avoid memleaks=0D
  misc/mos6522: Use timer_free() in the finalize function to avoid=0D
    memleak=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  hw/virtio-pci: Replace error_report() by qemu_log_mask(GUEST_ERROR)=0D
  hw/ide/ahci: Replace fprintf() by qemu_log_mask(GUEST_ERROR)=0D
=0D
 hw/ide/ahci.c          | 8 +++++---=0D
 hw/misc/mos6522.c      | 9 +++++++++=0D
 hw/rtc/pl031.c         | 8 ++++++++=0D
 hw/virtio/virtio-pci.c | 6 ++++--=0D
 4 files changed, 26 insertions(+), 5 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

