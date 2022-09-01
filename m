Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FE5A9D98
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:58:46 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnWg-0006bO-5v
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2a-0002RJ-0c
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2U-0001X1-Da
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z2so23325918edc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SlToYWAPZtWuGZJZibHwCsed/eDjnDRLfqlai/mOKCc=;
 b=KAUp+tyjFJeGzSvafXJ9wazEEzPoNv+Unfogiv/fkwi2j6TWQ0dJzh7ud8tLpLtyVX
 dH0rcJYunuaFF5KBbanXbhNlIrJWJ28j82fAx5F8RimVBTEVJTr/RfCs2w7nW6MBzv5A
 WOAxIwGZFUtZRDuJF6X++B3zhB7ixzFyNivqXnNA+JXpELT2N7e5B4chIUX4WxDdrLNo
 ZV4XYin2zT3KOsc9BC1Bpd+iwCr1V52lPgaBfEzxGNmSP8yrFs6YIBKGNGbCTKgadNVB
 JwEK5j7wz/x+inby4XcQGs/FrEdqv+9LfLj5/XbO8kT908ylbhPxw+EQ65NQcX44my/A
 mUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SlToYWAPZtWuGZJZibHwCsed/eDjnDRLfqlai/mOKCc=;
 b=Sgjt+/vaZvmcw3Z+6jNPpJ+1p3S0fKNjQ7BVhq2FDkc6euBKttbiAzx+riP9MtwpK3
 nDvscDoJsbnDkF/fRA+yehQAxt+LKAv28g4D3LTrLkL+cnulgMcR4ocY9szjQwMh6GAJ
 3mpvZ0kdjU/XcDiYuLvGWokAdLwuBy5HyusB8NTT74zAuvRhaNL+O0BseWnRZOw1bl7E
 dWsYk8n9MOSQLHQ1jtA1DkcRc0WkJ+xVf4z3Fn0Q/rE73IwHbUwJ5Ha/qf7Zthoagu51
 ZZ80GHd/ozhioMac5uQEKMPUqSU72kesrvdTO/W9Z8keplw00z/JvVVOLW6eWBBk5KiR
 WYcQ==
X-Gm-Message-State: ACgBeo1dPOX9TiBszA0GHCJfpfXP6C7sNHULn775/KXMkTt4m6nCLwnQ
 6RrFnINba5Er8HGk1nhebn9ZyZ0/Sig=
X-Google-Smtp-Source: AA6agR5saa7xpkkFKA8AZqoA4+ERa7KfdP5bWhHVzlGmKhm2N2taPUVp/Y/+v8CyeObwLTCO2qqBHA==
X-Received: by 2002:a05:6402:4017:b0:448:2d1d:c805 with SMTP id
 d23-20020a056402401700b004482d1dc805mr21408000eda.269.1662049653248; 
 Thu, 01 Sep 2022 09:27:33 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 42/42] hw/i386/acpi-build: Resolve PIIX ISA bridge rather than
 ACPI controller
Date: Thu,  1 Sep 2022 18:26:13 +0200
Message-Id: <20220901162613.6939-43-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirrors
the ICH9 code one line below.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8af75b1e22..d7bb1ccb26 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -288,7 +288,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX_PCI_DEVICE);
     Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     assert(!!piix != !!lpc);
 
-- 
2.37.3


