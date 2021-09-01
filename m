Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213043FE503
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 23:36:18 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLXu4-0006ac-Mi
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 17:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mLXsb-0005oU-I7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:34:45 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mLXsY-0003Jv-Tj
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:34:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id e26so763401wmk.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBKoDobh0XVZhhRE5jeN9weMGvnGAQOZr8BLx7GtMQM=;
 b=QdPEcUy0XU/0SfTH3IYAffEWnkThKPp/qW03OkEagcpsUBnlY86+O4pN74ltjRNV4g
 SgwQxlbtCuKrNSmYQLwFbqS2JFNRugz5qwHFkpPdan1PpZEFUqD/dG1fORIQA/lBUrbW
 SYnBY7VO+rISFsprg89ZCNEVG1L8QG3stYY/4nGo4JjZulXVGKi8QIKput+cgKC0etRJ
 9oiJ/AGCb+sLWYdfrwto2tleTgOQ9DYoFkIIuHMddZMwRW7h8FTdf1aFu7G6kLHuHY8K
 aXuWMNtfpXyG0ZsIKWlVRmka5uFtiEM7h5MA+FddVBvp4pr7u1DyrDa/oJtVcc5tBfXp
 fnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBKoDobh0XVZhhRE5jeN9weMGvnGAQOZr8BLx7GtMQM=;
 b=lEIeU95bPHgzm4KBysNwqVgm/7M91icKbZrP82VWCoWXeJ/uTCiMk1j9C0iYE0OsD9
 GP2c24UCXvfbDO0Vr0RvMYWUw4MSA2Rc6TRmTtNUSG3iVSA2/w5heezsAXWLmfriWCzX
 +GK00d8Om+83b8/nXz/HgWYRAJTDoi3c8w2NzMHd/hGy10nJ5sIs5waJBTQscAqr++g5
 ySQnoKA9Tozfy8luGzkL43W6+6I69/h+sjoA8TWLRsomttieAjiwWOnm43I+vzEEfo5/
 kI3x2pGjwW1rngZ6uoiDgljEkpN15OVssb9AOZ7TeOpmH4QEH2XS5DTOFo+I2XNnfAhI
 yjKQ==
X-Gm-Message-State: AOAM530Mlxyyntz+PG6qG6bLa21swWxpQUEi5jg5xoEOV9VNrxmk3bqJ
 T6AZI5Dd9QEbe0UnuEiF9TwKjaLGcpE=
X-Google-Smtp-Source: ABdhPJytQmqftrPhi5jBHYsffc3xS1lA5/HnxxR7/eYm+y48aIINnlGbqVZ7u2fzsATF9+E7B/ZKOg==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr10698wmq.20.1630532080952; 
 Wed, 01 Sep 2021 14:34:40 -0700 (PDT)
Received: from endor.speedport.ip
 (p200300c2171e6ffd05e58539b6664b56.dip0.t-ipconnect.de.
 [2003:c2:171e:6ffd:5e5:8539:b666:4b56])
 by smtp.gmail.com with ESMTPSA id o10sm637257wrc.16.2021.09.01.14.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 14:34:40 -0700 (PDT)
From: Johannes Stoelp <johannes.stoelp@googlemail.com>
X-Google-Original-From: Johannes Stoelp <johannes.stoelp@gmail.com>
To: qemu-devel@nongnu.org
Cc: johannes.stoelp@gmail.com,
	peter.maydell@linaro.org
Subject: [PATCH v1] kvm: unsigned datatype in ioctl wrapper
Date: Wed,  1 Sep 2021 23:34:26 +0200
Message-Id: <20210901213426.360748-1-johannes.stoelp@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the data type of the ioctl _request_ argument from 'int' to
'unsigned long' for the kvm ioctl wrappers.

POSIX defines the request argument as 'int' but the glibc defines the ioctl
call as follows
    int ioctl (int fd, unsigned long int request, ...);

Requests with the 0x8000_0000 bit set will be sign-extended.
Fortunately the Linux Kernel truncates the upper 32bit of the request on
64bit machines [1].

On x86_64 one such example is the KVM_IRQ_LINE_STATUS request.
But requests with the _IOC_READ direction bit set, will have the high
bit set.

