Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4E6AA2C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:02:07 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnO1u-0006va-Mf
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33405)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hnO1b-0006Wj-OU
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hnO1a-00064X-Jj
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:01:47 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53421)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hnO1a-00063q-A9
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:01:46 -0400
Received: by mail-wm1-x343.google.com with SMTP id x15so18790542wmj.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mz7/qAWIZBgCxy/KQHnwd3kx6dvkYS2R0nAOMZwpcnc=;
 b=lO9SRqxtMYzubpB8KHB3tzm+dQIkcf3/WC7Aia5YfoZjHyWCBWQKdSIEHpFZ9u6/b7
 lleANc7jnXUSXe3e17lSHFEH7xkLSO8a0rdgAHQkdBCqCzebIeA3gMIuk5ZuGrAorkZt
 9PJ3iWIULeg3iJZ/VZbzhhOXFYR9HMGB9QWIxzOSY4QEXkSDGlf7HHLAujMTib3xr2V0
 CNwNRmntUJoieNUdMUBcNJnsYV1xWXUwSrzzXJLsv/Z6shza1kCCEzjmLyDd9UqpLS+9
 Z/IqUd+qHSEkR0cnpsrNb9IYN9EdtX/WSUzr7VeX+rNmYJxmlUOTKuZ/LyVO9N0hBy0H
 +v3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mz7/qAWIZBgCxy/KQHnwd3kx6dvkYS2R0nAOMZwpcnc=;
 b=TDdBAASEMqeWP7dAwM/V6sQVANDuV8h4sFRG3fsDoTfLerIWLhuF+f6eEv4majfz0b
 YT8DitcN25GL8NdsftoU4wtNbmdjJsT2Q1eu5Xf/C7Ui/1TEvBiWEP9lupjGeyU1MxO4
 GWO3JnJggISZB3wzop6u5Jys1iKcysiFrpsn14NEm9dvr1F3wvLsg8UkNrBV1RBU2Hr/
 oOQdzDJH/HIedCRL+SXx6QjsdYPh+cRAoR0UgkSI51PY9hTqqqQEDuwA0LMeI4OYLdyy
 1Eu8qSpjZfUf0+X1ueIADYWmVZCqOC1jAdt9fuyPIM30RjmuibNzIK61I9IZnzP/KvFU
 t+Iw==
X-Gm-Message-State: APjAAAXmuBRmEVnLLsj331/rlBUEUROGhEuA9jarj9RSrztSvke4y08T
 IqQO41Y90KIKyJEpRr2bCsSa9Q==
X-Google-Smtp-Source: APXvYqzKzCFo/FvuC1NLn+RQOY3+pKxdmEWKNhaivBU3mFAlWiBfXc7RsPC8Fki6/1H7FPNkvF926g==
X-Received: by 2002:a1c:968c:: with SMTP id y134mr30300379wmd.75.1563285704980; 
 Tue, 16 Jul 2019 07:01:44 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id 15sm14734964wmk.34.2019.07.16.07.01.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 07:01:44 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9DD31FF87;
 Tue, 16 Jul 2019 15:01:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 15:01:33 +0100
Message-Id: <20190716140133.8578-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [RFC PATCH for 4.1] linux-user: unparent CPU object
 before unref
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
Cc: 1836558@bugs.launchpad.net, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a CPU object is created it is parented during it's realize stage.
If we don't unparent before the "final" unref we will never finzalize
the object leading to a memory leak. For most setups you probably
won't notice but with anything that creates and destroys a lot of
threads this will add up. This goes especially for architectures which
allocate a lot of memory in their CPU structures.

Fixes: https://bugs.launchpad.net/qemu/+bug/1836558
Cc: 1836558@bugs.launchpad.net
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 39a37496fed..4c9313fd9d0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7183,6 +7183,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                           NULL, NULL, 0);
             }
             thread_cpu = NULL;
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             g_free(ts);
             rcu_unregister_thread();
-- 
2.20.1


