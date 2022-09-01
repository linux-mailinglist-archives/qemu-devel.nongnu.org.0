Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E075A9F40
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:42:05 +0200 (CEST)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp8e-0008Vm-5w
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosB-0007j0-0w
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos5-0008Jc-RO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+b4zc9nvreNqegjhwjzSVIRQBl57p4O6AR8I9loJeiQ=;
 b=DKOyb/lLt5tmjpmDPsyc7mcYeWDSMEgv7WzzV5nGjALJbWgavKVjT8AuTO007gVS3qw/bb
 96uHl6M5gO7HaL6f7ohsrMCSbgHrkgFWX1SIkMgk0rk0PpmS1XOcFELUGnaGFCN7kB+fXo
 MKO0X7F1bkihvhAt03/FTg33RmpOQz4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-Kgbl2wpBOg2GIEHbkBczcg-1; Thu, 01 Sep 2022 14:24:54 -0400
X-MC-Unique: Kgbl2wpBOg2GIEHbkBczcg-1
Received: by mail-ej1-f70.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so7268285ejc.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+b4zc9nvreNqegjhwjzSVIRQBl57p4O6AR8I9loJeiQ=;
 b=b39vuBlYB3feR7H+mouImX9GahitH5OdP7wZxVtIVFB0SFJ8B3isIgGJE5LkzQ5ay7
 o3yKTCR6gByQZ3BNHAGZGKiOJERAjsnnkJOMYh+9WI8jbNz+u4QoqUbbNx+gh3J83CUE
 ZpOaUaXubRJrism/p011Bo8KcUzVIH6vMEAn0SdO1G7zG4fotYCnKRqYR22i8aQfhyHb
 HY123Eg+SKqRPf2wypNuB9NRU+5e11z3XXuWPNrbAsSWSr4FR2+cu1b9Y0QxMmu1qfyn
 Dy5tXMSrEVA+cOyVheVmG/OcMGjDzv0idW0lYzpGNo3AH1d0Mh1xmyFJw2lQ4E4syztO
 N3vA==
X-Gm-Message-State: ACgBeo0OScq60IhKlLiuLWwvIS8DTNnhlLRB2shRy+qDkSzjXXTXoK2d
 1ucVMXKyP9Zh8XPKVHHLbgRfvN5wsWXH3iQi8YeBUFOxYitMkIpNf5CXTatinEHirMkhORgmYwh
 LljyfNVAh1DRhoPyMnp3IfeRORUWw2tn0Zr5p0YPrbSz4mdx6DpZOO4rJgzW+Lpt9btI=
X-Received: by 2002:a17:906:db03:b0:741:337e:3600 with SMTP id
 xj3-20020a170906db0300b00741337e3600mr21056869ejb.343.1662056692979; 
 Thu, 01 Sep 2022 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5q2iMNiGQslFMl8WjjURFQIMY6MPw4bpWaeG9J/1dTqtVWYi79bUNoH1QQz/x383AcXboZdg==
X-Received: by 2002:a17:906:db03:b0:741:337e:3600 with SMTP id
 xj3-20020a170906db0300b00741337e3600mr21056854ejb.343.1662056692642; 
 Thu, 01 Sep 2022 11:24:52 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 oz13-20020a170906cd0d00b0073d81b0882asm7320ejb.7.2022.09.01.11.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/39] tests/tcg: x86_64: improve consistency with i386
Date: Thu,  1 Sep 2022 20:24:01 +0200
Message-Id: <20220901182429.93533-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.37.2



