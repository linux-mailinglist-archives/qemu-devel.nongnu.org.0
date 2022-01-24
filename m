Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F9D499331
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:33:52 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC62B-0005J7-O7
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lN-0006dS-BE
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:31 -0500
Received: from [2a00:1450:4864:20::631] (port=36497
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lK-0003EX-MD
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:28 -0500
Received: by mail-ej1-x631.google.com with SMTP id s13so24649766ejy.3
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qh3MOdvacAJFLMgwCts4uchTskk0TJYrOoHeZN2YKoI=;
 b=gfP2snqzcbpHmSMLahP2bAETYJxeHrHRY7fu7B7y7sHghMXyiiVmkpvlWerT9cmNg/
 4oH+IYJ2jsNU65oBTisiWYFJ5tfKK72VIWZcAg/+TSJZOPQ/QDrlVSDHt1JIgt1oSHKW
 zaeVxs+r4DQ78bJDIzNXB+xa4DO5DCA7blyojfEGgJ2rF5FcRzLgJ1/Ci2qCjqUauHcl
 nzG6hwOyyBK4uNp4T276P8KsGkZuTH1nsw2R+/SCSMhCJZ5WVN86EWerhjhhtc/1tPBh
 qa7RDDaYRq9KFzsJc3ttZDiLLwqAZ27R5nwCkG4N/ucfkQwY3S3YikzeWd6Q/XV3R7WU
 DLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qh3MOdvacAJFLMgwCts4uchTskk0TJYrOoHeZN2YKoI=;
 b=2Ur5VZF30KKOumrFgYLN84AKhhduGpcyD86QHxG3g4adTsKuMYWt03WKMnxd0y1Hmv
 DBbdY/OsQCcjLkmFnZMzaNZBjnxoDLn91xg8+6KcFW5SGCezY3G4QLA0FTEMrpfaG2JH
 RbDpT7AVY6DqpG/jtU0KzUDIMsPAHPtnTOxNJOx6nX6PI6cJXUZIpDuC/c3LoDuEeB0z
 fZyA7l93YXNsnNXJ95Khr2v8inMpuMmQzB1oDzFysZiSG3JQKGgQniQUxD7btkhlPWbN
 KmpPRzJDJBFrIAp3F7U+f7SA+h6jMNQ3EKGSEyyPJyduGAn+G/Eu3PY+I2dtvUVw7RBq
 o7sg==
X-Gm-Message-State: AOAM532urf+FljYWyDvBbhOsnoNCuhyHXN/rPn+WXEavWWkTVo4/WfOz
 Y71bR+IBB1g3OM6XyY6FNZgjWw==
X-Google-Smtp-Source: ABdhPJy7p7ViqCfxLEm7XSfPFEwVBTOjVWhui7bEKastWHS1SnSF8QuN03rjjNZw9Wu5wLpfq0+y4Q==
X-Received: by 2002:a17:907:3e96:: with SMTP id
 hs22mr5111052ejc.640.1643055383193; 
 Mon, 24 Jan 2022 12:16:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm6989437edz.64.2022.01.24.12.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7F791FFBE;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/22] gitmodules: Correct libvirt-ci submodule URL
Date: Mon, 24 Jan 2022 20:15:52 +0000
Message-Id: <20220124201608.604599-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-3-f4bug@amsat.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..f4b6a9b401 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.30.2


