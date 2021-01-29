Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C5308DA9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:47:19 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zji-0007gk-VU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zgx-0005oF-Mw; Fri, 29 Jan 2021 14:44:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zgw-0005Td-AR; Fri, 29 Jan 2021 14:44:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so10022420wrz.0;
 Fri, 29 Jan 2021 11:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zREcxldEQ3Ph/m5rzcohbyVMIeRxlTSwY0fOJ5s3us0=;
 b=TOD6Ywo6T+dwpYememmsc4876Ocyt6gThm6xCwSlUSVE9ZwF3u/WmRNhxNz5bcHnKs
 6U4lePdnT5RkpmQgZ+Ld3WNRPp0CiSnkdiGI3PKkotlzOQYnveZ7JdBfJWdCoJjfRwFT
 /9orrTzJkEROHdH/nNSfAYN2lDB+ToE5Ki80qlsv4xf8x54R4mOkHwQGihcRSYUGnZit
 DYGs9+Jsf9tfY915q0ufly4cKy9taSeT7GSu4Lz59VvMdteRbLuBXpB2sBrHE3H8y8Y7
 yHwxUi+APXqArjTFxH1EEiC66J0/wXYlihtIwjcREZup4PFmyv9VdFua7bDV3m+TkxsH
 O4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zREcxldEQ3Ph/m5rzcohbyVMIeRxlTSwY0fOJ5s3us0=;
 b=WG2f5blzIYs72TXeila3q5RIdWFa0+3Gcpy07MU+rx1x6X8So2oy+i+VHfD29/xfzv
 LztlTJHyS1jcfuX6UNiNplzRhJKzzc1zWsEvPa8fM9yAIHcRRaoFEpVf1X2vLdXus8bM
 JQ8x90rjMoN1EouhkxNT8vBs1fS/1TrTxKyXxn2wHYqtTQf/7MAFTKCLyFuo6eFiN47z
 Vy5+czvdQHne7ocXLYqUiRhFs1YPBaDRaUdzHQQ097Z+mocuTDbQZQ9Wk9pX7WT5yrPB
 vcUJlerBwjIN1c+YXh61NDatQPj1GWMZniPKme96LNmr+Q0gu2c1BoltLwYSvkN/c4rj
 HIEQ==
X-Gm-Message-State: AOAM531MdQ8BT2scW3Rb2FnYLuGjIHB5bzcB62chF+rt+rXxHPa6QHrc
 Fk+pzAMKH0eKhyVA1wxTXvrlUMvBo8U=
X-Google-Smtp-Source: ABdhPJzzWrVRb4PvHycWxblwxvk89ccDw3wg8OewbiSCEpCD0Kcckfa8LG5m053N/UuuQPzkjV2n0w==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr6316969wrm.143.1611949464459; 
 Fri, 29 Jan 2021 11:44:24 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r13sm11988526wmh.9.2021.01.29.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
Date: Fri, 29 Jan 2021 20:44:12 +0100
Message-Id: <20210129194415.3925153-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:

  /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function `ide_init_ioport':
  /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to `isa_register_portio_list'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2..41cdd9cbe03 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -12,7 +12,7 @@ config IDE_PCI
 
 config IDE_ISA
     bool
-    depends on ISA_BUS
+    select ISA_BUS
     select IDE_QDEV
 
 config IDE_PIIX
-- 
2.26.2


