Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581144EC9A9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:29:39 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbCT-0008Ui-Qy
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:29:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavn-000203-Ox
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:23 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:43352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavm-000170-84
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:23 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 724B021EBD;
 Wed, 30 Mar 2022 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648656738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbIDN0VeqBQJkoo/NdrYLZEhaopwl/+A49BtidvkoVA=;
 b=QfHYqpjUpUVfM/G3Jl7AxiCmnyy6RCsBO7QkH+PfZ9F6uIAPklQs+cmrQYwWGB5qNA5rrq
 CUCSjUTouAT1bYI5jF0quDFcIYpiqQUf7xakUAjhRmYGI49pX/oHZmxs0sWzK5xKLBomci
 bR+SbNc8P4RWes+BP0IIAqATWyTrB3k=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] machine: remove temporary inline functions
Date: Wed, 30 Mar 2022 18:12:15 +0200
Message-Id: <20220330161215.235231-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330161215.235231-1-damien.hedde@greensocs.com>
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have renamed all call to these old functions, we
can delete the temporary inline we've defined.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/boards.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9ce7d705c9..7efba048e9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -52,11 +52,6 @@ void machine_parse_smp_config(MachineState *ms,
  * it will get an error message.
  */
 void machine_class_allow_dynamic_device(MachineClass *mc, const char *type);
-static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
-                                                          const char *type)
-{
-    machine_class_allow_dynamic_device(mc, type);
-}
 
 /**
  * device_type_is_dynamic_allowed: Check if type is an allowed device
@@ -72,11 +67,6 @@ static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
  * Note that if @type has a parent type in the list, it is allowed too.
  */
 bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type);
-static inline void device_type_is_dynamic_sysbus(MachineClass *mc,
-                                                 const char *type)
-{
-    device_type_is_dynamic_allowed(mc, type);
-}
 
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
-- 
2.35.1


