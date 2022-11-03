Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155A617918
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:51:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVv1-0006cd-9o; Thu, 03 Nov 2022 04:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVum-0006Wl-MQ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuj-0004B4-Ku
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:31 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIyiY-1oae1U2l6g-00KR1a; Thu, 03
 Nov 2022 09:49:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/4] Linux user for 7.2 patches
Date: Thu,  3 Nov 2022 09:49:21 +0100
Message-Id: <20221103084925.3860524-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YPn2O4+LurflJJ4jgaNiMWfiLIbTWy5822gG90scPF4kQ/xmnJz
 s7LdmWjQ+lElxWlNdmyS061xtNwwrApH4GFYONGXDzZhVEu2CuFDfrz4wV8pVLpzLMTuOeC
 EsFK12INIHnQxv3fs3fabtHpJ7petO/6ZCHXSPtzQs4XBMbuPROddPV/+mfEC43jjgj76va
 FQHe56sBbd5yk2WVUws1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6ZIHKSt0siU=:cm8Tcd4jlDqIiJpvsnhypA
 afBiqfndKA8t9T50TX7TLKf3EXIEO5R80VSHHwxhc2wpeLUOUfuFUCuQCSF+6XTfazirHoeqJ
 9U1JRfb+P9I7WTpoT6xlD3kAyPcOTCJW0kKIbiWvtRfVHU/Dm+YmdJJ7a0K3Nmttva9Dm3MwQ
 zFg5J++mO2MrJW5z4VZCyWwwVWqNjwvtfKOidnLoobrRIY2ij5lY9TYIESMCCCpwZmGdJiEEm
 tLfjC3caqwmtz5qRf3yTICtgxQaOsraQDgyqOKdpMwVRziv433tMkiCHBe3uGU7q7iG43EmcO
 g8hyrkpNpjJC0KTO8ofHVT59Vssfw8LBBQb9nA94ZtFUvHJWRxYw3tZYF8WTO1wybR9Plub/A
 beUe2t1WukrKZ4zuIVSKf4pUYNxSrG902xSmaDkXjmYT8gGtpSiSQSxaJZVUyRDH9kqtsRZTK
 SG3YsgMKx6a958b3TLsrFAO9S6IR9OX6826MLzikcsLyKkalK0Xbfj5VCeAqRBoXu4S5pPx7+
 qfPFQ4n4x4IxavJdka4zfk8aj0boqzzfujlR3N1ndI6tqQujcLykk1M0ywdvgEnLAEUgBWhwu
 iEKumd8O0Wu5/e1mXjGFETeqkEgcLe9KmP1QISzrHevvIGekqaRRTwmnFN/kCcFETvcrP4cXC
 NXONTquIcwyCw0oH4ayw2xvlBE+ZoLkxGstVYwhYwkhtrKme3OqK54rjXhZm0B/V1aHWB4MqM
 6xxuaS7gPSdmM6lSyPabQPuGdDdcJkDvZS2aGwhI4ry5HW4teliIRZzrDJqcxQ3rfm1OKzU5G
 00qgBEu
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aaf1:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-11-01 13:49:33 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.2-pull-request

for you to fetch changes up to 16c81dd563b94e9392a578ccf5aa762d01e8f165:

  linux-user: always translate cmsg when recvmsg (2022-11-02 17:29:17 +0100)

----------------------------------------------------------------
linux-user pull request 20221103

Fix recvmsg
Fix hppa exception handler
Add close_range
Add strace for timer_settime64

----------------------------------------------------------------

Helge Deller (3):
  linux-user/hppa: Detect glibc ABORT_INSTRUCTION and EXCP_BREAK handler
  linux-user: Add close_range() syscall
  linux-user: Add strace output for timer_settime64() syscall

Icenowy Zheng (1):
  linux-user: always translate cmsg when recvmsg

 linux-user/hppa/cpu_loop.c | 19 ++++++++++++++-----
 linux-user/strace.list     |  8 +++++++-
 linux-user/syscall.c       | 22 +++++++++++++++++++++-
 3 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.37.3


