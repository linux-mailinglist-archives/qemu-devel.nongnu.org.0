Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BD43C138
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:17:23 +0200 (CEST)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaNO-00075G-7j
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKl-0004lk-9i
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKj-0003hv-NI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id e4so1763901wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/w1O1YeRN4vaUepm+++obgRWPelblVDOLOkffgI6+U=;
 b=D5j9EFd79x2BmVOOQI007cwRgZImUxPxweJAFtLTCJOIsiT3tDoWcp2+VXYcx2STFx
 Qa9SiFWEKSPl/BbhCH/PjIFfuNmbKc1MNH5nVMHCTDqFsDUNlXZ7PvuJ8ZDlNSABXStV
 2/axyHvrW2lXG0cODXfAkrAQr68QqaDESwyxmMrOEyhh6hydFeqE1pvEPM1VvsF2qjWk
 uOcM8xylhuos5dMU57sjq7YBF35QMtlguxzV8IsrZYVMFi1zRIulTuBDI0MzG6VNBe57
 jc6IbEim9sRURKNvdC6BcoV9ObQWcSBnnN0vPdYuhZU6YB8eiFgaSt0ngxy0Kco3Cgyo
 fSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7/w1O1YeRN4vaUepm+++obgRWPelblVDOLOkffgI6+U=;
 b=mOOSAM+tYytvxyarQnNhtB5i/mZNpbaWc7/WxmQMuRtrQFAp0Dnq4V1ZVcAKFB0vUe
 zRmYIQl5owFMLQO4ZZZvmp8E1WNuEd3MyOM/t4XPPCHhfk5dGkrpQmKC1thQn1Ys/tsv
 AO8aoQ6YE+ClBotFIESP/YgmxsiNUgt3zBoRS4ZdbeRpXufGAMmZqFq91eOX4P31aod5
 0skGUAHyJkdwrjmyBYS7UshXbyRgim+iTDgYS3RCGLs0Z33FcIfTu8jdhlJfDOaefsNG
 iUHBlCu6Ly8eA97VlGCOqgOGwW4SNUM8GnkKARXU/jgb4ynmtdaCcv7TmVKBM7QcGfOa
 AaIA==
X-Gm-Message-State: AOAM5302VWyLzdvqXMl2sgGlyRSB0HcmYZlKGfdYeHiZxZxekBaUPvij
 vj5j3dZrGjkng7Ojgo/Xu8Fp/aBEqaM=
X-Google-Smtp-Source: ABdhPJyZevL+fCz+NTslBfY+oVXzFDLpEJtLsdGlpZczk+nK07vPXpJeK0haM7HvI5VklhXsikDGSw==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr37196181wri.337.1635308073636; 
 Tue, 26 Oct 2021 21:14:33 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm2175343wmc.21.2021.10.26.21.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:14:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] MAINTAINERS: Split MIPS TCG frontend vs MIPS
 machines/hardware
Date: Wed, 27 Oct 2021 06:14:15 +0200
Message-Id: <20211027041416.1237433-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027041416.1237433-1-f4bug@amsat.org>
References: <20211027041416.1237433-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to a new 'Overall MIPS Machines' section
in the 'MIPS Machines' group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211004092515.3819836-4-f4bug@amsat.org>
---
 MAINTAINERS | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62a37aa94b5..efcfa57cd6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -236,11 +236,8 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/mips/
-F: include/hw/mips/
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -1169,6 +1166,13 @@ F: hw/microblaze/petalogix_ml605_mmu.c
 
 MIPS Machines
 -------------
+Overall MIPS Machines
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: configs/devices/mips*/*
+F: hw/mips/
+F: include/hw/mips/
+
 Jazz
 M: Hervé Poussineau <hpoussin@reactos.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
-- 
2.31.1


