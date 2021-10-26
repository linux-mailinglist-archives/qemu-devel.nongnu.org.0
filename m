Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48043B02A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:37:10 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJpN-0007M4-Au
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbZ-0000x2-Os
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbX-0007R9-Up
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o14so1004785wra.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nzfSAkBBnW95G1HHY0jfzp30Kl0kRtuu1gHbOZwLl8=;
 b=LsiI3iGnLoQmxDgb98ObsxOE52D4KcgVrmTaUzWCuho+OZiQII6FOMWKumju8VUsog
 yx/av0zwf8llGLsTLsErNzXhX+QVB9aSEdWfaYSSeBsxk+FpQ/fJo5ky8uYR5PdsFVNf
 ZsyFcC49mXwa6Fmwl0z/IwNG4l+OBaSgvrwq7qFAYg2zjp0gAgP9NtSxsGKmZcOqe6sH
 f1KefDaKyUvnkuy17iSMKyVNAnPWN1ZjdpOd6ABXHSEPAFfnZjszeXqPxjywYeL/p0Le
 ozm533dzgE6WA/biR6GQmvIG7EFv11CbZZAwDGiKPG8oP26fwrY8yCpMSprqSjywyKS3
 IiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nzfSAkBBnW95G1HHY0jfzp30Kl0kRtuu1gHbOZwLl8=;
 b=e5E9tgYQqnN+QyCmqa392/GPldbg10DB9tEXYtrKU3M0bCtMtvyZjkQ/3HW6XMXoHI
 il0T+GYk1B2bDiLtfhEfxsG7CfyEVGDjn5IKEx0CPIKkHfsqNFHckLvu6Mj85fRWrwJy
 7shFgX6vjW+dzyDMmxv6IG1X/pGOq/qA0D+EPinhwWah/1IPr+/knd4SO1z2v1Hyckzh
 Qfe+zsWk0ZtB0KnpEoOwWS3SEp5uTcaVkB9YBcl8tlGnO23mV8cnvB7dPD9kpi9kp/Ms
 aeMqYEkn8wMl5UDwW8WZl2P1zurpeV2KqFl3XlYPG9LL1usbbC/+CV8NrU/KWxgX6wLR
 MXeg==
X-Gm-Message-State: AOAM531dGpsMu3Gb6DWZzuoO+vhyMl/sLOQ9tmBQXgQoiPuhnBLkQ9RC
 Fep74EMXivxAFQrvnhLvuaaiHQ==
X-Google-Smtp-Source: ABdhPJz608cB6IIjzdGF4jhxuXFxEfe8eIEVpK13ldgP4JIcUe6hT+vgjTruOTymWhmvnqLnhBc+fw==
X-Received: by 2002:a5d:64c9:: with SMTP id f9mr12533839wri.416.1635243770557; 
 Tue, 26 Oct 2021 03:22:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m35sm1683375wms.2.2021.10.26.03.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0C071FFA6;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/28] tests/docker: allow non-unique userid
Date: Tue, 26 Oct 2021 11:22:16 +0100
Message-Id: <20211026102234.3961636-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bit of a band-aid against hand-built images that have been
accidentally polluted by a user build. All images pulled from the
registry shouldn't have the user defined.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 78dd13171e..5eadf0bb7b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -336,7 +336,7 @@ def build_image(self, tag, docker_dir, dockerfile,
             uid = os.getuid()
             uname = getpwuid(uid).pw_name
             tmp_df.write("\n")
-            tmp_df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+            tmp_df.write("RUN id %s 2>/dev/null || useradd -o -u %d -U %s" %
                          (uname, uid, uname))
 
         tmp_df.write("\n")
@@ -590,7 +590,7 @@ def run(self, args, argv):
             uid = os.getuid()
             uname = getpwuid(uid).pw_name
             df.write("\n")
-            df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+            df.write("RUN id %s 2>/dev/null || useradd -o -u %d -U %s" %
                      (uname, uid, uname))
 
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
-- 
2.30.2


