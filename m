Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F55C030B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:59:48 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob28Z-0005Hn-4l
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21M-0006V9-6Y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:20 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21H-0006Bj-CB
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:19 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqK2d-1p55VX23ud-00nQge; Wed, 21
 Sep 2022 17:52:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/5] M68k for 7.2 patches
Date: Wed, 21 Sep 2022 17:52:06 +0200
Message-Id: <20220921155211.402559-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3No6G36tSTA+3AQ9PjBYXoEYaOCx+E82v2upC10MMu7TNpxMFOU
 snxY0FrIXNTzBiW3iGY8BxqTButEkgixdXPiZOOIIxyd+HjSMx59jWmfv1GebmM18p2pbxy
 eEsKTx381/Eue8bRS9QzHnt1kriBdWOphofvamnD6qjzW11PMtgu/49h+UL98maDm1Q0ns8
 3mcLqQX1WsAy+w+NcdH+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sg2dB0qPT0E=:LDNqtW4a4YjBrrYkbM0Ml7
 bcRCo96DcwSX7ALskaKbljCPzVfB59chYeyX78JcK3RaEimeI50YLnj9rOnevGEKVKFGdAzJW
 MA6k89t7LvJQ8QH5Pa5i9DeBWahSneYikbdVq5BmSd9rixxNr+6Imuqr+6G59FLwsni8AGSkP
 77wa9x552E6/09PxXLiw45H18aCKsTUSum1BoExhLl29AgbCWaFOtHiH7/65cOb2iyPCfJUGA
 QmwHCvzRmuFJbjNziEjddnLap9XfhwUgAXxpSJxTcyLU+djB6FczyQh16w12cJELOablB0TM5
 dpUeSg+gtx4cOoXEmGcu4RqAHTwuw9gjArOgD0Y/j708/bm9CrxYP2qBU1peL0/i8N6qxZN0N
 pvST2cod9Il31a9krLUVD6mDSCapIZhF15hyxLzobszPKHSeRhrN3odB+Oj+4b1g5wectwskQ
 QWXESaxTfGqrYFONW5qvZXom82qRpQgYvLb40Z70PN8z1y5Cvfj3Tjqwc0Qr/bL2soOz4qs2f
 +QGIiK93AF65KSQ7rmI/PaWXgX/1q9Qj5MJAV656YysstF/GdDRiJTqnn4bCWRXpYFA8CEGDe
 7rL4FwKICUhtKhNQsOU7VfxHf+rc/ZS0wEbJbTcIQKIJOjWCwXcehKq+Nm5H++5NQeAN2fuox
 BdZfym0r620aGMRIKcsiA+IhxaMl5ImNn232/UnZotn2ZdyKc15hMmOmlFZWYLmJhiAAe8oYA
 X2L0MLkRBMc3Q2R6aWXTjWr6boGUuVlF7DgYPLRvpx7gqPevS2zOAq1kYhALELlAsGDfIxs/+
 B5BdOc6
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 832e9e33bc51f52fc3ea667d48912e95af3e28f3:

  Merge tag 'pull-loongarch-20220920' of https://gitlab.com/gaosong/qemu into staging (2022-09-20 14:17:03 -0400)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request

for you to fetch changes up to c7546abfaa1b1c2729eaddd41c6268a73cdae14f:

  target/m68k: always call gen_exit_tb() after writes to SR (2022-09-21 15:10:57 +0200)

----------------------------------------------------------------
m68k pull request 20220921

- several fixes for SR
- implement TAS
- feature cleanup

----------------------------------------------------------------

Mark Cave-Ayland (2):
  target/m68k: rename M68K_FEATURE_M68000 to M68K_FEATURE_M68K
  target/m68k: always call gen_exit_tb() after writes to SR

Richard Henderson (3):
  target/m68k: Implement atomic test-and-set
  target/m68k: Fix MACSR to CCR
  target/m68k: Perform writback before modifying SR

 target/m68k/cpu.h       |   5 +-
 target/m68k/cpu.c       |   2 +-
 target/m68k/helper.c    |   2 +-
 target/m68k/op_helper.c |   2 +-
 target/m68k/translate.c | 196 +++++++++++++++++++++++-----------------
 5 files changed, 118 insertions(+), 89 deletions(-)

-- 
2.37.3


