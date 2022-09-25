Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE35E9322
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:37:24 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQst-0003Iq-1S
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsb-0003qI-Jd
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:10 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsZ-0006W2-Te
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o99-20020a17090a0a6c00b002039c4fce53so9955476pjo.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IzZQnIYLsxtqAyksVgAZZh7li/fTF9V/3ilSBmBdf+4=;
 b=Sl3dbP8od4b7azHLzM8n0CrsSS7JJtj0tBPS8LBByTp/kfyTsfrRHEAsrRZIy1Q2aK
 HiNn8KQbaeAmHRD4CMj2zr6pJvc7Jb/X4Ol5V2BVwDbQ9PTQ8l6gBXiyRfQO5CoH8j1T
 kSUFCsU8rDVSEsKr2NbpXlPlxmwF4ZGE4AYXGhECXz2VxL6wOEr+aS6untUE7YnoGF/V
 IzXkLths9Ckr5kAE4zKTmhmbqVijr5mpcAn7qe/zTReBpCitV5yk1o/Y9b6FVOSMUEnd
 gqnyZT+YtOYu+aNgATWNOdwL2H4TBiWUTJtNRxvHIXMWmFvhBpgzqqkyDWKsavDDkM/1
 /MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IzZQnIYLsxtqAyksVgAZZh7li/fTF9V/3ilSBmBdf+4=;
 b=uB8P6UUNznoBqMWwduxI8bLXL1EnekIwwHVElXpHUr8UV18Hcx+czGpEG1VFhNv6lM
 NAeAkBBY8Zmpm2qVJ7uaptbqK/HumY+sHtyeY677ur2yWx1Rv47Ed3HMqlDAM2+NhVc1
 sCyqfpeoPuqIbDc45P8xj7mmRsF5ixi0EJFUewBlIbb4V+a20XlaW4fVw/MtexqUHNGI
 zrICaLknFOc8Rs8ORASm5wT38GHBcitt2TQ/dlSg2B5IpTpp7ygekEhxlfswc4AhuMSQ
 abOHGQ9K/e3bY9i3HIOIKHHs9b6oyDXj3VNsurWrD+vHtui2s2rVtUKIfTH3CudPmrae
 ovmw==
X-Gm-Message-State: ACrzQf3so2hHBwkJw/P1QN23G0WTrbcFg8yfA0FiuV7HuasL49r3KMu4
 w8f93rPudJIUrlOhlazihs183hkcPKY=
X-Google-Smtp-Source: AMsMyM50s6JR0pEIRdPb5gOG+1OceQ4JlXTyy+2o7EwhiBVHESskytgtaHIsOba7O+Y9xKOKFhR93Q==
X-Received: by 2002:a17:902:ac98:b0:176:9e76:a930 with SMTP id
 h24-20020a170902ac9800b001769e76a930mr16809207plr.15.1664105576978; 
 Sun, 25 Sep 2022 04:32:56 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 53/54] tests/qtest: Enable qtest build on Windows
Date: Sun, 25 Sep 2022 19:30:31 +0800
Message-Id: <20220925113032.1949844-54-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Drop the host test

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e..8701c3a8e7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


