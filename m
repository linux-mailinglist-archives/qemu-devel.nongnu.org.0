Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592164D1B5E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:11:06 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbUP-0001nw-DH
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbMJ-0006p7-2e
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:43 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:32839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbME-0001Pi-5a
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:39 -0500
Received: from quad ([82.142.8.122]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MA88C-1nKQcs19XG-00BYqK; Tue, 08
 Mar 2022 16:02:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] tests/tcg/ppc64le: change signal_save_restore_xer to use
 SIGTRAP
Date: Tue,  8 Mar 2022 16:02:28 +0100
Message-Id: <20220308150228.1616561-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308150228.1616561-1-laurent@vivier.eu>
References: <20220308150228.1616561-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QikEJERJ1Cq9jEKmiElBfDsuTyEoq8AKUf4Em9T11lhG9Q3PlQf
 JDVj9+/HYeOw6vtFS4Ihoz4oDyEezcsriJzFxWOXRlO9teldaAbASj9hRWrHGkYB9zTjXlN
 w37ipuxVmGh79lRkEBujHgAiYDNq43MulJv/4mTSDAxPViKG9V/btftEPJIGWW3b57X3G38
 gY0VPJcHVf0Lii0KG7oHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tx5IUjlafhc=:2fOVi83c4ZiuJfco6S/EyK
 M1fOxlZ1/3ljojRcpsjckIlfnjMjVkGcZSzV5PCeJ+oyOapfHQ3SQejaMvsGPXDgTprPKqt6z
 6tN97Djo/4GMbye1Iqx7TwT9280haokUMo/Oxda5rgwwAcmIva6sr6/ActcnA/IUeQ2TaQlSB
 AoDXXbjJOpPF/+/ETHPXcatq3FiUY3/D3Hath5wG/RPFlqtDBWyEjUW8nSMaPPKc6MArh6WPm
 J85XWoruHC483TUDb4m6veLCUfWm16CvXugN4cb30fXecymTY9+fY8WceS4PQWXGLS/YgvzWD
 7NXUV4Brgp7FjtP1aTX0B4YCHI2IfvLtLTeBgeDPAV4z4dU1Q3zPkWzFnOxMHTkumOf39fvDa
 J3F2a9aYleor6s2EJHAfTtvo+ZxHY09zym+5HclEOgHTe4GSZb89btsQdgSL6F7EgWz5JtpxL
 KSI4GTFB9qzQT9B40Cz3591PazMSigDkHiYeybdPCCqZLLQ2fdQZN51W8G8kwSxc0FT7rQNS7
 nSi//wBao+01fr770vDLZON+eqXouuOzkApOVhRSXKGE3+mzx9pHGKkCOyu4e1XGvGpFzp+tE
 ue/8A3uRpN5O+V+MvwpH1bm4RZAgztP1PjSV2tt7cGakcfUd/4HXKD801cAWFoxYg9D4nEKQu
 DiTwlf9TXkpW41J210JaKErag/KGd7hjOmM83lsrK9TAtcdshjQg9rnt6N1pOYX4Ud8g=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Now that linux-user delivers the signal on tw, we can change
signal_save_restore_xer to use SIGTRAP instead of SIGILL.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220113170456.1796911-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64le/signal_save_restore_xer.c
index e4f8a07dd7e0..9227f4f45551 100644
--- a/tests/tcg/ppc64le/signal_save_restore_xer.c
+++ b/tests/tcg/ppc64le/signal_save_restore_xer.c
@@ -11,7 +11,7 @@
 
 uint64_t saved;
 
-void sigill_handler(int sig, siginfo_t *si, void *ucontext)
+void sigtrap_handler(int sig, siginfo_t *si, void *ucontext)
 {
     ucontext_t *uc = ucontext;
     uc->uc_mcontext.regs->nip += 4;
@@ -23,14 +23,14 @@ int main(void)
 {
     uint64_t initial = XER_CA | XER_CA32, restored;
     struct sigaction sa = {
-        .sa_sigaction = sigill_handler,
+        .sa_sigaction = sigtrap_handler,
         .sa_flags = SA_SIGINFO
     };
 
-    sigaction(SIGILL, &sa, NULL);
+    sigaction(SIGTRAP, &sa, NULL);
 
     asm("mtspr 1, %1\n\t"
-        ".long 0x0\n\t"
+        "trap\n\t"
         "mfspr %0, 1\n\t"
         : "=r" (restored)
         : "r" (initial));
-- 
2.35.1


