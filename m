Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1A1A10D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 18:00:15 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLqe6-0008G7-PN
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 12:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVm-0003pK-Os
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVl-0004Si-J3
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jLqVl-0004S6-DL
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id h15so4463653wrx.9
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6B+33TDAfIaOLpicgY8n+ylFencr6qohELifXSSvkE0=;
 b=mVZeilI2YzyMDuyyFkQnkFrkD8G/vEsr7Vz//hcMCcaxuLqVMrqGslf8CLPepOCTKG
 4oo4haNCToi6HUVTMRx8gR505gVrszSGTYnVNax1kX6exw06qD3FBlFHPvvQVqEuDu2v
 jX8Nmv/L1UjiopQf3IsBAfRNmkTT8g2WWtC/+94fju7p9eyltcQHdxt2UNsmj0Tfhz7m
 NQaUN4SEE++V1TQAANF4TFi+DSzDPZPjjmpfpBypDFHG3BuTJvevIEbVgoLoqDt0FAkc
 yuw1uyBC5Bwn3pFRlihUmrXVCPPrGoMGub7bQBox9ROJGgMfOzospe8y40yHzgb2R1tp
 wwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6B+33TDAfIaOLpicgY8n+ylFencr6qohELifXSSvkE0=;
 b=iytMvamwi/r4w5EOVLH1EqqnAWLT5UyXvtXTZbhZ3YWZl84kCg2Sdsvk/Ej5I2iwFt
 sz2+RmX1027WEnb0mCAeKbJthe+kT7nklbvyPgfRn5ipkhFSwHxrjqTTZEwTDo1hCECb
 yF0inYAnCN8UBoHIf9ZTvNLkotk0v/HaPdkQc1xzUBfk1T7wgIChcXKwQ5k1Te8rmbF5
 CV8KuZl6L0QVTGoAAYEfQMGXCeOm/TXloaMK8CYpzjgyi++c4I81NE0K8lj4Ss4atsp0
 wtojqi5I9/TwUMG+dZ3OjXASLT6b4j1v3HtZ7AQy9LGRydyO+mPynYChZ3Zpa0aO2+5W
 BnLg==
X-Gm-Message-State: AGi0PuZwtJOVoZsx9rxSOPFZfRyfZcODPiF7PlWvKFDr8eSHWBOgSC8O
 KTFOTyXnSmGR3BNHFiywcpwr/BEWzVU=
X-Google-Smtp-Source: APiQypI4LrFw1TmdOD7nuzNpDiXH0AsCXatkT8BYpKLOgFl9Cfp760ewJO3QMA6QDeA6I0H2cyezIQ==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr3323659wro.404.1586274696290; 
 Tue, 07 Apr 2020 08:51:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w18sm8881639wrn.55.2020.04.07.08.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 08:51:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F0721FF9A;
 Tue,  7 Apr 2020 16:51:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/13] hw/core: properly terminate loading .hex on EOF record
Date: Tue,  7 Apr 2020 16:51:16 +0100
Message-Id: <20200407155118.20139-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407155118.20139-1-alex.bennee@linaro.org>
References: <20200407155118.20139-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The https://makecode.microbit.org/#editor generates slightly weird
.hex files which work fine on a real microbit but causes QEMU to
choke. The reason is extraneous data after the EOF record which causes
the loader to attempt to write a bigger file than it should to the
"rom". According to the HEX file spec an EOF really should be the last
thing we process so lets do that.

Reported-by: Ursula Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200403191150.863-12-alex.bennee@linaro.org>

diff --git a/hw/core/loader.c b/hw/core/loader.c
index eeef6da9a1b..8bbb1797a4c 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1447,6 +1447,7 @@ typedef struct {
     uint32_t current_rom_index;
     uint32_t rom_start_address;
     AddressSpace *as;
+    bool complete;
 } HexParser;
 
 /* return size or -1 if error */
@@ -1484,6 +1485,7 @@ static int handle_record_type(HexParser *parser)
                                   parser->current_rom_index,
                                   parser->rom_start_address, parser->as);
         }
+        parser->complete = true;
         return parser->total_size;
     case EXT_SEG_ADDR_RECORD:
     case EXT_LINEAR_ADDR_RECORD:
@@ -1548,11 +1550,12 @@ static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
         .bin_buf = g_malloc(hex_blob_size),
         .start_addr = addr,
         .as = as,
+        .complete = false
     };
 
     rom_transaction_begin();
 
-    for (; hex_blob < end; ++hex_blob) {
+    for (; hex_blob < end && !parser.complete; ++hex_blob) {
         switch (*hex_blob) {
         case '\r':
         case '\n':
-- 
2.20.1