[1]: https://sourceware.org/bugzilla/show_bug.cgi?id=14362

Signed-off-by: Johannes Stoelp <johannes.stoelp@gmail.com>
---
v1:
    - Changed ioctl request from 'unsigned' -> 'unsigned long' in kvm ioctl wrapper.
v0:
    - Changed ioctl request from 'int' -> 'unsigned' in kvm ioctl wrapper.
    - L: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00945.html

 accel/kvm/kvm-all.c    | 10 +++++-----
 accel/kvm/trace-events |  8 ++++----
 include/sysemu/kvm.h   |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..5f9379f3cc 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -127,7 +127,7 @@ struct KVMState
     /* The man page (and posix) say ioctl numbers are signed int, but
      * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
      * unsigned, and treating them as signed here can break things */
-    unsigned irq_set_ioctl;
+    unsigned long irq_set_ioctl;
     unsigned int sigmask_len;
     GHashTable *gsimap;
 #ifdef KVM_CAP_IRQ_ROUTING
@@ -2967,7 +2967,7 @@ int kvm_cpu_exec(CPUState *cpu)
     return ret;
 }
 
-int kvm_ioctl(KVMState *s, int type, ...)
+int kvm_ioctl(KVMState *s, unsigned long type, ...)
 {
     int ret;
     void *arg;
@@ -2985,7 +2985,7 @@ int kvm_ioctl(KVMState *s, int type, ...)
     return ret;
 }
 
-int kvm_vm_ioctl(KVMState *s, int type, ...)
+int kvm_vm_ioctl(KVMState *s, unsigned long type, ...)
 {
     int ret;
     void *arg;
@@ -3003,7 +3003,7 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
     return ret;
 }
 
-int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
+int kvm_vcpu_ioctl(CPUState *cpu, unsigned long type, ...)
 {
     int ret;
     void *arg;
@@ -3021,7 +3021,7 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
     return ret;
 }
 
-int kvm_device_ioctl(int fd, int type, ...)
+int kvm_device_ioctl(int fd, unsigned long type, ...)
 {
     int ret;
     void *arg;
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 399aaeb0ec..a1905fe985 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -1,11 +1,11 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # kvm-all.c
-kvm_ioctl(int type, void *arg) "type 0x%x, arg %p"
-kvm_vm_ioctl(int type, void *arg) "type 0x%x, arg %p"
-kvm_vcpu_ioctl(int cpu_index, int type, void *arg) "cpu_index %d, type 0x%x, arg %p"
+kvm_ioctl(unsigned long type, void *arg) "type 0x%lx, arg %p"
+kvm_vm_ioctl(unsigned long type, void *arg) "type 0x%lx, arg %p"
+kvm_vcpu_ioctl(int cpu_index, unsigned long type, void *arg) "cpu_index %d, type 0x%lx, arg %p"
 kvm_run_exit(int cpu_index, uint32_t reason) "cpu_index %d, reason %d"
-kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
+kvm_device_ioctl(int fd, unsigned long type, void *arg) "dev fd %d, type 0x%lx, arg %p"
 kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
 kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
 kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..d0f354a897 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -251,11 +251,11 @@ int kvm_on_sigbus(int code, void *addr);
 
 /* internal API */
 
-int kvm_ioctl(KVMState *s, int type, ...);
+int kvm_ioctl(KVMState *s, unsigned long type, ...);
 
-int kvm_vm_ioctl(KVMState *s, int type, ...);
+int kvm_vm_ioctl(KVMState *s, unsigned long type, ...);
 
-int kvm_vcpu_ioctl(CPUState *cpu, int type, ...);
+int kvm_vcpu_ioctl(CPUState *cpu, unsigned long type, ...);
 
 /**
  * kvm_device_ioctl - call an ioctl on a kvm device
@@ -264,7 +264,7 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...);
  *
  * Returns: -errno on error, nonnegative on success
  */
-int kvm_device_ioctl(int fd, int type, ...);
+int kvm_device_ioctl(int fd, unsigned long type, ...);
 
 /**
  * kvm_vm_check_attr - check for existence of a specific vm attribute
-- 
2.32.0


