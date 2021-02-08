Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88B313F58
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:43:55 +0100 (CET)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CRs-0001oO-KO
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96s4-0004E1-BK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96ro-00073P-L3
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uhvvdTSUQUanKk+3tC2Iv10zy7/SZ0MLhsS7OrR6w0=;
 b=iigffP2CUEp3pZozfW13bulZkFnpy0q2xSsEVSrAcJ14hTpJSLJ3z3iLtW49jSqZP37zOZ
 mvlU86ZR1+5YqZnNhkBZZDRr1AAbMRyXRVrfI6BYb4czxc9EHDAbkfQ7MnYAUACQ1T88aS
 7QryGdPv02TKaPy1il1LBfVhlO53FO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-gL1st8C2Pe6cBx65o_qFOQ-1; Mon, 08 Feb 2021 08:46:12 -0500
X-MC-Unique: gL1st8C2Pe6cBx65o_qFOQ-1
Received: by mail-wm1-f69.google.com with SMTP id u15so449174wmm.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/uhvvdTSUQUanKk+3tC2Iv10zy7/SZ0MLhsS7OrR6w0=;
 b=gwIy/1Cr9kWyqr8OGnwRKM5+s+x/A0t6+7jOT26YUoUayO0LJ1sELjlM/MQij6EVbY
 UbtWEP+aCcl4GppE7IaiZWZrlmSWaIDV186ITF4Zz4hOyH1Xn+EvwTqCmAIKL+Jxifz6
 r+SBhsyuxSng8RPqUH3Cx9Z+bbkUV1bsZSg82ICMQWbj6CbIOc1IeZBOVjMAF8rvBwnL
 LgKxAiKS7Dz3iyw1k8r4nEiciBNnbVyJ8072pf35bDZtuRwJgrNbVY7GqezvYEiiktcj
 SBr8elmcLesfMdjf7QiCStJOoJjs+8tRU84I8tmkmOp289Y+BODQLPzmTKoKdcG3lbQD
 8ibg==
X-Gm-Message-State: AOAM532wGzi3cMgvUSXHflvK1Ea0oWb0heW0rG01/Ergenj4Ng2Ow5n6
 uIFLsoz0EzyZqjJMpKaLkB/dbVhkUyfuQx34d6GZkOov7Ydb7atY1xELrYeTKpU1RJHCwC1LX7c
 2MsbJXJifC697sGJuXS2ROx5AUGRWhi5upd+rq4fijZulMnmmBEA8GacS4m1M3V/G
X-Received: by 2002:a05:600c:4c11:: with SMTP id
 d17mr2665923wmp.86.1612791536609; 
 Mon, 08 Feb 2021 05:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJtoxxRNnaX3EsGkbz+enbj41Dhb9d4oQAbUBT4VIYPLlvBBhM/waH+2JlVeWfbdfVTpoIEw==
X-Received: by 2002:a05:600c:4c11:: with SMTP id
 d17mr2665330wmp.86.1612791524520; 
 Mon, 08 Feb 2021 05:38:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b138sm20363007wmb.35.2021.02.08.05.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] Acceptance tests: clarify ssh connection failure reason
Date: Mon,  8 Feb 2021 14:37:10 +0100
Message-Id: <20210208133711.2596075-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

If the connection to the ssh server fails, it may indeed be a "sshd"
issue, but it may also not be that.  Let's state what we know: the
establishment of the connection from the client side was not possible.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210203172357.1422425-13-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/linux_ssh_mips_malta.py | 2 +-
 tests/acceptance/virtiofs_submounts.py   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 25c5c5f7411..6dbd02d49d5 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -91,7 +91,7 @@ def ssh_connect(self, username, password):
             except:
                 time.sleep(4)
                 pass
-        self.fail("sshd timeout")
+        self.fail("ssh connection timeout")
 
     def ssh_disconnect_vm(self):
         self.ssh_session.quit()
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 28b2920b88c..949ca87a837 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -106,7 +106,7 @@ def ssh_connect(self, username, keyfile):
             except:
                 time.sleep(4)
                 pass
-        self.fail('sshd timeout')
+        self.fail('ssh connection timeout')
 
     def ssh_command(self, command):
         self.ssh_logger.info(command)
-- 
2.26.2


