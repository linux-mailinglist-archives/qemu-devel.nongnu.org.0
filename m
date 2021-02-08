Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0E313B0A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:36:39 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ASk-0008MC-5A
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95p9-0003fk-U9
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oh-0007iV-I8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id n6so4078442wrv.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/C/IeWDEzIaP4F9kXntszm+mIX88m1SsEC/60p2ki5M=;
 b=vPVQrLjs6lLkXHYQF/pVoyuIbGP0sf3F5NA13rvPmuxDGiPVNrhIFGFF3moMQeRU+7
 I33o5nFtjHScRcBZAG7Xg3RgG3GASwUj83Q8I7BQz9FeR4yh+p+rc/q5K4fj0AjcT+Af
 UlStFgJi2HEstONwksCOc9k0ZJ1jvjrRAhf0ak8CgxPbxet3UIuOI8keNds+xSQ6JUGq
 HOi72dGfoLKDEnzU/pt+U/xH4q42B55+n+BmPhIX5a8tQiqmN4t4pufnKUZkpmWBfaty
 ggpM5tHxJ75kxCERNMbmZLvFgCwcYfHwX1kSThSqWgPtik8n89SZFc0wuQjfq15sVMnY
 hNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/C/IeWDEzIaP4F9kXntszm+mIX88m1SsEC/60p2ki5M=;
 b=YmP0pFDCq5veYhUV9nFzSqsXeaXqKaIgq+djgN/stSHhtoMVu1NvDKI7e6CQIN1xIk
 fZDzeiwiqLkJHWnkiyOhONGtpAdqhmeFaJxVKHStPiwEB9RM2LQRLgmUJJRNaU1hgGus
 tApHIc+a3Sd2WSQFTxOdjQU4obTEYnITGFzy6Bg/u1knjBG1geKEIHtLZ8EeGNuES6F0
 xtBxJ+rZ+06JG2G6XLW6I/vjxP2czIjYjiduiNmJkut5CwGoXCYfx9yCLNFt5qf3WPuT
 C/+llQ1QVDrM7Tsm00AQDtboripBOks76whd08F83vWUb7MPH9jX5c+oAf6nPXWyIcUk
 fgig==
X-Gm-Message-State: AOAM530i2VJsHx16Np80jO0bpEB8oI5U4WCU5Z9v7oQUWA9T6ZM1f4In
 koNaJYl15N5rUmQj7urYMwWsvg==
X-Google-Smtp-Source: ABdhPJxVhjqqBC06SJyB/kBFQ0ZgVL1ALWTnTaJaaEfWkdshmCig4E0tGlfLee/aLSxVIuPGjBerYQ==
X-Received: by 2002:adf:d085:: with SMTP id y5mr20183417wrh.41.1612787910014; 
 Mon, 08 Feb 2021 04:38:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm14235741wrr.3.2021.02.08.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 193A91FF90;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/16] tests/docker: make _copy_with_mkdir accept missing files
Date: Mon,  8 Feb 2021 12:38:09 +0000
Message-Id: <20210208123821.19818-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the linker/ldd setup we might get a file with no path.
Typically this is the psuedo library linux-vdso.so which doesn't
actually exist on the disk. Rather than try and catch these distro
specific edge cases just shout about it and try and continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210202134001.25738-4-alex.bennee@linaro.org>

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


