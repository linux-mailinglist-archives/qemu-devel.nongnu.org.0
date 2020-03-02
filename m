Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84682176269
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:22:27 +0100 (CET)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8phy-0007ZQ-Je
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pf6-0002Ru-7H
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8peq-00019L-5S
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:18 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8pep-000186-VN
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:12 -0500
Received: by mail-wr1-x441.google.com with SMTP id t11so983751wrw.5
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdbZ47hNzKLw0EPtQH9zB6TA7y2oR0qju7k+HVi8YmE=;
 b=HTS2En3BClaOjl0qyUX3FzTmiJv1twnlQsSQoYet53CbFej6ANeF7DSWwye9fA++68
 vhnRylg89DiKI1WPvud+9sJfsGnRI/Hol38r/Wm83XSiZxUZmowl2ZnLobPGKnUMpHi9
 RvunD5f/0ipK0okOLXxh+NV2arnPmgWTLTd4pdP0DiW40JdEINtCycObNECXUZF1UdxM
 y2Z5SvQUvyOqw/e8AI5n0LldcBW3Ue7/bBR72ld+JhSGeh4AgBWa0zsMXfWHOx9igBvX
 WBcLlEZcJCKYUznVrV8DkTSDKNwOVXZnwjc9RGmlPfq4BhN0jyu7cAMBPXsxWZDSbZZn
 vqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdbZ47hNzKLw0EPtQH9zB6TA7y2oR0qju7k+HVi8YmE=;
 b=VT+CyDak9i9zHVYxjkMchPjA9bGNB9S/r49eDlG4dOwK8dTafxEAVON3vwgaOppvKt
 DSBpvt+cnBSbzV00C31/22lJ3EFuQ5KzNoLIy+ryqtTBeEE1PkGYWiGO1on4HEDtzxtd
 z6RAY0nBvS0kEkUeY1m/a4DgLQe7mGch8dkB7em/4KEAniiOvV2Fl6gixNxlFr63aLQp
 paYsjIi2i1jjm/ur9tmbnndAFCSCAhnchrLZuKiH0jpSfqxZfOMdQM1DXNrYk4VF3/nl
 XSKwedmD+Gb7eL5URS8A9StzqU8eflqV/StVQxcUXj0XpQCdKnuBkk5s5FaYkIAkU1qA
 +eVg==
X-Gm-Message-State: ANhLgQ1gRxTQI+rVbKncjzGId7H7R4z53NS8ifmc1Bf8MbGsEU6zRL/7
 M+xe/bismJbwgOBqK3LO24gP3Q==
X-Google-Smtp-Source: ADFU+vvc7Iz7IWkdwpYqKdWa4epBHt1VwVU+QwO+GmyD66s6jltfDi/2aKzBlKgh0PpVPOJGcTcGqg==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr726068wrv.291.1583173150931;
 Mon, 02 Mar 2020 10:19:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a70sm298858wme.28.2020.03.02.10.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:19:09 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8FAB1FF8F;
 Mon,  2 Mar 2020 18:19:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/10] tests/vm: Debug mode shows ssh output.
Date: Mon,  2 Mar 2020 18:18:59 +0000
Message-Id: <20200302181907.32110-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302181907.32110-1-alex.bennee@linaro.org>
References: <20200302181907.32110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Fam Zheng <fam@euphon.net>, Peter Puhov <peter.puhov@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

Add changes to tests/vm/basevm.py so that during debug mode we show ssh output.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200219163537.22098-3-robert.foley@linaro.org>
---
 tests/vm/basevm.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4dee6647e6e..c99725b8c0d 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -120,11 +120,16 @@ class BaseVM(object):
         return fname
 
     def _ssh_do(self, user, cmd, check):
-        ssh_cmd = ["ssh", "-q", "-t",
+        ssh_cmd = ["ssh",
+                   "-t",
                    "-o", "StrictHostKeyChecking=no",
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o", "ConnectTimeout=1",
                    "-p", self.ssh_port, "-i", self._ssh_key_file]
+        # If not in debug mode, set ssh to quiet mode to
+        # avoid printing the results of commands.
+        if not self.debug:
+            ssh_cmd.append("-q")
         for var in self.envvars:
             ssh_cmd += ['-o', "SendEnv=%s" % var ]
         assert not isinstance(cmd, str)
-- 
2.20.1


