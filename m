Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2421670A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 09:10:26 +0200 (CEST)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshkH-00061n-91
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 03:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshiy-0004Fa-GD
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:09:04 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshiw-00042q-An
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:09:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s10so43922621wrw.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qixSpKSHjOkHks026Zc/v8eSQoIoi5iJ+5J0KAQW+wU=;
 b=iFZaKWSp972Lz/X10ZTm7kdbn6L+KSALeLcK5TEXFmI+KXHOpJ/KZFWcnOzwQ375eI
 mkxnOjwbkBN+U+cDn8wNslwj51xtwGM0+TPTX8Mj67k6YaPzbZUu7PXjWnTm8MZAiRwG
 ipqOx3H7xD4l2//WtWodSYwPuAeS7uzODTD6F2dEMr+QuXy3L3IHA4PPKJf2s+7fBOgH
 87EIvtToJKn1esxvbtPOt3+3FCNQi6QLH5lwXoLCP4yCEbqOM8N1IhWyOe4frgnnouti
 jEw4oJ9VVrsV6LLtg2XDBVbS70dbeQ8o/sHto+EFXeLVjNSXG510EI8vHt6vDdS+4Y3P
 LH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qixSpKSHjOkHks026Zc/v8eSQoIoi5iJ+5J0KAQW+wU=;
 b=Ve1ghbCk1sVISoWJ7z0naIsXiDRLfnds8hZIOUqttAD+1TDk5AiGHTMT40MVeIfmFD
 LTWw2kbp6ioXi3BvensOlzUsTcQbJ8o+Gy8fTZXvGn9PIE5zn/cLk2OdTFDsRGvsLSll
 qIcg6Q5xBnyjx6acWXEhAcNukWucyKpdjyyxemjl6vsg+AymA1cNwkig9DG8qR85xBeh
 gGH2FeoKqyT6creZmnZEOSJZOG5scudu4hBc8p2JMJQE1FRM0yfp95oIwJHm+De+yT2Q
 E/r1j70Ii0RaU4WI96uglJUWRkIVCUEKuJkcBR3JehrqQ4Uoz1qwYCORl2OEyIoBB1+o
 zbbg==
X-Gm-Message-State: AOAM531rsgvj2SyI4mqtwcjs8Puv3fggiw2PW1A9HjkT5bc5QGnpTdFg
 F8h5YaRj+7eZzqp+ieYtXBMnXQ==
X-Google-Smtp-Source: ABdhPJxwH/7VmJFJxBXY3vmr7/cr7Fk3pMAdEeEVwyHH7w129Lc/Z4JC3exonWSMg2fj6IcTQEK2fw==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr54155154wrt.191.1594105740565; 
 Tue, 07 Jul 2020 00:09:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n14sm27971011wro.81.2020.07.07.00.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:08:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 920D31FF87;
 Tue,  7 Jul 2020 08:08:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/41] crypto/linux_keyring: fix 'secret_keyring' configure test
Date: Tue,  7 Jul 2020 08:08:18 +0100
Message-Id: <20200707070858.6622-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200707070858.6622-1-alex.bennee@linaro.org>
References: <20200707070858.6622-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

The configure test for 'secret_keyring' incorrectly checked the
'have_keyring' variable.

Fixes: 54e7aac0562452e4fcab65ca5001d030eef2de15
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200618092636.71832-1-david.edmondson@oracle.com>
Message-Id: <20200701135652.1366-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 8a65240d4a8a..83e36c270cce 100755
--- a/configure
+++ b/configure
@@ -6461,7 +6461,7 @@ EOF
 fi
 if test "$secret_keyring" != "no"
 then
-    if test "$have_keyring" == "yes"
+    if test "$have_keyring" = "yes"
     then
 	secret_keyring=yes
     else
-- 
2.20.1


