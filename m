Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E03BDA1B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:24:54 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mwP-0001B5-FS
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfO-0005Yf-Ql
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfL-0007Fq-If
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l5so9712099wrv.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=XY/WQuKsFNQcZHYMfzje3q7DeLZyFSNZtDd0YXinlaNv+kKwQJBSuZCGSc7NVFquHP
 DWZuw5nNfeH+XrvaIkoShB4ylWNdqBAowEVIGRlD/Laqy2VoKzJt14wETQ16O2bqmbI7
 kBb9NvJpoh05FpeQ39O1aYSrqUxBteRmj7Nl3WDhoXi8U/e33TIMspnfmYDG8bp5jNKZ
 H1N3VpWISZ5fHalnb4F6vCk9gnHQbxh2jkLFjrW/u8+21oSiilNsOZQwik/5ATWKmcB8
 soVVVST7oTaOO04ADmqqJUZzW5Q6DhiEkqVdQLRCpUERUutOp4jPH2iRh8Kp/2GSTX5K
 uUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=oAfYadtuBIYszLxZSeBh+MexvVn3xodSlTrLdVFQF89otEHMbbjacZNVw3f9hSWRku
 XQiZ5o0uiu9zM4jZzT8wsMm2ZaqQU0gDkZCR77hJj57Rj4hRDFgcGAOn4btwZtZnn5uP
 H8rxkfDK3D5mrc4i8hLX/gWgT1vVRexgkDY9Ksl/LMCSzHKClfdHvZDeKTWDDpMRfKvn
 EtotwEp8VwxDjnNcq7EFYwj6HEYvpRvcO3gzhF6/SQtsbHEDUx9ERkd7V2qAI6zniNYs
 mXfbKiR71sK6u6IwafwKNEvoBfXq5pBLwxEXEJDwbop5mPeu01ccuFtafku8k4gUc52K
 6eng==
X-Gm-Message-State: AOAM532l1OW1ifWL7mXj5okqO17tCKUGeiAlc8P7LF7Zt3nx0vvbdlaJ
 CIT4n5K6OMdmnfP1lre7Hxrtrw==
X-Google-Smtp-Source: ABdhPJxSW7/WnGuyJ2ixczRkDual0GXNcD13Tmpx+nxFT1Q23YMZECWBnwKau2k9r5U+hkYQS09tvw==
X-Received: by 2002:adf:ba43:: with SMTP id t3mr17193812wrg.184.1625584034186; 
 Tue, 06 Jul 2021 08:07:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y8sm16932969wrr.76.2021.07.06.08.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4681FF9E;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 16/39] tests/docker: fix mistakes in fedora package list
Date: Tue,  6 Jul 2021 15:57:54 +0100
Message-Id: <20210706145817.24109-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

libblockdev-mpath-devel is not used by QEMU, rather it wants
device-mapper-multipath-devel.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-9-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 4a0a84eb43..f667f03cc5 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -28,7 +28,6 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
-    libblockdev-mpath-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
-- 
2.20.1


