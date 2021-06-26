Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EF3B4CB5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:04:31 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0UX-0000ur-Tn
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TH-0006kq-HL
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:11 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TF-0008CU-TL
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k6so9101200pfk.12
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bbklp3w91AZnxV0DVY+ehnYj/Fm0IUkDRzdevgcjq84=;
 b=OohdtbFMvTiNxf2kloSKhqZFLh7gyP9T++6HSX+QMPHqdV+EyaAig7iYcFWn/47sFZ
 gymwhZM5k/1Mw0xLQOr6GpUq1HTzzWqlEy2vDuP/CSGQ+TmQGqqkKLLO7diu/VaoIXV3
 eRXzwkVI6TmJxgU/v0ZuxVCGc+u/qt6lMXeDnzOAx/5855nCX6EURMXMyswU44MNXRmq
 /jdsa080N9RPDL2fwvdgbDqc4pepirMJyXvNX9Ytb6/VxOLP1qqKx3Lm3gLRZ6JZy7Hw
 4oTf1YLyZoicYGdRn4Ci4xego4PUon0pLOtkAe9pz/wDH8j57gpcV3rfP+Ie71rD7X02
 CESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bbklp3w91AZnxV0DVY+ehnYj/Fm0IUkDRzdevgcjq84=;
 b=UgkyzKHMcVePMchc5tXUeFR2kU3/qQZrviNmdX+vhoi8nhEb9jwVKszYWckaz7rNwp
 DMHPo0z6QJqq1qnbId9Ps00oMimM1dGqCfTwvVLHqfvTa2UINVwac6U1593ivsWK2FYm
 oiSGgY9bNSZkIuvHucnimPuv9jshcJMR8Q/FiGzY0J9ZiLF84T6p96uxnBdbzOgwUAVe
 cIzDuiz9GgK7vf1gSTz6QjS3+ozLzPsSP9vy7iE5g+bAO3nAzH/qDL+nAR4lKC7HxjTy
 pWpTlt/kzPI1/IuH6WhX5Pbyjhri11pzmWXZ+noASviYkAFgB0pOW61DyI71iNoUnarY
 RCIg==
X-Gm-Message-State: AOAM531TBjxA2ZnGP03dO0txCP2C58Vi9e2cbZTcbL1FRwH1hDvOCM9w
 kJKoN+BE3k3kzpqyB6H6kOjVhT66YPm2hw==
X-Google-Smtp-Source: ABdhPJzSSEofF8uy++mb15c+e0QaXbDxY/77DtMUgUHpH+PrbeSqn7NvMhEGcAp4rbzDVE1WNYjinA==
X-Received: by 2002:a63:5a47:: with SMTP id k7mr12799222pgm.9.1624683788622;
 Fri, 25 Jun 2021 22:03:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/16] tcg/s390x: Rename from tcg/s390
Date: Fri, 25 Jun 2021 22:02:52 -0700
Message-Id: <20210626050307.2408505-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

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
index d8a92666fb..e3677a2fd9 100644
--- a/meson.build
+++ b/meson.build
@@ -258,8 +258,6 @@ if not get_option('tcg').disabled()
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


