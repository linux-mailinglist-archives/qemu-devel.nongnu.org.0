Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F4278DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 18:11:21 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLqJb-0008L7-ST
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 12:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kLpqD-00035L-NG
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:40:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kLpqB-0007et-58
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:40:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id w2so3504376wmi.1
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WnevfPJLXP7m95u6O9UpOEscgzjFPYFrMEzimyFwfY0=;
 b=n6FYUc+9TPWnJtB2aGSCJ7mnRLITgNklB3GSj7Yac5DQTjKL8RI1+7BICn/bt8MOPY
 2osJvDtKhqjh7m0xtci6MKkbDrL1l0mried6uC04Cp5YRN3HUr48TpvhKeCk86q2mRXz
 OIxz8kI53GGjSXILjUjK32nx9QeCcO4fpNuv+SbyvkEQdR9oPfQYAQ3+2aZwXAiO7jun
 Calpvv6uD8KotGjnGd32x3xnBv7GcXZuHZhDKbkTA++45Ow5rnTmDq/OrYcNrBsAP+nr
 hFUL6zQvm/VbnGfcYCbhWuH2InIglNwRXJcnq9WCjLRwzdaZE7KRXZX1xP5ZHlNt2Zl5
 kQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnevfPJLXP7m95u6O9UpOEscgzjFPYFrMEzimyFwfY0=;
 b=nkzwu0E3noXIVpZfYuvoCiT8m1l/Ho/2JAZlGEjVjfeBfchTuUAcprKXy3GZVCzUE2
 hk1+KoGPnA1e8qU6wHPrPfPP1aXkdQRbxGAtMgCQS1t9poMRAQ0aR4wKMGip435D+fJk
 JbRlOxUgJVbvX8IzH6AqcyiIrd2IG3Wg6qXkpCVoTsl++hjc19O8ms1k3I9NTr72ftm3
 ++ZUlbfa9UWAluIqI0+MnVVcHEK5FzLS4CJrHbLFyOVXtsKKhF08ZMaSaMpzLYtU3rTP
 pjVhFfVSdiFUF/oxuMW7XNdQCbTVAXkgWTU/u9KQSmorBQ1cS3FKIa9iiv56us4VCmEl
 ltsQ==
X-Gm-Message-State: AOAM533CMIulAocWiTeYNGWkfOVmNg9jG2Ky41EWj3KWdNf8jGzxnWyr
 wyUeS/eABU9bo9rAhzMjYnxlLQ==
X-Google-Smtp-Source: ABdhPJzZkmb4rlGjBdr7zvycOh5FN8xpes/tFxqnZ7/9swIYC2TVuUj1T5o/EN/bMtFin+1QgP3C9g==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr3819118wmb.32.1601048448935; 
 Fri, 25 Sep 2020 08:40:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i16sm3224939wrq.73.2020.09.25.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 08:40:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC4961FF9D;
 Fri, 25 Sep 2020 16:40:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/15] configure: Bump the minimum required Python version
 to 3.6
Date: Fri, 25 Sep 2020 16:40:27 +0100
Message-Id: <20200925154027.12672-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925154027.12672-1-alex.bennee@linaro.org>
References: <20200925154027.12672-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

All our supported build platforms have Python 3.6 or newer nowadays, and
there are some useful features in Python 3.6 which are not available in
3.5 yet (e.g. the type hint annotations which will allow us to statically
type the QAPI parser), so let's bump the minimum Python version to 3.6 now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200923162908.95372-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/conf.py                  | 4 ++--
 configure                     | 4 ++--
 tests/qemu-iotests/iotests.py | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 0dbd90dc1124..8aeac40124cb 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -36,9 +36,9 @@ from sphinx.errors import ConfigError
 # In newer versions of Sphinx this will display nicely; in older versions
 # Sphinx will also produce a Python backtrace but at least the information
 # gets printed...
-if sys.version_info < (3,5):
+if sys.version_info < (3,6):
     raise ConfigError(
-        "QEMU requires a Sphinx that uses Python 3.5 or better\n")
+        "QEMU requires a Sphinx that uses Python 3.6 or better\n")
 
 # The per-manual conf.py will set qemu_docdir for a single-manual build;
 # otherwise set it here if this is an entire-manual-set build.
diff --git a/configure b/configure
index b81868cf0231..c5f1b3bec6a8 100755
--- a/configure
+++ b/configure
@@ -1964,8 +1964,8 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (3,5))'; then
-  error_exit "Cannot use '$python', Python >= 3.5 is required." \
+if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
+  error_exit "Cannot use '$python', Python >= 3.6 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 91e4a5712609..f48460480a99 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -40,8 +40,6 @@ sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qtest
 from qemu.qmp import QMPMessage
 
-assert sys.version_info >= (3, 6)
-
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
 logger.addHandler(logging.NullHandler())
-- 
2.20.1


