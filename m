Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D933BA69B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 03:21:46 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzULp-0000OW-7D
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 21:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IaPfYAgKCvIlcWUleifaiiafY.WigkYgo-XYpYfhihaho.ila@flex--ricarkol.bounces.google.com>)
 id 1lzSig-0002j4-DQ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 19:37:14 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:49891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IaPfYAgKCvIlcWUleifaiiafY.WigkYgo-XYpYfhihaho.ila@flex--ricarkol.bounces.google.com>)
 id 1lzSie-0002bv-9Z
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 19:37:14 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 gf3-20020a0562142503b02902b1b968a608so352333qvb.16
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=F/pAjrYCIdI1q9ubV+dr+puSbLBigZEoEUIGAS7nSVs=;
 b=ewKbrSrPwkwrIrtAVWUMoGgt/h6T0FJMzRjB3VQbfJtYlKKs2HKGbfNzKlKzIG9Zz2
 dD8PpW0aYb3T3piW+BKwncCww653lHjnDC3IWCC5mQZQoM/XD7TLnOnPgbsmF/HmGUfq
 2ydYHL0bfQH5foyKaoM+NIaV4HcM97zTPgFZ0wLVw0oyijX1hkUAF7ZG8LJcT14TeGRW
 5Y5sABh45Ky5gokL3Iuka4mCNg/JRE6zdzplyxFYi7MUDE40YSOyMA/YSzUm6TYyrXyc
 1yAlCMJ8p7lO50Sgs5xdGVUlzCyzxpQhawjofK40Y+g84WuIaS5122M1b1jKStkue2oU
 O18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=F/pAjrYCIdI1q9ubV+dr+puSbLBigZEoEUIGAS7nSVs=;
 b=cHw6o9Jb1XNg/yn77/mYj+zDCYDCeWX/NxhIY9S7KMZmN55CrK1xRi1O7kCiUUTSqs
 9m3xWVhClp3lRoVYZo/NKrsQwnWYbaAVEB+tAnhznxUe0+UVD6a1AcaWPwBTMOZubo1Q
 w3t4M02ZazW6jw3fsPCiP8Dmb51xN50K6n7wzuFLNlrLVT7znMGpug2Dsy5ypzwOZA2M
 PkV4bp7Wb2ECxjuqX1Unx2FcfgfDlG2AH4Ajl8j94NAJSrkDh4mDu0Q+lmi5F1775vdw
 baTObnMcgjGTbfqA7RfS5IYAigsHdX2yFfQlm5S0Nx2I/g5HYf6C61wrq4EJjNXpDeFR
 9Hjg==
X-Gm-Message-State: AOAM530O8JluVHIhLmVOV7jf9BYD8q+OruRgkDH1MPdwjA8iYkVo7xYy
 SR0d9wlogAqWXnk4okoACcr7qxcA63lU8w==
X-Google-Smtp-Source: ABdhPJzDpD6GzVAOPnIQcwmYtuRdTgtw+vKhmLdqb/CkQ0NBGOdZgOf4r8PlckmRzf+ukTmg4C/Dx42N8SzHsQ==
X-Received: from ricarkol2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:62fe])
 (user=ricarkol job=sendgmr) by 2002:a05:6214:c8c:: with SMTP id
 r12mr2191790qvr.16.1625269025943; Fri, 02 Jul 2021 16:37:05 -0700 (PDT)
Date: Fri,  2 Jul 2021 16:37:01 -0700
Message-Id: <20210702233701.3369-1-ricarkol@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in
 icv_[dir|eoir]_write
From: Ricardo Koller <ricarkol@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Ricardo Koller <ricarkol@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3IaPfYAgKCvIlcWUleifaiiafY.WigkYgo-XYpYfhihaho.ila@flex--ricarkol.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -96
X-Spam_score: -9.7
X-Spam_bar: ---------
X-Spam_report: (-9.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.118,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 Jul 2021 21:20:26 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

icv_eoir_write() and icv_dir_write() ignore invalid virtual IRQ numbers
(like LPIs).  The issue is that these functions check against the number
of implemented IRQs (QEMU's default is num_irq=288) which can be lower
than the maximum virtual IRQ number (1020 - 1).  The consequence is that
if a hypervisor creates an LR for an IRQ between 288 and 1020, then the
guest is unable to deactivate the resulting IRQ. Note that other
functions that deal with large IRQ numbers, like icv_iar_read, check
against 1020 and not against num_irq.

Fix the checks by using GICV3_MAXIRQ (1020) instead of the number of
implemented IRQs.

Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3e0641aff9..a032d505f5 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1227,7 +1227,7 @@ static void icv_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icv_dir_write(gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
@@ -1262,7 +1262,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
-- 
2.32.0.93.g670b81a890-goog


