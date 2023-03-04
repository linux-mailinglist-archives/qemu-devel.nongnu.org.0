Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4D26AAAB5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmu-0003PP-LG; Sat, 04 Mar 2023 10:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTms-0003KT-3s
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:06 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmo-00089B-7J
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:05 -0500
Received: by mail-ed1-x52b.google.com with SMTP id ay14so17928221edb.11
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ug5gJZGeezwup7JAt+aAtCTz/atdkqBNV+dZDUYeaM=;
 b=bP7l26JiPfyHWpWWwpZHZ3UhB+NQuNG67QbwvK8f6cRbMHR8ZPoRKQn+yjlOmuKl13
 fsnertj/UsUw2C8mM1T1Yp85MBlLjlESW05QBaMLHkKZjEt1bMBrBexGIOjdqszrbzQc
 j2LQcX1Co+P5eJoovv3sfMuch+frxFdDz56t0cPK1kGJnUK6QqQaNlQLusVBmt/Krhrk
 9i9V+w8JfjKdwlAVKz1xdQlAzizI3CZbktdisrMCK61AHdRDW5dwh/ujDA6WL4lUCDdF
 ngkiw7ulvcDJtAmUovwo/iVGNB/HIAv9yJJLfUP7Hx4NIvKQ58J3jhuCT3GrE1nST8Sc
 oRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ug5gJZGeezwup7JAt+aAtCTz/atdkqBNV+dZDUYeaM=;
 b=BC1cNCwUUO5bW5gzApv8qRZ/Ezm5njOLhrhP2lftyV7RZi2oleGL7oG2lSY1gZNGja
 YYSuT0NhPTMbaKULQEXHGj9P3JC0sJ8BvoRV/F5bsu86/s4lWUTfHA3jVhbm6TfORHjC
 DZtFUQUm081jwISspy0BftC1Fk5QcckqfBfzU5k+XIYntjcz27Rv4DfQzJeYUvDE0A25
 xxMA5+QG+0OtctC+/wusZV3D8GaFzi2OuYAPYgLprJqYvkVnRWfXJyYtXuAKWDu/q3gm
 LPfaocuD3BUIddkjHlWxDPEbi/IDruKFibElf9laHMZYmV+dZ+0PtZtqlSvib+iADqTM
 8EVA==
X-Gm-Message-State: AO0yUKXKfu7pi1gr34Rq0fQ1ViXq+5tcx9MpJYAC73aKzPIwalPkfhxX
 4uGgW6vZpWv+9VGdl9KqBPBPgc8Htro=
X-Google-Smtp-Source: AK7set9HrFGHWXviwJUUR3KWOZp66ZbRor60NwOx/DbdaTGjjx7hWzpWLQomsK6C/frPl/+H5R6hjg==
X-Received: by 2002:a17:907:6e1d:b0:8da:69ae:6ff0 with SMTP id
 sd29-20020a1709076e1d00b008da69ae6ff0mr7158975ejc.22.1677943618826; 
 Sat, 04 Mar 2023 07:26:58 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:26:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 02/13] hw/pci-host/q35: Fix double,
 contradicting .endianness assignment
Date: Sat,  4 Mar 2023 16:26:37 +0100
Message-Id: <20230304152648.103749-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes the following clangd warning (-Winitializer-overrides):

  q35.c:297:19: Initializer overrides prior initialization of this subobject
  q35.c:292:19: previous initialization is here

Settle on native endian which causes the least overhead.

Fixes: bafc90bdc594 ("q35: implement TSEG")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 83f2a98c71..40bfe99910 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -294,7 +294,6 @@ static const MemoryRegionOps blackhole_ops = {
     .valid.max_access_size = 4,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 /* PCIe MMCFG */
-- 
2.39.2


