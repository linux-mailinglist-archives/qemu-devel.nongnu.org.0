Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CF458D13
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:11:43 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ec-0000If-SN
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6rX-00026Z-1l; Mon, 22 Nov 2021 05:47:51 -0500
Received: from [2a00:1450:4864:20::335] (port=54967
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6rU-0008Gp-TX; Mon, 22 Nov 2021 05:47:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so14851534wmq.4;
 Mon, 22 Nov 2021 02:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KOFXTkboKgDVhlbsHyVyoEN44CNe7vjQGHXt//EAdvY=;
 b=lZ9lTqHbWugEXoY1QTU4tUluEUjKWffj335dmu0tFyum/BRq2+D9oDmBQSd+e0A0Zu
 qfR7bzoshp7AA7fq+jZfvcZJkUm7Y+QNNE4kwLiyo40Rufarb+N17zcrlgzp4ofOzGoA
 BgnQJEaMge+FNRxME3WTTWT7EamC7uLF9xM2D/Or1Rd4a+lmVYJjeUl/wC7Dl7S3auHv
 lVjOBFsG0M/79rSR3hho33DBT2s1e9rYzTdzp13Ue2DrUCVbyzQ8EWrh501nSS2b8hrG
 he5nhjm9KA/HqMjhUBz3nXsD+pj2FqtuzCnm2e9epZKGScWHeIATLnmsImY/iQ/tinbJ
 pvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KOFXTkboKgDVhlbsHyVyoEN44CNe7vjQGHXt//EAdvY=;
 b=ZBgm4VCvSngooRfbWXEV7IFf1um+BrTUycqFoEtWlnfFczfE6UzQllvGBfa2u75LDC
 zpLoTZUmR3Il+yQqLfHR2ILdl4ZDdjwU/X9jrZdQQ21RIvU+17sAw6RLsyERoe21f3c8
 0RcjyB3OU+SD8pJIB9Yb6UkgBTxdYAe9hCrKjvkowYwVs44GQOO+4zm+PZ3w11nMkMFi
 J/uyb0JzquPkkQ/zKHn2QgHRi919GSyTxXG3X/uEO85vpp0jOIWSn5pCYwszyMfJ9Y//
 +K/1Z+WxBEl+GWpXNOUx//jMnQ1PC+WJxs3IG+hW0MZE0rG8m3sn0ya+wnZpJ5SPNsez
 Bpfg==
X-Gm-Message-State: AOAM530szwjPk9TXpw5/0RlFgvEANHKsXOXeyZLlSJOXv+0XL/bIX5Un
 yhFQqOl77A0gQQFNEYzF1vEOuKHT8Ks=
X-Google-Smtp-Source: ABdhPJxvC7oyIqSjGIxQUbSDD/kySPAXbfbnx0txwDozuWgav04joH1X/u7U61fdQd2kmkAI9rlQ+A==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr28568766wmf.177.1637578066420; 
 Mon, 22 Nov 2021 02:47:46 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u14sm8631250wrt.49.2021.11.22.02.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 02:47:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi: Fix scsi_bus_init_named() docstring
Date: Mon, 22 Nov 2021 11:47:44 +0100
Message-Id: <20211122104744.1051554-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
scsi_bus_init(), scsi_bus_init_named()") forgot to rename
scsi_bus_init() in the function documentation string.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/scsi/scsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index a567a5ed86b..2ef80af6dca 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -158,7 +158,7 @@ struct SCSIBus {
  * provided by the caller. It is the caller's responsibility to make
  * sure that name does not clash with the name of any other bus in the
  * system. Unless you need the new bus to have a specific name, you
- * should use scsi_bus_new() instead.
+ * should use scsi_bus_init() instead.
  */
 void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
                          const SCSIBusInfo *info, const char *bus_name);
-- 
2.31.1


