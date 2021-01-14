Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396E2F6754
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:22:38 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06KT-0000XR-DF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wX-0003yh-GS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wV-00050b-T9
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id v15so2851458wrx.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Cp3a9C7/BdIRTJGIoLIbx1et5cEfsuPE2mmaARPOP8=;
 b=Aquj1s9mnNW0f03WpPCTRtSi8g+yplYWHKT0ma3m8+kFHZq1PeNnzqbbleGJ+S1alI
 m0vJZcV4E7kqJH2c0fOeB1K+WjkOA26eXWuZAb9dHMIPvJCe+mjjdRdFVf4AxQWXEb9y
 0AdiCAX9Ec8MRO/1UDg1QJAjxZ6VysB3SvJbrnxb2kum12sAH1xR97gO1uqfZcX8D3Rr
 JYpwjG4Gv0f2Jx28QVVAMDz72fv06t15JC++LQAEOnnWp46A20wzwr5YJ+8zqroxcXdy
 w0VJptoNV7VMWromTBpXmdP3NZsIUT0yeNyfGS37UdoIgzyCxfCNDPG1WMXW23fZoLhA
 +8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Cp3a9C7/BdIRTJGIoLIbx1et5cEfsuPE2mmaARPOP8=;
 b=RDg/EqQYMGFVyGpVe8Az8JCUvMashS/GlovC88NAQzoYxM83B5hAVd5ZLwHRWC8bRV
 9tWUkSMn5Qc6oVPCWb064wLeMf0uYG6hgINGUhU6J5AQUOmdEv0zRVB89RcC0Omp9gt0
 V6h1Qa/3hxTwsTln2/4TVakA6/nbXECe9VKfW+tnDp0w++ANi/J6cCTmr+nIWBVEOSzX
 sTc6hLoHMIJjylgqqtZtkyVRHL99VT6EEvbAPb+8ulIvRta8ZOTngP91AZdUWSwqW1Ub
 wJfWr2SLiXYBvNuq7F9STNhxshP4L5LkuN8uQ3Nxuj3O6EdrvUg65Rb3VQe1pPtcDYk4
 lKPg==
X-Gm-Message-State: AOAM533h8tcU34TSAlQZCKB8C/tUVcY709JUOoLMUIV9te4wtjYizwnS
 FJyHnkV8NwBd/7p1krXjh1EigDQm5dYyLA==
X-Google-Smtp-Source: ABdhPJxUDIlqplcppAx0zh6xKK3Sh//VA5mZTWNCxC7Os84iEYL2Hm8A/8W6bKQzXKHkciBDkexg6w==
X-Received: by 2002:a5d:40ce:: with SMTP id b14mr8742333wrq.350.1610643470726; 
 Thu, 14 Jan 2021 08:57:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g18sm4904881wrw.61.2021.01.14.08.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F1831FF9B;
 Thu, 14 Jan 2021 16:57:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] scripts/checkpatch.pl: fix git-show invocation to
 include diffstat
Date: Thu, 14 Jan 2021 16:57:30 +0000
Message-Id: <20210114165730.31607-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this checkpatch keeps complaining about new/changed files even
when MAINTAINERS has been updated. Normal invocations of checkpatch on
patch files rather than commit IDs are unaffected.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88c858f67c..e47ad878d8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -399,7 +399,7 @@ if ($chk_branch) {
 	my $num_patches = @patches;
 	for my $hash (@patches) {
 		my $FILE;
-		open($FILE, '-|', "git", "show", $hash) ||
+		open($FILE, '-|', "git", "show", "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
 			chomp;
-- 
2.20.1


