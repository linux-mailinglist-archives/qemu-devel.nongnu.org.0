Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F154D1B69
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:13:14 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbWT-0005dw-FD
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbMJ-0006p9-2O
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:43 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:34081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbMB-0001P5-7i
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:40 -0500
Received: from quad ([82.142.8.122]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mc0Aj-1o1EDo0rNf-00dVc1; Tue, 08
 Mar 2022 16:02:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] linux-user: Remove stale "not threadsafe" comments
Date: Tue,  8 Mar 2022 16:02:26 +0100
Message-Id: <20220308150228.1616561-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308150228.1616561-1-laurent@vivier.eu>
References: <20220308150228.1616561-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g0/m7rk5vgMpUu+DmJ4kO/QPFY6DXLwcCyecfVQ7Aih7NFunlJ7
 s/O7n8B+yKXrg2nIZp+nPxOsPhDCv604zMxlHYrhwkJ1GupY6iTy0GGmAP4UZkK0AZNxH1y
 PTpbEy7eMbmRFCpoviCEfEJmLakupxT9VOXxHADxP33pBVxFvKpn1O9m6jip8rlEZMtun9N
 XE9bjAF1VB/KG+NpFKIhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LzK3DYsLtJw=:YqFSzsJcTivoiku3HaGCwJ
 ke9x4+iNcNvOKtcGcG4E7Sxvt9vDlmAAVtltHAlaJT+NdhtM15T9KznXoCZRN9WIQ65xtMXSO
 FSmriWdqMN7HXPla6m8VMDJT8yafXheGzgndNVbxt3H2wc+/vexWJMbf2fT/WP0u+BkLuTD8q
 UZ6358R0QryLQIHZS9m4rkApn1mgiFcGi7DOVAut8RDIpPR+kI/cWEJt2tiD1kkOiKtuwN2MU
 jGu76TD4ChVSKb3JKRG5Znp/MffwoNtrGQLkOnjBuw8DWGsaTce6RtHiehMhYvsyex3qH9Ogu
 aylY3XVWD7qEAPFcEqta/DSm1LnfsdsBBpW7JqddvKlBya8bGeQcPQSK36Ltnd2GfwY7GQ4s8
 5ie2ENPIAHyWNnABRkXdmI1kAus34KQlbKSOyqnuHNAUlLzNZiKdGcz+EpYaluJjMoUPYr1hp
 O7k08BlpooPvFTiWAnM1+S5DUFO/44YjbGPExKrysW2xTpxazbN/oPVkH6tE97Z4ti/25y84o
 2VPiD7Ay3kKdN7wnrwtn1VScSx1qcY/uAf12adgwOgfLMpVgWJ0SUPfUDqJEELLXKvM19UFCH
 sG15PkBmp2LMFGMqQVcqr9wFoIrnK/yDO4Rc2fNchug7EyCbWS2Ti48O6L6j6h7cLxURVyTKl
 ooHfyQc7LBs+Mu95rv47U4RHuVwel5nFzKA1/CGC+Yi6/3NuL/7+12tmBk3Cj/DHq4sM=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In linux-user/signal.c we have two FIXME comments claiming that
parts of the signal-handling code are not threadsafe. These are
very old, as they were first introduced in commit 624f7979058
in 2008. Since then we've radically overhauled the signal-handling
logic, while carefully preserving these FIXME comments.

It's unclear exactly what thread-safety issue the original
author was trying to point out -- the relevant data structures
are in the TaskStruct, which makes them per-thread and only
operated on by that thread. The old code at the time of that
commit did have various races involving signal handlers being
invoked at awkward times; possibly this was what was meant.

Delete these FIXME comments:
 * they were written at a time when the way we handled
   signals was completely different
 * the code today appears to us to not have thread-safety issues
 * nobody knows what the problem the comments were trying to
   point out was
so they are serving no useful purpose for us today.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20220114155032.3767771-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 27a0ff30e971..2a3f3cc23f92 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -999,7 +999,6 @@ int do_sigaction(int sig, const struct target_sigaction *act,
         oact->sa_mask = k->sa_mask;
     }
     if (act) {
-        /* FIXME: This is not threadsafe.  */
         __get_user(k->_sa_handler, &act->_sa_handler);
         __get_user(k->sa_flags, &act->sa_flags);
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
@@ -1149,7 +1148,6 @@ void process_pending_signals(CPUArchState *cpu_env)
     sigset_t *blocked_set;
 
     while (qatomic_read(&ts->signal_pending)) {
-        /* FIXME: This is not threadsafe.  */
         sigfillset(&set);
         sigprocmask(SIG_SETMASK, &set, 0);
 
-- 
2.35.1


