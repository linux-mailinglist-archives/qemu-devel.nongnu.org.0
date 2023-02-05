Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CA68AE48
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWgH-0007pA-Jj; Sat, 04 Feb 2023 23:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfh-0007Ft-BH
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:59 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWff-0006Cv-AU
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:33 -0500
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 258034602
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G+B8DaqTnZYO5pv3YOOuOP+jCwleBmKmZxIvgKrLsJaIsI4StFCzt
 garIBmOMvuIajf3eNgiPdy+o0wC75DRn9ZjSwdq+SwxRi8U9ZacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPawT5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3cxdAjhJ8
 9UjGRsCUjenuf+rxuznc7w57igjBJGD0II3v3hhyXTAEa9jT8mSHOPF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKZPUUJYwZIYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3bYqNIYDUHZ89ckCwo
 FDH1VroLSgmEPOE0ibV2E68l97sgnauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV8WkGhPh8SHCsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJVeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:rfkfdKiNE4n5ecdjXqw67W2KfHBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:29 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so4783733qtj.13
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ewj7M9sqjTCbTF0bz2zaf1ICIcV0jsSfSPuK/XQxJmU=;
 b=SXHoXWEH7VjqTCSIzG/E/VZjTW8tg8QaZiTv5hEgHkhE0+cq7/aey6IpuyFr+6uqSs
 WXdqVeZnIP/tZHqDpglJwcUkbOsjbPIUjU7IRAneS4Aquj7hWzHfp8kpcNSXfIdO9voH
 f8SOB3ATEeX5uLbHZdB3rX6hT+9byFJkAMv8wsZAV9XeYqkHC1G1FUYavAQTyNl3e54b
 uPGeKj90YdSgAu7j5xern1uqBs3Kw+GYMdtFGwtPvSYanRKPTp8+FXqnlT3ouh+PPJz6
 Bgc4XbRaT/creop1Bxv61cC5F7FUdv4BGaZL/dJrg+qyOLpjwc7bc0K4JT8BslNCabdE
 lXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ewj7M9sqjTCbTF0bz2zaf1ICIcV0jsSfSPuK/XQxJmU=;
 b=uaBJof9S54Xc6xt5z7fs+X52ATWMxVMGEF+Pdrkx56IwS/iBE3f3KyJX+SROnia2kr
 EdXwYvp9TzlwdgI+PjL09UfdkT3gJNDIVfNcBxMTMSb0CREILGMAm6kKjkrtsgLrwAWP
 FCgZorOWldIIUURdDYPMtKWfRr5qq4z8pM11EK7RQxyvvaq4iOzEitGD2mgVfAxEI+Zp
 uC9l2PsoEa4ihxqx8yDtTPjG/aC7pSJN8c/XDYYRceelNlelOTZRaoyh5qC9IF8afnST
 fOCtwXknezaN2U4BesxEKw8KVw4Ll25PQbJrxFs23k3gqJg2ozKVHkleWAwQ1ipBa6De
 5Q1Q==
X-Gm-Message-State: AO0yUKWaEIruzxcOB1QXowh8wpDCZV9Y60OmKTQrV4p+qRKCUndmgUk3
 0SbHU8/GuNFYwTs1BVV4hmM47Q9fHgimD3dmqezxMuwJWzaOMdUMlhr3gDNXe5AdmB/dAaX0xY4
 Tx3Pfn7mTsfdEnJECwd4A+ijyTAygSA==
X-Received: by 2002:a05:622a:cc:b0:3b8:2c34:b9f2 with SMTP id
 p12-20020a05622a00cc00b003b82c34b9f2mr24493526qtw.63.1675571428803; 
 Sat, 04 Feb 2023 20:30:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9OIIBUSYxSpcQd5yoBOp4cxj8jV/R9QqNAG7vWS6JqhzNwPiE1z9YJ6AwNb2cuMefaCYTH0g==
X-Received: by 2002:a05:622a:cc:b0:3b8:2c34:b9f2 with SMTP id
 p12-20020a05622a00cc00b003b82c34b9f2mr24493497qtw.63.1675571428493; 
 Sat, 04 Feb 2023 20:30:28 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac800d7000000b003b8238114d9sm4686096qtg.12.2023.02.04.20.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:28 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 09/10] fuzz: remove fork-fuzzing scaffolding
Date: Sat,  4 Feb 2023 23:29:50 -0500
Message-Id: <20230205042951.3570008-10-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Fork-fuzzing provides a few pros, but our implementation prevents us
from using fuzzers other than libFuzzer, and may be causing issues such
as coverage-failure builds on OSS-Fuzz. It is not a great long-term
solution as it depends on internal implementation details of libFuzzer
(which is no longer in active development). Remove it in favor of other
methods of resetting state between inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 meson.build                   |  4 ---
 tests/qtest/fuzz/fork_fuzz.c  | 41 -------------------------
 tests/qtest/fuzz/fork_fuzz.h  | 23 --------------
 tests/qtest/fuzz/fork_fuzz.ld | 56 -----------------------------------
 tests/qtest/fuzz/meson.build  |  6 ++--
 5 files changed, 3 insertions(+), 127 deletions(-)
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld

diff --git a/meson.build b/meson.build
index 6d3b665629..8be27c2408 100644
--- a/meson.build
+++ b/meson.build
@@ -215,10 +215,6 @@ endif
 # Specify linker-script with add_project_link_arguments so that it is not placed
 # within a linker --start-group/--end-group pair
 if get_option('fuzzing')
