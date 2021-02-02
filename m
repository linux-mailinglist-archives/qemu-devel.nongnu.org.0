Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061330BFDE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:45:15 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vzW-00005M-4G
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vud-0003N3-Ro
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:11 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vua-0007Cw-DW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so20510934wry.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hf7ynIumjxT8747QQLhELSkjFJ2pAeJjBigreGwj8dE=;
 b=YABLiXeMGr3BBdL50nwfRSsnkNKABzChn1IbOnojpGsGDCWh5EaxL01BArDGV6OIBE
 3ro+sEHrzQfpTDPruAYNlrYfSN8cuc/y6L1vkcoiGZHlW9wJkxyLCMq5duCyVHnebdjH
 H6dZkPDYe1dUATv3EpqL53vZzL41ddf476rFrjgIFxanmFytfoC75BuZSHyp92uMEU/M
 nWgFYIhADt2OFhKwh3Nibg+m2kNBX9j11fRysUwv+2z+JDJMgCdOOuRPVmaNKwUr0Ea/
 p1kOrDsU9rKjGP3kzxPkZGP1iJN1Mw+9DSlPgDmH5BzWY9T35vGFx8WJNmiU+IIpCKSx
 lXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hf7ynIumjxT8747QQLhELSkjFJ2pAeJjBigreGwj8dE=;
 b=D4Ad2YeAsiErfKA95MH8WDm6o8/0wPU8fFiUNCVD1fht4bLknvIw/89Hyv1HSEc1uV
 CiWkmoq6uwNQqPT8xoIlPQnuEbEIVYCKmfCioSr8PzBsLZ5kV1DmTqJIfIxL3csGQKRy
 cnAA5ml8VphtcFdx9WX+V1TBDJfwQme6H6kYjnb0IGvTYBdH/CNXNdSMgGd/TmnwDFID
 tXbUJNFZ9VnSWpRqcqnmSzvKcT8anQC3cPSglGJ9WDTth2msQX7TO8XRRlPeBgcSBHcH
 Yv4GBhXbmmnLLP+r53JlX6+Cj+0T7fhGe1ccenJWP6IA6rPZUUagAJCKUSwqD2JTpDaa
 TVYg==
X-Gm-Message-State: AOAM5330ycPG2IysGdC7F+nMb8qgVuYohmoZfaKemrd0E7KY46t3YbZE
 cem/8EB0bnX7VIF+y9v4kHe7RtTdbZ3H4UaB
X-Google-Smtp-Source: ABdhPJxOzagu+nNcursGQTHP7HrU1VbbiR1bJ6ShOy9jJ0sD7BGJBEwXyPIB8yIgIA9+tCuO9DRT0w==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr24042762wrx.140.1612273207118; 
 Tue, 02 Feb 2021 05:40:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y83sm2943850wmc.12.2021.02.02.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54C561FF8F;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/15] tests/docker: make _copy_with_mkdir accept missing
 files
Date: Tue,  2 Feb 2021 13:39:48 +0000
Message-Id: <20210202134001.25738-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the linker/ldd setup we might get a file with no path.
Typically this is the psuedo library linux-vdso.so which doesn't
actually exist on the disk. Rather than try and catch these distro
specific edge cases just shout about it and try and continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/docker.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0b4f6167b3..fb3de41c0b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -103,7 +103,12 @@ def _copy_with_mkdir(src, root_dir, sub_path='.'):
         pass
 
     dest_file = "%s/%s" % (dest_dir, os.path.basename(src))
-    copy(src, dest_file)
+
+    try:
+        copy(src, dest_file)
+    except FileNotFoundError:
+        print("Couldn't copy %s to %s" % (src, dest_file))
+        pass
 
 
 def _get_so_libs(executable):
-- 
2.20.1


