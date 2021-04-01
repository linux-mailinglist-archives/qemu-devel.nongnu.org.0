Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC33513A2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:30:57 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRubI-0007cH-Gv
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWZ-0002kw-Ic
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWC-0001kd-PP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so1272350wrt.6
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opeUC5C6r1uSuiB1pagYN0HxujmEfcF2QxH/SrfIY8s=;
 b=ihEAYnp5QBgAqTxahQhTM2GAusz0DEWk3xQQdy9nGKRe9profCKb2icMuF3Ilz3kd4
 Nn5BQEiNqMjTr9Elc3+z9FNpbI6/+ZbRN0lV0Zdx9Q9m0ecBU6dQD7BdLtLYiRqXJGX2
 Z49lqrFJsGasSQR+rNc8jnqL4ReC1LZZqQZ5fJsmH6FOvwcBs2NwPY6oyTnIbA0o2sVh
 ua1Cj69Ba16dUM/fp5D4c88dPQVzUksHUkkgq+gQsE+zs48kSg2bZz1pzw5PYTObATQp
 k1wANjfQuhVVfRkjxy8o35eAdBK2gVIUa876oI8zA5/IlNxzQBvGekkrhbaBreZHsBrs
 Ho0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opeUC5C6r1uSuiB1pagYN0HxujmEfcF2QxH/SrfIY8s=;
 b=IeOXTV84lL1bqeVlvVdU7kERMGqc0s6winSNL2ixwdGSTL5mUau9Yo/kGO1BUIQgVM
 5ho1fID6GCREJbyMUvx18DbCe24DOuDZGyQe/Efk32j2amZFQi5UdyVr2Hxj9Sjmx/jD
 sRY94WfwTqDEk8GHo8AR3p8B2T3i93DXHdjYh/ob0s2xVAKiMnCEodJB6652SenljHTI
 NHLShVfwZ9ou7uCHO1OoTIJ1G5CErLw2M+VXlgSyBYNAR5MnG/jTC6I8wKPeZdzo4ndH
 w3X1yN7vXfzW/QT1POlpYCJEBKPAjk4rfpVP6Z+V9l6v9LDgmLXYS0YMh0Ppm7oeTp9E
 nrzg==
X-Gm-Message-State: AOAM530bGutZYxttJeYiqntgth3DQDdBKI9y8oy3EGsu9NfvmvfRdllD
 vPPjqx0L4V9HbyUl/QQzq+QB0A==
X-Google-Smtp-Source: ABdhPJwKgj7gjs28xQy/ASVIeZgFzd3zB+MD5KlA2kbga/5O8OQ57NsjpdkrSm1IxG8lsAl731DpHA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8749557wrd.47.1617272738509; 
 Thu, 01 Apr 2021 03:25:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l6sm10266300wrn.3.2021.04.01.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAF951FF91;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] tests/tcg/i386: expand .data sections for system
 tests
Date: Thu,  1 Apr 2021 11:25:24 +0100
Message-Id: <20210401102530.12030-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer compilers might end up putting some data in .data.rel.local
which was getting skipped resulting in hilarious confusion on some
tests. Fix that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/i386/system/kernel.ld | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/system/kernel.ld b/tests/tcg/i386/system/kernel.ld
index 92de525e93..27ea5bbe04 100644
--- a/tests/tcg/i386/system/kernel.ld
+++ b/tests/tcg/i386/system/kernel.ld
@@ -12,7 +12,7 @@ SECTIONS {
 	}
 
 	.data : {
-		*(.data)
+		*(.data*)
 		__load_en = .;
 	}
 
-- 
2.20.1


