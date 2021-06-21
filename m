Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B548E3AE7E5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHlY-0005f4-Mu
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHja-0002pl-42
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:54 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjW-0003v1-UH
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:53 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVv4X-1lnlLG1xtl-00RpVY; Mon, 21
 Jun 2021 13:04:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] linux-user: Disable static assert involving __SIGRTMAX if
 it is missing
Date: Mon, 21 Jun 2021 13:04:38 +0200
Message-Id: <20210621110445.231771-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ppuYd3siwGHqD5LvgMYXjrTPiJtZgt4yVWY+2JGZIVRjRDk+7LB
 CSpG0OBeCZJc4MdldSsW2pKYKl8QSs4kknFSLvNAVi+uVIb4kYrvE52EtGSJcjLbU11ZBTz
 ZjPOgPs5z5Wk4BNTnMNJDbgR5/f9yiFldlqpA0n349QB3jb0phgTIk5ICn7zZr04AyRAmkT
 tWE5prrl1OF/SufHnaCyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hbLzzeU6BSY=:eMuOzvT0uw8CR0+jU0HiQc
 g6XVdm3lBx6VNj6xRlOCOC43Gib9X1awU5atsWhK67L49qQ6gBP40JAx1OZV7Bf3MZC90uWQn
 9HHGCCgaiE8qrWxPt524PRrMf/BMLAARFasR2nm0+YtGGm2M4QGorzfZsYU1KbqnuifjS1G1g
 QlUNhKbeAc2dQgDYP385EOrL454pcK7Ydl4mqR3Z+fTfLPTxBpBHvZ8xJiEBx56LBKgDkDEfz
 Q7UytNHdIuolbJAzFsm22YxqvkEE4l2aH0Zb3MoPjaLHfy06Q3W76OJUOWh/ao+pt/SPe2CFm
 Pla2oTSqjZP3ZRdnT8aYgbrf+mUsCkj+gkLpLfS4qwUEvtF/zwYLpsLEUKXZOmikn/4wyf5cn
 Tz1R3bahdOrhJoGQZp8Ij15MBbenv52QwxfkBenh6FKv/2OSat9q6WnuBzN71KWqcFOqu8ePM
 le5V4iNm6JASTf+K1eMZ9MFH4w/bm8TB135HNDnP0npi5tQ2vCG1SDWpzGP3QpBK6yt0BXQ1L
 oVAxXWLYfqOjDGgfNYBRA4=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Forney <mforney@mforney.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

This check is to ensure that the loop in signal_table_init() from
SIGRTMIN to SIGRTMAX falls within the bounds of host_to_target_signal_table
(_NSIG). However, it is not critical, since _NSIG is already defined
to be the one larger than the largest signal supported by the system
(as specified in the upcoming POSIX revision[0]).

musl libc does not define __SIGRTMAX, so disabling this check when
it is missing fixes one of the last remaining errors when building
qemu.

[0] https://www.austingroupbugs.net/view.php?id=741

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210526190203.4255-1-mforney@mforney.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9016896dcda0..0f19c59deee9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -38,7 +38,9 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
  * Signal number 0 is reserved for use as kill(pid, 0), to test whether
  * a process exists without sending it a signal.
  */
+#ifdef __SIGRTMAX
 QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
+#endif
 static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGHUP] = TARGET_SIGHUP,
     [SIGINT] = TARGET_SIGINT,
-- 
2.31.1


