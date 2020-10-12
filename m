Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CC28AEFC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 09:24:05 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRsBg-0000BX-VR
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRs7H-0004a9-GY; Mon, 12 Oct 2020 03:19:33 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRs7F-0007lb-Mx; Mon, 12 Oct 2020 03:19:31 -0400
Received: by mail-wm1-x343.google.com with SMTP id 13so16257606wmf.0;
 Mon, 12 Oct 2020 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYzLZREDW3URWnaaoeiBhAsMJbb0gBuvk98LmQJHEME=;
 b=g44jfOtbICWhW1cQLpon96c5oRq//ayVBkUGbrdQv7Xd8M2pGx/81inIxbtDgslH4k
 K4ll3BnIHR8yKR8urqr+c7gxi3d02cZSsZ+ZWCt/al1bYCSqeI/+LyFIFlDiu8D34NGB
 EnOuBx8dMlOuQ+cPYVq877lGpoCd0rKY3IpjdwUs+514RnjCN8MxAZGMNEPy8Lva12iT
 piznBd2SogTagK8G+E2LH6Yu5RM4jTpokKF7ZCSWt57md/iVNTLNcrPXDLBuRgft6UXD
 FwEiVgWEPUmRKNTh7cLOrSa17ePnzbS5FGsSXZ8rL56lJ6M1cSTvJftgYtfHS57aL0fe
 l1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tYzLZREDW3URWnaaoeiBhAsMJbb0gBuvk98LmQJHEME=;
 b=oxcLgNO7GqeaWch+D0i6gMNQ/1oNnPg4FGhZ5gSYtkmH5Uzn24Qi8VccsYlLyYkny4
 g6rDO7VwrCist1Xp4WynRLh/aRTdhN61jhtjzAVfjEm/jt2lpzG099JnlYRypC/VqX/P
 dGauEvu8LUAyvawQ5LFOdNdsH5WgExFqNj4IeLSiKw3Uxpa57mo1T49QLcUAIpeCIBgD
 9F74ythKb4ftXz4THMB1ztiWcrFsVDGqTAoCTcgBwXpPPEg7mlu15g9fwKV/wr7Olt74
 VyFAZ3EZxDW6exJVj/q4JtYUSeLh0ctDGgCtq8DxoDxgHjXSisJVMPZbYPW10rp5TwYM
 yeKQ==
X-Gm-Message-State: AOAM5325ltPEW0ZIcG98fkvZWRDFBW0y4IxnvBoLHS0myPZSaw2M6c40
 Q0KkYypRBOzndzM0OidqsmsfUMfd9TQ=
X-Google-Smtp-Source: ABdhPJz7QzODVMJn47gP9WoE8gqwMTzg967ajncO3RgmPm8Z10lIZcbvOIbUYRDsqV2LT7ctKjWyxQ==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr9475886wmd.111.1602487167478; 
 Mon, 12 Oct 2020 00:19:27 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id q4sm23298709wru.65.2020.10.12.00.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:19:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] docs/system/target-ppc.rst: Update PReP historical
 information
Date: Mon, 12 Oct 2020 09:19:06 +0200
Message-Id: <20201012071906.3301481-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012071906.3301481-1-f4bug@amsat.org>
References: <20201012071906.3301481-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Jocelyn Mayer <l_indien@magic.fr>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Link Jocelyn Mayer's web page from the Wayback Machine,
and correct the PReP acronym.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Jocelyn Mayer <l_indien@magic.fr>
---
 docs/system/target-ppc.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/target-ppc.rst b/docs/system/target-ppc.rst
index a2f04c533c2..1f57966771d 100644
--- a/docs/system/target-ppc.rst
+++ b/docs/system/target-ppc.rst
@@ -3,7 +3,7 @@
 PowerPC System emulator
 -----------------------
 
-Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
+Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PReP)
 or PowerMac PowerPC system.
 
 QEMU emulates the following PowerMac peripherals:
@@ -20,7 +20,7 @@ QEMU emulates the following PowerMac peripherals:
 
 -  VIA-CUDA with ADB keyboard and mouse.
 
-QEMU emulates the following 40P (PREP) peripherals:
+QEMU emulates the following 40P (PReP) peripherals:
 
 -  PCI Bridge
 
@@ -43,5 +43,5 @@ the g3beige and mac99 PowerMac and the 40p machines. OpenBIOS is a free
 (GPL v2) portable firmware implementation. The goal is to implement a
 100% IEEE 1275-1994 (referred to as Open Firmware) compliant firmware.
 
-More information is available at
-http://perso.magic.fr/l_indien/qemu-ppc/.
+Archived historical information is available at
+https://web.archive.org/web/20051212135300/http://perso.magic.fr/l_indien/qemu-ppc/.
-- 
2.26.2


