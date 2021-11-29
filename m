Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA04617C1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:14:58 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhQn-0007PQ-PC
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhHM-0001gi-8x
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:05:14 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhHB-0005TB-7X
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:05:10 -0500
Received: from quad ([82.142.5.50]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKKhF-1nB8dS47cV-00LnRa; Mon, 29
 Nov 2021 15:04:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Linux user for 6.2 patches
Date: Mon, 29 Nov 2021 15:04:55 +0100
Message-Id: <20211129140456.604255-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l26JedSfeCmTBviVrXZACItG+QiuGPy8yfT3ZsCDPFO/ojpWRq8
 dsW8D0tRf7l//K7ARnPKHEjtgNMZd18MccxGtRDHggnsvvpdfjOF6eIOBLjT7b9TTxw+qCz
 egvxQOHpcXFnh5kmnLyh4qlTrVdaWDkwF3jKzwnFEGYeBdUZQUj/RwMmysmlwvss30DwYRj
 zBUPcIUsusSY2qPCZfAng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JX9oVHchmY4=:TgV7u7ptvbv+gODuvV4ylf
 poouRhSJVCcHVbF7hpkyz/PW3fVDWxUNTJq/aTakfiddEXVxyQnqEQ4KovG5gBDcbnj1FlGtM
 yk7HoegHtKNTwRn9jq5aD0soYFDvEIXxphMF+jB1ygeCGBxE6ifZQrwaQiZbVtg7XeknwEnC5
 1/tS/JNAyfelEYYP2dn8Tel2kCy2mVolbNR8rKVTZFW+cQbgKB5IQQxx9gaCj+oX+lF8atFpu
 zpIsV47oEauaMcL30AkjkVR5RGRxGd/abduRUE8c1+m8BxPsUm5Jz/A/mXTcl3IWTaYvxK0XY
 NNDjA947Zmn8rqWE7nBL3TSpV2sh/onY7aM7rSk0rhxOem3C+RS6xFzBWCOYFxA29zLfmiwod
 Gd+5h+ogobhsTdWDp1PpRgQNbF4sKD4URjyfYDkWmyleUQX5fMaRyOM4l15NskHHZ6C5M8+7Q
 nSRzorQrK3FkTSBLd8Ik4GuBqJn8ovCBh3q0oOP897Z2OKMoYNBLxndtaahJrJxe4W9EWQTas
 2PTofQRhOEBIvK0/ieJLMZjigDe5HHDWnNVR50mWSBuZlMzYpAvHwxNfs1PcrIgzw76auw337
 Wcj1wMIp/fh3I/pEDZJ9OpDL90FxQS3Syr1LU8kdH/w3n3mxe4N5dfiMPDhxFiMYT3nbQY45K
 WOvE5Ast1YUwP+dbfPinLurpYaIvqj2cPxHRfrmS4QcPJglH/Z+FnHPY8PjLzL08Nf1U=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit e750c10167fa8ad3fcc98236a474c46e52e7c18c=
:=0D
=0D
  Merge tag 'pull-target-arm-20211129' of https://git.linaro.org/people/pma=
ydell/qemu-arm into staging (2021-11-29 11:56:07 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 0a761ce30338526213f74dfe9900b9213d4bbb0b:=0D
=0D
  linux-user: implement more loop ioctls (2021-11-29 14:54:17 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20211129=0D
=0D
Fix losetup=0D
=0D
----------------------------------------------------------------=0D
=0D
Andreas Schwab (1):=0D
  linux-user: implement more loop ioctls=0D
=0D
 linux-user/ioctls.h        | 4 ++++=0D
 linux-user/linux_loop.h    | 2 ++=0D
 linux-user/syscall_defs.h  | 4 ++++=0D
 linux-user/syscall_types.h | 6 ++++++=0D
 4 files changed, 16 insertions(+)=0D
=0D
-- =0D
2.31.1=0D
=0D

