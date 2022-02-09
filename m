Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02C4AF4D8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:12:42 +0100 (CET)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoe8-0004Ir-Vr
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030L-Bu
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::633] (port=43638
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007rg-Ct
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:11 -0500
Received: by mail-ej1-x633.google.com with SMTP id d10so7669140eje.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqkbAl6efy51OiBrv3WLzvOb75kYmitY6qJV4uBajjs=;
 b=pmeTUP262jhh+2EMh3IhZRbzqPK3ruoBfspP7ShI7NcSTv8aUHlsMR/KqLFNkdCk8F
 Melc1UjRHVltSRCADCu5X3AWYG1GAyknSKJ94eyFQR//fd2RKJD1cS4lTpS5+rfqXl0h
 9zWuCfpI1zErVTpXUO06R5Amfng3cgXoa42K0rj3d6axi+V5iQQMHYyu7MscbM3cQAIv
 j0wjHWW8hFWIIFiC8FZY6nz7yCsTc67+T5jEoQZXt2rPO5DrhNZAyGUZuJUm0xIQNyrv
 DTK+WRQ6grPkuxkYZqMBmCS8mhV8CpnKZ/IGDuZyMT6+U8GzekLhvywz3CqE8f2dxgaI
 XTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqkbAl6efy51OiBrv3WLzvOb75kYmitY6qJV4uBajjs=;
 b=SnAq694lnav3ka+9wvIQ8ce6laGEmImwyOvVVGf+Q3CPQE6vhs8asO8Cyy3FqTUFCK
 jJFSM/0XBqiMicjOwfsGsG5UN8Ox+BgK8uezMf5QMM56rJycMA4eIY51/YYke4y73LB9
 QWhvFIVJCjlrdP3WSeEhE4gTf4NyIkK6gbokmKEnrlkUd8Z8NU0Jd0ye2u7zVRK3fi/s
 1TmaJ4Bx9FEkHpFV6jZIGdMZ5eB/auZyghR9Gx5h3xSRp5eOt2gPekZlvlVDb2FO8zol
 z8mOCG8KyPdDRxeZHvq9KQ86AjUTIE9TfEZIC78vkd716lMydUFXz5xV1XyiQ8POXRg9
 3q6A==
X-Gm-Message-State: AOAM533nNCrow5abvcv9NQzP8FKk10Vl0x/IlIAlBMhfwjv1MjuT21Tm
 vR7Hsk1nm6Kf8v6Oq2aMA2fZPw==
X-Google-Smtp-Source: ABdhPJyz/a4rwfKGdNDvQoM3CY/jHZf//64nA5z1gss6BP5LLXbcXepqpaj2YqEyEYNY/KoN931/tg==
X-Received: by 2002:a17:906:5d0e:: with SMTP id
 g14mr2194650ejt.211.1644416142918; 
 Wed, 09 Feb 2022 06:15:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm3365640ejz.167.2022.02.09.06.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDDDB1FFBF;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/28] tests/lcitool: Include local qemu.yml when refreshing
 cirrus-ci files
Date: Wed,  9 Feb 2022 14:15:08 +0000
Message-Id: <20220209141529.3418384-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Message-Id: <20220204204335.1689602-8-alex.bennee@linaro.org>

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


