Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2C1E0535
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 05:40:07 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jd3yA-0006py-UE
	for lists+qemu-devel@lfdr.de; Sun, 24 May 2020 23:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd3xL-0006Cf-OI; Sun, 24 May 2020 23:39:15 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd3xL-0005mt-1b; Sun, 24 May 2020 23:39:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id c3so11532779wru.12;
 Sun, 24 May 2020 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sq1aSztEgRKZjqwY5A9ArV/YRZucwBcuoboNL0Rmw54=;
 b=DG/TLFp5LtiGTynL8t5bLD74hzmpH/PMdeIOaGvdeFw2sly77c+Zm0gZgOw2MYzYX2
 OMJ5Gf8xl6Fa5ZQHASz7BgHEtiP4LXAGv3CfsSnZ0mST9vPPqpXn+fjS7EKyPvVb/g6z
 ftdsUWFPFt5E969y2RFWKyAf34b8bMxnSZCiv7Pl9IkLGgfMdOXxfgTQWm+ElM9/xoOq
 1Jh7Dfsi6qAp6m+PiCMFj/8jEKJNBjWaG9iL7o/OipnpliKTm/njfXaL2uQTAax4sdA0
 P8fGQDVq9jjC6U99j57zbspzV/e4HnPt8epWGeBoiBwOxqmemn/EuIkIJMnmV4hpWlCp
 0rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sq1aSztEgRKZjqwY5A9ArV/YRZucwBcuoboNL0Rmw54=;
 b=Tah9HugatEIUzg+zMm+XLlkuahRPf2oVvohMITQ+w4CvCnqbtphcDC/3+MEXLM8+JC
 9xzMqrTEgILU2sh2H2DfFN5XRShqs0yTmDn8UN9F1nSKrSriTzLJ94bOumhou+vUh93E
 lRxfynmj7kjjU0WLPkpyLE2nBA1Fx681N+rkZ2UNAK156Ir7VHG+tDf49KkH5c0Fz5Qg
 Hu98GjWzjxvhO6L7MXspyuSR6Xz/QolXivXE8+2BR5wXU+K0x4jpWzb/FwLjLagDSFng
 E9ZbWDIAC5AgplKEWGO96coz71xN9GoNgMaDYLESm5n5ZrSG6lxS+xr252FZpD3jDxMs
 hnAg==
X-Gm-Message-State: AOAM530H0mEbFCaRrKq2KvupvWTAkIe4yVYEgAVMnvCFdLyBRcd7AlZ6
 DHvrcHxBTsIrENWfEQ09n2CrdiFy3TA=
X-Google-Smtp-Source: ABdhPJzesD/+02BoyafaUDwnVpfoPfUr2dAmUr57sKRqm8aEAB+YwAcfc9dMcYrO7lrM0qN/CuIqhQ==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr13204619wru.100.1590377952333; 
 Sun, 24 May 2020 20:39:12 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id c16sm16669427wrv.62.2020.05.24.20.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:39:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pci-bridge/dec: Remove dead debug code
Date: Mon, 25 May 2020 05:39:10 +0200
Message-Id: <20200525033910.26166-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove debug code never used since added in commit e1c6bbabee30.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-bridge/dec.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index 3ae2f788a4..952bc71122 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -32,16 +32,6 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
 
-/* debug DEC */
-//#define DEBUG_DEC
-
-#ifdef DEBUG_DEC
-#define DEC_DPRINTF(fmt, ...)                               \
-    do { printf("DEC: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DEC_DPRINTF(fmt, ...)
-#endif
-
 #define DEC_21154(obj) OBJECT_CHECK(DECState, (obj), TYPE_DEC_21154)
 
 typedef struct DECState {
-- 
2.21.3


