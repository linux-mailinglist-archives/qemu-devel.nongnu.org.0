Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDB4DD200
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 01:44:28 +0100 (CET)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV0jB-0006tW-UF
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 20:44:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nV0gq-0006C5-SS
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 20:42:00 -0400
Received: from [2a00:1450:4864:20::42a] (port=34701
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nV0go-0004kR-QB
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 20:42:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j26so9734293wrb.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiFryPU0B6x9A6PdlzjQshXAB1vfdHXTBBqlQgqo51U=;
 b=eWBtTCDjexgxp073agTaG9K5B8O7cVtNWCONkXZx3vp5YW093/CYE6fTtcq/b7FXXf
 Y4rN8/BYDz9tM5IQDnKCkveIIsH1sqyAYVSmEj+A/L5oVo1kmROEDB1kLDtitAULZJsY
 r0aYPR+0F86KvJ1itc7Q8TaoWJIjCVS2OfzSaZM0RMnytRXxI4oCPp2zx7oOW8YzQ3IK
 61jcEKqzQmlrS7kbEOiY3MQCS2HN/QFkLr+FDFXXnCqHE5129QaPq+HRlQ3vjnN6EXnD
 VpURk9nKALuirnzYjWL6EpagCLNf36uV4GTa1UflJi3SEhlUCvvDpucCgFYW+ZdFiAZC
 VW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiFryPU0B6x9A6PdlzjQshXAB1vfdHXTBBqlQgqo51U=;
 b=RqZvywOVkJY0Yg5XwqEOhCqRkDsOGaGsfW9CWhRB9ZZ+/W59ogV6e4LvFCkBH9aC3c
 /EwM9+nCaiEcKwAHDOrK5tYtYqPRm0u/kReJ+u0y1+3DZ4wJuWjI6Et1Mp/EDHZxAU91
 QLmb6zFsnMoiHhWIZoyj3bEsuPaHwh/m3rG5/rPwYpdaYSyx9x2WOFkrAIZKd6JurwWn
 6b1DaR4SrDyGBZPItmaY2ltyDItQ3c4REelfjmM2yhIB2JRhjABgmvrUbPmbDmiTo+66
 KWbMo74RsOPYTb43K5chcw9jsjOxZtQHtRLfA0ReWdsIZb20Jpp91q9krWkW3cSK6Ff7
 fcZw==
X-Gm-Message-State: AOAM5323HZKcOkezLFSrtQr4OA/uaFe3kRqU5OQdzqNL/F+QD+nzHxX/
 1GBvbPSvJMlnCYIL9BR/d/gX0ful4Og=
X-Google-Smtp-Source: ABdhPJxGRg1nm8Eybk0xLlSKplV7Om7v429Im224lIHer1sIKtfDiRN9boYgM3nW2FMqB/Cv1rhC9g==
X-Received: by 2002:a05:6000:10cf:b0:203:d8da:129c with SMTP id
 b15-20020a05600010cf00b00203d8da129cmr6106839wrx.300.1647564116610; 
 Thu, 17 Mar 2022 17:41:56 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5451499wmi.8.2022.03.17.17.41.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 17:41:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0] hw/i386/amd_iommu: Fix maybe-uninitialized error
 with GCC 12
Date: Fri, 18 Mar 2022 01:41:53 +0100
Message-Id: <20220318004153.4510-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Initialize 'oldlevel' early to avoid on Debian/sid:

  FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
  In function 'pte_get_page_mask',
      inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
      inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
      inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
  hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used uninitialized [-Werror=maybe-uninitialized]
    877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
        |                      ~~~~~~~~~~~~~~~~^~~~
  hw/i386/amd_iommu.c: In function 'amdvi_translate':
  hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
    906 |     unsigned level, present, pte_perms, oldlevel;
        |                                         ^~~~~~~~
  cc1: all warnings being treated as errors

Having:

  $ gcc --version
  gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/amd_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 4d13d8e697..b6d299f964 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -904,6 +904,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
     /* make sure the DTE has TV = 1 */
     if (pte & AMDVI_DEV_TRANSLATION_VALID) {
         level = get_pte_translation_mode(pte);
+        oldlevel = level;
         if (level >= 7) {
             trace_amdvi_mode_invalid(level, addr);
             return;
-- 
2.35.1


