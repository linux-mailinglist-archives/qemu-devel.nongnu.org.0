Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D9278E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 18:29:06 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLqan-0003U1-Dv
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 12:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqVJ-0006RJ-4z
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:23:25 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqVG-0006n4-EQ
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:23:24 -0400
Received: by mail-wm1-x341.google.com with SMTP id e17so3636916wme.0
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4J/ihfjud0tiL/YgbEpbNjAusuDSDtTtmByqn5ExUo=;
 b=Ly51b0niAPdRMoO9pFuqtLIZV7yDCrCyGQaaCQNb8Rj0SiaYJJMn4/7IM+hGFFAi0S
 9/3MBB34rS9Kpang7iFSXoZm7RnPQkNMjxEp1YtwrhdcrOZtOtyjFrv0tDJO+D4k+BLY
 14BHQeSSX68yKI+ygYkqBMsCdIud6CYFESE/2VMcf0clA04aMgA33DjFzqGRYEuFzQ7T
 jLvcOh9Zlk9/59IcuISbes4Y0mhFSO2BrAHIkZBGBhp+ONOYsHuEcq/SIWaQyo3R5zEe
 3jNsrntJY35yW5CHNl/VowQsBbTTr5WtCDuiM9DoywPgdCIxuW3tzodk9Rrl8FeWfkE7
 KtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4J/ihfjud0tiL/YgbEpbNjAusuDSDtTtmByqn5ExUo=;
 b=Rn0lCxB6WlJw710Czxl39El/La5mQWuwgsgX9sBDoiNcu/ZOLKUS7HXmEkMQ2Y1/H4
 TZY3hLiE9KZ8sgWXdQYpyMa01qq8sekI8KTgeXYqSireA9eGUtd7goap0d25g0ciyRS1
 DPYNbL+TvQ9bf7LmlriH+CwAmmyiylSnWnyTT0SnyDTxd6KFNvYk3KRiazuTGUsdX8Xj
 jnuTNhk8G2D89diNkO2N1EjE1TTllKic9L2LZ//4VzfMVbmsV0sLE+SKEqxcre5riegJ
 spkWGsFzjKZn2cJZyOWICuDfNH9Opa7IdlaqYZMb1Gms6CRvB36KRPUfyQUdco6cdhMx
 fPVg==
X-Gm-Message-State: AOAM530KTWdW0ZCHowjZ8+pNlWCmv54pdA0q6iKkGbvh1WkMwS66+Dd9
 a4zOxmIBpLDFQtxZ7f4ScY26udBK5MgNCvWl
X-Google-Smtp-Source: ABdhPJy0nKQ5ZSNNamO7SIg1g+TOg4lVO7fM5iGWxgVAkuilIEFlcAAnQvuSPCp6XB0qRltN3Q6iPg==
X-Received: by 2002:a1c:800f:: with SMTP id b15mr3793482wmd.114.1601051000539; 
 Fri, 25 Sep 2020 09:23:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d6sm3565824wrq.67.2020.09.25.09.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:23:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/21] qapi/block.json: Add newline after "Example:" for
 block-latency-histogram-set
Date: Fri, 25 Sep 2020 17:22:57 +0100
Message-Id: <20200925162316.21205-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925162316.21205-1-peter.maydell@linaro.org>
References: <20200925162316.21205-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The block-latency-histogram-set command is the only one which uses
the Example/Examples section with the first line of the documentation
immediately following the ':'. Bring it into line with the rest.

This allows us to avoid special-casing the indentation handling for
"Examples" sections; instead for Examples as for any other section
header these two indentations will be equivalent:

Examples:
Line one
Line two

Examples: Line one
          Line two

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/block.json | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/qapi/block.json b/qapi/block.json
index c54a393cf3a..a009f7d3a2d 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -528,7 +528,8 @@
 #
 # Since: 4.0
 #
-# Example: set new histograms for all io types with intervals
+# Example:
+# set new histograms for all io types with intervals
 # [0, 10), [10, 50), [50, 100), [100, +inf):
 #
 # -> { "execute": "block-latency-histogram-set",
@@ -536,7 +537,8 @@
 #                     "boundaries": [10, 50, 100] } }
 # <- { "return": {} }
 #
-# Example: set new histogram only for write, other histograms will remain
+# Example:
+# set new histogram only for write, other histograms will remain
 # not changed (or not created):
 #
 # -> { "execute": "block-latency-histogram-set",
@@ -544,7 +546,8 @@
 #                     "boundaries-write": [10, 50, 100] } }
 # <- { "return": {} }
 #
-# Example: set new histograms with the following intervals:
+# Example:
+# set new histograms with the following intervals:
 #   read, flush: [0, 10), [10, 50), [50, 100), [100, +inf)
 #   write: [0, 1000), [1000, 5000), [5000, +inf)
 #
@@ -554,7 +557,8 @@
 #                     "boundaries-write": [1000, 5000] } }
 # <- { "return": {} }
 #
-# Example: remove all latency histograms:
+# Example:
+# remove all latency histograms:
 #
 # -> { "execute": "block-latency-histogram-set",
 #      "arguments": { "id": "drive0" } }
-- 
2.20.1


