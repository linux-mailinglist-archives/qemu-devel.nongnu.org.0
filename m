Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4345473F5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:49:50 +0200 (CEST)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzygf-0006Fa-Nr
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRp-0003YG-V5
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRo-0006GG-C0
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id a10so620597wmj.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Is3ANV7KetILpxXaoCA2qsawFyqZ3ykoejNME1BEWxg=;
 b=pXVtKrWUpLWK6Cj81lY9P5VP1dOZIjrxvFEi4t369NL1J1wmc1MO49wO0aXkgLiB5S
 PKdS/kq257xCeSeWfVp6LAGaO6SQaTh3r3XlLWDW1b3LDBRiV3GNAznlINnBERL7nU1A
 DihEnt9tP6EGaZWxD7v9u2hh329N0jWAuRnbcWwgyer1fyz9dVqpeESP7q5UzkboVn8/
 v0Qf5vJdc9gxpcieS78Tg0x6mUMRptbV4826DKlgOGEi2i7AcSZFu0GbYARhkZjYxQNU
 RIYBliGmGiSDFIWu7WvRtJdcX/48xGx8Q89tuWLbRuEtYmui5UnD0gCuUMbPIKPfko+d
 x7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Is3ANV7KetILpxXaoCA2qsawFyqZ3ykoejNME1BEWxg=;
 b=d7PwwHUMZ5acZMQM6bgPL9vEiYoAl/XinDsebs4ivNy/0ZSAp3N9/2ccChjgMuZZw8
 YjfaMG6JKH58r+vSvEue4owi52S7JZo53c3rFGJBmJZnm+e8fnnHnIIvZBh3m6TgLjSi
 K8i/5wqZF1pwpCb7ce2yKfEzXYOUnrCwMzJwQK8dL/BvIRqTxkSvAnXntXSie4ZYDcM4
 FMc0cNZxojIVg90yqMZtc+tQeFnwOpg6WhbPktQfEKnVzXjvZI8E1hjyrr4LL2M8h8jf
 RU0lRBL/eKjuYagq/Yh1Ke2q+DbwAtQTGDoDlulEgn2dTvBeY6htPG3fLFVa/b0LaUnJ
 WQIA==
X-Gm-Message-State: AOAM530sQTgRjOC+SyaC94MXBGheRxdpP1l3KDlTU0Jd1dXzFC0NmxdY
 irKG3SpbXIFR1SENr/HGd57ihTKmNVI=
X-Google-Smtp-Source: ABdhPJz5E4hKZGWOKMQ3dQSl2i9Brg6CBGaF+pjd6ZXRBKLa5fTShBI++pigm1NTX4eenzMHd4fwwQ==
X-Received: by 2002:a7b:c154:0:b0:39c:4f4a:79c0 with SMTP id
 z20-20020a7bc154000000b0039c4f4a79c0mr4201871wmi.152.1654943666727; 
 Sat, 11 Jun 2022 03:34:26 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m127-20020a1ca385000000b0039c4f0c827fsm5869027wme.26.2022.06.11.03.34.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 14/49] target/mips: Undeprecate nanoMIPS ISA support in QEMU
Date: Sat, 11 Jun 2022 12:32:37 +0200
Message-Id: <20220611103312.67773-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

From: Stefan Pejic <stefan.pejic@syrmia.com>

nanoMIPS ISA support in QEMU is actively used by MediaTek and is
planned to be maintained and potentially extended by MediaTek in
future.

Un-orphan nanoMIPS ISA support in QEMU by setting a maintainer from
MediaTek and remove deprecation notes from documentation as well.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Message-Id: <20220504110403.613168-8-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS               |  3 ++-
 docs/about/deprecated.rst | 30 ------------------------------
 2 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b3af081c51..0df25ed4b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -246,7 +246,8 @@ F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
+M: Stefan Pejic <stefan.pejic@syrmia.com>
+S: Maintained
 F: disas/nanomips.*
 F: target/mips/tcg/*nanomips*
 
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index aa2e320207..19a91b575f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -213,17 +213,6 @@ MIPS ``Trap-and-Emul`` KVM support (since 6.0)
 The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
 from Linux upstream kernel, declare it deprecated.
 
-System emulator CPUS
---------------------
-
-MIPS ``I7200`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
-
 QEMU API (QAPI) events
 ----------------------
 
@@ -337,16 +326,6 @@ The above, converted to the current supported format::
 
   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
 
-linux-user mode CPUs
---------------------
-
-MIPS ``I7200`` CPU (since 5.2)
-''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 Backwards compatibility
 -----------------------
 
@@ -376,15 +355,6 @@ versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
 
-Guest Emulator ISAs
--------------------
-
-nanoMIPS ISA
-''''''''''''
-
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
-As it is hard to generate binaries for it, declare it deprecated.
-
 Tools
 -----
 
-- 
2.36.1


