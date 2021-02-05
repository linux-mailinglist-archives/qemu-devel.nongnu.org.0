Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459E310CA5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:46:53 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82No-0004GP-EN
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Kz-0002Dg-G5; Fri, 05 Feb 2021 09:43:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Kx-0002F8-VE; Fri, 05 Feb 2021 09:43:57 -0500
Received: by mail-ed1-x536.google.com with SMTP id q2so9092338edi.4;
 Fri, 05 Feb 2021 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MuD8YH8lHXlIxKXXmwlYnLHbV+/5tH7GQop+yQUZbaM=;
 b=UVtaku4poOccipZPXArt8FJrAo0tP+JQ+UJCfKk9EcrQXamQ3Y8rwUPGExq3yo/0ri
 su5oboHhT+O4yIzBrmO7iRLiaYkOGi2Re5XCuHqs453irTe0g9FKQR/8T81KZhbeDT8O
 nik5djKfjs5Qs25uDwg3OlrmtjXHbtN1YhTOGk4qsjLhwr7hxsJ/70PndDEltiWaTobi
 Q+7xSMkWEZ9kPxwxT1se+7UbmN5txuYmSto9eM4UV9DheD4hyIguExwI+uMpqF2caK+H
 qr2G5SPpBRTHhTol24SGT1opEWK9jCO8aPmaPDpx5+KkG+r+4c21V8X15tF8SYzLB6zb
 RvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MuD8YH8lHXlIxKXXmwlYnLHbV+/5tH7GQop+yQUZbaM=;
 b=q0M6W8tCOZbRYYlnlbqZ+0FYwGHpgosYAnt85tvWXK/JYgpJd8z97FEoQp1QmB7+Dy
 ZdILRteSsoYwRJUTC8GQXlHp8cjNwrvvEGW1/pYr2TmevxsLHvNyVvyUFIz8uylyyjva
 tVZJG8fufvJ3tIFMy0/aEU8KQWQeMpP/fVXy7hVC+TUqUIoAsMdvsBELpu+KmaBFc/dL
 uynI+nrTTqTbfqzs8rBgYrR8mo36QdrXwIFX9DMFZVOLLBW35ZaJUfZKel0J/h3P4Ehy
 MPH/M13KPU1A6O0VwSNLVcoTVH8STE3jtAxvThY+nJu/5vCDvHRJ+3zFKiv5NmdBJuKY
 eCxg==
X-Gm-Message-State: AOAM531+0M5psoVpIZt2exBtAJEeSpXnfFmp4YbJRKLoX2NnclAJu3+Z
 oVrV/TNJkchrxTxL3JBu5qfeBmQR7Xk=
X-Google-Smtp-Source: ABdhPJy2Tz/Vu+jSec0Y9r7HLzwWZw8Eah5pSbB0YNpLaExd3y3LunZpElvmz7HFVGcWuJcqczuHtA==
X-Received: by 2002:a05:6402:40c4:: with SMTP id
 z4mr3807226edb.233.1612536233607; 
 Fri, 05 Feb 2021 06:43:53 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q9sm4009547ejd.113.2021.02.05.06.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:43:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
Date: Fri,  5 Feb 2021 15:43:37 +0100
Message-Id: <20210205144345.2068758-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for ARMv7 has been dropped in commit 82bf7ae84ce
("target/arm: Remove KVM support for 32-bit Arm hosts"),
no need to check for Cortex A15 host cpu anymore.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/arm-cpu-features.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..c59c3cb002b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
-
         assert_has_feature_enabled(qts, "host", "aarch64");
 
         /* Enabling and disabling pmu should always work. */
-- 
2.26.2


