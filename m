Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D46F7A92
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:18:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujst-0006Z3-1Y; Thu, 04 May 2023 21:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsn-000619-Ae
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:13 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsk-00075p-8N
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:12 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-52c62a71541so802419a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248709; x=1685840709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYb3jgvp3i5a/4dYFCqa9cduItL8MgsslnPx+itp/mo=;
 b=Zk27MJytHM71Coot1j5pkcVT3UAR5y9NnNYMmHzDsibgF8JEFITQCiS7JDNELF0HXG
 eSbXe2UJvpQ7ZyN+iVqeqSdpB11hxS24CxpS7G98qXXZhdXcDiVOv0czch+ifD+cKFjA
 9asmTcqc3iw5YYhmbDPrMxoXgcne4l2vg07Cx01tJKEzDfejnDvPn1NI+XziOqup9J60
 8C8821KVpf2zEVSDGwes3uUUDbV6wVO6KMzkd6+4OzGiJEVOu8As3cr0RE1HPiwbzZag
 DpYUn7ntH4029+cQkI3IhpoJ/znh2gCeWfv6jLclG+4M91ryqdMS0Jj8jxAU+FgzTSUL
 X0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248709; x=1685840709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYb3jgvp3i5a/4dYFCqa9cduItL8MgsslnPx+itp/mo=;
 b=IFlBAHriBM6RbETOK1YU8ZbtEAQxiEYPPzdXuqjWuz7OQ3BSIHPEGQnHY+qnCwTMAA
 gZH+PvY8/zuqiKs2vz8kGkRUUCyuOryWx9cXjyPXtpIkDvoJDemeSWuKJHEps+OFHsoC
 SvhT4VvArPftNE1B6T8PfVTl7ZojB7qmu7xqFpy9c/kAOsEKXY3poqm/Ii3pXid9LJhY
 1KER+wOi9hd4ULLt1AzA1l7spPfJ3Ruu3YBAiHxBUojJmu/CunfFd+3VCoK5A70ic4Dq
 dpVjHAfKt9R7XbBlJILcWyYa5Iws1UFrXSBh+WEqKXZxVW+5NoGJXls0m7/QhOHRmny7
 53eQ==
X-Gm-Message-State: AC+VfDwkSZC4lB2sE+AGjjDvksm1JsWCgqvZs1LqKLHqpct5qnV3W7jy
 UtasMiD0CKCGjW9LP2qQe11XWi4Jrn8Mfw==
X-Google-Smtp-Source: ACHHUZ5nRdg5QPj1i32HxiTmqIrHYHsp6l6h2Wu26+oCqWWx8aFMUz+tksMUCE4OBA5IPx410M5NxQ==
X-Received: by 2002:a17:903:245:b0:1a9:85f2:5df6 with SMTP id
 j5-20020a170903024500b001a985f25df6mr6540775plh.6.1683248709132; 
 Thu, 04 May 2023 18:05:09 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:08 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/89] hw/riscv: Add signature dump function for spike to run
 ACT tests
Date: Fri,  5 May 2023 11:01:44 +1000
Message-Id: <20230505010241.21812-33-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add signature and signature-granularity properties in spike to specify the target
signatrue file and the line size for signature data.

Recgonize the signature section between begin_signature and end_signature symbols
when loading elf of ACT tests. Then dump signature data in signature section just
before the ACT tests exit.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230405095720.75848-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h |  3 +++
 hw/char/riscv_htif.c         | 44 +++++++++++++++++++++++++++++++++++-
 hw/riscv/spike.c             | 13 +++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 5958c5b986..df493fdf6b 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -40,6 +40,9 @@ typedef struct HTIFState {
     uint64_t pending_read;
 } HTIFState;
 
+extern const char *sig_file;
+extern uint8_t line_size;
+
 /* HTIF symbol callback */
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 098de50e35..37d3ccc76b 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -29,6 +29,8 @@
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "sysemu/dma.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -51,7 +53,10 @@
 /* PK system call number */
 #define PK_SYS_WRITE            64
 
-static uint64_t fromhost_addr, tohost_addr;
+const char *sig_file;
+uint8_t line_size = 16;
+
+static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_addr;
 
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
                           uint64_t st_size)
@@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
             error_report("HTIF tohost must be 8 bytes");
             exit(1);
         }
+    } else if (strcmp("begin_signature", st_name) == 0) {
+        begin_sig_addr = st_value;
+    } else if (strcmp("end_signature", st_name) == 0) {
+        end_sig_addr = st_value;
     }
 }
 
@@ -163,6 +172,39 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
             if (payload & 0x1) {
                 /* exit code */
                 int exit_code = payload >> 1;
+
+                /*
+                 * Dump signature data if sig_file is specified and
+                 * begin/end_signature symbols exist.
+                 */
+                if (sig_file && begin_sig_addr && end_sig_addr) {
+                    uint64_t sig_len = end_sig_addr - begin_sig_addr;
+                    char *sig_data = g_malloc(sig_len);
+                    dma_memory_read(&address_space_memory, begin_sig_addr,
+                                    sig_data, sig_len, MEMTXATTRS_UNSPECIFIED);
+                    FILE *signature = fopen(sig_file, "w");
+                    if (signature == NULL) {
+                        error_report("Unable to open %s with error %s",
+                                     sig_file, strerror(errno));
+                        exit(1);
+                    }
+
+                    for (int i = 0; i < sig_len; i += line_size) {
+                        for (int j = line_size; j > 0; j--) {
+                            if (i + j <= sig_len) {
+                                fprintf(signature, "%02x",
+                                        sig_data[i + j - 1] & 0xff);
+                            } else {
+                                fprintf(signature, "%02x", 0);
+                            }
+                        }
+                        fprintf(signature, "\n");
+                    }
+
+                    fclose(signature);
+                    g_free(sig_data);
+                }
+
                 exit(exit_code);
             } else {
                 uint64_t syscall[8];
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..2c5546560a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -332,6 +332,11 @@ static void spike_board_init(MachineState *machine)
                  htif_custom_base);
 }
 
+static void spike_set_signature(Object *obj, const char *val, Error **errp)
+{
+    sig_file = g_strdup(val);
+}
+
 static void spike_machine_instance_init(Object *obj)
 {
 }
@@ -350,6 +355,14 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
     mc->default_ram_id = "riscv.spike.ram";
+    object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
+    object_class_property_set_description(oc, "signature",
+                                          "File to write ACT test signature");
+    object_class_property_add_uint8_ptr(oc, "signature-granularity",
+                                        &line_size, OBJ_PROP_FLAG_WRITE);
+    object_class_property_set_description(oc, "signature-granularity",
+                                          "Size of each line in ACT signature "
+                                          "file");
 }
 
 static const TypeInfo spike_machine_typeinfo = {
-- 
2.40.0


