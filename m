Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F71998AE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 16:36:56 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJI0d-0000ko-8T
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 10:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJHy0-0006Fo-VT
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJHxz-0008Vt-P2
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:34:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36268)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJHxz-0008VP-Gg
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:34:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id 31so26255692wrs.3
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8acRX+3Ax0e+6wpNxKGO9kRpEiLoBvALCJRagPszfg=;
 b=GqZdBxmsUuWE4nrTaxGY8OIZUcimR9abzaMy1wp1FZ76KwBcDmh3iaihwAJUfRIbom
 HkpJJOap09mnGxl+d/tPgXZ9fbpOvt7Ij+NT0FZVObMDg4c/fFz5/8H6kwIszWgPCMjf
 ZrZFuXgunOx+gzHNrzQfteKJk0fo3nt7RPeopYRV40pGl4dQQKD8ZO/0I2SEUVT0j1lT
 Ff8MK/7JjLpJfme7zTb1wUwKD3XEKZwY9MiKOJyjS95emt3E2d26VuiwABhrEc/adwra
 nDPDyPWNKs5IxrQLsvZ0i/r1ulvGsVBdUDNFSbFGg0JHZrwjAqeacOnv9Y1YXUjoZ6rW
 QiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8acRX+3Ax0e+6wpNxKGO9kRpEiLoBvALCJRagPszfg=;
 b=DQBK6R3WYAagWp9Znjd+UplxLVAmdjst+mtYcXHc3YK8hpAQkGurICaJ0tOxPDYzWt
 yzSgkEDRMaXWSQh/dMRKMJrceaCs6svll0Lv/FlOcuuUH6JScrPEQN3P/Mvmc4qsqbsE
 7RAImp/Fqt7gOj5EUxzlXxhLUqYQWTBp1wpmSq5nbvRt+kbKeWGMd+NDuRK7DNEWMECw
 AAVa1AWp5hbxw4ubO0xI33dGURKyZesv5+1lYcowRcv6h/s8hr2XdO2OvYWdHY4/SIuy
 k8dpBlaW7b8Y4PF/miskgEUa80UvdAlMRgzTRU1agvKG2AOjh3DCUW06A3ESdpiepnLL
 nPqQ==
X-Gm-Message-State: ANhLgQ2LeZ8/0g3O5Xp9lPneUI+WgeJ57ezo+QvKUsLjk8AlskZ5fQ2j
 LabJqS9+K/JoxZfc4wHdI+tXjw==
X-Google-Smtp-Source: ADFU+vvpM1+h8G+V2PsrzJ0z2kcPGTwhiRHzE0ETQiHOZpHgZzNlCVLlm9mY5bIP3h5DVTBw90UtQw==
X-Received: by 2002:a5d:54cb:: with SMTP id x11mr22055554wrv.179.1585665250142; 
 Tue, 31 Mar 2020 07:34:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b26sm3899189wmj.21.2020.03.31.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:34:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Remove obsolete TODO note from
 get_phys_addr_lpae()
Date: Tue, 31 Mar 2020 15:34:07 +0100
Message-Id: <20200331143407.3186-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
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

An old comment in get_phys_addr_lpae() claims that the code does not
support the different format TCR for VTCR_EL2.  This used to be true
but it is not true now (in particular the aa64_va_parameters() and
aa32_va_parameters() functions correctly handle the different
register format by checking whether the mmu_idx is Stage2).
Remove the out of date parts of the comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Randomly noticed this out of date comment while I was stepping
through the code this afternoon...

 target/arm/helper.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cba8ac57983..27059045842 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10714,12 +10714,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
 
-    /* TODO:
-     * This code does not handle the different format TCR for VTCR_EL2.
-     * This code also does not support shareability levels.
-     * Attribute and permission bit handling should also be checked when adding
-     * support for those page table walks.
-     */
+    /* TODO: This code does not support shareability levels. */
     if (aarch64) {
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
-- 
2.20.1


