Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6A66AE4C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0J-000128-Uk; Sat, 14 Jan 2023 17:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0H-00011C-DU
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:57 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0F-0003ha-MM
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:57 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx13so1658665ejb.13
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Owcx4mH1ywv43G3/wzVsA1viFGMbTgXcrT4ggMYA3GA=;
 b=apxSPGU0/0rberXJUa6MokKVr/t+/Coa1/3ipdRkK4xXSogUH03VuZ+uMbqX0XSMqG
 puzcsDZx1bSPZGVDKvzBlMhR3A1LY510HGcwyKiJlIHKBFtFUYM7xQQBuBUQZGM887r0
 EzJ0YqUEUuGFJ/u9bWpKcoyKcAT+YZExPDQXHFufqH+sn687d6DwjE6+oqg0sN8d5CBk
 A7zso8F+A9l2QePrE3u6RBBwXtOAk/BKKZTkxrApr5tYC4oA1v5gBeFi9DoSrFIbl+kh
 4fGRlMphAddsX8F3V7wBYY1E4pUtNvMvPRwnFQ5eyBpyGravksbJ8d7ynr9lTHXIqTvE
 ki7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Owcx4mH1ywv43G3/wzVsA1viFGMbTgXcrT4ggMYA3GA=;
 b=eRbSnqP6YaCQrrdYu06ILcfZmNRSy42JFRK+DkVpQqImyjpjFAG+PBjlxRzn2eKoOK
 h6wPwTyMFmQHaux8pezPhyTkGK/ndyQlvdEEvXwxvDiwbsFmdPhF7gcJ4PjiMteXkwq+
 7xBnkrCy9lp5g+fAEWzuUZ0eT7Bi/Hjv8RClggG+2Qtx3fiJQPlBdDzS7/w6qXhYZQaB
 h7Maugrn5AKEyeHzGYcOnYWGmrDgE2iKkgRqu0yTkJc0Xtf+1Th2qJpPSRaSNfvSdZwt
 vl1oYKZFBREweuAHIL6Qkudzqi/D/UZd92ebSH+AP1tWKh7r2xgh92gxOPg4vvXrHXTA
 mzYw==
X-Gm-Message-State: AFqh2kpnQ7Rjq9YTet50rYo9CpB5lkwQDFsdfeCvabCLY+RfrRbGYzxK
 16MRbiPNxFkQosWLsETUyUklp6yJKnQ=
X-Google-Smtp-Source: AMrXdXsvBbIH9MjUOJnmtwhnJ0meFzIU0Z2lfTC2J+KiH/zhfkDTowhQS7++d+Sd79Cb7eL992A+9w==
X-Received: by 2002:a17:907:175c:b0:84d:45db:b203 with SMTP id
 lf28-20020a170907175c00b0084d45dbb203mr19453747ejc.12.1673735274186; 
 Sat, 14 Jan 2023 14:27:54 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/7] hw/acpi: Add missing includes
Date: Sat, 14 Jan 2023 23:27:32 +0100
Message-Id: <20230114222738.282478-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

When removing the "hw/boards.h" include from
hw/acpi/acpi_dev_interface.h, these include directives must be added to make
the code compile again.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/hmat.h           | 3 ++-
 hw/acpi/cpu.c            | 2 ++
 hw/acpi/hmat.c           | 1 +
 hw/acpi/memory_hotplug.c | 1 +
 monitor/qmp-cmds.c       | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index b57f0e7e80..fd989cb661 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -27,7 +27,8 @@
 #ifndef HMAT_H
 #define HMAT_H
 
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "sysemu/numa.h"
 
 /*
  * ACPI 6.3: 5.2.27.3 Memory Proximity Domain Attributes Structure,
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4e580959a2..9148b3a49e 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,6 +1,8 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
+#include "hw/core/cpu.h"
+#include "hw/boards.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "trace.h"
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 3a6d51282a..f5abec5715 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -28,6 +28,7 @@
 #include "qemu/units.h"
 #include "sysemu/numa.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * ACPI 6.3:
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index d926f4f77d..0b883df813 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/boards.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
 #include "trace.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2932b3f3a5..45b0f2905d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "hw/boards.h"
 #include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
-- 
2.39.0


