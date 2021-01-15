Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F42F7CE3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:41:41 +0100 (CET)
Received: from localhost ([::1]:56842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PMC-0007vm-NL
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozv-00051K-W5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozs-0002Hl-W5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id 6so1951564wri.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0DLaq5XO4L95+WalvO7hnVvFiqtWHgwlFOevcPsbzXs=;
 b=e6OBOMe5RiWkTgeeuZd+4ikTf71g5JG8sljKDtJhejRfq8K424gzngugp1kJOa61/f
 8Hecha+SOocYCrzQru4RjUmE8A2xPXToTYBZBMVzwFDeIrzYKvKmvA2CVEQVAEOdJh55
 v7EMWzZAG5lbhvA6sjV8t6n4z5B7w/r/eFpB3dbPJfH4XappFCFbQouSdPN3e5qlHON5
 lmn/8vgSAFywmUbkS5NRBaGBHIpkK1zEFcnPGtffpnLiKe5xO+gHU1mGc5oZcrKTf96+
 sDxwLb/dfKEAOrN+s3OJwI6PK4cdUzgIBCzhg2fOYiEJ7h0azCbVVX8PYJOkLYu0UUjA
 7Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DLaq5XO4L95+WalvO7hnVvFiqtWHgwlFOevcPsbzXs=;
 b=G7x2G2cJ/gs2wLhE+gsHQITiOX8oOIXsbwcb3LEEQo6PX/Uc3XvWyrHXk7nKbROpGG
 CCdWgGqgsa08pk5FynslcDzg81Zlfv76L+g4p3cuWHWhjt8tfwi6VlCIElomjrpCk9dB
 SPHXkQVzggD+JzA7vWx2fM8ZezagOBvRRmL2LJOIhxbE7HXVgeUH1L2ybjM0/KLHsMfI
 G3XWTWTjm0QAAViMqsMS7ZDW1jRFZtIE/3uDaG7naasIirpOc20QH+p49KueYGyO7hPD
 LaNWsy5Oe5CuKCy6BxEQMRVGzBPbkV3Xp1jPvl6WHLWievR8VMg261G0jzSrD8c2HRjt
 M2/w==
X-Gm-Message-State: AOAM530KzrnVQNZV9zWwwjQ5i9MHdaGVhPxOv4/PYS23XNmOy9XmeCwO
 62ZWOD4yLwz1I5ZPDuhQGPqcXw==
X-Google-Smtp-Source: ABdhPJxOPVBjOdo37cjM6IXrA+lDS4VFv+2FkJ1/6EJrh2RNF2AFVEiDNz1hXsmIczAA5xre42bGcg==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr13142545wrw.137.1610716714848; 
 Fri, 15 Jan 2021 05:18:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm13069710wme.14.2021.01.15.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 595EE1FF9C;
 Fri, 15 Jan 2021 13:08:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/30] test/guest-debug: echo QEMU command as well
Date: Fri, 15 Jan 2021 13:08:11 +0000
Message-Id: <20210115130828.23968-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps with debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210108224256.2321-3-alex.bennee@linaro.org>

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


