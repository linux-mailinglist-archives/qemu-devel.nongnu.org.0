Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B349383C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:35:49 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii5k-0004gf-EN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlP-0005yH-NL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:47 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlD-0004Ns-Up
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:47 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGQWr-1lhqIG1nxt-00GsAE; Mon, 17
 May 2021 20:14:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/59] linux-user/sparc: Merge sparc64 target_elf.h
Date: Mon, 17 May 2021 20:13:40 +0200
Message-Id: <20210517181424.8093-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j3nCLG7BqGWs0O5uHVozDY/dlKQjotgbamzgzCFv1iMu+4T5n/z
 V0MHWxCou0Lztm+PCOkAarwjsTcMTvcdifNVODXiR185RtjlqP9nf7xslsoYf1m23Ek/1pN
 33GJ4qkTSUp13vkwbNvWC6o7DXBOnK91niHzCmu0H0rvg3S6imOAgbX1Syast9qikK92vnX
 qjI8lv4SmoqNTuy7gHz8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sDa8f22ue2o=:lVatV8I0j60j0hDevxpMVp
 fW9xcwH+Y3JeILzBgfds+moXbXD+F3NhkFyunRoGenOAc2+rLMglr6tq7+4Xyf1znW3eeSQpw
 GlnUGOC2vCB5Io6l6NB5Z7n8a/UQg8jwZCUt39bdBKp0lHOcvweMq+G4SVD/R7C4cN2uQKVPH
 ZVGOr/ApYXhK3azVS3T8D+0rTuJWypOSwpjVCDir+LC7FaLwCjNsldoYa7WsM569FY5AMRibw
 kpz+XUfsoePjcAEHScBB+xJxaZ2GeDxP05IT5ocVonKwtH9UNVyPQzqFDAHs1oeTROLp0Qdmj
 pkVivXxxYtXamhe9++Z+jWjtFqgUDS49jIiVLmD3nCtYDNDo8uTULyCWa/0l6qzGVoLJRHRm0
 HSLSaWSfv1WGvEzMKmz/Ba2rZ2VxL4wbQcQ7typtDfVd9ExVchJeg8nEUiuxZ8eSbOduj2IYw
 HvDacSZ7r0rh5rK5unWESRzShHZ15h1Zk6Oxkf3eLniMYKL4ZiGR6Js+Y6WItwZRnsbepALYC
 FWBZH5rEBje6WGCapVZOK0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc64/target_elf.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/linux-user/sparc64/target_elf.h b/linux-user/sparc64/target_elf.h
index d6e388f1cf60..023b49b74375 100644
--- a/linux-user/sparc64/target_elf.h
+++ b/linux-user/sparc64/target_elf.h
@@ -1,14 +1 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation, or (at your option) any
- * later version. See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC64_TARGET_ELF_H
-#define SPARC64_TARGET_ELF_H
-static inline const char *cpu_get_model(uint32_t eflags)
-{
-    return "TI UltraSparc II";
-}
-#endif
+#include "../sparc/target_elf.h"
-- 
2.31.1


