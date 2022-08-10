Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08758F0D1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 18:57:01 +0200 (CEST)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLp0u-0003vv-Ld
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 12:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLouk-0008PE-I7
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:50:43 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLouh-0006fT-Ul
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:50:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Miqzy-1njCpw3gnc-00etju; Wed, 10
 Aug 2022 18:50:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/1] Linux user for 7.1 patches
Date: Wed, 10 Aug 2022 18:50:28 +0200
Message-Id: <20220810165029.2497766-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7tQsREowoNfrcm2qTfWXwJwIk9CDUSYP9ghQYKeiWwFU9D0vPzG
 Z+WE4hzrPOBG16Wc3sJoFHJ6aYGFsRilrl5SHVgSi+nVvLJ9qeAqu6xts+IkMyxrw0u9NV0
 WiRQsoYWHtw7mzM0Br3uwRStTa4mquy2C5NQwzcN605hdVB8IB0hZ0dqvHO9RPx7ulkXwqL
 Z5bsCxvHP04I4klouZcRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yl3pW888cXo=:2yAn714lcNEBZ2tbv0wvbb
 dvMveUJKyQx1c74NUx/ikmQ0ZV31fs14JIGDmCxvn7sAEj0QJuZEBP9Jads5TDWuH+HMYozug
 TfJgdxJwoD/kp7apKK2GZv9PHr4+2Knua6gbKZz3Pg6L35LosWLCCIH2345eEH1jNTo7/bnom
 J0Sb09oBkGGe+h3gt6gqc53bxYYnW9h27J6d55UnxHyV6Pv7ooeTonMJzPWY/uTRGM5DvMnxe
 oit2ptOGwCZSV+oe+963zUVWAa0Cj2WonXMUCSq+4xdV6j7h/SVz2xRgsbB5h6GueGm3jkc7+
 C3B+JKM6OvHtB8mEUP8o3kUSlXSTLOvwiSvBx5lX1yPgpX88WbIVMZ7V3/ERZAZ/pUKpiaIHp
 zkydcLAaYv6X+In9hppB2n7mQfDFqbvnv5tQVIHgJ4Rhw/lI7ZRMMfFHup7snruqs86AviWyx
 Qz2phu9jbRuSVbIid8w/W91fMbYqt60tj155hXiCzOon93DLasmBoyUEe5OSVttel91Rrl6rR
 wONLRLO84SiQDhbqSGofbEj8nHGOz5t63WqhzKSp2vU2e//bQFe4J2zyN81SR6f8FDABytPTg
 IGJ/2/i2W2Ld5GvtZF3kLIviOFPMMgTvh6vbP7LJ88rvQ3JKOmp2j2nrGYbPh+ABh/3tcHK8/
 TEQznrznc49hwrlP/170Ne2HGrZHuPQ33JMaLWwrHI0MnJPEEHObnAskXMrgFSi0mjpaX9ggE
 mGrQ1hlFXjr7mTH+iWft/rA47Bc6O1Qr9HW22w==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 61b6e67171c602cf6451e4928c9cdcc24c57a485:

  Update version for v7.1.0-rc2 release (2022-08-09 19:25:15 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to 3cd3df2a9584e6f753bb62a0028bd67124ab5532:

  linux-user: fix compat with glibc >= 2.36 sys/mount.h (2022-08-10 18:37:46 +0200)

----------------------------------------------------------------
Pull request linux-user 20220810

fix compat with glibc >= 2.36 sys/mount.h

----------------------------------------------------------------

Daniel P. Berrangé (1):
  linux-user: fix compat with glibc >= 2.36 sys/mount.h

 linux-user/syscall.c | 18 ++++++++++++++++++
 meson.build          |  2 ++
 2 files changed, 20 insertions(+)

-- 
2.37.1


