Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D073C1A06
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:43:27 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zvi-0007aY-3b
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWT-0002GZ-Ga
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWR-0007VE-Jk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d12so8259204wre.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=AKB++8ZXWiApJ/Fe57boKxsx9OdnLHPakEeXsRrycOLLJTKFnLR/ZJFcTFr7SpfUpD
 WyNJlyVgIspkLQeZ5Go4JnuMUH3Wglw5/Jjmnwee5EJQAf8VbLQkpWOfbAsfTZ8CX9U6
 UzLPZ2eZZ2wBJ9fwaYBlz/1X4Zl/vldUZ6EKnRkzb3fFW/fOVDwqncrStSczTtmZSheO
 0k0iqBdzfjVLdA8A7Zp4C2/JuKZ22zxHhTcnzL5hQVoGWL0QHqFY0hCLwkBanEt0s8Op
 ArJ7Z5R3l0UfN3gZZAQW3qYElwPVbIowgGgdtUktzP0cFm36HlxJ0fWiS4DRM0BQMlMj
 uW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=dON4jdxT6W8apUYtE6iVK2qOjmaA8C0v2n02fe0xrrNvwzmTv/PblwBtUbuOJ5mIHE
 2/O+NRD2wO1R0iLe/xbScigGr+bI1vmNUaBeK5k3rguJIxZXSB23lBxoHFv+4TD6oIXY
 d7FFMpHF1IiZmfFQ5dbmZBesoZ8VAkJ+1/evvNRo3YS8LNCcCu4Ll5aenEv7kaDPOUXx
 HFVO131dHBnAt+GM1TBtDymFhOs+31sdWfxQoe3RRI1Anme5ZEQg0Ct1iXL++99kcJr6
 7wARDWpHw9GtVwo2ePeFVdLDZgGVhmra65nWK99GncDY/2GKanSeVIRzh7u33Slrv+xv
 EAoQ==
X-Gm-Message-State: AOAM531Waa3yoqqXS8oDus77a6T13g/ipbDw1YSKYb1FADDPEOX3W/5K
 Fv/muAQY+AHRoA+q0SvvLk/OmA==
X-Google-Smtp-Source: ABdhPJzEGXRqXXaDQWlGljTkfFFQfwc7OOC7lXrHKV1vVQ0BQ2DFNhbS+eQc6d6Igb9doAIDzIgvYQ==
X-Received: by 2002:adf:ec44:: with SMTP id w4mr37556214wrn.200.1625771838202; 
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y23sm2891856wmi.28.2021.07.08.12.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6D991FF9E;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 16/39] tests/docker: fix mistakes in fedora package list
Date: Thu,  8 Jul 2021 20:09:18 +0100
Message-Id: <20210708190941.16980-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
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
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
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


