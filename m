Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E56F8EE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 07:32:58 +0200 (CEST)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpQwT-0004Q7-K0
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 01:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46405)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <npiggin@gmail.com>) id 1hpQw9-0003NC-13
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 01:32:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1hpQw7-0007ID-Va
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 01:32:36 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1hpQw7-0007Hh-OG; Mon, 22 Jul 2019 01:32:35 -0400
Received: by mail-pg1-x544.google.com with SMTP id i8so17078045pgm.13;
 Sun, 21 Jul 2019 22:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdbP7WX22fhUZ3ihdslkK8f8fz4KZ3GwbwHPAjoISxk=;
 b=Y/fxJDYGEMMdN6lJEwwqc+J+p3ZAFqeR75B6ANMHhDkO4mrUgyWOpcvF6huFqzyuke
 agxC/eUbSTDCCgd1vo0kCJqwS8QES1KqVfuaVmjZ8Zf22yYI5GOXxEyj3tGwIryagXhN
 Tnz9tj8UXi5AxfA/r/13gRPvhwbwFakwrbAgX+D9eXlxzNm/2r2QlS1YDutO+NKd4ucV
 vwdQixD9ju842lDTI2dCtGXlYpc8acJJzRc6h2cYgdleDSij6YGzm0HPSQNHO/AMha11
 2P76lQPDxSD4EzCzCeWW6J+FNPnVrhNDH8aU2jLh1y+hddldFfc4xTMcOGe73w+wPodf
 wboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdbP7WX22fhUZ3ihdslkK8f8fz4KZ3GwbwHPAjoISxk=;
 b=T+xUD2c8A9vYYFZ+9F36srvXjAi6M5C5/eATggQPSRZCbymWriRQB2TCFM+Dbcn6UV
 NcrARbzqnphSfRe4PHJeTavN3BWME7gO4vgunJqVQMkNX8et8cx3JpXtedu+AeS1kfh6
 RUVMUg5w2FSze5Zx46EealNkR95gJT/wFr621C9u00cN7VFrAcR9oQ9Ms8fg7wFZ52wy
 Gofx2/OIYyPnavo2QKxpY0U6k6peXbDrGDifRYJ1kgxztmIqHXB6xZntcL0KaFJK233h
 YMLGnCqK2F9hMg9DzXzF58FxQ2jQUbdO94EcqVzKApnSZ6KD+pnVZyGcLOrBC0sW22xZ
 hg2Q==
X-Gm-Message-State: APjAAAUNf5cRZeL/H47LGPED7OO3sXJgkgtKUSzoREDS2axeAuUNSSbr
 xjf1zGEDjFhQkgu04RELKfpEQx9hm/A=
X-Google-Smtp-Source: APXvYqy6oy2ABCgErY04URgakqWHSjk1lC2j48GS8JDx2JsVpyIPhiq2ofA2LSm1c72bnjHFf/Ai9A==
X-Received: by 2002:a63:dd4e:: with SMTP id g14mr59700698pgj.227.1563773554726; 
 Sun, 21 Jul 2019 22:32:34 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id p7sm40281670pfp.131.2019.07.21.22.32.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:32:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 15:32:13 +1000
Message-Id: <20190722053215.20808-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722053215.20808-1-npiggin@gmail.com>
References: <20190722053215.20808-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v2 1/3] machine: Add wakeup method to
 MachineClass
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
Cc: Liu Jinsong <jinsong.liu@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Waking from suspend is not logically a machine reset on all machines,
particularly in the paravirtualized case rather than hardware
emulated. The ppc spapr machine for example just invokes hypervisor
to suspend, and expects that call to return with the machine in the
same state (modulo some possible migration and reconfiguration
details).

Implement a machine ->wakeup method and use that if it exists.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/hw/boards.h |  1 +
 vl.c                | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a71d1a53a5..915ac3352b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -180,6 +180,7 @@ struct MachineClass {
 
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state);
+    void (*wakeup)(MachineState *state);
     void (*hot_add_cpu)(MachineState *state, const int64_t id, Error **errp);
     int (*kvm_type)(MachineState *machine, const char *arg);
     void (*smp_parse)(MachineState *ms, QemuOpts *opts);
diff --git a/vl.c b/vl.c
index cefe5a3968..45ea034410 100644
--- a/vl.c
+++ b/vl.c
@@ -1556,6 +1556,22 @@ void qemu_system_reset(ShutdownCause reason)
     cpu_synchronize_all_post_reset();
 }
 
+/*
+ * Wake the VM after suspend.
+ */
+static void qemu_system_wakeup(void)
+{
+    MachineClass *mc;
+
+    mc = current_machine ? MACHINE_GET_CLASS(current_machine) : NULL;
+
+    if (mc && mc->wakeup) {
+        mc->wakeup(current_machine);
+    } else {
+        qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    }
+}
+
 void qemu_system_guest_panicked(GuestPanicInformation *info)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "Guest crashed");
@@ -1764,7 +1780,7 @@ static bool main_loop_should_exit(void)
     }
     if (qemu_wakeup_requested()) {
         pause_all_vcpus();
-        qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+        qemu_system_wakeup();
         notifier_list_notify(&wakeup_notifiers, &wakeup_reason);
         wakeup_reason = QEMU_WAKEUP_REASON_NONE;
         resume_all_vcpus();
-- 
2.20.1


