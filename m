Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF186B970A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:58:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc52M-0001Ja-BT; Tue, 14 Mar 2023 09:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52J-0001Ig-Uf; Tue, 14 Mar 2023 09:49:55 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52I-0002eP-6E; Tue, 14 Mar 2023 09:49:55 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N63mC-1qZU8N3bZ2-016NZ0; Tue, 14
 Mar 2023 14:49:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] Trivial branch for 8.0 patches
Date: Tue, 14 Mar 2023 14:49:47 +0100
Message-Id: <20230314134950.569342-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Gvf5cwvf/1NeGajh4sXsd1QUvtYjOIqYRg5l1beRw7puuNs+F36
 aTCR4/lJpRlasmvriIAqoQrUaUG0hF2riC9jzr6vNkERM9fuysWnfRLEzDqwCK5MGIvBFPJ
 SHQqEYinzIFMQrfhiq/fs1PIaBeBamCV+yyOkGHykIpaCFvZd3K4xg+0N8mXK6petvGg27m
 fV5eB/D2brbyPkNH8PlOw==
UI-OutboundReport: notjunk:1;M01:P0:V/Ej2nLwLOc=;qK6stN+Ncat95BLT1urnaTnEGZ5
 dSkzLEjPao37avAdOEMkiFzufBB4N2E5T4QulKMEWZ34K/+5NU1xb5wwNQRaWyfkpY3JMfyoB
 VDX/ElEXk7lj59DHfxIkyYGbfGrW+3tkNNGE1CcqVSOg1Cwr72klq3Umq/LmSUd4wu0TsWAmD
 g+nHFVUv9sG8ry/M4LjstQ7VKqcsvKxB0M67+kOb+2DWsRbuL8Tk6DUN/cUP6An32wAoDgvQq
 b2qy77mmjCJR3tfA9lRLfyeIM7yPLRI0cnqkPMIkcgucwY2hQBQVK/FG6eeR3a8n+wAlV+/nd
 FdKkecU2lm4w60VLx/UyOiWub2eh9g0AWLPAGxyxh0nSgW/SdOsPkxhpHdUnqLRJxmrus4qoX
 eonT5wCFI/yA0iVA8/0k1DT1fO+v38g96WavvCryDtfmPFRIasdie1LBEp75JVZKDzOb+6P+G
 lNrqYXN3BwZUz83RsqFrVjDsjulul2xKtxbfaa/9ks8bJTDixW6DJSSQhXDooBOqFaHNd36Uo
 IOeuWLwYmEaLZuvl1F7B2D8MRKRHSo/wi1RKjnIFLh/GHV0CaZEIb+fRiE23N5+BgodoMX/Rt
 MrAvmOa51H6vd9kDduj15+2EwmbHE4d65yJv1ve2x2LaRDPeqkw/Z4rwLKjhD9AtPn6NRPQgK
 KZur2/HVkQwQOMGZMtuchrAG4zyq4M4qBTTOwxTiOQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc0915:

  Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-13 13:44:17 +0000)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request

for you to fetch changes up to fcc8f37ca3eca968932e5da716ec5e7fc05fdcf4:

  MAINTAINERS: Remove CXL maintainer Ben Widawsky (2023-03-14 14:46:38 +0100)

----------------------------------------------------------------
trivial branch pull request 20230314

Update MAINTAINER file
Fix typo in qemu-options.hx

----------------------------------------------------------------

Damien Hedde (1):
  MAINTAINERS: update my email address for the clock framework

John Snow (1):
  qemu-options.hx: remove stray quote

Markus Armbruster (1):
  MAINTAINERS: Remove CXL maintainer Ben Widawsky

 .mailmap        | 1 +
 MAINTAINERS     | 3 +--
 qemu-options.hx | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.2


