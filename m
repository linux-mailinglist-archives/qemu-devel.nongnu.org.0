Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824544AF5D3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:54:29 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpIa-0001RL-Jv
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlk-0002zu-8d
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:28 -0500
Received: from [2a00:1450:4864:20::630] (port=42530
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlJ-0007sA-2w
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:08 -0500
Received: by mail-ej1-x630.google.com with SMTP id m4so7692832ejb.9
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTK/dwJYHU5b0Z0hIpEUNs5Gx8mM9m+sAjjUk0LWGbw=;
 b=BCL2G44qwj0s/w88k87ad+VB8sv8zMjhEmcIPKCA7r33DfYGNlVAYzMFLcyKk698A3
 ZR89T4Ppr81egcZFNzydqnnqQrlKnrdsCOFT39lCiJx+yfFcnHFowGTJ5lBQv6ML5G9d
 ABvlapDSZosizkYMS/zxzNoFx0LAJfaVFyIovRoTMpQk9b3JaPmJxSk46QtLMTHWorHx
 6h+nyUb9ohk4OgkLlUAts2FdbDBdlBlYROlxoZZ3JpN8Uj196bS4SX0oTWlzQDW3P5+F
 oQuOOYQMUcCQdMWHnLBr1RswBHLz35NWpcskSvI95qbjW7xcH11FJZatwSzSs7ibCP3J
 Y56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZTK/dwJYHU5b0Z0hIpEUNs5Gx8mM9m+sAjjUk0LWGbw=;
 b=p9L/C0AvZ5su/PYQRNTuQotSP/h3E9OqVxtUZCldvBdKWm/JW0+XLHkFVaRtQw2TKk
 a2PauUktgdY2uz/UYWg84P46xAW1bXZsBj99j/bbuWu5fWGiHN9g/L9bp5h3B42AnQnQ
 OivUwkcXYF0jkahNcJv0WBwxlX9AVWQ68wLatVAsBXNj4Fe7VLYLizaRlGHLzb2Iw3yp
 cSKT+Enm61eVf1pqVJM/geTE6uxdxjQRaNXqc4iCXvpekK5U+CuAeNT2ZDydL5nGxmyc
 3EvKK7inMFyN4HpI/pxv63tt46HH9GYgIGMX+7hrgY18gDmW4RA43cxK/dCirTnVUgNQ
 e+Xw==
X-Gm-Message-State: AOAM532staiqlZTCFtKEvXEwwXbM8WmG2VDQ3xAfEDD2WpJHAUN8Bxn7
 ph8NUQT4Izo7QXDa+PVXyC4BEA==
X-Google-Smtp-Source: ABdhPJxTKBw/W8tY1tW0rRZFqtLUuFUpAdtE1zCQvN8lKPc4378W8C8MRHK527CMXB6DUruLsnbPsw==
X-Received: by 2002:a17:907:7294:: with SMTP id
 dt20mr2161296ejc.535.1644416146293; 
 Wed, 09 Feb 2022 06:15:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id yr3sm4359270ejb.166.2022.02.09.06.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A4D91FFC6;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/28] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Date: Wed,  9 Feb 2022 14:15:15 +0000
Message-Id: <20220209141529.3418384-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "make lcitool-refresh" in an out-of-tree build, it
currently fails with an error message from git like this:

 fatal: not a git repository (or any parent up to mount point /)
 Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Fix it by changing to the source directory first before updating
the submodule.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201085554.85733-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220204204335.1689602-15-alex.bennee@linaro.org>

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index cff7c0b814..6b215adcd1 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -13,5 +13,5 @@ lcitool:
 lcitool-help: lcitool
 
 lcitool-refresh:
-	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
 	$(call quiet-command, $(LCITOOL_REFRESH))
-- 
2.30.2


