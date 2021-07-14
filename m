Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E13C8AF8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:31:28 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jfL-0007mY-9q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVW-0003yF-9q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVU-00027e-Ib
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f9so4341473wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cEfuPtMs2ZH3PybJzkoTJn+5ifkrQAPmmIizSz95XgI=;
 b=cRnPz80/gX7bIv5pAx46zc4dBtrm3tutolCKWJ6OUM7giOAsnRUWSc4gTB9YtlIpIA
 xJH0TEUb3OMpoGEDbhtJKQdj79/n3Segf9mOiD1wRZ0lvgt/nva/74wloa+0UwHbB97O
 PxFAVgVGmCVZfAG0gfVwsEIpIgctuO4P415uNzmPgX59ekbFlniwszNqjhvEWmfa47cW
 KcuGni5dS5wk25Ok4TSaqUc7j4mhxPSX0whM2flHSSvKXanDm0z6IdXCJQXAg7C5y7I/
 2HFgYKRTAnmaKXFPYz7aQ1ZFWPZiF+v7uv5g7ZfZifOu7AMBinJ/AoSj1QEThYSalwZH
 xXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEfuPtMs2ZH3PybJzkoTJn+5ifkrQAPmmIizSz95XgI=;
 b=YZJo5/KRNQ3U9sNCGsfdNl92ye2J8154eQj1oboCcg7tCbHffxeOIbNSI+JGIPDwf0
 8OX+IcjwVrT4kwRLYvD9iD9c+F+o90tKytNkb7MjOoHul5HLUqKcr3VvaYj+wafc60St
 gTkw6hmreKamrQNlTGc6/st4kNv8ppUPMjGEWbgZIQ8oNk5/5Upv7zGiYJV5yvi7oeeB
 dYlg2mpJ7SrsDnPZLmue1py7uV0qobH8gfhxyFyeaCFrvDwLBiLwya17eE1sxLno3/hR
 FRIbss1cQB8xVV9YIdYrPSziIXe3ngZbwXUhEKfNeZIMnyrY1AAe7mXYdmbhyzsO5z0j
 us6A==
X-Gm-Message-State: AOAM5307UN1K9Kmd3A/d8MPcrwas0OiGBQTno86CNAuHNLbhvr/PoeTI
 HLVBTvZc++UTfatI/iWsUtJhjg==
X-Google-Smtp-Source: ABdhPJx9MYtvmOZr+c5JJXLpwMRSg4ZCXfjgeXrDDBltALUtbhMjginhamMrnWg2PSJI/2gcrZ/50g==
X-Received: by 2002:adf:ef11:: with SMTP id e17mr14891805wro.71.1626286875200; 
 Wed, 14 Jul 2021 11:21:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm3665804wrw.7.2021.07.14.11.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C32401FF9B;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/21] contrib/gitdm: add domain-map/group-map for Wind
 River
Date: Wed, 14 Jul 2021 19:20:47 +0100
Message-Id: <20210714182056.25888-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Ruimei Yan <ruimei.yan@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per discussion at:
  http://patchwork.ozlabs.org/project/qemu-devel/patch/20201004180443.2035359-19-f4bug@amsat.org/

I've added Bin's personal email as an individual contributor.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Bin Meng <bin.meng@windriver.com>
Cc: Ruimei Yan <ruimei.yan@windriver.com>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Message-Id: <20210714093719.21429-13-alex.bennee@linaro.org>

---
v2
  - moved Bin's personal address to group-map-individuals
---
 contrib/gitdm/domain-map            | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 2 files changed, 2 insertions(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 41875c9e75..27b8fbdf8a 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -34,6 +34,7 @@ suse.com        SUSE
 suse.de         SUSE
 virtuozzo.com   Virtuozzo
 wdc.com         Western Digital
+windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 4ac2f98823..9b6406e624 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -30,3 +30,4 @@ huth@tuxfamily.org
 jhogan@kernel.org
 atar4qemu@gmail.com
 minwoo.im.dev@gmail.com
+bmeng.cn@gmail.com
-- 
2.20.1


