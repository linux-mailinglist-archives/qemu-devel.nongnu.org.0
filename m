Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613064A6741
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:47:32 +0100 (CET)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0zr-00030Z-Eb
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cr-5P
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::635] (port=37455
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000cj-2H
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:36 -0500
Received: by mail-ej1-x635.google.com with SMTP id ah7so56610273ejc.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KHr0kxH9CLEWlHl0W4fK5P4+OBM1Yg1uq7/VVGxFQs=;
 b=NyqaRiTaluykHr/bVNHQ3/ehf/E5fDDkhjKu0Z2Z/2u9Q2cGxSFmS2lgAegGOOpJmY
 40mMLQgeQIHlBGSHOBm4QNLM7SZHn6pgKHZxagOGzX/PYqeLYT+1u1ja+g5P23S4QOBz
 swVdWFJGAs+tk/L4vCnKAbUF67QPRaRDeNoCNl156wJ504wOSqRk3RACxCF5X72TdJ4h
 l+RDTmo+VVNS5vUdOaPdjx6tMKrrbpReij+4MgghdpR7gquu+/qE5ZEeJpJeoeK6nrmo
 W29YVlNqc38eVkwWYIDgmhZpVjcakeLMRQ7Od+38Mw8k38a702FOu3/k5SlYQpDYzpWK
 tNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KHr0kxH9CLEWlHl0W4fK5P4+OBM1Yg1uq7/VVGxFQs=;
 b=qqOnTMjlFV41PlMnxpFiB6mBGvZ5RJ/yyHW4DXcdK4s56+NQ24gl3dz9AsOWs0v/TG
 GAe7t1rsybT2miwBFzEuKPv7fGuc1b9Txe22exErCM81Ty+Lpl3+saQx91sH2EbiA/Yp
 CZOIOz8m2hoCnjAYjt3bWZxIIJt3OHVI4LZlmt/ST8W7yqQBmmFMWuevgeJlFTh5RGYD
 g6cmFKFIqyFUaRp05KeS4w9QuVfPN3/tWv5796TmdBD66Tt3BkHDtJuxyxDIsBev/T2h
 Q+rzN1pdEk+O5njmA/NtJOt/LL/MrFMCMa4ihki/Suowcd7rrF4I7Wsa/X6BTOg41cOx
 zMXw==
X-Gm-Message-State: AOAM530Bgxrgcz5TCi907YS/HPkQ2bhW/R2+taYujUHMEwY2zHE+d13c
 rDP5FndUIupf4OmH0I/tOiySog==
X-Google-Smtp-Source: ABdhPJz46GkOA0RpGAg9SFyzZjazR3D2L3N8MLPyuUTETeUYUa/24R3tU+2HeuaYwS/+lTZiBGB5WA==
X-Received: by 2002:a17:907:1c8e:: with SMTP id
 nb14mr22121757ejc.323.1643739661477; 
 Tue, 01 Feb 2022 10:21:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lf16sm14734824ejc.25.2022.02.01.10.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44E571FFBF;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] tests/lcitool: Include local qemu.yml when
 refreshing cirrus-ci files
Date: Tue,  1 Feb 2022 18:20:32 +0000
Message-Id: <20220201182050.15087-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
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
Message-Id: <20220124201608.604599-8-alex.bennee@linaro.org>
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


