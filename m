Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296F51FAEE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:08:51 +0200 (CEST)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Fy-0004pg-N3
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fs-0005LA-R5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fr-00037O-CK
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jj2He4XMwehAE3Uqy98FnggkYD9lJQ14hPgJS+DCGk=;
 b=iAAJiw0EwllxsYlGX4Bt3JCXInJKlg683FXxjsif6OlhaDMvlKHatXC1M/rcgrJ3sk93jW
 RZ24GX57kRipyIuoEqBpu+Wmqbt5mqYVtdKKrhCi0PZ/xdtOSfcbKQLwWVP+2tERQsnVjN
 EYxvt/+sjrpB1thHBkxge9Dcz6ym1rU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-2w6qOTwzOF6TJY_RWKR4_A-1; Mon, 09 May 2022 06:31:29 -0400
X-MC-Unique: 2w6qOTwzOF6TJY_RWKR4_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so5608814wra.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Jj2He4XMwehAE3Uqy98FnggkYD9lJQ14hPgJS+DCGk=;
 b=aLnHRd6WUGEYKhR7k0AtF8PFg4b0BSKzQj1SWJzHfMWYo9yEOBSejWEUsepl+l+jyg
 OHqX9SB9TZGW6YTmMKFcr90K1/wKTHkmweY4EW4V5vA6nd+kJIeJ5Tos8uHOgAaGbeng
 KKshO/ePAcpAFCG2Ac0y0nTLuNc4/kSIES+oGAbYFf8TVZYqCnHau1BfTvUS0EJhFpPX
 wWZladhw5qklSCfnRoks0sp37AUaA4r6RIiHF87U+Gw3Ju5ernXXShBiMCMCsxafzhvJ
 eaVi1jNgnQnHj/WBAbZzKLCzIchK34AIebM4vs9hSnK9Vg5gOO9KwApoLmLWfYoauKQH
 0KCg==
X-Gm-Message-State: AOAM533SL/9UgecyrAUUFlgTKvHZqBAUDQ2p6rduXkJ4UH+D2YD5mZB/
 gaUqa3sU6G2T0HA+UeMLGgLebh1iE0ZPJ5QyYc+TE6pAsoGrwn4fT5ZXHXqG0JvTAP0b9O1E6FW
 wkZ5EkNyJRSzXECzF6LlQrlHxjJpDlZk1y7M075VKhFTzkXh4Lz8Xowe7++Kn4TmzgxM=
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr13561757wrs.493.1652092287987; 
 Mon, 09 May 2022 03:31:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIcLWvcHp1+vMWJIOD+gk9BEMps5XFs9qJKPhV3EFvHKB08OsJc+F4lL4QvBLb4xtBEAgztg==
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr13561734wrs.493.1652092287581; 
 Mon, 09 May 2022 03:31:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c7205000000b003942a244ecbsm12209472wmc.16.2022.05.09.03.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 26/26] test-coroutine: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:19 +0200
Message-Id: <20220509103019.215041-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20170704220346.29244-4-marcandre.lureau@redhat.com>
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
2.35.1


