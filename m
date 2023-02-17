Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F969A4AE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4p-0001hX-JP; Thu, 16 Feb 2023 23:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4i-0001Hs-I7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4f-0001Cc-Ao
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 257552918
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8xSadKqDN/NH1EnEAMp4zDULkJ9eBmKmZxIvgKrLsJaIsI4StFCzt
 garIBnXafaPM2XzLtwkYdjg/UkD7MCEz9Q2TQdk+SphHy8WoJacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK4T5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwueYrE2Iey
 dYjIRcBbAmSjeaO0b+bY7w57igjBJGD0II3v3hhyXTADq9jT8qbG+PF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKaOUcJYA9PYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3bYWIJ4bbHJU9ckCwh
 V2czmepEjsmd/e1zD3e3mOFhLbptHauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV9qkGhPi+CbCsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJZeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:79ijN64RTyJDnQAM/QPXwPHXdLJyesId70hD6qkXc20tTiX4rb
 HJoB1/73TJYVkqNk3I9ersBEDCewK+yXcX2+gs1NWZLW7bUQKTRekJ0WKF+V3d8kbFmdK1u5
 0NT0EwMqyTMbHWt7ee3OD9KadF/OW6
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:54 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so2440912qkg.17
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4MMcsmDjPrdhrvy0zqL881q3Uz+LWoYeuCovRDIWIGg=;
 b=bSci//MNLyi0c/TbbnsA2VxVJbeWD8XTvgAmEu52QoCrbaiQzk0SLTMb/mxzosdXXV
 +BpDw5tVnCDuMYIfBn6pAHDgMj8y8pd4bjEIzVuHJ3Ra6EHrXQkq3VFO2TTwm7suP4A+
 JbKgNlgBB5VxaCHv21HnslhpfcpwbiDFizf52mN7fjSTAVKTT94qEyJZq65DmR3gkJVJ
 X1oeFgfkv697aHkR8Ib3/6KJYd2UWf2QMardBDcrp5tFII+XKYgNKUkE0DD/ICpIcIVz
 aX+4nHJ80vqRtAAI0FGTS5uCft7e8URhpMYZ80MKQ2eE9nyJV5g1b70Qlsn317glJQBC
 WQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MMcsmDjPrdhrvy0zqL881q3Uz+LWoYeuCovRDIWIGg=;
 b=Htf5OPmnOxpttFD+JT+xgsZs5Gilh1iCxQy6Pf1a6VRoJoBPAKGLkWv8Im/kgZL7vf
 fmS4YEb9YunAGTMmXEddmmezSSqF3aru3PyqEnLUZhv9kCiFmswZIn9EZWPCboYpkisc
 svQr+G7WBE1ZLJBBfj2fMH+S2KOhyDj2/93IFrnAKTfXdSm4wJ+o1lOFXI9aKubrjaOc
 bv6b1GPW0hMaz/6xwRYzxEzfhpCz7/fYfVD4vCsXMK9nYtMsdhFrAqoR4aH3ju6hM2PZ
 bJq/Hn4KK0CvvfVcAIFu9CcMV8aWwRsQ/RdYoehBmcoUhOTVIc90c8wjlZ2B3JRqInFn
 PurQ==
X-Gm-Message-State: AO0yUKWFBXXTiqYH+Za6ar420bAIwYIgaCpidaU/TLiyieUpp/F/lW7H
 GjCK89GPJk5D8CnqtHJU/2F0irCeq+RGLN7ZD2eXOo8J+NqPrRq8lZt2q/C7bj2Xv0Qot1pozYz
 14zf7cEZpqjUh8v/yJklbSRj0Z4IC8U8Uo4/OWw==
X-Received: by 2002:ac8:5c86:0:b0:3b8:938e:73b3 with SMTP id
 r6-20020ac85c86000000b003b8938e73b3mr13145232qta.45.1676606994265; 
 Thu, 16 Feb 2023 20:09:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/hlZ94jWyrwHd4qpLMuUXDl/NK5EgniNBzKNhE2hVyp9o9vwRJq7apBUvuaSePFa1ZOWNzOg==
X-Received: by 2002:ac8:5c86:0:b0:3b8:938e:73b3 with SMTP id
 r6-20020ac85c86000000b003b8938e73b3mr13145200qta.45.1676606993929; 
 Thu, 16 Feb 2023 20:09:53 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 a143-20020ae9e895000000b007389403f7e6sm2613315qkg.9.2023.02.16.20.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:53 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 09/10] fuzz: remove fork-fuzzing scaffolding
Date: Thu, 16 Feb 2023 23:08:54 -0500
Message-Id: <20230217040855.16873-10-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, RCVD_IN_MSPIKE_H2=-0.001,
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
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
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
index a76c855312..b6f92bba35 100644
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


