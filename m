Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95E6C2451
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNly-0005DK-6s; Mon, 20 Mar 2023 18:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wtoYZAcKCgMnrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com>)
 id 1peNlw-0005Cm-0X
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:32 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wtoYZAcKCgMnrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com>)
 id 1peNlu-0004Ql-As
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:31 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d12-20020a056a0024cc00b006256990dddeso6799704pfv.9
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679350466;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=g+dsGi3rfOPju1S9X+xSfNR+P2c80nLDtQ8EH/REXBc=;
 b=nXKcMGGuWFQ6rBuuTg0yACqsttK63z6ZXsjzn8vSJ7nepoS9WcEZUJ7SVHs8XJpmQw
 IW5Mynl2Um/quVuFTUQH39ku0q5XomLeEkfC/1azHgSW/oIoa1N4M8yO5IAeF7ZAoLkQ
 h57NaYfVAHVxNqs1PCIkGx/fAhsWlQLKea1OoOhqx4jVxHRLyWouFERsJTPcolVmWw7c
 cL0LSIAfXd5f41rYXNxEHc5NbrMHQUXQm+gwySgpbES8eK9kOMBE4+HHGhISqgaLICXw
 5eeiyrSRXK2n4UpN4A+rK39V6i2Qw6LvqJkTkzZJSSZC/ejPt19biyzW4jjRDTYIs4NJ
 5zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350466;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+dsGi3rfOPju1S9X+xSfNR+P2c80nLDtQ8EH/REXBc=;
 b=EuS7PitMX3S8T6j120FiAxcGgj1T/w8T79HAFmlYuB3YQv8dgFaaeR9Kgoy0jqozBe
 7lHBJp8hEak824DKgXC7F9I/C1oqwni+LFEeTykm62CPuSI9kj5gKl6QeB4VSTUKa57z
 s9eo/ZPKBaHDum0TIIRIiesGXWKqY55Fpn8s2zmsKbZrzP5yg3rS3r2xpN+V9qPQRYdH
 1c6Wgc9bBHqaBUhx0C9Bw0E3U+HDshnmudAB9QcFe6RJxt9KvGfXq3m+zYGRbuqtE1l5
 g8o8X1YghDQqF0b0phQnNY4d25QYk2SYwOoK6/wJSbrQb+YKtFXdQU9hKj5f1cMpn/BO
 zlUA==
X-Gm-Message-State: AO0yUKVw9BYmR1gXzkPO6rnZR9WDG6TpRueNvqoHhBAlOIU783OqBTFq
 bYMfnKVLBJfVaVudXC4fU8Twhum8z26q
X-Google-Smtp-Source: AK7set8geeK/kt5sY+sSiWJDWloJwAUcVypB8FJFk6Xnp210FKqblQ2+pZiHy1e0NTKpUVx7Xwq/4qoHwxCA
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:2303:b0:5a8:a475:918f with SMTP
 id h3-20020a056a00230300b005a8a475918fmr234199pfh.4.1679350466047; Mon, 20
 Mar 2023 15:14:26 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:14:19 +0000
In-Reply-To: <20230320221419.2225561-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230320221419.2225561-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <20230320221419.2225561-3-komlodi@google.com>
Subject: [PATCH 2/2] hw/i2c: core: Add reset
From: Joe Komlodi <komlodi@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, komlodi@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3wtoYZAcKCgMnrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

It's possible for a reset to come in the middle of a transaction, which
causes the bus to be in an old state when a new transaction comes in.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/i2c/core.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index bed594fe59..2aecbfb334 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -23,10 +23,29 @@ static Property i2c_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void i2c_bus_enter_reset(Object *obj, ResetType type)
+{
+    I2CBus *bus = I2C_BUS(obj);
+    I2CNode *node, *next;
+
+    bus->broadcast = false;
+    QLIST_FOREACH_SAFE(node, &bus->current_devs, next, next) {
+        QLIST_REMOVE(node, next);
+        g_free(node);
+    }
+}
+
+static void i2c_bus_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    rc->phases.enter = i2c_bus_enter_reset;
+}
+
 static const TypeInfo i2c_bus_info = {
-    .name = TYPE_I2C_BUS,
-    .parent = TYPE_BUS,
-    .instance_size = sizeof(I2CBus),
+   .name = TYPE_I2C_BUS,
+   .parent = TYPE_BUS,
+   .instance_size = sizeof(I2CBus),
+   .class_init = i2c_bus_class_init,
 };
 
 static int i2c_bus_pre_save(void *opaque)
-- 
2.40.0.rc2.332.ga46443480c-goog


