Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819202A7762
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 07:11:08 +0100 (CET)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaYUF-0003aQ-Bw
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 01:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kaYTW-000366-73
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 01:10:22 -0500
Received: from mail.ispras.ru ([83.149.199.84]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kaYTS-0004KE-Gl
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 01:10:21 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6322B40A1DD8;
 Thu,  5 Nov 2020 06:10:14 +0000 (UTC)
Subject: [PATCH] replay: remove some dead code
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 05 Nov 2020 09:10:14 +0300
Message-ID: <160455661411.3455.4177953912304752892.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 00:51:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch removes dead code in replay_continue_stop() function.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 replay/replay-debugging.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index ee9e86daa9..1d6a968406 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -278,7 +278,6 @@ static void replay_continue_stop(void *opaque)
             replay_continue_end();
         }
         replay_last_snapshot = replay_get_current_icount();
-        return;
     } else {
         /* Seek to the very first step */
         replay_seek(0, replay_stop_vm_debug, &err);
@@ -286,9 +285,7 @@ static void replay_continue_stop(void *opaque)
             error_free(err);
             replay_continue_end();
         }
-        return;
     }
-    replay_continue_end();
 }
 
 bool replay_reverse_continue(void)


