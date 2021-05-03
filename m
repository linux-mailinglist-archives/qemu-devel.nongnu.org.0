Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1363713EB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:59:29 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWIS-0000nq-3g
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldWGw-0008Sg-NA; Mon, 03 May 2021 06:57:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldWGt-0002lJ-UO; Mon, 03 May 2021 06:57:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n205so2181839wmf.1;
 Mon, 03 May 2021 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OCTLX3eF033BPqeFFzMGdbkKu+ZUIhKDq+RmE3hqCtA=;
 b=jyk39Jp5pJ+EG+JG5U0bT+P2lDvseVKi08b97dtGgVuyGUr64yNPx5JvTxfuykv4em
 /H/VxhFqDaSt11gfHYtDQOnA6ePw6SYwbtqeoFM0mdjLI7KaqXUujPrn12T0x4/bmDeV
 V8V2n3vc17IhglNuwJqimeRWO6BpEbbeowA5uVQNtA3wRWMQajVE+qkH3RUd6l2U8c+v
 REDZeCcAEoItyNmaGLnCK5JJM9m7JUtxwlZXFH0em2qSJHmcE//YPfMx2NkK0lb9N0J+
 hVsK48ps2BLoxT/QZgmkZuh2bvnxOFJCif9q8n172O1knt5pu+58dgwInzEfHsh+TAVM
 nxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OCTLX3eF033BPqeFFzMGdbkKu+ZUIhKDq+RmE3hqCtA=;
 b=DZAofrY6/qoLWCD5lJuGrcB5IYqG/oSswPm1cqdr0auah2LLr7kpVETgwetGPMORq6
 zfcKQ00IgSdz4b8O8iB2kRB6F2nf9QQ6TuPxGnU2+5YyUOwGCIMeb8eDbBmxv7rjIMAs
 QDui1xPweequJONphoFhTr+DVVspHgPnYdL/gADLigO98l6DwrH0KqdzuSmnRAeqx/RR
 GIS60OMgnUHhHQeTyslBqq7JahpW7C2d49WylXkChG/Tnf7iytl3KDAPFZy29eNDbWhL
 SYAgDsfUGjYRnZRzH/RKBQ7Hzbce9LdtyzGO2kC9+CP4VFZ+YsHffHEo9sO4fpobZkUw
 VGGg==
X-Gm-Message-State: AOAM5304i0p+Mz4GhHeUmFtj4/f80zJ2e/QbJUqRzPIHL+3n3rbZxB1H
 yJnYn/UBp4PPX2JrKL9uR1Vs5qA9+mcVuwrm
X-Google-Smtp-Source: ABdhPJwqXAX/GKKF8RdfLo38qHC4qanqMleaKagu1Jf0tys0g7gbn0sqCnC/KUQ3a46rp9BTX/zQ1g==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr32294725wma.31.1620039469514; 
 Mon, 03 May 2021 03:57:49 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id r13sm13053302wrn.2.2021.05.03.03.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 03:57:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Mon,  3 May 2021 12:57:47 +0200
Message-Id: <20210503105747.703149-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the raspi2/raspi3 machine aliases,
deprecated since commit 155e1c82ed0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst       | 7 -------
 docs/system/removed-features.rst | 7 +++++++
 hw/arm/raspi.c                   | 2 --
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae862528..7895bd4d849 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -238,13 +238,6 @@ this CPU is also deprecated.
 System emulator machines
 ------------------------
 
-Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
-to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
-machines have been renamed ``raspi2b`` and ``raspi3b``.
-
 Device options
 --------------
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 29e90601a51..8a8b8ca627b 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -312,6 +312,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (removed in 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines have been renamed ``raspi2b`` and ``raspi3b``.
+
 
 linux-user mode CPUs
 --------------------
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 990509d3852..20bba0316f1 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -342,7 +342,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi2";
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -362,7 +361,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi3";
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
-- 
2.26.3


