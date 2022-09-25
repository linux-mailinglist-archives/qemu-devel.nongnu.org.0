Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EBD5E92F5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:09:13 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQRc-0001R1-5X
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrg-00030W-8P
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPre-0006Ph-Iv
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:04 -0400
Received: by mail-pf1-x431.google.com with SMTP id b23so4158363pfp.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FodAt/+tlmeyr8mO0vp74otmvfdLkdpAkh8HSKQOwPY=;
 b=LDpBwdzsxv/HF7iMvBwC8uY0zLEGmQP9MZqP1UiBw7T7xVarF5VSulafavuCHILMUa
 ljgEMn53OZ3pdSiVwB7en3XyRHQXlueWYqgR4aQNUi+4MdrZCfVlBsTwc9LebQKxr0vt
 3jp3ItYjqK7BOOW0FYFU8yYCbYNhOCGAooTrPdflN63sU1/cdvo3timhaNk5+tBY444B
 c8uraSb5gzO8UYxreuL0liE6CX2tgbL2xUrBK7O0ThdbPLbGN8VbV/mZRcVRU4X8Cj1m
 LhF2eQcOjVk32T7/eW2/KCLk5Nh5/y2Q0UnFcPNUst3bY7Uj6A3q9YlU9dxj/tZsmmzT
 pq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FodAt/+tlmeyr8mO0vp74otmvfdLkdpAkh8HSKQOwPY=;
 b=YcFxl090ML7mcDMC/Mzd+eDMzQaVPqXxowDxYV/TRqUDsjN0LdA6/ZUvcloImglTYl
 9ekhc+XRiPnXhmQIY/SMUic/VEA/XT703FHoiVmy/zjg01YxBjA/xsDpia0H8i9MqOl+
 3PXLl/+JLz6UhZr4fyV1StP9tiJqtfDq2qnCgUjVzLzcVDCUUJVzqy4x3pEMZh4wxjjv
 yJCPixrXJaUX5lYPgzOVfvLtW2eZMzEnWeRfn9OJaz5M0xab4pOsEUSelaRHNBjnBiKU
 LfrWwc0KxdL52iRP/VuLnCv4dZ8l52bNViLz+9cTnxLTRSHPrI21SZHRBivTNWE70RVh
 DZYw==
X-Gm-Message-State: ACrzQf1Fyhfmhz2EULNgaggd4BaD3xPZjM/+wbQMY8/vJZIz5AidkByz
 fwxxsgPNbLV9CEgukrq8g8sCS4NHaVY=
X-Google-Smtp-Source: AMsMyM6DIyfKfPMKkqoYxqpTIyf+Xd62YV8smvJn4fPSTDJa0PNEtpVHYBbYNmINfC2WszLJm19F+A==
X-Received: by 2002:a65:6e87:0:b0:438:e26c:167a with SMTP id
 bm7-20020a656e87000000b00438e26c167amr14986527pgb.421.1664105521033; 
 Sun, 25 Sep 2022 04:32:01 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v3 31/54] accel/qtest: Implement a portable qtest accelerator
Date: Sun, 25 Sep 2022 19:30:09 +0800
Message-Id: <20220925113032.1949844-32-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
when qtest accelerator is used. However SIGUSR1 is unsupported on
Windows. To support Windows, we add a QemuSemaphore CPUState::sem
to kick the dummy CPU instead.

As a result of this, the POSIX implementation via signal is no
longer needed and can use the same path as Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Replace signal by the semaphore on posix too

 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 15 ++-------------
 softmmu/cpus.c          | 10 +---------
 accel/meson.build       |  1 +
 accel/qtest/meson.build |  1 +
 5 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..2f46c37dc1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -326,6 +326,7 @@ struct CPUState {
 #ifdef _WIN32
     HANDLE hThread;
 #endif
+    QemuSemaphore sem;
     int thread_id;
     bool running, has_waiter;
     struct QemuCond *halt_cond;
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 10429fdfb2..3769d3db0a 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -21,8 +21,6 @@
 static void *dummy_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    sigset_t waitset;
-    int r;
 
     rcu_register_thread();
 
@@ -32,23 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
     cpu->can_do_io = 1;
     current_cpu = cpu;
 
-    sigemptyset(&waitset);
-    sigaddset(&waitset, SIG_IPI);
-
     /* signal CPU creation */
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
     do {
         qemu_mutex_unlock_iothread();
-        do {
-            int sig;
-            r = sigwait(&waitset, &sig);
-        } while (r == -1 && (errno == EAGAIN || errno == EINTR));
-        if (r == -1) {
-            perror("sigwait");
-            exit(1);
-        }
+        qemu_sem_wait(&cpu->sem);
         qemu_mutex_lock_iothread();
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug);
@@ -67,6 +55,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
     qemu_cond_init(cpu->halt_cond);
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
              cpu->cpu_index);
+    qemu_sem_init(&cpu->sem, 0);
     qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
                        QEMU_THREAD_JOINABLE);
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23b30484b2..2a992d0d5f 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -437,19 +437,11 @@ void qemu_wait_io_event(CPUState *cpu)
 
 void cpus_kick_thread(CPUState *cpu)
 {
-#ifndef _WIN32
-    int err;
-
     if (cpu->thread_kicked) {
         return;
     }
     cpu->thread_kicked = true;
-    err = pthread_kill(cpu->thread->thread, SIG_IPI);
-    if (err && err != ESRCH) {
-        fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
-        exit(1);
-    }
-#endif
+    qemu_sem_post(&cpu->sem);
 }
 
 void qemu_cpu_kick(CPUState *cpu)
diff --git a/accel/meson.build b/accel/meson.build
index b9a963cf80..b21c85dc0a 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -17,4 +17,5 @@ dummy_ss.add(files(
 ))
 
 specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)
 specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index 4c65600293..a4876fc0f2 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,2 +1,3 @@
 qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
                     if_true: files('qtest.c'))
+qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))
-- 
2.34.1


