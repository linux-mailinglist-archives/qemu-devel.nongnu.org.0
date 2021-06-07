Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1D39E731
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:06:02 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKZV-0004CU-PL
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRi-00040M-Un; Mon, 07 Jun 2021 14:57:59 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRZ-0005rV-07; Mon, 07 Jun 2021 14:57:58 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M5Q2f-1lpV5y37X3-001Rur; Mon, 07
 Jun 2021 20:57:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] target/hppa: Remove unused 'memory.h' header
Date: Mon,  7 Jun 2021 20:57:27 +0200
Message-Id: <20210607185730.346641-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5/ZTWBZ9zAd0mzTGRurjdrlH7asa+gUjGnBVnooo+27LlUvYP7v
 LBO++eJFfsbNZoIElngccompMTldzS+JZZ+rQ10D13dZFoHSyoYSjodtv3MMGPgRyhUBFRW
 3Yn4eUUCi5pkfBBJdchn5lAO+VJzNEWQolbTzeyk8yF67xRNdKsb/5yDFyzWU2ntV7+39OX
 BANbV6ztHeHjhUBzTQpXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KNAJpkMwrk0=:GsMR7edSKFwW+hEp2mjdzl
 85qohKRPYrejAyFlpbCeybaqnPWw9YRk9woAO/mVFJuWlIFDsbnKRRNVq9dgMoccHw9OMNZjX
 wmF6GTURGovLjAbGzq+Gj2VBlzXDHbYqJ1QJFYqVpM7v63GJUjWSX1T3JjN3qxe933BtRS23m
 Js3QIueuu7nPdIRDhL59j0Lnav7U3uy+f6b12K55M+ptZvp5URLcVIT3mOeQBjKxP/imGgPYC
 o2hwxY4wbZNP3ScCJyXHes392QCxkmvhHW2vSvgFYjs2t2mg+0GRFhUAmD1TjvqVzPWliyHm5
 lm6NX8rzpUcs03fCsFix0GbSUdhkosP9Rpd8WgmfyOoz/BQxkMiF5fN1f/+cLD0oGkAnCkNpa
 wyQp7U4w7769JILvrSLZAybEVltcV6Ivm2D7U7tToUS30DQ6Fq1DAadyGRAkktvMhl/b4Gnxx
 c8CQV36oa6lthdeivqYmhp2jQsmjyd31hfsqLC+xrdKRy4axelqrIZZoGAre/mhBACbeAN7SE
 jrYNUZMLrYxzbstET5AN74=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517101558.1040191-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/hppa/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 61178fa6a2a5..748270bfa31e 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,7 +22,6 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "exec/memory.h"
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
-- 
2.31.1


