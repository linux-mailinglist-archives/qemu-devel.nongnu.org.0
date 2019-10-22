Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C6DFF41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 10:18:20 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMpMx-0000aS-0t
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 04:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMpGF-0002em-KL
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 04:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMpGE-00053c-Cc
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 04:11:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57117)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iMpGE-00052o-3E
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 04:11:22 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwPfX-1i4Ku301yv-00sOZb; Tue, 22 Oct 2019 10:11:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] linux-user/strace: Add print_timezone()
Date: Tue, 22 Oct 2019 10:10:57 +0200
Message-Id: <20191022081104.11814-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022081104.11814-1-laurent@vivier.eu>
References: <20191022081104.11814-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9wKceQZbFkT5WG5OXBjMel3+MhU5aaKV4bJghqBP929uN6MkBc9
 y2wyt8DhKKgC0Et1hOplhxI7aYXnqCLI/tCpKTuetUQaNsnCD32xKdx1C1Ck4wXOE87Gfy3
 CQ6bWgtNujLQ2oh/9f++HswjCmzki3COEZ52c7ufTaaPO1oWBqGlQwOIUTCCIrjMyKJ8b3e
 JIBd7MpTIunI4c3CrDQLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:58T0ejQNKkI=:BrwCANgLcZm5oXNFfUYTeO
 6gkrC75oCqsOIpqjbxW6vaP40g70zaOaqEcdLlpKIQLHhmGULNXtKdmwVBvhfpR19jsmIZoFH
 n0f3mY1bMreTbk/KgcaKQWJpf+6iSHPdpC0fqxBLdynpGE5mX4Gj/vmGWyCndK2mLfsqjanNF
 9aAtQxqFxFIyUCy9tMtGQXheqYhmzSeFBXVEtSdCOO/W9K+n/WtM+QGNvUeCMe4O0XxoAfmFs
 Q17KZ3uU/zUFc1bH3a5Fpj+xjHPTTX7C7E/Vc0Gdfa1Dt9FS1xh9lSqzDpKzwa4DO1F6vxuyG
 pNN46ZR0rUMuspdt3UJsfd20eawgegFW6/cEZwva1NKkMruQ7iymNNthUuvUH2cW6t42VIJLw
 BUDoalsdrW+woBhhmLV+HKVlelwLalHTjGakff6X5E7h3W6cRM2rmt6hn/sXRtqeu4WDjeFKi
 I75iRT3/f9vl3PKY6Z8dmAlEhsrYUEWXIgmEQielWNwwBuLNMOtZwsaeAeIWLjoO3Zi6sTtVJ
 A6unb+387osC3Spasu7qPMxAKEu/iCYBkMXmOwDxhrbbYPRNaoyBip3WrOdoxiFVGdxooYSLH
 2cjrWWS8tE+WxH1pA3Gnr8rV4fqTB0e+8fgk5t75qrwkK6tMUzDJ13fkq1aPu2+i5xThaA2B3
 0BIJHylKz6MVwvaavBwmzV/5yjJwFBxiycM8Vxf+lJeJjozDy8UYUprvxJing6kAn528x9IyS
 SXiRjIA1Yi3VvIGPNriajDjs4c7o7l5EqofecrALUYJDGkerG8zM1fOOWpAVxEVj88Q5KYg31
 w1fsMC90TWOISKfVqweLrylWpH0Py2szMxbVxVzQmbeyn9JvI3wZ46OcLejzyfmyAma+wfJ86
 Sn5x6R3YO3EQlGW4cCm8oiUZKV/ejUishSgYTBUSE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Suggested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191021114857.20538-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index f326c357a26d..2cd6687cd99b 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -63,6 +63,7 @@ UNUSED static void print_string(abi_long, int);
 UNUSED static void print_buf(abi_long addr, abi_long len, int last);
 UNUSED static void print_raw_param(const char *, abi_long, int);
 UNUSED static void print_timeval(abi_ulong, int);
+UNUSED static void print_timezone(abi_ulong, int);
 UNUSED static void print_number(abi_long, int);
 UNUSED static void print_signal(abi_ulong, int);
 UNUSED static void print_sockaddr(abi_ulong addr, abi_long addrlen);
@@ -1254,6 +1255,25 @@ print_timeval(abi_ulong tv_addr, int last)
         gemu_log("NULL%s", get_comma(last));
 }
 
+static void
+print_timezone(abi_ulong tz_addr, int last)
+{
+    if (tz_addr) {
+        struct target_timezone *tz;
+
+        tz = lock_user(VERIFY_READ, tz_addr, sizeof(*tz), 1);
+        if (!tz) {
+            print_pointer(tz_addr, last);
+            return;
+        }
+        gemu_log("{%d,%d}%s", tswap32(tz->tz_minuteswest),
+                 tswap32(tz->tz_dsttime), get_comma(last));
+        unlock_user(tz, tz_addr, 0);
+    } else {
+        gemu_log("NULL%s", get_comma(last));
+    }
+}
+
 #undef UNUSED
 
 #ifdef TARGET_NR_accept
-- 
2.21.0


