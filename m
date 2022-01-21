Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A0495E2C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:09:23 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArnG-0008DA-6W
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:09:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHg-0003VV-8j; Fri, 21 Jan 2022 05:36:47 -0500
Received: from [2a00:1450:4864:20::32f] (port=53819
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHe-00047k-MY; Fri, 21 Jan 2022 05:36:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n8so17049815wmk.3;
 Fri, 21 Jan 2022 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=o12AYVZgcxipTSbkO0kiXH/iKlyhmo5viyilFO9pQqqRKMPx4BQsi1QFJgfTciYcIb
 eAWuhI1bpW49Pguxpu9Uxb++VOlPnCHoZ+PjCl8srhdEClEMKO59MT6B8E8MAnD3349D
 xYWDBp5oWDTzB9LHSIgE88/vCxzr6itkylKorzSsKH+zFdza8ot0IKaLlEuPWUsuWIkl
 IutsXJkfViHNSNs9OOTQmvrzcHqQjZ/o6fbbxc+UFCOAsoXpWmaqLWCc39+XDaAD+gvt
 Lh/meuG8vhGhI6UPwMID9/LrZpOnahLG6MG3mxTaHb5VMmdUziF+gYG57/qNNzOU6KH4
 99qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=Z+XzcZls8TbLtwLJ5H3334Q3TTH/AJ8zw1OU4g3XkvTAWoEsIls2pSQp3hHZIzKiX6
 GYperWvXaVUG2Yz8l210sYLl7RVX85GZmEmkXqvba7IUfyh/TmRK3UyiQq2i36a9hLQ/
 p6yidkfA2vxbD8g2Lk85wWRAvb7XwR0qK3akjrFlF+7uCYbWc0gipO0QNR0mwZ1jhbgz
 AlpCL/x4TgxOLhsZrFwKmt84axFFoKUYeWT3ulgpmpnAtSyjDd45u87vpzwWCYgfdpC8
 0j/XD7WULj5VGcDPVR0IWWuQSPK4zXcSVon9jo968REZTJstC6Py0ndr9yfYnRYzWBqe
 rd/w==
X-Gm-Message-State: AOAM531Qr0ufGX6o77P3Yl3iztO7rG6qEArL7zhkSG9pU1io5AwOqrTB
 VklUTVzcXkNB6BoSwIJ4dnN9QB07O94=
X-Google-Smtp-Source: ABdhPJy/FgMVEGGLUzf+NBzfL0ZTMU7ewwzzXUPizU7KMpPBdWsDKdrVXRp12Wi59noMzo1Nu8pg4g==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr3291946wrc.698.1642761400003; 
 Fri, 21 Jan 2022 02:36:40 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 i6sm4972088wma.22.2022.01.21.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:39 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 3/8] tests/lcitool: Include local qemu.yml when refreshing
 cirrus-ci files
Date: Fri, 21 Jan 2022 11:36:18 +0100
Message-Id: <20220121103623.288054-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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


