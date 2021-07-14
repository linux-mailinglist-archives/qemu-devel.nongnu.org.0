Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5713C826C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:07:17 +0200 (CEST)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bnQ-0004Ef-GT
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQD-0005CC-Ab
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQA-0000A1-DU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f9so2376707wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=993Z7YYGEEOBPgCRlt8+ZkIPHhNRNlEDDxS2FCW5LFQ=;
 b=rYjqB2gcMb29RxPyJ4J8aJ8CO9G4dRJ7kFX/RbifIQpZthbEk+P3R2gukqtASsEMCJ
 E/t7k/m1zLyMpuA50dLsqjJ8wgGZ06sBJBNv+EtpKb333iN7/R3dFdHGXOwd5RFrqtMg
 lvvrQ5VqNym1gE0J9UVlctQJYmDLoAMZRuQQ+/Qz0CgTzJJ3DL0Gar6wwpTR81Q7sH1S
 VVPctfyabu/FeYKrL4PNiUbeIMXHQ3ud223Q4Gzn4u2q6TjImOfEHt5K7qdRu7du+z7f
 jmcPHtSlTwcJBG/EIZtIAZbKKqSU2jSvv2kxYYEEUhrJvg0DC6TSTAopaZTM5SGNQT78
 r7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=993Z7YYGEEOBPgCRlt8+ZkIPHhNRNlEDDxS2FCW5LFQ=;
 b=kGGbDbRt1X4gek3DLRTCzh5GeCXUjJGSjWH6Vc3oiwAoOiK8JYtMGQnZxtsbt8PV8o
 LhsPd8sbdPTe95ds/WKABcqeBiA26WpC4G1b4hkyuzD8Pyx4s08WRoC9PG675sA/u62b
 Pzgb3dF3XKN1UTG4pK4AkIQKBBqZ59jfJMKzeRx/e/zD4LJaUjVFoLIViB2fQlox5QMH
 k+KlVqCwMjVi96leGM//Jpk4Z5tmtn7GINhZ/7WKEzxxi+ey6OG1WcPPUw9VaMK6q24m
 TnucEbNCrBgDpTwxYli1qN/E1cWtTE9nWINTrl5DSboDT93gW6+UjERP/Fbs0DdsYxEA
 GKhw==
X-Gm-Message-State: AOAM533iNz3zWYgaJ1e8vj/xqJ36gvcoa0wdNgpSwB9T87vYfD9paHi+
 /rDmpN72hAWA0a89gChsm4raoQ==
X-Google-Smtp-Source: ABdhPJxNTRDQiYI7IqUzxuIIMAsdxT/ieBtPhqovJI+lwpoGpJ9rSExk2rgs28tCjbb+7qQfkHt41Q==
X-Received: by 2002:adf:8069:: with SMTP id 96mr11791438wrk.56.1626255793153; 
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm1989331wrw.42.2021.07.14.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90A471FF87;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/21] contrib/gitdm: add group-map for Netflix
Date: Wed, 14 Jul 2021 10:36:35 +0100
Message-Id: <20210714093638.21077-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warner confirmed he works for Netflix on IRC.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 contrib/gitdm/group-map-netflix | 5 +++++
 gitdm.config                    | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 contrib/gitdm/group-map-netflix

diff --git a/contrib/gitdm/group-map-netflix b/contrib/gitdm/group-map-netflix
new file mode 100644
index 0000000000..468f95dcb2
--- /dev/null
+++ b/contrib/gitdm/group-map-netflix
@@ -0,0 +1,5 @@
+#
+# Netflix contributors using their personal emails
+#
+
+imp@bsdimp.com
diff --git a/gitdm.config b/gitdm.config
index c60ebc6e47..47317bcee7 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -35,6 +35,7 @@ GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-netflix Netflix
 GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
-- 
2.20.1


