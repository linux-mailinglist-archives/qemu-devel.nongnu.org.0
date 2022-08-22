Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777AF59C87D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 21:19:27 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCxK-000807-2C
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 15:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAil-0008K9-Hd
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAij-0005zp-MN
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id a22so14733236edj.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QjQUv7sIYW2ZLqYfMzD+9aob4dpIVdREF3LrFmbU6pU=;
 b=krH7RFoH5ZlPJCB7xbFT1asc8YC+ll2lWWC1EP0DYgpRt1/psURxHpjM+tMNfDZgX5
 BAbZpZuMlAv+/Q16qOUZ/m91/cZ4UWQEz6AGZE1YcKvnbrNsOo3FOlTjJdaFizhv71k9
 oO93yY/9aCkJIZqzlFjqJYVbv7WXAEC3CwfgX6ngOK6zNpTF7UYbi6jE6NHb8Vxb/7gc
 nV9SrCjrf8hEPhqvprfc0xZvm/IVIsWF/AM4JGYTLYJoNtHJcTqpz4MAGWkJZcTawynf
 q5blUzZ8nlECKMWU+UaYRHl/zV8SY5yEVs2BFHLyFCJQFSuL115LKonBaviTIFDg0PqB
 hClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QjQUv7sIYW2ZLqYfMzD+9aob4dpIVdREF3LrFmbU6pU=;
 b=BL2SGGv/fTBEmKTHW2bvMZwO68K277igUv+d6N4meiueBxJsdIikfNFKmMlp+jWRad
 iB0HRgKUb6/bBAfqeAqeDYv5FiW2R/i4ZHtQ4l+1P1YEdjPNTO56qeROD+wKjeke9xmq
 kTCpSa7Lr5o1XN257pfLgY62F8uz9kpThuVEH4rqbTDgtEJm4cHbaKqc15rcBjtKKFD3
 efDTh+hEp0HB1ocRgrb4IPYjZpslfMEgR+Aj17RKPOD4uNe6Mm1YSBbElt4dz6XAhSGE
 cB25kYMJdwRBD3I7nqGy05UEypvEyxEdmkFNOid+XpwUi+lel0IuXZWepzYZWBit6ZSL
 i+cQ==
X-Gm-Message-State: ACgBeo0Y8OqqRDECEwkctNa5Dx+P7gPqGmX/b56VVtF6NTSg7hFpt3ex
 hWWMP0iB8ad9fxk5D3mwPyrIpA==
X-Google-Smtp-Source: AA6agR74C+G3k5R93zeeFJAlEjAl9bfgE1DQ0tPERI85WtnUGYeigUUkXCTVPd/vxNGor3kVwF+WcQ==
X-Received: by 2002:a50:fe91:0:b0:43d:c97d:1b93 with SMTP id
 d17-20020a50fe91000000b0043dc97d1b93mr81285edt.67.1661187372207; 
 Mon, 22 Aug 2022 09:56:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a17090623e200b00730bbd81646sm6417342ejg.87.2022.08.22.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34F4B1FFBB;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v1 3/6] tests/migration/aarch64: Speed up the aarch64
 migration test
Date: Mon, 22 Aug 2022 17:56:05 +0100
Message-Id: <20220822165608.2980552-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The migration tests spend a lot of time waiting for a sign of live
of the guest on the serial console. The aarch64 migration code only
outputs "B"s every couple of seconds (at least it takes more than 4
seconds between each characeter on my x86 laptop). There are a lot
of migration tests, and if each test that checks for a successful
migration waits for these characters before and after migration, the
wait time sums up to multiple minutes! Let's use a shorter delay to
speed things up.

While we're at it, also remove a superfluous masking with 0xff - we're
reading and storing bytes, so the upper bits of the register do not
matter anyway.

With these changes, the test runs twice as fast on my laptop, decreasing
the total run time from approx. 8 minutes to only 4 minutes!

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/migration/aarch64/a-b-kernel.h | 10 +++++-----
 tests/migration/aarch64/a-b-kernel.S |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/migration/aarch64/a-b-kernel.h b/tests/migration/aarch64/a-b-kernel.h
index 0a9b01137e..34e518d061 100644
--- a/tests/migration/aarch64/a-b-kernel.h
+++ b/tests/migration/aarch64/a-b-kernel.h
@@ -10,9 +10,9 @@ unsigned char aarch64_kernel[] = {
   0x03, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x00, 0x39,
   0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0xad, 0xff, 0xff, 0x54,
   0x05, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x40, 0x39,
-  0x63, 0x04, 0x00, 0x11, 0x63, 0x1c, 0x00, 0x12, 0x83, 0x00, 0x00, 0x39,
-  0x24, 0x7e, 0x0b, 0xd5, 0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb,
-  0x2b, 0xff, 0xff, 0x54, 0xa5, 0x04, 0x00, 0x11, 0xa5, 0x1c, 0x00, 0x12,
-  0xbf, 0x00, 0x00, 0x71, 0x81, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52,
-  0x43, 0x00, 0x00, 0x39, 0xf1, 0xff, 0xff, 0x17
+  0x63, 0x04, 0x00, 0x11, 0x83, 0x00, 0x00, 0x39, 0x24, 0x7e, 0x0b, 0xd5,
+  0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0x4b, 0xff, 0xff, 0x54,
+  0xa5, 0x04, 0x00, 0x11, 0xa5, 0x10, 0x00, 0x12, 0xbf, 0x00, 0x00, 0x71,
+  0xa1, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52, 0x43, 0x00, 0x00, 0x39,
+  0xf2, 0xff, 0xff, 0x17
 };
diff --git a/tests/migration/aarch64/a-b-kernel.S b/tests/migration/aarch64/a-b-kernel.S
index 0225945348..a4103ecb71 100644
--- a/tests/migration/aarch64/a-b-kernel.S
+++ b/tests/migration/aarch64/a-b-kernel.S
@@ -53,7 +53,6 @@ innerloop:
         /* increment the first byte of each page by 1 */
         ldrb    w3, [x4]
         add     w3, w3, #1
-        and     w3, w3, #0xff
         strb    w3, [x4]
 
         /* make sure QEMU user space can see consistent data as MMU is off */
@@ -64,7 +63,7 @@ innerloop:
         blt     innerloop
 
         add     w5, w5, #1
-        and     w5, w5, #0xff
+        and     w5, w5, #0x1f
         cmp     w5, #0
         bne     mainloop
 
-- 
2.30.2


