Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEE4992C0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:25:23 +0100 (CET)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5ty-0006cZ-9E
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:25:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lJ-0006bq-BI
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:26 -0500
Received: from [2a00:1450:4864:20::629] (port=33630
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lF-0003E6-E8
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:23 -0500
Received: by mail-ej1-x629.google.com with SMTP id jx6so24697425ejb.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwQt43irj7rm302zSIC5pBYW4+QTRQTsXzXbo7p8Q+o=;
 b=JTdmoRVVzdDGZfAvT6r5W92MIobkS1cOS//T0DmSJ28E8j/yB3lQe7nJeRfzkyHuzV
 oBnIc871CxmP2hV7+3ZKlKX38hLuyuygNfDa8FbYiL3YiNXr/9HHo6fiaQ3RfF+PwXiP
 ng69GUeLPvS76+8SMYxvtsNvnuzq21+QRo56BJsATowgd2jSqL05Hd43f4QJ5mZTzgTR
 CkEDKC/TVxWtulJOv0I4+wd/uCZaiOqCv1cLeLil4T58vu0psMFGmr3j4wZEm1CyIuQJ
 imCgP02PeSrJSDQuR/rQPpk9bPkXAFyU16FKnCs0acCkJYe41UrScivn3Pvy/nARPkkQ
 JBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwQt43irj7rm302zSIC5pBYW4+QTRQTsXzXbo7p8Q+o=;
 b=xZCDvXqUROTRN80vNLhGoJFcAG3ImwbIgZ7pHhnWL8lVQGtODDi9WxLMqNLHdoCYsr
 ssAo4xzMtsJXe050bar5MbCz6QB0wvb7l2gKgiZ+5CN6LHhs9G7CwzIYiMosyI7iGqcx
 9T1qcJvk+o3QBuC9Q56hfMM3M5bNuOgPWOKktr6xOO1mx30mv67KthECzl/sRth+aRht
 vKruf6+KEx71fm7qOpxLqKYPEEj7fJUGVnun0N5ZOce+2pozxnmCSrjakahs+kajm5cx
 z+BAcEMhLrSyE4OBPRLzweEQxWBfMdkPeE+sKZUTslo6mTWCvBT7nGfPzLQz+NIXdjiJ
 RDDw==
X-Gm-Message-State: AOAM5317majp4bdC6cldVYnlE7xq+c5BJCraiEUkW9bOgC/4WgEGAzhs
 NKqw/n9WgseKAZlXmXamNg0t1Q==
X-Google-Smtp-Source: ABdhPJxe98PdPu1oENm8/J8iEF76FTALsZc135hhJVuCBWdAGXSzRsblaqFVbTTUHK/rC3gY8qNn8g==
X-Received: by 2002:a17:906:7306:: with SMTP id
 di6mr13410799ejc.255.1643055380031; 
 Mon, 24 Jan 2022 12:16:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm7119954edy.66.2022.01.24.12.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C6141FFBF;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/22] tests/lcitool: Include local qemu.yml when
 refreshing cirrus-ci files
Date: Mon, 24 Jan 2022 20:15:53 +0000
Message-Id: <20220124201608.604599-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
 Beraldo Leal <bleal@redhat.com>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The script only include the local qemu.yml for Dockerfiles.
Since we want to keep the Cirrus-CI generated files in sync,
also use the --data-dir option in generate_cirrus().

Fixes: c45a540f4bd (".gitlab-ci.d/cirrus: auto-generate variables with lcitool")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-4-f4bug@amsat.org>
---
 tests/lcitool/refresh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223..25301f2ef0 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,7 +62,7 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
 
 def generate_cirrus(target, trailer=None):
    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = [lcitool_path, "variables", target, "qemu"]
+   cmd = lcitool_cmd + ["variables", target, "qemu"]
    generate(filename, cmd, trailer)
 
 ubuntu1804_skipssh = [
-- 
2.30.2


