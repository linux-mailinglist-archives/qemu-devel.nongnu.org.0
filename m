Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9296510EF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jco-0001L2-4g; Mon, 19 Dec 2022 12:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcl-0001Gm-TK
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jck-0008DI-Dh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id o15so6898397wmr.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPCnaiFp/o2NqOTQwYWhzNIl62iAeoVZZkQOuLVC7VU=;
 b=BSYmtVFSCObRazke2J0XPBMJxLhmT7pTBCy2XQfcbfq5Cvd4hYI/Hdg+kQKGALn14n
 SwTRaBIQmHk81S1SGYRUcO0sx8Cyh+mnKk27XYZvIbpk/YDX+FRKAw1otocyhOyzZvZg
 IOb0++xZmwWUF7GH1GhRCs6MM3ogE7HiC/zyoGVNiL2cbreB04DXbEzRgdk3WL6cnadt
 JWijh7uAGc/v3svdnxXsz10N91ANQguY1NH2/czEyHKeVxRUIUOvFrH9o3V6C5bvtyet
 XU2Gu5fx4eaNepxNuhJ4M0V2U7Aspq5NDIgTCDegi1aSFssnUsbAMFlG8/LOqf8dxcYD
 2Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPCnaiFp/o2NqOTQwYWhzNIl62iAeoVZZkQOuLVC7VU=;
 b=hp3ca/I2riC9G4i9R+S97lNFb3uDgw747X7B0/jHl/TInaDatZ85uURyo3XqfYU2Ka
 qjFuUK+l0zlo0iPUG/mE34xkGId9kUmS+Px2Uvp9q78wN6exxy52tRO+31p/uM83B9ea
 Zyn5dlbrGw2poWJLpMT4j8opIwct4ko6Nb9uhNerbu1sIW9MGHEHIsteHH8bLKneMAjW
 ko2wXAb3W8xgLQm5mzBxeeXm6dcnyFWQFhFUN6xL+WUKfxFCl3h3/4cKb31J6uqXgrJk
 hZ8XrVfE2AegC9Bp/OdS1DpiS7LqRwUt3KrcXsM7+JXQK4ihnjfVICknv6xTCKLEc8zu
 FT8g==
X-Gm-Message-State: ANoB5pm3sXb5Ooei+S9eIUKkHgGi9nClEU4X0nHsa7bGpytlRcROIBSI
 rZWd7ku5o+eeoxDpSkIKV4UAae/b0TIfKpnM23s=
X-Google-Smtp-Source: AA0mqf7r3hqXcwkL5t9CbjBT8YWvFOswpSJCixjOHk7INyGs+YUMG1C8kOjip/3t34RsQRepx9WCBw==
X-Received: by 2002:a05:600c:4fc8:b0:3cf:b067:4142 with SMTP id
 o8-20020a05600c4fc800b003cfb0674142mr32775937wmq.4.1671469700452; 
 Mon, 19 Dec 2022 09:08:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm22247214wmq.2.2022.12.19.09.08.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 09:08:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 2/5] tcg/tcg-op-gvec: Remove unused "qemu/main-loop.h" header
Date: Mon, 19 Dec 2022 18:08:03 +0100
Message-Id: <20221219170806.60580-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219170806.60580-1-philmd@linaro.org>
References: <20221219170806.60580-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Added in db72581598 ("Include qemu/main-loop.h less") but now
I can't see what is requiring it.

I checked 'git diff db725815985..origin/master -- tcg/tcg-op-gvec.c'
to see if some code was removed without removing the header;
I haven't checked individual commits.
---
 tcg/tcg-op-gvec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 079a761b04..aacedd3e15 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -21,7 +21,6 @@
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
-#include "qemu/main-loop.h"
 #include "tcg/tcg-gvec-desc.h"
 
 #define MAX_UNROLL  4
-- 
2.38.1


