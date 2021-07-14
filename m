Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F3C3C826E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:08:21 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3boS-0006GU-Fi
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQA-00057X-Ti
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQ7-00006v-Vi
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t5so2373516wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=993Z7YYGEEOBPgCRlt8+ZkIPHhNRNlEDDxS2FCW5LFQ=;
 b=iFl3MYUOBlgjQbNrBrfpopnj3G+A7bye7nzOLlL1zaqzwU4lR7O8Ym7OB4HUKHp92o
 C8wsmBTnpElw9eSn6nzkg3587dLJ2T26FRFjFxzOYuGmLpDZzgCID+wTI357lGetkGO7
 ScobT9E1fDeHDSxHtAuzq8kC5kjNo/EaURahEuW/YujRGTAAEiqoAENImNkAvsmIEHGS
 k9NWQtwK0NgQzuRS3eCVoX6UVqWbeXT5yD6Pc3EUe4RI0kuqbutUD+B0dPc8Iu3wHiuV
 PvXqkA8TNVcCnFjo/VPEhTFRb910QMSWjEXshzImoowWvBluUMyNvXPTAcETF/UrjFsN
 jZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=993Z7YYGEEOBPgCRlt8+ZkIPHhNRNlEDDxS2FCW5LFQ=;
 b=bHzGPFrYeuZF1j10YnIi5eKPYKXI1cCyfVVVudLCjgDMKdPQxauInruGcmvY23AlC1
 LGVhIEs8Hgh73btCC1kq+7oW//lYCNo5PlkW9HJyOUjElebW/Cs8rEfNJFig+SELWFDB
 1/u6S3L/NkbqVR7O6nz3HyiI1EgbiknwuIP4mhjFYMWcj3332ntRdFDEIDLrqPabJ8pk
 GelX7yej/Ke689jWbSXRMMIWzchRi/5rJhu3+P2E/K8Kq8YTieXKQAesTtG7gwXzZlz9
 BSv+Z49ZmVP2430743USshDqYDOnf+bEXxsVCGG3Cd3F/emDPPgGsIgm02pyv59fSUtY
 4zOQ==
X-Gm-Message-State: AOAM533O5jtEsbLYrP+ZoW4mbUbXiLkYyVkvuUOySGavswRgEzljg650
 ReXwvMKR98ayA7PDEUbnRPyl4PV/3ALjrg==
X-Google-Smtp-Source: ABdhPJy1DHh7poTlyyVkBu6BheI2jda5ToEw39c5d3O0yQnL6AQ66cIddYu4lMbx63Gr344KKLJH8A==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr11991194wrs.2.1626255788503; 
 Wed, 14 Jul 2021 02:43:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm1715558wmq.14.2021.07.14.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55EB91FFB3;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/21] contrib/gitdm: add group-map for Netflix
Date: Wed, 14 Jul 2021 10:37:16 +0100
Message-Id: <20210714093719.21429-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


