Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD78424238
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:08:47 +0200 (CEST)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9TK-0001g2-7O
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0002UU-Ez
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8id-0007my-Kp
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4726305pjw.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPIcGzLHzUGJX7Jj+C8qaZx0nYKNPBVvrrT1FpbMEjs=;
 b=CLB4v3846T7vSlc/g4qLtE0mkqJOA1SaH1zx+OzP8FZyHYhE1G7MWW/rhGkV4/xre+
 fMlHhcwr/wNR9KHAUioBk0FO5uDSrWnYSL5FuFujw4F4xQMQRrmO2GYckVN6FiXgb0r5
 c6/+4QtRA4ZK+dt9yyEsvtvGAQlKKdsiyavYXQHwjJ9J3Cpy1ntJOM3+JtILWrD0MPv7
 hOVkn43kjIEGE3R+h+OyIrIspHvEL8lbJpe8rsR7AzJapYeXdR/amgV6XQQeqoaTzSUC
 N1KKie8LZQfaKBMZC8nUdj6pzRStnyDbjKl9/BRJU4/8A8UFNnRRhF3DHSRc59OAQDq4
 iHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPIcGzLHzUGJX7Jj+C8qaZx0nYKNPBVvrrT1FpbMEjs=;
 b=EIcMaDrgSmIZiXtHzRxBb6ZbhdDqvKt+HanKgxmWRp0TfvHlMAhr8I2vXGMZomCtWq
 VDeaJOdhuyjb29/Fg9XqHo8jKmbYdyBq0l86eU6eeFs5W0ufijgPJ9j9GaXYWCSjLIaE
 IDvdoT6VFzcyS3lnjdd6ldC1wiwdXZboVKtlXdELyyHF1MmxxBB5fO6Cw4bxPABaZ0kp
 Yxh6U+FZyXnwOxVUFKZ+i4l7IFYEaolvx/5bJnnTAckdTIhHijWQDc7bcc0bS/s1agsX
 RuqKDhJWGAlULcGvZF7n3Tgdkin/hZI64ekwvuJ0WQzo5AD18M5ILgjrumtbivXcf7Bj
 +nFw==
X-Gm-Message-State: AOAM531LER+N/SqsJoemIvDQ0PBzLb8I4MYkwTjz+1wqwkgeK/P5BvtJ
 6c1yZP63ZUX22cgRp+5K7uk3Q54HsTSTCw==
X-Google-Smtp-Source: ABdhPJzS8SgwUnfTOeyZECY6LfAEs2daqcULqX+hLd1B1nduHqpkFe1l48AESyF+SQXTTiYNkXuDrw==
X-Received: by 2002:a17:90a:12:: with SMTP id
 18mr11710113pja.104.1633533628345; 
 Wed, 06 Oct 2021 08:20:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] tcg/s390x: Rename from tcg/s390
Date: Wed,  6 Oct 2021 08:20:00 -0700
Message-Id: <20211006152014.741026-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                              | 2 --
 tcg/{s390 => s390x}/tcg-target-con-set.h | 0
 tcg/{s390 => s390x}/tcg-target-con-str.h | 0
 tcg/{s390 => s390x}/tcg-target.h         | 0
 tcg/{s390 => s390x}/tcg-target.c.inc     | 0
 5 files changed, 2 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index 7b596fdcd9..99a0a3e689 100644
--- a/meson.build
+++ b/meson.build
@@ -268,8 +268,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 's390x'
-    tcg_arch = 's390'
   elif config_host['ARCH'] in ['x86_64', 'x32']
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
similarity index 100%
rename from tcg/s390/tcg-target-con-set.h
rename to tcg/s390x/tcg-target-con-set.h
diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
similarity index 100%
rename from tcg/s390/tcg-target-con-str.h
rename to tcg/s390x/tcg-target-con-str.h
diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
similarity index 100%
rename from tcg/s390/tcg-target.h
rename to tcg/s390x/tcg-target.h
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
similarity index 100%
rename from tcg/s390/tcg-target.c.inc
rename to tcg/s390x/tcg-target.c.inc
-- 
2.25.1


