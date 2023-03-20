Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9116C12DD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFLR-0000z9-B3; Mon, 20 Mar 2023 09:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFLN-0000yy-PG
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:14:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFLM-0002eO-2a
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:14:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso9155888wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679318068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pdlASMT4jISCzMP7osi2/4IX99eROCkVPgjLB1OApxg=;
 b=W9YnPYKmekIKa8TJ8U2EcTR2voKbY4HyYEZOw/37GipI4COo8FZPOCap4Yaf9Ob5nG
 TzeYF+8yEKRJ3sbNLDo3zMbJZwayBmV1GnNTjFGZzM+XLSwQqPzJxD26zZFFpOFS1L+6
 7zFIcXH4emHPOh8F8PxDgoa5Vs1rjPRPgqARM1hBHh8WQ4KrhIprVE6EA5hxdG07zYNj
 jUEoqEInIklQvyfOFtcAxcTITxTPUPL8IYbdZO+IcPoC6Xp5lW6R82sO8Fbj87xTsQ04
 hE3YUXE6a+sispE+zOcYNWzK4MkgCf3IL8qY/hvBAf2LoRaAomrTiKHIZO4K+/dCFvp8
 LIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679318068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pdlASMT4jISCzMP7osi2/4IX99eROCkVPgjLB1OApxg=;
 b=Qa3fkm6V+7i6Fiz1Ppc3dsOMp7DDeT5vGSPhzYQJef70wjJ8cVu/0LLcCs3OE1qKf/
 jOOJm1+1zqXFa+MU4qJrypU5YQ0Ew699wuPxInJU3Wi8qcUousACRlHlvc7B/wEvQvMl
 ZI5srB0KK6xiSKy48BTJKg5nIYWwbuphLXrTmYPVd+TJ44T6N5kYiQM/ecdKXnkIvPww
 byeeimbCbUOlcFgbDFn/P9ur/3GqtDSLBd9/Bkj9Y9gstePw8ZugxR5WpjP4YQp6yJWh
 fqb9ggj5uDlZHhw/FW6pbubM7hoRnnZnFfKpYQ7sYlcdEqMk67ovfPVf3qmXv0kToGRO
 194Q==
X-Gm-Message-State: AO0yUKU5hwpT8kgcy3vUbUQVmJ8ZIWHaS8Egw0yYRhYbqIhW9kTyTeog
 fUrCWXKJMV2SbxLsdhZ1++74+xSZtmGcxuvFm1uh3A==
X-Google-Smtp-Source: AK7set9NrjyFKwr6B6Fp+7J+Q1KLbmC7vLE90q8ahYq+Q8PrWtLQKE7gCqknCrCWJE6UiuJpXQGBfw==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:29fe:70ec with SMTP id
 g15-20020a05600c4ecf00b003eb29fe70ecmr36508134wmq.27.1679318068391; 
 Mon, 20 Mar 2023 06:14:28 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003ed341d2d68sm10355616wml.16.2023.03.20.06.14.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:14:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Sebastian Wilhelmi <wilhelmi@google.com>, Eric Blake <eblake@redhat.com>,
 Sebastian Wilhelmi <seppi@seppi.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>
Subject: [PATCH-for-8.0] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Date: Mon, 20 Mar 2023 14:14:26 +0100
Message-Id: <20230320131426.16348-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

By default, C function prototypes declared in headers are visible,
so there is no need to declare them as 'extern' functions. Remove
this redundancy. This also fixes when building under MSYS2:

  C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: standard attributes in middle of decl-specifiers
  1075 | # define G_NORETURN [[noreturn]]
        |                     ^
  C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in expansion of macro 'G_NORETURN'
  240 | extern G_NORETURN
        |        ^~~~~~~~~~

Reported-by: Simon Wörner <contact@simon-woerner.de>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f68b5d8708..79c26c748a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -237,7 +237,7 @@ extern "C" {
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-extern G_NORETURN
+G_NORETURN
 void QEMU_ERROR("code path is reachable")
     qemu_build_not_reached_always(void);
 #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
-- 
2.38.1


