Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3BC496255
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:51:12 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwBy-0001Nq-L2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw30-0001Ja-If
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:55 -0500
Received: from [2a00:1450:4864:20::430] (port=45997
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2y-0007hE-M8
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id i2so398732wrb.12
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=J+aux56hQAqZIq5SUPaFmor2vL8WZ+uu2piiHOmTnimEo51SJDE9bxtfSdJWdLsXXa
 d8hHLVhlRfIkof/EMgBKa5sIUmPWotstlLR8FwkRBHCEyJO6KpHVULKJo5C8AXLjN3BU
 U6/fFOM67cbuqSnK1sTegFoUBxHb5CIXcFpAHzbOhIGTlqPYYzh3NSk24kL6odP4Swrx
 PwKwG7mmnAvhyirsjYgIIkvcQx4ACs82HM/5YQbx8CyUYt0MozPpAYCAvoC6vMa/6yhU
 /MeBtuM9FIr8RCkZwN0Ba3+o6IYHxjE2gRoydl4+lIwtCcFkfJdv+LnqGFstDI2QM9HI
 9PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0KVY8Kf1y+JHjZqld1jSJ4nxhvF4HzqE4UdFx7oCrkk=;
 b=fkdFPu3LF47hv1Fs9UZZiJDCVl7N++dDzLVeCem1ozi/i+zbuSjo0apluFSOveBhZ0
 bV1Qo+d8YQnOoMZKUB9hm5iHtVggJYPEqcm21fXdArKm2lYMtIFFbk2v+FnV3tXXo6eC
 0zkDe9IxYzg/I/EabIdY3xg/VhTaR8Ucwpdw/C3qcQKzj9o8vZiHSvHlXOZJ2mti0N+j
 FVRcd2o1YNNjJsO+LP0FolcnyLVn14J5HlIplpOC0lKMKceQMC+gdnG7uh0HYDD5xeId
 EZO+HSfDzNQ357zgRJKN5oxsHV9JDp6rM/Dx2rO5Q/52MzV0OnYbfl610Vqj/H4qpTMv
 vxLg==
X-Gm-Message-State: AOAM533n9MpWoSn4z+260FbhLEW0kbfvhZifYSRJf5XGgJUXYV/Qy4b4
 3oqEa0rGiIc3q2CuLDTTHNrAFufYgd8=
X-Google-Smtp-Source: ABdhPJwjP6sv73FpGoknIyxzcP3yo0H0lsyrey3X4tpmfuN0epQa6J2FEUP7jBrnK4wb78qDZDqZgQ==
X-Received: by 2002:adf:e48c:: with SMTP id i12mr3459790wrm.546.1642779711303; 
 Fri, 21 Jan 2022 07:41:51 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g17sm15468482wmq.9.2022.01.21.07.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:41:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 3/7] tests/lcitool: Include local qemu.yml when refreshing
 cirrus-ci files
Date: Fri, 21 Jan 2022 16:41:30 +0100
Message-Id: <20220121154134.315047-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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


