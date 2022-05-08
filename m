Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3751ECF0
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 12:45:33 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnePr-0007MQ-KX
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 06:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFr-0007DV-W9; Sun, 08 May 2022 06:35:12 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFp-0000HM-RF; Sun, 08 May 2022 06:35:11 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i19so21826795eja.11;
 Sun, 08 May 2022 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
 b=YiwVSoCOQ6oEgvl1Yg+Ntj8QFTrWKGSY7FVACIswIb0AZM9Hwa0KXpn+LHga+sgHmk
 E2FWbKBau+ACjD4BP1cK5SpwJAzyocn0xnVzmGoy2OBvkGAQ+e1ZVmBApBMK4KyKxa7I
 gv59ow4WVTv6cpyxwy94qfuxqN+1X8ddNmNJPcR225UcN0g7JBO4hd1WEAriXcBAaihf
 EbTqA+bKF8vsOgUqbzO4YcIkriKvDOluwid+hN8F8UC2nIatT6LDQibHNonBDhp+XPNU
 zuIFWFgO8njP+lRoUomtw8SmC8np5E9NHsFv1VM1/eBwNpR9vfNti9WRBk31jXjfIg/w
 3qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
 b=SK6gvYFq3LnWSfr7O6Pu9ZXnSoR0NizOCvRdIYk2uu5hch5HZIiVKkXAEvDbFvRD5L
 ZjsyapBSZfdZBWw9ZUS9nFYP13EFBn5C5TZmYjJzhMfuiPAl6geaDuh+ayegTOM+BJ5T
 mjb0mnkzaz3wsDV+9ejVRpERDCg9iHvW/CnYz7PABLFWlH7N9ZQaZJiOaQUEfPHppALy
 4MP3GvdbQXl3iicLi4UJCIz2IOll4JT0M/ApDeIOjeHfDcpUB25TOpUersx+OPwidggD
 du+wcMY2Ha1WUW98t0Ws5LukSpM3rBQuc+8N4nVnJIx2SKx3pZRjI/WEKvVTXfBGY51n
 qp7A==
X-Gm-Message-State: AOAM533RqLB5BPchnMmWz7eSBGI2lP8Yhq/suzsJSHmA/8iZDaUZDtXU
 4EuWlbySOyOuHWwRAEb3POqjbvHbtyNnFw==
X-Google-Smtp-Source: ABdhPJys94+U3JPR6mQ+w/noafajrUFU8ZVBUI1BrO1Sg3ACmjAldGMYUy8xBZJxjI9UsxQdk/LgPw==
X-Received: by 2002:a17:907:3e0f:b0:6f4:5cfd:e6bb with SMTP id
 hp15-20020a1709073e0f00b006f45cfde6bbmr10330510ejc.38.1652006106150; 
 Sun, 08 May 2022 03:35:06 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-246-161.77.183.pool.telefonica.de. [77.183.246.161])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f388f6f927sm3901948ejc.1.2022.05.08.03.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:35:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 2/3] hw/ide/piix: Add some documentation to
 pci_piix3_xen_ide_unplug()
Date: Sun,  8 May 2022 12:34:31 +0200
Message-Id: <20220508103432.14874-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220508103432.14874-1-shentey@gmail.com>
References: <20220508103432.14874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

The comment is based on commit message
ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
unplug option'. Since it seems to describe design decisions and
limitations that still apply it seems worth having.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2345fe9e1d..bc1b37512a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
 {
     PCIIDEState *pci_ide;
-- 
2.36.1


