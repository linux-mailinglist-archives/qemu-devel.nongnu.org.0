Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D055853AC75
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:08:31 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSli-0003Yt-To
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj3-0000ot-Br
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj1-0004wJ-Jk
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:44 -0400
Received: by mail-ej1-x634.google.com with SMTP id f9so5457837ejc.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Y3nXccyGYxXRbjNu5XWgdb5X0W38nFNWP9eUzzltTw=;
 b=YtgeWxhB1avB6tRhdnECLvQCdo2pmtxmp5jvSyC0QrxNkLX46zIz9AdwlDaqIncBQ7
 oPG6FwNCdyAHMJWQcBniC4u1sfMsklNGJi1bUvW+1SY6iWHZywHbuRIBGRCaVviyjGoT
 rkS7VcU+4n+0eKB5F/IrKitiIf2TARAIYtBGtC1qjbx7dRnqeeVEwjBa3ex93UhQ2Cs+
 vInUj7lmIjjhzXnDIIUy5Wk+mDmxEeAJIgzNqMmNChjEZZVsfFlfWEJjAjNJ+4NyiLdf
 +/zEzPKchDaew/uGFzp/xagbMsfKAK0b0YtmZXo8x2WSQV4W6DRcRR6051ISJCiPmTKN
 dZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Y3nXccyGYxXRbjNu5XWgdb5X0W38nFNWP9eUzzltTw=;
 b=kHJ4ltzSKl9ZC2E/i5me4JMCsovW5GATFjjjeb0vgjRglHz8ZJSAVpnJ/keTstgXM7
 mcvaawX7kRe5aA2pd1lX7XjfdyflYZk7PunZARLy21FZDiZwstErBL0hUx1ZELS5NHW2
 jAxy2h0Xabny4sBOkLOlotBBd0ZpB3pt6CJbj7zvpHSADnlktRGYG4ak7212K6Qa20KQ
 /PVDzRSZ7QYNH10ry3efWuOJIKY/tsRFvv+hPit5hvVWq1zrnOHHTJ41H66EvnGN3+pj
 5xbnGn5IPKBvBMkUptuSKFKeUcziCFnDwX6e+LokNKQLf6kO2FJpts1p5IfSjugxCJcr
 UvPw==
X-Gm-Message-State: AOAM533ey+uJ2kOs32cKOmgYGJPMe3oHeOrfEdM12LGRp43sy1Vw/IgF
 iC2Q+YVx5z9vzJ5sdqngsCoiDw==
X-Google-Smtp-Source: ABdhPJyE87NJHAKEpwKEJlr3GwVEqUC/tc4qXDs07C9J9Dx+soBmGSsR2MDyyBNQXD+yW6U+6C+5aQ==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr678989ejc.600.1654106742204; 
 Wed, 01 Jun 2022 11:05:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa7d60c000000b0042be14040c1sm1335900edr.86.2022.06.01.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E49CA1FFBA;
 Wed,  1 Jun 2022 19:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/33] .gitlab-ci.d/crossbuilds: Fix the dependency of the
 cross-i386-tci job
Date: Wed,  1 Jun 2022 19:05:06 +0100
Message-Id: <20220601180537.2329566-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

The cross-i386-tci job uses the fedora-i386-cross image, so we should make sure
that the corresponding job that builds it (the i386-fedora-cross-container job)
has finished before we start the TCI job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524092600.89997-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-3-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 17d6cb3e45..4a5fb6ea2a 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -62,6 +62,8 @@ cross-i386-user:
 cross-i386-tci:
   extends: .cross_accel_build_job
   timeout: 60m
+  needs:
+    job: i386-fedora-cross-container
   variables:
     IMAGE: fedora-i386-cross
     ACCEL: tcg-interpreter
-- 
2.30.2


