Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE83C8ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:27:44 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jbj-0000qf-VB
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVa-0004EY-Ec
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVY-0002B7-N3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u1so4417436wrs.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCaNd4xCbOJUv0xEcYHrfGW6SVngssRwezattoH8sxI=;
 b=crMJU3TI/6zblXfeAcMXzTGN+sDdkzy24BX0a+MQLSClr4rUkGgBSdXKS9wn9RZadP
 O/GmxDUqSwWCuZWZ48LyO66v6acnnUWfue3If7PuqgGJ/dWgNzftPlAQ5mb0/b8neTn6
 ixcQRJG/B3b8AuZNg9bAkr8KzpIWf/JIxte53KPVQkCvIzPH6qMraWjLjAqAB5uGbVOs
 ktpGZALO+V7qWwJN7Oj0+nPq2BnNI1cFIo3ZLbNw3JudsSXU0DtMqWu0/MNVsvPWkso5
 X1zJYQSB/bjDhGNFtlwp+10aUIRQD3nCpMbUqzeQQDO/EVwuG92DMRbnnfr8uCLG0enF
 nUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCaNd4xCbOJUv0xEcYHrfGW6SVngssRwezattoH8sxI=;
 b=uaGR4Ig298L+MqVi6Ju1dR1lSukXDcUN0HeHyqpduSG8q4m2cQhgWqwWH1MqRFvLHl
 6Ne3Lx2eivruEwV+ydRJRTSBUW2ODtiLZ93aFPgblww5FlioP+NnDEL/fLRgzQCJPsgM
 Om5oheqOTASVBYX7BBpy391EKdIo1RcAvsVFaYtk22m33+BezeWC3H9pjvXWB12/Ms2k
 DQCY6bvRaBkoO46KLK7ZcMC5n5Hgblygxje0fU4KsWrIXWD15oAqo05iW7N/FyusLx90
 jHAta3lYY+HbaiosRElIFG/jXtl39XrZfO9+thqoma4B/BFuVwe2QjXYkCDvuondmGFV
 u+nQ==
X-Gm-Message-State: AOAM532BdPpbfVL6Wfh+bTupEKUYo7Cb/FCA8MkKIHFNo5WEKJdxf3Ca
 HkONlT+Bx5Lx+/45N9ACSwOU0A==
X-Google-Smtp-Source: ABdhPJx7mR4BrdPMrgNkgA4g12Wpzaj80wdw/Yk0wA26CJoOdqNyokn4Muy0+J+WiWI/urUqrbWyrw==
X-Received: by 2002:adf:9084:: with SMTP id i4mr14793015wri.23.1626286879443; 
 Wed, 14 Jul 2021 11:21:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o5sm1849392wms.43.2021.07.14.11.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D1261FFAA;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/21] contrib/gitdm: add more individual contributor
 entries.
Date: Wed, 14 Jul 2021 19:20:56 +0100
Message-Id: <20210714182056.25888-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Chetan Pant <chetan4windows@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also ensure Li's canonical gmail address is used.

Message-Id: <20210714100628.10460-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Li Qiang <liq3ea@gmail.com>
Acked-by: Chetan Pant <chetan4windows@gmail.com>
Acked-by: Akihiko Odaki <akihiko.odaki@gmail.com>

---
v2
  - dropped un-acked individuals
---
 contrib/gitdm/aliases               | 3 +++
 contrib/gitdm/group-map-individuals | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index c6ed215e68..4792413ce7 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -31,6 +31,9 @@ pbrook@c046a42c-6fe2-441c-8c8c-71466251a162 paul@codesourcery.com
 ths@c046a42c-6fe2-441c-8c8c-71466251a162 ths@networkno.de
 malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 
+# canonical emails
+liq3ea@163.com liq3ea@gmail.com
+
 # some broken tags
 yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
 
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 9b6406e624..f816aa8770 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -31,3 +31,6 @@ jhogan@kernel.org
 atar4qemu@gmail.com
 minwoo.im.dev@gmail.com
 bmeng.cn@gmail.com
+liq3ea@gmail.com
+chetan4windows@gmail.com
+akihiko.odaki@gmail.com
-- 
2.20.1


