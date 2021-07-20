Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149D3D057D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:40:24 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zLb-00038U-3I
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z95-0003nF-0G
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z92-0005lT-Tz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c15so171179wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8utA3ukFhLa8Tt27+G3uW9540CgGWarpP5EcemjNfI=;
 b=cMFnYOrsu6k0WjI/J/Ymm8qOTaz97ynFyP6yDx9B3ZozHcEQ8xH+Njxwr45mXDsYg5
 d5HnpgKYkPUsaWCD4R03aVwWnzxdDdeO6hbKSMmvStDaeTjSJ3YpdlfYqfyMqXIs7qf3
 O8dIm8YhZlSJ8RmX24pg3fIJUlgDKRpz3OVeseIeljsFIaESWaj+9yPOzO25k96kxkvv
 +2eqca06z6tFZS0WarBcdrKVxy/waeU45t7NhlZfDS8NeEOD4+tt5q0fy5ayj/J0jLUz
 nAi08E2QvgFnSDoDPnEEImuNbNzorRYxcM0ymgPd0ZGyCce2rcJyCDXOQXka5nZ2Y+2f
 3pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8utA3ukFhLa8Tt27+G3uW9540CgGWarpP5EcemjNfI=;
 b=giPNZzfcF/gvWK0Elg4VlRXoK68JUQzA0Lgm8hqtU9CXDdgm+pwTNjNAi+tQ1MzLHA
 v70o7sIGuGV2vvo1RdgVk5xlEbjEFhVbUoxhY0anb0m4RQxzNG7EQU0aRbmTD/eWXWNK
 FWS+lKCSafSnRxH/qV4cAmI39y3IQ8Rltc7/AbYURWupdVTAmxX+ChxMKFz6t7rCej9h
 OE12FAgTLdExHTVkIBQHeFEervUnawZn/1FtINFSrikpw6aRc1TzzngqT/aMjCzI+EeA
 9iMSwg/vgD0YVl0ArWzC3ulZxQQefLR2kBRmsm2JxKIA+2tCh9xAhm6uXRGPMMIOCxCx
 XUEg==
X-Gm-Message-State: AOAM530v3+zpdykOg0gF+ylnq203YJwfGJA/RdW6TAvdYpCGHW39AA8g
 kY+V4Ls0ViK1GXMw5wOkPydpiQ==
X-Google-Smtp-Source: ABdhPJwotR/hjhoWnlXJMNkJfetO3T7i07ofxg/fZcJwwiioztCYPS4EA2DiGAiuLO/Dq7KEh8418Q==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr39562626wrr.108.1626823643389; 
 Tue, 20 Jul 2021 16:27:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm24211114wrx.59.2021.07.20.16.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E37811FF9B;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/29] contrib/gitdm: add domain-map/group-map for Wind
 River
Date: Wed, 21 Jul 2021 00:26:46 +0100
Message-Id: <20210720232703.10650-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 f4bug@amsat.org, Ruimei Yan <ruimei.yan@windriver.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per discussion at:
  http://patchwork.ozlabs.org/project/qemu-devel/patch/20201004180443.2035359-19-f4bug@amsat.org/

I've added Bin's personal email as an individual contributor.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Bin Meng <bin.meng@windriver.com>
Cc: Ruimei Yan <ruimei.yan@windriver.com>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Message-Id: <20210714182056.25888-13-alex.bennee@linaro.org>
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
2.32.0.264.g75ae10bc75


