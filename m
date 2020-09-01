Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D154258CA6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:21:10 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3PZ-0001od-4Y
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3OQ-0001Bs-4O; Tue, 01 Sep 2020 06:19:58 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ON-0007BE-3k; Tue, 01 Sep 2020 06:19:57 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so895873wrm.2;
 Tue, 01 Sep 2020 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1Bhlp3Yapvcu2OIVpqLSLyDOQDat1GbjeygN/kXFNQ=;
 b=ertICCp5ziU1O0R8yeNs1UysNmUCbTFCm5d9IQ2zNDsmGOiIL30SfkDtHUM1U5Zxtu
 3Rg3fmdIqQoDpVfqtqRZK+0uL5YqDr1aD/r2TaDCzzPnSUsCTlKgQFuEtAZTwyaMqWK7
 fXH34aBjBvvhX5KoqwJ//ntNEquYGhaQIaO9hO6eQiEMF3CH1QJWHw1khArFCoekpCtq
 fEuHLwdJ2kMh14mIYwmgLujRPd15Fyb1GXU1ipKZduCcO9guBd4WFwdMBU5ZE6LhQ8B4
 k/JUsN3TGNzn42bx46zuFHELpa1QZ4rGLDJ5NfQj5mu8t2s/cuQdCA9BJl9urD3kkh7X
 t28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=J1Bhlp3Yapvcu2OIVpqLSLyDOQDat1GbjeygN/kXFNQ=;
 b=B4xp3YiORrx+NSTx8KY1oiz0W1xMTiChQnzagMQPAZVwli5tnYYrfyyvknje6/hC1p
 piEXHplXj7K5YaRyY3KjWbObTon+WHde4qAfhKAJYdJDe1pyMEzaVI6xhTs8SYY9SXUQ
 SzMlbpam6i44Pw8BfAER858QGHf/2MB/qFDyf8dbq2vUV82EYdTyA4zopTPtdDK2eqje
 ZQBQyFqzSeuH6E2f9iZ7Z6JXORUc/gCFFHkkAyCIVTXP9ANk671EocuXGXmbBq+iWUn0
 UWJDzK6NsDwzCdZyor1ArZ4QpAx1uazkeRavZ84FsitNgMK0g/j0yWNBGnfU2hjDBon6
 Z2Ag==
X-Gm-Message-State: AOAM5332a4F3o9x5PRIOGJWDek1C6pHy/nbzscEopI05pXgAX9rzN1V9
 PEnye4qrbTkct0AdRqPABp8oosvQLqg=
X-Google-Smtp-Source: ABdhPJyUdtafq8je5XvtNI4gXfkYNDNl1kTyFQ4JjZgLRiUeixBZwgiZ0B7uG+qcAU5kK2N0oLwMaQ==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr1135771wrf.206.1598955593181; 
 Tue, 01 Sep 2020 03:19:53 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id u6sm1509088wrn.95.2020.09.01.03.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:19:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi/tco: Remove unused definitions
Date: Tue,  1 Sep 2020 12:19:50 +0200
Message-Id: <20200901101951.85892-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paulo Alcantara <pcacjr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCO_DEBUG() and DEBUG definitions are not used, remove them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/tco.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index fb9052dbca2..cf1e68a5393 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -15,17 +15,6 @@
 #include "hw/acpi/tco.h"
 #include "trace.h"
 
-//#define DEBUG
-
-#ifdef DEBUG
-#define TCO_DEBUG(fmt, ...)                                     \
-    do {                                                        \
-        fprintf(stderr, "%s "fmt, __func__, ## __VA_ARGS__);    \
-    } while (0)
-#else
-#define TCO_DEBUG(fmt, ...) do { } while (0)
-#endif
-
 enum {
     TCO_RLD_DEFAULT         = 0x0000,
     TCO_DAT_IN_DEFAULT      = 0x00,
-- 
2.26.2


