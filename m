Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4969A4A3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:09:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs3x-0000g9-Lv; Thu, 16 Feb 2023 23:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3w-0000fj-Is
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:32 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3t-00017Y-Hl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:32 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 259423657
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V3VmUKuw/gRi3GKWDK06MIr7KefnVOhcMUV32f8akzHdYApBsoF/q
 tZmKT+AbPqOZjOkedF+Ydi39hhXsMDUnIdrHAVqqn01ES0a9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnO6gQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUD1cJuA1NC9
 cVCCxUJdyuIqMa/3+uSH7wEasQLdKEHPasas3BkiCjaVLMoGMGTBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6aOVsWawd/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwYYaPIYLXGq25mG6lt
 lKZp1nBKChALZuW5wDZ+Em3q7XmyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyTYC4UUTp8DiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7afamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:RgKHFK6cHmKpZdsc8gPXwFbXdLJyesId70hD6qkRc3Nom6mj/f
 xG88526faZskd3ZJhYo6H5BEDiex3hHPxOkO0sFI64UAjrsGalN+hZjLcKqgeIcxEWkNQtt5
 uIGJIOceEYY2IWse/KpCm+HtotzZ2s9aClgvqb5251JDsaDZ1I3kNYDQuWHkAzbg9AGJY/Cd
 6g9tNKzgDQHEg/X4CaAXQIU+WGiPbv/aiHXTc2Qz4h5QWDgHeUytfBYmOlN0clOA9n0PMp+W
 zdmwz24eGivpiAu3zh61M=
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:26 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 c9-20020a05620a11a900b0072a014ecc4aso2428032qkk.18
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIzRevXJLYfs+SfsjeJmqdfmNwjNEhZx1/WXfBx6Mlc=;
 b=I0U5o3HKbbjsjvfT4UBApVnRkJeP7sVmZZcn1A8Qa8tKWmJlVdNYVfjIww+S2yn1oc
 VZg49nAqeSSBxkweW7xmUXm42HbH2X79paI3dykKPb1KEoboVcwWOEdl8FhK/RdRiPTk
 eX3bKzPjcEgu0MaB4cdLu1Hwwge0l/ZR72cIyNV01vt3sho5sVFfHH2IfNp3OHsl9U2I
 /8/Via3ILb5qs/OXtckxA5vakt97o4EyZQpKgagQ2orMMTTqsLiy2b4xbKheZgQauq7U
 1jbzPxImakY2QR6cz3q0UagwJqJyjaQgqH2OXme6oE/4V/7vtkOL+QIYJb+0AUZRdIVt
 NTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIzRevXJLYfs+SfsjeJmqdfmNwjNEhZx1/WXfBx6Mlc=;
 b=pPM5o9ltW5sNQ7/joCwtKlarukIkf37/SdZtHLkuv9C23WazrJT3X962lDihHDYiwx
 hbLS89Jrkr3o1CnjeL+RfQq6qJ9YSGCfhxbWlj1bEpeVWLwB9daAwjksePrZvJ+VmpYW
 dSiu/eeJ9h7A9sDw3loz5o+Uyiq7PDaQwHo9Zj/wllKKJndSocUYfAseYSfKwsdf0dxC
 bieOIIMIpHQoQo57iGF5l2QpjwuLO84kGymmU2T2hID+zvoGt5ipkp8LBsIJ9G1s1W4G
 5ZAneUHKuakvDcX098mWLya5BZ7KpMR4Jb2XAXc0lHB/EyWAQQquxn6X0OlPIRQGV8Ae
 r/Aw==
X-Gm-Message-State: AO0yUKUGYHHmdLGqH2XLzjdLuG/ySiUDzTe/NhVkzafgQl7JLx723sgh
 zFEQg5TEJvegrIAhsflJY+6FOAQa+rPEpl52Pc4GbXibXV4B9r+3iG1XCsj7YvZtzwHu1ofjh4X
 ETa7LiNs9L4FFI5+Sonmu4+K9DVRrnbPmWM6spA==
X-Received: by 2002:ac8:4e84:0:b0:3bd:adc:66cc with SMTP id
 4-20020ac84e84000000b003bd0adc66ccmr6678926qtp.66.1676606965809; 
 Thu, 16 Feb 2023 20:09:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9xyiJ95wI73mdwIROG8Lz++9rKKhX8kGPDenael4K2Su1/KtEezMm53LCfkHyMxtbwKzhOFQ==
X-Received: by 2002:ac8:4e84:0:b0:3bd:adc:66cc with SMTP id
 4-20020ac84e84000000b003bd0adc66ccmr6678907qtp.66.1676606965542; 
 Thu, 16 Feb 2023 20:09:25 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 q7-20020ae9dc07000000b0071f40a59fe5sm2468047qkf.127.2023.02.16.20.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:25 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PULL 01/10] hw/sparse-mem: clear memory on reset
Date: Thu, 16 Feb 2023 23:08:46 -0500
Message-Id: <20230217040855.16873-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We use sparse-mem for fuzzing. For long-running fuzzing processes, we
eventually end up with many allocated sparse-mem pages. To avoid this,
clear the allocated pages on system-reset.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mem/sparse-mem.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
index e6640eb8e7..72f038d47d 100644
--- a/hw/mem/sparse-mem.c
+++ b/hw/mem/sparse-mem.c
@@ -77,6 +77,13 @@ static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
 
 }
 
+static void sparse_mem_enter_reset(Object *obj, ResetType type)
+{
+    SparseMemState *s = SPARSE_MEM(obj);
+    g_hash_table_remove_all(s->mapped);
+    return;
+}
+
 static const MemoryRegionOps sparse_mem_ops = {
     .read = sparse_mem_read,
     .write = sparse_mem_write,
@@ -123,7 +130,8 @@ static void sparse_mem_realize(DeviceState *dev, Error **errp)
 
     assert(s->baseaddr + s->length > s->baseaddr);
 
-    s->mapped = g_hash_table_new(NULL, NULL);
+    s->mapped = g_hash_table_new_full(NULL, NULL, NULL,
+                                      (GDestroyNotify)g_free);
     memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
                           "sparse-mem", s->length);
     sysbus_init_mmio(sbd, &s->mmio);
@@ -131,12 +139,15 @@ static void sparse_mem_realize(DeviceState *dev, Error **errp)
 
 static void sparse_mem_class_init(ObjectClass *klass, void *data)
 {
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, sparse_mem_properties);
 
     dc->desc = "Sparse Memory Device";
     dc->realize = sparse_mem_realize;
+
+    rc->phases.enter = sparse_mem_enter_reset;
 }
 
 static const TypeInfo sparse_mem_types[] = {
-- 
2.39.0


