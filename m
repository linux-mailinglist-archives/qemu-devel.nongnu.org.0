Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359042070C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:11:27 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ4I-0003Zx-7v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeP-0004IL-RR
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeM-0004sB-JK
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:41 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6bHC-1mrXgw3HSA-0180yc; Mon, 04
 Oct 2021 09:44:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] linux-user/hppa: Document non-use of setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:04 +0200
Message-Id: <20211004074421.3141222-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H7hPEbc0/IcgVY0a7EXKCSa4CVlDmHMyMLX+19lYPv7g9ym74Wi
 O0w1/Ps/0N2WBAEFYTHQ8JEMODn42EcSL8alOtI15kY70k9/i3Zp6GqbhGTBtcotI0cfyFW
 pKlQ7cWrS2B8T/MIXcpbSbq2f0S6e7622MFpPHqY5qpaERZ4IKZIJyVO3yPyT0abBrJTZ/N
 HBTmADS+01QtCZn1llATA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AEUs1Usz8F8=:sLi2/Qidxzbztmn4VwzvqR
 Mz/nIFl9fruobZ5UBmoabsUQZJis8qZs4NXIKtdC5cDm0hWyuMaOTldK2ywhsQzTtMRS6NOfk
 qwsDzKw36lwL1I7xUON7IDsIxCY1UEAJT3Z7yzEHN99lv4cJ+oY0DMS6i1d9vHW/ozmAjfqN5
 dHFIvqNEYphXE6yEg93gGpAt9JFSdWLnqHRlYg6gM58lrR2jojZt0cYBhUohu6w/OjVE2A9TU
 6qK1IbfU6yW6yf86oJP8W4CtsNGVQfpXC4xSsJ1e7J0iktmBKTlrFvt+yToVwVyszjBWd5gcv
 vRHLATzGBho6vEK54253P8pRFE1ScXjpZQAoYlD7e9TIZyC0gv8ZZCjmPBhozfr96I5AC/X3M
 Hg0CDIqo9Kx85aidtbHACNEWWDp1BQCivceuu3ESRvzdbMPSHZNEHNbnlHszp+MoACkTU4ZFD
 G+IXSQzC17/GmMfagq45KhKNo9cbSrs5zCgJKdgY8JQizEKX+k6vwejsPa52kiFSzhjOBA/E4
 ozsbyaBdbcCP5oCBao8zwyKn1M1iM7WxJvQ94oDRXHQaePv327WFZCHSZ2TN5VsBAc4qIwHSC
 6m+vmd5ijoJ10HEhV27PAUhGHMme5vbe/ie46m/xfeqQ2cY2YnjhP5xdzVD2bxgpFpcmnVRjf
 Xv4WpAyPuLKHS3vk+ryGVgxCdRqh8dGsOIuGQ46A2L9dY6iUksUkCoZyqG9Om1hijtDehEH+5
 huve1FMkmsf/XzwuoUJMjIX+TRYGzqVrE2LcKA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e91a..d558119ee7bd 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.31.1


