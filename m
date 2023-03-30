Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1B6D065F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:19:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBk-0008U3-2f; Thu, 30 Mar 2023 09:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBg-0008PG-4y
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBe-000203-8F
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id n19so10908139wms.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4Qm4LX2kkl4/kGpdszX+MCrNUvG+BMcsxJOvXW1ttk=;
 b=UKwpyL+wLchXVr5BObyFWaNX0D0Dg7SuA3Bqthn9alhX9NGwi5QJombFRFXq5KU9VW
 yrBjeCZ0Ft2xsEMOfWr9WsJ2E+LDL5ajxK6Ba0MMnCqlzwZAMl7w6BuEXdYPrPVrv1hu
 DalJhYSjM+6SEAh96wd1ofNn/mmdv4XNK7nXFNnK6whSWseowUO3Kl+uP8MPmKn0gHb3
 oY0XOPkf3tpsaTdjAUxhKE+3sHWa681dEz7mJEI4ZGLlYcY0QT3KoTXgKRfoFq5T6T6e
 HEuDeFNbw5kLfqw9NP4Gl5HCs74tjyIOtW1L7KZfXdkPFZcYqCPeUM+qz896Pm+XS/Pb
 cCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4Qm4LX2kkl4/kGpdszX+MCrNUvG+BMcsxJOvXW1ttk=;
 b=EuY2f3nUUPOt27ANVNmT0cwhWWIDsDADrk4RhicQzFFCeLY1tjd1uOAT7v/hI8v2bJ
 JkDW0Bfqe1uVoi24cf7A2q3cUK9Lxln+JuKxwbEfr32mdZcYpdmu+8fhiDdqiPM3dwED
 0XYAxc84LA/RjBLV8cGg/lyfGuCyM13S3SHSwXa0tfm4UhUfngXzdxItlDC1aIWfgpEL
 uEV/2Snrv1F0mShHroHKB0tv/Z8icT5d8BD+h3ZjWzf5v/y6ayX8f0UUfrDZdzgZdbdo
 Mr0axaOrr8dBPDDfHz0xT1wC2UyZeSbgWr5pOw0TPagDSd1X4VjAQx0SY/JLfaTRxRoh
 6RDg==
X-Gm-Message-State: AO0yUKXkixqyt2raHI2a8v4hph1MFLrK1CrawmEELYU00XRR9QKCW/zB
 WhcSnqz38RBszLQ98L7++rJM7OKOUUhlgt8KnNY=
X-Google-Smtp-Source: AK7set/nh4Kedp9aNO/4L4X+5QPaMWUoOJV/ni/F/zLf9aKIA2YY0V/lnjj7wxhfX+g5H7g8+lCFeA==
X-Received: by 2002:a7b:cb44:0:b0:3ee:672d:caa3 with SMTP id
 v4-20020a7bcb44000000b003ee672dcaa3mr19345371wmj.18.1680182369214; 
 Thu, 30 Mar 2023 06:19:29 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a05600c45d100b003ed51cdb94csm6177599wmo.26.2023.03.30.06.19.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Julio Faracco <jcfaracco@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 6/6] block/dmg: Ignore C99 prototype declaration mismatch from
 <lzfse.h>
Date: Thu, 30 Mar 2023 15:18:56 +0200
Message-Id: <20230330131856.94210-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

When liblzfe (Apple LZFSE compression library) is present
(for example installed via 'brew') on Darwin, QEMU build
fails as:

  Has header "lzfse.h" : YES
  Library lzfse found: YES

    Dependencies
      lzo support                  : NO
      snappy support               : NO
      bzip2 support                : YES
      lzfse support                : YES
      zstd support                 : YES 1.5.2

    User defined options
      dmg                          : enabled
      lzfse                        : enabled

  [221/903] Compiling C object libblock.fa.p/block_dmg-lzfse.c.o
  FAILED: libblock.fa.p/block_dmg-lzfse.c.o
  /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  LZFSE_API size_t lzfse_encode_scratch_size();
                                            ^
                                             void
  /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:94:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  LZFSE_API size_t lzfse_decode_scratch_size();
                                            ^
                                             void
  2 errors generated.
  ninja: build stopped: subcommand failed.

This issue has been reported in the lzfse project in 2016:
https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719

Since the project seems unmaintained, simply ignore the
strict-prototypes warning check for the <lzfse.h> header,
similarly to how we deal with the GtkItemFactoryCallback
prototype from <gtk/gtkitemfactory.h>, indirectly included
by <gtk/gtk.h>.

Cc: Julio Faracco <jcfaracco@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20230327151349.97572-1-philmd@linaro.org>
---
 block/dmg-lzfse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
index 6798cf4fbf..4ea0b9b20d 100644
--- a/block/dmg-lzfse.c
+++ b/block/dmg-lzfse.c
@@ -23,7 +23,12 @@
  */
 #include "qemu/osdep.h"
 #include "dmg.h"
+
+/* Work around a -Wstrict-prototypes warning in LZFSE headers */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstrict-prototypes"
 #include <lzfse.h>
+#pragma GCC diagnostic pop
 
 static int dmg_uncompress_lzfse_do(char *next_in, unsigned int avail_in,
                                    char *next_out, unsigned int avail_out)
-- 
2.38.1


