Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921CC495FE1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:41:55 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuAs-0003GY-MJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZ1-0008OC-Em
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:02:56 -0500
Received: from [2a00:1450:4864:20::336] (port=55981
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtYv-0000Ha-Mg
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:02:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id c66so17806697wma.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=TOpeKP4BoJYdtK10hWMWCqU3UH7uVY6QCB2Kud0DH4OmTXDyJIgwZPmaZr2op2zjsQ
 GqtyCICudW7ndJqDLGxjgX6665YRtvPmqmuvoZYfee5vj7DyFFj/dJCjNHoV/yH86FzH
 LxC4CovXsgqqd/90/IyJpWuB3AYI/1GVuH5SohpHG2qG9ffhP0nbg09bz94/mbQv4oIz
 eM7YqoW5S2xuKUu4blOo17qLxq+4/p57ZtQ+wLMc28CttBk2B3cXAC9TLdY1eBdDIFGR
 jaNS+O8troReLv28iRJFPGrnrrY4HvTWvygJOuvXqJ4y7zcMzy/6Pcv2rckM2jp1Q5v2
 LCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=OUXZDy08BGzK5FDadv8pmIB03q1tll1+OGZSNPeBOGLRYblq5wDKy+uVHNfBltV4nw
 hk2XaXeH0Y83CYcRohB9Sx1Kt8kzRUpUJhnbia/V/6F5h78mKsBXn3H6ILjI6i7ZCpW2
 2rvD5rFJZH2tuQvFSc2rWlJYFto9UjM3IzweHmfOCqHb3fNxGkDNP9MQMQ0eaV2+zS1x
 Ag4lbFN6SUpR4OBwkCspBDaLSgWHQHKkzGngQHkfGE+V2N6BqbqFeHEDBFyYB8QN91yj
 PVBZb6dUnZSKN8M7GehPTksdxErv8VhpfaA0U6Vu/MdgSHo44IK/7AHXBk9FXvCICaKV
 U+CA==
X-Gm-Message-State: AOAM53335QPhKQZ3I/rKb3LxPclgKcdH+Nze01SulHyP4/4ZvKDYXeY1
 yrqNKx1PGK5HdLIy1lCQQtocNE3Otrw=
X-Google-Smtp-Source: ABdhPJyq7KXGjlrH/QfYXcdyTTgZT62AZk5ye1TU9uCioxkbCbOhqfU0YZZbrGMEjk72lAAyFgBO5Q==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr634798wml.145.1642770159613; 
 Fri, 21 Jan 2022 05:02:39 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 h11sm10445354wmb.12.2022.01.21.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:39 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 3/7] tests/lcitool: Include local qemu.yml when refreshing
 cirrus-ci files
Date: Fri, 21 Jan 2022 14:02:18 +0100
Message-Id: <20220121130222.302540-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121130222.302540-1-f4bug@amsat.org>
References: <20220121130222.302540-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The script only include the local qemu.yml for Dockerfiles.
Since we want to keep the Cirrus-CI generated files in sync,
also use the --data-dir option in generate_cirrus().

Fixes: c45a540f4bd (".gitlab-ci.d/cirrus: auto-generate variables with lcitool")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/lcitool/refresh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223d..25301f2ef0b 100755
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
2.34.1


