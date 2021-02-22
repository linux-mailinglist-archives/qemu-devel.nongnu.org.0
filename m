Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C0321A08
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:18:58 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC37-0005S6-Qq
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC0J-0003us-Vq; Mon, 22 Feb 2021 09:16:04 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC0H-0001T0-VA; Mon, 22 Feb 2021 09:16:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id u20so28917452ejb.7;
 Mon, 22 Feb 2021 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZV5S5F2neJfYXLNqhFnjIwvv5gWALmpaBVemsuVGEY=;
 b=p05z84/XCFPedgoAmovaYnxRcffLHPdfQxgARVlQD6r6H1kKbz4EO/IMQ1gh7PAoc6
 1tDl+iGbJqKj4gj5cqbiw0ZvvtZrF0hGJXKUEL1Pkkja63TbZ09pu1MMfk8OMwG66mVf
 z2Q4ILN3QAVVAxvq9hpIzi291Ko+9JAtMjex37ZISmO+CEsJ/BY1qyyxs2hLQbfBORhp
 Vd8oSW6IxaE5lwshcqhfNIFgcFrIQSYsE5VX4rzqRPQcj6whRB/Xj0FV9yAvd9Cqqc12
 sisHL8letXrvaEfY2IujwsBDdDXpMgOcGLtPjiUndSFVCRrhcnKDeACk6gvs1hsBlc4c
 0pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9ZV5S5F2neJfYXLNqhFnjIwvv5gWALmpaBVemsuVGEY=;
 b=OrxtSFjCMn+NQvnBz9fL8IS/r1+oQOll6ab3Df6uy+ueHOS8SnoMvVM46muQzpQ7t1
 lq79+wuYN2dATkis/cKDN+gt/m7Eco75gx/KwfTIYJ01tkmwn43up/lHFX09UjoU39YS
 1f6s5yXOt3UA0DYuFJ7I5c2g4jJXHJmP86iuKmMYcmNg/yP6CNbeFI0B1yDIlqxjNsqC
 7jRrWWzoMJZh7azvc/wSKm3t9vVqH8lKdtHRt64vkgU8CXyAtixQwZqpm3RDdQ/NEwLV
 yRMl1S8PAxyEOzVu40A1Cb5SJN8a45h7RN9piFXORdkDv9UL1AkdmhwMhNHmvUvAeRKB
 6UJg==
X-Gm-Message-State: AOAM531YM2bOUxAUeZHq8ZzEN+8p8UcDUTgUbWJoocgFaOEAj9xi7Ekm
 w3qsm999FWyeS525LSk2SrUvXdNd2rE=
X-Google-Smtp-Source: ABdhPJx+lg05Qtr1q7+YLDtAEmR86erFNuwrPEHCrymDhXYytqUK3SLIf0fnuHgv79rykpXDUft1vA==
X-Received: by 2002:a17:906:c049:: with SMTP id
 bm9mr20485159ejb.535.1614003359935; 
 Mon, 22 Feb 2021 06:15:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm8290385edt.6.2021.02.22.06.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 8/8] hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
Date: Mon, 22 Feb 2021 15:15:14 +0100
Message-Id: <20210222141514.2646278-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As replaced the generic CONFIG_SH4 by more fine-grained
selectors, we can remove this now unused config variable.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index b9f0538d57f..ab733a3f760 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -9,14 +9,12 @@ config R2D
     select USB_OHCI_PCI
     select PCI
     select SM501
-    select SH4
     select SH7750
     select SH_PCI
 
 config SHIX
     bool
     select SH7750
-    select SH4
     select TC58128
 
 config SH7750
@@ -24,6 +22,3 @@ config SH7750
     select SH_INTC
     select SH_SCI
     select SH_TIMER
-
-config SH4
-    bool
-- 
2.26.2


