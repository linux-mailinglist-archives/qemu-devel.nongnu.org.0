Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F484AEFEF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:27:30 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHl8D-0005YP-1z
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHl2x-0003v5-Ja
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:22:03 -0500
Received: from [2a00:1450:4864:20::535] (port=46831
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHl2l-00034v-Ko
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:22:03 -0500
Received: by mail-ed1-x535.google.com with SMTP id m11so4269515edi.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJkq9Ju39KsUpL747ow6W8ArRJVwDxPgiiAhCRO0pww=;
 b=vErm5g1Z7PqaJKLisDl1RtbII74yK/ycMjY/qHZnKDLI3VK4M27s0FkgtxABYF8s3j
 k8uQUScKg6gyWyGRLTgad8vf9mqcJOk6yHl67fQQCePzABf3YoH7QIueWKYAc97mN0T6
 D0J4Fj/3AdSsaxZUAC9pA9eac6Mgt0EQZIAXHlI7DWiKlKm2WerVfBz4qoyDp3qxWaWU
 FDZRiE1xgf6fLkurpQs8v+Zxb12nIh5v5CaFrUINEU9LhRS5peLzxoO64l6or1PfIxAr
 A4T+gqDWrmtHDRWJlrhSi2BUubBGJDHWX8EEQk4QQjyF4FYOjUXgWceX3G0Hzvyfppci
 x7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJkq9Ju39KsUpL747ow6W8ArRJVwDxPgiiAhCRO0pww=;
 b=RoDqyXJql6Rt6+m/hSRHI0MGNw89mMYX3pvbmomhoSiXq4lbSkg4Kbm2RriMQN8hfi
 cz4xtE5mesDJhc4TqPSo6NUQmRZ/yCVgIOFwL4Tl2sEWiqWayddfFBeqY6RG+NA40Tzh
 simyqPfVYBuL2c4KmNhp5cJxi5cphTXzHhGgCv7Gfc4g0vUqT1RiK9Lw79/tISHCvPI2
 NrFpO+mJdxzSucNAmgUDl8r6zYPpMvts23qWZeDqpLqEPGUlGpSlzHO5yQe2Wqj7AEff
 Orwn34Y6/ZSctKofIjHOM098G4f2GnqA6jAyRIYJ77HmkPeBBt+1QJxwE4ukcJj5me9n
 wmAA==
X-Gm-Message-State: AOAM533DuUzYyaNgMNnu3YJrtbwia1xARdCFo2YjfP6C3g5XiiDppFZ4
 r7d0S6njdyOrafDoHtAoJ3RUgA==
X-Google-Smtp-Source: ABdhPJzF5cFdu64H5XZT7vhcQf9rY4rfeFu/TVWXV5BwjqZRzrnMiAiDbxpimmxNoJXIgt9/dmZeaw==
X-Received: by 2002:a05:6402:4414:: with SMTP id
 y20mr1892224eda.219.1644405708756; 
 Wed, 09 Feb 2022 03:21:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm5865948eje.162.2022.02.09.03.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 03:21:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67BF81FFB7;
 Wed,  9 Feb 2022 11:21:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	richard.henderson@linaro.org
Subject: [RFC PATCH] tcg/optimize: only read val after const check
Date: Wed,  9 Feb 2022 11:21:42 +0000
Message-Id: <20220209112142.3367525-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

valgrind pointed out that arg_info()->val can be undefined which will
be the case if the arguments are not constant. The ordering of the
checks will have ensured we never relied on an undefined value but for
the sake of completeness re-order the code to be clear.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/optimize.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e573000951..06213fd434 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -552,10 +552,10 @@ static bool do_constant_folding_cond_eq(TCGCond c)
 static int do_constant_folding_cond(TCGType type, TCGArg x,
                                     TCGArg y, TCGCond c)
 {
-    uint64_t xv = arg_info(x)->val;
-    uint64_t yv = arg_info(y)->val;
-
     if (arg_is_const(x) && arg_is_const(y)) {
+        uint64_t xv = arg_info(x)->val;
+        uint64_t yv = arg_info(y)->val;
+
         switch (type) {
         case TCG_TYPE_I32:
             return do_constant_folding_cond_32(xv, yv, c);
@@ -567,7 +567,7 @@ static int do_constant_folding_cond(TCGType type, TCGArg x,
         }
     } else if (args_are_copies(x, y)) {
         return do_constant_folding_cond_eq(c);
-    } else if (arg_is_const(y) && yv == 0) {
+    } else if (arg_is_const(y) && arg_info(y)->val == 0) {
         switch (c) {
         case TCG_COND_LTU:
             return 0;
-- 
2.30.2


