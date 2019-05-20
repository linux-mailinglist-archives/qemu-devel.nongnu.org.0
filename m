Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEC2447B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 01:41:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSruN-0007Bq-41
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 19:41:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrR5-0007fX-Ls
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrR4-0008F8-Ms
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:15 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:46761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrR4-0008DL-IM
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:11:14 -0400
Received: by mail-qt1-f173.google.com with SMTP id z19so18282967qtz.13
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 16:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=GePNc79S8rWNh0Ns6n9in2uP4ZJ91+p5d/19390Nqro=;
	b=hQWpMLPC9qpFT/8O/9+6IXrvSrKU1NjuQVQNFFprqITNLz5zLMdOtHlWq9Ur7kTs9V
	d8ggndrtvnEBZcQfNKuBlrQ9hj8a8Fqy0zRnnT1bABeVgt53qN8SyJXDN5dHJnUct+qL
	/9a1g2dTR4eg/AfWdAUHAzAr7KUn3ZDmRjl66Ztc0RI02AuMorR5OTmpZIh/y0ADlBAl
	LGLEwiI7JtQKQdFGrWerXE+i42nlyP07YjyWvpfYdYTs49ZICTsrTDTwfwT5qxZ5xFhC
	WP9FVFYK06lQP7owbTHVW+h1EFqRpYxZJErh8NqHbGxFYI4b5qFvrEkEesY+fwCzi/Sx
	u0jg==
X-Gm-Message-State: APjAAAW1YiGGhzBR/baooFO/w4ho0H+qwnpGDcteBuWHpbomHdEshQX+
	g5QQrWBgwOwIDQgmcpTteeE3aRVFftU=
X-Google-Smtp-Source: APXvYqydDdhFhXc1hEod8xPeJBEJD1aLwYh3iG1HcuqfiFsoi5I4COdIcyx/37qQq39kJPpzI20WSA==
X-Received: by 2002:a0c:98a3:: with SMTP id f32mr62498500qvd.207.1558393873022;
	Mon, 20 May 2019 16:11:13 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	n22sm11272665qtb.56.2019.05.20.16.11.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:11:12 -0700 (PDT)
Date: Mon, 20 May 2019 19:11:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1556808723-226478-2-git-send-email-imammedo@redhat.com>
References: <20190520231008.20140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190520231008.20140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.173
Subject: [Qemu-devel] [PULL v2 22/36] tests: acpi: rename
 acpi_parse_rsdp_table() into acpi_fetch_rsdp_table()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Ben Warren <ben@skyportsystems.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

so name would reflect what the function does

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <1556808723-226478-2-git-send-email-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/acpi-utils.h       | 2 +-
 tests/acpi-utils.c       | 2 +-
 tests/bios-tables-test.c | 2 +-
 tests/vmgenid-test.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
index 73fe24f044..a303e61f00 100644
--- a/tests/acpi-utils.h
+++ b/tests/acpi-utils.h
@@ -47,7 +47,7 @@ typedef struct {
 uint8_t acpi_calc_checksum(const uint8_t *data, int len);
 uint32_t acpi_find_rsdp_address(QTestState *qts);
 uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
-void acpi_parse_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table);
+void acpi_fetch_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table);
 void acpi_fetch_table(QTestState *qts, uint8_t **aml, uint32_t *aml_len,
                       const uint8_t *addr_ptr, const char *sig,
                       bool verify_checksum);
diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
index cc33b460ab..633d8f513d 100644
--- a/tests/acpi-utils.c
+++ b/tests/acpi-utils.c
@@ -63,7 +63,7 @@ uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
     return le64_to_cpu(xsdt_physical_address);
 }
 
-void acpi_parse_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table)
+void acpi_fetch_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table)
 {
     uint8_t revision;
 
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index a506dcbb29..6a678bf761 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -89,7 +89,7 @@ static void test_acpi_rsdp_table(test_data *data)
     uint8_t *rsdp_table = data->rsdp_table, revision;
     uint32_t addr = data->rsdp_addr;
 
-    acpi_parse_rsdp_table(data->qts, addr, rsdp_table);
+    acpi_fetch_rsdp_table(data->qts, addr, rsdp_table);
     revision = rsdp_table[15 /* Revision offset */];
 
     switch (revision) {
diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
index ae38ee5ac0..f400184268 100644
--- a/tests/vmgenid-test.c
+++ b/tests/vmgenid-test.c
@@ -40,7 +40,7 @@ static uint32_t acpi_find_vgia(QTestState *qts)
     g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
 
 
-    acpi_parse_rsdp_table(qts, rsdp_offset, rsdp_table);
+    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
     acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
                      "RSDT", true);
 
-- 
MST


