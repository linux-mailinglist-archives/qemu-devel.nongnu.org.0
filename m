Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C032E4A7B3B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 23:43:21 +0100 (CET)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOLQ-000653-Tm
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 17:43:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEJ-0008UB-At
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:59 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:50179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEA-0004QJ-69
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:59 -0500
Received: from quad ([82.142.10.94]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M3DFj-1nE1BH310X-003adr; Wed, 02
 Feb 2022 23:35:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] m68k: bootinfo entry size must be aligned on 4 bytes
Date: Wed,  2 Feb 2022 23:35:26 +0100
Message-Id: <20220202223528.1260154-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202223528.1260154-1-laurent@vivier.eu>
References: <20220202223528.1260154-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ad8dPBU+fBCiMPztLBkTpurOfIneJv0+xfA9r3NqTOA+BnXACjJ
 61viPx633afRtmadoLODLd0x3cu4uVVExbxiW/CnG7+KmxqdAPfFMuHKQ8ixO7P8PISTdLB
 5nEf5Dm6pQSLuv2g5ZkElEsSsRmE/3OHFnUUVCsnZL52JBSr5nw9O3Yemzhb21fUPqGnKiO
 lH7haWc828KczPkWo7Fbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1P6g87Jkzj8=:1aCBTEGZfkeB2jpIIWpkWo
 sYirAi+RoH7W7LWuzZ1iDsxAYkyPhjzo97fJGAf/ku7/tIr6enFrU3UBhEB1bce4usbX45hyR
 6JWO2BEeXhWNO5cTmKepFgLF/5HhkxKCZGWRUDz1XAdmktRJr6rrhdSyqv0Ti/uqSiWdjEwkZ
 m5FDgCM6xfcMF/pea0yORo5k43l2Z3caEoR12Dc6ot43ISnC5h3oFcCmHZ2RzOEQqbKTPZ3xu
 1NXDWeU/ZikCliYRVzEJrF/9szHDYjeodtui5XFnrqn89EvyKTBAxcp8KQj7SCWByuNqGfal9
 u/eedP5X1hF9QkoUB0/bsShf6q6sAI6wae7zhmJaoph3AT5V8qzOtFSXnWt4ltYnrPPOK8ldX
 zZmoV2TqMlgHUBCLIgeHl9GZ6wh1hDzP98dXU9d41TZ4Ojrqh3ELZr16Rjd7tSovYnJABxp6f
 Apwj+ofD97ociiaLN1B1QR9p7dXxTFowl4wlMIIUT+Fz00HNQ/Skzdkr7WGUQfCGqUYg2skk9
 XuGN6tn6b8thVQQiw/hvb5kXP1JFKtbQnaXtDVblfOI3vlUtwIogow978pwfZ9Oq0/DAmzvzh
 APNw0WWDe46qBZOiIDeB67EIOXw19FCTgMlIa8LSPsN35bU/hGAB35VPIIb8FgoiZyOI8mLz3
 SRJwkkJQxbNt061E0lOlCkb3JLht4xxKdJPuseS8T5fhD1tCoj0qEe2aP4ny+FwKvGos=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is checked by petitboot.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/bootinfo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index adbf0c5521e5..94c97a71fa07 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -48,12 +48,12 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + strlen(string) + 2) & ~1); \
+                 (sizeof(struct bi_record) + strlen(string) + 4) & ~3); \
         base += 2; \
         for (i = 0; string[i]; i++) { \
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (parameters_base + 1) & ~1; \
+        base = (parameters_base + 4) & ~3; \
     } while (0)
 #endif
-- 
2.34.1


