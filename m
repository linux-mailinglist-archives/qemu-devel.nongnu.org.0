Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB823216758
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 09:25:54 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshzF-0002y5-VA
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 03:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshxq-0001Rg-9P
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:24:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshxo-0006fs-Kq
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:24:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id k6so44033166wrn.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJmGTUIDpDAF9NLfy0YY76xgc1xY2TT3QfY+IV2fyrk=;
 b=gTwbzNRR1ZqKp4RUx0KY1/upcjiRfVGNG7g3WUso9pRHCucc5l2gRZaEOopQlKN6ox
 KX9kdFy4k5SkMcIkTIpIi0LgWL6SXblLUm6tzXqYovOaeFb1jgirMlmkltPnNZaFI3UN
 5wMNnV7mHTIVcgN5UMXaxG6KZCCjzkjfpgAffJz2CQP+060F3KHCr9y7DKbdFuQTLlah
 QnK5IKFf+65YD3+Pal5fiNQZwuLpyE/GfOjQfdFbVr6U23+5yvSu4oeABftk7MQmJe94
 zBJFAEs17QgPekubj2E0z9V5h9yZs9VLo/oMt+LQm+kZxKB0kXLNpqrYocsLvfZ3pvmj
 a+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJmGTUIDpDAF9NLfy0YY76xgc1xY2TT3QfY+IV2fyrk=;
 b=jZhwN9oaolGXp2BOika42h5SL1Q+tqG2fewyk5RP/hR6oFywXePK07ZZSBD2fpxsPY
 YwnyBBhLC2gEam5DJz39k04aBj0MUgYsk8J+uvVQz8KMrq2jt43CevpcEbPbMwjXN70u
 UuNB5NRMtsyVVdRBtiCcXXU+expCYQL+X0KMg2OrdZydOYpR7XcxuBuGR/EVbucEihy9
 79ef6rtR6Vyr6d0uJ1LeeJQor9JTx5w+FQ/kPzqEzuB4xQ2mfabRb87eV5sERwc6vdcb
 gvV7WcK3lSo58mlAVLxuI9d4qXsCfVlAoyWd1Il+rsUgtUVzCWCHf1CDpIzdZG3qhMmr
 0TtQ==
X-Gm-Message-State: AOAM533Pvox5RAa/c0331px2AxVvKI0SzyFiAwDkNZ085o1IpLjup7jD
 InNLHstpStNlOHc+Pb0FIBYsPQ==
X-Google-Smtp-Source: ABdhPJwe3E20HfitAPFGaBfJj8Ii8Lz6lMbHo8PuEx8y+LGtSY5xcAkEOzOLNiyoPUkNcWQb2hS1aQ==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr51860693wrr.230.1594106662802; 
 Tue, 07 Jul 2020 00:24:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm26188861wrw.24.2020.07.07.00.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:24:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F19181FFAE;
 Tue,  7 Jul 2020 08:09:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 24/41] tests/acceptance: skip s390x_ccw_vrtio_tcg on GitLab
Date: Tue,  7 Jul 2020 08:08:41 +0100
Message-Id: <20200707070858.6622-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200707070858.6622-1-alex.bennee@linaro.org>
References: <20200707070858.6622-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the test takes more the 900 seconds on GitLab and then times
out. Running on Travis seems to be OK.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200701135652.1366-27-alex.bennee@linaro.org>

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 3aa57e88b0bf..0055dc7cee77 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -20,6 +20,7 @@ from avocado.utils import network
 from avocado.utils import vmimage
 from avocado.utils import datadrainer
 from avocado.utils.path import find_command
+from avocado import skipIf
 
 ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
 KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
@@ -220,6 +221,7 @@ class BootLinuxS390X(BootLinux):
 
     chksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
         :avocado: tags=machine:s390-ccw-virtio
-- 
2.20.1


