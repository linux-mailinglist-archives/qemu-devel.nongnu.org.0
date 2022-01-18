Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44B4926DC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:13:52 +0100 (CET)
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oJ5-00088V-8m
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbg-0004dK-AM; Tue, 18 Jan 2022 07:29:00 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbe-0001vF-HW; Tue, 18 Jan 2022 07:28:59 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MN67J-1mrRwJ27sb-00J2Vw; Tue, 18
 Jan 2022 13:28:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] linux-user: Rename user_force_sig tracepoint to match
 function name
Date: Tue, 18 Jan 2022 13:28:45 +0100
Message-Id: <20220118122847.636461-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tsl2Q16fvXB8FNfFf/v1PpOY2UMUt9fOCM4ty45DVnz1nkd6cae
 YlNfvO/fFe5BP9rIkJrs8qcFP2dJ9g6pNtXrccv7ZFyYNlH8QmTd3gcw31E9jLrL2KgIyv4
 WA45vBcI/8o743Ommt3fiPVy5qglfZmppucjymAeul0JJsf4dLgU3IIanKrp1D+vTMWfjXx
 XDatr/NxQa19zro6IZIHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Thhiw20/mDc=:NwpC8qjD6mZxjPKDsN93Vm
 DkUBSd06aswz96tV0Fhf5kVaLhRA04DGe6SSFOx0FNmOSgXPlpC+L4vGK6oMH7+y9WsaSSAHG
 wYc23djdC6TKUmuvT8tBJKEPX3XqqEwllLAR2QROizuAOssRkXK1//qyCr945iORSdG28okc0
 QG+akhWqVsYNMkbi4G/zOX+x1T7rk7MvfwOvCZcimWzd8zyizT2z4pw69zcvQId0GRkbjUzjA
 Suceq2X6c3Am9dmcaES/NMAfbp6ksgGuSSOYIF1P1hs5mVpWQnIH0YV/UKeepgX2EJa4+5kxn
 vJIfNUUjGWPFSF5wERH3rMiYMFHNMG0PmF/CQIwBGK/ngAjFqGC7dshxukJUfKY13z5ostCUf
 O+w7E296X2+3t9QQ7YJXGHWXCNyDz6j3lMNm63FQmHZGPf3Rx3hGygOA/X7FhsB5xAOEgzRuG
 tdWUGC/wZhG4GkeIQSoc/0Z5eOimCVQv1KNp/66I4YNYmYm7XeKvGzScNJazyvU+XLxDGm3QB
 EnovDAjsDH8W0MhqdGeCtGYh02xpsGzq3uxRstvSxFD+jcle28vnLGeKlbrDwmEtik49L3mB8
 k72P5vXUnjDo9TyOzlKfbKAOCVYWiXmlwISLSQalQyw2bTf47g0NY2lS1+5lQkF3NuCZjhNr9
 aCZOokwaYQvrJROzayiUL5/7tCqqiv6c4fATDkLK29CASQGgVHflifkAZBTW8kgzv24E=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In commit c599d4d6d6e9bfdb64 in 2016 we renamed the old force_sig()
function to dump_core_and_abort(), but we forgot to rename the
associated tracepoint.  Rename the tracepoint to to match the
function it's called from.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220114153732.3767229-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c     | 2 +-
 linux-user/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index f813b4f18e44..bfbbeab9ad2e 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -734,7 +734,7 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
     struct sigaction act;
 
     host_sig = target_to_host_signal(target_sig);
-    trace_user_force_sig(env, target_sig, host_sig);
+    trace_user_dump_core_and_abort(env, target_sig, host_sig);
     gdb_signalled(env, target_sig);
 
     /* dump core if supported by target binary format */
diff --git a/linux-user/trace-events b/linux-user/trace-events
index e7d2f54e9401..f33717f248af 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -9,7 +9,7 @@ user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
-user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
+user_dump_core_and_abort(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
 user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
-- 
2.34.1


