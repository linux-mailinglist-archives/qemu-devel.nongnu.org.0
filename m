Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AF3D05D3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:48:47 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zTi-0003PI-UR
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFq-0003p4-Ar
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFo-0001dU-My
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so2411774wmi.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MvUGt6vQHdy9HteqdADh89acTkqe5u1EUBQjCzZP5pk=;
 b=c6Ttqb811QEdaoqHZajDQa6DibzfdnvvgFLBazQwrGBycP+pyd7WNiyebFenJzIF45
 7bw1Y1CBrLGwEOo5jkPCyqW7MOF6UQdvEYqiUqjqBiI9kNfokFXewbxkUFV6i67wuae8
 TBuMKhKPwlhwtmA541uk4xNyR7N3J5NclrF1OSYGkI/DgAEDhPzjoofOt/4c55XFIcHl
 zJCDuToXD609M0SbkNbmCHiOGglL+e7IxcVGbG1yT/AKaQmj4oXFt8m/6WZcNocn1JBl
 A6IYQ7WPRk0SAVkSGyaWAdoENIYwa+zharKCo2J+xtx5Eof3UpdNRTzhzhAKcZkcb+Ai
 JvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MvUGt6vQHdy9HteqdADh89acTkqe5u1EUBQjCzZP5pk=;
 b=djp+QGqNM/00obXVoMJoE5i9M7274S+8T4PzWZb/mez6ClQ//ftV83i4WexY+ZV3b6
 5ewbiGKeW7CSR36CgTdSHvPmh8knYSV7UYZyvrIcyFKBNDe1X/70N+Fq3ewfzX/XPTxk
 LMeyB8na6UWixIaf8FVr8s0S/CqFi5E8xh5Mid9NWNornmzxmuli3Lt4Clx67+DSnb5M
 b1RtVIFLUSmuyrYxqjr5kdLbPpeYA9mB9wILaSx0FAdGSvcDSzrCrLjIGsAqMd0tWpUE
 8+58sAKTGCv9UceTlqPPsAskohlx2cURc/8aXkGK/duQl53U8kcH8VuqJZPJwnYRacAC
 h4Ew==
X-Gm-Message-State: AOAM5301IDG6Ii35jSiSqKAf2jIP7j620s6tPAk5Vs+Pj8h6/JgdlpVS
 VWKxqX/B9q4sQFMpeBl9ba/rlg==
X-Google-Smtp-Source: ABdhPJx7xUqrPlpKIbNh+iTLGEtG+X2fVlHvGPeLSX0XVJ7FiCp+q+7Dl4SIU+Z+/BHD2VsjicK9aQ==
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr891384wmm.141.1626824063136; 
 Tue, 20 Jul 2021 16:34:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm26214061wrl.8.2021.07.20.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 918A11FFA6;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 19/29] contrib/gitdm: add more individual contributor
 entries.
Date: Wed, 21 Jul 2021 00:26:53 +0100
Message-Id: <20210720232703.10650-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 f4bug@amsat.org, Chetan Pant <chetan4windows@gmail.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also ensure Li's canonical gmail address is used.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Li Qiang <liq3ea@gmail.com>
Acked-by: Chetan Pant <chetan4windows@gmail.com>
Acked-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210714182056.25888-22-alex.bennee@linaro.org>
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
2.32.0.264.g75ae10bc75


