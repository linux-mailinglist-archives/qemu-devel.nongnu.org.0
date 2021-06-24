Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04033B2B59
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:26:54 +0200 (CEST)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLdN-0006pS-KQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaL-000156-Mb
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaK-0001tZ-Bu
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l21-20020a05600c1d15b02901e7513b02dbso379975wms.2
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLb4r3Agp2xdR71abYvEL23ogxRsb2YvWszHjzXa0mY=;
 b=YdNFGkVwJHy03urcFsqWLXlA/KaaTfFrWSAwazkuAz7t9+Dce+Ahe1tMD57kjucrgO
 XHpy25uI2RQcAv3yvPMhLC4vg/3zrLplmQt81kws82r4tSwczg59W0X+m7mxf8WbQ4Tf
 hu/qmecMuT+rCuHxOp41SG3ThowS8+YPcDj9T78Z7Omn6Ls0FnqAXDjZG6wPhMqYKe/i
 NU43K2v9hTRabkNY9FR9PUgeapIL+txf175TC+FKLf3J3fvIRqsxUF4CKM0TkNX1lYsH
 83SrjjeM22VMQfLzHjnHJ9UoqDZg1Jf4e8gAYPiNA/mevoCfVXHE5GXGsnx2O5ri7n8K
 Nn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TLb4r3Agp2xdR71abYvEL23ogxRsb2YvWszHjzXa0mY=;
 b=r28Ygp3+jT8BEORxDJARH59JjXLcISjW9za6RFlS0ViYWYmu5PAF+ns8AWUGkKx+bP
 toqRkQAvzw9uju8CIjg6OsgP9GHuZrEQI9fDj9Z/u8XIO+vE0MOYPQ6nPkf2EXD4OhnW
 khRXRcFw4d2vj5LpDkMvXhD/KKTHlciPTV0GH62t2YbIUmgp5vdvxZvf0dT1+TLKYJLJ
 PZGbo7tuEboCFfyhvSo5WqFsUe0WVDMedXmYMpZKMSSBcLDaTPAxi43gsJ5v+4alQ2YO
 dL3x1DmM/b+58Sron/4gijeAR873uqX0l3+nxu4IXJ4gmjXou0JuAvTWc35xbRibXcYE
 nMKg==
X-Gm-Message-State: AOAM532m3nXNiT9HAXEG09XYoJKtJzbWsPLIEasDakHsoLLZE8d50Cp5
 LglcUI01cYSbLyqhSs7HXVZk6pS6JCJrmw==
X-Google-Smtp-Source: ABdhPJypo21H1PdUeuOvvpRF/nFjL2o5lagZdMpgvKsHoDOUFQBOS1kik6jQKNP1VL0gunRr6slCFA==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr3109718wmj.78.1624526622830; 
 Thu, 24 Jun 2021 02:23:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e17sm3039301wre.79.2021.06.24.02.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:23:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] !fixup hw/timer: Add renesas_timer.
Date: Thu, 24 Jun 2021 11:23:33 +0200
Message-Id: <20210624092336.1078504-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624092336.1078504-1-f4bug@amsat.org>
References: <20210624092336.1078504-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixup while reviewing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/renesas_timer.h | 1 +
 hw/timer/Kconfig                 | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/timer/renesas_timer.h b/include/hw/timer/renesas_timer.h
index dc0711ba832..ccf2e64b702 100644
--- a/include/hw/timer/renesas_timer.h
+++ b/include/hw/timer/renesas_timer.h
@@ -30,6 +30,7 @@ enum {
 
 enum {
     CMT_NR_IRQ = 1 * TIMER_CH_CMT,
+    TMU_NR_IRQ = 1 * TIMER_CH_TMU,
 };
 
 enum {
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 9324ca7c6fa..3f049512641 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -43,6 +43,9 @@ config SH_TIMER
 config RENESAS_TMR
     bool
 
+config RENESAS_CMT
+    bool
+
 config RENESAS_TIMER
     bool
     select PTIMER
-- 
2.31.1


