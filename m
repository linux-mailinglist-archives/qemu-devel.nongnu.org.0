Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762992D9B29
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:36:23 +0100 (CET)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koptd-0004sJ-Bc
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnz-0007pf-LW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnm-000658-Qf
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so14110312wml.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3huyqy8+fYU69WXa9m/cHIDpA578AI7lcvIx56XNmM=;
 b=mAkzLs9UgdBoP7RQNc66cLgZeHIiesJ1CyiaOdGMwCIu4wAnDOtRV9xD9XmZJ+j+Rz
 1uOG/ZgnMOMUJd8UDuUeXRdZXs4lhmekKW0QlPKFg8bmJEv9J78QhHcU1xyYPG2UNE7e
 5/O2/8bsSOsa4YK0hNafayu9IG6dMIj2tJ0yP9/Ru6bOpTd4sEZ3Ho4GVG3ULhtlAJpc
 jhwwgOmkueht0AuOe1eHbIq78iz/CjEsukIQ8dE9y8kb2gOcM4Ks2g7RwWIrJxHT7Ak4
 OvOquxQkyjVDnbQipjxFPwtGDmrZtN3JMvS1aY89kaO2wr24IracbCEGAqUKuvpXPTXg
 Mrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3huyqy8+fYU69WXa9m/cHIDpA578AI7lcvIx56XNmM=;
 b=b5ApZ+AGeTrDbfd2GrsDY/caNZZtCZA4z3TF58DJOZNIhEfdMlsJS1YrMdWw1D5bse
 UwtGoXFzHa+92/CHQvgNWv7sbcQ+w7x0/e6ZJRio7+XIzN4g/cXomRUXNs3RBHAxmfMi
 j4YJz+GmoSesbdql+DyJQNjqkmkie4BzUHAoxq7fjAaXZzoLde3r4bmTjLtbIiDPgDK8
 7QGg0N/9toOB41KK1hRLlv6YBq3HVGv3R/T7fCJoW+hyHkuFzKdxJtziRnkTUTmjaVpq
 Cgi34bEb5Zk6BdKKJRqqnybKvJ4/xpyWNoORig0gnkqg5KVIN2or3fg1RXv3k3rLk1G0
 FcEA==
X-Gm-Message-State: AOAM530EzwH+d1i65wF6Bist8bAwq5domSqoBjLtwQ9NGXG/TrP/yjEE
 JydknHXNyIOPDDD8QwR6NWIuZA==
X-Google-Smtp-Source: ABdhPJy/gX5sf4+E19Mf8KbplJeO2QvK1rK38ZXBESSosj0CismXNjxglrSz25kTKS4j8Dv02LcY1A==
X-Received: by 2002:a1c:b3c3:: with SMTP id c186mr9286236wmf.169.1607959815940; 
 Mon, 14 Dec 2020 07:30:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z22sm29482877wml.1.2020.12.14.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BFFEE1FF87;
 Mon, 14 Dec 2020 15:30:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/6] test/guest-debug: echo QEMU command as well
Date: Mon, 14 Dec 2020 15:30:07 +0000
Message-Id: <20201214153012.12723-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps with debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 71c5569054..0c4f5c3808 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -53,6 +53,7 @@ if __name__ == '__main__':
         cmd = "%s %s -g %s %s" % (args.qemu, args.qargs, socket_name,
                                   args.binary)
 
+    print("QEMU CMD: %s" % (cmd))
     inferior = subprocess.Popen(shlex.split(cmd))
 
     # Now launch gdb with our test and collect the result
-- 
2.20.1


