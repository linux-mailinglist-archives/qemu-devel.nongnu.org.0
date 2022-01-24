Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53154979C4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 08:47:43 +0100 (CET)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBu4k-0007t4-Dg
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 02:47:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nBt59-0001Gw-Tu
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:44:04 -0500
Received: from [2607:f8b0:4864:20::441] (port=45850
 helo=mail-pf1-x441.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nBt57-0000fJ-6M
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:44:03 -0500
Received: by mail-pf1-x441.google.com with SMTP id 128so14975478pfe.12
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 22:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Hs8nolBsMYaHP3sft5wWhNTI+A3tOi5VfSzy+f2cZw=;
 b=ssdUOzpsEsI3NOGsffninsyLq0AbtBEffZ7lZLnxZiWNsGozNwf0WVxTvxyYpINEUY
 DCW52gDILqGuUZZZQIsq/kPAO/oEz1jV41p5nTDsv3TRof9dfci5vUeBZ/9fzWuvXciY
 Avq8Xp/fbmo7bMa99tH6o3cyqYN/yDOmDThdfihq3gT1XwvZdXpPgP8g5k46JEwsWXbz
 fFiASUhb4meLUuOA7dzfOLoze6BUYWqdoLZNohqLu8OtLW0YScgbd4EXnCEntum2atte
 F0Oa4EysxRAxG2Jqucv/3dMYfjc+TR6g96QsSFXMhr/7HGQA9Veh864wXEgLMCcyIKPq
 vU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Hs8nolBsMYaHP3sft5wWhNTI+A3tOi5VfSzy+f2cZw=;
 b=vnluU3it3DWhYqpiFzUwpFbhMR3UQukTv10wN4K74KcoIhlLpd4HLEubUcw9yMK0WF
 qre04y5jFUhqtXh9hlGlvo7yEo613SFC/fvIt2vuRxBmGaU+V9IwZkHP0zK+7ih7W4Xv
 NEXG5ThLfGlj+Nf8XAnMf5o2/Q4wqKnUNArkQWyO19YsW4mFAmFvVRyb+wNpifTCVaVr
 5kt2t7fzg7jLUZURkLkQxO7IiCbMaWUmM8yNyJBxO2k3VJ30Ip1uWee1wzx4PSc2JbqN
 7jX22p5xboDD98xyHYawiSMhsBAWZBaLQTw81mUJqP4FaSlAxc/IC6JS2XLtAqu7+iZA
 6ohQ==
X-Gm-Message-State: AOAM530XA5uAPhWhC3GWTLuO200djAhs4RzyUPg9lz+jdxhPecKz9Lif
 gcC/rW7kVBbY22VxxyYyLY5LPGeHiUFVT9I4lSLadA==
X-Google-Smtp-Source: ABdhPJwj+H4II1XPyunaKXVGAyOE5KS5NV4y5gy/5+Q3RcuCe8W68fKDbfnEk4FunkBNvuH5xIOojw==
X-Received: by 2002:a63:5752:: with SMTP id h18mr11090395pgm.520.1643006634948; 
 Sun, 23 Jan 2022 22:43:54 -0800 (PST)
Received: from fedora.zelin.local ([103.177.44.9])
 by smtp.gmail.com with ESMTPSA id na5sm6671387pjb.23.2022.01.23.22.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 22:43:54 -0800 (PST)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hexagon: remove unused variable
Date: Mon, 24 Jan 2022 14:43:39 +0800
Message-Id: <20220124064339.56027-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::441
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::441;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Jan 2022 02:29:42 -0500
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building with clang version 13.0.0 (eg. Fedora 13.0.0-3.fc35),
two unused variables introduced by macro GATHER_FUNCTION and
SCATTER_FUNCTION will cause building process failure due to
[-Werror -Wunused-variable].

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/831
---
 target/hexagon/mmvec/macros.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
index 10f4630364..44781cfb4a 100644
--- a/target/hexagon/mmvec/macros.h
+++ b/target/hexagon/mmvec/macros.h
@@ -164,11 +164,9 @@
         target_ulong va = EA; \
         target_ulong va_high = EA + LEN; \
         uintptr_t ra = GETPC(); \
-        int log_bank = 0; \
         int log_byte = 0; \
         for (i0 = 0; i0 < ELEMENT_SIZE; i0++) { \
             log_byte = ((va + i0) <= va_high) && QVAL; \
-            log_bank |= (log_byte << i0); \
             uint8_t B; \
             B = cpu_ldub_data_ra(env, EA + i0, ra); \
             env->tmp_VRegs[0].ub[ELEMENT_SIZE * IDX + i0] = B; \
@@ -243,11 +241,9 @@
         int i0; \
         target_ulong va = EA; \
         target_ulong va_high = EA + LEN; \
-        int log_bank = 0; \
         int log_byte = 0; \
         for (i0 = 0; i0 < ELEM_SIZE; i0++) { \
             log_byte = ((va + i0) <= va_high) && QVAL; \
-            log_bank |= (log_byte << i0); \
             LOG_VTCM_BYTE(va + i0, log_byte, IN.ub[ELEM_SIZE * IDX + i0], \
                           ELEM_SIZE * IDX + i0); \
         } \
-- 
2.34.1


