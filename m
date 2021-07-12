Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8443C65C7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:58:12 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33wJ-0003SU-DM
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tw-0000dI-GI
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tt-0006sO-Qs
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so17722599pfj.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Za/XDlquE+Ox0yxp6XpECa7y8aOcWlCnk1g4JpHt+1M=;
 b=MsF0nG47M5aqYhAXnwIfjTxh2smNxksulcQ9aWTt7JACmfc/bKi1KqxujZceocHgJx
 i9XItTJbPehDzLilUM6OiP7S4VUu2agC9Eyd4GpFv+YIwwen/LkU5uxXNz2Mw0903vSA
 JOaqpkaTapG+hDJSMr+r9CbNCxsxoN7Frt8FF3p3Ik5lP9kKCbgTuUOSi1zlsxqQZ7RA
 vNc1/VhGrSYlgn08z1c56zKf8/aKjZzmXu0ZF94TtwJNOcfOhNmPhB4A1LsNN3GR6TjS
 RUOtBsJDvulmYZPrnrLhqZuoqonkr79ysGXIBZ0TF5hQkSmZ9YWFuLwyJViFI5b8uJvN
 T/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Za/XDlquE+Ox0yxp6XpECa7y8aOcWlCnk1g4JpHt+1M=;
 b=c2EW7QiLMhBUoUkcwIOi3Uu99jCKQRk4PaQOscTxbU5en4kNTU/9OwLZHzp0FjufUO
 3qx1+Rsvt+KmnWJ4/4NMVrv22fWiM3BXshnfZtZjigcJISkQfXa5mwweSgV/paFdNxgv
 6octU4PmA1fhkhGPNDWz7WfCagsSWJG1ux46v6CapxOsaRqrpBOwVcF9cNOywsBX8Ehh
 l8wi0LZxd91V/sYIsisA0kt/SN+p2C6adFHGSU9vZSEOj/cSDCQS0GsgU0/LW9MKOEjR
 DiY9aFLiJaCND3mK6BeHiW+DrdS/YWiw2yuYSQYtvY6pJwSFyl9OU3eItH5Um+ZMVa+9
 ZTog==
X-Gm-Message-State: AOAM5304lOHzX859ncY+/EW7xs8mswh/EUuKTPJeBYa0wgeoLMTO34+3
 fIGei9aEeOqibVSYXXUJ+pDvUcUUEMBUlg==
X-Google-Smtp-Source: ABdhPJyFYrK2UHqlYQ5N4eH/QrvI9zlyNA4AnCcoabDkV0LB45oRNyVQAdfLFfE8gfgQ6HNPf1KznA==
X-Received: by 2002:a62:1d8b:0:b029:329:ff4a:91f with SMTP id
 d133-20020a621d8b0000b0290329ff4a091fmr1288786pfd.9.1626126940412; 
 Mon, 12 Jul 2021 14:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] hw/audio/adlib: Remove unused variable in adlib_callback
Date: Mon, 12 Jul 2021 14:55:29 -0700
Message-Id: <20210712215535.1471256-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/audio/adlib.c:189:18: error: variable 'net' set but not used \
    [-Werror,-Wunused-but-set-variable]

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/audio/adlib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 42d50d2fdc..5f979b1487 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -186,7 +186,7 @@ static int write_audio (AdlibState *s, int samples)
 static void adlib_callback (void *opaque, int free)
 {
     AdlibState *s = opaque;
-    int samples, net = 0, to_play, written;
+    int samples, to_play, written;
 
     samples = free >> SHIFT;
     if (!(s->active && s->enabled) || !samples) {
@@ -219,7 +219,6 @@ static void adlib_callback (void *opaque, int free)
         written = write_audio (s, samples);
 
         if (written) {
-            net += written;
             samples -= written;
             s->pos = (s->pos + written) % s->samples;
         }
-- 
2.25.1


