Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0133F9434
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:11:41 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV5Y-0007Se-8X
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2V-0002zN-G2; Fri, 27 Aug 2021 02:08:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJV2T-00053O-IR; Fri, 27 Aug 2021 02:08:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m2so3161398wmm.0;
 Thu, 26 Aug 2021 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSbYTFwwkvbP0T9ubAhocGN3uSanum6AaagZStt6WoY=;
 b=pWZOZsntMbYJshT56ITtIlsUfPvGanc/zYxVxSJtNXP+KLt1LXZuEW5DvKpM584G6L
 VoYAuknmLxcR+OF7uF+HX+PWCYMg1BnyykeUHk5jMNe2EDa/zQ7T01JU1qbSLYgDoMWg
 UL0geNh2izj4726vrZEkkTU8bTEp/nx3M0Sbhxswu5lIqVkbLXa87t8gZAOyn2QEkR4m
 kLlgjqHSJmsoKLdBsYIxy7cMONOE/UixI2ATCXKQAyAYh60MKNbkgbwrW/Bn3RQcCnib
 4rLYhzg70EC8BC7V5CnzZQZMjMMnul98WAvXGkquGHKCx8ozCNhzGcM/oxzVSLtZ9bqm
 eCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WSbYTFwwkvbP0T9ubAhocGN3uSanum6AaagZStt6WoY=;
 b=OA87uoUZe9zvhu4HyGFUOx4WFnPueKN5IqVfhukeb5XGa6EiXZJ48NE/X/iSp+bD+1
 VQzoCABgyjxkT6Rydmfipu3ooOeoOAtJddSn/tkef2QZKCw99mV76+8SoSGPel5ufosL
 Z73L6SKQcojFbYbe2SSSthdhxuXvuUs/XNCKnak/OkYUa2cMDHpGoVwkBtE8qaYgOUKD
 7EPoO+c3JMgwr2yeIva3kydzfqM2KnHfJv7ibByTPBLozQOKCU4NEfnulNM6SK2sLsLI
 BbdnBtIN4C/qEBZjR1jpVV4U6GDT1rn1j/WaASm0T1tq+mQt4y16cEOSxFCRKkiG3Z8O
 2aGA==
X-Gm-Message-State: AOAM5302AheqKRj1g3TtKE8He0YeAUpoLD9ItCrtLLFwUbrdX+XkUgwr
 xKjZY63jPHFqXhRwnmL6HmGHK4EwsQQ=
X-Google-Smtp-Source: ABdhPJxoe+BOsDm8LytXjGkRPCTdcKlvhE2/vJIdvZulRukiFTYx/Q+c/9jNJif9toUKhXz4xz3S4Q==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr7009875wmh.55.1630044507581; 
 Thu, 26 Aug 2021 23:08:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t7sm5749610wrq.90.2021.08.26.23.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 23:08:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Fri, 27 Aug 2021 08:08:15 +0200
Message-Id: <20210827060815.2384760-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827060815.2384760-1-f4bug@amsat.org>
References: <20210827060815.2384760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the raspi2/raspi3 machine aliases,
deprecated since commit 155e1c82ed0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/about/deprecated.rst       | 7 -------
 docs/about/removed-features.rst | 7 +++++++
 hw/arm/raspi.c                  | 2 --
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 8d4fd384a59..1e1a5e96ad4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -207,13 +207,6 @@ this CPU is also deprecated.
 System emulator machines
 ------------------------
 
-Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
-to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
-machines have been renamed ``raspi2b`` and ``raspi3b``.
-
 Aspeed ``swift-bmc`` machine (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 08f9e625ce6..9d0d90c90d9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -574,6 +574,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (removed in 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines have been renamed ``raspi2b`` and ``raspi3b``.
+
 
 linux-user mode CPUs
 --------------------
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0ada91c05e9..146d35382bf 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -340,7 +340,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi2";
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -360,7 +359,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi3";
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
-- 
2.31.1


