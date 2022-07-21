Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8309A57C316
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 06:03:22 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oENPF-0003Vl-4z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 00:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oENMz-00023v-3A
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 00:01:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54046 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oENMw-0008DO-HV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 00:01:00 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxCeFxz9hildsrAA--.15538S2; 
 Thu, 21 Jul 2022 12:00:49 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 yangxiaojuan@loongson.cn, gaosong@loongson.cn
Subject: [PATCH] hw/loongarch: remove acpi-build.c unused variable 'aml_len'
Date: Thu, 21 Jul 2022 12:00:46 +0800
Message-Id: <20220721040046.3985609-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxCeFxz9hildsrAA--.15538S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWUWF4xKr4xJry3uw4xCrg_yoW8WFy7pa
 y7ZrWktrsagw1DGw1DGr4vvFn8Jr4DCasrX3Wxtw1Fg3Wqgr1UWF4xtryavFy7Aa4kJF98
 ZF1Dta4UuF48JrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a compiler warning on openbsd:
../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
set but not used [-Wunused-but-set-variable]
    size_t aml_len = 0;
           ^

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index b95b83b079..f7f6fc9b8a 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -413,7 +413,6 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     AcpiFadtData fadt_data;
     unsigned facs, rsdt, fadt, dsdt;
     uint8_t *u;
-    size_t aml_len = 0;
     GArray *tables_blob = tables->table_data;
 
     init_common_fadt_data(&fadt_data);
@@ -437,12 +436,6 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, machine);
 
-    /*
-     * Count the size of the DSDT, we will need it for
-     * legacy sizing of ACPI tables.
-     */
-    aml_len += tables_blob->len - dsdt;
-
     /* ACPI tables pointed to by RSDT */
     fadt = tables_blob->len;
     acpi_add_table(table_offsets, tables_blob);
@@ -451,7 +444,6 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     fadt_data.xdsdt_tbl_offset = &dsdt;
     build_fadt(tables_blob, tables->linker, &fadt_data,
                lams->oem_id, lams->oem_table_id);
-    aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, lams);
-- 
2.31.1


