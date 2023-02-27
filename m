Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043106A4454
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeG0-0004kK-GB; Mon, 27 Feb 2023 09:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeFG-0001Hk-In
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:52 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeFE-0001JX-Qf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bv17so6381247wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ky6Vfjb7nqfdzoG0sGMRpKArH4PwqBfUvvv4AQpaXAo=;
 b=up0NhAZUHLAcaAocudB2yV6otzA4+WPraXMi9nAr72tD1Mp2HXmLsSCch6AY3mR6uD
 Ut27ne1sZ/y7cDCseMbMlpfq44ELBxcbzCqRbr2WyFwS6OffxUAXCIPL+tTv/bYM6dZf
 LdwhJ6tOvoUgIifaGF0UXVeEtXlpmLSBiaQ1Cubz8GhSJ1hNPibhshMKXzlf+spmWsLD
 KHp8JX4Eydhuz16OwhrcblP5GzS3CwWkBLCt7zT0e0fmu6zdGK+echpHNOeQMKZ0Tjuo
 WiZHVkocufn4ulv5g4qT5XbM1EZHo60XAFqi/xhEM3GGvtDTrMX+M3LIN+kRy1o5nj7o
 uWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ky6Vfjb7nqfdzoG0sGMRpKArH4PwqBfUvvv4AQpaXAo=;
 b=6cuVWA+SxJvf8/nVOuh1E5yjmnYGZ13KKopXQKE+M9BpzqC/DaQZsUGWBRxvTjEXRW
 H6tdnBNDlprm9l+U2llY5JWdtbgjT6NKS0rg0chv3lXMdpCHMqhJ8jhpxx6FcCWCEy2r
 JSB1kcwmSW7YspZ27cVks/1HXCPjaw5m9ldQXL1BYApQzAmj+OwQuQRA/5mGYyKVms73
 F+AIDuLC9Gsi4N3t8qnbZz1ziEWXLobosg8L2j3PR3bAwivxL5na6IBWYHgOSdz72dxY
 HFsU114RCwYQJDgWjp+LV3xmFnDTPjHJlOjRilowZun8G7JnaR2G2o8+HbpkwngKIK/O
 CcdQ==
X-Gm-Message-State: AO0yUKUBWpmSlIP8BeCmKPikZ5l7hC0C7ROQjnKufOY579+52q5mqk9D
 92xQCeKAgUaYHQDUJiplXGapnwNwdWlFoN6+
X-Google-Smtp-Source: AK7set/6zYQ6mx7TWIf7Y+uhlelSx8uWlZjUD0acVgXzNiJZQnvc0GlK086vm4gTKiOVU3N/NSf+8g==
X-Received: by 2002:a5d:58cd:0:b0:2c7:5247:e496 with SMTP id
 o13-20020a5d58cd000000b002c75247e496mr9756639wrf.60.1677507167930; 
 Mon, 27 Feb 2023 06:12:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a5d5234000000b002c5493a17efsm7331677wra.25.2023.02.27.06.12.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 126/126] ui/cocoa: user friendly characters for release mouse
Date: Mon, 27 Feb 2023 15:02:13 +0100
Message-Id: <20230227140213.35084-117-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christian Schoenebeck <qemu_oss@crudebyte.com>

While mouse is grabbed, window title contains a hint for the user what
keyboard keys to press to release the mouse. Make that hint text a bit
more user friendly for a Mac user:

 - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
   keys typically displayed for them on a Mac (encode those symbols by
   using UTF-8 characters).

 - Drop " + " in between the keys, as that's not common on macOS for
   documenting keyboard shortcuts.

 - Convert lower case "g" to upper case "G", as that's common on macOS.

 - Add one additional space at start and end of key stroke set, to
   visually separate the key strokes from the rest of the text.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/cocoa.m | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index e915c344a8..289a2b193e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -72,6 +72,9 @@
 
 #define cgrect(nsrect) (*(CGRect *)&(nsrect))
 
+#define UC_CTRL_KEY "\xe2\x8c\x83"
+#define UC_ALT_KEY "\xe2\x8c\xa5"
+
 typedef struct {
     int width;
     int height;
@@ -1135,9 +1138,9 @@ - (void) grabMouse
 
     if (!isFullscreen) {
         if (qemu_name)
-            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
+            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name]];
         else
-            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
+            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)"];
     }
     [self hideCursor];
     CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
-- 
2.38.1


