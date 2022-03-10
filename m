Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D004D4781
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:59:18 +0100 (CET)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSINx-0004ny-N6
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9p-0006pQ-Qe; Thu, 10 Mar 2022 07:44:42 -0500
Received: from [2a00:1450:4864:20::432] (port=37525
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9k-0005DE-1g; Thu, 10 Mar 2022 07:44:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id q14so7787796wrc.4;
 Thu, 10 Mar 2022 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHuxLxSTxAolaSufQ6BUZcRlafg36voYkUOQRtUENB8=;
 b=N+xEDazMWr9kc5Ma8b9D7Uip1Y59eJAnGaU9SgR4G7k9yrseszZCSx8Fqh09MBGcua
 C+d1PYBYZ9ZlY3mU7sk2nneTXSg3OrOubqexTpz9Nm1buJ/D6EQBIwljPsT2XSaDKW4d
 dtk/Z9ouaXbcE/DlpvJE2eDc+LlJXbli02tOaRoQeQDBqspmHh2IbtAFzcfRx6GkiFde
 1nCFeQTE0BDPD7HsruRli6+VXQk0irx5pKh0+16jRxt7A3ks/jIPFcOyrcMxmTxeRlhW
 jkU1VBUxMcEYMRGgB9hrz6PRzWPbd6ClKFIEQtk71ebCw7P5n3zoEG4nSom1U989PgTk
 0WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vHuxLxSTxAolaSufQ6BUZcRlafg36voYkUOQRtUENB8=;
 b=fkPwboUAiN3kZIRtvDm29dg4Z4jzA5tKkMNqp4Rc03PawglU08YLySx39ExTjNp6wV
 eEwQ2ZxYRZjz8PzlT+3xOF+IZ9Z26Mhyk6YONtW/dlzyLQnNlsVGp+Z1rZjqgPIq6sme
 gcAJu0Oe7qfvQL3Bi4BdC4ygB8iwexsWh2BHZbFNDospelKNOJwQZAfNCGyzdfCPqRwG
 eKx+yShGP8lmvIrnIchqLtaAQmpSwExrdnOpaefeXE7MjNeHF93wISY5edDZkmxAfKC5
 N8HaMZdiIl/BsCkgxRyDH/OdDY2GCie26T6z0D0uynkv7y88YVYbiZbMHDUyRrkg9x5L
 H1Yg==
X-Gm-Message-State: AOAM533f+y1XPE/I1OahGpGQ8azeJbN5v6NY2GsMTdCB/UXJtWEmlQMQ
 DmXIrR3tJG+0D6qK8buixNPDlNBjTtc=
X-Google-Smtp-Source: ABdhPJyFgMf8I2erlRFGmwG9GDsNfGNmj80TvKCX8IK2Zm+nJwRqct4YFYw0qAbX5tCHDdsWI2+XeA==
X-Received: by 2002:a05:6000:184d:b0:203:92d6:93cb with SMTP id
 c13-20020a056000184d00b0020392d693cbmr94320wri.496.1646916274367; 
 Thu, 10 Mar 2022 04:44:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/35] /basic/self
Date: Thu, 10 Mar 2022 13:43:53 +0100
Message-Id: <20220310124413.1102441-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 7aaadfd31a..c701113d77 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -36,14 +36,16 @@ static void test_in_coroutine(void)
     qemu_coroutine_enter(coroutine);
 }
 
+#endif
 /*
  * Check that qemu_coroutine_self() works
  */
 
-static void coroutine_fn verify_self(void *opaque)
+static CoroutineAction verify_self(void *opaque)
 {
     Coroutine **p_co = opaque;
     g_assert(qemu_coroutine_self() == *p_co);
+    return COROUTINE_CONTINUE;
 }
 
 static void test_self(void)
@@ -53,6 +55,7 @@ static void test_self(void)
     coroutine = qemu_coroutine_create(verify_self, &coroutine);
     qemu_coroutine_enter(coroutine);
 }
+#if 0
 
 /*
  * Check that qemu_coroutine_entered() works
@@ -681,8 +684,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/lifecycle", test_lifecycle);
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
-#if 0
     g_test_add_func("/basic/self", test_self);
+#if 0
     g_test_add_func("/basic/entered", test_entered);
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
     g_test_add_func("/basic/order", test_order);
-- 
2.35.1



