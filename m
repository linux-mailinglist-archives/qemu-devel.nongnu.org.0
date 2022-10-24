Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFF609923
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:27:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omoXH-0007Y2-Tk; Sun, 23 Oct 2022 23:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omoXE-0007Sr-En
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:53:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omoXC-0000Yu-J2
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:53:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id b185so1798781pfb.9
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 20:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kp9LhfiuTjCmNa2oeYI903Zjr+KKaYkdyPt5aXd4y5k=;
 b=HIhB6959BuzB5qfu6/F5MZBhSykJG9nwhMtUkzL6SMRc+IQObCJd0oC1ZWnrxGy380
 Ch7m8noOCGj8pMmO7sQnah1iUfiVxXPB932OrR/qmuu3Wdh0bLzr5jEXRpdi4geVCXLN
 Q3a25T00l8KGYFp5hYZUyTrHVu9+Qnb1c56OXUyEZvhZESk627JSu+4xyxmx7HWFIjMW
 RT1Q2Cn2+C2k9NztdP5l9WswFV+p5lldP9X+fyfHipOaONigou48O6AefYipEp7ISUFU
 efA3rY0Uyv/YwcIYDPe846Obw2E90D+SpXVZ1+PsLuqna+hR6uNq1ocdrRow9cNhtePq
 h8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kp9LhfiuTjCmNa2oeYI903Zjr+KKaYkdyPt5aXd4y5k=;
 b=j7eSwmeDp4xhTsaFCT6b7yOel8kj8U7zuV8IPIjU9lGjWnbXUJAhZTrdvb+2xfmf5v
 FCIofmDVlqHnEFrL2PqE7neARkVL0jT8a3vDx0hAfgBBCQyNCC0l2FMXUzLEo8OALqeK
 vxK5TcSFx3SSgzMBJdkmUgtXZYt993s+/iBlQwWkxY5653pLlHkK9S8QwOHsnKoZQ3eF
 8Pdk32KQR3Z+g3YlK13xBMgKwdl3PyTYF0rN2jPgCH30tBrm92RBp1zNDS3oD+/1lptH
 SRPdyPQ3gSZZ+oVGdklvUKalzRkM3+6+2zVHACMM91mGVCE5BNYk4/UURJDRA13HYRiU
 dIYQ==
X-Gm-Message-State: ACrzQf1hvplk28b4NWaU6BqHdeZ94G4Fxy7wTehQZq0umqTR0zkanA4Z
 Qm38A3bNvPFAw7U2byuQyTqMrYYzAXy5am1M
X-Google-Smtp-Source: AMsMyM7/MAT9QhL66QzMe7eLYxL34R6VxBxO4YTvFrtM/iOFoBKmMsuU8bWLYWZoXo3vrsfMwMHMWg==
X-Received: by 2002:a63:4955:0:b0:44e:d36e:4c2e with SMTP id
 y21-20020a634955000000b0044ed36e4c2emr26364047pgk.326.1666583632702; 
 Sun, 23 Oct 2022 20:53:52 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 t15-20020a170902e84f00b00186a2dd3ffdsm1433569plg.15.2022.10.23.20.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 20:53:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Date: Mon, 24 Oct 2022 13:53:41 +1000
Message-Id: <20221024035341.2971123-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

More closely follow the default linker script for nios2.
This magically fixes a problem resolving .got relocs from
the toolchain's libgcc.a.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/10m50-ghrd.ld | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
index 7db0d59ad7..71cdda450c 100644
--- a/tests/tcg/nios2/10m50-ghrd.ld
+++ b/tests/tcg/nios2/10m50-ghrd.ld
@@ -44,11 +44,15 @@ SECTIONS
     .data : ALIGN(4) {
         *(.shdata)
         *(.data .data.* .gnu.linkonce.d.*)
-        . = ALIGN(4);
-        _gp = ABSOLUTE(. + 0x8000);
-        *(.got.plt) *(.got)
-        *(.lit8)
-        *(.lit4)
+    } >ram :RAM
+
+    HIDDEN (_gp = ALIGN(16) + 0x7ff0);
+    PROVIDE_HIDDEN (gp = _gp);
+    .got : ALIGN(4) {
+        *(.got.plt) *(.igot.plt) *(.got) *(.igot)
+    } >ram :RAM
+
+    .sdata : ALIGN(4) {
         *(.sdata .sdata.* .gnu.linkonce.s.*)
     } >ram :RAM
 
-- 
2.34.1


