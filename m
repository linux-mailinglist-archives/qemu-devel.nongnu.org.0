Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CA5A10D8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:43:22 +0200 (CEST)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCCf-00021t-5U
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRC41-0001cZ-Bg
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRC3z-0007Za-Qx
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wqq2ATTF+0SI0JLTuuFDandc2rfo0tO1zCowo0TlBy0=;
 b=hGCWi4qotTw2Mnd3uLJAbGq0s+38/p6eMRx1lnvHAtc3EdSq4RZ3Izt/luIZk1ex2k6iBa
 S0PENpi4AxXFXPo/td0nqzBAY0Dg7ci1cXlSMXxBS95latEGUMH8e3I4UDjmyWyzUPv1wQ
 G3r6Ka7R7aqc8c4/v9V5/Hm/z5xDnyE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-SBwuzooMPOGocBvU38DBeQ-1; Thu, 25 Aug 2022 08:34:14 -0400
X-MC-Unique: SBwuzooMPOGocBvU38DBeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d11-20020adfc08b000000b002207555c1f6so3313501wrf.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=wqq2ATTF+0SI0JLTuuFDandc2rfo0tO1zCowo0TlBy0=;
 b=njB+U1bpBp65iOQ2S3ppBgPt7fkhe384SupnRt8hWvQVx0eVGMGo+dzEUVmrzVuFKk
 /l2JHuaz7aMz6MqQLSxIybZrvaINwN4fHAysfIYktLn7NHPQ/Ru15oN+4GopXB1e4pZG
 NvKjkINJXvAZ3YU4ZVPEnrZBxKKHiFzpR63AwNM45Kr9/zEwu/7McoxVumYJig9ZhsIG
 4qqaF8HCmrsq/vCTezeC42+61xCpz16iObiGTleFK47/StIOjTjz+PsFhsYShPN2AnL4
 91L+x7pOpmhJsjfkaUgcuTkQupL1p2PpngqX633ibfOoPsupYK5cukGj0SrvfNupzpDb
 jGog==
X-Gm-Message-State: ACgBeo3zWzKnz1Xz8Oq9cU2yGXBae0YQdUmQrH/zwMrmCpxKUWxe4Pbz
 PcQasV2mwY6k0KSTCERI5hNHsA0ucBZbaa2fdDCrgsqUk4OMJMJgwc9DsHTjL80QGrYfyZGXXvW
 54raPqaXoECjDWi4ilJIFkBVivzv1tL+naHcePkGqtAMExCNIlh0BvMScqPyrtYRwHWs=
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr2233981wrr.130.1661430853072; 
 Thu, 25 Aug 2022 05:34:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6W5G/zHGBcIhouZ4nuOrPOsDEQDp5vLlT0tBCT/whRntYPr8a6jLPhT6FY7k/yZ6OfKH0FmQ==
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr2233965wrr.130.1661430852771; 
 Thu, 25 Aug 2022 05:34:12 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a5d4685000000b0022526db2363sm19522270wrq.30.2022.08.25.05.34.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 05:34:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: x86_64: improve consistency with i386
Date: Thu, 25 Aug 2022 14:34:06 +0200
Message-Id: <20220825123406.319029-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Include test-i386-bmi2, and specify manually the tests (only one for now)
that need -cpu max.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/Makefile.target   | 2 +-
 tests/tcg/x86_64/Makefile.target | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index bd73c96d0d..5614838ffc 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -8,7 +8,7 @@ VPATH 		+= $(I386_SRC)
 I386_SRCS=$(notdir $(wildcard $(I386_SRC)/*.c))
 ALL_X86_TESTS=$(I386_SRCS:.c=)
 SKIP_I386_TESTS=test-i386-ssse3
-X86_64_TESTS:=$(filter test-i386-ssse3, $(ALL_X86_TESTS))
+X86_64_TESTS:=$(filter test-i386-bmi2 test-i386-ssse3, $(ALL_X86_TESTS))
 
 test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
 run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index b71a6bcd5e..61d9bb426e 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -14,7 +14,9 @@ TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
 endif
-QEMU_OPTS += -cpu max
+
+run-test-i386-ssse3: QEMU_OPTS += -cpu max
+run-plugin-test-i386-ssse3-%: QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
-- 
2.37.1


