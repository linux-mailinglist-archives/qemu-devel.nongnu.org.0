Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6C2D8998
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:10:22 +0100 (CET)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koAHd-0001Lg-3d
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9U6-0000lB-Un
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:12 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9U4-00029t-Vf
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:19:10 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Movrq-1kLCGW3pCY-00qRXG; Sat, 12 Dec 2020 18:55:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] target/m68k: remove useless qregs array
Date: Sat, 12 Dec 2020 18:54:56 +0100
Message-Id: <20201212175458.259960-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
References: <20201212175458.259960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jw8Y8wEsow/FsjTlJFD11/GmhBDC8TvMOnKuS2/pFOnITKGctuq
 F12Mv38AbCnMws86mRz8taqc/FjbXGj7dSnw6368XHAvLugSaI1TrUBcrL+vaVMxRhSCmlL
 2CcJEtOgG6b+86+g8ZxOUvjJKEqUuyWvoVtA2Zm30Kwi/51luTQoxIOl7p3gHq5MMv2Gbp7
 CNwb46Y1mTrZlkpqN5XtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kp4Pd3k2Mr0=:hYrefMeLULHnpogM5SRnzp
 JmHpE1KJJKOMosknus/9kICoP4MBFEblHK+J6sazylYOdWPzHwBhDJgFrqoVsUEj6EmKgAkZB
 TjhIJBQoU99USQYyanyTKY7Uk4lzRphfr+spdb/LXBEaUEE45XyQEO+VS3F+L367UUWcHJhu8
 cnKxMRRAlGvqQyB41VfSIOYtBI/84nFkyvYXIhiK5EkTRtKpt5h0nP44qjZeR6bhMFRiQ959O
 WvBvSZrfDGD1+IDp+gA1jsD/wV4dtaTmDBEbM/MDl2w21fDfoTK5MPDqMhV13TBt24jl07SUy
 C5/r9sO458lPWzVbutA9gyifnOkVrFn1oudjquTTcLKeY0lT3bHT7Rsf8L0IhjLeZBC0Nf3JK
 xd8RsLShpavvqJmDC8UUeOrTGMQldLDmxKqlGM3hp8gJLMB+uSANrGwtpsIym
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
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are unused since the target has been converted to TCG.

Fixes: e1f3808e03f7 ("Convert m68k target to TCG.")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201022203000.1922749-2-laurent@vivier.eu>
---
 target/m68k/cpu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 521ac67cdd04..9a6f0400fcfe 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -33,8 +33,6 @@
 #define OS_PACKED   6
 #define OS_UNSIZED  7
 
-#define MAX_QREGS 32
-
 #define EXCP_ACCESS         2   /* Access (MMU) error.  */
 #define EXCP_ADDRESS        3   /* Address error.  */
 #define EXCP_ILLEGAL        4   /* Illegal instruction.  */
@@ -139,8 +137,6 @@ typedef struct CPUM68KState {
     int pending_vector;
     int pending_level;
 
-    uint32_t qregs[MAX_QREGS];
-
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
-- 
2.29.2


