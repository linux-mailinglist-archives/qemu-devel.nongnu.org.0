Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497243C8256
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:03:19 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bja-0006AY-Ck
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKm-0003Om-Np
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKj-0004oA-Nq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso1022507wmj.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiNv7Ue8GGYrBSiQ5PWXjtcZoQbWRZS+IyfdTG4+yNE=;
 b=zGQVhBf++xnXtUNiD/fbj9Wzk4ZQzVxiXo4966HUf32iU0psCjNDyrwGeKw5OVL5QS
 hEML7pFNvXpmkhi8Ai/VfmxojyuYfP35p57RMN9REapi10djb8bHAp8FaMjiA7pBFYo4
 uzTStMecC1k+0qWEbaNBftehqd0/5PuOZ30+16yRK1NTEOwgJX88Zn91wKsxWfNMfzML
 kHSEa26f5G9ya9FL0yQ46DFx+ByePDBXbD/46GCtn0kcYm3vE7DPM975El+3oFBrFuUT
 qSjvgTA9ybsrxnfgpp9+FxCsjZVunS7Vn7bjYe0DkKfIOUZYWHeq/jh8d/CrlKG6rw7M
 tiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiNv7Ue8GGYrBSiQ5PWXjtcZoQbWRZS+IyfdTG4+yNE=;
 b=rIbfjIg0iR9R7qz2353zoX51fV4boTNnAVB9UnFs9L6PBvtl/HejXLdC4CpahB8rUC
 jlKYqIDXLmKFarOxc+sj55fYtjtzo3vdxoYOHrjG0q8tf183DqM+x+sXpfT/5Lv44uzV
 cTmtwSt5o4cGC9OWjDWWW02iAEQ8F/uoTmeTIceInjLGjhfaKc5MXnKsvDVXH/Bz1fCu
 GmhFonqYf5B9T45Lk9+p4djpi71r+Ftk2pNx3cvG+WttJX2J4uYyimPhrdzSgof01Zvv
 vuQ/8KU0Ywmcdg5ay2JEO1LF/KjRt4LNdKPAtRlZom51HfnwbHeDCZCG1h89jpBvrUUR
 yUOA==
X-Gm-Message-State: AOAM532NylYKdWd3GOSr/iqTIqDl4r2aJkVBRt/liwGtuyl5dsi7zwWC
 E6TjdCHwJkvgjA+Trm9V3x+jJg==
X-Google-Smtp-Source: ABdhPJxyl1PW0Z3h+w4CkF4UCxE+BjCTJZ7LJ453MT5lqsrIyq0+ZsJvaenv9eq6COxhYjqR10F6/Q==
X-Received: by 2002:a05:600c:a01:: with SMTP id
 z1mr2972380wmp.77.1626255455768; 
 Wed, 14 Jul 2021 02:37:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b16sm2064889wrs.51.2021.07.14.02.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE5A61FFAB;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/21] contrib/gitdm: add domain-map/group-map for Wind
 River
Date: Wed, 14 Jul 2021 10:37:10 +0100
Message-Id: <20210714093719.21429-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


