Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B29B363851
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:54:02 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGIg-0004yj-8U
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGG0-0002Lc-EH
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGFy-0000K3-S2
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso7145991wmq.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=s3oJf1vKnfi4dUxvvBvpxre7mRuvGFoFqaFwqySnq1W2YBHTM4nkYRX2BAHbUbDLmK
 ddgYa157N4N9Hmg+PaJeej7ikd+lH8GmWNF6ccUNR2jfdb2VJ1lE8N3TQEDRIs8WKQHj
 9liQ/fXfPfC7Snr0XnT+OKIE+8gEPzwPGSm9jH1D/SZd++TNte3/9JQzSpPmLTF5tA1G
 ySkmLwI7x1Bb3liD4GhjXSX1kOouutn0TYk6AffdPFAl8QoCBE0JdNVUnX21FnOjUJ53
 3p8qhQguEltoG5baZx2YeSRHdVZ54cNFbnxj2FOGQ31Xg7ywQNabX+dOpVD45ewunmXU
 rZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=AvFcdqQD0PSYNvAGJsI6XhuIRJ391XoPtzsDFtkUKP+cFKVGT4jLppn9ttsay+HmXV
 oCTEf8//h8MjR1+SW+/HCbjPl0eRUzy6dwVq3vi1vu726ZRbIDq36VAgZNrMICPw4s1g
 Pvfacl92GMwEViQv8CbGCqLjzncoSWmMl1bmlQVXDI5YCnAf0zLfJ3RMV4xQptCMldL4
 i5d2iiQ7xiwjJwdCGzfZuAOxTGwXsUQ9w5fSHbqJ//UMVEpjtvw8vpbc4liDraQn+8pD
 CbWmsJzi8vWUvo5T6ZwlE67KroJNtECTvIdfzR1zB5NbJ+/cmIMoKgfD3EV6XsknK9PI
 D98g==
X-Gm-Message-State: AOAM532jGmzDXyI04PxtSpt3SpLYiW4JLh7XvKzrpkwqO8kT+deFl8qf
 v3nmHvfWc8GvOS9wKpmxf3Pb8vkaLSrF6Q==
X-Google-Smtp-Source: ABdhPJxLlRZpUVdqJ1z9RmQ+auJac40lD4H6JfreeDo1JXGf3BvIb1PJjbvCGW0qpcbC8hEOq+quCQ==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr18640233wmb.27.1618786264978; 
 Sun, 18 Apr 2021 15:51:04 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y11sm17854527wro.37.2021.04.18.15.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/29] target/mips: Simplify meson TCG rules
Date: Mon, 19 Apr 2021 00:50:30 +0200
Message-Id: <20210418225058.1257014-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the mips_tcg_ss source set for TCG-specific files,
use it for mxu_translate.c and tx79_translate.c to simplify a bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..3733d1200f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -26,10 +26,9 @@
   'translate_addr_const.c',
   'txx9_translate.c',
 ))
-mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
+), if_false: files(
   'mxu_translate.c',
 ))
 
-- 
2.26.3


