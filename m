Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3B3C8204
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:47:59 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bUk-0005IS-F4
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK7-0002J9-S6
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK3-0004M9-Nk
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id d12so2336008wre.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiNv7Ue8GGYrBSiQ5PWXjtcZoQbWRZS+IyfdTG4+yNE=;
 b=NNDePmaQbxW+BFhBsxeYejjB3AMJEWYYFVl1zskBfiISToysGx7KE3nJ+IFS/RwIxI
 shaGuqHbiDnEHyQqSa3T/jVaF/1gzGbjqYEt1PEwf0zN3tO673aoth4qg+o+1ajpNdLu
 TtM9qj0hImAmf/rVKEfJ6Sd7UDHtfVZuC52y6bCfeIJSqJW/6yN+vXGcip+bnW5RFAew
 Voga0HoYwnz6A6CzVSthWuRaB3WNXN77ALLLGHAzzGXVyy8CiOH6ZlMCesKEzHVFGUfB
 3bsEedhhdo054RCkxPr86ww4a8a45QsEwn5TiHEX50zcHnBIDVP6JkV5WKjOEyeown0d
 NFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiNv7Ue8GGYrBSiQ5PWXjtcZoQbWRZS+IyfdTG4+yNE=;
 b=lyGSae82J6iy5oOtsjouipQnbxX4nsUPsCS17OuSzzPgeia3D23UPMHTZ1YDzyEVYM
 OKb0BuGiKGOPAjkJsZvQooN6VC94dkLxkmsrjSy2XqNmCH3Sh6UzU3zYIfPXGW+tyReY
 1CRauxhXPsJc7DZPg0YkIJqW2mTWPoM2ORm0gMoHJZcyu551PwwP3DPmK8kybFUT/FuM
 6YGJZcaLsckgsFuHP5HrCAN02Wc7LcUHodJgP7VhIBxkrcw7Gm7nodsjnIAoTco5C/BV
 ufi2AnNAH5xCA/WmB5gWEUk1s2tKye5kpaithyC/CpFFmd619jHtqzQXXqco7+c/F965
 CFuA==
X-Gm-Message-State: AOAM533YDTlCQhOAjc7tnyH6oL/j2+kiEJlQGArvh91RBrH4ZK//7ETO
 tHJhnELxcfzG0JFsKvN/agGfpQ==
X-Google-Smtp-Source: ABdhPJynTiyQ4FIYg4cdtezF3Br+4qx034SC2udBilMDA9p4OZP/wlWrdwX3HApNF5CcDfAx3rMAkw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr7204512wri.149.1626255414389; 
 Wed, 14 Jul 2021 02:36:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v30sm2053233wrv.85.2021.07.14.02.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C3CE1FF9B;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/21] contrib/gitdm: add domain-map/group-map for Wind
 River
Date: Wed, 14 Jul 2021 10:36:29 +0100
Message-Id: <20210714093638.21077-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I've created a group-map as well as some windriver contributions have
come via non-corporate email. Let me know if you want the
contributions split.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Ruimei Yan <ruimei.yan@windriver.com>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>
---
 contrib/gitdm/domain-map          | 1 +
 contrib/gitdm/group-map-windriver | 6 ++++++
 gitdm.config                      | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 contrib/gitdm/group-map-windriver

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
diff --git a/contrib/gitdm/group-map-windriver b/contrib/gitdm/group-map-windriver
new file mode 100644
index 0000000000..370a08f085
--- /dev/null
+++ b/contrib/gitdm/group-map-windriver
@@ -0,0 +1,6 @@
+#
+# Wind River contributors using non-corporate email
+#
+
+# aka bin.meng@windriver.com
+bmeng.cn@gmail.com
diff --git a/gitdm.config b/gitdm.config
index e7a744146e..c60ebc6e47 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -38,6 +38,7 @@ GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
+GroupMap contrib/gitdm/group-map-windriver Wind River
 
 # Also group together our prolific individual contributors
 # and those working under academic auspices
-- 
2.20.1


