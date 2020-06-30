Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2920F03C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 10:16:20 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqBRD-0004tc-8y
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 04:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqBOW-0001N8-2y
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 04:13:32 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqBOU-0003BR-ET
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 04:13:31 -0400
Received: by mail-ed1-x544.google.com with SMTP id e22so15293430edq.8
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSSf9Gph0a3stYSRY1wq7h1jREXKNcDTLzkc58dT+HY=;
 b=IWTNvzaeyoV6j/pIaU0mv+Bl2VjjDxQpM6ICioJ3/uMWAKNFTBi82Ykn6nWbmOB6eo
 wWydP3GhoTtTSWv92frGuWg9HdP+bgCjjY+YFmOngANqzmr9JEVgtD4IRaaq83TOsRKV
 Z6BRZppbOXlys7sM7jax1eCvRUbdcYiywu/JuWXCcUnia4SxKNQ6X9D+ICNIkmjJUBeq
 EzuUUF81JaBWCTmEjluLMyO4RrWR2w4A/p0yUCAHmbvC0jakzrssqd9sxMEVqjS7cx1F
 GfJ6ao8RxF4ISQ4QJVIuqfO8vjDZ6XUn4guu+x0LBawhwuQFx+qMbiKtr1/tDyzy0hBt
 YDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OSSf9Gph0a3stYSRY1wq7h1jREXKNcDTLzkc58dT+HY=;
 b=ADxkh8yK3qbkPeF5cXJFsP4b3LoK+O/eqmfXZg8GI3QVleNwKhOpnhWbL2ieBWUZe7
 07CxIF8H6CaatYulH4e8k4uHQYbTp1IBC6q7Rj3KWfthM6l5omhW3h7hIQ7gWKJqqRFL
 rjtBNpcATmhyaBBTu96NSJeHlxzrgHZsHXCFiXNSeEzt2xaS2MZQ1RsmHjNa+gBLzG1I
 u1Nnm4JQjVgUtYPBJXM5KmSZx7+149xk8pkg71qsH+go4X09qm5zOkj0Q9UE/UsL8TtO
 5Nd7dVx7HRkTWGYoWprssu4Misl9IMZ9rNBZNdqE2eYS6Y5bnUTKeJjWC+ZMTk1XdLAf
 bBrQ==
X-Gm-Message-State: AOAM5302BJLLTnc8FUqHeb6i/OyjVZTSsLdT5BSUAHtQ39M1qPF1xFMm
 vm6XTxrqHftH8VqJ1pcMWeE=
X-Google-Smtp-Source: ABdhPJw7LsmEKggCoZZx9Chvkg6R1A46LnxwDTlsUlHFIAD7RV+WMm+mcziJqlLMFlTEJ1qp/yPxrA==
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr22171996ede.385.1593504808362; 
 Tue, 30 Jun 2020 01:13:28 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id z1sm1425948ejb.41.2020.06.30.01.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 01:13:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Yunqiang Su <ysu@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-devel@nongnu.org
Subject: [PATCH 3/7] hw/mips/malta: Rename 'malta' machine as 'malta-virt'
Date: Tue, 30 Jun 2020 10:13:18 +0200
Message-Id: <20200630081322.19146-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630081322.19146-1-f4bug@amsat.org>
References: <20200630081322.19146-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to model the real physical Malta board. The current model
does not have the physical restrictions real hardware have.
Rename the current machine as 'malta-virt'. To not disrupt command
line users, keep the 'malta' machine name as an alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 66172f0c82..f8fc567532 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1439,8 +1439,16 @@ static void malta_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "MIPS Malta Core LV";
     mc->init = mips_malta_init;
+    mc->default_ram_id = "mips_malta.ram";
+}
+
+static void malta_machine_virt_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "MIPS Malta Core LV (no physical limitations)";
+    mc->alias = "malta";
     mc->block_default_type = IF_IDE;
     mc->max_cpus = 16;
     mc->is_default = true;
@@ -1449,13 +1457,13 @@ static void malta_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
-    mc->default_ram_id = "mips_malta.ram";
 }
 
 static const TypeInfo malta_machine_types[] = {
     {
-        .name          = MACHINE_TYPE_NAME("malta"),
+        .name          = MACHINE_TYPE_NAME("malta-virt"),
         .parent        = TYPE_MALTA_MACHINE,
+        .class_init    = malta_machine_virt_class_init,
     }, {
         .name          = TYPE_MALTA_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.21.3


