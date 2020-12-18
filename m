Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D742DE1F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:29:10 +0100 (CET)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDwb-00006U-NH
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDul-0006ng-AT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:15 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuh-00034O-Vx
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id r7so1762305wrc.5
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUNDzMEHp2bJw/cEZs6exTqnUgdBKWbnqrvMaXEkx3E=;
 b=M4F3jxwkEVjMYO9zGjRX9M5O5jU5FVCkM9iKPgSQtkHeHNEYNPMmc9UOUCSvpw9uUA
 5u2i2UjQ62X02AIBdGMwvH3Zli80XyRF7TBN21y9PialZ19uHT4b5cNOmEnEqMcmEmCO
 vxrvKV6iOtQdW+D/lLKhiaACA9B1Tv7PA9uNMma4isX1LYP71+MAx/I/RWYq0aB/P7x5
 3HKfAP0rKmO1No0Hqa2ATU5a+oP1S6gycAsmeI/O+HBGa3EWi56GDJ7KfaUClMiIVc1K
 iG94GW5kEZhjlajkU6EFKgdm29tb5T5TW6bFKyrwPBWtsWorFgvrHi8CH6KMKCfxFH/0
 E0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUNDzMEHp2bJw/cEZs6exTqnUgdBKWbnqrvMaXEkx3E=;
 b=hT78XwqJOqZ+SAOLdLpMo77As4N6dM6yiFMpPCric77qNH74L54Z+VB8gagk+R58Y/
 MSOHbbeDdnOdX+QRPqQM5Zude44+gL+T61YEa76Tyoknh+lHTLnDFOeNSnrVQ71FpMlJ
 rWK1NW7m9UwJD/OolNvihISMb5pAheFlEdWF7ljGxz8/OVO5iaQ8qBcT5+k/Zu5VkA/Q
 js2XGARGk+uxeyCbpL0nOuDInAcr2yBIkN4mtk8DH6r4JOIFhEuvFNVqUXdoyOC+UW8d
 VANam6iy6Z1EmEbFQr/fcMxswG3TK2ACaKW35Md/HAbLEBspjN0bgeDgPwPWQCJrlTvH
 usqg==
X-Gm-Message-State: AOAM533vtW5/fqUMUi9xxA7UmE5INdGjh+cRG13iF1Yv6i2NfNg9PICu
 WVOw1X6Pb4BAPBRnBA0hQJkTSy9byO+wQw==
X-Google-Smtp-Source: ABdhPJxNx4S9JOnaDiT7iuPQgRxn6dH/bJmOKWgQyjefu/QpRYSuSZhYZWI/cYW1X0mR1W3i2AgAWQ==
X-Received: by 2002:adf:db44:: with SMTP id f4mr3847147wrj.169.1608290830704; 
 Fri, 18 Dec 2020 03:27:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm14052819wrv.67.2020.12.18.03.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9D831FF87;
 Fri, 18 Dec 2020 11:27:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 1/9] test/guest-debug: echo QEMU command as well
Date: Fri, 18 Dec 2020 11:26:59 +0000
Message-Id: <20201218112707.28348-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps with debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201214153012.12723-2-alex.bennee@linaro.org>
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


