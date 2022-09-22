Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE65E5E61
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:20:59 +0200 (CEST)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIOA-000451-6L
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuO-0004YK-51
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuJ-0003Sh-Mz
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuN0RvFNXbfYw9v0uWvsWxRBJlewlxQT5whcowWTn1k=;
 b=WGvq/u8TOlyvL5vaoUjbs7C5IbisbT4aVMiFLHxW2KxS1Vt9rJGTydvdPdybs8P0fwTLqx
 eWLXe8kV01Ogl44n4G1vaa78vsTM4j4po2x6ZHMzQ9fClR5uRNXz/4YGHcC1YTybbrS5T0
 0m6b7yZHDaOLKJsUpjqDig3puZF850k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-dNpzcFBzO0aqzPtIMnov-w-1; Thu, 22 Sep 2022 04:50:06 -0400
X-MC-Unique: dNpzcFBzO0aqzPtIMnov-w-1
Received: by mail-ej1-f71.google.com with SMTP id
 sg44-20020a170907a42c00b007822e506a4fso1424923ejc.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uuN0RvFNXbfYw9v0uWvsWxRBJlewlxQT5whcowWTn1k=;
 b=KuCJ9BNKae6U8rUupCrIf8bmrf0cPdRjY1UWFVyG8r6ALT3vRYj/R4BYyFPOmu6UMK
 gWH0b3vevHDgSQ8r4ngbDXVvlkKPxlXaS9mwNSkm+Kg8o08RSwp5tgdVW9iiSGseyEdf
 PGB9s5Aryse8bRkWvewdCwkYPNe660Hq9aepKDiu+s+yDqF8WJUCBmUfY0n/LrQ3Baeo
 YUYOypQn8cjXtYLGWC8v219C/df3S2H3gNtXBXI7Ri4be9ZhJ1Bbub7usbDLORl2ixm8
 w+HyNTPfrMB8/Cyaf1I4kAWsZ/BiueXVWjqueRf7CqSQ+CZfv5Bx9m76iaRy5VHB+RAo
 aQhg==
X-Gm-Message-State: ACrzQf2e8nlULkYWE4xUspsROjVG7Zz0q/Nrb8nUSLYEpHl+5HVOqTH8
 E/fUWOFNvklGL/1XbBjYcijILPhFbZsLhAdTBv/ldksAcHdGpnhsVGKVB4iJeSJGmiUknijHzXu
 zjtx6sQM/9f8pol4DfaPOnmKNkXOvToU406dWrfuB8yRaZtS5YG6hc2GR2Oy+eN+LMV8=
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr2174205edt.206.1663836604751; 
 Thu, 22 Sep 2022 01:50:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pLAvwf+3SaacD/apDxGVUbFaLB4YCRVvPm98M6zxzUTlF3+yMoHngapqE8s2NTcDXGaEuHQ==
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr2174187edt.206.1663836604533; 
 Thu, 22 Sep 2022 01:50:04 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ay21-20020a056402203500b0044e9601e53fsm3245515edb.19.2022.09.22.01.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:50:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 26/26] test-coroutine: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:24 +0200
Message-Id: <20220922084924.201610-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index aa77a3bcb3..e16b80c245 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -610,7 +610,7 @@ static void perf_baseline(void)
     g_test_message("Function call %u iterations: %f s", maxcycles, duration);
 }
 
-static __attribute__((noinline)) void perf_cost_func(void *opaque)
+static __attribute__((noinline)) void coroutine_fn perf_cost_func(void *opaque)
 {
     qemu_coroutine_yield();
 }
-- 
2.37.3