-  add_project_link_arguments(['-Wl,-T,',
-                              (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
-                             native: false, language: all_languages)
-
   # Specify a filter to only instrument code that is directly related to
   # virtual-devices.
   configure_file(output: 'instrumentation-filter',
diff --git a/tests/qtest/fuzz/fork_fuzz.c b/tests/qtest/fuzz/fork_fuzz.c
deleted file mode 100644
index 6ffb2a7937..0000000000
--- a/tests/qtest/fuzz/fork_fuzz.c
+++ /dev/null
@@ -1,41 +0,0 @@
-/*
- * Fork-based fuzzing helpers
- *
- * Copyright Red Hat Inc., 2019
- *
- * Authors:
- *  Alexander Bulekov   <alxndr@bu.edu>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "fork_fuzz.h"
-
-
-void counter_shm_init(void)
-{
-    /* Copy what's in the counter region to a temporary buffer.. */
-    void *copy = malloc(&__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
-    memcpy(copy,
-           &__FUZZ_COUNTERS_START,
-           &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
-
-    /* Map a shared region over the counter region */
-    if (mmap(&__FUZZ_COUNTERS_START,
-             &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START,
-             PROT_READ | PROT_WRITE, MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS,
-             0, 0) == MAP_FAILED) {
-        perror("Error: ");
-        exit(1);
-    }
-
-    /* Copy the original data back to the counter-region */
-    memcpy(&__FUZZ_COUNTERS_START, copy,
-           &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
-    free(copy);
-}
-
-
diff --git a/tests/qtest/fuzz/fork_fuzz.h b/tests/qtest/fuzz/fork_fuzz.h
deleted file mode 100644
index 9ecb8b58ef..0000000000
--- a/tests/qtest/fuzz/fork_fuzz.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Fork-based fuzzing helpers
- *
- * Copyright Red Hat Inc., 2019
- *
- * Authors:
- *  Alexander Bulekov   <alxndr@bu.edu>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef FORK_FUZZ_H
-#define FORK_FUZZ_H
-
-extern uint8_t __FUZZ_COUNTERS_START;
-extern uint8_t __FUZZ_COUNTERS_END;
-
-void counter_shm_init(void);
-
-#endif
-
diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
deleted file mode 100644
index cfb88b7fdb..0000000000
--- a/tests/qtest/fuzz/fork_fuzz.ld
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * We adjust linker script modification to place all of the stuff that needs to
- * persist across fuzzing runs into a contiguous section of memory. Then, it is
- * easy to re-map the counter-related memory as shared.
- */
-
-SECTIONS
-{
-  .data.fuzz_start : ALIGN(4K)
-  {
-      __FUZZ_COUNTERS_START = .;
-      __start___sancov_cntrs = .;
-      *(_*sancov_cntrs);
-      __stop___sancov_cntrs = .;
-
-      /* Lowest stack counter */
-      *(__sancov_lowest_stack);
-  }
-}
-INSERT AFTER .data;
-
-SECTIONS
-{
-  .data.fuzz_ordered :
-  {
-      /*
-       * Coverage counters. They're not necessary for fuzzing, but are useful
-       * for analyzing the fuzzing performance
-       */
-      __start___llvm_prf_cnts = .;
-      *(*llvm_prf_cnts);
-      __stop___llvm_prf_cnts = .;
-
-      /* Internal Libfuzzer TracePC object which contains the ValueProfileMap */
-      FuzzerTracePC*(.bss*);
-      /*
-       * In case the above line fails, explicitly specify the (mangled) name of
-       * the object we care about
-       */
-       *(.bss._ZN6fuzzer3TPCE);
-  }
-}
-INSERT AFTER .data.fuzz_start;
-
-SECTIONS
-{
-  .data.fuzz_end : ALIGN(4K)
-  {
-      __FUZZ_COUNTERS_END = .;
-  }
-}
-/*
- * Don't overwrite the SECTIONS in the default linker script. Instead insert the
- * above into the default script
- */
-INSERT AFTER .data.fuzz_ordered;
diff --git a/tests/qtest/fuzz/meson.build b/tests/qtest/fuzz/meson.build
index 189901d4a2..4d10b47b8f 100644
--- a/tests/qtest/fuzz/meson.build
+++ b/tests/qtest/fuzz/meson.build
@@ -2,7 +2,7 @@ if not get_option('fuzzing')
   subdir_done()
 endif
 
-specific_fuzz_ss.add(files('fuzz.c', 'fork_fuzz.c', 'qos_fuzz.c',
+specific_fuzz_ss.add(files('fuzz.c', 'qos_fuzz.c',
                            'qtest_wrappers.c'), qos)
 
 # Targets
@@ -12,7 +12,7 @@ specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio_scsi_fuz
 specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio_blk_fuzz.c'))
 specific_fuzz_ss.add(files('generic_fuzz.c'))
 
-fork_fuzz = declare_dependency(
+fuzz_ld = declare_dependency(
   link_args: fuzz_exe_ldflags +
              ['-Wl,-wrap,qtest_inb',
               '-Wl,-wrap,qtest_inw',
@@ -35,4 +35,4 @@ fork_fuzz = declare_dependency(
               '-Wl,-wrap,qtest_memset']
 )
 
-specific_fuzz_ss.add(fork_fuzz)
+specific_fuzz_ss.add(fuzz_ld)
-- 
2.39.0


