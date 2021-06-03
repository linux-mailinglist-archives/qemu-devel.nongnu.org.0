Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA381399D60
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:05:26 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojI5-0006Si-RQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojG4-0003qM-Tk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:21 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojG3-0008Vn-EF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id k7so8068096ejv.12
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycDqdBNMfE6sy0aNiEZr8G7a3sAQ4DzhtUJazHFG448=;
 b=Gb1x1GerQQu/ps4AXoeAG0KMSGDYzaSDzSNDL7UCCzwonF03v50XjR3qAczlHcK5/B
 GNaXbKvfKw3CXgKa6CSouH/FSFQclrEH50LobGdXLNOeKxE/xV1TSHWoCcQqwQ1nzNOe
 ZCYqdNhI7jmt7zLxF6tc9VS6/A6pujkOU75JzPxLhYb9hNoh6rqG+Zj1TmI80DnVsy9/
 qKsrLtSzyLykBfI10cw2pQWoqMKHRm0DSzoCqFyIcTxa0/oHROkPs5TIqsh54B7Q/tMd
 vO29QNkdFNgVFS+v59SbS3UYSTKdyijdarIK8ZNbipsuIjpyRXkcbIlamvXibtvW4Mws
 qPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ycDqdBNMfE6sy0aNiEZr8G7a3sAQ4DzhtUJazHFG448=;
 b=mPmSkvhfv1sDkEN2m8mAcdtYbfNSpDDYYN7p4tGo7X4WnaXDDmJwkW92D3/mCZZCML
 ElcCYzhHUUIROrvsGoWvDSvONBUPs8sKdJnJt6nRD1mAxGKD263XqOGPcJ9jim9vEbsA
 z0wa7WSZIa9eyt8mXIpe9lRKPyswiIJKsOynQDAw63vD5LJGPIr5mzISS/Ofq+KovwWl
 YchpYp8ZVIRQMdZAwdUvggekJst44ndUphUPtt+byLDgGamshrLBfUrJlnovD8pXyW5k
 MdOgdOhwIvhr7xkieBYStt3OojM7KXXfbTXahRdqMPUhi5YqcyJ5wTKFvqdcXF4yoVGX
 L0Ig==
X-Gm-Message-State: AOAM530h/bkSGXur7fiqF2XeMb1T73HN6th0E2Qm35eCUAIF2SvHBs9o
 GsgH6oZbbj1dMDAXaZY1AtBWtYEw8S5Hqw==
X-Google-Smtp-Source: ABdhPJwso4LzkdxtufJAanXZwFgGzbjUIjTPycJPJsabexUSQrZuEUzbFauLC0IUYu3bjJdsvtfSSg==
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr5955483eje.22.1622710997629; 
 Thu, 03 Jun 2021 02:03:17 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z19sm491776edr.77.2021.06.03.02.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/microblaze: Use the IEC binary prefix definitions
Date: Thu,  3 Jun 2021 11:03:05 +0200
Message-Id: <20210603090310.2749892-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index cc40f275eaf..1481e2769f1 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -19,14 +19,15 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 
 static unsigned int tlb_decode_size(unsigned int f)
 {
     static const unsigned int sizes[] = {
-        1 * 1024, 4 * 1024, 16 * 1024, 64 * 1024, 256 * 1024,
-        1 * 1024 * 1024, 4 * 1024 * 1024, 16 * 1024 * 1024
+        1 * KiB, 4 * KiB, 16 * KiB, 64 * KiB, 256 * KiB,
+        1 * MiB, 4 * MiB, 16 * MiB
     };
     assert(f < ARRAY_SIZE(sizes));
     return sizes[f];
-- 
2.26.3


