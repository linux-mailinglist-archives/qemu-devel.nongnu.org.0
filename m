Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103EA2EFB5E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:52:31 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0cQ-0005fI-3D
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TI-0005YQ-Q1
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TH-0003CK-1M
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v14so8973694wml.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAFqFFMTBWJ96RD8DQESAD7h08RaCf54WY46ucZTa7A=;
 b=NR0X+IqvOZRGfwz1EYtYjHDJ8/fAeY0jtkQRFZ9I4iuMivbIvS/i8cxKfI3rSIMSh6
 CNMOyAE48aW4XT5dbECXjoGqEo+hSi/7NAg+Kpz6TrmyP0RQZ47GVUnIg13nElPkbwLW
 wbJtIvHWXfiCwpvkAHs2rv5eKjbYlURTwIlP7mWtamMDz4IUPXApObIoYMM8LaR5h35W
 S5aJ5RxdiGTu+GzYFIXm5UHWm4Npd2TXrmiEbkALr1iGeCQHUQxV3QEx2C5OCij7b3pf
 t674xiq2rGhlHfdssrlp2U7WFInvuyyNUtsjcaEtx/X4pYPjhVEe+Kk5nkdMmtPo7lry
 zHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAFqFFMTBWJ96RD8DQESAD7h08RaCf54WY46ucZTa7A=;
 b=o3HXZol+Qo94cXPD38pw2N+OJFs7ebD8cp+A5tnomnlhtc6sapSKLKqp1U8+KqWtGv
 aKkRIDAl7DPAccE/TMuaKkRQPu3oncwrJNVaTmPD2nOifNiWMMhs8v5ENTs8wq87qoqe
 jk3LhRROrXJOQaVZsqMGJWKaOp9QEVQG28VbY7duJEHlsqZp1J/nD6sYChQ67xnExNE6
 bEAieB4E4DUPT9GK9K2kJ0bscxZHJwOHbyblFCqp7qgNkqnedKGAV/xYROvoWFP5r4kP
 qpd73fSVwgEA72lQGNBd6tYznZh5Oa70F2/hXXia3vpORBu0U10c3Xe9J1jYC/hhHXpf
 PaoA==
X-Gm-Message-State: AOAM530+lC801Ln2ueDT+ujg2RliqPUDRXxesjf10HYPKeA6l1n7adhF
 dznhxeUAoLH9lGC7lRYgZ/FcQQZpSOYgIA==
X-Google-Smtp-Source: ABdhPJwddYZtaxruFODn/1QnIHszNxkQsC8h9vthaDAlb/eCRUl9XA/ccXX/fUjZXT6XVXXw34+pKw==
X-Received: by 2002:a1c:bd87:: with SMTP id n129mr4902920wmf.32.1610145781565; 
 Fri, 08 Jan 2021 14:43:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm16889792wrn.0.2021.01.08.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:42:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 184EB1FF8C;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/20] test/guest-debug: echo QEMU command as well
Date: Fri,  8 Jan 2021 22:42:38 +0000
Message-Id: <20210108224256.2321-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-Id: <20201214153012.12723-2-alex.bennee@linaro.org>
Message-Id: <20201218112707.28348-2-alex.bennee@linaro.org>
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


