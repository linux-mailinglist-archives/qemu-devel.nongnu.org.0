Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3745DDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:43:36 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGuN-0000VF-2W
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsn-0006iR-Fg
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:57 -0500
Received: from [2a00:1450:4864:20::435] (port=43599
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsl-0002KI-8q
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id v11so12491582wrw.10
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/izHlYo1eDjiSDXKoXYRwJfwLHOfDK99Sn/yTJcOteo=;
 b=h/BWDvUaGz+ndnUMUIMQYXbyuqTl33t9VBRCtsGsc11+zvOT3Iic7Rb1lXpDkXiOPW
 8GczNjwpQpFUlXjYNoYtUbLyqHRzH33PRZ0hygz/y4vlGLfGszRWyL3eOiaiVGtObApk
 kyU3D85W3P64PhqxrsGRan4D2iiOypQGr9YHq6PK20ei8UoTqJrtR58JP0unUiUaEjce
 B7GLnTp8BfBlpRXsOXA1G7m48C1tv+hlc1B56WSlIjiPEq968K/tmje6jfhmDUoT7YWl
 BHLjweDUBRLGkXAmiH+Ld6QE2B84Sy0DnmENUHQbU/xYYOUEBwjj/7YJ6Sy4fDpK+R34
 keEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/izHlYo1eDjiSDXKoXYRwJfwLHOfDK99Sn/yTJcOteo=;
 b=a4zMo1KRkVwXh1Il1wfTFoYSBlczCAeRiFYTFN0yqo2ijf5ekt8Kr+xMM5FLhq8OcY
 OQow9wVRvRFDo1pb/UEMzV6zss5d4d9UK0PE+QNJ8EUzYNjXl4LXIG1lko7gIxnTUDxT
 VF2ID6dBYg0jsiomRoLIF12Me/3eUIuzRGUFCji995KNR9EM+MudqD/sMN9eV2QBrJSK
 sT/xUAHkVtugeweXWN9tu2dePqNGZSKFpvJORqOdxbyWrbs+2lWX6n6W3KBQZa8EuNp0
 dzIWxMEdSM801gpiRWJebdcdMGBoYeA6hv4QvPswZn5VzXRsUR6C4rvoEqxGFNlkdyDS
 d3Uw==
X-Gm-Message-State: AOAM532DXFUd2KfJwVVjuIwGq1b4uFSCt5QOoL5hYxCsDamtKLkBm2WB
 k1xsGRDkOyloqe+U7aIRViUboA==
X-Google-Smtp-Source: ABdhPJwzz5WP5ik/Mqlg8iMzEBLCC8xcW3pFnCtDPE688vgLeODNIpFh29GX/iSQ2WF95HBV6M3h5Q==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr7198109wrv.102.1637854913938; 
 Thu, 25 Nov 2021 07:41:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm3845319wmq.32.2021.11.25.07.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7924E1FF9D;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Thu, 25 Nov 2021 15:41:43 +0000
Message-Id: <20211125154144.2904741-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Remove me as a reviewer for the Build and test automation and the
Integration Testing with the Avocado Framework and add Beraldo
Leal.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20211122191124.31620-1-willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211123205729.2205806-7-alex.bennee@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8f5156bfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .gitlab-ci.yml
@@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.30.2


