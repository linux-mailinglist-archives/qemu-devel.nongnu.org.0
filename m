Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8C66E407
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHp8G-0001wP-JR; Tue, 17 Jan 2023 11:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pHjx6-0006oV-QW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:16:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pHjx4-0007gl-Vr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:16:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id d8so857092pjc.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rpXVZmPEgwqfHM761IYO84SOSpvtSS2KcilaCufpno=;
 b=W6qNnQiIGlzCUk8XTsKCvVZpwFQI91sMSDo37oX4+XJzpCzFikrieNLLe+O4cS43nf
 e7EU/UZfOuD2Qg0A1e/xD9hX6QRZLZD+ctR8JWAgHv8RU/CqQBYMCGNneDFGl70YMN/P
 876Q3jwQLxFr4y7z9yKo79D+7ATsgD8FsG+GDzy3VEJ/kDCszx/NW8CfgPrkISoZ6feM
 lSrXKEj++OAPWvKs27kjUNux1+kqWI2uHZJEHsJkE8/JlNyAGQjROOE4Y9P/MRAnLbe0
 8mYoWHnkpBCkj9sBKSkE9hIhJrDoDEgVBRl4aRGPi9iriaD+xdDHk3K0s2cz4aeP8i2G
 MV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rpXVZmPEgwqfHM761IYO84SOSpvtSS2KcilaCufpno=;
 b=5ac6qHj3jT3S5NI1vYGqrKqtQPM4Zy7Yi2PZFGeL3kpV9AqWWRQAHL3MvoU3zDd8qY
 jCMcSz+rYGapXp+FuhCqrhf36jbAmH0W5+ojZGQofeP3W57WS4cTcG9tEHkoR+2jLQzm
 GFYSYaLgn9JQQpgk7v/srwMuK/VwiB2uo7wQu481Upi8PBkhbq6pBI2IpqRI08KQAJVj
 3kbHlcxW0zUks8O0kdlqI2K7SZ1/dNn2KW0janK+zTzmBYSVZfDXUAvn5JBolL8W3/Hx
 t+GqGgYAzA+C//akPHRF+gcTUXyoPuQbfK9x0LjKylzi0tM+vxQRLqkhGGfnRs1VcuUX
 l3dw==
X-Gm-Message-State: AFqh2kpEpPMJXyPTvuzkMjAQ4lrc7cc8O9cVagsAMFzpDDNJV7w0fe0u
 66Obel9ivsWYofcjY6CgcDyBuYvnh6SLqg==
X-Google-Smtp-Source: AMrXdXtFUdrEf9LgBSQnsX3p2UAEsjZ2KqpsEph7t5AeKC6FlTbITcFZ5RS/F1qASFk6s7ApJjrBDw==
X-Received: by 2002:a17:902:9688:b0:192:55ab:88fe with SMTP id
 n8-20020a170902968800b0019255ab88femr2867933plp.56.1673954183556; 
 Tue, 17 Jan 2023 03:16:23 -0800 (PST)
Received: from i-p7lx0k9i.ap2a.qingcloud.com ([139.198.120.26])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a170902b40b00b001931c37da2dsm19534408plr.20.2023.01.17.03.16.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:16:22 -0800 (PST)
From: Sun Feng <loyou85@gmail.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 Sun Feng <loyou85@gmail.com>
Subject: [PATCH] acpi: Set maximum size to 64k for "etc/acpi/rsdp" blob
Date: Tue, 17 Jan 2023 19:15:21 +0800
Message-Id: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=loyou85@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Jan 2023 11:48:12 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Migrate from aarch64 host with PAGE_SIZE 64k to 4k failed with following errors:

qmp_cmd_name: migrate-incoming, arguments: {"uri": "tcp:[::]:49152"}
{"timestamp": {"seconds": 1673922775, "microseconds": 534702}, "event": "MIGRATION", "data": {"status": "setup"}}
{"timestamp": {"seconds": 1673922776, "microseconds": 53003}, "event": "MIGRATION", "data": {"status": "active"}}
2023-01-17T02:32:56.058827Z qemu-system-aarch64: Length too large: /rom@etc/acpi/rsdp: 0x10000 > 0x1000: Invalid argument
2023-01-17T02:32:56.058832Z qemu-system-aarch64: error while loading state for instance 0x0 of device 'ram'
2023-01-17T02:32:56.059236Z qemu-system-aarch64: load of migration failed: Invalid argument
{"timestamp": {"seconds": 1673922776, "microseconds": 59248}, "event": "MIGRATION", "data": {"status": "failed"}}
2023-01-17 02:32:56.306+0000: shutting down, reason=failed

refer to the following commit, set blob "etc/acpi/rsdp" maximum size to 64k works.

5033728 acpi: Set proper maximum size for "etc/acpi/rsdp" blob
6c2b24d acpi: Set proper maximum size for "etc/table-loader" blob

Signed-off-by: Sun Feng <loyou85@gmail.com>
---
 hw/acpi/utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index 0c486ea..85f6ff3 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -37,7 +37,7 @@ MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
     } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
         max_size = 0x10000;
     } else if (!strcmp(name, ACPI_BUILD_RSDP_FILE)) {
-        max_size = 0x1000;
+        max_size = 0x10000;
     } else {
         g_assert_not_reached();
     }
-- 
2.7.4


