Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9C5ED9E5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:14:59 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odU5i-0001Pf-N9
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE7-000892-7D
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-0008AR-E3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:30 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4sD3-1odBNI2RB1-001y3c; Wed, 28
 Sep 2022 10:15:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 18/38] linux-user: Fix TARGET_PROT_SEM for XTENSA
Date: Wed, 28 Sep 2022 10:14:57 +0200
Message-Id: <20220928081517.734954-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GLxkgJWXhgl3ka54kgRWUzhl4meyQhHlOcjjabKKVDbluCzIGwb
 hTRYDGnwW6skUxl448P9upXXI0UFjtERYhoe6wbPQQ6dlE90U4C+WuxzEsTxT3nokWE/zm7
 epx33noAxcQXpzsqXB6Sjzc7mLe8Aq495HlAPU4BmM9E4fzsHFsCOh/HYsuP24xZo9kPpB3
 POGgLhYGfHSotxdawjuZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qsl6msnG2d4=:+PBlDlC0opVABD+OC95r5P
 A9t9K+SjB86YNcjStuN2XBBGYlBe3LJ7t0CWHvc98G0Hzp78Q+TTsUsvTQpenJa8qOoDXPhd3
 tDvPVBf8p4E+efoAbemK3GLJ+7jlpkcz9rniBsuCPSS8cJwC5Cse6uADP1+NdWw7p7Cyt3MUJ
 eJ40caEmDvGWsLgyU0rhzw0AXPxw0ReqnV/KBrTwid09Q6vqxv/cSLZfwJCsb31IQA2aJmFXZ
 np7tFfuGkKISmGijjlOVM7x1ofEUQ22C087ndY2hUQhBUT4rGU84wFzs9USvYSRZu7xATHx73
 MMLSLx7eha/TK6mwwgw4KoITuDy5TjQ9uRCQGVbLuzuTYiIlrRRp1Xfhs37ya3kIoVL4mnHYd
 q7A2nwqm5y0cvWRAB8HJihLi3WeZshxKbffnj0ujkBn3h71mAFf/6NNLIm1sLJ6JwAKL9Egxj
 12bpZ+EkugJph3W5YBETtOqWDc32ZH3CYvcRyf0l9msfaYpaNY84qS+0fmDHk4jD/KOHeAbe7
 pB9sip8/RifG9fko/EEHz/zDqYZaLtBgyquWQw+MqKT+ecal03TByLcNwyAQr356mWFT1a3nw
 /2gZMODQW7PYhLOiFPLuNaIoPZn7eJ5OhNVLLttOJ4C2co9uNTJZgC5DKpXxjy52jacJF02i7
 S4jSQ5yhLvjGBTbDVpwoAvmaBtUAaVWagFcYgiiCFVUryJkDuK9ijdIyYuhUqKNX8zQEPdF7o
 YYGxoe9QfW98E16jrEuslB6ugpxCLi1NpVG9ivjIjxruv7A5gUXjkLL+aznU582Ug8LXeAwOA
 mbNsFSj
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The xtensa platform has a value of 0x10 for PROT_SEM.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220924114501.21767-2-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 85b0f33e91d7..1e3577bfa56f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1246,7 +1246,7 @@ struct target_winsize {
 
 #include "termbits.h"
 
-#if defined(TARGET_MIPS)
+#if defined(TARGET_MIPS) || defined(TARGET_XTENSA)
 #define TARGET_PROT_SEM         0x10
 #else
 #define TARGET_PROT_SEM         0x08
-- 
2.37.3


